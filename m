Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 740732A2738
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 10:42:12 +0100 (CET)
Received: from localhost ([::1]:35646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZWLr-0001eZ-0E
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 04:42:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kZWL4-0001EM-4j
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 04:41:22 -0500
Received: from mail.ispras.ru ([83.149.199.84]:58828)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kZWKy-0003sr-QC
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 04:41:21 -0500
Received: from [192.168.0.183] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 1774740ABE48;
 Mon,  2 Nov 2020 09:41:13 +0000 (UTC)
Subject: Re: [PATCH v2] target/s390x: fix execution with icount
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <160430921917.21500.1486722139653938240.stgit@pasha-ThinkPad-X280>
 <af2ae869-08fc-540f-2829-89bc3fa4f5ae@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <15e1e4ab-cbed-f641-2ad8-4823011bf40a@ispras.ru>
Date: Mon, 2 Nov 2020 12:41:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <af2ae869-08fc-540f-2829-89bc3fa4f5ae@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 04:25:18
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, cohuck@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.11.2020 12:34, David Hildenbrand wrote:
> On 02.11.20 10:26, Pavel Dovgalyuk wrote:
>> This patch adds some gen_io_start() calls to allow execution
>> of s390x targets in icount mode with -smp 1.
>> It enables deterministic timers and record/replay features.
> 
> Why do we have to set it for SIGP?

Timer-related instructions obviously needed IO.
But I'm not familiar with s390, therefore also added IO
for the instructions that lock iothread mutex, because they
probably can access some virtual hardware and change the timers.
But maybe this is not related to SIGP and it takes the mutex
for other reasons.

> 
>>
>> Signed-off-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
>>
>> ---
>>
>> v2:
>>   - added IF_IO flag to reuse icount code in translate_one()
>>     (suggested by Richard Henderson)
>> ---
>>   target/s390x/insn-data.def |   70 
>> ++++++++++++++++++++++----------------------
>>   target/s390x/translate.c   |   15 +++++++++
>>   2 files changed, 50 insertions(+), 35 deletions(-)
>>
>> diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
>> index d3bcdfd67b..b95bc98d35 100644
>> --- a/target/s390x/insn-data.def
>> +++ b/target/s390x/insn-data.def
>> @@ -379,7 +379,7 @@
>>   /* EXTRACT CPU ATTRIBUTE */
>>       C(0xeb4c, ECAG,    RSY_a, GIE, 0, a2, r1, 0, ecag, 0)
>>   /* EXTRACT CPU TIME */
>> -    C(0xc801, ECTG,    SSF,   ECT, 0, 0, 0, 0, ectg, 0)
>> +    F(0xc801, ECTG,    SSF,   ECT, 0, 0, 0, 0, ectg, 0, IF_IO)
>>   /* EXTRACT FPC */
>>       F(0xb38c, EFPC,    RRE,   Z,   0, 0, new, r1_32, efpc, 0, IF_BFP)
>>   /* EXTRACT PSW */
>> @@ -855,10 +855,10 @@
>>       C(0xe32f, STRVG,   RXY_a, Z,   la2, r1_o, new, m1_64, rev64, 0)
>>   /* STORE CLOCK */
>> -    C(0xb205, STCK,    S,     Z,   la2, 0, new, m1_64, stck, 0)
>> -    C(0xb27c, STCKF,   S,     SCF, la2, 0, new, m1_64, stck, 0)
>> +    F(0xb205, STCK,    S,     Z,   la2, 0, new, m1_64, stck, 0, IF_IO)
>> +    F(0xb27c, STCKF,   S,     SCF, la2, 0, new, m1_64, stck, 0, IF_IO)
>>   /* STORE CLOCK EXTENDED */
>> -    C(0xb278, STCKE,   S,     Z,   0, a2, 0, 0, stcke, 0)
>> +    F(0xb278, STCKE,   S,     Z,   0, a2, 0, 0, stcke, 0, IF_IO)
>>   /* STORE FACILITY LIST EXTENDED */
>>       C(0xb2b0, STFLE,   S,  SFLE,   0, a2, 0, 0, stfle, 0)
>> @@ -1269,7 +1269,7 @@
>>       E(0xb250, CSP,     RRE,   Z,   r1_32u, ra2, r1_P, 0, csp, 0, 
>> MO_TEUL, IF_PRIV)
>>       E(0xb98a, CSPG,    RRE, DAT_ENH, r1_o, ra2, r1_P, 0, csp, 0, 
>> MO_TEQ, IF_PRIV)
>>   /* DIAGNOSE (KVM hypercall) */
>> -    F(0x8300, DIAG,    RSI,   Z,   0, 0, 0, 0, diag, 0, IF_PRIV)
>> +    F(0x8300, DIAG,    RSI,   Z,   0, 0, 0, 0, diag, 0, IF_PRIV | IF_IO)
>>   /* INSERT STORAGE KEY EXTENDED */
>>       F(0xb229, ISKE,    RRE,   Z,   0, r2_o, new, r1_8, iske, 0, 
>> IF_PRIV)
>>   /* INVALIDATE DAT TABLE ENTRY */
>> @@ -1301,17 +1301,17 @@
>>   /* RESET REFERENCE BIT EXTENDED */
>>       F(0xb22a, RRBE,    RRE,   Z,   0, r2_o, 0, 0, rrbe, 0, IF_PRIV)
>>   /* SERVICE CALL LOGICAL PROCESSOR (PV hypercall) */
>> -    F(0xb220, SERVC,   RRE,   Z,   r1_o, r2_o, 0, 0, servc, 0, IF_PRIV)
>> +    F(0xb220, SERVC,   RRE,   Z,   r1_o, r2_o, 0, 0, servc, 0, 
>> IF_PRIV | IF_IO)
>>   /* SET ADDRESS SPACE CONTROL FAST */
>>       F(0xb279, SACF,    S,     Z,   0, a2, 0, 0, sacf, 0, IF_PRIV)
>>   /* SET CLOCK */
>> -    F(0xb204, SCK,     S,     Z,   la2, 0, 0, 0, sck, 0, IF_PRIV)
>> +    F(0xb204, SCK,     S,     Z,   la2, 0, 0, 0, sck, 0, IF_PRIV | 
>> IF_IO)
>>   /* SET CLOCK COMPARATOR */
>> -    F(0xb206, SCKC,    S,     Z,   0, m2_64a, 0, 0, sckc, 0, IF_PRIV)
>> +    F(0xb206, SCKC,    S,     Z,   0, m2_64a, 0, 0, sckc, 0, IF_PRIV 
>> | IF_IO)
>>   /* SET CLOCK PROGRAMMABLE FIELD */
>>       F(0x0107, SCKPF,   E,     Z,   0, 0, 0, 0, sckpf, 0, IF_PRIV)
>>   /* SET CPU TIMER */
>> -    F(0xb208, SPT,     S,     Z,   0, m2_64a, 0, 0, spt, 0, IF_PRIV)
>> +    F(0xb208, SPT,     S,     Z,   0, m2_64a, 0, 0, spt, 0, IF_PRIV | 
>> IF_IO)
>>   /* SET PREFIX */
>>       F(0xb210, SPX,     S,     Z,   0, m2_32ua, 0, 0, spx, 0, IF_PRIV)
>>   /* SET PSW KEY FROM ADDRESS */
>> @@ -1321,7 +1321,7 @@
>>   /* SET SYSTEM MASK */
>>       F(0x8000, SSM,     S,     Z,   0, m2_8u, 0, 0, ssm, 0, IF_PRIV)
>>   /* SIGNAL PROCESSOR */
>> -    F(0xae00, SIGP,    RS_a,  Z,   0, a2, 0, 0, sigp, 0, IF_PRIV)
>> +    F(0xae00, SIGP,    RS_a,  Z,   0, a2, 0, 0, sigp, 0, IF_PRIV | 
>> IF_IO)
>>   /* STORE CLOCK COMPARATOR */
>>       F(0xb207, STCKC,   S,     Z,   la2, 0, new, m1_64a, stckc, 0, 
>> IF_PRIV)
>>   /* STORE CONTROL */
>> @@ -1332,7 +1332,7 @@
>>   /* STORE CPU ID */
>>       F(0xb202, STIDP,   S,     Z,   la2, 0, new, m1_64a, stidp, 0, 
>> IF_PRIV)
>>   /* STORE CPU TIMER */
>> -    F(0xb209, STPT,    S,     Z,   la2, 0, new, m1_64a, stpt, 0, 
>> IF_PRIV)
>> +    F(0xb209, STPT,    S,     Z,   la2, 0, new, m1_64a, stpt, 0, 
>> IF_PRIV | IF_IO)
>>   /* STORE FACILITY LIST */
>>       F(0xb2b1, STFL,    S,     Z,   0, 0, 0, 0, stfl, 0, IF_PRIV)
>>   /* STORE PREFIX */
>> @@ -1352,35 +1352,35 @@
>>       C(0xe501, TPROT,   SSE,   Z,   la1, a2, 0, 0, tprot, 0)
>>   /* CCW I/O Instructions */
>> -    F(0xb276, XSCH,    S,     Z,   0, 0, 0, 0, xsch, 0, IF_PRIV)
>> -    F(0xb230, CSCH,    S,     Z,   0, 0, 0, 0, csch, 0, IF_PRIV)
>> -    F(0xb231, HSCH,    S,     Z,   0, 0, 0, 0, hsch, 0, IF_PRIV)
>> -    F(0xb232, MSCH,    S,     Z,   0, insn, 0, 0, msch, 0, IF_PRIV)
>> -    F(0xb23b, RCHP,    S,     Z,   0, 0, 0, 0, rchp, 0, IF_PRIV)
>> -    F(0xb238, RSCH,    S,     Z,   0, 0, 0, 0, rsch, 0, IF_PRIV)
>> -    F(0xb237, SAL,     S,     Z,   0, 0, 0, 0, sal, 0, IF_PRIV)
>> -    F(0xb23c, SCHM,    S,     Z,   0, insn, 0, 0, schm, 0, IF_PRIV)
>> -    F(0xb274, SIGA,    S,     Z,   0, 0, 0, 0, siga, 0, IF_PRIV)
>> -    F(0xb23a, STCPS,   S,     Z,   0, 0, 0, 0, stcps, 0, IF_PRIV)
>> -    F(0xb233, SSCH,    S,     Z,   0, insn, 0, 0, ssch, 0, IF_PRIV)
>> -    F(0xb239, STCRW,   S,     Z,   0, insn, 0, 0, stcrw, 0, IF_PRIV)
>> -    F(0xb234, STSCH,   S,     Z,   0, insn, 0, 0, stsch, 0, IF_PRIV)
>> -    F(0xb236, TPI ,    S,     Z,   la2, 0, 0, 0, tpi, 0, IF_PRIV)
>> -    F(0xb235, TSCH,    S,     Z,   0, insn, 0, 0, tsch, 0, IF_PRIV)
>> +    F(0xb276, XSCH,    S,     Z,   0, 0, 0, 0, xsch, 0, IF_PRIV | IF_IO)
>> +    F(0xb230, CSCH,    S,     Z,   0, 0, 0, 0, csch, 0, IF_PRIV | IF_IO)
>> +    F(0xb231, HSCH,    S,     Z,   0, 0, 0, 0, hsch, 0, IF_PRIV | IF_IO)
>> +    F(0xb232, MSCH,    S,     Z,   0, insn, 0, 0, msch, 0, IF_PRIV | 
>> IF_IO)
>> +    F(0xb23b, RCHP,    S,     Z,   0, 0, 0, 0, rchp, 0, IF_PRIV | IF_IO)
>> +    F(0xb238, RSCH,    S,     Z,   0, 0, 0, 0, rsch, 0, IF_PRIV | IF_IO)
>> +    F(0xb237, SAL,     S,     Z,   0, 0, 0, 0, sal, 0, IF_PRIV | IF_IO)
>> +    F(0xb23c, SCHM,    S,     Z,   0, insn, 0, 0, schm, 0, IF_PRIV | 
>> IF_IO)
>> +    F(0xb274, SIGA,    S,     Z,   0, 0, 0, 0, siga, 0, IF_PRIV | IF_IO)
>> +    F(0xb23a, STCPS,   S,     Z,   0, 0, 0, 0, stcps, 0, IF_PRIV | 
>> IF_IO)
>> +    F(0xb233, SSCH,    S,     Z,   0, insn, 0, 0, ssch, 0, IF_PRIV | 
>> IF_IO)
>> +    F(0xb239, STCRW,   S,     Z,   0, insn, 0, 0, stcrw, 0, IF_PRIV | 
>> IF_IO)
>> +    F(0xb234, STSCH,   S,     Z,   0, insn, 0, 0, stsch, 0, IF_PRIV | 
>> IF_IO)
>> +    F(0xb236, TPI ,    S,     Z,   la2, 0, 0, 0, tpi, 0, IF_PRIV | 
>> IF_IO)
>> +    F(0xb235, TSCH,    S,     Z,   0, insn, 0, 0, tsch, 0, IF_PRIV | 
>> IF_IO)
>>       /* ??? Not listed in PoO ninth edition, but there's a linux 
>> driver that
>>          uses it: "A CHSC subchannel is usually present on LPAR 
>> only."  */
>> -    F(0xb25f, CHSC,  RRE,     Z,   0, insn, 0, 0, chsc, 0, IF_PRIV)
>> +    F(0xb25f, CHSC,  RRE,     Z,   0, insn, 0, 0, chsc, 0, IF_PRIV | 
>> IF_IO)
>>   /* zPCI Instructions */
>>       /* None of these instructions are documented in the PoP, so this 
>> is all
>>          based upon target/s390x/kvm.c and Linux code and likely 
>> incomplete */
>> -    F(0xebd0, PCISTB, RSY_a, PCI, la2, 0, 0, 0, pcistb, 0, IF_PRIV)
>> -    F(0xebd1, SIC, RSY_a, AIS, r1, r3, 0, 0, sic, 0, IF_PRIV)
>> -    F(0xb9a0, CLP, RRF_c, PCI, 0, 0, 0, 0, clp, 0, IF_PRIV)
>> -    F(0xb9d0, PCISTG, RRE, PCI, 0, 0, 0, 0, pcistg, 0, IF_PRIV)
>> -    F(0xb9d2, PCILG, RRE, PCI, 0, 0, 0, 0, pcilg, 0, IF_PRIV)
>> -    F(0xb9d3, RPCIT, RRE, PCI, 0, 0, 0, 0, rpcit, 0, IF_PRIV)
>> -    F(0xe3d0, MPCIFC, RXY_a, PCI, la2, 0, 0, 0, mpcifc, 0, IF_PRIV)
>> -    F(0xe3d4, STPCIFC, RXY_a, PCI, la2, 0, 0, 0, stpcifc, 0, IF_PRIV)
>> +    F(0xebd0, PCISTB, RSY_a, PCI, la2, 0, 0, 0, pcistb, 0, IF_PRIV | 
>> IF_IO)
>> +    F(0xebd1, SIC, RSY_a, AIS, r1, r3, 0, 0, sic, 0, IF_PRIV | IF_IO)
>> +    F(0xb9a0, CLP, RRF_c, PCI, 0, 0, 0, 0, clp, 0, IF_PRIV | IF_IO)
>> +    F(0xb9d0, PCISTG, RRE, PCI, 0, 0, 0, 0, pcistg, 0, IF_PRIV | IF_IO)
>> +    F(0xb9d2, PCILG, RRE, PCI, 0, 0, 0, 0, pcilg, 0, IF_PRIV | IF_IO)
>> +    F(0xb9d3, RPCIT, RRE, PCI, 0, 0, 0, 0, rpcit, 0, IF_PRIV | IF_IO)
>> +    F(0xe3d0, MPCIFC, RXY_a, PCI, la2, 0, 0, 0, mpcifc, 0, IF_PRIV | 
>> IF_IO)
>> +    F(0xe3d4, STPCIFC, RXY_a, PCI, la2, 0, 0, 0, stpcifc, 0, IF_PRIV 
>> | IF_IO)
>>   #endif /* CONFIG_USER_ONLY */
>> diff --git a/target/s390x/translate.c b/target/s390x/translate.c
>> index ac10f42f10..7a8ff1f2de 100644
>> --- a/target/s390x/translate.c
>> +++ b/target/s390x/translate.c
>> @@ -1214,6 +1214,7 @@ typedef struct {
>>   #define IF_DFP      0x0010      /* decimal floating point 
>> instruction */
>>   #define IF_PRIV     0x0020      /* privileged instruction */
>>   #define IF_VEC      0x0040      /* vector instruction */
>> +#define IF_IO       0x0080      /* input/output instruction */
>>   struct DisasInsn {
>>       unsigned opc:16;
>> @@ -6369,6 +6370,7 @@ static DisasJumpType translate_one(CPUS390XState 
>> *env, DisasContext *s)
>>       const DisasInsn *insn;
>>       DisasJumpType ret = DISAS_NEXT;
>>       DisasOps o = {};
>> +    bool icount = false;
>>       /* Search for the insn in the table.  */
>>       insn = extract_insn(env, s);
>> @@ -6435,6 +6437,14 @@ static DisasJumpType 
>> translate_one(CPUS390XState *env, DisasContext *s)
>>                   return DISAS_NORETURN;
>>               }
>>           }
>> +
>> +        /* input/output is the special case for icount mode */
>> +        if (insn->flags & IF_IO) {
> 
> I guess this is an unlikely().

ok

> 
>> +            icount = tb_cflags(s->base.tb) & CF_USE_ICOUNT;
>> +            if (icount) {
>> +                gen_io_start();
>> +            }
>> +        }
>>       }
>>       /* Check for insn specification exceptions.  */
>> @@ -6488,6 +6498,11 @@ static DisasJumpType 
>> translate_one(CPUS390XState *env, DisasContext *s)
>>           tcg_temp_free_i64(o.addr1);
>>       }
>> +    /* io should be the last instruction in tb when icount is enabled */
>> +    if (icount && ret == DISAS_NEXT) {
>> +        ret = DISAS_PC_STALE;
>> +    }
>> +
> 
> dito.
> 
>>   #ifndef CONFIG_USER_ONLY
>>       if (s->base.tb->flags & FLAG_MASK_PER) {
>>           /* An exception might be triggered, save PSW if not already 
>> done.  */
>>
> 
> In general, looks sane to me.
> 


