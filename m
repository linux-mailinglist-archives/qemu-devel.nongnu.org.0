Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1B94EAEB4
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 15:47:05 +0200 (CEST)
Received: from localhost ([::1]:49216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZCBc-0007Xz-Je
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 09:47:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nZC82-0003cu-Qt
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 09:43:22 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:64930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kshitij.suri@nutanix.com>)
 id 1nZC7z-0006eY-Uo
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 09:43:22 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22TC0LiL028548;
 Tue, 29 Mar 2022 06:42:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=aWpq8ynHbMCTC5tG3JF67oR8pzzbwd8Jq4ZPLYpS9lI=;
 b=w49Do/Agqwhig7mGJ4Q6oYRgaYbLVV0G8hD0M+oQ8N6YYu0wrhl/5Dm1h2U86vhrl25L
 6SU9oT4yJnAV69KsnHDhye++QXGYpuTDS6OhgEdpnpeUSVt50jKO/J0RsgQ3JmpxYXa6
 R7jVz9Q/0SjI07CML5nKOO1SteHTReLFxyRKuUUQqEvj3HhOabLVqZeT1F6a7xxBnK9j
 VAbqT484s0pkz9Hf2lu5ft4g9BoiFYMWuoJowY8DYeK14/1c9DpOdgXI9VonN8ICfkYP
 rpkveozUYrHXvFnCe8MDbcdU4U0GUKG61orzyvD3NHg6xyE1bJFu+Vc4xRidvvj3rID+ EQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3f20c9e5nw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Mar 2022 06:42:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPTiK101LeDrq2HkAFkFHumkzz1gpv34QEZJMFbVeRbUHwGsDAipgAFtNE2aFntBcG3KcSLWha96PbEz8QSQOJwPeoTlWOkV2xGon5xq3FK/nkmNKOUxa+WNF5KXwdjcmXxOUJxPchbkjM2ThmhDjDY9+BqM7LnowFuG3IEtMbDSp3ij7yAoABLuyO+iF4DQNhgQVkPaklX3KhwCFuSe8LCb3pHrL4CmOKXNn+BXGQtE8YJ2v5ULcVOx7Sj9e4qFhQzV+KBXFgRKRIFCjsSVFLChEDBNd3E8l2frifBqy5x239D39wt3Dvhb2rB1w8bZOpGTHMeRVux047AXWNxJYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWpq8ynHbMCTC5tG3JF67oR8pzzbwd8Jq4ZPLYpS9lI=;
 b=P7p0+JzRw+/dQKCK7/ru4liGWWg6ds7B8BY9UHL1jjTk2dHxRi0dOOYAQASSx3eyw20bNJWMEh9IbpuCjQSunVrWt58US9A7kDvP0kCA+qKIuLAOg1Vo0bDWlzmun9JovPdF93n2SqySh6gygjxEo5rvMjgbr5bgnqT5/rvEnglfS8E5k1eyXcnIY35Ix2kwM7lpA7zGGbb6jqsT/Tyvi577AqS5Q7UWulbJZ6xyoF8IjeEuB+r4qK4vpS6ld0h3aIjKwSqr/nscj2EXE/JeZixcblb96hyXFtnKWZg5wgy1IwE6x1+NWVWmpqCYTEjk5LVufOunloKWrHfXWsYuMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4048.namprd02.prod.outlook.com (2603:10b6:805:2c::26)
 by BY5PR02MB6193.namprd02.prod.outlook.com (2603:10b6:a03:1fd::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Tue, 29 Mar
 2022 13:42:52 +0000
Received: from SN6PR02MB4048.namprd02.prod.outlook.com
 ([fe80::f5cf:57d:ddf6:945]) by SN6PR02MB4048.namprd02.prod.outlook.com
 ([fe80::f5cf:57d:ddf6:945%3]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 13:42:51 +0000
From: Kshitij Suri <kshitij.suri@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] Replacing CONFIG_VNC_PNG with CONFIG_PNG
Date: Tue, 29 Mar 2022 13:42:34 +0000
Message-Id: <20220329134235.44298-2-kshitij.suri@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20220329134235.44298-1-kshitij.suri@nutanix.com>
References: <20220329134235.44298-1-kshitij.suri@nutanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0208.namprd05.prod.outlook.com
 (2603:10b6:a03:330::33) To SN6PR02MB4048.namprd02.prod.outlook.com
 (2603:10b6:805:2c::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5198c118-91b0-4c70-40c5-08da118a0539
X-MS-TrafficTypeDiagnostic: BY5PR02MB6193:EE_
X-Microsoft-Antispam-PRVS: <BY5PR02MB6193626E9E971F2946435FB3991E9@BY5PR02MB6193.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oxNbaUOThCt4AcmouJW6mdqenzIr9GjO5WKnwnQSgCrdZzlxXZK4a8UxiKrOnXTXNihzdcBE3VSNBZs8mG0NXH/adxxguim2lzmm/Vb9Q0pj9aZnK6Ng9U7m1clORkq+OZz02krXm9xDMK0gdFopO641v659JJoQvUKzA9eB70sxXjPgKLfmwCHngFwaB2VixcLuAxBK96uQoRi3xGZjy3lS0rGMbJXGdmvpmaDwJegkUgnY0QxQahJQ4z+xB+3aSj3hXOYlR4nTIFUT+L4OGMcIhMwHsRLliINet/XJ7LUQ2OAttYKWptHpxHJGIG3NUJnhaqpVQFJ4fHyR3T0UuDf9LhF49phmXBo68c/WB4h38ap1sEKny2eUaohiM/jRJIS40Orom4Vqs335wKWFqqMrPXd1wZFKC5twpQ8zBC8KzlyN75f8pdxoDACMxfNsm3vhE6hDQubX7+0DDHIl/4kGjByyyMNi+PQtxP/8GjsZLXQXOBD2CnURlaglTJJ1jSxsDjhpvwixkn230iWbFprwt+g6027uv94uVpRS5NqYeiY8YlZiNMWZA2BNLjc0kYomvZAhsOwUyhos0/GH+Vxn3sHcEYsu+cal+4pPQn6NYEEcxTTSpLyZDBD/pNl6SAna6LobCa3NVx/vP7Ax0klF5m1fCxmO80zqTio82Jeb/EohSApXI38Th8FBkx2pBBXJi25UU/DqxzoZYreK2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4048.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(6506007)(508600001)(6666004)(52116002)(8936002)(66476007)(316002)(4326008)(44832011)(66946007)(5660300002)(36756003)(86362001)(6486002)(6916009)(8676002)(66556008)(83380400001)(38100700002)(38350700002)(2906002)(186003)(26005)(107886003)(2616005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L01lM0tlVHcvOVpLaVpORmVEMWhtNDBNZHE1Ylg2YVdzcGk4c0ZWaCtsZ0ZV?=
 =?utf-8?B?QmVBUDIxWFFvaDNoaGZHdGJkR1JLZFg0Q1QrVVBKam5YQ2w5SG5zdnZpZDZL?=
 =?utf-8?B?UDBueG5ZUGdvUXlEVWlHSWRubGdiMkd4YWFlN2xsaVd1cndBMi9lMVF3ZkFG?=
 =?utf-8?B?cWh2bFZITFdXK1l3T0dmWmhZRWdrWnNKVWJxcWNFOWF4Njdxb3lsNHZ4NFUr?=
 =?utf-8?B?L1R3aXgyOG9vMUV1MGJ2NWJId0J1Mld2N0dhM1Z3MHVYQVAwZTFFYzNDYkpx?=
 =?utf-8?B?YXdBRXNaencyN295Q0phbU5FRlVPTnMxaXdGSlpEeEVRQitTcjAyY1MrQlZQ?=
 =?utf-8?B?SmNLV3N4QUlISndvUTJFZUNxMEFFeWNHOE1pU1M0SUltUE5OeUk0ZFlDUy9X?=
 =?utf-8?B?NEcrRUFwc2tSb2VSNkJ1ZmtnTk1LamxXekNZYWwxbWxCNW0xcllpWnBaZ20y?=
 =?utf-8?B?SHF6SHRiMHk2dUd0UTNMekN0eGl0TGlpL25XdUJZNjVYUGFOZ0xxb3Y2cWdU?=
 =?utf-8?B?UzJjNzFVUkM3REhCUHdUVS93T2pXajM5MDkvckt2WXFpK0swaVBZMEM2V2w4?=
 =?utf-8?B?dVRsaVcva3hGanFiVklMYTErbHp2dmY5R1lMbmk5SDFYeXd3c05ucTRrSjlX?=
 =?utf-8?B?UEhPMlpvUDdnZEFObDVTQzAydkZHV0kvNEtkK3lyRGJwSk13aklnRU5wMDA2?=
 =?utf-8?B?dVRRTDRrQlk5QVRrai9MRkJ0NzJMbFFGeUgwMkpUclFZUmd0NHdTZFNkMW5J?=
 =?utf-8?B?QjFhUXNwdi8rUjNGdit5QnFxVjJHdjdHVFdDTXp0anRraFhTTnJudEU0MnZP?=
 =?utf-8?B?N3k3SzV0cWtYOG5JcExnNUpkc0hKM0ZQeXRFalAxdjcvMS95TmJPbElOQWc1?=
 =?utf-8?B?LzRGcjNsR0ErTVdkK1pyM25zaUZVTGovZzFicTR3dE1kTFMya21xT0VSVnJx?=
 =?utf-8?B?RjVDUGdkVkpSTWxKMWVqRmJaeWppOUVsNnQxUnk1YUlsWk1KcS9BMFozT3gv?=
 =?utf-8?B?cjJ3TFZPYkpVeEl6bmxkTzhFaDM3VUM2a2RMNHZZQ3ZXTEtjaDBDak0zN09z?=
 =?utf-8?B?Z2Z6L0E4Q0p5aEsxWCtlQjNmYXlFWG9Fd2grZ0kzM1MrYzdEU2Z1anVSY2Rh?=
 =?utf-8?B?bHdyNlhBcmdjb2lBQ2I5YVRhTFlKSlQ5cGlib0JZZFFtZlNweUI0TmNFdGFM?=
 =?utf-8?B?ZXJUYXlQMktiWTE4QUpvbVVLZTRqRDJERWFCM1l0RHErUDV4Tk40dEVmRWt1?=
 =?utf-8?B?aHRmQll4NWtNQWt5Nk5mMUZ2ZVNYamFLTFVFZ3IwcFIzT09lM25yM3I1RlpM?=
 =?utf-8?B?YnBzZjFHamp2RE41bVN3S3F1SzhaOURqeDNveG5vcEdPRzFWWW03N0N5SEVv?=
 =?utf-8?B?WFU3d1pCQXg0bTZ0ZE96YmxFUFFmK1BCelJjR3JWMC9EZEV0VXFNYmZnSjQv?=
 =?utf-8?B?YytWNWt3MFc0bDVITlVxei9tbVE3LzFCOCt1M0JSMVJHUU1scXNNN1VENnZa?=
 =?utf-8?B?WUt5Nmo3dGVhYUZwM1gwQ1VwWms3Y2FzWVVGaGM3L3o4Yy9SdmNRWTQ5YXNX?=
 =?utf-8?B?Skdla0c5bGZHUlVINm1JZnpudkhtakZlOGxKL2lFRHNyM0hqMmJGTHRhbDB6?=
 =?utf-8?B?NHlqRWJPZS8rMWFndzAvanJaUWE1YjZObXlZM1hwYmhKc2hTNWZnUTREeGlE?=
 =?utf-8?B?NjhLUkpRVXVkOVA5cVp3OGUyVXlnSVZpUjlaQ0xYVzVCNk9BelBhRWw0QjFK?=
 =?utf-8?B?cllkaUNHY1ZEb28rWjRVQmVKZ0lzOEZJWjFDY3VlTmxJeDJ0OEJZMW03MS8y?=
 =?utf-8?B?VmpMVHh4TTc3VU1FUC9XRTMwUzJrZ1MzaHRYSStTbERJcnBnN1hUTVNhTXdY?=
 =?utf-8?B?K3U3V2NoNTk5WXN0cWRVMVRsWkFQYnE3Nm52M2JXL3R4NHZ6QitWVFN6MW1a?=
 =?utf-8?B?eis3djRuL2tpc0luZTA5NlNkekdKYXBiOUQwU0dic1QyK0VrZHRkUFZvaVhi?=
 =?utf-8?B?NXY2eStwZUpReXA5b285bkNPTlgvZ0xuc2NNOXNHUXJoTjBUZDMrSTZyc0Rq?=
 =?utf-8?B?d2dmeFlDRDBtcyt0bWNkWlc0cWVscElTTWJFSWJDQmhEWitPWlZwT0l1ckNX?=
 =?utf-8?B?dlNGbFFPZUgxeXBxSkl3SzFHY0p4R3dLUU5EYVE4bm9LNThMUDQxNlVJMFgy?=
 =?utf-8?B?REhGelovaWVqcmdYdTZuR2FGVzgxdTFVRExKM1JWQ2ZJUGUvQjFkSjhqK2pT?=
 =?utf-8?B?MFgyWWZnREtCR1UzY3hXN3FPd2lXcDRDMWc2QnNBWGNoOXdMaVU2R0oxcUdw?=
 =?utf-8?B?N1Z5UVRhekhoYS8veDUvQUkxM1VTNVZva2Y2cUlHYkNNZ0l5T1RYWS9hMjZZ?=
 =?utf-8?Q?cJIQ5mc6fGQ3ldlA=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5198c118-91b0-4c70-40c5-08da118a0539
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4048.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 13:42:51.8393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7Pk8l7yJiFpzFgLSlqzFL4jssgdMk0vnpt6dwHomDcdSs+pmkrHQYuG5fdd8ktWlkh1wK1kESwOFC9M7H4HRx3m4vFPm6BkEd69ziEdx+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6193
X-Proofpoint-GUID: mCduTPfgjY4_rwRFWch80q8sazZNGBsN
X-Proofpoint-ORIG-GUID: mCduTPfgjY4_rwRFWch80q8sazZNGBsN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-29_05,2022-03-29_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=kshitij.suri@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: soham.ghosh@nutanix.com, peter.maydell@linaro.org, thuth@redhat.com,
 berrange@redhat.com, prerna.saxena@nutanix.com, dgilbert@redhat.com,
 armbru@redhat.com, Kshitij Suri <kshitij.suri@nutanix.com>,
 philippe.mathieu.daude@gmail.com, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Libpng is only detected if VNC is enabled currently. This patch adds a
generalised png option in the meson build which is aimed to replace use of
CONFIG_VNC_PNG with CONFIG_PNG.

Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 meson.build        |  9 ++++-----
 meson_options.txt  |  4 ++--
 ui/vnc-enc-tight.c | 18 +++++++++---------
 ui/vnc.c           |  4 ++--
 ui/vnc.h           |  2 +-
 5 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/meson.build b/meson.build
index 282e7c4650..ccb6840a49 100644
--- a/meson.build
+++ b/meson.build
@@ -1115,14 +1115,13 @@ if gtkx11.found()
   x11 = dependency('x11', method: 'pkg-config', required: gtkx11.found(),
                    kwargs: static_kwargs)
 endif
+png = dependency('libpng', required: get_option('png'),
+                 method: 'pkg-config', kwargs: static_kwargs)
 vnc = not_found
-png = not_found
 jpeg = not_found
 sasl = not_found
 if get_option('vnc').allowed() and have_system
   vnc = declare_dependency() # dummy dependency
-  png = dependency('libpng', required: get_option('vnc_png'),
-                   method: 'pkg-config', kwargs: static_kwargs)
   jpeg = dependency('libjpeg', required: get_option('vnc_jpeg'),
                     method: 'pkg-config', kwargs: static_kwargs)
   sasl = cc.find_library('sasl2', has_headers: ['sasl/sasl.h'],
@@ -1554,9 +1553,9 @@ config_host_data.set('CONFIG_TPM', have_tpm)
 config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
 config_host_data.set('CONFIG_VDE', vde.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
+config_host_data.set('CONFIG_PNG', png.found())
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
-config_host_data.set('CONFIG_VNC_PNG', png.found())
 config_host_data.set('CONFIG_VNC_SASL', sasl.found())
 config_host_data.set('CONFIG_VIRTFS', have_virtfs)
 config_host_data.set('CONFIG_VTE', vte.found())
@@ -3638,11 +3637,11 @@ summary_info += {'curses support':    curses}
 summary_info += {'virgl support':     virgl}
 summary_info += {'curl support':      curl}
 summary_info += {'Multipath support': mpathpersist}
+summary_info += {'PNG support':       png}
 summary_info += {'VNC support':       vnc}
 if vnc.found()
   summary_info += {'VNC SASL support':  sasl}
   summary_info += {'VNC JPEG support':  jpeg}
-  summary_info += {'VNC PNG support':   png}
 endif
 if targetos not in ['darwin', 'haiku', 'windows']
   summary_info += {'OSS support':     oss}
diff --git a/meson_options.txt b/meson_options.txt
index 52b11cead4..d85734f8e6 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -177,12 +177,12 @@ option('vde', type : 'feature', value : 'auto',
        description: 'vde network backend support')
 option('virglrenderer', type : 'feature', value : 'auto',
        description: 'virgl rendering support')
+option('png', type : 'feature', value : 'auto',
+       description: 'PNG support with libpng')
 option('vnc', type : 'feature', value : 'auto',
        description: 'VNC server')
 option('vnc_jpeg', type : 'feature', value : 'auto',
        description: 'JPEG lossy compression for VNC server')
-option('vnc_png', type : 'feature', value : 'auto',
-       description: 'PNG compression for VNC server')
 option('vnc_sasl', type : 'feature', value : 'auto',
        description: 'SASL authentication for VNC server')
 option('vte', type : 'feature', value : 'auto',
diff --git a/ui/vnc-enc-tight.c b/ui/vnc-enc-tight.c
index 7b86a4713d..e879cca7f5 100644
--- a/ui/vnc-enc-tight.c
+++ b/ui/vnc-enc-tight.c
@@ -32,7 +32,7 @@
    INT32 definitions between jmorecfg.h (included by jpeglib.h) and
    Win32 basetsd.h (included by windows.h). */
 
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
 /* The following define is needed by pngconf.h. Otherwise it won't compile,
    because setjmp.h was already included by qemu-common.h. */
 #define PNG_SKIP_SETJMP_CHECK
@@ -95,7 +95,7 @@ static const struct {
 };
 #endif
 
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
 static const struct {
     int png_zlib_level, png_filters;
 } tight_png_conf[] = {
@@ -919,7 +919,7 @@ static int send_full_color_rect(VncState *vs, int x, int y, int w, int h)
     int stream = 0;
     ssize_t bytes;
 
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     if (tight_can_send_png_rect(vs, w, h)) {
         return send_png_rect(vs, x, y, w, h, NULL);
     }
@@ -966,7 +966,7 @@ static int send_mono_rect(VncState *vs, int x, int y,
     int stream = 1;
     int level = tight_conf[vs->tight->compression].mono_zlib_level;
 
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     if (tight_can_send_png_rect(vs, w, h)) {
         int ret;
         int bpp = vs->client_pf.bytes_per_pixel * 8;
@@ -1020,7 +1020,7 @@ static int send_mono_rect(VncState *vs, int x, int y,
 struct palette_cb_priv {
     VncState *vs;
     uint8_t *header;
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     png_colorp png_palette;
 #endif
 };
@@ -1082,7 +1082,7 @@ static int send_palette_rect(VncState *vs, int x, int y,
     int colors;
     ssize_t bytes;
 
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     if (tight_can_send_png_rect(vs, w, h)) {
         return send_png_rect(vs, x, y, w, h, palette);
     }
@@ -1233,7 +1233,7 @@ static int send_jpeg_rect(VncState *vs, int x, int y, int w, int h, int quality)
 /*
  * PNG compression stuff.
  */
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
 static void write_png_palette(int idx, uint32_t pix, void *opaque)
 {
     struct palette_cb_priv *priv = opaque;
@@ -1379,7 +1379,7 @@ static int send_png_rect(VncState *vs, int x, int y, int w, int h,
     buffer_reset(&vs->tight->png);
     return 1;
 }
-#endif /* CONFIG_VNC_PNG */
+#endif /* CONFIG_PNG */
 
 static void vnc_tight_start(VncState *vs)
 {
@@ -1706,7 +1706,7 @@ void vnc_tight_clear(VncState *vs)
 #ifdef CONFIG_VNC_JPEG
     buffer_free(&vs->tight->jpeg);
 #endif
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     buffer_free(&vs->tight->png);
 #endif
 }
diff --git a/ui/vnc.c b/ui/vnc.c
index 310a873c21..8376291b47 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2165,7 +2165,7 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
             vs->features |= VNC_FEATURE_TIGHT_MASK;
             vs->vnc_encoding = enc;
             break;
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
         case VNC_ENCODING_TIGHT_PNG:
             vs->features |= VNC_FEATURE_TIGHT_PNG_MASK;
             vs->vnc_encoding = enc;
@@ -3256,7 +3256,7 @@ static void vnc_connect(VncDisplay *vd, QIOChannelSocket *sioc,
 #ifdef CONFIG_VNC_JPEG
     buffer_init(&vs->tight->jpeg,     "vnc-tight-jpeg/%p", sioc);
 #endif
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     buffer_init(&vs->tight->png,      "vnc-tight-png/%p", sioc);
 #endif
     buffer_init(&vs->zlib.zlib,      "vnc-zlib/%p", sioc);
diff --git a/ui/vnc.h b/ui/vnc.h
index a7149831f9..a60fb13115 100644
--- a/ui/vnc.h
+++ b/ui/vnc.h
@@ -201,7 +201,7 @@ typedef struct VncTight {
 #ifdef CONFIG_VNC_JPEG
     Buffer jpeg;
 #endif
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     Buffer png;
 #endif
     int levels[4];
-- 
2.22.3


