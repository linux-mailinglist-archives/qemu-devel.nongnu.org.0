Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E103E31BC
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:26:12 +0200 (CEST)
Received: from localhost ([::1]:34138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC8I7-0003yW-Q6
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC870-0002hU-Sq
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:14:42 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:2470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC86y-0004z5-PA
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:14:42 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MBhkK032541; Fri, 6 Aug 2021 22:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=dwbtd9Y8G35jDOZzwkslOyk3801OUh4E/B3FjwuKJs4=;
 b=08ubusd7AxW5yKmRtFBlJ/VJUcdtUADAMSe38AmjjvtzCawQ/U7P0Q5AIWypQiAC/cQ3
 X2MqPwsODN89SlcUs1D9LLnQvZ/nkzEfUc5sDaRlaZGwV1Wdmgp1U5m6sKwx1PMr3Skp
 Bs1iuIxxh9mv5fSEe6z6GhrP/T7Fvyfr9QetcwPLSopKp+8QhizV/Qp8KKYfqU97ZjfW
 9H8ksQN4Hr7iwBooNU5DvC5TuFNM64FY5fjEq2QszSnJvBOtz0o/oLcu4tLCcoC96gmk
 NzSQer6sgWIxnS4ldpM95oEDHtmLrWZmUN6uLKPtdcHmgSgozFZjeMSWYcJpqzVFRc0b Lg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=dwbtd9Y8G35jDOZzwkslOyk3801OUh4E/B3FjwuKJs4=;
 b=VLynKkMlR4HiwIj/ngpDmfAadFN/VFqYe7RYhy83Dx/C5yRSY6IiR745D97MkKT/aGXE
 eXtoQyXXhsetGic9l3B0OZA38rQ30J0r+WGIe9r5VxHZA2qy41kMam0UBKf5aqY2Xjip
 3wuI4v9EKddJfx40MTY9qXiMMkvBxWQTgBCqjvYX7EE5rHUcnXtodqksJCnhc4T2XmUk
 eiAiFkqpithYNg/vqM4TU8wsibu60rrI7qBBsn+/iHE17USN44aU7ZWcgDzgkkuwbsya
 Kf7DKFqMvYxHgjjElYfvEkwMNQ+KYhWgLydGYLW7p6kXErGqQqvqkRvK+vnfECkITHKE aA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a9661s140-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:35 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MBiKO013845;
 Fri, 6 Aug 2021 22:13:34 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
 by userp3030.oracle.com with ESMTP id 3a962pfb69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/ANx/mQZcDs8QgZwjC4puPnPSh1LCxBwvzDGXVBqnjt5Lb6bYW6UXN1haMuEwYMfKjhDihtZbFGcIoCCV3KtoGCP6sIoX24xMu5MtHh7FuLF7R3oxCdMfgtIZrtEpXjwNpRnG2d1h7sR1YdeToGHpNQQ9meXEq42suln/osizmVFmJ5/gjhFH2Q86tY8OaqzEBeblZIrU8hm0UjkBZeVBH8fPKsmCu/0/zC5+r06ndyB0NUr4tKsUY9wr5Ho0M+dTil5YWDfnflNjXGClH3r40DDODYrWsl77ewEVu+KIiWKAXviiRClfCdA6TJX8h3coo92dWPqLa+4MQAkfabNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwbtd9Y8G35jDOZzwkslOyk3801OUh4E/B3FjwuKJs4=;
 b=DrDjURx7IIT7n5PRqmNjCWtaksWloagjwzAlzFjr0At34xTBtuUz+W6v0WnGbEsKCyoZR8pB79cgb6wYsLPKAquWpEt+2BtnA2c+O9zAtbfRoqxa22yD3xtKm42SgwRraYwUpKcjbD6PcN6HtIGRgTKKSA4mmL3gFMBo4Rsdola9aFHUJ7rxjRmYRZY4efuYSmEShyF1TGkea3EhyR3PUkgHFXCCkUyziXWJAQusB+Fg1AMAw9Rx04UedsELeWbUmjyTZ4xOd83sdt5okon7KtLObyg4Ggq0MrbdWUcHFOXhYWlGU69ese2uitTuqju2uwhS28YtRDzHgRJO3kqxhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwbtd9Y8G35jDOZzwkslOyk3801OUh4E/B3FjwuKJs4=;
 b=mBQnkOFnivxoBx3+QQQFW7aLz7DtGmzlPbzUMDS5MJnXpdsVye9njHPd8CNP9HNvozZJld1VAZESwkRKyqlFeCevmQYv4nArzZkzSo8v8Wh+VGObkZDrVMHOwuYR5Q5SlHcq6/H5aHNmJKkq+QghXN139fXmOl80LExqjximH7E=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4129.namprd10.prod.outlook.com (2603:10b6:a03:210::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 22:13:32 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:13:32 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 21/27] vfio-pci: cpr part 3 (intx)
Date: Fri,  6 Aug 2021 14:43:55 -0700
Message-Id: <1628286241-217457-22-git-send-email-steven.sistare@oracle.com>
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
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:13:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4018c54-b06c-4ab1-36ed-08d959276d2d
X-MS-TrafficTypeDiagnostic: BY5PR10MB4129:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB41290D20EFF8DF01E428FD99F9F39@BY5PR10MB4129.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BI2Pt2zJlHZGQnpyYPonNe6Z6VlNLE4SAU/ncdauYtkHzsUZWZcf63mNxq/hce+xpXWHkw38LcHHcMiNXeMIXK5Bvh68eNdfOvSf3c7Ncgac7/baqh1xRFPso+7OFW1rBpciFiYqxtgm5/3tKjHGZmnJDPQpswessy6eOQNaTxsVe7g4fAd3bYc/bcveHUXl/62dQS08kKMKTxo5fI90cq+UwlYZS14xNPEW+Y/Feb4GcKbO7T8REUCi7SfMreSw0lEajKjK5sSpCsiGeNNu4+drsRuRTsPESGybcCSSzi2kYA4J/anhOS3TObdMQUHM8j0VvwjU8HUqGubj2OtE5RPuBX4SowMWm5+NPWoukuZdlHvOeI9P3PDwJ3pl6lvWq3tNo3a6KMUhIHNeJUPi6N34ZOltH0NzhfU2mraYe2bh5XND0/ZQgUnPXOLWIiaN+B1rS9geSQwy3b8/25aGSpOr9VY7S73FOyQDub38RkmaHRj5NSR7C1k0NYBpilDTZ9tmhM9mfWDZ55clSdJBjXOKcPceTbb6IWdnEGtrDnxUk9HNpOXbp59FdwCuBXq7ABZGB5d6KnaljoCTLjlxU3Y6S1zSNtFC6++Fqjs3whdg2vC6rU8eLWUpxkenCrqjOGnzmg/jcxgPwn+3LBUjWg5URLbvMPHn8X3BAAseJaJuVZkPpC7H99l0d5O9zB9Yt0XFmYggrDN2YYfhhROgIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(39860400002)(366004)(346002)(376002)(66946007)(66556008)(956004)(2616005)(316002)(7416002)(38350700002)(8936002)(478600001)(66476007)(36756003)(86362001)(38100700002)(5660300002)(54906003)(8676002)(4326008)(6486002)(7696005)(52116002)(186003)(2906002)(6666004)(107886003)(6916009)(26005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vqd5VShlrmosXQej+9uxJ/U5CeerAUYg5kSFzrcjcGhm1S3SEmFSzhdEMN4O?=
 =?us-ascii?Q?uwnMBph/n3Zq1xHdRMV8zOE+laYURhVPuHI+cTWBzs+SdiVY/Uo1BsryTYbA?=
 =?us-ascii?Q?+VqjnQvraquXVIkQz80fuZCdhh5RY7VN2GmQrCS2cmKiITRJGXsPlN0Gz4yF?=
 =?us-ascii?Q?hD5vdLMsguFnFD3cM2dbupuUFuMJoxPkjLVMAF6XYoZTNR5dRoL5+PDN7v6N?=
 =?us-ascii?Q?LJO1cj62VtKDczdV3zb+KTL3iabBngORxopmA18ctBpOVQlke0GmhTkQBwGU?=
 =?us-ascii?Q?L8yCZFDyVb+7WDlfdVcZQDJgiT6hiYa4iIx6htMJKm7V3RkL9xQzwR06qgl9?=
 =?us-ascii?Q?6MRJMynCdL7rFU8y8hhazOfSubX6nAW3hJ8Ge9XhqWWOQoyb67zDekM7nkgt?=
 =?us-ascii?Q?1duufn7jyeHicdybrbuc0+JXOQiQok0tweRqP8q2rqxz71fx4YNhUZSUQF2O?=
 =?us-ascii?Q?eSXTwKxAsuJZYwF3kNOQ4H/Yv1o300Dsf/YkgBBRbO1c+P/XKa1HM0VzZ3uW?=
 =?us-ascii?Q?N8hzrY6piev/xJ7bVz2Q2Bn3ZD6hQ2nWUb3a87uewOhlLb5kgvvpNSNcLaHP?=
 =?us-ascii?Q?SNdVlTe8dS0W22gGQCeELWmxbd53q0DxrK/WM10x6aZkYgwGvmb8XPVWHqnP?=
 =?us-ascii?Q?dKeBeGcIPK2147Tm1ICtPaO8jBrSuhXAXtmOMCh0WXPwexrapXwiouL+72m1?=
 =?us-ascii?Q?NeaTPzsz7pu9GQc2HzXhK+Brx3liE1JLcPLjA7v0IPtSeyCx+SW8ls+XfCqd?=
 =?us-ascii?Q?OuGc7BpWSX9oLlzOmhiTyhU7qE3wUJeqy7YtBMdf/NHgUUfxwVujvqgDifTu?=
 =?us-ascii?Q?3Gcqnn30OB0WEC6SwsZRzQoC9lyvEYgi1+FbROxKPezvRh0ns0M0VcKQAoLj?=
 =?us-ascii?Q?/1a1smvSjL53njwDr0o4FomOrMAoAIcPhy92uhTaZnXg/VZmkzcUPPpAH1+y?=
 =?us-ascii?Q?4DWEP1f1qWuWK5cTA4zXPDG7mLBBbAJdGQiR5FEDp4mCckcabKaD8kV4qX4S?=
 =?us-ascii?Q?8Buz8TU5/1E+l0cCqkCL2vsNW9PR7J8dxawNo5BJ+sl3PN5QspDAHOH/WAMb?=
 =?us-ascii?Q?86l6NwVJayleINBRTjCJj1BA/rsZHeKGXa7tte9L3Q4wcjd5Qk/NUesdCRpG?=
 =?us-ascii?Q?lYx67McS3mLAWtPOFdm+o2OhJuWgeIEeOLIAU2gAaz2r2anXAqaBLPmoICpB?=
 =?us-ascii?Q?bOkbHT4bgY7QFIYJRpMH7D7EBVgvCNDiDo3vu34cJlMlgQO0JJpzVX3tHTtV?=
 =?us-ascii?Q?ssirTJpur0iSmVwDH9v+R7b3DX7w6DRdw65g70pIngQKrfMkXJV0lzhXXKbU?=
 =?us-ascii?Q?yxt4QSDcbJ3WPuOh/orM5okC?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4018c54-b06c-4ab1-36ed-08d959276d2d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:13:32.1281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9KeHXALa54SlbXypah39k8tFMLQRAh1UVqj5TLD3KA+xrnTWACIKOOGERGIdrhs3Rnia0U7+m001UXLQrsETwX8pbxazIgoPZerNtroKjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4129
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-GUID: s_ykErTRxxu5E_XZtRakmK8dEHf1CiCS
X-Proofpoint-ORIG-GUID: s_ykErTRxxu5E_XZtRakmK8dEHf1CiCS
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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

Preserve vfio INTX state across cpr restart.  Preserve VFIOINTx fields as
follows:
  pin : Recover this from the vfio config in kernel space
  interrupt : Preserve its eventfd descriptor across exec.
  unmask : Ditto
  route.irq : This could perhaps be recovered in vfio_pci_post_load by
    calling pci_device_route_intx_to_irq(pin), whose implementation reads
    config space for a bridge device such as ich9.  However, there is no
    guarantee that the bridge vmstate is read before vfio vmstate.  Rather
    than fiddling with MigrationPriority for vmstate handlers, explicitly
    save route.irq in vfio vmstate.
  pending : save in vfio vmstate.
  mmap_timeout, mmap_timer : Re-initialize
  bool kvm_accel : Re-initialize

In vfio_realize, defer calling vfio_intx_enable until the vmstate
is available, in vfio_pci_post_load.  Modify vfio_intx_enable and
vfio_intx_kvm_enable to skip vfio initialization, but still perform
kvm initialization.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/vfio/pci.c | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 83 insertions(+), 11 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 1cee52a..7e59f4f 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -145,14 +145,45 @@ static void vfio_intx_eoi(VFIODevice *vbasedev)
     vfio_unmask_single_irqindex(vbasedev, VFIO_PCI_INTX_IRQ_INDEX);
 }
 
+#ifdef CONFIG_KVM
+static bool vfio_no_kvm_intx(VFIOPCIDevice *vdev)
+{
+    return vdev->no_kvm_intx || !kvm_irqfds_enabled() ||
+           vdev->intx.route.mode != PCI_INTX_ENABLED ||
+           !kvm_resamplefds_enabled();
+}
+#endif
+
+static void vfio_intx_reenable_kvm(VFIOPCIDevice *vdev, Error **errp)
+{
+#ifdef CONFIG_KVM
+    if (vfio_no_kvm_intx(vdev)) {
+        return;
+    }
+
+    if (vfio_named_notifier_init(vdev, &vdev->intx.unmask, "intx-unmask", 0)) {
+        error_setg(errp, "vfio_named_notifier_init failed");
+        return;
+    }
+
+    if (kvm_irqchip_add_irqfd_notifier_gsi(kvm_state,
+                                           &vdev->intx.interrupt,
+                                           &vdev->intx.unmask,
+                                           vdev->intx.route.irq)) {
+        error_setg_errno(errp, errno, "failed to setup resample irqfd");
+        return;
+    }
+
+    vdev->intx.kvm_accel = true;
+#endif
+}
+
 static void vfio_intx_enable_kvm(VFIOPCIDevice *vdev, Error **errp)
 {
 #ifdef CONFIG_KVM
     int irq_fd = event_notifier_get_fd(&vdev->intx.interrupt);
 
-    if (vdev->no_kvm_intx || !kvm_irqfds_enabled() ||
-        vdev->intx.route.mode != PCI_INTX_ENABLED ||
-        !kvm_resamplefds_enabled()) {
+    if (vfio_no_kvm_intx(vdev)) {
         return;
     }
 
@@ -300,7 +331,9 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
         return 0;
     }
 
-    vfio_disable_interrupts(vdev);
+    if (!vdev->pdev.reused) {
+        vfio_disable_interrupts(vdev);
+    }
 
     vdev->intx.pin = pin - 1; /* Pin A (1) -> irq[0] */
     pci_config_set_interrupt_pin(vdev->pdev.config, pin);
@@ -316,7 +349,8 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
     }
 #endif
 
-    ret = event_notifier_init(&vdev->intx.interrupt, 0);
+    ret = vfio_named_notifier_init(vdev, &vdev->intx.interrupt,
+                                   "intx-interrupt", 0);
     if (ret) {
         error_setg_errno(errp, -ret, "event_notifier_init failed");
         return ret;
@@ -324,6 +358,11 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
     fd = event_notifier_get_fd(&vdev->intx.interrupt);
     qemu_set_fd_handler(fd, vfio_intx_interrupt, NULL, vdev);
 
+    if (vdev->pdev.reused) {
+        vfio_intx_reenable_kvm(vdev, &err);
+        goto finish;
+    }
+
     if (vfio_set_irq_signaling(&vdev->vbasedev, VFIO_PCI_INTX_IRQ_INDEX, 0,
                                VFIO_IRQ_SET_ACTION_TRIGGER, fd, errp)) {
         qemu_set_fd_handler(fd, NULL, NULL, vdev);
@@ -336,6 +375,7 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
         warn_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
     }
 
+finish:
     vdev->interrupt = VFIO_INT_INTx;
 
     trace_vfio_intx_enable(vdev->vbasedev.name);
@@ -3092,9 +3132,13 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
                                              vfio_intx_routing_notifier);
         vdev->irqchip_change_notifier.notify = vfio_irqchip_change;
         kvm_irqchip_add_change_notifier(&vdev->irqchip_change_notifier);
-        ret = vfio_intx_enable(vdev, errp);
-        if (ret) {
-            goto out_deregister;
+
+        /* Wait until cpr-load reads intx routing data to enable */
+        if (!pdev->reused) {
+            ret = vfio_intx_enable(vdev, errp);
+            if (ret) {
+                goto out_deregister;
+            }
         }
     }
 
@@ -3338,7 +3382,8 @@ static int vfio_pci_pre_save(void *opaque)
     int i;
 
     if (vfio_pci_read_config(pdev, PCI_INTERRUPT_PIN, 1)) {
-        assert(0);      /* completed in a subsequent patch */
+        save_event_fd(vdev, "intx-interrupt", 0, &vdev->intx.interrupt);
+        save_event_fd(vdev, "intx-unmask", 0, &vdev->intx.unmask);
     }
 
     for (i = 0; i < vdev->nr_vectors; i++) {
@@ -3395,6 +3440,7 @@ static int vfio_pci_post_load(void *opaque, int version_id)
     VFIOPCIDevice *vdev = opaque;
     PCIDevice *pdev = &vdev->pdev;
     int nr_vectors;
+    int ret = 0;
 
     vfio_merge_config(vdev);
 
@@ -3409,12 +3455,37 @@ static int vfio_pci_post_load(void *opaque, int version_id)
         vfio_claim_vectors(vdev, nr_vectors, false);
 
     } else if (vfio_pci_read_config(pdev, PCI_INTERRUPT_PIN, 1)) {
-        assert(0);      /* completed in a subsequent patch */
+        Error *err = 0;
+        ret = vfio_intx_enable(vdev, &err);
+        if (ret) {
+            error_report_err(err);
+        }
     }
 
     pdev->reused = false;
 
-    return 0;
+    return ret;
+}
+
+static const VMStateDescription vfio_intx_vmstate = {
+    .name = "vfio-intx",
+    .unmigratable = 1,
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_BOOL(pending, VFIOINTx),
+        VMSTATE_UINT32(route.mode, VFIOINTx),
+        VMSTATE_INT32(route.irq, VFIOINTx),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+#define VMSTATE_VFIO_INTX(_field, _state) {                         \
+    .name       = (stringify(_field)),                              \
+    .size       = sizeof(VFIOINTx),                                 \
+    .vmsd       = &vfio_intx_vmstate,                               \
+    .flags      = VMS_STRUCT,                                       \
+    .offset     = vmstate_offset_value(_state, _field, VFIOINTx),   \
 }
 
 static bool vfio_pci_needed(void *opaque)
@@ -3433,6 +3504,7 @@ static const VMStateDescription vfio_pci_vmstate = {
     .fields = (VMStateField[]) {
         VMSTATE_PCI_DEVICE(pdev, VFIOPCIDevice),
         VMSTATE_MSIX_TEST(pdev, VFIOPCIDevice, vfio_msix_present),
+        VMSTATE_VFIO_INTX(intx, VFIOPCIDevice),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
1.8.3.1


