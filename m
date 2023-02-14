Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A43696853
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 16:42:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRxRn-0000Zn-M6; Tue, 14 Feb 2023 10:42:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+eea51c705e3923a17c65+7114+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pRxRd-0000XN-1t
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:42:17 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+eea51c705e3923a17c65+7114+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pRxRb-00089c-9K
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:42:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=aJgs+uVj4OHbG1zyvAwt85UZSUBCDScb/it4jYOMNG8=; b=O2ilGzCegl1tUEX7py8RNFmznT
 biog7NflwRBvacaQDyuqAPwUXHmk/q3qzFUCUFF5ccehLvEm6BWTBhTD9KwSxPeZjYEAGLKiNc/WK
 3pCZdljnDrm0/KoSJW4ie3oGXKOEqJgwaB8cfMyVxwPXgcY24HATfi4m1GMSQGAY5sDZfRuYpudoM
 ANntrNpp8xybb24uyP8MGKsAkYDTpADVmowjAA7HF+V80WhHqig+EiyhDwkYXMoMOELnKKrtxNQHF
 v2CuG0EzzVIMACZw2nqSbo5oEOFavhnUKF2kLqLFdrjJRZbp5WxHd+OqowlGV5hfcZGREHFjmHZnD
 DewcW+UA==;
Received: from [213.205.241.95] (helo=[127.0.0.1])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pRxQm-009fr4-1E; Tue, 14 Feb 2023 15:42:03 +0000
Date: Tue, 14 Feb 2023 16:41:59 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: paul@xen.org, Paul Durrant <xadimgnik@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
CC: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>, 
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?ISO-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: Re: [PATCH v10 44/59] hw/xen: Support mapping grant frames
User-Agent: K-9 Mail for Android
In-Reply-To: <447a0a49-5079-249c-33db-e5e7765e8fd1@xen.org>
References: <20230201143148.1744093-1-dwmw2@infradead.org>
 <20230201143148.1744093-45-dwmw2@infradead.org>
 <28fc143f-2de8-b893-0abf-210b4c34a7f7@xen.org>
 <4B49CF3E-A825-4017-B7DF-2339F7D6B92E@infradead.org>
 <447a0a49-5079-249c-33db-e5e7765e8fd1@xen.org>
Message-ID: <625C897E-8808-40AC-88BA-EF5E4E03D766@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+eea51c705e3923a17c65+7114+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 14 February 2023 16:40:11 CET, Paul Durrant <xadimgnik@gmail=2Ecom> wro=
te:
>On 14/02/2023 15:35, David Woodhouse wrote:
>>=20
>>=20
>> On 13 February 2023 16:31:57 CET, Paul Durrant <xadimgnik@gmail=2Ecom> =
wrote:
>>> On 01/02/2023 14:31, David Woodhouse wrote:
>>>> From: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>>>>=20
>>>> Signed-off-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>>>> ---
>>>>    hw/i386/kvm/xen_gnttab=2Ec  | 74 +++++++++++++++++++++++++++++++++=
+++++-
>>>>    hw/i386/kvm/xen_overlay=2Ec |  2 +-
>>>>    hw/i386/kvm/xen_overlay=2Eh |  2 ++
>>>>    3 files changed, 76 insertions(+), 2 deletions(-)
>>>>=20
>>>> diff --git a/hw/i386/kvm/xen_gnttab=2Ec b/hw/i386/kvm/xen_gnttab=2Ec
>>>> index ef8857e50c=2E=2Ecd8c3ae60d 100644
>>>> --- a/hw/i386/kvm/xen_gnttab=2Ec
>>>> +++ b/hw/i386/kvm/xen_gnttab=2Ec
>>>> @@ -37,13 +37,27 @@ OBJECT_DECLARE_SIMPLE_TYPE(XenGnttabState, XEN_GN=
TTAB)
>>>>    #define XEN_PAGE_SHIFT 12
>>>>    #define XEN_PAGE_SIZE (1ULL << XEN_PAGE_SHIFT)
>>>>    +#define ENTRIES_PER_FRAME_V1 (XEN_PAGE_SIZE / sizeof(grant_entry_=
v1_t))
>>>> +#define ENTRIES_PER_FRAME_V2 (XEN_PAGE_SIZE / sizeof(grant_entry_v2_=
t))
>>>> +
>>>>    struct XenGnttabState {
>>>>        /*< private >*/
>>>>        SysBusDevice busdev;
>>>>        /*< public >*/
>>>>    +    QemuMutex gnt_lock;
>>>> +
>>>>        uint32_t nr_frames;
>>>>        uint32_t max_frames;
>>>> +
>>>> +    union {
>>>> +        grant_entry_v1_t *v1;
>>>> +        grant_entry_v2_t *v2;
>>>> +    } entries;
>>>> +
>>>=20
>>> If you want to have v2 support, don't you need status frames too?
>>=20
>> If/when we add v2 support we will need that, but not yet=2E Seemed harm=
less enough to have the union with the right types from day one though=2E
>
>For someone reading this code, they might expect support to be there=2E I=
t also makes things a little more cumbersome=2E TBH I really can't see the =
need to ever support v2 so my preference would just be to avoid mention of =
it and pretend it was all a bad dream=2E

Works for me=2E I'll rip it out=2E

