Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FDA69682B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 16:36:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRxL6-0003hc-Tt; Tue, 14 Feb 2023 10:35:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+eea51c705e3923a17c65+7114+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pRxL4-0003UI-Kj
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:35:26 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+eea51c705e3923a17c65+7114+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pRxL1-00065O-F7
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:35:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=plpOCw+tDIDsb9ds9T1IbVei6nLK+0z3av02IULg64Y=; b=htJA0z80tp7xwQetnG/SEKOlbZ
 CW1FdQlWhgfarig4bLOiyUpNRXFIiBr2chMbrwPQfNE/d1nUHsQlo8zZGlrrHfeDP6kmFRUNJhExq
 wdWcrXpRYeIU7FPLkpm4Myr0LY3dSRaATdDe+om1SQxGLFErhy5LLeJY+9qza0GUCP83uU6GRm3lR
 xWbRKvYdR8ZWIUvkda+O2nB2chlGQvN99X+Q9+lTzfWnHRp0r5mNa5ucqDD51JEXofyav+YMhy2C/
 KOSzrLxDUm3Rvk21nnxd2IPM+0ZkuX46ZOZwvv14VBo6n6jFcJVPpzq8rqSyBS9/OwIIP2C/o84x2
 XB6edAiA==;
Received: from [213.205.241.95] (helo=[127.0.0.1])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pRxKB-009fmm-2z; Tue, 14 Feb 2023 15:34:35 +0000
Date: Tue, 14 Feb 2023 16:35:09 +0100
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
In-Reply-To: <28fc143f-2de8-b893-0abf-210b4c34a7f7@xen.org>
References: <20230201143148.1744093-1-dwmw2@infradead.org>
 <20230201143148.1744093-45-dwmw2@infradead.org>
 <28fc143f-2de8-b893-0abf-210b4c34a7f7@xen.org>
Message-ID: <4B49CF3E-A825-4017-B7DF-2339F7D6B92E@infradead.org>
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



On 13 February 2023 16:31:57 CET, Paul Durrant <xadimgnik@gmail=2Ecom> wro=
te:
>On 01/02/2023 14:31, David Woodhouse wrote:
>> From: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>>=20
>> Signed-off-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>> ---
>>   hw/i386/kvm/xen_gnttab=2Ec  | 74 ++++++++++++++++++++++++++++++++++++=
++-
>>   hw/i386/kvm/xen_overlay=2Ec |  2 +-
>>   hw/i386/kvm/xen_overlay=2Eh |  2 ++
>>   3 files changed, 76 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/hw/i386/kvm/xen_gnttab=2Ec b/hw/i386/kvm/xen_gnttab=2Ec
>> index ef8857e50c=2E=2Ecd8c3ae60d 100644
>> --- a/hw/i386/kvm/xen_gnttab=2Ec
>> +++ b/hw/i386/kvm/xen_gnttab=2Ec
>> @@ -37,13 +37,27 @@ OBJECT_DECLARE_SIMPLE_TYPE(XenGnttabState, XEN_GNTT=
AB)
>>   #define XEN_PAGE_SHIFT 12
>>   #define XEN_PAGE_SIZE (1ULL << XEN_PAGE_SHIFT)
>>   +#define ENTRIES_PER_FRAME_V1 (XEN_PAGE_SIZE / sizeof(grant_entry_v1_=
t))
>> +#define ENTRIES_PER_FRAME_V2 (XEN_PAGE_SIZE / sizeof(grant_entry_v2_t)=
)
>> +
>>   struct XenGnttabState {
>>       /*< private >*/
>>       SysBusDevice busdev;
>>       /*< public >*/
>>   +    QemuMutex gnt_lock;
>> +
>>       uint32_t nr_frames;
>>       uint32_t max_frames;
>> +
>> +    union {
>> +        grant_entry_v1_t *v1;
>> +        grant_entry_v2_t *v2;
>> +    } entries;
>> +
>
>If you want to have v2 support, don't you need status frames too?

If/when we add v2 support we will need that, but not yet=2E Seemed harmles=
s enough to have the union with the right types from day one though=2E

