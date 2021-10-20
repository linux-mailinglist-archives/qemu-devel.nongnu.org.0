Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BA54354CD
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 22:52:10 +0200 (CEST)
Received: from localhost ([::1]:57664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdIZF-0006yb-3b
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 16:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1mdIX5-0006BA-AV
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 16:49:55 -0400
Received: from mail-dm6nam11on2135.outbound.protection.outlook.com
 ([40.107.223.135]:12833 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1mdIX3-00026B-4N
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 16:49:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBTiljlv6ZCo4GrmJCJKRQN8mTyjvfBZlt05G3OifZkPS81zHuPuePl8f7hPByFWwjsNWizDd6DsBtQ558yZUhULf6BDdQtXRO0u/xOV899yp22I2RS1Wg4ss5cqVa+2WLrOwd9dT//YgQ8Ah3pe+SrTg7MwsdP/3zBzji6I2reEv2jcFYPS5U4IP1Cwq5A9LI63stjbODUkOVZeGjbjsqrvRCVjZd0nnfPaEkE6G6cdUOrVpoBc9Q6kHE3jQdk20Tgj1lIXlO0PECs1Q6ODxb/p6vfYsFFFnBtV2H7orfX/1UxO8oE3fkXtLO6HrinG402QeMZp0fY/gFzmpukTpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMHgjD9/OFgqt24XHxihA68UFAb4x8+LIp+BDd7oiMo=;
 b=N0VxctvVnK4fkJ3yg1xX3WbvlYG1NfU+3EIdVuadGQC8wcC14SOPPH1K3YhOdFZsTZ2kf9uBqlPKJueN+lR70i1t5lweXaTMpvNeVGX+GFntMPP81j1VgdnwJiEN0b/SNRYLJJ1pZzN8v2Rn/N0OHr3k9HTkSZ4TL090sQKroMO3gdz2HA6Bi6fIzQ3AZj5nR8ouXn+lpJcrbJ3bfxFrdqGjKtasKV+Em42LkmNWn5jcjKJoFLUjhIVuzLQQtkvU7zZ+vPNC2MU1C0Ym4W780/UmrPQ7DVoXO+RQ430icqePmmo34flc9fQt2Zk8DL72UTRL5p71KnnpZCz/jmgZNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMHgjD9/OFgqt24XHxihA68UFAb4x8+LIp+BDd7oiMo=;
 b=l+1CDRtpYTQ8Pfc6/hd3cCgcAHYJaW98uZ2lL1tiCfV3DDMwGGgHQvEdyfThRjyi2L6c+JwyJ7cuXRlrmIiBwDmP8z0eEswYzWS59LkKixQPWVh0FwvG3wjvGoCaMdbQGdQCuGXq44eBe9EURArQGLhfBCsyl1Z0MTEGluJbmUc=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 CH2PR01MB6022.prod.exchangelabs.com (2603:10b6:610:43::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16; Wed, 20 Oct 2021 20:49:49 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::54ed:4286:b323:8ae6]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::54ed:4286:b323:8ae6%5]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 20:49:49 +0000
Date: Wed, 20 Oct 2021 16:49:47 -0400
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, cota@braap.org
Subject: Re: plugins: Missing Store Exclusive Memory Accesses
Message-ID: <YXCA62xdRDeueQR6@strawberry.localdomain>
References: <YUOssEF1lND+Rhsr@strawberry.localdomain>
 <87fsu3tppe.fsf@linaro.org>
 <YUpAXEYX0D27BnEA@strawberry.localdomain>
 <YUuQeSFsmM6YiBCp@strawberry.localdomain>
 <YXBN4UZvY5ESdz6v@strawberry.localdomain>
 <87cznzvavq.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cznzvavq.fsf@linaro.org>
X-ClientProxiedBy: CH2PR10CA0027.namprd10.prod.outlook.com
 (2603:10b6:610:4c::37) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
Received: from strawberry.localdomain (68.73.113.219) by
 CH2PR10CA0027.namprd10.prod.outlook.com (2603:10b6:610:4c::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.15 via Frontend Transport; Wed, 20 Oct 2021 20:49:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a7f6c6e-60e2-43f5-594e-08d9940b2849
X-MS-TrafficTypeDiagnostic: CH2PR01MB6022:
X-Microsoft-Antispam-PRVS: <CH2PR01MB6022DA074EF0B81F90CB2B1A8ABE9@CH2PR01MB6022.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BiBJNKmrSTwvjzEeqAmAQvZeaevkcT38HOr7Zl9Z7fNe93e2f4PXIbD5I7CSOypwhB/rKmj7ecxRE020fcTnqkJQXKf0sbb88Qs32IQPRV4pJkXcVastkCXCOhH3lNuoNDHrVV0peZywZDpOcpU7Zyj/2ooAtdY+Cx2ZOMJogzRgWbmR29y3OalKM75ZPkatwqyD2HxcFrnXI4cApEmPRg+MNiXp6U6glupiXQYkw7iFh1TlM1HjdVwSUvzDAlvUHyTMITlUBTwJ+9ET+1nZtTP9FiJhLYo8qVWhmTDf59rIbtZZVFRDQx+xSpUMpLvtEJ4GvDQddNMDrRaCMt25OfLZCpEcsoLPi34DgTTifM3uQTqyaNdhTSFrqh+npWvUCPRVG4DLZTJkY6yrw8u2FVT1Xy+N+HlaswanOmx49F/JY6ymu3PMozYbcQzNSjE17TL11pQPpiJj2afvSAhcvR3Z7LrLQqMrB/Z0of08DedIrIKFA4KOjvrNGiPcIbxMUcMMPnMZVhj6VZPyhbNXmyUf/Et7ECVX5Nwz5otnBxujf6lok3DQdgmiyICopAJgXNlPil5ITELifSsH9IMEMsVsHuEKOGBRhuMREeNpmms51Umgz7t8iIzWnQOWAVASIsmozWRImjeILKYA1i6YKAYoiLt2zeOjbPLDweqLzasly9q0SVYlCc3xQZlpddE204/ibiIS9ES6FVIoSSlhQrIwt5eedEugvZiFOGgkInQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(5660300002)(186003)(956004)(6916009)(26005)(83380400001)(4326008)(66574015)(86362001)(316002)(66556008)(66476007)(9686003)(66946007)(8936002)(38350700002)(8676002)(2906002)(38100700002)(508600001)(55016002)(52116002)(7696005)(473944003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hiPsL1fuidJSRkzaIRaNkDrxIuJuYIa/kpQpPtpASBajaGZlegKfrid53V?=
 =?iso-8859-1?Q?3aQ9nOqtb7BHe3KSGLTOIzWBkqlamkOQM1fAdxw+MrxTpEJGbloZJz/S9H?=
 =?iso-8859-1?Q?NTNLmujdMXp51GKshMqMdlu5bwJkRBVi7WptiabRoewtQf/Koo9cc2Sw0W?=
 =?iso-8859-1?Q?sdKEX+qBmGCrsynUIqpi/FbjCf61A9Jyf8Vm3PIGznNjqXLKPGPiwvKK68?=
 =?iso-8859-1?Q?/BXz7Ik/UIu0ocAKO4aJMeLdjVfSPZl0Grv97f8sGsGtjoBa33yrca3XxP?=
 =?iso-8859-1?Q?zppj0bwyCx74Dhjg5vyL300grlftCa1NHQURqr3KCEoJn2ka53WvItYFcQ?=
 =?iso-8859-1?Q?TcZvL33ct5rXoYE532c+lOtE+JgaNB/v9vJZQCiljxe64AMYhJbnJIUDnm?=
 =?iso-8859-1?Q?e9/nKhyohYLsncXch6wNFmGS7iTvNZNXjEzUYTMvzQwOD54EYN9tkack5l?=
 =?iso-8859-1?Q?gnFYiqco/j3U5V8y/r/qPZqwL3J7LAkNo0HbCycWdBmAozMtnsdtfGWSbr?=
 =?iso-8859-1?Q?/mDJr55AIs9Rt1gHmVUIZMhFACKN2Oob9smmf294lI0VefTpP92jKaVj1X?=
 =?iso-8859-1?Q?Pf8ngIPRjCjy00AbLRnBakH2BvBy1yzQIweQiycKHrBkDMhp/0wW55L+X+?=
 =?iso-8859-1?Q?3NoX4exNzlyZWO+jMwWMUjE8WUtZ5CiaUWOIbPlS1wo+naIgpaW6lBUZTj?=
 =?iso-8859-1?Q?/wekunAIdHfWe24Q773MhQc3/xUqYChaDSditRNwf6KLVmWEEbv2gbRc9W?=
 =?iso-8859-1?Q?y8wLWHRCvGX95FqrtnhxVfYl4dqr3qY2Kz4TLWUepareyI4HX9c30R+ZYV?=
 =?iso-8859-1?Q?RhioCEEG0vbK4l64cOB6jh/xvhAdGzdrGevwahOmZnWj1+5UleFIKxeecO?=
 =?iso-8859-1?Q?TCmYzCfj47cthskUobqAUDT+jb0vr63tvAeJ7rfxWET5xLPRLWYOsz/EnH?=
 =?iso-8859-1?Q?wy42h1f6SARyxGwjci4SBVM3hABhg+E7JZQdjpDoNcXDwV37WMD37/EjXX?=
 =?iso-8859-1?Q?FHvnGsx294N8CnS8N+CvLPUebT7rJx/n8DEKMg/fIT5QzZMVkKILonOkQc?=
 =?iso-8859-1?Q?Gb24ARpXChOBSUYpD4Lj7NOEESj9qJR5Bcpx4SxuGy9of3WZUhWP7W761W?=
 =?iso-8859-1?Q?6UnL6OA8gAgFx+2kdYa0MC2GkqSKZ7prWevYUWOSlgf02gCyQfHl2VpRrI?=
 =?iso-8859-1?Q?6Ktfy87V45S/oxuIP6m4F/HOM2MB0q0KQ+QaeV2IyGyCF/ixXx0K/T44Zn?=
 =?iso-8859-1?Q?ylwijA/qgfo+DFZScPq127Rbdp7pduRxX3BUemYGBLQP3rewwcXXuUuE6a?=
 =?iso-8859-1?Q?d1MYvvfcThX/ZpSSfTH4RIooBIA+0Y656chJPrE4LuyCgVJ+zqsdeD9b2j?=
 =?iso-8859-1?Q?uK1aHlI/A4?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a7f6c6e-60e2-43f5-594e-08d9940b2849
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 20:49:49.8420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tW5U8G9jg9EhBT96jSKak3JwDpJ9zCa8kKy7xPcvQlRdJ0VRdMSzb8KGhQ6J5/awLD0ykOxuIXt/XrIn/ngo+ATeP3m9ixc2HNhFnl2SnHHqHTVVwYP0hc/oceT6e4pR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR01MB6022
Received-SPF: pass client-ip=40.107.223.135;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Aaron Lindsay <aaron@os.amperecomputing.com>
From:  Aaron Lindsay via <qemu-devel@nongnu.org>

On Oct 20 18:54, Alex Bennée wrote:
> Have you got a test case you are using so I can try and replicate the
> failure you are seeing? So far by inspection everything looks OK to me.

I took some time today to put together a minimal(ish) reproducer using
usermode. The source files used are below, I compiled the test binary on an
AArch64 system using:

$ gcc -g -o stxp stxp.s stxp.c

Then built the plugin from stxp_plugin.cc, and ran it all like:

qemu-aarch64 \
    -cpu cortex-a57 \
    -D stxp_plugin.log \
    -d plugin \
    -plugin 'stxp_plugin.so' \
    ./stxp

I observe that, for me, the objdump of stxp contains:
000000000040070c <loop>:
  40070c:   f9800011    prfm    pstl1strm, [x0]
  400710:   c87f4410    ldxp    x16, x17, [x0]
  400714:   c8300c02    stxp    w16, x2, x3, [x0]
  400718:   f1000652    subs    x18, x18, #0x1
  40071c:   54000040    b.eq    400724 <done>  // b.none
  400720:   17fffffb    b   40070c <loop>

But the output in stxp_plugin.log looks something like:
	Executing PC: 0x40070c
	Executing PC: 0x400710
	PC 0x400710 accessed memory at 0x550080ec70
	PC 0x400710 accessed memory at 0x550080ec78
	Executing PC: 0x400714
	Executing PC: 0x400718
	Executing PC: 0x40071c
	Executing PC: 0x400720

From this, I believe the ldxp instruction at PC 0x400710 is reporting two
memory accesses but the stxp instruction at 0x400714 is not.

-Aaron

--- stxp.c ---
void stxp_issue_demo();

int main() {
        char arr[16];
        stxp_issue_demo(&arr);
}

--- stxp.s ---
.align 8

stxp_issue_demo:
    mov x18, 0x1000
    mov x2, 0x0
    mov x3, 0x0
loop:
    prfm  pstl1strm, [x0]
    ldxp  x16, x17, [x0]
    stxp  w16, x2, x3, [x0]

    subs x18, x18, 1
    beq done
    b loop
done:
    ret

.global stxp_issue_demo

--- stxp_plugin.cc ---
#include <stdio.h>

extern "C" {

#include <qemu-plugin.h>

QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;

void qemu_logf(const char *str, ...)
{
    char message[1024];
    va_list args;
    va_start(args, str);
    vsnprintf(message, 1023, str, args);

    qemu_plugin_outs(message);

    va_end(args);
}

void before_insn_cb(unsigned int cpu_index, void *udata)
{
    uint64_t pc = (uint64_t)udata;
    qemu_logf("Executing PC: 0x%" PRIx64 "\n", pc);
}

static void mem_cb(unsigned int cpu_index, qemu_plugin_meminfo_t meminfo, uint64_t va, void *udata)
{
    uint64_t pc = (uint64_t)udata;
    qemu_logf("PC 0x%" PRIx64 " accessed memory at 0x%" PRIx64 "\n", pc, va);
}

static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
{
    size_t n = qemu_plugin_tb_n_insns(tb);

    for (size_t i = 0; i < n; i++) {
        struct qemu_plugin_insn *insn = qemu_plugin_tb_get_insn(tb, i);
        uint64_t pc = qemu_plugin_insn_vaddr(insn);

        qemu_plugin_register_vcpu_insn_exec_cb(insn, before_insn_cb, QEMU_PLUGIN_CB_R_REGS, (void *)pc);
        qemu_plugin_register_vcpu_mem_cb(insn, mem_cb, QEMU_PLUGIN_CB_NO_REGS, QEMU_PLUGIN_MEM_RW, (void*)pc);
    }
}

QEMU_PLUGIN_EXPORT
int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
                        int argc, char **argv)
{
    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
    return 0;
}

}

