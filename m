Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C586680A08
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 10:54:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMQqy-0003DT-BD; Mon, 30 Jan 2023 04:53:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqX-0003AG-5z
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:53:05 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqV-00024E-Fy
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:53:04 -0500
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30U91W7r003981; Mon, 30 Jan 2023 09:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=nuUMh1QaGvriG9gaT76BowvaIQgTa1Bz5THTubxNj78=;
 b=Vw+iOaTX40BquGg6OlC2P9mPRQRcXWksFiW7tgxXpriuQsgDUvqr/OGQAneIWG5b0dQn
 XUYNqPo2s9VYT98RLVU9c9O/P615dHUjqrFtPQIrbsXbOGzWeGuoh1bGaNYHgmc0WcaZ
 aEEpH9yJ5o6s9nxR+uPUFnAj/hc9XJnrQGXWcZCIP48+do337yBiXDkOHa/UC2MTpLBM
 q5BckCevpckD7zueaXBicupzg3qwB2b0aWM1Qasrsg4jfWp9Nz3Kh8VHZgCuvzdqtD39
 rf9zjZAkQOBJE+1sp6+rmOCw1xXlwZox45U9Vn4VDk8jyI5hf1kScRswWOYZeEgnWauG 5w== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nctpat10v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 09:52:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwucTqDJ5qOpG1g9nWmQAv8pc7GBx6c1SedDZvWWpsGOwR/iNb4kCIhGzBKQFCZgGDNRYDrVfgJCU0b//HBJpxqeQjZBy61N09JeHzx8gQubsZRZmPZPaAGOaCtdfOatqaWrDk58tJBAD1AE57NZqECqQ3X91gO83W+slgbtDU3GcSD3byhr2KDrMnR3p/Srco6zwDgENUpk6CsMSNaP9ah0JCbwPSYuSpy4zJRFMekxm+FTbuAd06q8PC2F+rAbbqwPxD9AA83jEpghm0kg0GauSRtu6U3QTSmnTsoFCQcT34TKftH7zIW6dup3dMv67Dq7IPG5DaUNTTzlwFZcCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuUMh1QaGvriG9gaT76BowvaIQgTa1Bz5THTubxNj78=;
 b=GOj5s7DdlHHTlymZPT+Jn0PZELxn07bUZjF+Rxkbhq05bdbWuinOsqkLTYjHosVULN408fu1BFJ2vtSxCP1rQogIE8mQGw/uRzQ0jj0e8pOqxISjS2jlNgrd+3G2YDqHDQyyQT12ii5kYnlF0ZLf8G0dnS86XXH2+8ytMF3nQ38f81dNdfxlUdwar/yheD67fWNvdYSp0VpAHYM1aeJgRt005sYV0UANzOAD+bZLtdRrZp7hj0rlHrlwEyZVoAXzqvdxDGLWwM56LmDZNPEIAhwnx7cc46hOkUzc+pDP4LvGlO5N6J+2HlHpsYbU9HhtGZjbQCCKB9ItYAdikoXHnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB4992.namprd11.prod.outlook.com (2603:10b6:a03:2d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 09:52:50 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%2]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 09:52:48 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 14/16] hw/9pfs: Update synth fs driver for Windows
Date: Mon, 30 Jan 2023 17:52:00 +0800
Message-Id: <20230130095202.2773186-15-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230130095202.2773186-1-bin.meng@windriver.com>
References: <20230130095202.2773186-1-bin.meng@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0061.namprd02.prod.outlook.com
 (2603:10b6:a03:54::38) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|SJ0PR11MB4992:EE_
X-MS-Office365-Filtering-Correlation-Id: 5243b51e-affa-4859-ff86-08db02a7be9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5z5hNhBzCzcjdLxQEGdjY2OmYPqVfLnFH83R410bkgMvKdgaywQlMY/tOMlAyB9CWnE6OqOhlDZSyXpvL+JXsKOocCUA6oqHUvWeRjQIaL9/lxZa5ZZwgEyydShlYRINERntP+ZbQNogR92Hmbw1hJp2YPeYq1KYCHy5GKlxYrOkhXqWpgnK1tFEY2ecxxt/sHAkL9/qPSecAfmlgH6MvymxfvalOLi+ieczOBbbfNoVVukt0of2mhji8VR3MebJjnPx3vIMfSoJ++9ZihZS0hsmVWpiv/e83kGUZRGWbtPjT9gW4mNfLOBNmXulmqG5qmBQtQpngQKWmgenXaVAvPemqFNUheRF8X2zAd6mqFhug38TWcM0u6TKtEedodtrUWX6JgwykVSji5x+gk9C39qVSCc8hPPTWOSZhQV0mIDjvO9Fkb2f3Ep0TRmWRVxIXF6Dn3GU8SHeAgt0CJ4q3Zj2ckQFcMnbSz7zMId9QElLLM06mQl/Jt3M3qpIilTZKKOPcMZQ67gyhgSXHIVKZNhZv8cl2SUnfNeQROtQgFgjtZhhKhRPtTDo4FawjNe7c1trTBAqDvr12IDpdqn7NRFGSSpRE/iIyVuBsvJZYdCbbszlmjstoNCY5r+iwEcHBVl5qbvzgwWXMsi8jxKN087ceGCXvH+p19eptw0ohQ16dArUKH3IGEBmXYFhV7sdH2CGqSi479L8M5nDlTW5iw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(39850400004)(366004)(346002)(136003)(451199018)(2906002)(83380400001)(66556008)(41300700001)(8936002)(44832011)(6512007)(26005)(6506007)(6666004)(1076003)(2616005)(186003)(5660300002)(86362001)(38100700002)(38350700002)(66476007)(4326008)(66946007)(54906003)(316002)(478600001)(110136005)(8676002)(52116002)(36756003)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGUxejRKVmEzZlh1ajNNWW9ONlZyU3FnQjhobHhaOUViNFFETlpRU1dRMkcw?=
 =?utf-8?B?MGZhMkIwZTFCczNjZjMrWi9NQkdzQ1FkNUNOQ1A2a01Ib0JJZHBhVXRldTNm?=
 =?utf-8?B?RnRBTEpmRGFaa2NEdEh3NU1DeEVaVlFFaVNRdkJpKzcxS21MT0tpVFJKb2pE?=
 =?utf-8?B?U3QzZ0tIREl3eTF6RlZ1QTBFRjhwMzNIZnJybkttOTFFMWMrdC8rT01tMHJG?=
 =?utf-8?B?U2J6TmRxRXJxR0o2UCtCNXZJSjd6QUtmbm0ybHZRMlczTVZOazZuZ2VNRXAx?=
 =?utf-8?B?VUdYMkhNYVlCSFFxdTMxQktTcVR6MTBrRFpTcjNPazdyMWtrK2Jjdlgvc3J6?=
 =?utf-8?B?Ri9tUjlUdmhVZENuM1RucWdMb1VLRjJhZ2hVS2RPbE02TndJSjc3SExrclY1?=
 =?utf-8?B?L1grcU0wbW5DcHJ3bXQ3emdBOHROaC9NWjlWek1ib2NnbHlnN0hub0hyMkNs?=
 =?utf-8?B?bExTMXljS2hMbzcycmNMK1B3T0w1WVQxQkhwc0hHWitwZlR5K1ZrZUxNbXhU?=
 =?utf-8?B?RENJS1crTzZiSFdPdlplS2lsSmEzMlFxNEFGbk4rRmtuZjg5T3J6bm5kczhl?=
 =?utf-8?B?N21QZWZvdTV4SjBzU2NRQklCbm1FaG96N1pCNnE2SlFaZE5COENzVFZ1bFlm?=
 =?utf-8?B?QWRxNHBpMTNKM0RvV2dZaWdRQW9WUlpHc2hkOUFJUzdVcHMwUWdyMTZweDFr?=
 =?utf-8?B?aEdvR0xqTUhpbG5Hd0V5cmNTdFZqNTY2SDM2ckdIejU4TUNNY1FxZW9QS2o4?=
 =?utf-8?B?SmRUb1pVWEU4d1NKMnI4NTBwekFUK3QzVjdWYnp4WGpXc2o0emZrM3NCWkxW?=
 =?utf-8?B?SnV3Q1U5d3lmUFp5cDBtWmNZNlR1d0ZnbGowK2VERGsvdEFGYnY5VUpGZzVw?=
 =?utf-8?B?S01rdTNleHdzWUJ3SEl2TGlRQ0ZmUGJ0NzVzaGxmUUlBT3JnaU1CU204ZEdB?=
 =?utf-8?B?RmtqM0NZR0JwSlZ6dUJmMzVwaEJnelBtSFo2OWpKQXhoeHIxOC9XbThoVHla?=
 =?utf-8?B?Z2NWSlhCTG01WjhnSW9Pa0x3T0VlK1MyWHRkNmkwRUptRDJXY1F6UTZiN0o1?=
 =?utf-8?B?UTY0NUpudSt6c2VDMWF2R2xaYVdXeXBXTjJuWjc0SXA1L3dxUXFqaXBsdC9n?=
 =?utf-8?B?eUdWOXY0QXFpUlJHa0dSTnVtd3FnWXRLcTRNM29tNFRKNEU5WnoyUE5UZW1o?=
 =?utf-8?B?VmNZWjZjYk5uT20rV1RZWFFVQ1Exb2hvN3c3dHZudlBIT01hNUl4ZnZZRldB?=
 =?utf-8?B?N0QzaU9ERGFPV3NBazJZQzViSVB1MWpZVmlTci82SEpIcWtGREdMZm9xaGo4?=
 =?utf-8?B?aWtLdWo2L2YrcU8zcWdReExVcFByc2FlVm1LV3dMRGZ6K2FxNTk1UW05SlFk?=
 =?utf-8?B?cmw0VlU3SXoxSjYvczNheXo0TDBkVkE4QWpuRlA5akNESHhKamVLVG1OUTZn?=
 =?utf-8?B?cWdBTDBmMVJvL28zNU1uTHpscjZNMFFzRHNwNVRxZzM1aWZMQzhQSFhLeXN6?=
 =?utf-8?B?cG1XOU1FUTVPTnhyWGhueTVwbi9TM3VZZ1NUM0tQTDRIMENmQ2FISHFYQmdz?=
 =?utf-8?B?ZkQvMlNJdytwZ3BLY1lkSDM4Y3NIS1dUUTNEeXZqUWpJaTUwVzcrU0xWV2w2?=
 =?utf-8?B?cSt5dHRkYVpzcC9iUDlCMVlnWlpLSk82cExrVUZqaUJ6dzBZK05UUlVONXFX?=
 =?utf-8?B?aHRER0ZkSjJXODhtVmRFTnlYejUrTEl2cmtjK0EvRStONytrb2FOL2lUMXpk?=
 =?utf-8?B?cTlnTVdNbEFsLzkrcHgzSmZnNTJCZ0FHeXN1TmlsK0JCeUFrczRDT0M2ZVV1?=
 =?utf-8?B?cnJCNXJjN3ZLbDFGNW5EckY5UWoxb2NBNkg5RXF2R0dkemMwaGY3aEYvSjR4?=
 =?utf-8?B?VzZCcHB3Mkt2ZWhmZzVqNG1ZeHM2UVd2YlBueWRBZlVWWTVKMFlPQytoYy9M?=
 =?utf-8?B?MElSdjJFR29TWVpuKzB5Q2lpeUh1VFA1RDNYdWxCRTlUVGNwT1N3VnNIOHRB?=
 =?utf-8?B?ODA1SXp0VmxKSjlhZ1VpQUI3RCt5ZU9iaXR2RnRwUWRTVmNsOTBQdU9mZlRY?=
 =?utf-8?B?M2NhRG5pa3FEcWpPZmw5ZTIvZ1FoWndvSUlqcFhZakZRWmtleEU2ZG82bGRl?=
 =?utf-8?B?eU1NMTNEVWxsRUVrbVlHZjJqSVBXUjd6MXFUaEVZMDFDRWoxUFk4akNjaE5L?=
 =?utf-8?B?NlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5243b51e-affa-4859-ff86-08db02a7be9f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 09:52:48.6819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nF1gfaTaQuPT5QGVUU39z0jN1tBWWco5xQiRjWlKhFtVSl1VgpLeFnWISpRpQt9n/5RDMfZ/TUWNoReMWImu3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4992
X-Proofpoint-GUID: ZxZA_mnYh4WDk6UwJG5NEI7sPFsfyIfr
X-Proofpoint-ORIG-GUID: ZxZA_mnYh4WDk6UwJG5NEI7sPFsfyIfr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_09,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
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

Adapt synth fs driver for Windows in preparation to running qtest
9p testing on Windows.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---

 hw/9pfs/9p-synth.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index f62c40b639..b1a362a689 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -146,8 +146,10 @@ static void synth_fill_statbuf(V9fsSynthNode *node, struct stat *stbuf)
     stbuf->st_gid = 0;
     stbuf->st_rdev = 0;
     stbuf->st_size = 0;
+#ifndef CONFIG_WIN32
     stbuf->st_blksize = 0;
     stbuf->st_blocks = 0;
+#endif
     stbuf->st_atime = 0;
     stbuf->st_mtime = 0;
     stbuf->st_ctime = 0;
@@ -230,7 +232,8 @@ static void synth_direntry(V9fsSynthNode *node,
     entry->d_ino = node->attr->inode;
 #ifdef CONFIG_DARWIN
     entry->d_seekoff = off + 1;
-#else
+#endif
+#ifdef CONFIG_LINUX
     entry->d_off = off + 1;
 #endif
 }
-- 
2.25.1


