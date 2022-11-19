Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FCB630DDB
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Nov 2022 10:38:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owKHl-0000RC-4y; Sat, 19 Nov 2022 04:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1owKHj-0000Ps-Bj
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 04:37:15 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1owKHg-0007EQ-5f
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 04:37:15 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AJ8kuLH029117; Sat, 19 Nov 2022 01:37:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=FNI8cGHP45hfpLFPuzK04hgS8usAoGbWAEdkTwO8J5c=;
 b=Fbt0KPvltL8EYKnrlRJqzfKph6uGGIC0K6mcppS+jjSQVmaqp282DJYf/WLiilB7EeiH
 Yz5wexczo7mDm1c6Wj4kgeY+c52+Vu7XP7jKdWZql5m9EwhTPwQYC4AUeL35F0dU+R/w
 7oPMCy/XtNRo00eb6cTVZGa2aBGJtvo5QOw+joOnWRhoQg7AezbLScprlqwMC5N5fDXy
 Y8UGQYyZhWMLhPXSo7ei0QmV1FbGLP2uIzhLwhuo9jT8KPNPON521SKpi/wC7ARSiW28
 ulrfFqxHWhQVEGD/4SA9DkIi7J3ZVLIpsVBp3Eld5XsEW2Sn5cvPQ0HUx3SdO401ErjB zg== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxuxcg1tb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Nov 2022 01:37:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0zj7iOV84Pam4xU25gQ6iwWQN4NLSaaIVYoolFr3Bssc48vQUxn+/mZwMPTSgZhQDyx782IO8n//8R35gby0enZQUOP1vFqV853x2iSvuS8hQ8J2sLW2WKg521OqnVUC8jztXVvm7SISWRIXcj/Exo4iDBvbpxkmsjdOSYkCcvxooVDFwg2Ksqi445XTrs648y1+3gRc0hbILLnCLnELHeuh8etBJTdMDPe3xaA7q09aepReMhygx6yFhG+FnNjDpNCkz34sR3JeK/XVrBSvNZG7acWP4QbuAr3oHDE3iinH9KWWdL3Aaz/iFXrPor2wW1/IYKn8Xq1gB+SHRSxPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNI8cGHP45hfpLFPuzK04hgS8usAoGbWAEdkTwO8J5c=;
 b=OUbvExQpUVE/TIiKiC/q3qngr87KE6PI5sT2hvNWwD5luldHpnWfwi7ydTUfm4N21vl8cZ9FdyiqGJxVwkDg7RE4vQAsXDYmblSUZW9wRdIWa8gn44Xyeoa74liT+YMRI83mRc0yFMCxEx2m2nXp9jfsMa45o4QsX1Q5iEX4JKFxn0tfmZIWBfBkgm3dDiUX/W4JmmiNGCsH4uzMXnLpel2naiiqptxWhBwYkQQpnSmyoqOxe712hVB4YUWI7imEnRG6ASg3l5bCsEA58yy8sX/W6xI9GNl69adPfSCJ6QNf5gk4DmerAJFfsIRTmUItgZPa55NZvP6lH4xnbdBDJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNI8cGHP45hfpLFPuzK04hgS8usAoGbWAEdkTwO8J5c=;
 b=KGYybFkMX/+T9a0FoApfaFs6HgAkOei7T2y1yZbeb6XrMyKoXPwyyTp3FfvnAdsH8vj0D1L9HSaq/bUMVbrcuIUmPa9gmQ7tdXn0eJ5RXE3PVc5jFsDJKT/cWXFyq0fFIbmvJTWyZj7+6ckTwBpzJhZFxsGnUz0mJsNBReT0uSE6Jy3vws4R4/K6dqFmzW7icyV6oth4ctzeccARjL4LoIhS6FwkdvGl4sTDSIkV7r6QnIeDNlvrzXgtv7KxrgRgz8nID3jbeyPkYEhZ1EEYx3YHyx+82wv7XUcOOEVUX8xKKpATHLaPkzuQVo7yy5J+UpXfJvN4fS5HyLKmP/mEbQ==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by PH0PR02MB7479.namprd02.prod.outlook.com (2603:10b6:510:a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Sat, 19 Nov
 2022 09:37:09 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5834.009; Sat, 19 Nov 2022
 09:37:09 +0000
From: "manish.mishra" <manish.mishra@nutanix.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, peterx@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com,
 "manish.mishra" <manish.mishra@nutanix.com>
Subject: [PATCH v3 2/2] migration: check magic value for deciding the mapping
 of channels
Date: Sat, 19 Nov 2022 09:36:15 +0000
Message-Id: <20221119093615.158072-5-manish.mishra@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20221119093615.158072-1-manish.mishra@nutanix.com>
References: <20221119093615.158072-1-manish.mishra@nutanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0058.prod.exchangelabs.com (2603:10b6:a03:94::35)
 To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|PH0PR02MB7479:EE_
X-MS-Office365-Filtering-Correlation-Id: a8cec5ef-f73b-4a73-c92b-08daca11a0fd
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SSy09udm3GJ8KJpjKUQYxAt7Qhfg9m809OoC2UC1+/fCMLmmXsVBln8rU6LfXnKH/fhkzA9nv2Mrg308VbMEocwcMK8gW7SZEHdYGhn3Sxjx4aD8M6LrD0DieGJ2eBqcOcI97EInbfOrkvHBe9A2veImkFTJNbbgMJQhnNBDy4dZgwBXuHQEQH9jFwwaEYuW4dlVhA1B9uwy1zYMNiAx5PDdI14RCOEnQQdw/EaEI/qj8SSKwa07YFdohmsI/oPnJ9vgxhLidv5CxBH6VfVKELtzktaH8iP0LBX+UZl1LGB6D6WUYz7X/nQ57Y9wsOEOGOVRlq3baaVOO9ABGBAjo9QZ/mSdWZ13YODThmn7D0IG/SO1wCugjDJPrpjO2LQLLuYXyRiYdBUruPgv1aFHoQhe44r2NMCUMlK8eX2kH1ldiRve0yOyJZq2TBQbB1Ai+p8FWib3qwSdwkKwZuuo9czvlCdeBLGCh750s6t0g4QCCyqyLzZFekGLlQz5ME1zSm+FvQLv5Vo7t3fDYDBb72ujIBvHTerwPAXlA6Ksb2bsVjazrYap5AsUXZ0l2gBTL+KZY54XNMOyecgnN5hPgST5p8H/XuC/qOnxaR5nFB2V8a0bIPLhOuJocscmUIlNS56MtJQ16vQS+E0yMOECoVltP/FPH5Tq0MqgSVOgIRf06dgYntJHxjR96EsfB0NwbnO4lpXi5Gzv5AHflVuOsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199015)(478600001)(6512007)(6506007)(6666004)(6486002)(52116002)(107886003)(86362001)(316002)(6916009)(38350700002)(38100700002)(66476007)(66556008)(66946007)(4326008)(8676002)(36756003)(26005)(2906002)(41300700001)(83380400001)(186003)(8936002)(1076003)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mlk1OFZyYWFGWm1RN0hNdmg5RFhsSDFlZllLRndJQjJ4b2RPL2s5SVgya2wv?=
 =?utf-8?B?Ry9kS1NaSmx2amNzZjlMcC9id0hvWXNKSjE4TCtMWU1ZMDRwZFVsV0YrT0o4?=
 =?utf-8?B?SUt6eVhSekN5U0FoWGQydFk4MDVpaGRjNmdwWUV0TlVxMk5Ub2xTcG45Vktx?=
 =?utf-8?B?dERsMFVZTzdpSmZYMFdod1JldFlobjRmL1kyMDFtUTQwbndLMy9jQkpKamxZ?=
 =?utf-8?B?TTNzMlhhOTNGV0N5UkE3ajVxY2xKMzRRM3Y3cFRsQVZRenlSN2dqVm5vd01T?=
 =?utf-8?B?L05lQnJySEIrdlNDb0VBQlF1SzdZQ0tEMUlRS2V4SUxKVEVrVDJHejMxTnRi?=
 =?utf-8?B?cVRTbXRyR2NTczhmL3ZTc0ZJV3gzVHduTDBmODlQQVorWTRPUWpvTjIzNUZn?=
 =?utf-8?B?ak5sU3I2UUc4ODcwWGhrem1hNHB5T0tkVFJMRTdhdHVKSDJGM0svVWFseGhi?=
 =?utf-8?B?WGYyL3hBTitZcmg4cDZSbHlBYXRTRXl1T0N3R1RTOGYzM09MZDhuZGQ5VTN4?=
 =?utf-8?B?SzNKSmwwVXRpR2VSK2RqYURvNGo1R1FXK0tBbFo1QTRYYTVucTl2ZFFtUngy?=
 =?utf-8?B?bkNkdExIV1JoUWx4VGVodHp3NHlJbXdXUUEweTJ2YnNIUVVRejJLM1FyMCt0?=
 =?utf-8?B?bzFSV1hDZkVYN0hBMTl2bXkweG9JTENpbVF3TTZ2Q3pmT2Q1R2c3RXhFTS9D?=
 =?utf-8?B?Z3BXQWd3dmpEd0NCRzMrREdoNmZpREZvZXNXQWZUbVBjeVBDMlVJaVIrc2Vi?=
 =?utf-8?B?VjFsQ2J3T3M5ODZ0TDAxMHo0MzlUNDZ2NXpQVEEwTnh1QUVjQzUzb05DL2Ex?=
 =?utf-8?B?VkFDOVJreWdMNGlSUGwvUGR1TzJ0d3hVRHN3V0pWZ0NPdTErK0dWdStrY24x?=
 =?utf-8?B?dnFGYkd6QWoxeFVGbSsxY0dTMWpEZUlTYnNpZlZZMmFiYXVxdHEzd240WWpt?=
 =?utf-8?B?eVJqM0Q3K0xHd0NMbUpXODRJVEJqZ3gveTgrYzJ6QzZyczJsQ1RQYmQyeHVy?=
 =?utf-8?B?bldlRmt0Yks4ZmpDNjZicE1WR1o2cnZJOHBKYWNDc1ZTOHIzVFZCc0lnWFpK?=
 =?utf-8?B?S2o2Um16Y2xXOFBTYXhkR1p0L2tUV2t4UGN0NElERisveE1tcXRtVmtCQnoz?=
 =?utf-8?B?V2Q3WXJaazJmQlgxbE9iYXdtZEt5eVNXRGZQMlZScWt4QU1nWXJRbzljRUJm?=
 =?utf-8?B?Y3hWSllsWDV0TExIMkVVYlV4Um1iSklhSE03TEE3S3d2TFJMWWkrbnhHOWF4?=
 =?utf-8?B?eGV0UnZYMnh5Y0poZ0o4dHpUcHlqU04wL3J3TEwvVjNXN0dFaXdubGZrT0Zp?=
 =?utf-8?B?K2ZkTDZWeHFvWUNFNVRJdFhCYzBDRmhPV211ZEU0aFlXL3oyNXk3blp2d2Jh?=
 =?utf-8?B?NUFxNG5aNG03SVpzTGVBN1kxaThyZW9QMjlKSW9YdDBYYjZxMTUrZnk2R0l1?=
 =?utf-8?B?L0FJT0c3ZmtKOVVvcFFSWkJTR0ZFOXdDYXUycjBMRzF3dGx5Yis0cE5vd3dp?=
 =?utf-8?B?Ti9MUXlFd0xFV0xUdFBQSTRiTXZzUThMOG9hdEZFWEczM3pxSittRWs3MVlT?=
 =?utf-8?B?aGRjZ3cvV05nenREQ0U0TVozVldhZDBwVDMvSlRCdWs2Zk5GcndBdU1zcUwy?=
 =?utf-8?B?OVVqTFpmZTRCTXplZU9BM2QzcVBHS0NzOWw5dTFQbFVzWHhvTTJWUE5TWDlw?=
 =?utf-8?B?cmg1OW1Db1BDUXlReHl6VGh5Q0dBSG1lNjU1a3p5OWIvalZPUWVQOSs0anVx?=
 =?utf-8?B?Y21YNFdxazA1MVJLYWNwSVhzZG84a2N5YUpDU0dmbm5LcGFHSmo3dkNoVlpM?=
 =?utf-8?B?OUI4OVU1N0VFMzF6N21HT2oyemNib255MmJIdnBsWTdTazgwS1BoRDdZK0ZQ?=
 =?utf-8?B?QWRDUWIvVDZmdGxEaElob1ZueHpMeUlqTmFOTjhVaXk5ZGVQeFBHdVN6Z1g5?=
 =?utf-8?B?dTVGZTFiS21ZU0k3Y2lLL1crWnk3Y1UvVUN6SzhiOWcreE9sQk5LcUt5MjVL?=
 =?utf-8?B?N0FrVUk1c282bE5YNzR0YW5UemxtOFlYa3d0TWgyUVdzY1QyUkl2TXMyN21K?=
 =?utf-8?B?QWFQNUZiSUJOWFQ1a2NZUFhBTUVXeTRLdUZDZW1BcGtCR2VkRVdGS2k5bFJ5?=
 =?utf-8?B?QnhWSllEMzRUejhKQnVzY2tGYTZjOVNGV2hRdlQ3aGFKYjFIUnpHQVRqOVVj?=
 =?utf-8?B?VWc9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8cec5ef-f73b-4a73-c92b-08daca11a0fd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2022 09:37:09.1993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vu/rpp9Y4EFCdKaBogPuRyVnfUsNn7IE7L16rPO+NDQImSBM+PrT4c0kGWFT8/ITDy4aOuqCyG1N89UIUnqNZzBuEPcFNrI4UKYzOSH5RU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7479
X-Proofpoint-ORIG-GUID: BDlkHELvf1Zhly8qBGo9STyNBFRY88is
X-Proofpoint-GUID: BDlkHELvf1Zhly8qBGo9STyNBFRY88is
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_08,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Current logic assumes that channel connections on the destination side are
always established in the same order as the source and the first one will
always be the main channel followed by the multifid or post-copy
preemption channel. This may not be always true, as even if a channel has a
connection established on the source side it can be in the pending state on
the destination side and a newer connection can be established first.
Basically causing out of order mapping of channels on the destination side.
Currently, all channels except post-copy preempt send a magic number, this
patch uses that magic number to decide the type of channel. This logic is
applicable only for precopy(multifd) live migration, as mentioned, the
post-copy preempt channel does not send any magic number. Also, tls live
migrations already does tls handshake before creating other channels, so
this issue is not possible with tls, hence this logic is avoided for tls
live migrations. This patch uses read peek to check the magic number of
channels so that current data/control stream management remains
un-effected.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com
Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
---
 migration/migration.c    | 44 +++++++++++++++++++++++++++++-----------
 migration/multifd.c      | 12 ++++-------
 migration/multifd.h      |  2 +-
 migration/postcopy-ram.c |  5 +----
 migration/postcopy-ram.h |  2 +-
 5 files changed, 39 insertions(+), 26 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 739bb683f3..787e678d48 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -733,31 +733,51 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
     Error *local_err = NULL;
-    bool start_migration;
     QEMUFile *f;
+    bool default_channel = true;
+    uint32_t channel_magic = 0;
+    int ret = 0;
 
-    if (!mis->from_src_file) {
-        /* The first connection (multifd may have multiple) */
+    if (migrate_use_multifd() && !migrate_postcopy_ram() &&
+        qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_READ_MSG_PEEK)) {
+        /*
+         * With multiple channels, it is possible that we receive channels
+         * out of order on destination side, causing incorrect mapping of
+         * source channels on destination side. Check channel MAGIC to
+         * decide type of channel. Please note this is best effort, postcopy
+         * preempt channel does not send any magic number so avoid it for
+         * postcopy live migration. Also tls live migration already does
+         * tls handshake while initializing main channel so with tls this
+         * issue is not possible.
+         */
+        ret = qio_channel_read_peek_all(ioc, (void *)&channel_magic,
+                                        sizeof(channel_magic), &local_err);
+
+        if (ret != 0) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        default_channel = (channel_magic == cpu_to_be32(QEMU_VM_FILE_MAGIC));
+    } else {
+        default_channel = !mis->from_src_file;
+    }
+
+    if (default_channel) {
         f = qemu_file_new_input(ioc);
 
         if (!migration_incoming_setup(f, errp)) {
             return;
         }
-
-        /*
-         * Common migration only needs one channel, so we can start
-         * right now.  Some features need more than one channel, we wait.
-         */
-        start_migration = !migration_needs_multiple_sockets();
     } else {
         /* Multiple connections */
         assert(migration_needs_multiple_sockets());
         if (migrate_use_multifd()) {
-            start_migration = multifd_recv_new_channel(ioc, &local_err);
+            multifd_recv_new_channel(ioc, &local_err);
         } else {
             assert(migrate_postcopy_preempt());
             f = qemu_file_new_input(ioc);
-            start_migration = postcopy_preempt_new_channel(mis, f);
+            postcopy_preempt_new_channel(mis, f);
         }
         if (local_err) {
             error_propagate(errp, local_err);
@@ -765,7 +785,7 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
         }
     }
 
-    if (start_migration) {
+    if (migration_has_all_channels()) {
         /* If it's a recovery, we're done */
         if (postcopy_try_recover()) {
             return;
diff --git a/migration/multifd.c b/migration/multifd.c
index 586ddc9d65..be86a4d07f 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1220,11 +1220,9 @@ bool multifd_recv_all_channels_created(void)
 
 /*
  * Try to receive all multifd channels to get ready for the migration.
- * - Return true and do not set @errp when correctly receiving all channels;
- * - Return false and do not set @errp when correctly receiving the current one;
- * - Return false and set @errp when failing to receive the current channel.
+ * Sets @errp when failing to receive the current channel.
  */
-bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
+void multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
 {
     MultiFDRecvParams *p;
     Error *local_err = NULL;
@@ -1237,7 +1235,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
                                 "failed to receive packet"
                                 " via multifd channel %d: ",
                                 qatomic_read(&multifd_recv_state->count));
-        return false;
+        return;
     }
     trace_multifd_recv_new_channel(id);
 
@@ -1247,7 +1245,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
                    id);
         multifd_recv_terminate_threads(local_err);
         error_propagate(errp, local_err);
-        return false;
+        return;
     }
     p->c = ioc;
     object_ref(OBJECT(ioc));
@@ -1258,6 +1256,4 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
     qemu_thread_create(&p->thread, p->name, multifd_recv_thread, p,
                        QEMU_THREAD_JOINABLE);
     qatomic_inc(&multifd_recv_state->count);
-    return qatomic_read(&multifd_recv_state->count) ==
-           migrate_multifd_channels();
 }
diff --git a/migration/multifd.h b/migration/multifd.h
index 519f498643..913e4ba274 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -18,7 +18,7 @@ void multifd_save_cleanup(void);
 int multifd_load_setup(Error **errp);
 int multifd_load_cleanup(Error **errp);
 bool multifd_recv_all_channels_created(void);
-bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
+void multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
 void multifd_recv_sync_main(void);
 int multifd_send_sync_main(QEMUFile *f);
 int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset);
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index b9a37ef255..f84f783ab4 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1539,7 +1539,7 @@ void postcopy_unregister_shared_ufd(struct PostCopyFD *pcfd)
     }
 }
 
-bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
+void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
 {
     /*
      * The new loading channel has its own threads, so it needs to be
@@ -1548,9 +1548,6 @@ bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
     qemu_file_set_blocking(file, true);
     mis->postcopy_qemufile_dst = file;
     trace_postcopy_preempt_new_channel();
-
-    /* Start the migration immediately */
-    return true;
 }
 
 /*
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index 6147bf7d1d..25881c4127 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -190,7 +190,7 @@ enum PostcopyChannels {
     RAM_CHANNEL_MAX,
 };
 
-bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
+void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
 int postcopy_preempt_setup(MigrationState *s, Error **errp);
 int postcopy_preempt_wait_channel(MigrationState *s);
 
-- 
2.22.3

