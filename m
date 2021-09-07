Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D284027FF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 13:46:28 +0200 (CEST)
Received: from localhost ([::1]:43696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNZYZ-0000UR-CP
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 07:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mNZWJ-0008Bs-Vv
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 07:44:08 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:45898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mNZWH-0002fG-HG
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 07:44:07 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1879cJmd001550; 
 Tue, 7 Sep 2021 11:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2021-07-09;
 bh=lnCHwkHrcMSiJ3Jg2yHNcsMUupug8/Ji0bSYU0oqdMY=;
 b=i0yYKCWVIF1cSsblSKtJ46ZLMO4te8x2jPCXsDfHwnujtnDwteEjxLxlxZAWXQsKsPQ8
 qVrOuIVNZc64sxyIMgrXNyjlpRj1NTyr4OGjzHeyNZ+l70Le8kh6RciQyAnxrBBnUl+8
 NvEpt4LlR3f0NeF+JGJ2SDyQLdM4nJvyzlkkjwmEP3HlChFPUsGKWhpb3uW99amdjJwm
 M2uCpP2psQF5fGG816u4ufMJmEuQxJAmSORKkBAXk60DaxfLMWibrRGe7PFO+l8QX5i6
 aZJXaQQ37Ad2q75b+UkyNgTKlaG4QKHuvvfOAq2zstFoFMJZjV73Zz751cWwVWWwkTCG VA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2020-01-29;
 bh=lnCHwkHrcMSiJ3Jg2yHNcsMUupug8/Ji0bSYU0oqdMY=;
 b=FlF+YNgUCsAb+rNFQXA6iqvJ3P+G/NRZR06LRDfBqW27cWx5mHkdrjennqwj5gwVPEor
 xL68Fhjx8TFjG6ooVnsqRaU7xd3WlESOvdR6n+PZj+bDdvubm0H8kKaVGCoKYfPgXM7g
 h7E94B+sZOQja0uTT5ZSkdyufV3B+wMQjD/uQogKaRc/SLHFucKWUw9tU1/0sFYAeGNy
 uj8yt8FPAip4+/GzYypvU1mbPKGoWspJaaj+4p9463yTwgV6fA+57cYAMlS1QWIAHXnZ
 ibrKIxVx3hI6x9Rxud7SoeM7owyq6YtD58OkECgO1XtJJYbBMk+bRpWwagGkQVshR7DZ 1A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3awq189jht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Sep 2021 11:44:01 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 187Ba0ci110952;
 Tue, 7 Sep 2021 11:44:00 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by aserp3020.oracle.com with ESMTP id 3av0m4dvyt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Sep 2021 11:44:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJeNRTt9E7lmI/rM38dTm5GDFHiajdjVv2Th6HcgTLrGMmpPhVZHO/VAJ+lZuNVzEuYsDJhdaHGHmaB1X0MnYZKC0jq49v//WvbDcZPot7DlZodiXg/HUYBq3TJZZbUEbz7l0lhAXwcdTcgxbPygI/vCyI6sWC8zE8WaCtHi6l9hynlwCA4fs3wXOdDaJiK6O7KMHsbEMT18v/IZwLwN4BkL15dk9PvK9xcpx/BAobRTz2jV7cFgOBIwzudYLytRVPXJrmLNNaWhQ84ZytGZD/YpvG5Ma85jYopphDIK9c7BlboydqIhzmqJ7nvLjo/iHBk5OlwFKFBY+noEfWSmiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=lnCHwkHrcMSiJ3Jg2yHNcsMUupug8/Ji0bSYU0oqdMY=;
 b=FypyLyrggPrOWXhES6AjpSyh5EUQ8AXBw68FcVPI7BTqFjviX8+Q1C/YkGv0rMvJLu4+IhZvAvSt98B1qyO8y3FAuNQarzQhG7MLiON0lqPmsAwpPpUxpzSqHXG3VYXc+dYI2JnG/rvkV2kQfdmCVeNxZoLrg3GhOwWkZZBbcOWe797F5pCjzrzQSvxpYttKrNCbLlD3wMlpAL2JA5ItuujS0O9dTNJgx0qRpxlT1cWOVaXx+wmwKJZmpzYApGPtzG801oeKRzU5kT2NqYSFZYp1gNpuWp1iRS3DttgyOf7gYJI6xGGkPwZUyfJpJ4HRZK6UvFSTgk1Pb7sMm42k2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnCHwkHrcMSiJ3Jg2yHNcsMUupug8/Ji0bSYU0oqdMY=;
 b=yVJ+9EOeacqxrXir5FcyBrWyy3Dq9LW9VKrmqIyYxBcIqAL6ZEk/dcAm0iVFAJLe5VJRlw6axBKQAVqIhu0sDd+Ufu+maMvWgiLOljlk2NwVAS4HqAvkq3+DZntOxvEe0qoauLiVDcHscrKcbqk7SBj2S//oRGEEd/n3kwJxXQI=
Authentication-Results: bu.edu; dkim=none (message not signed)
 header.d=none;bu.edu; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by BLAPR10MB5187.namprd10.prod.outlook.com (2603:10b6:208:334::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 11:43:56 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::65da:ab32:53fc:a57c]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::65da:ab32:53fc:a57c%8]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 11:43:56 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Subject: Re: [PATCH] fuzz: fix unbound variable in build.sh
In-Reply-To: <20210907110841.3341786-1-alxndr@bu.edu>
References: <20210907110841.3341786-1-alxndr@bu.edu>
Date: Tue, 07 Sep 2021 12:43:49 +0100
Message-ID: <m2k0jshaq2.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DB8PR06CA0022.eurprd06.prod.outlook.com
 (2603:10a6:10:100::35) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
Received: from oracle.com (46.7.162.180) by
 DB8PR06CA0022.eurprd06.prod.outlook.com (2603:10a6:10:100::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 11:43:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ce6d0bd-426c-4d6d-3d4d-08d971f4c651
X-MS-TrafficTypeDiagnostic: BLAPR10MB5187:
X-Microsoft-Antispam-PRVS: <BLAPR10MB5187EB61659E6B43A4C71D9DF4D39@BLAPR10MB5187.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +X0fSy6FlVn1Wghydo3v6EhiIb4EahNP5c4NLCRI+1EucZBSpywV/pgG3hPxTkYfMdmrf7ncupcA8Z9d3WPoGZr6n29NtQxbKkRrK+5HVhXov1AadmWEGHAL06iZFsrijmxIHmTTq1fnLtBj+r1dp5nEyi8V0RUVvQaeC1SW7/fs6y2YYoe/g4Ahd0JK518kDYzKAcAkaprMKEI14hLD5UDU7L16q7ZF4kzYp73fkbQ2kBaK7/nzo68VZYxUYWomH8avSeGHI0wK6f5vyMtVA/vVZnPg3Y6n+6kjh4Me4KBzB0XSFU/kIB0NZR8ZE97TmgqGX9YXC7xAmQQ+u/gRYigF31VliwTvD5rj0/1o6ipWdJ1oLTIlK7+jOWcjll23/+VtoqhZsn3vB2PZRPyojVx+XztKBVmCAL+ntQTUkAsqKshsFe0iTRTNY9U19IUcSDcLLO7Tnlq1JrqWHzmlaVlcSw82F1BqDiS1ynWG0qjcPvVl0OB1X8lCAnGv2EmzXHaJGI/dm81Sh1eZtDtK6zWo7ahWgEk1ZejVbeC55TuYeCPro9MAfUZaYJ0ParyX6//sO/o6DImSh9RbD2tr/u0IHGObLhHL01JZ7T8In9WMY5PnwR2ZcacoK8Koh5LHAvMVqQ1n8D9de+wW7CE0Qf7mDehjCx448CjbpG1WOVBqG22oqYgFXaDQkRlj2i3nn+T+Mxa1VW6o+SldLMsMiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(8936002)(316002)(508600001)(8886007)(2906002)(7696005)(44832011)(2616005)(956004)(54906003)(55016002)(36756003)(52116002)(26005)(186003)(38350700002)(66946007)(38100700002)(6666004)(86362001)(83380400001)(66476007)(66556008)(5660300002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C+MhcoFHDz1JkHLGOGqWfm7hMPsD+hoSIZWWJ7FvuCVOYmMZtrFpTeMJBHVL?=
 =?us-ascii?Q?a6fKMX/bq6wZ3nsBy+VuUL8RMGBBAY93+Fel4dv/pRvcQm6sOP/kLAOrXeot?=
 =?us-ascii?Q?ukgc4CJeY9jDIWZ/SWuDA6kFi9LMvyZDkcvYA3Ux67dwAiiRo3lqb5fFjSsT?=
 =?us-ascii?Q?MH3E3B/+NBt428FbyulTefgUZGx+1eP6M4opchLHElg1rcl3uokQ9/FKsCfY?=
 =?us-ascii?Q?fFgs2Lg/nmySpjsC2Rs2TS42ACuRQDNx3Bh7aH98yI/j03ybwkaQ08uFsQ8r?=
 =?us-ascii?Q?rC1lWlIJm2sv8mbBR7g62y6ATQf9pHMoA1FaBa4CSavNfISNo+nOkK9oVD++?=
 =?us-ascii?Q?oc+O2ruQG2NwsWJSeoT6NKO25+pzGCQJ8+soIpGXAYpdC5Q/U1WQlsN4etzO?=
 =?us-ascii?Q?ov5kq2hMaTCow37JDBYZ+JZ976tg2kmjTdNmhYVMRjNVVBgOK65unyUD0aq5?=
 =?us-ascii?Q?Li6pJXjgNBAuDDQDMo42vrDoewWaB/OXsYnDuA+mHsquhPcb4q4Z0eh0rCxC?=
 =?us-ascii?Q?gApayZXyAY89/wBIR2sSOxeSwXrQcixGMimHVE84Um7RG7FaQahX1vzwOGZM?=
 =?us-ascii?Q?MA6sDRw6pQMRBsqusvyAjj/xf51DaPU17Fy4wcBMuuN17YRcRVm3Gm+uXyFA?=
 =?us-ascii?Q?1Jn+qUUXi6DD+/D/AiP/BcuMM2xJMH0iauhUQv0nExxo8kD7QMtdnN52Htag?=
 =?us-ascii?Q?az1/lvRs8vMmAy7jBmrfrSb7L2sG7KcBKR7RV0/IIVL4rBMtSfFbxX/mvC9Q?=
 =?us-ascii?Q?p39wsEv/TreiIpX9VnBZ5EEK6z+ATWZKABy5SzEse8v22ihLuxig/gqstgJj?=
 =?us-ascii?Q?vPED2lqzs6dlHl5UPV/wJa+unlY/Bu/pZsuFUXVWCdK7t88FC41kilRSLCQC?=
 =?us-ascii?Q?Qu4bJCDflZGQk34Cbg3i0aNJ4XHq67sEo0bobQ61Rf3Xq4rtcGCjHBbpRHma?=
 =?us-ascii?Q?0SfZ5fbOXF8+gvhBz6fd9B3Sv0VZ5eKv2sxKcS8sNWYnXa2f+GLNUn3A8Dhv?=
 =?us-ascii?Q?DLcSTBm4Vz3ZMfphV+wzpM66TdRy5q2t43OFmSE/zxGkPwgiO3Ccex0Vrws7?=
 =?us-ascii?Q?a495KPrApT+liAxluV6lxfN1ldQHixIrGnPumRQPUszha66fU8Lz8x+s1LuZ?=
 =?us-ascii?Q?nV4tHYJTAAfPzXDqdZOAiqwPfMQHTNfItU5MVlNtm/DDRQuXTE/WIzY46DNY?=
 =?us-ascii?Q?kR/NdjE4Sh6Oe9Y3XscPnbfCpzraowHE0Z/xuWivrG1bhMTFSKO01N9abMVo?=
 =?us-ascii?Q?o2G/s96nN03G3AYpDyxnxDBqKzDu3hvkeA5rUVAp5BW6NOZt/kM+074qpTed?=
 =?us-ascii?Q?ktFi+fq4O8c2elEHnbUgP9/Z?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce6d0bd-426c-4d6d-3d4d-08d971f4c651
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 11:43:56.4579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nVkp0qR95hUq90qierBSj36R3lrFwYmWqzzEdXBMOm8o2Hw7xdK4tqQYT2xJPdV2AANdkmtXLdrW3RtpcYxv2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5187
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10099
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070076
X-Proofpoint-GUID: OE5M2hg2buKDILn-au9L6NhwTPtwdozk
X-Proofpoint-ORIG-GUID: OE5M2hg2buKDILn-au9L6NhwTPtwdozk
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tuesday, 2021-09-07 at 07:08:41 -04, Alexander Bulekov wrote:
> /src/build.sh: line 76: GITLAB_CI: unbound variable
> Fix that.
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

> ---
>
> This change is in preparation to revert:
> 7602748c ("qemu: manually build glib (#5919)") on OSS-Fuzz.
> Reverting as-is produces an unbound variable complaint when we try to
> build the fuzzers in the OSS-Fuzz container.
>
>  scripts/oss-fuzz/build.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
> index 98b56e0521..5ddc769c9c 100755
> --- a/scripts/oss-fuzz/build.sh
> +++ b/scripts/oss-fuzz/build.sh
> @@ -73,7 +73,7 @@ if ! make "-j$(nproc)" qemu-fuzz-i386; then
>            "\nFor example: CC=clang CXX=clang++ $0"
>  fi
>  
> -if [ "$GITLAB_CI" != "true" ]; then
> +if [ -z ${GITLAB_CI+x} ]; then
>      for i in $(ldd ./qemu-fuzz-i386 | cut -f3 -d' '); do
>          cp "$i" "$DEST_DIR/lib/"
>      done
> -- 
> 2.30.2

