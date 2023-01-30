Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C27680A00
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 10:54:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMQqq-0003AO-0n; Mon, 30 Jan 2023 04:53:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqS-00038Y-Gk
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:53:00 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqQ-00023Z-T5
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:53:00 -0500
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30U8cKgI019681; Mon, 30 Jan 2023 09:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=sdc1sBW+ClvCoAfMr2NakYHq4WgtRTi5ldHN/9cqbdI=;
 b=XOjh3n4GijSSrXa00liZuIqlauSCygfCNpUC6ohPcvf94ckp3r204lGci5/plEXNgsyX
 cUdAUiHCiu6QcOp5PNyyqoWz6I5Ze0pR8qrVMt9Ew9jilRJTcnx7Wf6RwlfyfkcDsY0T
 TIYAQNUYVsNav4p1RWeQJzPwgibH/EKOtpBeIhSy/MfLNnDXj3sb8YA/YAQuOgJNdKUF
 CdWwojBxRH56vtdjAoNUVLJdPBa/l5e9KmGuCLnTONwlPAghYjXSdSZyQ034ZcevY2nL
 CEZ/xLk9oYn2vhAh6PhjRL9Blzjuk+W12mRf/L3rYhMRIycEM+D+r0jSZlNUJXXdUzzP kA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nctpat10p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 09:52:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1Zsrd1Aqv4zo7buhzlhzFo574A4T+lYBBHsDmvL+bMrf393AD231tKaKnYxYSthLHqajbN6aqOpEZrs4OI3r8RmfNEyBxJzlIaFUHPd+N9UjvxKrlKuJwr5SzMQ+1N4HsQ1HxXJlz48AObRCkClapW7x268Io593b/sbp1qbu/A6PjWYbwM6IGrn9/HQ+Ec6QlqC3Q6RpjICmdaejhWdAeFBUzT7GajUU4iCuXW5oh3yMxMVvMPK8sPSjaosf2tKmvFcmXK+l5mZV5kxo9fMbO5ytBRrRGxtoO055a6g4MUmkt+fWYYvdrL8o+IuuW7Dh7HG08IUQjDMkzGjr07RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdc1sBW+ClvCoAfMr2NakYHq4WgtRTi5ldHN/9cqbdI=;
 b=fIEawzISyuVJjcBdD7Ap0gKG4W7X2KxrvqGpky8li5pG+n5ThVkZQSUOe9xy2uvGE6ulJ1GPVRvqVUK2GiQrweLxCYvw6IgSGnuQzCFiJz3E6G++C2zvL9+vcngXVTOuTPstgraXS/ZEnsv7frYQ4Y7ZYLKZjqLLyK7oN6upIQY7L+AAO3++eXNtTjgYZsvw9HlxNdqIpoSDyjEwCnRieMyDCLZ5MDjKgZQsRW1gEOTstZ/Mb1hyvfoQ2TVx06rx/O5qtrHExLYUB7RV4AKsq8RM+hC5Zvov3L3P0uLs1VnySOoOVFMt/qFcuZRupdcAzrg9yh/tTILuPVDrfXApMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB4992.namprd11.prod.outlook.com (2603:10b6:a03:2d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 09:52:46 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%2]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 09:52:46 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v4 13/16] fsdev: Disable proxy fs driver on Windows
Date: Mon, 30 Jan 2023 17:51:59 +0800
Message-Id: <20230130095202.2773186-14-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230130095202.2773186-1-bin.meng@windriver.com>
References: <20230130095202.2773186-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0061.namprd02.prod.outlook.com
 (2603:10b6:a03:54::38) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|SJ0PR11MB4992:EE_
X-MS-Office365-Filtering-Correlation-Id: a6b4ef69-037d-49dc-e28e-08db02a7bd48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dshwUJpQ5GDPK8Bqx5rovjRXCb4qjwrXWqev94DuhUVlcXgyQSbhNlyugsgiSeSc78ndcrPM7uXxwbyG1wv0vo2a9VxC8qF3jZVvHr/wQU5dgeR2ucXiFNev2C6DipE8mOKn3/fp9Cfs1/ot/pQaZBENeglqvDN+oSx1RUyiE3xKLZCOsRkOM1FRZ0ICUkTPMVFJrZ7oAtMLOMtneOn3Xr/+Hoszcxc5MXVMgUNTBh/PBT52Q4ZXZ10Ic9gKBqNf0mgkZ2ZRDREdUPq/aAov2c22ShJN7BPuEHFYkyebKgM0wK3rdaeob1zb6lYMqwZnMTjQXPGVjzyC2DbDEmFNfBd1Pd8vtScqp5IhZqoIcoL+M7xMDiK6A1YPa/PFUP2GIWwyjOaRJZv9nifh/fPV9Tz6PpPl2Gx+D7NGW1F6TANqvC1sfKvhrbnZerYmjIC59dZ1I6IzvRWVWxoRpGiHQMZDK2yuWMuf0MEg6SX11ER8kBqpnZsQmEzzOiJcLQ1NAZl81Ndr1XNZPayKsGaqHwhR5/EiaWE/trecmUoKijYMfnZD6N04WDcmCqqn5UYndOFBwBvF2Bv9ryLc6KEPuUNIg2dN6hRdLFayfTj+J+ZWSweZgAk3eRcBavhEcub1DXOcNqC9E2JNFlUYuE96Nl/Zgy2Z55L+neQMce/SaunoVE4ADmKicLhgB/nD2yFmuli+rAvT3ontV/+24SPWOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(39850400004)(366004)(346002)(136003)(451199018)(2906002)(4744005)(83380400001)(66556008)(41300700001)(8936002)(44832011)(6512007)(26005)(107886003)(6506007)(6666004)(1076003)(2616005)(186003)(5660300002)(86362001)(38100700002)(38350700002)(66476007)(4326008)(66946007)(316002)(478600001)(110136005)(8676002)(52116002)(36756003)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CGheJ0td+CI/4BwwsruJh9xtqVKj44o1wCnDzLe1W4y1rmYldj1zqa4dOgH/?=
 =?us-ascii?Q?yTyRMOUFNTlj46du4KQh2C4eqxPh9+Xx9tEaOdue36e6IMdmMWoG7yqloJU1?=
 =?us-ascii?Q?/d7diDzImlsiEQCP2EcFWrtRcIPXKh9gk+YRkrYRBAG126EKt+7tateyajMH?=
 =?us-ascii?Q?OUM9W+hUFCA/ek5yXSQWw7xGaB2ra4lpwSPpgJcgDBimpbJwSYpwDohN5MhU?=
 =?us-ascii?Q?qOwXULLpU9W7lqAyHRHNdJLTrppXlv9FwGfoVMJymVjx35nIzlB/UPnucnkM?=
 =?us-ascii?Q?i8yl5+axgxZqq2QAWXstpW9YpvowLgN3LFwFUVx64segaOE8zjmhmt/Y1KC/?=
 =?us-ascii?Q?Okdm1ZENs4iWc4FF6XMj10HhWJ9i7lL7Jf5z2YRolLNbpLD6ZJJ++kDTQ2AF?=
 =?us-ascii?Q?8v0r9vLEB0zuhSVBocAyen51GqilttAtGjhIYqzR+ejz/thKI1s0MeupYX6I?=
 =?us-ascii?Q?WyoeriznW/4cpjsOmlPH2VU1g1Z/q58nO/hoxeXxfvnX5tEbSW4rYafkO9iv?=
 =?us-ascii?Q?pvqn3x9ydMLrAE5/fgAXfrJlSJqUeR7tMEAFWegsizmCynz3gC1YDE/ymsfZ?=
 =?us-ascii?Q?0w9Xu1F4A6nQlnbaC0yzGMo6EaF22nDngaXoJfzDOGIzBNoqmBlIfNwr8Pq9?=
 =?us-ascii?Q?sQ3awXztC2ESBqEEYDAIV2u6Y+txRCdBY7STupq2lF//H3Z/8dlwbX1HM7+m?=
 =?us-ascii?Q?Hj6KkOM+tvmYzZR+bcuJr2A7fPHnY3uT9COM7MYXU6E+RL35qET1wb/SU2Bk?=
 =?us-ascii?Q?u5xvhyMJ3iIcUKRfSFpHS6Dk+Qx3OTZJQuRxjp+PoW1aOT/rGL+saeIfJB2y?=
 =?us-ascii?Q?h70msuAv0ox/53rOmHFjkHzw8GFkVn9gxampy3GUpXkgrrdKQpVzeBUbq8lr?=
 =?us-ascii?Q?0ljDLzyWEhiDDk6M2X6uCY2dq+QllB5XgLCyHECN340jPjhSWKooqbCDZy4m?=
 =?us-ascii?Q?F0isNvtJ+Lo/uUy+/7jZNAmUiDOmHFxXEHMU81yZGM9Lql39Iww/AG/7f5SU?=
 =?us-ascii?Q?kBr7efgcwGvVS4q7Fyc7ZBuk597LVpNPL34ljVWWY1yms/c1X5yuKk+IjaBa?=
 =?us-ascii?Q?72XQ/1mUee5R+0CaKQuVTBbrBgqx3gP9kzYviaphxq+bkKDrzAt/Fj6zAyjA?=
 =?us-ascii?Q?IqLWn4cffbZ2o8YtnR3Z1TrIyKnFG0WIXs3dGTXNyKYZ0NWvpJeWtaIV0v0l?=
 =?us-ascii?Q?V82KNd2YADhoK/+hHLqA6mLmTzO/k2eVljwW9Lu6TXzixVKuXKPc+VPCW/W0?=
 =?us-ascii?Q?F7QPboGbPhrv5NG1fyUPbrGJXTa6LgRTrOMzsGgQXn8M94xLns5YBIsAceZ7?=
 =?us-ascii?Q?IN238gMQxyUGy0Tm4zfCB8K+BFXLpBo6atLjSJm5AwoW7MzG0GO34xgWbeVf?=
 =?us-ascii?Q?rpjtDl76mpMfXrMvFnEF3PU0ObI4/LVpsXmtzx2bX2RUG+axygTu8hps0UIj?=
 =?us-ascii?Q?SYhW9a0xf+6x7GjU1PYZGGMDfILG2cO4Nd+VFaQNBuR29F+RrhiH5d9oy31s?=
 =?us-ascii?Q?rC2eqaoH7+QCbD2LAyCc7cV/GFBAAL3vCdmDEek7mfSp6eOjkJ+ko3oIrO6C?=
 =?us-ascii?Q?0CwK58al31/Ts8lcKhTdZyKpwt+M98e0m4HY0M/ZsowXa6LWE/XQVvglqouO?=
 =?us-ascii?Q?WA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b4ef69-037d-49dc-e28e-08db02a7bd48
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 09:52:46.4333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eu6azlQGqCRJYJmxMqGmQejVhRzA/BHFc2V/wGFFHXknh5Z8VzfIA1vkNe3az75TxO7RczvTW14RqxkMdwlQfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4992
X-Proofpoint-GUID: eojn1l51hplSqWfekzneQUg2RU84LIVL
X-Proofpoint-ORIG-GUID: eojn1l51hplSqWfekzneQUg2RU84LIVL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_09,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 adultscore=0
 mlxlogscore=738 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300094
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=13943e2a21=bin.meng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Guohuai Shi <guohuai.shi@windriver.com>

We don't plan to support 'proxy' file system driver for 9pfs on
Windows. Disable it for Windows build.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 fsdev/qemu-fsdev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fsdev/qemu-fsdev.c b/fsdev/qemu-fsdev.c
index 3da64e9f72..58e0710fbb 100644
--- a/fsdev/qemu-fsdev.c
+++ b/fsdev/qemu-fsdev.c
@@ -89,6 +89,7 @@ static FsDriverTable FsDrivers[] = {
             NULL
         },
     },
+#ifndef CONFIG_WIN32
     {
         .name = "proxy",
         .ops = &proxy_ops,
@@ -100,6 +101,7 @@ static FsDriverTable FsDrivers[] = {
             NULL
         },
     },
+#endif
 };
 
 static int validate_opt(void *opaque, const char *name, const char *value,
-- 
2.25.1


