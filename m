Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFA269682A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 16:36:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRxK6-0002Ta-LH; Tue, 14 Feb 2023 10:34:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+eea51c705e3923a17c65+7114+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pRxK2-0002LS-Fk
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:34:22 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+eea51c705e3923a17c65+7114+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pRxJz-0005nx-GO
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:34:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=OpltE09wVk7YGqTZUXjywtMlHRUkMLlUHAx0MwH9u7I=; b=jQwPZdAQCo1Y0MC4HlWvGo2+BU
 q8wkCJjAA5xlAf3eWpTVzck194+Dz5k6dhAjrXSmmaXPRoBt1fgiBi33og67TqhORRUNFi2M8uvyJ
 QC0LnC+cMHMCxkAo6Sz6PolsNnWkTN5kl6zX5X875sWh78MvuMA+QWeKZ4S69JTvCPM2HtN0BXsZc
 3cKIXjAmzPxbsjX6lMN2dXwyAYG3FOxp2O2J1jFp8oz17QRAXOjXgL4B2yimdjXZ2t8AlB2GfwLIf
 ifbDY5l+VzgmxioQzv2zTw1/lZ+PkoPoWBB++BVHhMY61b0SzbFzzSELCTP5Q/YPNyLHbrgbfE9QY
 7BGrNoKg==;
Received: from [213.205.241.95] (helo=[127.0.0.1])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pRxJ3-009flP-2X; Tue, 14 Feb 2023 15:33:22 +0000
Date: Tue, 14 Feb 2023 16:33:57 +0100
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
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v10_45/59=5D_i386/xen=3A_Implement_HYPER?=
 =?US-ASCII?Q?VISOR=5Fgrant=5Ftable=5Fop_an?=
 =?US-ASCII?Q?d_GNTTABOP=5F=5Bgs=5Det=5Fverson?=
User-Agent: K-9 Mail for Android
In-Reply-To: <2782d0ab-99ea-b4bf-4608-90f4db90674e@xen.org>
References: <20230201143148.1744093-1-dwmw2@infradead.org>
 <20230201143148.1744093-46-dwmw2@infradead.org>
 <2782d0ab-99ea-b4bf-4608-90f4db90674e@xen.org>
Message-ID: <441D5526-8D05-4B5E-A1D9-609C8E68D8F1@infradead.org>
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



On 14 February 2023 10:59:12 CET, Paul Durrant <xadimgnik@gmail=2Ecom> wro=
te:
>On 01/02/2023 14:31, David Woodhouse wrote:
>> From: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>>=20
>> Signed-off-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>> ---
>>   hw/i386/kvm/xen_gnttab=2Ec  | 31 ++++++++++++++++++++
>>   hw/i386/kvm/xen_gnttab=2Eh  |  5 ++++
>>   target/i386/kvm/xen-emu=2Ec | 60 ++++++++++++++++++++++++++++++++++++=
+++
>>   3 files changed, 96 insertions(+)
>>=20
>> diff --git a/hw/i386/kvm/xen_gnttab=2Ec b/hw/i386/kvm/xen_gnttab=2Ec
>> index cd8c3ae60d=2E=2E9dfce91f6a 100644
>> --- a/hw/i386/kvm/xen_gnttab=2Ec
>> +++ b/hw/i386/kvm/xen_gnttab=2Ec
>> @@ -181,3 +181,34 @@ int xen_gnttab_map_page(uint64_t idx, uint64_t gfn=
)
>>       return 0;
>>   }
>>   +int xen_gnttab_set_version_op(struct gnttab_set_version *set)
>> +{
>> +    int ret;
>> +
>> +    switch (set->version) {
>> +    case 1:
>> +        ret =3D 0;
>> +        break;
>> +
>> +    case 2:
>> +        /* Behave as before set_version was introduced=2E */
>> +        ret =3D -ENOSYS;
>> +        break;
>> +
>> +    default:
>> +        ret =3D -EINVAL;
>> +    }
>> +
>> +    set->version =3D 1;
>
>Seems like an odd semantic=2E Only a version of 1 can result in a non-err=
or exit=2E I suspect no harm will come from setting it in the error case th=
ough so=2E=2E=2E

Yeah, this is behaviour I saw in an actual Xen code base when gnttab v2 wa=
s disabled=2E The logic (in the comment) seemed sane enough=2E


