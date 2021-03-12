Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E73FE3396F5
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:54:58 +0100 (CET)
Received: from localhost ([::1]:52494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmw5-0003dF-BK
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:54:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lKmcw-0005TD-60
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:35:10 -0500
Received: from mail-co1nam11on2131.outbound.protection.outlook.com
 ([40.107.220.131]:57697 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lKmcu-0008QB-Iv
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 13:35:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0FyN9OlijNk1segZkXJtsC+2x8d9zlK44vDoNXz1VKc+at01fQX/Lr3vD20Yz1T0aC1XPY7xVDwtptKDv93L8+0PKnl//NLv6scEM+mrq3jiQHUIVYsoxGDH8NkBbqWNgbj3l2IRAeIU6cwVRki59l8DKtaTpkTpeLtKer/sEP5EgE7ilhf91A7qlP+wdzWou+odLPzgW61tj4MVsCNhgoas27AdsC0BjG+g/k2hNRRj8rO6M6sIamL2GLI2sY6kuJm2jP8veH7unKAoc6uPeskbM7yLk3m7sizYBBYnGfFepsXEue1lorSFEImoHJpQqVdnAK9SGtt7IfdVLRftA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c86bWzA3RcOzF0Z18cygNBnFbB9mkuSbd2faRuXKxCE=;
 b=NG6RvT7FE3YiYGXGH5GxOQHfroQQmnaVsvPcvS4o89hnJz0gtWhAM85/riW96NkfB4S9to4K7vX52I1vFTULCFXwak9DYVSWlA+zJIlcLhRmrM0hB2FU7XXdin8ahHuXzj1gJBDvuEvTAV1FpTXMFRUWcGSyzJ5Z3xDFc/eQl6G1N32YVkAxfBErknMPK7sr5NOYAJJKbmX0LbDecACXEc7iK75O8Na8Kou+9AMShCc7umUjiL51CDBAgjxybs9wc3eoFWLYC196SmHK90E4twkzkTgWm1n5t6Y5fGCXpLeJv00itEX0pSfP3EMn0Y+LTu+Jc6Q1TJvgkwKNV1/EXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c86bWzA3RcOzF0Z18cygNBnFbB9mkuSbd2faRuXKxCE=;
 b=TctyeI/8V2x636J2rFuN8Fro9YjAftTMnM+oXkw+cyGHncd7ZVuLVorKLyLYADXhD+eUhHDOIZuknxLW73L0ymLGjcL6L7Sm/tf6vq5IunoDQSZakJagXEqMPzMBheNNnJXkLBT0qudDY03xMzELMMAruOoolKnGr1IKSc+jBeo=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB4895.prod.exchangelabs.com (2603:10b6:805:c7::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.27; Fri, 12 Mar 2021 18:20:02 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403%7]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 18:20:02 +0000
Date: Fri, 12 Mar 2021 13:19:58 -0500
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com
Subject: Re: [PATCH v1 03/14] docs/devel: include the plugin API information
 from the headers
Message-ID: <YEuwzuPskPPj+vs4@strawberry.localdomain>
References: <20210312172821.31647-1-alex.bennee@linaro.org>
 <20210312172821.31647-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210312172821.31647-4-alex.bennee@linaro.org>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: MN2PR07CA0015.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::25) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 MN2PR07CA0015.namprd07.prod.outlook.com (2603:10b6:208:1a0::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Fri, 12 Mar 2021 18:20:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75f119f8-e140-4819-ca67-08d8e583739e
X-MS-TrafficTypeDiagnostic: SN6PR01MB4895:
X-Microsoft-Antispam-PRVS: <SN6PR01MB48958A35BFAB3D305DECEDF48A6F9@SN6PR01MB4895.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7vthytJAdaUSsay8YC5DNu7QVn2fg7JoWsCzSy0buVuk14uWl0Q9KQyTaEyin2y3UDPRs5JTLAeYhHkv18OtbmThnkqpxLytWLMpexM+jxtFv1Pdv7deZ6b+9rVE95fFgl3hSkLzEAFuK68I+6nqIyyE5Anjmly1sPVXJsFW6ls/ynGitYGQkQJZK8fJKfavZcgI0epC0Ivf942LkRjV85Z27mIhptGYcsLFqPT8PuOQhJsK8QClwSjjBwS9V3/Pt1lO0dmY0VJKJi9GGYFPR/lRiIAxQSI0B+KU4X+xJgDdllcd4PImVeD7APIC+m1XyDn3OPmEIXeT5yNWUeG9bpybgTqaBEGIn7+967I9HXU1EBi+kzOsJPVS8chl39YWwBZrh9z56mrZBjzSGhZY6c415OkeR3H3z0pO9pRcCAiBebKfiXb4t5GjWWE5Z5noBAu9QI5efOJhX+nTVmm9wumOh/aBD5FPzbW9i1hFf5dvDfvhSnFEAqp6AAn6omE1hyQaN9QJIpDsnCTKkHy9jlu5jzRYP5Lo8q2tgkgKKw2s4VSc784krTzypO9OfF0mQBuV85g8ZgtQBKRlh5Jt7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(396003)(39850400004)(86362001)(26005)(5660300002)(6666004)(7696005)(478600001)(316002)(186003)(8936002)(16526019)(66556008)(66946007)(66476007)(8676002)(956004)(2906002)(34580700001)(4326008)(52116002)(6506007)(6916009)(4744005)(9686003)(66574015)(55016002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?SpNk17q7PzPJdeHi3IRnPSzxq3+hj0WIVWgaL4hMoNenIEk4t47WuC0+YQ?=
 =?iso-8859-1?Q?9YukmkAOXllCZOlZCvFCes2J3BZj9Qmu9S7TkPzZeLd7vlQCNQPBjB0VX/?=
 =?iso-8859-1?Q?WT3nuT1et5V0s3ljBTV1uq+HKs5GoJKqTfrUV7TsNXONvdlvgNsZTpr/BH?=
 =?iso-8859-1?Q?SvTOX2mPtAyBSRlXkq+ENeCqqKj+av4kJIl1NZMmmU5RDiDKUfD3qAWSoK?=
 =?iso-8859-1?Q?UzzdaXzaKwXMoD8CQJsuZO/3FxaOtxyqERCPQWoGp5/PAofCpNNKtwxPU8?=
 =?iso-8859-1?Q?r3moI9abog1wdBxxajc+vaqve/DX/GJa54dFgv335x8j0IO9xo2PXjhKbl?=
 =?iso-8859-1?Q?Vmu9n2YbYLSEr5LqE+VJxhwOfWsCHkby2KEO5yMXnN1MXdr0/NfMxr5oNY?=
 =?iso-8859-1?Q?ITNoCriQX+NU0wxKbQofHR0oYVu+owU7PlxbWO7/WNdU1XPZaGjPMO67sU?=
 =?iso-8859-1?Q?KDzmJfSwSwaDRGkLF5u9XvZFS01tkds6uhiYzKfufPbRerT2Us0jHFMpUq?=
 =?iso-8859-1?Q?x7+4X6z97pt0Ytd1ycoNHqPdI7ruiju3VamI7mVrdFiOzmNuYyE1AHuwJh?=
 =?iso-8859-1?Q?yugPLLn7bcwjkLr0brn26ywZoXRqgnwfezCyzykfkXP73w5LPJEhYHH3i7?=
 =?iso-8859-1?Q?42GjAcKS8LM38cYveBft2A4gPjZ3iAC4xftH1J1mFoUzLL4Rf6PmHBP7Fs?=
 =?iso-8859-1?Q?dS8lY+g1deV0L6DQgakd1M4+k1WNQRhiB8+0FajmAtaIFhws4UrLbkDHE9?=
 =?iso-8859-1?Q?+wSXV6tRL5dZx4yqWqMz5ekzsqW4rTitWwcIt8I/D1iYI4lOeM9KQXCm0X?=
 =?iso-8859-1?Q?4t9HL63rwjd+ykftEa60IHnZojrtO6SqAeOJYkfHefr977WuzgwHaguDJg?=
 =?iso-8859-1?Q?lzlO5izaNznhGSyuC/rU/uF7+yThEbrYHSaOBw55oPDXHqOWPhE4Ax25oT?=
 =?iso-8859-1?Q?Da0kDYtZPcLBfDgfMhhug9lANMRg3Mdw6vkcvMLXiM7ZuQYB/1HvIQb/Wl?=
 =?iso-8859-1?Q?RcSqkK1vGz42H5XXcrBwbFYCucEJocOiTROlB9zQRJr/MnrHRnmqaK7PqE?=
 =?iso-8859-1?Q?+7lId1g7XfgY74p2uTUMmOLK1BjatD75FgC2OMHCo53khyD3lQQGujmzEE?=
 =?iso-8859-1?Q?TuhluBb7+v96kdTFYJgB/MypT1Eh6KfSIUoFk4SuN1k0w3gXMwgE+DO0Dj?=
 =?iso-8859-1?Q?ca7lREZrjcaEZRVeFhCneTbgym/A4+BkBtQPmoX3RPVeyvvtNKBYXksMua?=
 =?iso-8859-1?Q?yD3rn/heNSiTSq4rhTGtQm57kCFD3sGkCFX/Q0tOIQ+uH32ltei6Jl/EDw?=
 =?iso-8859-1?Q?NRHJOQODItYankm5vyqiX6AORv4TsNVgLNPXEdwDaCPUxfjRoo0JRxU1Ks?=
 =?iso-8859-1?Q?F73JK3fBMt?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f119f8-e140-4819-ca67-08d8e583739e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 18:20:01.9146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uz1zn3HJEY6wu6sCdcEsYv6n01La39KKJJP3Ghd4NHAWPsep3PdNY6wN6V7ZHzrCK80yK8KkEu9/pL+D/virlhbs7I0N3B+NJXQ3DpaERDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4895
Received-SPF: pass client-ip=40.107.220.131;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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
> We have kerneldoc tags for the headers so we might as well extract
> them into our developer documentation whilst we are at it.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Aaron Lindsay <aaron@os.amperecomputing.com>

> ---
>  docs/devel/tcg-plugins.rst | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
> index 39ce86ed96..18c6581d85 100644
> --- a/docs/devel/tcg-plugins.rst
> +++ b/docs/devel/tcg-plugins.rst
> @@ -63,6 +63,11 @@ valid during the lifetime of the callback so it is important that any
>  information that is needed is extracted during the callback and saved
>  by the plugin.
>  
> +API
> +===
> +
> +.. kernel-doc:: include/qemu/qemu-plugin.h
> +
>  Usage
>  =====
>  
> -- 
> 2.20.1
> 

