Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F55610975
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:03:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooHRw-0003mr-Bg; Fri, 28 Oct 2022 00:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7300ee25fa=bin.meng@windriver.com>)
 id 1ooHRs-0003mJ-2K
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 00:58:28 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7300ee25fa=bin.meng@windriver.com>)
 id 1ooHRq-00028b-F7
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 00:58:27 -0400
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29S4bMw8021593; Thu, 27 Oct 2022 21:58:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=1WANvbMosBHmDX90xw1DthOFkFTyssGJmD1wJkDbp88=;
 b=OTrV2yb/z/SiPK7jzasfaEWLz99vICwxvEwa2QnqeKwEEeo537kC8juCTO1iGjdivBi9
 PZSqv/SO3sqU+zBwth+j+3ITB4fZUy1D9bnrM/UjFgNHgpHKJaUOKzMTbtZ4z8IHW/J0
 7kEsjL/Eg5ptgP5MSy+FGLUizno8WEeVxhFXAQeUKbH6RVpeZ75hrmWupD3lOsyIkm71
 XGTBpDf2n6OqUggcHbqqdmnrAfeC17McwZUSsNXB5iX3fz8bwIqJxkyq3BesGl+CUE0e
 lE6jFYwlkgzfExpKzGZlF5GLHNATIv24F1R8WjxSqjtj5Y4a2W4li/LJeJT3RCGtdiSz KA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg0r15kv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 21:58:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vfc5nuwGh8wSRIFiTpn5c/thGWfqacFYGt+xyM0JSO98VXU/EDe74LfwREKvQQU4PcHy+UdujNaOchoEAebQFx3cKVhkyMptaWG9ZB9ZIp51UpGZTarAzGf5w3BPXjBVNlYMtu6aG+ulb+EPSOYnbvzNrS1jBHeWhenXAdzCOo5QcmPeNSYbWjv9hKoDIJgnb8iioPRm/sAQWahp8Njweq0PgPl9JngPMlTR5ZyVbZ+mg7KGAhtOxXFctOUsDz2gxtFWOjKwyPmNqsjVC44TiSw9zz6h7aA1dETUFnR91dNJCY/plJuQK815RV33O39nxbjouap38fOp9V+juHHUKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WANvbMosBHmDX90xw1DthOFkFTyssGJmD1wJkDbp88=;
 b=khZsgajhOq68Zp/fKAHtuq1meIe66HTxDK8rqhvlqCQCe2J48VF11rlgGlPaRg5aiYEdZ1cxyyhwTvevu+YeAK+rAEPHPO2YDEPdi5zZ8iMnxb6954a16WY69uNVntr+9bVwGVQMkc5+g/LqGDw9ux3KcV+/wJN7OY7VtATWP/Jq2nXUYo68+7/z2Veb9Vb4s9yZqlB11hVh3w104qFuXufm5k/PD3JQnOlIKwSjQvRSDxZjOBlDebI76o9VLbMsEjD1Xfa6YyEbn33sIddZrZJnoP7vKq5QZSm+imkR2+2F+AM38I+zjWyP0hyZdTQAZok/e48zqTwxAmmIrd7uPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL1PR11MB5351.namprd11.prod.outlook.com (2603:10b6:208:318::5)
 by MN2PR11MB4632.namprd11.prod.outlook.com (2603:10b6:208:24f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 28 Oct
 2022 04:58:23 +0000
Received: from BL1PR11MB5351.namprd11.prod.outlook.com
 ([fe80::9a11:fa81:cdd8:b201]) by BL1PR11MB5351.namprd11.prod.outlook.com
 ([fe80::9a11:fa81:cdd8:b201%9]) with mapi id 15.20.5746.026; Fri, 28 Oct 2022
 04:58:23 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v6 07/11] tests/qtest: migration-test: Make sure QEMU process
 "to" exited after migration is canceled
Date: Fri, 28 Oct 2022 12:57:32 +0800
Message-Id: <20221028045736.679903-8-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028045736.679903-1-bin.meng@windriver.com>
References: <20221028045736.679903-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:100:2d::21) To BL1PR11MB5351.namprd11.prod.outlook.com
 (2603:10b6:208:318::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5351:EE_|MN2PR11MB4632:EE_
X-MS-Office365-Filtering-Correlation-Id: 27390434-0532-4f5a-75f1-08dab8a10a25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jm03YW5z/tYOPVufIOEtpdeC7esXEfiVz/h+UAnu4AT6Fj7Y3dhYelkS2DwqWq8MlphQY8dEAMn/NsNhk59t5rldUsOa59cWPMlF6q//jd5/4DLJhxtR+viagqXZgDqx2vgPHyBuKRjBkmTyUh3xOM0Ra5BwNZMY590FsTEh/8f9nVgl/Nap8OoNVezWtuStzDjz0da2xuLTVvVpNmNKuVa9GNaOD6YbWd7As8OWEYK3ar8eBXKO62wlqB2ieTNi4iVLypdNUw9MwqDNCjugxyuyclHkeZ8bPX59laXXb08IGs3vJFHlVtftdw0d2TKXuu0L7OtsDLZwDpgbzhGAFvELYxHn1vkKe+zvCAFJKPsUTHqaZC2eqC9lUksuB1u8DyPM6/ZhVybImW7jqTdYW81Og/ZuhU8HYA9S5LC1OwH5gg2in8snPjgo8/744axg/S+C+rqT+OvaWBX0EYj5F/daG3ODUBtOIXA9wScbyHNXNBfeCobIB36rMT6meO5B6732uoa3dN9InB0Grffiank1VqjpeHnmZLpmdoGhWpgFzRA7qKler2NI6FPmcx5LSo4h4KIoKzVlQfyAC1jE5hLGOvnpLzeVwFQaErPK9Z1P3D8ICLwou7bSQo1US698zqNNzBv9k4D5GwGD3XFH/v9uO7pdzm5DXtn3S4d34WbbOqZD30UwdhGhnCQuo/qFfrFM1Fvw+rT8u19LRhC1HZZ5ixrcHqUAYGZKE2Q2uyMD/DJmp8YXpX4gDjFU1xXVdmBrTZmRAYUkrct9Cp/AvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5351.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(451199015)(478600001)(26005)(6486002)(6506007)(36756003)(2906002)(83380400001)(52116002)(6666004)(86362001)(5660300002)(38100700002)(38350700002)(2616005)(316002)(186003)(1076003)(6512007)(66476007)(8676002)(54906003)(4326008)(6916009)(41300700001)(4744005)(66946007)(66556008)(44832011)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d9oge9H2DMfQwwjs364vKdSiGcpkab9Ir0qq98hvwFWeH4MtMpdMBo11cGek?=
 =?us-ascii?Q?CS+B7+xJ5PDV1zqfeHcHwmWRHiPFlGMXaMDIaPyECXnCuGcag9VPDQoIn0x5?=
 =?us-ascii?Q?xnoEr8iFUTQOLWPixdQ++L5VIlISb6EJbFjJzGafkMMoQjXrlh4+YIOTP6gy?=
 =?us-ascii?Q?y6c82G2SdeAyBaisPVP541DQGT7WlfjUwCpSkrxSYExNFCZFzRiyaTu/dv11?=
 =?us-ascii?Q?V+Vh5zA5pm/D3Bkw59cpGWxKDCuXsU6Eio46Y2Q6CWcxN3gSx5cW0udfvMNk?=
 =?us-ascii?Q?WEoROPU4o+WdPicyEUXutsquQ5KFX0Aj8L5qLsMfAyJYrE9QE14T+0H9Sfxf?=
 =?us-ascii?Q?m377Vq8jNRh71WmobCvstUokaGyRnK8GUcpCtiM08xReu1e4btJphgZqfe2m?=
 =?us-ascii?Q?5xD7MsdzPGZipheyC51iZqhQB+D5CvqCq1Zy1Yd7Hl5XMZf52PAZEuPFCekq?=
 =?us-ascii?Q?+4mNrYyGv4x/xQcc04Qa+tXKVlB1tXPEOVP5BgpJ0lW+prxi8bHy7DeUfHD6?=
 =?us-ascii?Q?L0fiN+kp7ENgFgsq2ci3qyuJRVQ8rDB9rsyEeQ3PYIUv82QmSHtTbBZU5ZLh?=
 =?us-ascii?Q?XNnciQXCvAypINJFYOgA53yd0U6ioiGKAQKKRlBH4hNQTrME3pikY5PrvLUQ?=
 =?us-ascii?Q?NpqNxAqTs2oE4iblEz+mGJUNChu2pIToKJgCf8TRXnw7AoPxGa6n300Bqncu?=
 =?us-ascii?Q?UqLgjtyAksjvzxMXWorQqZPdqMNjEpGlWgTqjXg9pHE3FViWq1Iv5p38k+LI?=
 =?us-ascii?Q?OnjKcSMacBAswlhTfceIIlnnbQkMipyLM7vJJ3mbmOkn88RNgh7o4uEV8W/V?=
 =?us-ascii?Q?VZb25HJ3gulIgZ3bmW5fCUy281QgnkuVFAgpGMAAsCKNTPRquTRrEiJ+5Z6w?=
 =?us-ascii?Q?opWHBK1161ksIfKoTbZTT77dr4x0tarIauKVZItOAX8pOQp+vMCDkkCqWSSC?=
 =?us-ascii?Q?CfK0SCb5WCJ+cBSA+mqYKcOatsKwe1Xt2BPTxo/kjEuI7mtlZwXXifN200fq?=
 =?us-ascii?Q?FsXNKe5pu1Nc+cGAMJBeMBMu63dxFArWU7UwcVTqnyGs56o/yVscXTOzaIXm?=
 =?us-ascii?Q?U2kpAT7dCe0apM5zg4iJ7F3kdL6n9AVmKRfMryrVD+cbcOfr/t7KB9rjcbxD?=
 =?us-ascii?Q?eTfcLdBl03RIDpQ7OLDiVwYUbDIr0CK5AFnrQ9EvNZhcHilvPOyZ/LHUKOR2?=
 =?us-ascii?Q?COHeDJxkXO6ssOB6XjpKSrBfbh7JErdfHrVkjXwxznZ77uv0Nll61qMtwg/O?=
 =?us-ascii?Q?sG87uUhceamXCUB9LrQnaO10oa7/Nk4g8QoO0DoklFTXq8+Xl8n0aM7Cj+wr?=
 =?us-ascii?Q?RL2wrdItPvJs3j5QcF7tjzsbrJmnwcbZTeR+yhcwEqNR0T/sVFECOAZBX7rH?=
 =?us-ascii?Q?0uRWBAp3xcloyqRqIXoUZNxVKsz/VOmvNke+/8e3XgZiY0eoSAobLT8l06Yx?=
 =?us-ascii?Q?nfpmeiX6XtCEGE4jRiwG3aQ1dhphHxfanVg8uzPIhGzzIj07Df3LBWHyGKVG?=
 =?us-ascii?Q?VXTxXjvAr3R8S4MW+N/S95yjkDLC4SuHuVA0NGi0mRFUTG1hOX/V99CrN2q5?=
 =?us-ascii?Q?QIw9s/TiQ8l0mpDbZGN+wlmXPIjWa61gP5+VfnIU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27390434-0532-4f5a-75f1-08dab8a10a25
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5351.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 04:58:23.2226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1umh+7USmEUyaoQvHIG+AEDKdUeLr/9ZQVcFcZhPwhYMhhanbWdw9M5m3WKEUSzl1OBLISi4TSnTGVqLFbMAXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4632
X-Proofpoint-GUID: MDlB6fLahcLDCt0Go9zOX_kSqNSZpVgm
X-Proofpoint-ORIG-GUID: MDlB6fLahcLDCt0Go9zOX_kSqNSZpVgm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_02,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0 mlxlogscore=670
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280030
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=7300ee25fa=bin.meng@windriver.com;
 helo=mx0a-0064b401.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Make sure QEMU process "to" exited before launching another target
for migration in the test_multifd_tcp_cancel case.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v6:
- change to use qtest_wait_qemu() API

Changes in v3:
- Add a usleep(1) in the busy wait loop

Changes in v2:
- Change to a busy wait after migration is canceled

 tests/qtest/migration-test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 28a06d8170..d2eb107f0c 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2141,6 +2141,10 @@ static void test_multifd_tcp_cancel(void)
 
     migrate_cancel(from);
 
+    /* Make sure QEMU process "to" exited */
+    qtest_set_expected_status(to, EXIT_FAILURE);
+    qtest_wait_qemu(to);
+
     args = (MigrateStart){
         .only_target = true,
     };
-- 
2.25.1


