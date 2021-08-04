Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1E43E06EC
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 19:48:04 +0200 (CEST)
Received: from localhost ([::1]:41864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBKzr-0003OG-I3
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 13:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mBIuw-0006pD-6T
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:35:02 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:39972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mBIuh-0004lQ-Mw
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:34:46 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 174FQ66t010334; Wed, 4 Aug 2021 15:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2021-07-09;
 bh=rPrrItPYSDqzxMd/N+DShJ5lyseeS2qPAhL9N27pjv8=;
 b=GqIrKumRhQy8UzfVOv/5zzPI+Bkmk364tM3abwgZD+9SrhDpZ+2K3yw6lzgFLKT/iSGv
 J+J+advM5l6I8UHT1wzABhvsbKeiQWdaeu9KgA1a8SqJ0wDgMhbvEmNuaaHZW6XBilV+
 3l6cQdk0Bv1P48ym8jOb4z9a99GXiw9smJTS7/j4udgA7CP95QHUppfrcDwBHjAqbdKk
 UbfrxamK9ujV13zOG5xnCnzwrV4B00Lm8v4VGlFNCUKCy9Ugj4wbCT8Pxx85/ZvaewW4
 y5eXbnaqjzSC1aWFrb2lASWSxJdYQ5B9NBMs3Oy6qzbNx7iwPuG/uYDJUlXLiFE/WdXy Jg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2020-01-29;
 bh=rPrrItPYSDqzxMd/N+DShJ5lyseeS2qPAhL9N27pjv8=;
 b=nlaC1BWvzxaFLD6FT5gOuTNGFRjmXOKsinrXkr+8chClJLYEQAOQAs7A5AKiy/+W9gHc
 jKS+Hy7EhbwACSp9bBg2SOwryVJD5DOGX0ntbs4OMIwlvpklGtnxl5AV5eCH99H1SvDQ
 ZQau4WDtt4vbZrVr3UsnX3kYiX4mU8ZidxrBqGn7skIuOX+gGyLnhOUZnUClBV/RD0A3
 gtsAs08YMHHg/bPB9uA1Ti5GtfEcXmZXDGrAKzX9S59uN3MCNijjZfxLRmipmgYu0D2A
 LLwvpE/x5KUrdHoahS5BIDr59HGYsAA7Tn8GayCH8jfIZJHYRnUEZ6SUbQ4Gy6mZRxlg gg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a70pjv5x3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 Aug 2021 15:34:30 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 174FQAf1051584;
 Wed, 4 Aug 2021 15:34:29 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by aserp3030.oracle.com with ESMTP id 3a78d6wk7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 Aug 2021 15:34:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jh4zRwFjjQiVbi5Ci8qMuBX3+C/c+6BZptw9nprS37KMvH07A5bz1qnIapbnx7ILhZXCpup+2JBMh/4+Rz9F0g/wvK88QUvAWSdI3ToMhhRAF3bJl0ZrI1rNcJj49gqrLL4HfmmIgOB1kA/ZARBNWSPDtXlvmhTfLK+4WwLtH9wFw60VbKhz1JQkTdZuxvchj5nQ9hRrU1Pi+SyuHiae74kYrr0OqQpcrrx8ZRv4RbAr/81vWOT0WiDIr8kcZfabho0BjciA4WWjdFD27CveAZTO+behvoaS1HDC3wn3UUn+TvbQVVpzeaKNLojhHDA1HPo0kBH4edmaiSu986Z8Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPrrItPYSDqzxMd/N+DShJ5lyseeS2qPAhL9N27pjv8=;
 b=Prwo/XSGVdf7zVqOW7JxWWYS4YTvbeR/EBJf8WN7WPakEhe3hxDHMvVNZiqCp9l42n4HpfuEJoerEXzGwS+M+fq+sJXg5999xFwMvhNyUZGXfyU1Ll6ErvgR5qeQTAteCX+/tvhxBsrkJIibXDXj3+UVJESIbqzrhmzCxGnjs2v4m/QFv8C+HE5AvHuWzgHiU1Rr3aqKmjp50uORwCUisqy7GtBJyTZDSmP3RyBsjmXRea/yWvQhOEA41OdrsQ7baLfEykbDDcZVbuwAw33WfftpUUPOzMLKHeudwJfjTgvDE+GiW7J1Qd/uTcsEWx81akk5wAA7+pZ81ENS6FB9cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPrrItPYSDqzxMd/N+DShJ5lyseeS2qPAhL9N27pjv8=;
 b=MhjJYxqE+jfv8ANU5TC6xDEeulNBMYK8Attc4NYsnRMRMOhuRqJaeetVxl8wdoblZupuJwxo2ei2u6ne/cAeKM+WjFfrJLuK8spx5GfANak4Q6g3/7YcqRBTqT5SwWiLtWfK+350tvW60ODe7sb17q1y1ZDlIURnKZbwAaji5bM=
Authentication-Results: bu.edu; dkim=none (message not signed)
 header.d=none;bu.edu; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by BL0PR10MB3426.namprd10.prod.outlook.com (2603:10b6:208:31::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.24; Wed, 4 Aug
 2021 15:34:27 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::54fc:5f45:9a1f:ae7b]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::54fc:5f45:9a1f:ae7b%7]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 15:34:27 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] fuzz: use ITIMER_REAL for timeouts
In-Reply-To: <20210804135621.31455-2-alxndr@bu.edu>
References: <20210804135621.31455-1-alxndr@bu.edu>
 <20210804135621.31455-2-alxndr@bu.edu>
Date: Wed, 04 Aug 2021 16:34:22 +0100
Message-ID: <m27dh1i5q9.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0237.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::32) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from oracle.com (46.7.162.180) by
 DU2PR04CA0237.eurprd04.prod.outlook.com (2603:10a6:10:2b1::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 15:34:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb22dda4-3ca1-4687-3518-08d9575d5841
X-MS-TrafficTypeDiagnostic: BL0PR10MB3426:
X-Microsoft-Antispam-PRVS: <BL0PR10MB34265AF4C7C680279AF15D48F4F19@BL0PR10MB3426.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bko1woqaPNUgAeK7CuJ1xsCxEhAqCimz2IKYB2oiK9jk73F92VBTlN4y9v24F9L0WdxrA00QiygkRRJpUSIazXA4l3lNWgjCX4r2L+JOyR37u6hUAb+BEqPnyHJiFk/lGqbWeAouCIbCig6vzrgf2+kT60Qi7WlUztdhpOLw/M3lHkpko89ylQHAYNndYoWrSH9CqRrJg0BUJgBuGcYrDSMWGu0vEx1TrjmL859QBfGwZsyVaGQ9a+rgVnebG2Y6h9KM/BmwHeR8tIFr1ALr3kuUlYCI9iUNKeSeTfyXekdlDVpOx17g/Qu5WTAv6vm07viYZpKtWPAtxTNrRzkSmG0f7qp0ttr9zSZanYm+HAwehyO69ydV/0kuJosBeB2MbW3IeDvxnkPkigIEilwvzNpOnNrZ6vfN+1eLSmO9gsCWJkMakevRdF3vpchM9cOqRd00YM0Ek0nPcBO0d5zamdMBPs9IlcX+f6/Ep+1Skuo8br3IiEMxAMqoykol0DyYFzX0fYSdaW9rigdmdW2nuobLQXllltNuF8iauGIfT8sw5t+4QGrev58prDvjpxJgDhhLPRerXrIgavMIsut74/vNQ+Jf7VVblptSE7u3iXbAcfDbe0uUlOqpMWhVX8iYipCfjjylLTowuFpAMiiLCTwHt4lP90069k/psqDowT3MS287+hEoIeYwiH89SAaNtnx3gIYbtyON04bfn0Ehaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(39860400002)(136003)(376002)(396003)(6666004)(55016002)(5660300002)(26005)(86362001)(8936002)(478600001)(2906002)(186003)(83380400001)(66946007)(2616005)(8886007)(316002)(4326008)(956004)(8676002)(66476007)(54906003)(66556008)(36756003)(38100700002)(38350700002)(7696005)(52116002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HusJYy52Sw9tcY2sPMuLm1RvOmKosKooaLZKKUeFVsXVhaRzrAtRglbqHWha?=
 =?us-ascii?Q?L1NTNvdZLTQjruG88/NsqYaj0mQZd5d3sjCjNnjo3PeMs8wQNEbileAiBa/O?=
 =?us-ascii?Q?8XK/3m4W0BKhQbZ0WnorrimqZnU480Cw9zWVtEYklX0ueNqQlnHpKhZse58a?=
 =?us-ascii?Q?wwtL/d5+R5vr8Kgju22CloR5zfOHysmPmaKYEvm0+Yy7Rjx/ttyGgqQ/Js18?=
 =?us-ascii?Q?594G1Cu/0VpFAyGu0V7GBCXGMpkqzd2SHK3tkZOGmsPsZHRF1LULnMamwpPb?=
 =?us-ascii?Q?wQ8JU80YkJvD9fTRsRtMF7RF4i7om+j4Ihj/EsxF/3tkv7GJCpkwS3Sp+ai/?=
 =?us-ascii?Q?PnokW+l7S3c6sTlTG6ekAxDzE/BI6L5CjUOW/nphe285Jp6HfIftAS/Puc6X?=
 =?us-ascii?Q?wUwuAUZS0i4OuCeksukA2QbepD0CZYMwd15oxF98C3IL0n1S7tTHoKP8MbG/?=
 =?us-ascii?Q?4HYHMZ6aSYHUNI3ctoJdaMBdgH97aoP/xQu7TLMLtOVbi9OolFlV/L3gTSW8?=
 =?us-ascii?Q?GRLHCSfIVKcRxbRh+kNwTtPF5+NPigpZxD2I0N0bN2apLyqeIa4pHzEpi8xl?=
 =?us-ascii?Q?uEoSV/Dw5TgW1JTDDAtJdafsvH6+DK3j/lnbZGCqWcu8Jb2mdGD9QYyD444b?=
 =?us-ascii?Q?G4PB7KJmpvl/kxnCiHRucKCke1Hj/wylbCiLDMplUZYENpVZXozyQuN8rq4c?=
 =?us-ascii?Q?Sob/Pwxq5ZjZHkATh9walWcy4MbbLt15EhdBrbSRxdU2gv5XJanilEeY3XpM?=
 =?us-ascii?Q?v8ExVhIK/mDOK5sR+yezunlvGZQBF3MLqxmlV7QoaLOlC5Ym95ctcZvJU3lb?=
 =?us-ascii?Q?AsmjrZYKxlCk68ypRp58WDZfQOEM/FN/IyEMgL18Zu67/GMuTmB6r6tcTcBp?=
 =?us-ascii?Q?7BbJpnotWqRpxVNIFt1WZsDxel+tC/t0GuZ/gHIBDOCa/TqcOw+8PXvI9CRS?=
 =?us-ascii?Q?6ycdRBJfF8yYcBtzAxu52mWM6/B++g4sKpV2F2e4d++A3KNKL9T0fq/3qmgd?=
 =?us-ascii?Q?OZE55EIr+XcoacBYsZ1Ae+fHEiu5ISgDEK3urnSdm9yBwyJzAhGzD9R9K2rV?=
 =?us-ascii?Q?sYPEgtxG9k0DcXqxz7LtViJsLbcuYWp+hRYxqhywtDRSOLgBkpZMcgeCujNl?=
 =?us-ascii?Q?O3ku3eUDVWtf+GE//6suxYaWKdn2TgZ/oJkOqP3ExrAYBDLZIqwZ3QlahQDc?=
 =?us-ascii?Q?9QILAysmK3HVEOntDGiV8OFAnoysKnUGANAykqFuk/rmEi4OvvySEokZ+/5K?=
 =?us-ascii?Q?mH2fw4ThCnVG1sgxR600SpybFnceuBGf4YTmAXZqRcptRceFTlE8RjbPAcxo?=
 =?us-ascii?Q?0Nx394kqWkEQxXtuVfjP/8qb?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb22dda4-3ca1-4687-3518-08d9575d5841
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 15:34:27.5870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1A/Nh7l3ML3uJHAdo5AUAccnkKgJI6MMAA/BUIGdG9QOLU+yFFQH4dZTEizS0IVzPGxqkocoHrskIPnodUctQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB3426
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10065
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108040088
X-Proofpoint-GUID: QXLtwmjsrB7LSpSOxjWnUZaWYkjj0HSH
X-Proofpoint-ORIG-GUID: QXLtwmjsrB7LSpSOxjWnUZaWYkjj0HSH
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2021-08-04 at 09:56:20 -04, Alexander Bulekov wrote:
> Using ITIMER_VIRTUAL is a bad idea, if the fuzzer hits a blocking
> syscall - e.g. ppoll with a NULL timespec. This causes timeout issues
> while fuzzing some block-device code. Fix that by using wall-clock time.
> This might cause inputs to timeout sometimes due to scheduling
> effects/ambient load, but it is better than bringing the entire fuzzing
> process to a halt.
>
> Based-on: <20210713150037.9297-1-alxndr@bu.edu>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

> ---
>  tests/qtest/fuzz/generic_fuzz.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index 3e8ce29227..de427a3727 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -695,7 +695,7 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
>          while (cmd && Size) {
>              /* Reset the timeout, each time we run a new command */
>              if (timeout) {
> -                setitimer(ITIMER_VIRTUAL, &timer, NULL);
> +                setitimer(ITIMER_REAL, &timer, NULL);
>              }
>  
>              /* Get the length until the next command or end of input */
> -- 
> 2.30.2

