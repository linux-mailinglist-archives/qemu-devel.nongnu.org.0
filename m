Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 192823E31A8
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:21:01 +0200 (CEST)
Received: from localhost ([::1]:45528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC8D6-0000qT-20
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85i-00070t-F1
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:22 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:25246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85f-0004AI-T1
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:22 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MBjrJ007313; Fri, 6 Aug 2021 22:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=TCDSxZKq8I0eOTivAM8EbtS/7kZgpQLRv2VhUQbkRzc=;
 b=PE2QQ6wVYshaoof29+xxUZgX7Kt17EF1umsUwwlWvdok8ghRsOrIkC75DAKsHrYxf3IP
 2U+0PGyU7Lf/CyGC6H9VV/kUSilkAaCPsSCxc5yCuRUk7p0Mbn8ef9gGvJdNFmreMzEX
 mEfQT7pF0VNBfoyH2jiyD7TlgbeySaoqLVWW5nPzrgiWK9U7HNHeT0X0truY77Jt8Mfb
 ZXPmcs/Zw0Ju1pJCSVfThVPkgOI9cJn9g5J9Asky521tU8+qgsSmZJkPybq9slMLvvvG
 ylVTTLnsJo9aVdYMFbaQZmysH0/q3vyZgHh0v9M/FEmQPH6TCX/YF1wcgDCT6nP3KmxU wQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=TCDSxZKq8I0eOTivAM8EbtS/7kZgpQLRv2VhUQbkRzc=;
 b=IMjQenKNhRI4JIaRTPnqSx8jqTJzFok1+DmRAsYJcxn4/A9RejpEHqrEOKyp0GwBx2lR
 IA2Zd2eHig5wJQ1W6Lofrz8gm8SUfguf/RwG0hyvGS88m6Q3xdT3CjCjGFjBNPPyfQls
 MFTo/t+GH4OFqU2ayRvqZjF0xs/V9jKhVf3ZY6xCLkUVcNcWPYKpPVJyzwTQyxJHKxgL
 FO+qQxdbmSrFwmdwCVDxAmjovCgE8OnwqaXPGDmVurvrtwwOdMN2WbOYOt454ljYPZZn
 2A6EWnUVmmKoy5rGWR3p30yS3tafeDZ5SKnDhK9i5cbd5N/MNSyQMGOuPemY5Lp2mLoW Gw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a8p6rjpma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:14 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MBl1p032690;
 Fri, 6 Aug 2021 22:13:13 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by aserp3030.oracle.com with ESMTP id 3a78db75km-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbjy0gPXeiNrELeQ3lzjfOzHzbLh7fm/V5sKkgnTRy0i2o3A20V4r9BtxrxTtvcJy1U+h89k6P9EhioUGcXUJV07MqbPoDU1yoNiWZyShzeR196NG+N2eLdarBCkzWzNKLgpZzzd9hL5AfazmZ3n+ZpVRJchSjgzQg0W+Rk0Ke2mLLNeWQyz8zvCIzq5rYl9fCvsXSjZlYgVzqjxA+XdHfao+fxVUa8kBRONdAH5sdbHpL2hcqjOLLhAbC3+ny7LQGO1DY4I+BJ4tUSlJqf/cWn9tU7Am1dDgaS9xJtc7meEWnioNak5g8AzRXByxfINM7GQAStmcEqd5wEcZyJUXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCDSxZKq8I0eOTivAM8EbtS/7kZgpQLRv2VhUQbkRzc=;
 b=DlS0y9jsIpI33V4Kh1AyzlNp+HTpzpVlB/2Krxu2mvzN/k3/ta3F4kzvRJn+wyZzmSW6DA3+n3CewEAesnWAJ7s9m3BYvyr49zs8kWig7tvgObtqYwMz9+Fs1DmbT6/v/dxH6jpPvnBIeJQUMnc4O5msW6vWpy8sL4/CxsCGOC4Zs+829g8LlpbsAwb2bVkUIy+PnZmbIVbNRI1ChgMCJmUXR0Cj4WT6/AdZd8alkOTW4F7vkfRjwIsq51Dhj+rBWpPI6Xep/BLcyVwb8d+TSXdrHVm0TKIIyBR4ZooEYGQUz2N3Cb7Jpcs/ypYRYFppqK2+3s/GYGweSuvs9nJkww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCDSxZKq8I0eOTivAM8EbtS/7kZgpQLRv2VhUQbkRzc=;
 b=AmA8rNZwsw52Q+dVMfOfe2oejC6f3hpCzbRel7N7w4nl4ZEI529Flq86WAvXr3OTfA233mSpi2LxUpjDb6D3m4+g6nQt4tJ9EU06t0ZbL5XZUxVxjBE6LphPNIJG/L+F3+zCOYBfYPbEHuvRbWFWo6NkGHHB6NlRSy0z+LKAds0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4734.namprd10.prod.outlook.com (2603:10b6:a03:2d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 22:13:11 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:13:11 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 10/27] machine: memfd-alloc option
Date: Fri,  6 Aug 2021 14:43:44 -0700
Message-Id: <1628286241-217457-11-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:806:20::7) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.7) by
 SA9PR03CA0002.namprd03.prod.outlook.com (2603:10b6:806:20::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:13:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c88aea7-8224-452a-bd87-08d9592760c6
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4734:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB47346E7F5B9CD15AADBDAFD9F9F39@SJ0PR10MB4734.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:93;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aCGRovEWxJj+eygNbGvkAFSOGH8YY7maHtrVw09V71/GTnHJIi9vpJRNNMfZaRBWCi3bVeuEswhUkt+T6Ld8X30Hox/Rycl+lO+3VNVcdP46wvwt3UW3+dLEDFFWcM+alIddymJOQ1p/saIp0u7PhG1VPNzOS5FxrAI8uctVf+4esU393gs9P3+M7m64EF1R+nk9T8QI5w/ZaihZvxZedOt5jTjcQIQPGmm9YTy6fpriwon6CAaTQjdfdsSgpmp1Ks56oGbVfMGuQdDfcQLjiFDQ4fUjt+GIGm/YJ1U+B0nAHc/Y6Mxc0tW++WyHCtL8d4CQE5mnU5FWP06Zg0yHcK2cZllaycjIWSUBtLo3e5iLU4+UF4APg2qdoviDP0XUUBiMlqr9SSgQErd/jt7lMVeN02l3NQ4WCNbzUo0tOUB+6bcpqInxveDIHhODdoVCtK2DJa5eHUqcaUBBNuYcPuDccr+9VcEHxoZLcFRaaYN3eCjxIWKm0rONnjPcv/jxpiO5c7qb8RmI+imwVHJ3OopfbOrgPhbqASRtsKI7csa+hj98o2vycCHwXnk4ROPC5a2icU67lxZ3CPVcoYAIeYwPrqH9i+ZXiuERRAQJg9yEYtTq7SlG5Bef6Ej8tvHDUB+Tbb3INm6525qUITZ5bT0oWSu0lWb/1NfbKac4CqLD17Vvcdz00lir/PkYf7oU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(376002)(136003)(366004)(346002)(66946007)(107886003)(66476007)(8936002)(86362001)(316002)(83380400001)(54906003)(8676002)(66556008)(4326008)(36756003)(956004)(6666004)(26005)(186003)(2616005)(478600001)(7416002)(6916009)(5660300002)(2906002)(52116002)(7696005)(38100700002)(38350700002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S4kAlXc9mlz6xVDXU0pyiO/HtFcCtOhi9OXAZra8vvJ8dRSYQAlXHkBm9l+x?=
 =?us-ascii?Q?VJQ8yupTSD3WXIEG/BjSZxUKKgP/LKq66xv8x8dIZ6qNSQR2xMfmXD6GKww6?=
 =?us-ascii?Q?Ak6d+Zb7kZVbIeb8qwcmEc830sk62Ckc9bn/qj/WmHZcQ8cOq2ZtbvH0D5qR?=
 =?us-ascii?Q?Ewf+VAsnyFRsx3dPFzyzusn1P4g3nix90lCMla4jI6Yt1cqGkiFHaCKyzo2e?=
 =?us-ascii?Q?ebmC4ITGnx2Y9SZcNdbjDSbLdnsnD6Eo9sqP2NkjRPiTBieO3cbpRHDBsVKd?=
 =?us-ascii?Q?6EzbMNC0Oxy3f6bQswgQCslegf8oE3UdT52OB+vsgymc/WDnse6Az4S/pM2E?=
 =?us-ascii?Q?R9qvgdpQRjaIWFi7rpEoFL+FAV9xYYJco6IgDxfLk7qUygk7rD3g2ca6vd8R?=
 =?us-ascii?Q?IcBDwQpu0XeytLizQbjoennAFWyQq4SX4LF1myacIWiMQG/qzlQeaVuKNA8S?=
 =?us-ascii?Q?qwfg+//u8brPB7sginGr+bowFg+ax87iBiDJ95iqEhrSYcvN+ve0KOnEmwRp?=
 =?us-ascii?Q?RO0OnV4ZaD4o/A7+RQfMoZwAsfOHl0RVkKf+aqrWYjztc83OR/85sUgbbMiu?=
 =?us-ascii?Q?JsddBL+MGbuSEVsZOnRqlqs+kufJTP1NI2nzRph2dIIMWxmQlfUo4PVVhO8b?=
 =?us-ascii?Q?WtwNwlQABPumzRSOSyoZJczFv9dGAECTuV4iY5v/q9I13nf/2/QlX7Fy3DP8?=
 =?us-ascii?Q?W3xZ+027S0dxAkI2PvYmLk/EqL9lksVPC11UcuqlDdSeV0CfMrfEQ+2Epa1f?=
 =?us-ascii?Q?Vc47Mz1qZmAviVP3Ef0CeykQcIUVyi9ft3ZvX5Hj2guT+1w4JAg9ombJak9k?=
 =?us-ascii?Q?ldUJfb8TrrYYth1YHr9qrkaMhv89KKbZNvp42mTXszNE+v3hPfNhHQqfh0FL?=
 =?us-ascii?Q?n2oV08l3dpmY4Eb3PwPOFghZ4mJfF25qGtYXmZE+wDCtZXL8vt3p+ilrSnA6?=
 =?us-ascii?Q?rnQBx3ZlbXNHSN+8DrY4SFfnxnTpDm2dvGr5Ur6Y1i0BFgD4QOmiPU13ja/8?=
 =?us-ascii?Q?MH8Q6dhTtEXtKcGHSFJXmbazkArhO5afGpb5Ga+BPmihHo4c1yu2INLcA46u?=
 =?us-ascii?Q?IwFqLYLcLn97rnHf4bVOQz0lLY6ciSkyZl6Nw52Sq0tBPPPkdt2IlNg7L3rm?=
 =?us-ascii?Q?2xcxEfhsFSfZ7cM6VPq+6UjL5+pK+GnFcNxNl/v27pxptYDbwCq0JtbfapMC?=
 =?us-ascii?Q?ffpEZaUW4CI2ogQB91KXb+0Eanl0SRTKvgBOLqOu6Y3reSb2R3xRu56E3kSq?=
 =?us-ascii?Q?Zno5qRhz5+675xItjn+dd7xf+sN8whXRJ0/wEG/c64ukcyVFi46icZC1pgzU?=
 =?us-ascii?Q?+GSc+3PSYQbjEoVr2041tj6W?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c88aea7-8224-452a-bd87-08d9592760c6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:13:11.3189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vwiZ6ohzSdwBf6fz4kR0vu0Q59wY31LwzYJdBFbnJlnz5j5YtGbMQwY7rse4MJJK8YkrKORjEb+k7U+w2zG48eCDuaTRKsCQyFyDUgJkNtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4734
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-ORIG-GUID: MeLrVjIgVPI0EvEvQ6jtFqnupIkpwv7e
X-Proofpoint-GUID: MeLrVjIgVPI0EvEvQ6jtFqnupIkpwv7e
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allocate anonymous memory using memfd_create if the memfd-alloc machine
option is set.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/core/machine.c   | 19 +++++++++++++++++++
 include/hw/boards.h |  1 +
 qemu-options.hx     |  6 ++++++
 softmmu/physmem.c   | 47 ++++++++++++++++++++++++++++++++++++++---------
 softmmu/vl.c        |  1 +
 trace-events        |  1 +
 util/qemu-config.c  |  4 ++++
 7 files changed, 70 insertions(+), 9 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 943974d..5d76265 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -385,6 +385,20 @@ static void machine_set_mem_merge(Object *obj, bool value, Error **errp)
     ms->mem_merge = value;
 }
 
+static bool machine_get_memfd_alloc(Object *obj, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    return ms->memfd_alloc;
+}
+
+static void machine_set_memfd_alloc(Object *obj, bool value, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    ms->memfd_alloc = value;
+}
+
 static bool machine_get_usb(Object *obj, Error **errp)
 {
     MachineState *ms = MACHINE(obj);
@@ -919,6 +933,11 @@ static void machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "mem-merge",
         "Enable/disable memory merge support");
 
+    object_class_property_add_bool(oc, "memfd-alloc",
+        machine_get_memfd_alloc, machine_set_memfd_alloc);
+    object_class_property_set_description(oc, "memfd-alloc",
+        "Enable/disable allocating anonymous memory using memfd_create");
+
     object_class_property_add_bool(oc, "usb",
         machine_get_usb, machine_set_usb);
     object_class_property_set_description(oc, "usb",
diff --git a/include/hw/boards.h b/include/hw/boards.h
index accd6ef..299e1ca 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -305,6 +305,7 @@ struct MachineState {
     char *dt_compatible;
     bool dump_guest_core;
     bool mem_merge;
+    bool memfd_alloc;
     bool usb;
     bool usb_disabled;
     char *firmware;
diff --git a/qemu-options.hx b/qemu-options.hx
index 83aa59a..05e206c 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -30,6 +30,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
     "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
     "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
     "                mem-merge=on|off controls memory merge support (default: on)\n"
+    "                memfd-alloc=on|off controls allocating anonymous guest RAM using memfd_create (default: off)\n"
     "                aes-key-wrap=on|off controls support for AES key wrapping (default=on)\n"
     "                dea-key-wrap=on|off controls support for DEA key wrapping (default=on)\n"
     "                suppress-vmdesc=on|off disables self-describing migration (default=off)\n"
@@ -76,6 +77,11 @@ SRST
         supported by the host, de-duplicates identical memory pages
         among VMs instances (enabled by default).
 
+    ``memfd-alloc=on|off``
+        Enables or disables allocation of anonymous guest RAM using
+        memfd_create.  Any associated memory-backend objects are created with
+        share=on.  The memfd-alloc default is off.
+
     ``aes-key-wrap=on|off``
         Enables or disables AES key wrapping support on s390-ccw hosts.
         This feature controls whether AES wrapping keys will be created
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 3c1912a..d11455f 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -41,6 +41,7 @@
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
+#include "qemu/memfd.h"
 #include "exec/memory.h"
 #include "exec/ioport.h"
 #include "sysemu/dma.h"
@@ -1960,35 +1961,63 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
     const bool shared = qemu_ram_is_shared(new_block);
     RAMBlock *block;
     RAMBlock *last_block = NULL;
+    struct MemoryRegion *mr = new_block->mr;
     ram_addr_t old_ram_size, new_ram_size;
     Error *err = NULL;
+    const char *name;
+    void *addr = 0;
+    size_t maxlen;
+    MachineState *ms = MACHINE(qdev_get_machine());
 
     old_ram_size = last_ram_page();
 
     qemu_mutex_lock_ramlist();
-    new_block->offset = find_ram_offset(new_block->max_length);
+    maxlen = new_block->max_length;
+    new_block->offset = find_ram_offset(maxlen);
 
     if (!new_block->host) {
         if (xen_enabled()) {
-            xen_ram_alloc(new_block->offset, new_block->max_length,
-                          new_block->mr, &err);
+            xen_ram_alloc(new_block->offset, maxlen, new_block->mr, &err);
             if (err) {
                 error_propagate(errp, err);
                 qemu_mutex_unlock_ramlist();
                 return;
             }
         } else {
-            new_block->host = qemu_anon_ram_alloc(new_block->max_length,
-                                                  &new_block->mr->align,
-                                                  shared, noreserve);
-            if (!new_block->host) {
+            name = memory_region_name(mr);
+            if (ms->memfd_alloc) {
+                Object *parent = &mr->parent_obj;
+                int mfd = -1;          /* placeholder until next patch */
+                mr->align = QEMU_VMALLOC_ALIGN;
+                if (mfd < 0) {
+                    mfd = qemu_memfd_create(name, maxlen + mr->align,
+                                            0, 0, 0, &err);
+                    if (mfd < 0) {
+                        return;
+                    }
+                }
+                qemu_set_cloexec(mfd);
+                /* The memory backend already set its desired flags. */
+                if (!object_dynamic_cast(parent, TYPE_MEMORY_BACKEND)) {
+                    new_block->flags |= RAM_SHARED;
+                }
+                addr = file_ram_alloc(new_block, maxlen, mfd,
+                                      false, false, 0, errp);
+                trace_anon_memfd_alloc(name, maxlen, addr, mfd);
+            } else {
+                addr = qemu_anon_ram_alloc(maxlen, &mr->align,
+                                           shared, noreserve);
+            }
+
+            if (!addr) {
                 error_setg_errno(errp, errno,
                                  "cannot set up guest memory '%s'",
-                                 memory_region_name(new_block->mr));
+                                 name);
                 qemu_mutex_unlock_ramlist();
                 return;
             }
-            memory_try_enable_merging(new_block->host, new_block->max_length);
+            memory_try_enable_merging(addr, maxlen);
+            new_block->host = addr;
         }
     }
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 5ca11e7..cb72ca2 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2406,6 +2406,7 @@ static void create_default_memdev(MachineState *ms, const char *path)
         object_property_set_str(obj, "mem-path", path, &error_fatal);
     }
     object_property_set_int(obj, "size", ms->ram_size, &error_fatal);
+    object_property_set_bool(obj, "share", ms->memfd_alloc, &error_fatal);
     object_property_add_child(object_get_objects_root(), mc->default_ram_id,
                               obj);
     /* Ensure backend's memory region name is equal to mc->default_ram_id */
diff --git a/trace-events b/trace-events
index c4cca29..a42c7c5 100644
--- a/trace-events
+++ b/trace-events
@@ -45,6 +45,7 @@ ram_block_discard_range(const char *rbname, void *hva, size_t length, bool need_
 # accel/tcg/cputlb.c
 memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
 memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
+anon_memfd_alloc(const char *name, size_t size, void *ptr, int fd) "%s size %zu ptr %p fd %d"
 
 # gdbstub.c
 gdbstub_op_start(const char *device) "Starting gdbstub using device %s"
diff --git a/util/qemu-config.c b/util/qemu-config.c
index 436ab63..3606e5c 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -207,6 +207,10 @@ static QemuOptsList machine_opts = {
             .type = QEMU_OPT_BOOL,
             .help = "enable/disable memory merge support",
         },{
+            .name = "memfd-alloc",
+            .type = QEMU_OPT_BOOL,
+            .help = "enable/disable memfd_create for anonymous memory",
+        },{
             .name = "usb",
             .type = QEMU_OPT_BOOL,
             .help = "Set on/off to enable/disable usb",
-- 
1.8.3.1


