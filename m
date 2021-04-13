Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4553735E874
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 23:41:55 +0200 (CEST)
Received: from localhost ([::1]:32928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWQnC-00064o-CW
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 17:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lWQkb-0004c7-Ov; Tue, 13 Apr 2021 17:39:13 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36542
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lWQkZ-0005RW-M3; Tue, 13 Apr 2021 17:39:13 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DLYI3n108080; Tue, 13 Apr 2021 17:39:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=w+8y27NR6g/mOp6hPYrtg/VxDJRttiLGd/KWvFA3fpY=;
 b=KZMyh5I6ErlVqJZtOehEfcG6PCRwZGI2bsnOkAVKIsJ1G6EvEoixso/6rQqT7bJPVyRB
 eD0wLhQ2lRhmue84LLpCrHJShrqMqiNc5Zap/xW6hGAldpK+IEgLL0GsWzgwAQaqDPnX
 PLp0HNFQWX5YTgpPC+IVCfnsQlZQt//6ST/64+/aNeA23m7RI2OqxbqKkHKSmrTPL/Ep
 Yeiv9rHbDJeIq0O6bIO7ZolSwDPo/RCqST1IW8hVFoM6WHw/XqtKQU8joA7XcYDMLGA7
 euEVIybbr7+XyEY2nlkup9l3iMidGjVSYXIUd3SPMXxi80ZPnbDy4FYymSm7/y+AVsJl UQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37w7sdm6nm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 17:39:02 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13DLcpxC124473;
 Tue, 13 Apr 2021 17:39:02 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37w7sdm6nc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 17:39:02 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DLXgLK014206;
 Tue, 13 Apr 2021 21:39:01 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 37u3n9c1rg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 21:39:01 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13DLd0Ei21496118
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 21:39:01 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0724C605A;
 Tue, 13 Apr 2021 21:39:00 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F8BCC605D;
 Tue, 13 Apr 2021 21:39:00 +0000 (GMT)
Received: from localhost (unknown [9.211.159.146])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 13 Apr 2021 21:38:59 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: RE: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
In-Reply-To: <CP2PR80MB449996D26DEA4C27397EEF14C74F9@CP2PR80MB4499.lamprd80.prod.outlook.com>
References: <CP2PR80MB449996D26DEA4C27397EEF14C74F9@CP2PR80MB4499.lamprd80.prod.outlook.com>
Date: Tue, 13 Apr 2021 18:38:57 -0300
Message-ID: <87o8eh50ge.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PeHo2Bc98NGmawN0nVFOnXbBk_CSPkYM
X-Proofpoint-GUID: kF1nf5xtcQ2MgFDwS3yUUJVwghUpzh6r
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_15:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 phishscore=0 impostorscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130142
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
 Andre Fernando da Silva <andre.silva@eldorado.org.br>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bruno Piazera Larsen <bruno.larsen@eldorado.org.br> writes:

>> I'm actually not sure if we'll want translate_init.c for !tcg builds.
>> It's *primarily* for TCG, but we still need at least some of the cpu
>> state structure for KVM, and some of that is initialized in
>> translate_init.
>>
>> I think it will probably make more sense to leave it in for a first
>> cut.  Later refinement might end up removing it.
>>
>> The whole #include translate_init.c.inc thing might make for some
>> awkward fiddling in this, of course.
>
> I just checked, there is going to be some shuffling of functions
> around, as there are some static variables defined on translate.c,
> and used in translate_init.c.inc, some functions needed for KVM
> on translate.c and some TCG only functions in the
> translate_init.c.inc.
>
> The trivial path is to:
> * rename translate_init.c.inc to cpu_init.c (since it has to do with
> initial definitions for CPUs, and it's not related to translating
> anymore);

Below I'm assuming we have one place for TCG stuff and other for KVM
stuff, whatever this particular discussion ends up producing.

> * move gen_write_xer and gen_read_xer into cpu_init.c, as they're
> used for some sprs, and whatever needs to be moved with it

I'd leave them where they are currently. Instead what I think we should
do is to find a way to not need the uea/oea/hea|read/write callbacks
with KVM.

Maybe extract a function from _spr_register that sets what is common for
both tcg and kvm (num, name, initial_value, AFAICT). Then alter the
gen_spr* functions to first create all registers and then call both
configs to supplement:

//tcg.c
static void tcg_gen_spr_generic(CPUPPCState *env)
{
    // these only set the callbacks        
    spr_register(env, SPR_FOO,
                 SPR_NOACCESS, SPR_NOACCESS,
                 &spr_read_foo, &spr_write_foo);
    spr_register(env, SPR_BAR,
                 SPR_NOACCESS, SPR_NOACCESS,
                 &spr_read_bar, &spr_write_bar);
}

//kvm.c
static void kvm_gen_spr_generic(CPUPPCState *env)
{
    // these only set one_reg_id
    spr_register_kvm(env, SPR_FOO, KVM_REG_PPC_FOO);
    spr_register_kvm(env, SPR_BAR, KVM_REG_PPC_BAR);
}

//common.c
static void gen_spr_generic(CPUPPCState *env)
{
    // these only set name, num, initial value
    spr_register(env, SPR_FOO, "FOO", 0xf00);
    spr_register(env, SPR_BAR, "BAR", 0xb4d);
    ...

    // have these stubbed if not chosen via config
    tcg_gen_spr_generic(env);
    kvm_gen_spr_generic(env);
}

init_ppc_proc()
{
        ...
        gen_spr_generic(env);
        ...
}

Can anyone see a better way? That would be much easier if we could
afford to say that TCG and KVM are mutually exclusive for a given build,
but I don't think they are.

> * move is_indirect_opcode and ind_table to translate.c, since they
> are used to translate ppc instructions, and the things defined for
> these functions

Makes sense. This and the other part below about callback tables would
be mostly about moving code so it's a candidate for coming soon.

> * Figure out what needs to be added to the includes for both
> files to compile
> * move opcodes and invalid_handler into cpu_init.c, because they
> are only used by stuff in this file.
>
> I'm just not sure about this last point. The stuff that use opcodes
> create the callback tables for TCG, AFAICT. The better plan would
> be to move all of that to tanslate.c, but might be a lot.

translate.c seems like a better place indeed.


