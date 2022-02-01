Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1584A6166
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 17:32:02 +0100 (CET)
Received: from localhost ([::1]:38442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEw4X-0006VU-6g
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 11:32:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1nEudn-0002qf-Kq; Tue, 01 Feb 2022 10:00:30 -0500
Received: from mail-dm6nam12on2118.outbound.protection.outlook.com
 ([40.107.243.118]:23904 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1nEudi-0004ag-Pj; Tue, 01 Feb 2022 10:00:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lbxt0r68uA+hNadYtWAMzJFVezxGIeEn7o1SLRC/9UTeRNEYi/2H/82xXyrRxIR+lFjqUvuxnMl2y4RzyPf/bfKnfUO5wVDRdxRNX6ECIJQMU0yBH2WbpyhYDrWCbaiNvxBIs8wrUZ1gQ/Z1mGS6rHc4X4qUWjbTnNmg2tslV5UmveBNnBWzciges4TtDTbdnMTOQYsVJheUB+o5aFsDo5jKJscvg41zZW7wdBCEMzjJkdiriK6piZ9wHYJi7ofO5WkRv1holAjnEaX4eSWUOzHA10VNm9dB3yxqJtu879N2Tr7cqpn/koH2z5jN8mOaYYFQXwRRHvCa8mwtpOBlsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TidBpUckHJ3Lx5hEvche26cB9kQE5GYMwRBpeOlFUt0=;
 b=H//i/tFpXlXoZWwPsSaIqUaRrR+hGby6X/29NKy8ss6hHmxMsHe4o8fG0lrZYEWtJHUyN80F8WudiuVJwZtgtxvHaohp6o0Lqmvz6GUp/5KW9fwMuvfHGQqm/8h1ZNah7AxyXbDKvqoTMU4USs+rQ9ugj0wwLgQyUBvEtoQwiE9RvCTSUyx38wilVC0Lzc9uhJn3iBN+2Z9avTGBdXEtO/Kuh/zRNjrRVc+UjVpQmNtIrismYLUNl5iT+KVKPjSr52srT9WSYu81zZbypnNvmyUPZDSGvFhDTKda2V/V05ezGVscsNSjpQRt+hC8Cppkr6UBgmiDo/d4FOguwe+tUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TidBpUckHJ3Lx5hEvche26cB9kQE5GYMwRBpeOlFUt0=;
 b=HlFiR65+t45TF9tD0I1ZnpxUBv7f/XExXWBOjJDVmsyzNU0tilhqXP823Zc4nnX6ClxuBLoczffrK9/G1hvadOVvos6yRdt0NOTfOESt7JRB0n0Q9FKcTojwMoosi8DoQy8ebrjV9/q/eb8ZAJmcBpnv6gZNzpdHy6/0uhsiiys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 BL0PR01MB4929.prod.exchangelabs.com (2603:10b6:208:6f::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.17; Tue, 1 Feb 2022 15:00:11 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::d949:6c64:e3fe:68d9]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::d949:6c64:e3fe:68d9%4]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 15:00:11 +0000
Date: Tue, 1 Feb 2022 10:00:09 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, minyihh@uci.edu, ma.mandourr@gmail.com,
 Luke.Craig@ll.mit.edu, cota@braap.org, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 Alexandre Iooss <erdnaxe@crans.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH  v1 12/22] plugins: stxp test case from Aaron (!upstream)
Message-ID: <YflK+fSCdRCzmNrS@strawberry.localdomain>
References: <20220124201608.604599-1-alex.bennee@linaro.org>
 <20220124201608.604599-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220124201608.604599-13-alex.bennee@linaro.org>
X-ClientProxiedBy: CH0PR04CA0065.namprd04.prod.outlook.com
 (2603:10b6:610:74::10) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96e2a434-da16-488b-39f5-08d9e5938b63
X-MS-TrafficTypeDiagnostic: BL0PR01MB4929:EE_
X-Microsoft-Antispam-PRVS: <BL0PR01MB492966BEF1C89029446ED0EF8A269@BL0PR01MB4929.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jzhwEicA/+FEleXe/jJDY44wX3xwpIGAwoMzBI7oFNs+7qYLp5w+006ISEAhyDa5/nZNpufzGeVc6L+Y9iMb/+uibRqZcyD6YKAH/p97n2QnmV1qGQNr0kdoF4M/Pt6okv7vKDB3q/Cb2/KDiszsHMqwI8VXpLzSgzt/R3QMCrtWyXB0SHjgqvkxtxBLuMS8l38Xw8Zrg0uZoU0jtEUS98g1ATifQW+epdSzQI6tfzzb1cmD0RzgmVGHi3UafThvwQotzQh6S6094U1YvSCmZoXc+jid8ZJPtn5lszPmXsDQ9/t5kPXDuii79mn8QDm85zgkBdTAc7mWqHgefyB3V0Lj9Eu2/GEWUIZy9u8Jax+pzFyOFjo91Hi1SAZFSfJu9tSI82VMSA3ltde1cPk3cgWoOhzUtULPRIcjgvc4HkQQ3xFuaLxdndl4EV10NVrqc4hv8+W2zibX4ncobND8eJ9PwjMFEKFy/sbLXgqsWUvxuG/9GcgcEefA7xNyTHaPjF+AZaa8sMTC6WIhvuDLGKr7AklO9uTMMtq3c1beHC+xDk+3A4Jglo4mHD1PL4WrlEvi/fl6H+c3Ru7VWpJBr0tUbPj39a+5oKnWoT4wgPB9+yOuAn1GN+8bL7KPLMYzBp+SlpyIiX9mfBhXtA1d/fwjC4LJi/D7qXN0zjpCFASs9Qtaa6f4sYYhB+qbEo0T/wCfGGQbFjlJK53uIRuWRd4myh7Xg2RWvWECXtNX8Cn3DhoMKAAV2FLG1csXaigs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(5660300002)(26005)(52116002)(186003)(2906002)(7416002)(83380400001)(6512007)(9686003)(38350700002)(66556008)(316002)(6486002)(54906003)(66476007)(6916009)(508600001)(86362001)(4326008)(8936002)(8676002)(38100700002)(66946007)(67856001)(473944003)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hqaHbubQL2+NOUvJc0unY04Dir0wnwHNAroPUHjxC6IdfCITXixDa+59a1?=
 =?iso-8859-1?Q?jPoX7PllNjcr+Qou5LIOtm4FIa8MKjUmRX4PDqvk5Te0DkdAxF+MV5x98R?=
 =?iso-8859-1?Q?SJQ5VePH5Ky2eEigXjAroqrSG9p3SoD0lQgJb3Z4dDKs5J+PKCJ9E51x+k?=
 =?iso-8859-1?Q?JP5ZEOJrybPg4m/S5rPB321E+KRGzyCTyXU6XIXq2HvqPAepSpyq5Pa4bS?=
 =?iso-8859-1?Q?x+bMkQGyGE4ZG1vILW6rUvA43KNBPm3ayAjsEHaFbiM04rIXxzvC3ycdNc?=
 =?iso-8859-1?Q?6h6G+uHWFE2xnVsn3XpqPbrt22eX+gOfCyIbaHlTlcdhsS2DRptbGAPPO8?=
 =?iso-8859-1?Q?5Svlrtr/QYPUWS0AjXKMbouqyo7ls8ScqGrJRZKNnRvD3V9c2trpD8PSg0?=
 =?iso-8859-1?Q?VpiLj6YjyeRbY1RJvGdPMeNhMQhEJ8SicZMkxjsPnNiZ+Ev7RFJHosWZO9?=
 =?iso-8859-1?Q?XWkF97Xv8opf8afQnRhJPjdwilWuW3Re9xR7Dru0noCpjb7x1wBtZT6aRV?=
 =?iso-8859-1?Q?HYLGDQaaoz4vqCaPp0itpDfJ4SPafvr1PbHEJTg/n6n/sOV5nwX5058Rgp?=
 =?iso-8859-1?Q?Srvf7jZNXSMEmP1cms0G/4ib1XpNptpOewDLXqLaxodOk3Y3Tvb8ejq213?=
 =?iso-8859-1?Q?UwW+KfBUTMveOE60c6SKzqeZV+bVZw8soCp6ZQQBg8niL8t8ffzSIRus4G?=
 =?iso-8859-1?Q?sK0lWZBry1jIVppoWdnyVFPctfEauZBxooS4zkT3c8hxh/1lF78KxREdq6?=
 =?iso-8859-1?Q?cTH2CqwxAcYXQfPNuAjJPIyuF/XNRuUpP6ZFFq0zR56KJAM1GPlRk6ByKy?=
 =?iso-8859-1?Q?lDqFHqrA2U0Q3z4/+ZzYcWvVdlsgQrYEMbT1z13c+67x249hBOzuyL4Zcj?=
 =?iso-8859-1?Q?t2IAsK+Km4c4BafljP90KQTnxRTlCkaa1Q77ZZDh34cRt5BIg/WhqoIf6k?=
 =?iso-8859-1?Q?adbol477/Wns0IlWQOl1BAlte5BGJCtH/Vzb9SyJEYpdjrj1C0T06oScT0?=
 =?iso-8859-1?Q?BnU1rzzRdvthDhUybaXlGCyxij/Et6Kq5z9gBklVnPquIkwkGGOX2GgpXR?=
 =?iso-8859-1?Q?/eiTFGCfOYgrW9v3yIFjCsN7GYOTGCrgz3Lc8bS1/fYFu6/zvQHMTTp8QN?=
 =?iso-8859-1?Q?KI1WHQX0gug4JbQ7Oem92lyuKY2opcOzcpXGJdJ15odc25/CsILT2LLIsq?=
 =?iso-8859-1?Q?8oS3GFDMyaKj1bNxxkvDgOy3Kj0yHx+Dc8of4r6yi2Qz9z2w0rZQQO+kIH?=
 =?iso-8859-1?Q?FbxnekQb9OPAWyuXlggRdF+57aCiuLmGuOtu5r/DwoBaB9P32beQUuYusC?=
 =?iso-8859-1?Q?DBJSrcWiFwIo+AkKH2TVX1vxIu/9h5GFH5adLbYw+ytRkKVF+YZCWddxYc?=
 =?iso-8859-1?Q?pDnwlo8ZwQZVcuIPiOaM4+/DIE5B2DqYpp1QadePzVynla2c44P591uc0m?=
 =?iso-8859-1?Q?bSFAgJi2JjItzALR8qZRGL0YIRwoRCwcw8MCadcCEQzYvyVp+epy2BjnQ1?=
 =?iso-8859-1?Q?kBnfKVTx/tFjo+EcgWgsTyqVWMNXrQFDySMtN8wVLRlKyKBOXvRtBpFkM4?=
 =?iso-8859-1?Q?VShGMDCyfLCW4Or3TaTTYZVM+6FclY79LcTjkwFMuBzU9oIffXtkGHsX2u?=
 =?iso-8859-1?Q?Pgb/i9ofCA3aNOpi+0h8Te54+jj32ZQxqvGfNHYcLM69J4zGYm9XmhTYEN?=
 =?iso-8859-1?Q?ywQdyAgjvWCzvfp0b472qakASTBIbcsxa5GuPAUluGmYXNlbivRIGoolFU?=
 =?iso-8859-1?Q?mveUIzjEhaOmUYOZi+5THkk2+gnCeTMcXbXUmeZY/fKQyMafHntif4LCHM?=
 =?iso-8859-1?Q?1Uf6BeOuUA=3D=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e2a434-da16-488b-39f5-08d9e5938b63
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 15:00:11.3468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q/LZg5Y57n7n/+7uIEcWDDhubjqD+rnXYzLL/54Q/1K8JZAmo2NO6lXtEwzOb0obniIBvj0nfcX7550JzN/xO4GFHRFs+g1nZ+m32CFyS3KR1+4Z/xt8iVwhW4RKkrW7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4929
Received-SPF: pass client-ip=40.107.243.118;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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

On Jan 24 20:15, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
> Message-ID: <YXCA62xdRDeueQR6@strawberry.localdomain>
> 
> ---
> [AJB] this was for testing, I think you can show the same stuff with
> the much more complete execlog now.

Is it true that execlog can also reproduce the duplicate loads which are
still an outstanding issue?

-Aaron

> ---
>  contrib/plugins/stxp-plugin.c     | 50 +++++++++++++++++++++++++++++++
>  tests/tcg/aarch64/stxp.c          | 28 +++++++++++++++++
>  contrib/plugins/Makefile          |  1 +
>  tests/tcg/aarch64/Makefile.target |  3 ++
>  4 files changed, 82 insertions(+)
>  create mode 100644 contrib/plugins/stxp-plugin.c
>  create mode 100644 tests/tcg/aarch64/stxp.c
> 
> diff --git a/contrib/plugins/stxp-plugin.c b/contrib/plugins/stxp-plugin.c
> new file mode 100644
> index 0000000000..432cf8c1ed
> --- /dev/null
> +++ b/contrib/plugins/stxp-plugin.c
> @@ -0,0 +1,50 @@
> +#include <stdio.h>
> +#include <stdarg.h>
> +#include <qemu-plugin.h>
> +
> +QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
> +
> +void qemu_logf(const char *str, ...)
> +{
> +    char message[1024];
> +    va_list args;
> +    va_start(args, str);
> +    vsnprintf(message, 1023, str, args);
> +
> +    qemu_plugin_outs(message);
> +
> +    va_end(args);
> +}
> +
> +void before_insn_cb(unsigned int cpu_index, void *udata)
> +{
> +    uint64_t pc = (uint64_t)udata;
> +    qemu_logf("Executing PC: 0x%" PRIx64 "\n", pc);
> +}
> +
> +static void mem_cb(unsigned int cpu_index, qemu_plugin_meminfo_t meminfo, uint64_t va, void *udata)
> +{
> +    uint64_t pc = (uint64_t)udata;
> +    qemu_logf("PC 0x%" PRIx64 " accessed memory at 0x%" PRIx64 "\n", pc, va);
> +}
> +
> +static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
> +{
> +    size_t n = qemu_plugin_tb_n_insns(tb);
> +
> +    for (size_t i = 0; i < n; i++) {
> +        struct qemu_plugin_insn *insn = qemu_plugin_tb_get_insn(tb, i);
> +        uint64_t pc = qemu_plugin_insn_vaddr(insn);
> +
> +        qemu_plugin_register_vcpu_insn_exec_cb(insn, before_insn_cb, QEMU_PLUGIN_CB_R_REGS, (void *)pc);
> +        qemu_plugin_register_vcpu_mem_cb(insn, mem_cb, QEMU_PLUGIN_CB_NO_REGS, QEMU_PLUGIN_MEM_RW, (void*)pc);
> +    }
> +}
> +
> +QEMU_PLUGIN_EXPORT
> +int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
> +                        int argc, char **argv)
> +{
> +    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
> +    return 0;
> +}
> diff --git a/tests/tcg/aarch64/stxp.c b/tests/tcg/aarch64/stxp.c
> new file mode 100644
> index 0000000000..fb8ef6a46d
> --- /dev/null
> +++ b/tests/tcg/aarch64/stxp.c
> @@ -0,0 +1,28 @@
> +
> +
> +void stxp_issue_demo(void *arr)
> +{
> +    asm(".align 8\n\t"
> +        "    mov x0, %[in]\n\t"
> +        "    mov x18, 0x1000\n\t"
> +        "    mov x2, 0x0\n\t"
> +        "    mov x3, 0x0\n\t"
> +        "loop:\n\t"
> +        "    prfm  pstl1strm, [x0]\n\t"
> +        "    ldxp  x16, x17, [x0]\n\t"
> +        "    stxp  w16, x2, x3, [x0]\n\t"
> +        "\n\t"
> +        "    subs x18, x18, 1\n\t"
> +        "    beq done\n\t"
> +        "    b loop\n\t"
> +        "done:\n\t"
> +        : /* none out */
> +        : [in] "r" (arr) /* in */
> +        : "x0", "x2", "x3", "x16", "x17", "x18"); /* clobbers */
> +}
> +
> +int main()
> +{
> +    char arr[16];
> +    stxp_issue_demo(&arr);
> +}
> diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
> index 54ac5ccd9f..576ed5875a 100644
> --- a/contrib/plugins/Makefile
> +++ b/contrib/plugins/Makefile
> @@ -20,6 +20,7 @@ NAMES += howvec
>  NAMES += lockstep
>  NAMES += hwprofile
>  NAMES += cache
> +NAMES += stxp-plugin
>  
>  SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
>  
> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
> index 1d967901bd..54b2e90d00 100644
> --- a/tests/tcg/aarch64/Makefile.target
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -72,4 +72,7 @@ endif
>  
>  endif
>  
> +# Load/Store exclusive test
> +AARCH64_TESTS += stxp
> +
>  TESTS += $(AARCH64_TESTS)
> -- 
> 2.30.2
> 

