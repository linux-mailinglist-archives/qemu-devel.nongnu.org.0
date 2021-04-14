Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9827335FC53
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 22:09:34 +0200 (CEST)
Received: from localhost ([::1]:46594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWlpN-0001nF-Ei
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 16:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lWllk-0007TY-AY; Wed, 14 Apr 2021 16:05:49 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45372
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lWllc-0005cE-OM; Wed, 14 Apr 2021 16:05:45 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13EK3r1r054908; Wed, 14 Apr 2021 16:05:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=sOUO/9KpSo+IjRSsAVgFOhiwYP2zZ4+Zt2p4Wwcxf5E=;
 b=oTZa7+3lZVlA4QO5biYDqurgTqek/guwpO/2eTs0ZrFhsgHnwGLvNf9Cr0WCpr28r2iV
 EqIP2CKUkd/Qx26i/89wdVsPKzXU8gSrppyuJf3lT5LI0M9ThNWTKevZz2es1o/FOwy8
 EXCITAT27NUtBiX/gQ/UhpdaaHp8sKAUP5pLjk5lzc9qtev24wCDDRAiTxQSDEGP2SrZ
 NqAejrn7qxXIjiYfXD+YXO7BSrPMzff7iwfxjYLUhOvtpk119cUlaNNQzlozVZpO/bzH
 fmFCMwlv4xn65JwgtTTQ5pJvc7AVFG8wa/k0kV3x9RA2v0ckSQDPWokF1ZUvcC2jSFl5 cw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37x2hfyqtb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 16:05:29 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13EK4o0B057684;
 Wed, 14 Apr 2021 16:05:29 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37x2hfyqt1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 16:05:29 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13EJvu7S020149;
 Wed, 14 Apr 2021 20:05:28 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01dal.us.ibm.com with ESMTP id 37u3n9vrc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 20:05:28 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13EK5RlO18350506
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Apr 2021 20:05:27 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C988BE056;
 Wed, 14 Apr 2021 20:05:27 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8994BBE05D;
 Wed, 14 Apr 2021 20:05:26 +0000 (GMT)
Received: from localhost (unknown [9.211.99.113])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 14 Apr 2021 20:05:26 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: RE: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
In-Reply-To: <CP2PR80MB4499299F2C3FA96E4942BCDFC74E9@CP2PR80MB4499.lamprd80.prod.outlook.com>
References: <CP2PR80MB449996D26DEA4C27397EEF14C74F9@CP2PR80MB4499.lamprd80.prod.outlook.com>
 <87o8eh50ge.fsf@linux.ibm.com>
 <CP2PR80MB4499299F2C3FA96E4942BCDFC74E9@CP2PR80MB4499.lamprd80.prod.outlook.com>
Date: Wed, 14 Apr 2021 17:05:24 -0300
Message-ID: <87sg3s3a4b.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TAIIbEx7THdf1FOhmIMz3OpAt1_5Ns1E
X-Proofpoint-ORIG-GUID: OMj4TG6Net-uejAqvtiTaD92RxdOd_Gk
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-14_12:2021-04-14,
 2021-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104140128
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Andre Fernando da Silva <andre.silva@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bruno Piazera Larsen <bruno.larsen@eldorado.org.br> writes:

>> > * move gen_write_xer and gen_read_xer into cpu_init.c, as they're
>> > used for some sprs, and whatever needs to be moved with it
>>
>> I'd leave them where they are currently. Instead what I think we should
>> do is to find a way to not need the uea/oea/hea|read/write callbacks
>> with KVM.
>
> so we'd also move all callbacks to translate.c, right? RN, gen_write_xer
> is only used in spr_read_xer, which is defined in cpu_init.c

Yeah, move them away from the common file into a tcg-only file.

>
> From a quick glance, this would be almost 3k lines, so bigger patches
> are incoming (side note: I tried to use that git config to show that I on=
ly
> changed file names and deal better with code motion, but it doesn't
> appear to have worked, is the wiki correct about this?)
>
>> Maybe extract a function from _spr_register that sets what is common for
>> both tcg and kvm (num, name, initial_value, AFAICT). Then alter the
>> gen_spr* functions to first create all registers and then call both
>> configs to supplement:
>>
>> //tcg.c
>> static void tcg_gen_spr_generic(CPUPPCState *env)
>> {
>>     // these only set the callbacks
>>     spr_register(env, SPR_FOO,
>>                  SPR_NOACCESS, SPR_NOACCESS,
>>                  &spr_read_foo, &spr_write_foo);
>>     spr_register(env, SPR_BAR,
>>                  SPR_NOACCESS, SPR_NOACCESS,
>>                  &spr_read_bar, &spr_write_bar);
>> }
>>
>> //kvm.c
>> static void kvm_gen_spr_generic(CPUPPCState *env)
>> {
>>     // these only set one_reg_id
>>     spr_register_kvm(env, SPR_FOO, KVM_REG_PPC_FOO);
>>     spr_register_kvm(env, SPR_BAR, KVM_REG_PPC_BAR);
>> }
>
> by default, KVM already doesn't use the callbacks? Or would we have to
> also change where these registers are accessed? If the first one is right
> this looks easy enough.

KVM does not use the callbacks.

>> //common.c
>> static void gen_spr_generic(CPUPPCState *env)
>> {
>>     // these only set name, num, initial value
>>     spr_register(env, SPR_FOO, "FOO", 0xf00);
>>     spr_register(env, SPR_BAR, "BAR", 0xb4d);
>>     ...
>>
>>     // have these stubbed if not chosen via config
>>     tcg_gen_spr_generic(env);
>>     kvm_gen_spr_generic(env);
>> }
>>
>> init_ppc_proc()
>> {
>>         ...
>>         gen_spr_generic(env);
>>         ...
>> }
>
> I'm guessing we'd need to do this to all gen_spr_* functions, this is just
> an example, right?

Yeah, so that's one of the downsides of this change I proposed.

>> Can anyone see a better way? That would be much easier if we could
>> afford to say that TCG and KVM are mutually exclusive for a given build,
>> but I don't think they are.
>
> Instead of stubbing, we could also create macros that turn the function c=
all
> into a nop if the config was disabled, and add "if kvm_enabled()" and
> "if tcg_enabled()" if needed. I don't see how TCG and KVM being mutually
> exclusive makes this easier, unless it has to do with where they are
> accessed (idk yet where that is).

If they were mutually exclusive we could solve most problems by having
the same signature for a function and compiling one or the other
depending on the config.

That would mean we would be able to move the whole gen_spr_* functions
to the accel-specific files. So:

//tcg.c
static void gen_spr_generic(CPUPPCState *env)
{
    spr_register(env, SPR_FOO, "FOO", 0xf00, &read_foo, &write_foo);
    spr_register(env, SPR_BAR, "BAR", 0xb4d, &read_bar, &write_bar);
}

//kvm.c
static void gen_spr_generic(CPUPPCState *env)
{
    spr_register(env, SPR_FOO, "FOO", 0xf00, KVM_REG_FOO);
    spr_register(env, SPR_BAR, "BAR", 0xb4d, KVM_REG_BAR);
}

//common.c
init_ppc_proc()
{
        ...
        gen_spr_generic(env);
        ...
}

But we can't do this because we want to have a QEMU binary that supports
both accel types in certain scenarios.

>
> Another option is the solution I prototyped in [PATCH 2/4] in arch_dump.c,
> having ifdef encapsulating kvm and tcg calls, and if/else blocks. I'm also
> open to suggestions on how to do it better (:
>
>> > * Figure out what needs to be added to the includes for both
>> > files to compile
>> > * move opcodes and invalid_handler into cpu_init.c, because they
>> > are only used by stuff in this file.
>> >
>> > I'm just not sure about this last point. The stuff that use opcodes
>> > create the callback tables for TCG, AFAICT. The better plan would
>> > be to move all of that to tanslate.c, but might be a lot.
>>
>> translate.c seems like a better place indeed.
>
> ok. But is it worth doing for the first cut?

I think it is. I don't see the issue. Aside from the opcodes destructor
you'll just move a chunk of code over. We do want cpu_init.c to be the
common file, right? So it cannot have TCG-only code in it. Better do it
now while we're (mostly) just moving code around.

>
> Also, looking now, I see definition for exception vectors and some
> exception handling code in it, which I'm not 100% sure what to do
> with.

These are tricky because there's some logic for system emulation that is
used by kvm, spapr, etc. So we'll need to do more invasive
changes. Let's tackle the easy things first.

> It's starting to seem like should actually make this translate_init.c.inc
> into a mini series of its own, if we're going to make this the best way
> from the start.
>
>
> Bruno Piazera Larsen
>
> Instituto de Pesquisas ELDORADO<http://clickemailmkt.eldorado.org.br/ls/c=
lick?upn=3DUPoxpeIcHnAcbUZyo7TTaswyiVb1TXP3jEbQqiiJKKGsxOn8hBEs5ZsMLQfXkKuK=
XZ7MVDg0ij9eG8HV4TXI75dBzDiNGLxQ8Xx5PzCVNt6TpGrzBbU-2Biu0o69X5ce-2FW-2FOk1u=
UipuK0fZnWXJEgbRw-3D-3DJY4T_wWk-2BG6VvNBoa1YzxYjhCdFS9IfANIaBzDSklR1NyyrKOI=
1wj0P-2BdBFcuO4FnHcsA1MyHu0ly1Yt3oDMp7KKdJPM68iKuI2jiRH5v4B0d8wf3chU3qy5n5i=
XWnW1QjSaNFHOgELzxaP-2FnesTeBgJ5dFkjH4f279sVQpOtyjw5xAqj34M6pgNRAxVvuXif4IW=
DcVzXg1FzfYlEfkKzr9vvpA3Hg8kitwMtlU3zwbQUBCgL30fQoJPcRPMGKyOY8RmoAlXNqTJYDY=
IvqmfnI7KLUvw6vKB5R-2B5q1FJRAzX7H-2BmF0NnDET6jMLuIqtCcVIch>
>
> Departamento Computa=C3=A7=C3=A3o Embarcada
>
> Analista de Software Trainee
>
> Aviso Legal - Disclaimer<https://www.eldorado.org.br/disclaimer.html>

