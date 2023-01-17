Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 091F866DA68
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 11:00:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHikq-0008Hf-1p; Tue, 17 Jan 2023 04:59:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+d80603fb936c028ea1fe+7086+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pHiki-0008HQ-KE
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 04:59:38 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+d80603fb936c028ea1fe+7086+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pHike-0001K2-VX
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 04:59:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=lcRPZT6dR+qy8i8SrZn6IWD0BpHE0cemNzMiBrgthRA=; b=j80CPTbUhF50V/3Hv5kvi12F/8
 ez605EolSYOiccTdRk7+cAOroBYC+bCnqTVY4ATN73MF45P01s1qtwsReXgYU352+duTb7oxvn9x7
 P9apedR4rzK97G2cR4W6O9ZkQD5W11UUEB5CAaLfsAToBOyjmUFe5VOtxjQldBVo4iB0MvnKInn1k
 pdlqutYFgBzqAEKrHaUrTuL9d0p0jAazNYM3WiXqTEbZ3CLs3GKLrotDcBt95TQkNriNZhHqE+Vzu
 P5QNJjjIPYG26D5uBXOm2FDhG3zRls7Vo2GrxC0rYXWLXSiaVtQ7js7Z+iDu8wqJrxP0Ytd8KqnCx
 C6WVKDgw==;
Received: from [172.31.31.189] (helo=[127.0.0.1])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pHikW-009ZWv-CR; Tue, 17 Jan 2023 09:59:24 +0000
Date: Tue, 17 Jan 2023 09:59:10 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: paul@xen.org, Paul Durrant <xadimgnik@gmail.com>, qemu-devel@nongnu.org
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
Subject: Re: [PATCH v7 23/51] i386/xen: implement HYPERVISOR_event_channel_op
User-Agent: K-9 Mail for Android
In-Reply-To: <768b351e-8e24-b0f1-9bc7-7467a671feae@xen.org>
References: <20230116215805.1123514-1-dwmw2@infradead.org>
 <20230116215805.1123514-24-dwmw2@infradead.org>
 <768b351e-8e24-b0f1-9bc7-7467a671feae@xen.org>
Message-ID: <04ED6A31-B9D8-4EBD-A9A8-BDD1A9B9FD57@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+d80603fb936c028ea1fe+7086+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
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



On 17 January 2023 09:53:00 GMT, Paul Durrant <xadimgnik@gmail=2Ecom> wrot=
e:
>On 16/01/2023 21:57, David Woodhouse wrote:
>> From: Joao Martins <joao=2Em=2Emartins@oracle=2Ecom>
>>=20
>> Additionally set XEN_INTERFACE_VERSION to most recent in order to
>> exercise the "new" event_channel_op=2E
>>=20
>> Signed-off-by: Joao Martins <joao=2Em=2Emartins@oracle=2Ecom>
>> [dwmw2: Ditch event_channel_op_compat which was never available to HVM =
guests]
>> Signed-off-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>> ---
>>   target/i386/kvm/xen-emu=2Ec | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>
>Reviewed-by: Paul Durrant <paul@xen=2Eorg>
>
>=2E=2E=2E with one observation=2E=2E=2E
>
>>=20
>> diff --git a/target/i386/kvm/xen-emu=2Ec b/target/i386/kvm/xen-emu=2Ec
>> index b0ff03dbeb=2E=2E686e5dfd38 100644
>> --- a/target/i386/kvm/xen-emu=2Ec
>> +++ b/target/i386/kvm/xen-emu=2Ec
>> @@ -27,6 +27,7 @@
>>   #include "standard-headers/xen/memory=2Eh"
>>   #include "standard-headers/xen/hvm/hvm_op=2Eh"
>>   #include "standard-headers/xen/vcpu=2Eh"
>> +#include "standard-headers/xen/event_channel=2Eh"
>>     #include "xen-compat=2Eh"
>>   @@ -585,6 +586,27 @@ static bool kvm_xen_hcall_vcpu_op(struct kvm_xen=
_exit *exit, X86CPU *cpu,
>>       return true;
>>   }
>>   +static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit,
>> +                                    int cmd, uint64_t arg)
>> +{
>> +    int err =3D -ENOSYS;
>> +
>> +    switch (cmd) {
>> +    case EVTCHNOP_init_control:
>> +	case EVTCHNOP_expand_array:
>> +	case EVTCHNOP_set_priority:
>
>Indentation looks wrong here=2E

Oops=2E=2E Cut and paste from code which uses tabs=2E :)

I think that comment about XEN_INTERFACE_VERSION may want to change too; d=
idn't I shift that elsewhere so it didn't have to move around in the header=
 cleanups that come later?

Will fix, ta=2E


