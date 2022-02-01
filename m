Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0344A6225
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 18:17:35 +0100 (CET)
Received: from localhost ([::1]:42824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEwmc-0006tL-Fc
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 12:17:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1nEuc5-00013q-Li; Tue, 01 Feb 2022 09:58:33 -0500
Received: from mail-mw2nam12on2126.outbound.protection.outlook.com
 ([40.107.244.126]:24960 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1nEuc3-0003n4-Vs; Tue, 01 Feb 2022 09:58:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKtfhrtn1K7mef32GTEithozSufiuQKZ03n03BVzR3HMx2UomzgVwXPprlRrZN4wpXcC4CVEiCRKNKNG+qv8NH9Y/Dyhd8ln0/PWSG/p+Eu07+zKsk08SktULNl+LqcP/ETY2XO/T3JKzk6+2ZHxbHnycPy6ajfmjhMadRmHkFag7tpBYY0PzHaWxxBGKexzRHiZo2uj1PBykZcU8M0/8Dx9rQIfkwww+FXdEY+y7SO4/pAyz7d8mbMbN7O2/WkhdTDBuLlkJejWG4W/fGyHe3vTyV33iN+HRT0yNmKmO8MFw6fuk3TIbhiZBlsg7aGiq4y3HTNlZmAobPsV3bM5jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgtkvIqCWNJIIzK6L0ZB3FTk71sp4NZJG/jQ+E3x9TY=;
 b=VaqFaYhFXdci6J6PGeD77goMMb97akana7i9KMdxYqk26hIE1ckOneMTPUiML4mvUxXcTC8Mj/6s6zQ/GC9bmuviqkwfJizkU428KOeuPLb+V2UIsygrgCC9qXOQfRRSdXRfb3A2QgX8heNcauXhyFfrBbG2gtKmSXIhawTlXTKVF5OOr7av/LAMSj6COPMBRxsVbsVWYHiIqvGQxVgTrHKSk/CrJwaaRVmjVFDhMJOYt6Jmkjj4QuC7x8NYgeet0EcNV2VOs6SjfqbOyweLE1TzanMFtWf7SfZ4xNuV+tdZBwq0r7yJeceVaMzXMDqc8OORJOkpl6ponZG9JHJz9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgtkvIqCWNJIIzK6L0ZB3FTk71sp4NZJG/jQ+E3x9TY=;
 b=MGMbIAUO0LcGPs6bAH/GnERIZ0MdjU7eIUex7SFqI7eHgVO1O13iT2i5B+GVXnPkRV2LymADiba6q0Lx98HXfKbIDP6ydkygIDMhth/nJdEVCTDpy3ahSLGZzvF5KE1HSCOoNs8pSXOk2WoIsixk0Nwt7zkZq7HZqyqSUt+rOKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 DM6PR01MB5162.prod.exchangelabs.com (2603:10b6:5:59::30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.12; Tue, 1 Feb 2022 14:58:26 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::d949:6c64:e3fe:68d9]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::d949:6c64:e3fe:68d9%4]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 14:58:26 +0000
Date: Tue, 1 Feb 2022 09:58:21 -0500
To: Thomas Huth <thuth@redhat.com>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, cota@braap.org, Luke.Craig@ll.mit.edu,
 Alexandre Iooss <erdnaxe@crans.org>, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v1 12/22] plugins: stxp test case from Aaron (!upstream)
Message-ID: <YflKjbFKP1mak1Cy@strawberry.localdomain>
References: <20220124201608.604599-1-alex.bennee@linaro.org>
 <20220124201608.604599-13-alex.bennee@linaro.org>
 <9e8b013c-5340-0cd4-0bee-7b48ba4dc525@redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e8b013c-5340-0cd4-0bee-7b48ba4dc525@redhat.com>
X-ClientProxiedBy: CH0PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:610:76::13) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00ac0bc0-8100-4647-4947-08d9e5934cb2
X-MS-TrafficTypeDiagnostic: DM6PR01MB5162:EE_
X-Microsoft-Antispam-PRVS: <DM6PR01MB516232EC38D064DE9BF948D88A269@DM6PR01MB5162.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k3SqbBYOSQOeI5qiah41xAPqu2K6zGMQ7oUTWVbnNrx5aN9JCihk9DVPrc6leefInAx2XRxg9StakTihoi0+j3TxYMdSvdduNvQxZneS6GWZ0YMyygmXGLaQ/9EtvJcKHWM72T1jiEfSIYdUYatziiyrmtUJMxfswHvBpVU+Rps26tCRwsIbDGOMclIE/leXqCNbdFwjSct+fJnEEaIJ/QSe0HRxQw15YBGdLnd9v8CjsSFY4IF3F8ZONxDYmCfPg16fGen5mBPSdMz+/+nof8Ul++dB+Vrs4gzpLCSV2ltpn7KE4BmYjPS4cvTuuXY/Y5a200H62VriZQqJMFraWw/stmf07CebMkBBFN0uzut9H8Zq+5LZkByStHrvk0e5GiXnTCbRiSL3dgesKzH7S6oThIj1BdEIS6WWB+uDz4/xI7MmPFZAYfvq3NB0l/llBrHJSfCeT/p1pq4QK98DcSvEgAMyofxaNlhfVJZwMoXeI/eqlLdozlhsXDr9Xwkiasp9USVOGlUHwGaA/ac1DODI25Em+RegZp/ZXL5EmCStDKsvS5ORhbujrLeC/vliYoVSuDA6zZvNBr6nwcpKaCVyNwRLLlJgjTrCIGhplYV6nmw3qKCUvU6m3w8woJn2WRGzo3+JdNZ7zYOSOtDZVA5vNWlmj7jmki51PVtk04WzCo8EqeSNjvWOlU2CpRvptjjAXhuqBzq2sHUpXLKY3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6666004)(6512007)(6506007)(38100700002)(38350700002)(52116002)(9686003)(6486002)(508600001)(54906003)(316002)(26005)(66556008)(66476007)(186003)(66946007)(8676002)(8936002)(2906002)(4326008)(7416002)(5660300002)(86362001)(83380400001)(6916009)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FXi+z6soNYmPTvjaQ6TBX3TAidmKwg0u1DPaktupZskEsM6VQTEQKRA3OQ?=
 =?iso-8859-1?Q?kCLA5c3zduMKDUJR91apFsW5F9EVInjYxFlngisJf8q9CfrXEgrgW05805?=
 =?iso-8859-1?Q?iAavs2mUno1fPgql8gH1M0jKxJ73Ujc6jtozA8OWzm1PIhIraWWeIPpoJL?=
 =?iso-8859-1?Q?hZKKnq7IGR054xk3ObNwGtEdXRlAogu+pIMtIZgTmR8EVAroPbWFYE7P3k?=
 =?iso-8859-1?Q?OaaNQsd/Ol8rAzqinatKw/HelVpwwwNNZTUeFe2a0K55E9T1A8ee6HH5ii?=
 =?iso-8859-1?Q?6jMI1VAyEOK2gH5dhpqDGzgoZ4WzvKMLWGan3fNuG2qSLQVv6yQaYfH+E0?=
 =?iso-8859-1?Q?MIh+l26DdUBhzELvEJV8f95zn0htfsHdaoiUWFlsRAcNuwZL70xq/g5j5+?=
 =?iso-8859-1?Q?bEFbbslu3VZhBTCQ51DHIO+STCOvi/lUWyBOy7EF+9NA8qdAzdov6QK/V1?=
 =?iso-8859-1?Q?fzTN6PDrtgbmVs1w6ZGyK55i19R7oj5rO3hYF5WcxKNn749yGESl85pmzI?=
 =?iso-8859-1?Q?YUvBAiKy9mLT3yhqf5yRDwpHgud9D8ENdfE8N4/2RTJS1D04CpR/+sBCSd?=
 =?iso-8859-1?Q?fsnkdvum4eml1pwsUgltYv7BhEWE6K01taKK4F3uYxO+1zpBNOr4fiVMIm?=
 =?iso-8859-1?Q?kb4HlU8Q4kBn3Y9FGN/Rt0kYORCfH1z3vzeeClLJABzith5oQQ24lABYm+?=
 =?iso-8859-1?Q?ro+vWwK9+sD5Pt1b8VimzplT0yAfm+LxBT05RB7c57Lu6SNNWlruDdp9un?=
 =?iso-8859-1?Q?9XlC6dFOfVKya7olRSq+kWkwy0e7rN/cKSwtE+Kd5NejeWOs7UBViRCfBD?=
 =?iso-8859-1?Q?1TXT3GVc3/rNPIqg5pli+fq9CRPeizOl6aktXOf5mn+ldKTpsfZKvrg00X?=
 =?iso-8859-1?Q?NS2u4FQ4L8E10W2Quv1VPbO1a+LdqjSG8L1Xaf15MKqeaSIsT1X+NnHZzf?=
 =?iso-8859-1?Q?z/NsSZlRH3Ewd98p5fw7RYEhqjQDstEOh82B6kzcmMyfBQ+OCxJUz7l9H4?=
 =?iso-8859-1?Q?7SAebvok94hP3ZddVBchYm6BBOkkRwLBOHPjs4JRCsVQh90sjZQQenV2oI?=
 =?iso-8859-1?Q?/9s9LA9UR+5Ky5Dc1CSc03ievpgyCwqyuFRMjU6EGk6EY55zPlmmPe4/+Q?=
 =?iso-8859-1?Q?ss2C9G02c5Nqdm29YCLnOVDfF+APhh1Boi9MjE2inQHSiKDuMyYcoDdT04?=
 =?iso-8859-1?Q?vdW4/vSuF7PhYcpElnJWNZQEP8XUOqO6OtKf08wmsG5OHkMOehrlPUKDBa?=
 =?iso-8859-1?Q?XaS3zM4Ldv1mHTle+API7J5jMlF88v9HXUjUWVyHBvmoyMeJ25qy6yzyXK?=
 =?iso-8859-1?Q?l2qO7A6ytLAhu6nPDFnCs197i3G68mSFK/yY8bFiQtPJNamZmjKx/q+QyU?=
 =?iso-8859-1?Q?QlmPr0zfoOgAK/yTIiJJWDi90w5Z5kz+J7QAoDAYvnHRprBBrigaNZVt2i?=
 =?iso-8859-1?Q?3NXslopSnR7e+0FR3dkXShpnj21AW14KiTNkrJDQsVcIk7FfxXhSP6Fu7Q?=
 =?iso-8859-1?Q?bi0FNEPnxz56gj15nORG+BbEhu1v6DOTIj4iMRhtI0tucDZBQPfyjTaNm3?=
 =?iso-8859-1?Q?/1TZTd0SfgguRy8GpIwHIhhiOfpE0taWTJsfL4KsAkzKNhsBZcYIVPx2D8?=
 =?iso-8859-1?Q?Ktrn2wxsYQUvpjjPA9LLGKjhmmSpRrAr02cdtOVD9coBH3bTcdFWJhX/gL?=
 =?iso-8859-1?Q?tNG45Ml2yHTc9n8groXuSHbzScfPOfMk82juWlM08/a7RTO9iCELI1w9V9?=
 =?iso-8859-1?Q?vDdJX7bHTNU2JB1mOXsUWwoLTpdv3FFN6y/hChU63oBynfo8nagTwzyKS3?=
 =?iso-8859-1?Q?9Lq0LqhPjw=3D=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ac0bc0-8100-4647-4947-08d9e5934cb2
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 14:58:26.3090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Hlh6JMVlL4yl5kFDZ2jagJQn6oyEwW5uj/F9bXjjf0BN57CWSdlyKWKcTtr9ZYsIN/VliivZzZ+3PHUZX6HbRGczeKtnlezfZyDQ8tn2Yb6zOo4aocqwFUyhg4OywmB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5162
Received-SPF: pass client-ip=40.107.244.126;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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

On Jan 25 09:17, Thomas Huth wrote:
> On 24/01/2022 21.15, Alex Bennée wrote:
> > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
> > Message-ID: <YXCA62xdRDeueQR6@strawberry.localdomain>
> > 
> > ---
> > [AJB] this was for testing, I think you can show the same stuff with
> > the much more complete execlog now.
> > ---
> >   contrib/plugins/stxp-plugin.c     | 50 +++++++++++++++++++++++++++++++
> >   tests/tcg/aarch64/stxp.c          | 28 +++++++++++++++++
> >   contrib/plugins/Makefile          |  1 +
> >   tests/tcg/aarch64/Makefile.target |  3 ++
> >   4 files changed, 82 insertions(+)
> >   create mode 100644 contrib/plugins/stxp-plugin.c
> >   create mode 100644 tests/tcg/aarch64/stxp.c
> > 
> > diff --git a/contrib/plugins/stxp-plugin.c b/contrib/plugins/stxp-plugin.c
> > new file mode 100644
> > index 0000000000..432cf8c1ed
> > --- /dev/null
> > +++ b/contrib/plugins/stxp-plugin.c
> > @@ -0,0 +1,50 @@
> > +#include <stdio.h>
> > +#include <stdarg.h>
> > +#include <qemu-plugin.h>
> > +
> > +QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
> > +
> > +void qemu_logf(const char *str, ...)
> > +{
> > +    char message[1024];
> > +    va_list args;
> > +    va_start(args, str);
> > +    vsnprintf(message, 1023, str, args);
> > +
> > +    qemu_plugin_outs(message);
> > +
> > +    va_end(args);
> > +}
> > +
> > +void before_insn_cb(unsigned int cpu_index, void *udata)
> > +{
> > +    uint64_t pc = (uint64_t)udata;
> > +    qemu_logf("Executing PC: 0x%" PRIx64 "\n", pc);
> > +}
> > +
> > +static void mem_cb(unsigned int cpu_index, qemu_plugin_meminfo_t meminfo, uint64_t va, void *udata)
> 
> Could you please break the line to avoid checkpatch errors:
> 
> ERROR: line over 90 characters
> #63: FILE: contrib/plugins/stxp-plugin.c:25:
> +static void mem_cb(unsigned int cpu_index, qemu_plugin_meminfo_t meminfo,
> uint64_t va, void *udata)
> 
> ERROR: line over 90 characters
> #77: FILE: contrib/plugins/stxp-plugin.c:39:
> +        qemu_plugin_register_vcpu_insn_exec_cb(insn, before_insn_cb,
> QEMU_PLUGIN_CB_R_REGS, (void *)pc);
> 
> ERROR: line over 90 characters
> #78: FILE: contrib/plugins/stxp-plugin.c:40:
> +        qemu_plugin_register_vcpu_mem_cb(insn, mem_cb,
> QEMU_PLUGIN_CB_NO_REGS, QEMU_PLUGIN_MEM_RW, (void*)pc);
> 
> ERROR: "(foo*)" should be "(foo *)"
> #78: FILE: contrib/plugins/stxp-plugin.c:40:
> +        qemu_plugin_register_vcpu_mem_cb(insn, mem_cb,
> QEMU_PLUGIN_CB_NO_REGS, QEMU_PLUGIN_MEM_RW, (void*)pc);
> 
> total: 4 errors, 1 warnings, 92 lines checked

For whatever it's worth, I don't think Alex's intention is to upstream
this code.

-Aaron

