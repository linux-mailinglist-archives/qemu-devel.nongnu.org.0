Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89776340AB
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 16:58:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxVel-00067t-6G; Tue, 22 Nov 2022 10:57:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1oxVei-00067k-59
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:57:52 -0500
Received: from mail-mw2nam12on20727.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::727]
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1oxVeb-0004BF-Cl
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:57:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJdeRq9IZH5zMUOb/PJeIEcabphaj7Ov0h6/NiQsOj5Q2oAVPEcIwQBRmiXV4Op2/CIMnzspwZ/5LD0YYHpVWEk246Vlor9Vpxn2GJSDiLSBMtpmBnDishwnpye2FVzuycJvTVdHBEnO0KzOpWAgfiyElWiIwqh7rrCkoMqSy0ZPFOsWwbUPZIGG1uU3J6+n5hVON4K60hTMM4pJaNvoDT/rxJrGMujy2EPpsFi2aMFEcA7fX7To+Pz6yJbnS72HIdylYc6gM0UykgZuLG/L20FUAn5i8h+pAviy9YSN2OVzaz5GpzSEkreQrkvpZ9NhEVN+Cn1n5EeYN5zMHOTjzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLWHnr63Ur2ZjeAP2biVyQr3r5WTYgIaX1xbb46AdG8=;
 b=npzgGwchDiwgVMyUBFMkb2VKq1etwItFlwJJFN2IR16DYXtEOly7pl+I3+lw4wGbVONjr6d2gPyBE+VJ2pmJ3Dlhm9IOCcFktT+v8oaqGbshw359Crb4CXmdqWCWr0DyCC9+zK5LrZkQNLHrEDMhkgjm6EBZjJzv2zLrL4oqxcOlEedU8AzPajpnnu0iVJqN/+diOQK4uS7W8xgUKlH2Zw/Q7GJJQj4jeJVE/jX91OcWumiRSFPT3oEQUmmv/ASz1EStMseh5n7zyf17ZkyKTAp0ycAUfog7uM6bOTdFnLGe0UXIIlUKDhZ0o44VCu6GjYAgoWV2Pss/nFHjkAS5tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLWHnr63Ur2ZjeAP2biVyQr3r5WTYgIaX1xbb46AdG8=;
 b=ZAhuWWD685MQTnNy7Hbzh7ERB+raiaZ4NJ3ZzRYdhr9slf1rR6+V5ykcV2fy3/0KmVo7XdLawss4gTk/6a5Q3TnWxtMht7oB/VvskjfqHHouFJ+G9leK0goUkR8UIWKvkEz4XJNa3CIHxbS272EwTH3fy/WB1VSSvxmPc/0Z3+E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 DM4PR01MB7836.prod.exchangelabs.com (2603:10b6:8:6c::9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.15; Tue, 22 Nov 2022 15:57:36 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::607c:1d6c:d30d:6281]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::607c:1d6c:d30d:6281%3]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 15:57:36 +0000
Date: Tue, 22 Nov 2022 10:57:15 -0500
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, "Emilio G. Cota" <cota@braap.org>
Subject: Re: Plugin Memory Callback Debugging
Message-ID: <Y3zxW/vFsxCuDFW+@strawberry.localdomain>
References: <Y3QNRWUK8BLRQlaQ@strawberry.localdomain>
 <878rkbalba.fsf@linaro.org>
 <Y3vdIHJrR1k1lmf8@strawberry.localdomain>
 <871qpwc6i6.fsf@linaro.org>
 <a0eae94e-eafa-e206-be32-e2ce58e466d2@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0eae94e-eafa-e206-be32-e2ce58e466d2@linaro.org>
X-ClientProxiedBy: CH0PR03CA0071.namprd03.prod.outlook.com
 (2603:10b6:610:cc::16) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|DM4PR01MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: 70801b72-5096-4928-7897-08dacca245f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KExotei2XWgrxmfW4gvZoh54qD1/z9rQhLJDlltLWJMeFSLtzhkX+eiKNG6ogVOJI91iHeI1FIClVYxrDb19gFaKK5Fs7rYsYFiJFseFhOJItrqeoZSJUsam3v17FTiWhM06uTjJNaKZGFiu1sni5XpHaqoxnGUNCBvD4V8M+uvtRa9eLI1d69oZxTGwmg/NPqpX4Xb69k+lVH5cbo0w4oFp6R8PcpMw3mMdy/aLdO6+NuXy/ySpnqBT0/OZxSp54BXMI6193m7I2U3pVBryKdgMeuVgSPpuGfnWCo3wH/Fj6AdG49QjY33MNAVcsg0kxW8d19bSJtAfLVdQ7fZK4ZnAM4OQONM/IJ4yTHSCmpWjYK0dQ0e+IEhXByQExXogno1eZgB332vjMKTwrHoWpLpCJaNaaxjSKwuyy5w1Hp6NPwJ3bSQh2I10aJBAv+Z0mYikz+VKd3fKBaNNxmWGuEj48XFnAyeetK8h2x4/+tjMaV8hiJFXYQXPaYhmpE1e6Z9XE827ISG5zCKTvHXxrUL29INTvY9yon8BdLcVPGrlvzHBPos1jzeVYrH66vQJPE/ULqz0xxBnYd3h/uPDu5NOPp4ZHnze2VFn7OYk1pvyOOtCcIiPDOn2LPCaIKP/6B73hqk04d0XN8a0Im6P6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(39850400004)(346002)(136003)(396003)(451199015)(86362001)(4326008)(66476007)(8676002)(38100700002)(66556008)(66946007)(6486002)(5660300002)(54906003)(41300700001)(316002)(2906002)(6916009)(8936002)(66574015)(186003)(3480700007)(83380400001)(9686003)(6666004)(478600001)(26005)(53546011)(6506007)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ntPa3xhNfvw3MXyDI3hBT6xKae5JbtvnI/3MZpGn0Vw+TKeea72CVJmBqV?=
 =?iso-8859-1?Q?8gRrajb2FCCPr+x1I3yLR3ooyzdpdCsF9iBfQnKwjZp+XJDXdlqsSLr3Uv?=
 =?iso-8859-1?Q?tJeh0l+TkWhZBVCSyoQKz4BYDfc22ERsglu9XnVGhxaOd94ggWjEJYSCS0?=
 =?iso-8859-1?Q?3fMkUokyhYcsSs9rtBwCV7n+I43YIUEMIIo9cpkvj0+jI4lbDTE+nZQDOJ?=
 =?iso-8859-1?Q?/TvaU39o7V1GWtV1zQJaB7ytwYjskMooT4iJEmtzZngzGpj31/aUTDdhfk?=
 =?iso-8859-1?Q?W0yOcjNTsDoKwABF2unrDMNdAsMafMh2bUsEsGH4jgGMoV20rkAWDs2oFG?=
 =?iso-8859-1?Q?odB6ScUl/D+6Qf25hLjCkTkusr+iXWSProSCbbaAz2uLbT1TMhxa4RQ3lH?=
 =?iso-8859-1?Q?h6bBGwksIBgIaxUZen9DtKyQ3tIQiPG9oKiNc4OErdY7YIWbMlhRABTWgs?=
 =?iso-8859-1?Q?fKthFc5b5GVyqB8S8ecBKFF+KYEKwZ+RJ9apHMl3YUbKXBlw8/sqbV/iqb?=
 =?iso-8859-1?Q?TMDlh8sWWfGbVqh4a1RzvI7GmtNouEAjtzFuTjtbNOGIzEO5TxsT0A45vi?=
 =?iso-8859-1?Q?m+gk9pDLWN3NnPDaiC+I4RKw+YDcj6CzxRERuSOx0tKwi3ywE6r5wUcXbe?=
 =?iso-8859-1?Q?eMRlC5qXzI5MCM4911FLbokb4jktvLfiMWzYMu1wJZx+d+tDUshGRrKe1G?=
 =?iso-8859-1?Q?Ah87NsSgjI94vWcu1NuYofygc4tOGa4fwjKZ1Hci02wMnDl7dtnlrIoATu?=
 =?iso-8859-1?Q?lm7Og25gjhY6BbB6S9jSz7Yfk6FlhvVR6pEsYeivYiLY0iRjK2VyhN4Dcr?=
 =?iso-8859-1?Q?aFrsgJBpo/SL/CYof9iYjuV+nhisL5u6uk2/Q/IqVOzNSiBMPv5NCNTfMO?=
 =?iso-8859-1?Q?QN7wksi4k0c6CHZAT0XL2GxWbRLvTKdrrRMIlNylQQ4Xi91i5sG6RbBk1J?=
 =?iso-8859-1?Q?0v0k+/6zXeDhJ+lCzwt59Sck4HAtS7twnQ9q9FiXNlzNSaALkXV7JziGLj?=
 =?iso-8859-1?Q?Cxi8VlhfaMB+WruWwg1k/2vUvp0c0taHtmHz8mjp7kmemaTNkBwHLMVKRn?=
 =?iso-8859-1?Q?Q7Lxp5dbjID8Qi10qOtVi6gSUaWrPzCnTCn3GH1dNJ4kXXH1psYxuFdi94?=
 =?iso-8859-1?Q?w54VX6YrowpDtZX0RQdiCy4Eo464TcjscmWru4saf2+qRt/+mofpGOIe2O?=
 =?iso-8859-1?Q?NrrLI6KyYBBHlEnGiIrtImLpEPI/jDWvPsx9qFaibnO18gO0J9cFw+SW7U?=
 =?iso-8859-1?Q?zJMQtMmuT/hySbWVta1tgfkhzm5ZbNm5w8EDaJAv+RASwZCbyfMf6eK1Vf?=
 =?iso-8859-1?Q?bffOB8q92jOnnOEw5JGK2FGvnDdfGVjSqkspzrefKW3Zu7V4WBWGFGgAEc?=
 =?iso-8859-1?Q?Yap5QBaUtc6VLQzuJ78B8Wk0vvs7tUK+16v7T1ltDk5V1lb9AoA70HxPuG?=
 =?iso-8859-1?Q?nxLyqLqhS8kXaQ5LtT3aG7zN+VhpBF/e3Zk1nq8YP5xXKxzTvgwPsY7jSy?=
 =?iso-8859-1?Q?LVRZlLVke418Hu/MOLrO94cfz299EHkBaRiIw9EYlwAqyq3ccFjyk0DAHG?=
 =?iso-8859-1?Q?S+jYUkHg9YpHGfSr5dcf7ldc9UQOzhMG72WUIyolEAKIPSgcwf9SVb8ZXl?=
 =?iso-8859-1?Q?VoKR80ii55SG8901Rli/aZ0ghO5LlhNrEvYRC0z8EHT5qUTdYQDtGyEAtY?=
 =?iso-8859-1?Q?0GnVm8wPgP/ifWWEWG4=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70801b72-5096-4928-7897-08dacca245f0
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 15:57:36.2126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eNE1uwzDB84A4OFhI5PveoceiPbAa985r32r7JxKMq8UtJXWjbA4jfYyrLQBOvAsytGYquqv93L1XthY02drlCv5RLzzZedUXVCfo++gQHKQPH5cFHgyJo0QvvwXslho
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR01MB7836
Received-SPF: pass client-ip=2a01:111:f400:fe5a::727;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Aaron Lindsay <aaron@os.amperecomputing.com>
From:  Aaron Lindsay via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Nov 21 18:22, Richard Henderson wrote:
> On 11/21/22 13:51, Alex Bennée wrote:
> > 
> > Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> > 
> > > On Nov 15 22:36, Alex Bennée wrote:
> > > > Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> > > > > I believe the code *should* always reset `cpu->plugin_mem_cbs` to NULL at the
> > > > > end of an instruction/TB's execution, so its not exactly clear to me how this
> > > > > is occurring. However, I suspect it may be relevant that we are calling
> > > > > `free_dyn_cb_arr()` because my plugin called `qemu_plugin_reset()`.
> > > > 
> > > > Hmm I'm going to have to remind myself about how this bit works.
> > > 
> > > When is it expected that cpu->plugin_mem_cbs is reset to NULL if it is
> > > set for an instruction? Is it guaranteed it is reset by the end of the
> > > tb?
> > 
> > It should be by the end of the instruction. See
> > inject_mem_disable_helper() which inserts TCG code to disable the
> > helpers. We also have plugin_gen_disable_mem_helpers() which should
> > catch every exit out of a block (exit_tb, goto_tb, goto_ptr). That is
> > why qemu_plugin_disable_mem_helpers() is only really concerned about
> > when we longjmp out of the loop.
> > 
> > > If I were to put an assertion in cpu_tb_exec() just after the call
> > > to tcg_qemu_tb_exec(), should cpu->plugin_mem_cbs always be NULL
> > > there?
> > 
> > Yes I think so.
> 
> Indeed.

Well, the good news is that if this is an assumption we're relying on, it is
now trivial to reproduce the problem!

Compile some simple program (doesn't really matter, the issue gets triggered
early):

$ echo "int main() { return 0; }" > simple.c && gcc simple.c -o simple

Make this change to cpu_tb_exec():

> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 356fe348de..50a010327d 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -436,6 +436,9 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
> 
>      qemu_thread_jit_execute();
>      ret = tcg_qemu_tb_exec(env, tb_ptr);
> +    if (cpu->plugin_mem_cbs != NULL) {
> +        g_assert_not_reached();
> +    }
>      cpu->can_do_io = 1;
>      /*
>       * TODO: Delay swapping back to the read-write region of the TB

And run:

$ ./build/qemu-aarch64 -plugin contrib/plugins/libexeclog.so -d plugin ./simple

You should fairly quickly see something like:

> [snip]
> 0, 0x5502814d04, 0xb4000082, ""
> 0, 0x5502814d08, 0xf9400440, "", load, 0x5502844ed0
> 0, 0x5502814d0c, 0xf1001c1f, ""
> **
> ERROR:../accel/tcg/cpu-exec.c:440:cpu_tb_exec: code should not be reached
> Bail out! ERROR:../accel/tcg/cpu-exec.c:440:cpu_tb_exec: code should not be reached

When digging through my other failure in `rr` I saw the cpu->plugin_mem_cbs
pointer changing from one non-null value to another (which also seems to
indicate it is not being cleared between instructions).

Does this hint that there are cases where reset cpu->plugin_mem_cbs to NULL is
getting optimized away, but not the code to set it in the first place?

-Aaron

