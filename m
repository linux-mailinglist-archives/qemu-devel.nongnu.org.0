Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A090331862
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 21:23:59 +0100 (CET)
Received: from localhost ([::1]:47192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJMQ2-0008Kn-1T
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 15:23:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lJMOo-0007ty-2W
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 15:22:42 -0500
Received: from mail-eopbgr690116.outbound.protection.outlook.com
 ([40.107.69.116]:52591 helo=NAM04-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lJMOh-0004jq-Ro
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 15:22:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DoQ9uxeWVafThxPFF2ENh4a/Z5fQEWP1X/RF48W120cOFyhqJA6sMruC1RZg3EIVAykfs9ovb/KFCxsWUhN3oF+xgww9MHHZoBOaBSLXd1aDt6QKH3h4ebxozq+6nDKR3aU8qefzxSEbatj9QVQRPD4P/7gwlzDXRHrMzc2z60MK60wFrt8Psg8DnEdP3Qd1Z2wKGtKqBpNaoqjs2pzSRXhyu0O6Zm39CglVhdBQENiIp7yxwVLAJ+O7BuJkR2qqKLyVB3pOiIMsL8PTas9SM2YHjSmjSmcelUVh8c870QBkk+CV8BwnIRYq3RCtS2aId9NNb1jgpnmuARk8Gp83Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rBXtTmvaL+PsP+roF6nreZw4k+SV96KKyr2N84gjMw=;
 b=TC4+no7KPQARgqWubGz8gOdJYOdzpQajZflW5tO99ArWAR2MljPBgMtthKkJNBU423BKQHCW01/Crq/zMIIwZEF7mKz/99jC7s17QEOxhbF0eLJXfoM0oetBHA2vvrnljViqQs5Jh0drj2gwL5/GIM9rmS7l5CUTMoKqFfXfjgLJbusxwJMeKeasIO0WsNC2G0ZhBaPuboER2VJYlGDGGSs1j/yqu1+AugXVMxp1vba6b91e2sQgASB8zLF1QvxRePpzRCIIhGFUuBV0LD9D68R/jR23NacCqnzoERv04/DjHWk3Jl0m2pMcVLvtrPW/gFGuBmzZLpxHBRAh5AAPcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rBXtTmvaL+PsP+roF6nreZw4k+SV96KKyr2N84gjMw=;
 b=c4SdezZUDsj5xgCdiN9lCXZWAj6j6nSRmi6wrqH+X/b5+XMJFkdFe7+WDVDjzRmdkBVgweb1aFyPjPo4cQoQ+SYjyjXEnov4Qu8ZuoqTbeZIjlwWCfpUUwdRSlzfydl7MOcwoGRt35rgw/9Py8SyjG9UmFn5qeA1HbiBQLYAWak=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB4399.prod.exchangelabs.com (2603:10b6:805:f0::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17; Mon, 8 Mar 2021 20:22:30 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403%7]) with mapi id 15.20.3912.027; Mon, 8 Mar 2021
 20:22:29 +0000
Date: Mon, 8 Mar 2021 15:22:36 -0500
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: cota@braap.org, richard.henderson@linaro.org
Subject: Re: [PATCH] plugins: Expose physical addresses instead of device
 offsets
Message-ID: <YEaHjKsnDbBxI1nS@strawberry.localdomain>
References: <20210308201406.1240023-1-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308201406.1240023-1-aaron@os.amperecomputing.com>
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: MN2PR11CA0030.namprd11.prod.outlook.com
 (2603:10b6:208:23b::35) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 MN2PR11CA0030.namprd11.prod.outlook.com (2603:10b6:208:23b::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Mon, 8 Mar 2021 20:22:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08b73fa7-f8ec-4360-0fd6-08d8e26fe5d0
X-MS-TrafficTypeDiagnostic: SN6PR01MB4399:
X-Microsoft-Antispam-PRVS: <SN6PR01MB439952342633870A0D433FBF8A939@SN6PR01MB4399.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4cSNUusiuC5Ih0gpINO4fBTW2XwVQHztSaq/jsmGKJCNn70jLRPpLu2NyIS/1kPLkqgEvYTcAQ49GwNLv/8YLzFFQdvJpsolYh/BeKlIlZMPqYP7h3p9z3nGlDUCvl6wvnJNKGJZSTF6B6vNaCRNUpTVDnBjR9IAjNVvsA4Fb1PVoDRitq1nvjRpNXMSY8D9z1cpDlP2hglcpyJpguLwh4cVAxVzvdwxrZg50vu6jmtSSrucMypYKqHSuQSYD8N6Ko6VKTQKT9WWA3MMkiz7oYbSHQUWz9sSWjFO9b27N4vJZn6IkWhrGxH5XnzWN6WtDuY+J3A1Bt6HLVAUgCZjTv39UO1FotjECQdV8IbRze3qLEBVPTW+bljC+LpA7mb97cwmu+SHyqlEjnEY2a96vYQpvSixbanbeYnMegZeMj6v1kv/ldQVKNb55cPaD1TAGX/jgDbysIPpu5HXv6GoCfX7AokummO/by977etu1y46XrN8xeEOETiROARa7VVkr+EsyRuQfWLaRFAyvwJC5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(376002)(346002)(366004)(136003)(4326008)(66476007)(2906002)(26005)(110136005)(16526019)(9686003)(4744005)(186003)(8936002)(83380400001)(8676002)(5660300002)(86362001)(66946007)(66556008)(55016002)(6666004)(316002)(956004)(7696005)(52116002)(478600001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?mqVmN0u4+/uyuON3V6EUoQwyT/S8Yb58ZM84lAsjC+fOqPzjbChBg5q3xPl6?=
 =?us-ascii?Q?JgS7QuKI187CV4i80qo4aW8fNUuHcszvPKvaZI/ZufiF8JsmmCIOA7JStrHr?=
 =?us-ascii?Q?Oqf19nKwNvZwFUg3WP3A3VJjn02SnB/0mzZOUZrzaWU9dDCJtWv1JAuSLEJm?=
 =?us-ascii?Q?VoE9PMIPFrT6CW3/9TugI1JVEuCVmu1xor68LE5ayS3a0c/cAjulg3yVBScw?=
 =?us-ascii?Q?VJeS0WOVFBUpLgJAqhuBZJmjm/oO+Ryw7ySC1bbeDZWJJQJmrF1mHcDENWH9?=
 =?us-ascii?Q?XSi6VPkUjxwaGuTz82QG0PAOWHDwRhYimyw2XDouoj2TQ5ONZzUtHVvY72nQ?=
 =?us-ascii?Q?n+D/FNbqCJefnAUGIGfW7FgTCDZe/9eWBnblHYFdhXm/GtW6P3bvSjpRCSqx?=
 =?us-ascii?Q?4u0P1/BN30d6Mt6ri6rkiTRFijMDUbL2qtM1xF544u1uYk6tuaMtN+sKOUKQ?=
 =?us-ascii?Q?nWotme2mOHkcJPO9btxU62GLE/AqbQ1RBJds/GRgl8M2y0gOHSqJkCXQX6ud?=
 =?us-ascii?Q?s56JzJpkzxJD0c6QFkVYgwcsXXvOIKUL9qmNK9QitPC5LGiABo8isJOhTEqF?=
 =?us-ascii?Q?2IAaSPVL58veweld9uOhkVclfFDGjW1sC3ATiPHerBkSi/9YcWmEQEKmUZKc?=
 =?us-ascii?Q?gXVjoEqa1dRDsMmKANjjcgy16Fd3tjGZDKaK8ovB0udv3jleuCVqI3m1+sLP?=
 =?us-ascii?Q?nw2OCd1mrOH5F6rqayouaFMpT1LMc+taDzVMJ5tj2GcFMK8kHdDwLFldj66w?=
 =?us-ascii?Q?CdPQdSFqGbxQzrFy1t7Cd4LGMmZkHYIAzeoi462MQ/v2klKoNGgED+MALiRZ?=
 =?us-ascii?Q?FHm6h2OXBzE87JQ4gK6kZBCJGFg90bcyuMe95nhCtp4YAbFel+3D1Nu6iXmR?=
 =?us-ascii?Q?9HHFkeE05Ae37EEeFhDZoSGZSSDrgPSnCXykCtxDAUHiMtf2Y2G7cWDesBDk?=
 =?us-ascii?Q?a/l13OgEj+ZUqep96nWufpfm005nw3BRZ1kKlUqQ+PMNRg5xsE4yGvDPZn8I?=
 =?us-ascii?Q?eNkWqRjPDufCz/4L2f1yyb3xaRv0Fmdrq/pAxmgioHBHqSPjRctKx41Vqan6?=
 =?us-ascii?Q?EuDsau42B/TGpLvAPC0Beysmq5CYaY3ua19tBTaKhAvzqa6AOqs1nmqt5ze/?=
 =?us-ascii?Q?rZFzXI+HkiFQta/PrPkjyP67HNsnF8iV49meTRjC8OIiATLDA0vmNIlv8gkF?=
 =?us-ascii?Q?tdgslwors+tkuDDqK1PvAkKP85ZHagBvphyxv8GhJqIFVHTXS2oG72s9jQiT?=
 =?us-ascii?Q?Xe7PpR3GqCPteKSCnR3EjV8EYPZqyMWbbKjbCOuM4DNBBOb24HnNF4rLSrTW?=
 =?us-ascii?Q?RWW+ljamU030vCZtHti+cClT?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b73fa7-f8ec-4360-0fd6-08d8e26fe5d0
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 20:22:29.9149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 28VyBelF8AodpA5jkNpskBff7BRoa+yaXnmn1S7n2hBuNsfI35HZaXZbKuw/UlRLicN5Z+076AI4ZtKwoFsukDemZtykhkzkL1Kiqw7XoAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4399
Received-SPF: pass client-ip=40.107.69.116;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM04-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex,

I've now tested this change, and it is giving what appear to be valid
and correct physical addresses for both RAM and IO accesses in all the
cases I've thrown at it. My main concern with this patch at this point
is that I am concerned I may be breaking your new plugin here:

> +++ b/contrib/plugins/hwprofile.c
> @@ -201,7 +201,7 @@ static void vcpu_haddr(unsigned int cpu_index, qemu_plugin_meminfo_t meminfo,
>          return;
>      } else {
>          const char *name = qemu_plugin_hwaddr_device_name(hwaddr);
> -        uint64_t off = qemu_plugin_hwaddr_device_offset(hwaddr);
> +        uint64_t off = qemu_plugin_hwaddr_phys_addr(hwaddr);

How angry is the plugin going to be that these are now physical
addresses instead of offsets?

-Aaron

