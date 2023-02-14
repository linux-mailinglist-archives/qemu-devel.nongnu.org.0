Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4067F696839
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 16:37:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRxMv-000650-7a; Tue, 14 Feb 2023 10:37:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+eea51c705e3923a17c65+7114+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pRxMr-00063I-84
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:37:17 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+eea51c705e3923a17c65+7114+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pRxMp-0006PN-Kd
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:37:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=VY3zlrXd1/MIyZEnAUdyyDgsUeaaGI/tReH6nEx4jlw=; b=Asu7QBMWnxyfF+qy7jrW2BQ4Kl
 MJPRLAfbgsO9UQ+gJ7ed4LADRdCnMiqJmGoKuJaInof1lBmV1dFKUhqshb5tavjb494SuUqeRiO2o
 KtdS+ftci4/LRoCpe5upfcQR2hymgUV8rcCKHQZZonp5NpeYvuVe3widqM9hRr47iaBzBEAet8pte
 RZIuJsSqmuqArapRIDdDvbs6+3Eb69nzIBpoNfecqjto4mMsQ1KFDeY2bEmW/PN/AoONTICx2oBp3
 bp9n90Mw5b8KpPPqurgacEUapss+g6iXwr2BBX2jXTE7KE4U8zoPJ8GobzPOOn7WuZns+tmTJ4vEA
 Db0aQAhQ==;
Received: from [213.205.241.95] (helo=[127.0.0.1])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pRxM5-009fnv-0D; Tue, 14 Feb 2023 15:37:11 +0000
Date: Tue, 14 Feb 2023 16:37:07 +0100
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
Subject: Re: [PATCH v10 47/59] i386/xen: handle PV timer hypercalls
User-Agent: K-9 Mail for Android
In-Reply-To: <602bab6c-22c2-532c-0f94-48d1df6b1a19@xen.org>
References: <20230201143148.1744093-1-dwmw2@infradead.org>
 <20230201143148.1744093-48-dwmw2@infradead.org>
 <602bab6c-22c2-532c-0f94-48d1df6b1a19@xen.org>
Message-ID: <1B17019C-1C4F-4A0C-8B91-9FFB07EE7457@infradead.org>
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



On 14 February 2023 11:10:05 CET, Paul Durrant <xadimgnik@gmail=2Ecom> wro=
te:
>On 01/02/2023 14:31, David Woodhouse wrote:
>> From: Joao Martins <joao=2Em=2Emartins@oracle=2Ecom>
>>=20
>> Introduce support for one shot and periodic mode of Xen PV timers,
>> whereby timer interrupts come through a special virq event channel
>> with deadlines being set through:
>>=20
>> 1) set_timer_op hypercall (only oneshot)
>> 2) vcpu_op hypercall for {set,stop}_{singleshot,periodic}_timer
>> hypercalls
>>=20
>> Signed-off-by: Joao Martins <joao=2Em=2Emartins@oracle=2Ecom>
>> Signed-off-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>> ---
>>   hw/i386/kvm/xen_evtchn=2Ec  |  31 +++++
>>   hw/i386/kvm/xen_evtchn=2Eh  |   2 +
>>   target/i386/cpu=2Eh         |   5 +
>>   target/i386/kvm/xen-emu=2Ec | 245 +++++++++++++++++++++++++++++++++++=
++-
>>   target/i386/machine=2Ec     |   1 +
>>   5 files changed, 282 insertions(+), 2 deletions(-)
>>=20
>[snip]
>> @@ -1246,6 +1466,9 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, s=
truct kvm_xen_exit *exit)
>>       }
>>         switch (code) {
>> +    case __HYPERVISOR_set_timer_op:
>> +        return kvm_xen_hcall_set_timer_op(exit, cpu,
>> +                                          exit->u=2Ehcall=2Eparams[0])=
;
>
>There's a nasty little semantic subtlety here which has been missed=2E=2E=
=2E If the guest is not in longmode then the timer value is actually split =
across param[0] and param[1] (so that it is still 64-bits)=2E

Ooh, good catch=2E Will fix that (perhaps tomorrow depending on what they =
say when they look at the x-rays they just took of my knee :/ )

Thanks=2E


