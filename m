Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8AC33D578
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 15:07:11 +0100 (CET)
Received: from localhost ([::1]:36264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMALm-0002Bp-KY
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 10:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lMAKH-0001c0-DV
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:05:37 -0400
Received: from mail-bn7nam10on2133.outbound.protection.outlook.com
 ([40.107.92.133]:9684 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lMAKF-0007gR-5K
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:05:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJ78//p10IA6+00xCHB3CF1JQUuD1i6EMXk5xf2sOyg8Qd/x/EwGhwrKGXnCgVr6fwrziozkgpbx3xSNHGcqsh85gtDKKGSazdKfRIWIXiNkvPiLA9u/e6wGnPVlczHr5k4OGZazdTD3iXPrRv7wjk3popVfSmRKrjnhM1GMwK3Miq8NBphmB+vEbavIcFAo6ZWw36fIa4FXybyxZozoMTuMsBifpv0ZdWBc6BKae59kXMd321TWMfGVYiTKjBg42Dd0AKkvb0b8A8oRDmxJbaS2UcQelG3tma1GQKVC8W39bgdaKUcVcbsGAk+ylXO1JOyIIDj1TakMnISLHihrkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLE3CyaIv8BsX7JdOgCx5PVtWO9yL4NEFlW09ucXhLA=;
 b=HT4piuB4aHTZr0oC71u6cUpTKilz8LAi6dk2J3E3Cu1uxMdRlAfLkbm0F0HarWqGgcUeVqASQ+A/Jr466v+H+hPvk+mbUSfImC90apRbhPkNCP4ipZYRoZQ9uaV4d5ZHG+z5fbmyffaewQWvuVY/EFZGnkVDoPtMXYSAl7cLriCBKCbLHPkPHnMqPfX74pqA1uyfl8CshWNmMo4SF4a2QSIsR36lDoYmwykOYGGMn/trZ33+dFYMpgpdjKRddyQ0YNUCHVdIjnfrUMBCJQb4akl2eoaPohhuQDCSRXXt2cbtQbD2GcsC5gOhnkxw+gEzwNGbzZ0C2drXMcw8Ssy2PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLE3CyaIv8BsX7JdOgCx5PVtWO9yL4NEFlW09ucXhLA=;
 b=gWVH382JMe95BxH1g/BRHYay6hkuJTQeYidw0Nk3CJc1qqIZgBYNTKoNknKzxfokLGCgB97aB1D6lKZh1hCe4irEEP3jYkm4V20kr7cqW6hE2T3vJ9x2xkq1fjqq1IBQv+uGyoCAH4k6HcW/WdS77AYzQYa6NZEHR0FgHQf/OfE=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB4174.prod.exchangelabs.com (2603:10b6:805:b2::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32; Tue, 16 Mar 2021 14:05:31 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403%7]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 14:05:31 +0000
Date: Tue, 16 Mar 2021 10:05:27 -0400
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com
Subject: Re: [PATCH v1 08/14] plugins: add qemu_plugin_cb_flags to kernel-doc
Message-ID: <YFC7Jy7om0G7SpzY@strawberry.localdomain>
References: <20210312172821.31647-1-alex.bennee@linaro.org>
 <20210312172821.31647-9-alex.bennee@linaro.org>
 <YEuzC5GYBwpef05D@strawberry.localdomain>
 <87blbj8bbu.fsf@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87blbj8bbu.fsf@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BLAPR03CA0036.namprd03.prod.outlook.com
 (2603:10b6:208:32d::11) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BLAPR03CA0036.namprd03.prod.outlook.com (2603:10b6:208:32d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Tue, 16 Mar 2021 14:05:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0eb5d684-dabf-46a6-783e-08d8e8848fb3
X-MS-TrafficTypeDiagnostic: SN6PR01MB4174:
X-Microsoft-Antispam-PRVS: <SN6PR01MB417466B9D57AC846554939D48A6B9@SN6PR01MB4174.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J0/Lz/XcPoIAMOC5/nL55fSAoaOEVZ7ZoSWWULT93c5hP3G9JmomMWhFItR7gRdr8l9LzLNWEjcLbcj/X4v6kW13warqArS1eO2zo+11D30VkM0M1d+Hr1muFkvuQSofBcFx6YW1YSFJ0j9oKOqABSy4+wDea9buP/BYqYn7kkCBKsgSFhnZhDIlK7ajHOR0h1SY7JDtz9XCOnQzBroBIIFnhrEwO02bt7+fODcm5fv1gZc4MNiYJh/0QscWnYmz0FD9uKiyfs9HDWagD3mNthoH0t/11qPxd9CRqZkZFv0CGjLEtx81C1Luvn72z3gUzlpDdN1h4j/rDDpFcg/8qe0q8xBi5eOb+SUQWyrnbR7ffUl9HlNllb1OJxNHFgVU2TOg36CnWlRP57OYCvC/8EPu9NUbEOW3kcrXcOfZn6GnS18XhB8AOEnK3F95zeSx2DaBcNDlKmROkVzlNPPynYMbjWyRbN9/sT64hm67CUy8YY9z7RAU2HzUXWsVJKFTNQq8tFznf+ZF1zTef+71T/vdL6kaRe1RzMfEPwzAgUNy6jrTEIrKQnJ5fPEVKcfg4xeucAdAwCXVwsb3xlgOlQs6/2s+yd/xl/U3zhVLdHMJX1/Bt/8bggjSmlRIBEjs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39830400003)(376002)(396003)(366004)(66946007)(66574015)(26005)(956004)(316002)(9686003)(4326008)(83380400001)(478600001)(8676002)(16526019)(52116002)(66556008)(186003)(6916009)(8936002)(7696005)(6506007)(66476007)(34580700001)(2906002)(6666004)(5660300002)(55016002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?rxLZMTv4fkSOQGDtg+Wt9zEme0nP1qP36m4z6ofXVetwnY79AjeFnu8Cua?=
 =?iso-8859-1?Q?9i4l+VoP9A78rEhwjNonShzS28oP6WG33AWsdN5t/SjDa/FVblqWPa37Yw?=
 =?iso-8859-1?Q?+Pp/bAzVsLufkjW90zhOW3T/vRBbWzGfoIvyUe/DTqrKppz+2/wbufgIgF?=
 =?iso-8859-1?Q?9RuyRuIbKfK2wc9RAf+UgA7l4SqBVFI89/G6jtmiuLLjiYwHtfGZNuHEYh?=
 =?iso-8859-1?Q?QMrn+2epHTF7BS+xUJCWoL/jAkmEz59BCH2HsjqXhQwsvkmhdknuA5K5tP?=
 =?iso-8859-1?Q?tB/ZkIT2EeQqb+NCQogsLwK4Vh8uklV6KDS8OduyJKE87PJYojhPjpWZiE?=
 =?iso-8859-1?Q?nbN7ukdAfv3Q1fjt6zmGlA+WCrdSnqjXywBVX0rvRl9X3SJjqiwjjzIME2?=
 =?iso-8859-1?Q?l0XJdAcrr3STRnQUuE+CZfhdsYlShwzcRQm+BpVCsNxTMKc2DliZoB8eWB?=
 =?iso-8859-1?Q?rW8iVe0NleCgO6aAKnKOWq2G6lQAwicOVhewz5Fbij6KmaThxoStearmMx?=
 =?iso-8859-1?Q?0InMhO4ZyajeL1l9zJZHkiBlfd7ivlYpk1lH8qTviKpXLFo5fLJbkcZj2W?=
 =?iso-8859-1?Q?VSHFfJddZwuV5uoJDWxV17lzTOyIfAhgahtMxzt/STzisHv3wRYZMcpPSH?=
 =?iso-8859-1?Q?VQjwQz1u4AnQmcG9KVnapRfv6YJaiF8Ds4TJ2PHo/5hGvPg/V1QcmiruZD?=
 =?iso-8859-1?Q?9g5Nfv0/U1e2QlOlPiD8KYG4XYJIQZQcSo8/geApr8LXucak7U78wlvKgx?=
 =?iso-8859-1?Q?I69i4PA5Vkqu1QY5KZOIg6scNl7+wVWqtSeqJpl+XhV0QuCa2Dd4hGUVMo?=
 =?iso-8859-1?Q?0TpJNoFkG8C8+jHI/fEvR33ENXivfMjnfbimPKHqvCb9Px6bZYFX+DFxzs?=
 =?iso-8859-1?Q?XdCqwVda+NSOLp4qLozzcI1WdrCmMm2L+qXEVGY68PdMnACGfSL15KJ/J0?=
 =?iso-8859-1?Q?lFqhpcrPBRKP+WGOdMTQWv5Nss236Gsk3/AIesCeNul9E+CEwP0k8t8Pib?=
 =?iso-8859-1?Q?CEo7/OKJqOZAJsS4bE++nBeDeKE26PspDlseEAzQURcGIk+OIc0SDqk9hV?=
 =?iso-8859-1?Q?91j6nLtH80zO0/YsQiedS5ridtX+PYUY2EWDFui8saRFmAoyxVEHZL6WLE?=
 =?iso-8859-1?Q?55nv2uaCWlp+RbymMCyF9uQBfF+K39T8ALcvN66bQNdb6VPG57qOouhva6?=
 =?iso-8859-1?Q?2iOOQfCAEOVC1K5IR1/8kOzCrdX65goI0ZM/txRPBujZHgTeiIQd8TQGns?=
 =?iso-8859-1?Q?+TEQObrqw9j6frkOgUD/CF2qa1oBJ6Rhew8BZYPiCZZxQHEtMQQ43QvspT?=
 =?iso-8859-1?Q?noP08pYYmCZ1vo84RLD8uddQ41l8ejw9Rj4Y4igrAcA25Bkc1BMWhYkVSS?=
 =?iso-8859-1?Q?7ojEskCmVC?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb5d684-dabf-46a6-783e-08d8e8848fb3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 14:05:31.8445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYQsQHa6DPIn9SqYjvxPMAEYBe1n6QASJRQC/hFByfc8eafS08ZoRQajmUcaS6K+oCaBeTgFNL6m78/bQ/MtnBpzrqyNmKUsgeBpk6Dn0Wo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4174
Received-SPF: pass client-ip=40.107.92.133;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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

On Mar 16 13:40, Alex Bennée wrote:
> 
> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> 
> > On Mar 12 17:28, Alex Bennée wrote:
> >> Also add a note to explain currently they are unused.
> >> 
> >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >
> > I'm personally interested in one clarification below, but don't think
> > that affects my:
> >
> > Reviewed-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> >
> >> ---
> >>  include/qemu/qemu-plugin.h | 16 +++++++++++++---
> >>  1 file changed, 13 insertions(+), 3 deletions(-)
> >> 
> >> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> >> index 9ae3940d89..c98866a637 100644
> >> --- a/include/qemu/qemu-plugin.h
> >> +++ b/include/qemu/qemu-plugin.h
> >> @@ -207,10 +207,20 @@ struct qemu_plugin_tb;
> >>  /** struct qemu_plugin_insn - Opaque handle for a translated instruction */
> >>  struct qemu_plugin_insn;
> >>  
> >> +/**
> >> + * enum qemu_plugin_cb_flags - type of callback
> >> + *
> >> + * @QEMU_PLUGIN_CB_NO_REGS: callback does not access the CPU's regs
> >> + * @QEMU_PLUGIN_CB_R_REGS: callback reads the CPU's regs
> >> + * @QEMU_PLUGIN_CB_RW_REGS: callback reads and writes the CPU's regs
> >> + *
> >> + * Note: currently unused, plugins cannot read or change system
> >> + * register state.
> >
> > They are unused in the sense that the current plugin interface does not
> > provide a way to make use of them. But are they completely free from
> > side effects?
> 
> They are free of side effects visible to the plugin. Under the covers it
> uses the existing TCG_CALL_NO_* mechanics to ensure that register state
> is synced to/from TCG temporaries before the callback.

I would currently find it useful to have that information included in
the documentation since there is no register state exposed and I am
basically hacking something together for my own use in the meantime...
but I understand that is in tension with the general philosophy of the
plugins to not expose implementation details.

-Aaron

