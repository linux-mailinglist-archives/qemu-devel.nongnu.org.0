Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550BF4A7501
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 16:55:45 +0100 (CET)
Received: from localhost ([::1]:60874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFHyy-0003Ye-BW
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 10:55:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1nFGmK-000534-0T; Wed, 02 Feb 2022 09:38:37 -0500
Received: from mail-bn8nam11on2136.outbound.protection.outlook.com
 ([40.107.236.136]:36449 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1nFGmD-0003sp-2t; Wed, 02 Feb 2022 09:38:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXBLByPUhEmrz/pWR1Ndc2eD5g04McpGhoGIpipicJE4izVUtiW2X58JQu29ZOoH8mflOqY7LgcdkWlGif6wLeN1P+9AtVFTkJ9bwQtpZhjbVCI1V5SyAiV9kmSGIZ5+poFypRLaUozOmwEJlLEAD2ZExk3ov6Yaj7cH/r+6kFPnErGleiWNW0fSZ2xdb5HJzRibkTwq0ECNufgLXAuPTUzrIG7oOOCHxVUUKNHLeHaIQSSu6oRNJaa0Q4CcXm5RAZUwgGbxm1/eXTaRTMALOpi5Ggl3bXeDsnuu5EOiY+SAEqvOFUwESJ+TFd3cHkRZjS0WnpWNHQjsbgmf/HaEnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8SAtbXh4jUaqJnKIPsd0tooDBFXMHRZk3USFPJz4lc=;
 b=E/K/sNp8aTHHfD2hiDQl8JrI9xdm4tQVdBqS6yzZ9ZL3gaNX6nr4cibtP1CDSPODJ9Ao+N4HCQfe56VGXgX8gvHJN9CDXTng352tCi9Y5y7F0IstIzxwQ4ocu2lAI013SzzbCK99M4X50PSc8al7V2BEoZh/5Hq72W8oBEBs14mL8ttPe3khNFQ30v0nHB6l6/sEPQPogqKffNz7o/gQZBiJFEpfCcciUUhZqgaNktTFf+YYa/ndfiC+gGcFTjeirvRsaL63UavnXpk4r6/y3+iZOpXeb+AIUV2XNtR/nqYF+un6A5H6dZaYcUmRgwKPMvXtTbT39OtJosKMOKTV5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8SAtbXh4jUaqJnKIPsd0tooDBFXMHRZk3USFPJz4lc=;
 b=iqU+ydbVcKArQVdmcqMQZ9rz6f+D/3iXF4E56MaZqBdcvDG9TxcDyHYHrwbqOmQyqr09nLDxWpmOZ8W5cw0C4gkCwnJllmW2NJ8U69aZk9pQgUcAt9YSbyfJjxMM5+FZGBYncOUAOd7auTveCT1UXOWzOy3yxaWbsQm3etThAHo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 BYAPR01MB4597.prod.exchangelabs.com (2603:10b6:a03:81::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.20; Wed, 2 Feb 2022 14:17:26 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::d949:6c64:e3fe:68d9]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::d949:6c64:e3fe:68d9%4]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 14:17:26 +0000
Date: Wed, 2 Feb 2022 09:17:21 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, minyihh@uci.edu, ma.mandourr@gmail.com,
 Luke.Craig@ll.mit.edu, cota@braap.org, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 Alexandre Iooss <erdnaxe@crans.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH  v1 12/22] plugins: stxp test case from Aaron (!upstream)
Message-ID: <YfqSccJqLUqWXQcv@strawberry.localdomain>
References: <20220124201608.604599-1-alex.bennee@linaro.org>
 <20220124201608.604599-13-alex.bennee@linaro.org>
 <YflK+fSCdRCzmNrS@strawberry.localdomain>
 <87o83qy56q.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o83qy56q.fsf@linaro.org>
X-ClientProxiedBy: CH2PR18CA0060.namprd18.prod.outlook.com
 (2603:10b6:610:55::40) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1e4ff68-9a21-418c-ace5-08d9e656bd1b
X-MS-TrafficTypeDiagnostic: BYAPR01MB4597:EE_
X-Microsoft-Antispam-PRVS: <BYAPR01MB4597AC169BB0559969D2F5FC8A279@BYAPR01MB4597.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +m8RSCC9Vc+yLcl+I6rrnOZ2zUTDAvGFHDeqlnxuofHIFI6kJ76toGY4+rV4ub0CLoXZ91g3vuRbONsXp0e2EIgAXGgc2CEp6rh7s5fYG+Ym82DRxBUuUvs8T67zF0fjL4W5WWRHhY84dglcM0yJaJwRBsfVRwSXGaHClDcdn6bcVhuicHUFWvwBMDvsRWdMB0UChZxBy30RwlKHFhE0Ap155eQkAnZowQpcbeiTf9SXn6SWRWkP11vwG1YHeuzsMhCj4N0oW2eUStHJqkhakXIszPuaor8XsXLAmcObI+g5uP9QrhppB6YYV1GlkJO6nRbENb1eLJS9+sED2uv9DcRrYzR0KwFzfWFN1NJh+zhsm0PT9/5kITwxOpYn75NZV+IJUP1Wgy0PXforU7ORQrrHdFcIKiwmKFL8ubXJElRIzM4cC+2De+8BjupilWpxSVr5BBos/cNA06daRv2jlhBWJRzDELSvaJNLWtWFqdas/vmVS3tiWsYC3YqT+0QN+CLx1UMT/Z1gy1GpamzGzcLatE0FW7ig/Jlmo55+P5p8QgspPYui0kTEgCLtVpm1ZFAkf+SKjLgIvu2TaxFYgOAJbTA/HtAjApVXltCcWRkcYQ+wrvPLI4Ks32Ldo3u46aeCtLs7MGvFyfffUXHd74HI2upb0PWtOtbuyi2E4KnR+AJUw7Y7YCa119/ditfmJ9yckOLmOS0AK0S/8Qb1Ni2OQemANbWHNTjGibe0Xvw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(54906003)(8676002)(8936002)(66476007)(26005)(4326008)(66556008)(316002)(2906002)(186003)(6916009)(7416002)(66946007)(86362001)(83380400001)(52116002)(38350700002)(38100700002)(508600001)(9686003)(6666004)(6512007)(6506007)(6486002)(473944003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fL1emGGGAEJmi38j/wjo59EZHo5B68G58auLXGCHTTRsDnklCEFpHiQTYO?=
 =?iso-8859-1?Q?OVIY8TDvm4XODfkWJxOUa3YiJ0LtbCBSeFFB0jAR6RLLihptuwK8wdIOWQ?=
 =?iso-8859-1?Q?CtoXuon19PywwG3uwWfLo27QqEyTIdS1RWJPP8dSUnw6vrYxEMfOIMciJB?=
 =?iso-8859-1?Q?qY2Q0lXEL9VZC79V9M2Zb3H+GuIX/hqwwacsM9AQP3baFidE/DeSgN1wQB?=
 =?iso-8859-1?Q?jNq/flliOhrvrSiKa2pNNUdwomhLQz6eAmqFQwhD9JVnkizJz9LjydqZv+?=
 =?iso-8859-1?Q?3w1eyq4o+UWrKGjLFLfnk6tMbw+t4pV6lTdki5DaRodEOrCoyO63s1sCtn?=
 =?iso-8859-1?Q?3OGLeme5v23+pJQo1gXTqNFfjutuVTK6h1qr4Z++sbpL9En51itGVI4wDe?=
 =?iso-8859-1?Q?eYW57PUJPG9EFCcSX+Q66wlzBAtTxCCGlvMc6985H3OyTenT+qSf8zS3bJ?=
 =?iso-8859-1?Q?Yl2RtFByWFY06Q3EJZ3QL5sDs2m2UAigiCSbEIhOkupFF6YzMGYIgIKGdr?=
 =?iso-8859-1?Q?BcE+SBb57SGoUgVNvvWN87DixlBqOvRH0cpbu5inSlEf58zaE5Flols9BR?=
 =?iso-8859-1?Q?mkGAPwW5HLtve1QTo7oNQ5VZiMY5OG3LkRzUOlX7kQJxYI0H0uvLwyuliV?=
 =?iso-8859-1?Q?UvSfTD1+MYduW/FWpfbfXNkiB/QZiJt1kmFKqHiJVm2WJkQnGQS0KQkNQq?=
 =?iso-8859-1?Q?Y+WFfU6n4MOfEXk/x8B4inRr8nMlUX2Ngk6mBUn/VU7spNIp2BvX4QCwrs?=
 =?iso-8859-1?Q?2Ld7NiCJPuJlNY7LJqqp1QeCSAM7Viz2uMZr1WefnPU6wHQXtGjpIUkyfR?=
 =?iso-8859-1?Q?HqiR0MUKcMS8PnaqxgTqo6bkPfcZprkq7iRPtaYDb4JOTRsiu7H0q/6hLZ?=
 =?iso-8859-1?Q?4MZL3wWcrvLKfqH9W+S7DnIVMxiBnHyf5Hpa97ma5Eztu1bFjaS6UB+QuI?=
 =?iso-8859-1?Q?Fjmxki49UdYfjnmseM8PFwyq2mfEf1icbeQaJd8CZUY3HsgaYpNg9XH/i2?=
 =?iso-8859-1?Q?lM70ARQoxXKdFvOXO2vMcKdXxB1PWh5nSKem6HnJkc2P0hM6LATLCA3pCw?=
 =?iso-8859-1?Q?t5Ty+0E8LayWJaNQmTGKNUMH/AXdCN3hi89s01yi3Mh9zj6VuAWZYs0NsK?=
 =?iso-8859-1?Q?F8ycqLFe2G/7iiadftvvuCevZ/U3+c4VajyIegrFL01D6m+DV70AtMbMmk?=
 =?iso-8859-1?Q?0+WYo59ACxBRSQoJaGhyhuBADxblFQ87Wv/+YqHXoSAbp+CtDTWY1TvOxk?=
 =?iso-8859-1?Q?z5KL8WSoynb+TKiUqNxG224xgXSxDM/4e/cd7nKsLmcnxBz8j94DK+3lU2?=
 =?iso-8859-1?Q?GaQHXab+XvlBpEouC666TzSVy0ixs2xMkpk5TlC0W6wkZt/9GWPvKeZEUU?=
 =?iso-8859-1?Q?XKdmWThCfP8f8r2fb5irqx7crN8eENUxjo+RJJ/xaouhM+sq70rH4YsZzi?=
 =?iso-8859-1?Q?ZvovgXRkCuPLTkod/wczT/lQ7D5ZzEL+0rZhSwTJ4rZr8qZCRxbi5+e9jX?=
 =?iso-8859-1?Q?lpMfNr00wj+RTnUGsGWduVXPk5Nl9SqJvGMFfx1jaYX+VdqEKhuWtpIWGm?=
 =?iso-8859-1?Q?lRIInOzzr85E1Gik7Zi7JvAe3yZdXIXvv2dx0ObdzN2ncTTBWlM4u3vaDy?=
 =?iso-8859-1?Q?UJk7+dCkpwesy87GYBl8TIGZVdEYc21vs1UhNGI67/9PHT2mz6WBsdMu5k?=
 =?iso-8859-1?Q?FE+1eOeU7X7EXpu8xBJ7t5X5qglotYn0Yen+XxgGUDfB9f8+4fKrl2vjAv?=
 =?iso-8859-1?Q?hXcxX9BU8+CB7KifIrZhBN6ISjB2mJxMqY1Ux0qa5YIaXzQ6AeL78bRzpf?=
 =?iso-8859-1?Q?tML4Bs2TNg=3D=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e4ff68-9a21-418c-ace5-08d9e656bd1b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 14:17:26.6575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T568IrMKBqEuz5m0igCvcpbwt8XvABETmC+ib9OFslmsW/RKXolVVMsO3IZ+n9vZKTGB88qCccJURZAAnzFZYbmLkbr/pYKuU2o0H5FhL4iepOuWB3JclTa14XeKG/6m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB4597
Received-SPF: pass client-ip=40.107.236.136;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Aaron Lindsay <aaron@os.amperecomputing.com>
From:  Aaron Lindsay via <qemu-devel@nongnu.org>

On Feb 01 15:29, Alex Bennée wrote:
> 
> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> 
> > On Jan 24 20:15, Alex Bennée wrote:
> >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >> Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
> >> Message-ID: <YXCA62xdRDeueQR6@strawberry.localdomain>
> >> 
> >> ---
> >> [AJB] this was for testing, I think you can show the same stuff with
> >> the much more complete execlog now.
> >
> > Is it true that execlog can also reproduce the duplicate loads which are
> > still an outstanding issue?
> 
> Are we still seeing duplicate loads? I thought that had been fixed.

I have not explicitly tested for the duplicate loads on atomics lately
(though I have seen some transient behavior related to atomics that I
have struggled to reliably reproduce, but I believe that's a different
issue). I hadn't seen a subsequent fix come through after the initial
fix for stores and assumed it was still an issue. Sorry for my
assumption, particularly if I just missed it.

-Aaron

> >> ---
> >>  contrib/plugins/stxp-plugin.c     | 50 +++++++++++++++++++++++++++++++
> >>  tests/tcg/aarch64/stxp.c          | 28 +++++++++++++++++
> >>  contrib/plugins/Makefile          |  1 +
> >>  tests/tcg/aarch64/Makefile.target |  3 ++
> >>  4 files changed, 82 insertions(+)
> >>  create mode 100644 contrib/plugins/stxp-plugin.c
> >>  create mode 100644 tests/tcg/aarch64/stxp.c
> >> 
> >> diff --git a/contrib/plugins/stxp-plugin.c b/contrib/plugins/stxp-plugin.c
> >> new file mode 100644
> >> index 0000000000..432cf8c1ed
> >> --- /dev/null
> >> +++ b/contrib/plugins/stxp-plugin.c
> >> @@ -0,0 +1,50 @@
> >> +#include <stdio.h>
> >> +#include <stdarg.h>
> >> +#include <qemu-plugin.h>
> >> +
> >> +QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
> >> +
> >> +void qemu_logf(const char *str, ...)
> >> +{
> >> +    char message[1024];
> >> +    va_list args;
> >> +    va_start(args, str);
> >> +    vsnprintf(message, 1023, str, args);
> >> +
> >> +    qemu_plugin_outs(message);
> >> +
> >> +    va_end(args);
> >> +}
> >> +
> >> +void before_insn_cb(unsigned int cpu_index, void *udata)
> >> +{
> >> +    uint64_t pc = (uint64_t)udata;
> >> +    qemu_logf("Executing PC: 0x%" PRIx64 "\n", pc);
> >> +}
> >> +
> >> +static void mem_cb(unsigned int cpu_index, qemu_plugin_meminfo_t meminfo, uint64_t va, void *udata)
> >> +{
> >> +    uint64_t pc = (uint64_t)udata;
> >> +    qemu_logf("PC 0x%" PRIx64 " accessed memory at 0x%" PRIx64 "\n", pc, va);
> >> +}
> >> +
> >> +static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
> >> +{
> >> +    size_t n = qemu_plugin_tb_n_insns(tb);
> >> +
> >> +    for (size_t i = 0; i < n; i++) {
> >> +        struct qemu_plugin_insn *insn = qemu_plugin_tb_get_insn(tb, i);
> >> +        uint64_t pc = qemu_plugin_insn_vaddr(insn);
> >> +
> >> +        qemu_plugin_register_vcpu_insn_exec_cb(insn, before_insn_cb, QEMU_PLUGIN_CB_R_REGS, (void *)pc);
> >> +        qemu_plugin_register_vcpu_mem_cb(insn, mem_cb, QEMU_PLUGIN_CB_NO_REGS, QEMU_PLUGIN_MEM_RW, (void*)pc);
> >> +    }
> >> +}
> >> +
> >> +QEMU_PLUGIN_EXPORT
> >> +int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
> >> +                        int argc, char **argv)
> >> +{
> >> +    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
> >> +    return 0;
> >> +}
> >> diff --git a/tests/tcg/aarch64/stxp.c b/tests/tcg/aarch64/stxp.c
> >> new file mode 100644
> >> index 0000000000..fb8ef6a46d
> >> --- /dev/null
> >> +++ b/tests/tcg/aarch64/stxp.c
> >> @@ -0,0 +1,28 @@
> >> +
> >> +
> >> +void stxp_issue_demo(void *arr)
> >> +{
> >> +    asm(".align 8\n\t"
> >> +        "    mov x0, %[in]\n\t"
> >> +        "    mov x18, 0x1000\n\t"
> >> +        "    mov x2, 0x0\n\t"
> >> +        "    mov x3, 0x0\n\t"
> >> +        "loop:\n\t"
> >> +        "    prfm  pstl1strm, [x0]\n\t"
> >> +        "    ldxp  x16, x17, [x0]\n\t"
> >> +        "    stxp  w16, x2, x3, [x0]\n\t"
> >> +        "\n\t"
> >> +        "    subs x18, x18, 1\n\t"
> >> +        "    beq done\n\t"
> >> +        "    b loop\n\t"
> >> +        "done:\n\t"
> >> +        : /* none out */
> >> +        : [in] "r" (arr) /* in */
> >> +        : "x0", "x2", "x3", "x16", "x17", "x18"); /* clobbers */
> >> +}
> >> +
> >> +int main()
> >> +{
> >> +    char arr[16];
> >> +    stxp_issue_demo(&arr);
> >> +}
> >> diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
> >> index 54ac5ccd9f..576ed5875a 100644
> >> --- a/contrib/plugins/Makefile
> >> +++ b/contrib/plugins/Makefile
> >> @@ -20,6 +20,7 @@ NAMES += howvec
> >>  NAMES += lockstep
> >>  NAMES += hwprofile
> >>  NAMES += cache
> >> +NAMES += stxp-plugin
> >>  
> >>  SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
> >>  
> >> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
> >> index 1d967901bd..54b2e90d00 100644
> >> --- a/tests/tcg/aarch64/Makefile.target
> >> +++ b/tests/tcg/aarch64/Makefile.target
> >> @@ -72,4 +72,7 @@ endif
> >>  
> >>  endif
> >>  
> >> +# Load/Store exclusive test
> >> +AARCH64_TESTS += stxp
> >> +
> >>  TESTS += $(AARCH64_TESTS)
> >> -- 
> >> 2.30.2
> >> 
> 
> 
> -- 
> Alex Bennée

