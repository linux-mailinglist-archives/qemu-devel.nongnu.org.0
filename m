Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE6969687F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 16:50:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRxZZ-000755-Gr; Tue, 14 Feb 2023 10:50:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+eea51c705e3923a17c65+7114+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pRxZX-00074x-PR
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:50:23 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+eea51c705e3923a17c65+7114+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pRxZV-0003rJ-99
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:50:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=Pfba5L2M3Iq2ylyel7cac3F4Qe7HfPapHIptHHm9S74=; b=oMcfeShOHG9aWhSMMwH/7Zu5Pa
 Z8P6oxoD7UCUkvWTx3cNzuLPikyfMC1t+Vf4tPJLF1jTE3pWGDGBtUyB401hsNrZCI55iXRoD0McZ
 rWb6LKXY4BHDe8bnypQWDh26ac0vJsjI6dqkCJXgrTMkTdt4NMS5aHQGpYoDtl4ddlr2fm8Z04Ah8
 TPE8VPF5guWftSrNDb2S2yZ2FsfzWFh8YgvdAGT3J0iCGtktIy5A4vmZB3DBZHYgt6rcZh5ZO+Dh3
 q53fYZnJpNNIDwooGj8KWwZMH8JPT8Bwp8dPNnItUbOJNobpvVrtWARbTqQUtS/N/yOGp4yMi2X9s
 FJha3VNw==;
Received: from [213.205.241.95] (helo=[127.0.0.1])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pRxYf-009fyy-2i; Tue, 14 Feb 2023 15:50:12 +0000
Date: Tue, 14 Feb 2023 16:50:08 +0100
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
Subject: Re: [PATCH v10 49/59] i386/xen: handle HVMOP_get_param
User-Agent: K-9 Mail for Android
In-Reply-To: <5cf88926-c53b-7c08-972d-9a8d822cfd2e@xen.org>
References: <20230201143148.1744093-1-dwmw2@infradead.org>
 <20230201143148.1744093-50-dwmw2@infradead.org>
 <5cf88926-c53b-7c08-972d-9a8d822cfd2e@xen.org>
Message-ID: <0BF8A9D2-C82F-4B6D-A831-CB87C29A8F5A@infradead.org>
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



On 14 February 2023 16:47:13 CET, Paul Durrant <xadimgnik@gmail=2Ecom> wro=
te:
>On 01/02/2023 14:31, David Woodhouse wrote:
>> From: Joao Martins <joao=2Em=2Emartins@oracle=2Ecom>
>>=20
>> Which is used to fetch xenstore PFN and port to be used
>> by the guest=2E This is preallocated by the toolstack when
>> guest will just read those and use it straight away=2E
>>=20
>> Signed-off-by: Joao Martins <joao=2Em=2Emartins@oracle=2Ecom>
>> Signed-off-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>> ---
>>   target/i386/kvm/xen-emu=2Ec | 39 ++++++++++++++++++++++++++++++++++++=
+++
>>   1 file changed, 39 insertions(+)
>>=20
>> diff --git a/target/i386/kvm/xen-emu=2Ec b/target/i386/kvm/xen-emu=2Ec
>> index 75e62bc02f=2E=2E3d6ea7ca98 100644
>> --- a/target/i386/kvm/xen-emu=2Ec
>> +++ b/target/i386/kvm/xen-emu=2Ec
>> @@ -762,6 +762,42 @@ out:
>>       return true;
>>   }
>>   +static bool handle_get_param(struct kvm_xen_exit *exit, X86CPU *cpu,
>> +                             uint64_t arg)
>> +{
>> +    CPUState *cs =3D CPU(cpu);
>> +    struct xen_hvm_param hp;
>> +    int err =3D 0;
>> +
>> +    /* No need for 32/64 compat handling */
>> +    qemu_build_assert(sizeof(hp) =3D=3D 16);
>> +
>> +    if (kvm_copy_from_gva(cs, arg, &hp, sizeof(hp))) {
>> +        err =3D -EFAULT;
>> +        goto out;
>> +    }
>> +
>> +    if (hp=2Edomid !=3D DOMID_SELF && hp=2Edomid !=3D xen_domid) {
>> +        err =3D -ESRCH;
>> +        goto out;
>> +    }
>> +
>> +    switch (hp=2Eindex) {
>> +    case HVM_PARAM_STORE_PFN:
>> +        hp=2Evalue =3D XEN_SPECIAL_PFN(XENSTORE);
>
>Reviewed-by: Paul Durrant <paul@xen=2Eorg>
>
>=2E=2E=2E but this reminds me=2E=2E=2E I don't think you have code to see=
d the grant table in any of the patches=2E It is guest ABI that the XenStor=
e PFN is in entry 1 of the grant table=2E

It's in there somewhere, perhaps in "phase 2" where we actually add a real=
 XenStore rather than this sequence of 59 (and counting)=2E

I even made XenStore map the grant (not that it actually *uses* the addres=
s it gets back)=2E

