Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25885339793
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 20:42:29 +0100 (CET)
Received: from localhost ([::1]:43858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKng4-0004My-5f
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 14:42:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lKmiR-0003P5-8K
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:40:51 -0500
Received: from mail-dm6nam12on2104.outbound.protection.outlook.com
 ([40.107.243.104]:63469 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lKmiH-00038I-Cf
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:40:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMXRkbi+kLEiDuSXhzo7wd4ikInrH4u7wOziE9RIjyA4hF5n266jk5GlQZBJKnWJoD8UW8vsSxG0FGbfdtRW6NPjeut60z7YguparlXa9dwg5wutqlmZcOlt8+X0o3BjIPg6TOL7wL+x/iv0XM2KaNI1xxLVKaP9Pvx+JShecyLp+9Nc1COR4vxUX/o/S8QWPqPjOfuC3CGC2xWF926CB+7KJ+6YCsW/Ezse34a0fM6g3LBk3d+qUbQsxmOWBdwx41kjhMIhDU6Y0CnGsI5cj1Sraj1+PaPzYQAhZLBVjUeqtpn+pImXOjtYxG+kyS0PW0UyQaXe4UJnTWj4X+Adnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7pj7GLjX9l8ZcLTS30qkJHKo8Zj+OVY9ADAY+dgwBg=;
 b=atdk4I/L034Xvywv7SD9JUhCGlPfb+Z9Yit05DcIaU6hnkEhXBq54mx4rOI/aXZQ+K5f7vRnTWldrieiasxBGZLTibYP6gj7qB77bJDqlC9eMzBD63DamGQR7jms6gcJkDZPwF7kzEyVF6O9Q2JKPRxKIdMkI9yVZmn7EBMIRiqIpmIykNgEpJZ+hBhykGM97Mg7ZnO6ujD74vLGgyLDJ8dy5fb2Lx7e5KjADNb0OspaJkoL+Ef/giPmjcMFvA64GLNK1AiyDz6JpE3T4jtZzCBDjgU5/2g8paXFVmbUFD64dl0Zg1eDCOfWFPosf/v2dRRe52bUpFXhj3JiZoyL5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7pj7GLjX9l8ZcLTS30qkJHKo8Zj+OVY9ADAY+dgwBg=;
 b=kDX0cgkI3Tt1Q7sqlum/6+cAaaXv4W/wvgLdaJ3x4WapTHjDJyrVXEMSuQwVmfgHYHRw/00ewPobQTX7g3LZtvm5cRvNVLq0ZrlBnqYEY4WR3cujUP6Vr1FZDWkcJzBFVAMvxAkjow/F0sGrxTVgrGt1/KPd6P2hKwMTvKRxRfw=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB4174.prod.exchangelabs.com (2603:10b6:805:b2::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17; Fri, 12 Mar 2021 18:40:36 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403%7]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 18:40:36 +0000
Date: Fri, 12 Mar 2021 13:40:37 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com
Subject: Re: [PATCH  v1 12/14] plugins: expand kernel-doc for memory query
 and instrumentation
Message-ID: <YEu1pd6Ko1OYat6T@strawberry.localdomain>
References: <20210312172821.31647-1-alex.bennee@linaro.org>
 <20210312172821.31647-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210312172821.31647-13-alex.bennee@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: MN2PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:c0::16) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 MN2PR05CA0003.namprd05.prod.outlook.com (2603:10b6:208:c0::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.9 via Frontend Transport; Fri, 12 Mar 2021 18:40:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 914e8652-a893-45db-7bfa-08d8e5865381
X-MS-TrafficTypeDiagnostic: SN6PR01MB4174:
X-Microsoft-Antispam-PRVS: <SN6PR01MB4174DA9F4714287528AD3CBF8A6F9@SN6PR01MB4174.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QOgLv02K9zsEKqE5dySxATVW5ZIPolo7+yAIjbiLrD+Mb7jS9N4puKnJriz8Ozx0198LpYyrd408/dWipMScJuAzrU10e9sx09WSbE7etavw4Rp15p6+Jv7FPC0grkKZW1/4hY2dCV6akpgLaWhIPDzykeCcUCnLFBHAHser8uSrQjeaDGxqkeNGAanCyS8klZIqT1BLruQJje94y/eQUqcfMp66L1at5AnDxlYj1H/p/hLTgoqA0bN14m+/msu5e9FSmT10nKTAPPn0dgYOMFu1VRwTrkgst6xgYpd2Z8O6k7RxQHvbKI4huQVQhHzFcZk+6OLNXnoLlIonf9x6KJ6YfKKjQHulmoCN72hHBMiThY9QDs7B9QJXwHO7K5BDFA0/6iMcgxcZlRUi6KVxZHIrNuUo1XL2lrcHmOjfr0944KLUY7sz+W6QhkCxhItWelwc+akReDlHPspIMu5NttC85ed8vV0pMgYgB6uCvd6ZUJ4CTw7SIpVdLwRpNDKEIM6aaHS5Xs6Bynd7gLqYt5iq3XmrFEmU+86FpiRcanyP7RCqAF7oAOiagNyK6NZTbgso2UtegbOlV5gFDFMpiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39840400004)(366004)(346002)(136003)(83380400001)(478600001)(8676002)(6916009)(5660300002)(6506007)(66476007)(26005)(66946007)(66556008)(8936002)(7696005)(52116002)(86362001)(4326008)(316002)(2906002)(9686003)(66574015)(55016002)(956004)(186003)(34580700001)(16526019);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?xCtuCj4Xdhw0eCEHski9r9IIK7uQ5Ig1qZnEQoJolS/t+K30GLbrw33Uyt?=
 =?iso-8859-1?Q?Ry8GikPqUP4qcwnPMCzUNT6kOcxIOeXBKmHlIpwXy81mNTB04xmo34E1Fs?=
 =?iso-8859-1?Q?8Wnl7uRLrdPy759lu4Nsb6mQ+TW4RIrbB9a3vXvYS3PC8XpDkKtr8AqsFG?=
 =?iso-8859-1?Q?mv8bcawFI18/DbscMOxQffqOnamac9M7tnFGobh4hBjn437ywkabFFokkX?=
 =?iso-8859-1?Q?vdoJ20hgGUOsUGLYSLXi6LgQmNJ4EbGFji7k17pqm8ZAK2Iy3Q1EmDchOn?=
 =?iso-8859-1?Q?vffLfhcZQPSpZnZ7m1Gsn66WP3GlcI3XimDIPNhI102G7vJJiawpCGcKKv?=
 =?iso-8859-1?Q?MMyjNJqCyYnLu2ttluhS+ix3yF1s/+cLcdI2CCGO9yaI0rmBqrB5kK1bUw?=
 =?iso-8859-1?Q?6CJa+S7WxwnNZUjNBU96aTOyHvCXgBaNEkGga5NWLxX2g4HvRILHUqDnib?=
 =?iso-8859-1?Q?jsbvE0b36c1i0s66cHRP+Lbly4eY7a7i8jTgZXNXVL2bXgBSYNPF8laTwN?=
 =?iso-8859-1?Q?TBH4kI6zauE5YwQChlcImwq4+fLVRKjwwLpk8pDozhf0cnPW048Z9jvj8S?=
 =?iso-8859-1?Q?HaujeGIq/MEDybQiW5zBsGXBWDfYP1dgUL19/gslq1rWcCdAQCW/KjhWhu?=
 =?iso-8859-1?Q?Ktnm7/byVZyWbgfWvaal6OPxs3s0QECFxECw1spQUJKTKgHO/ac8h0K3Ik?=
 =?iso-8859-1?Q?tExvzNXtF/zpxtcT6VmAkt3oe5jElAwMv1WW7LagkYRIVef3hJPy2xaqQ+?=
 =?iso-8859-1?Q?B4E5y7YDs4E+lY3/vEB7VT9k7+OvJjxEtNlVHIJd+qpIpmp5Lun4UVk7AP?=
 =?iso-8859-1?Q?FW8ONTCVsDKDJjbGOiJCrLjqPQAt+uyItRthdXu7hgXXrJMoKAUgSqNed8?=
 =?iso-8859-1?Q?xuH20sUNyoJ8BvDvzFoJ7NFEnlBUvxVT5TYK6S1PFb0dLSCdzjBffV2EfR?=
 =?iso-8859-1?Q?Ii8c1vPHQube9jNiJhocKhR1SjOORzRaimfi8Ddf6XKVggL5iDqD9Prg6z?=
 =?iso-8859-1?Q?c8Gqki8/mh3EudaxAo4NiX5576Zw7wuo25xeA3qd5mC+b2bTUTcs/INVOH?=
 =?iso-8859-1?Q?c94oMRv+ENnJrzSJPCQ/R5pjymveUSScm8+HUTokPd6S2C3OfOH+AIg3nl?=
 =?iso-8859-1?Q?xNCzaKItUa3RbG2cuRhf8SkBbjD1YmruBFHpND3GD5i6dWhUARuu/tH40i?=
 =?iso-8859-1?Q?V+bpMZtSGp2Td0NMofnhFZLhzHlS/Of/UCikkgOl7He2DP2GtP9oqSARHk?=
 =?iso-8859-1?Q?FP5UlUzzlf4v2ubRiVUxLnW1QJ4RRbi2WLZn8qPW3vKvI95yBL7OXZWJzm?=
 =?iso-8859-1?Q?zBduXowPk5IAnrMPLzGjmWsg2kZF3G051rovJaemyQg2ucn7O4j1AHjsiO?=
 =?iso-8859-1?Q?ZM3q/zOku6?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 914e8652-a893-45db-7bfa-08d8e5865381
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 18:40:36.3287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZGEPsx4WhmltyP+BaQ2K31NlZMvK8nnWIyJc2L52QlaoVSchAeA1yJ+XaSvv1Qksr/1irRBcnR4NSWP0y1A9QGzb25GhHSr9kRFhvf1xtOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4174
Received-SPF: pass client-ip=40.107.243.104;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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

On Mar 12 17:28, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Small comment below, but otherwise:

Reviewed-by: Aaron Lindsay <aaron@os.amperecomputing.com>

> ---
>  include/qemu/qemu-plugin.h | 35 ++++++++++++++++++++++++++++-------
>  1 file changed, 28 insertions(+), 7 deletions(-)
> 
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index d4adce730a..aed868d42a 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -392,24 +392,45 @@ uint64_t qemu_plugin_insn_vaddr(const struct qemu_plugin_insn *insn);
>   */
>  void *qemu_plugin_insn_haddr(const struct qemu_plugin_insn *insn);
>  
> -/*
> - * Memory Instrumentation
> - *
> - * The anonymous qemu_plugin_meminfo_t and qemu_plugin_hwaddr types
> - * can be used in queries to QEMU to get more information about a
> - * given memory access.
> +/**
> + * typedef qemu_plugin_meminfo_t - opaque memory transaction handle

Would it still be useful to include the types of things you can do
with a qemu_plugin_meminfo_t here?

