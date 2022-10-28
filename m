Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0827B610974
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:03:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooHRh-0003jB-R1; Fri, 28 Oct 2022 00:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7300ee25fa=bin.meng@windriver.com>)
 id 1ooHRf-0003iU-SR
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 00:58:15 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7300ee25fa=bin.meng@windriver.com>)
 id 1ooHRd-00024i-Jj
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 00:58:15 -0400
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29S4MWZq011302; Thu, 27 Oct 2022 21:58:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=YLhacHRwL8fUc2NHT+7N2mRS2uOsKJ1uYgdb73cCTy8=;
 b=O5xcIOlaL6WzJRhyd3VfJ9QXNdK9uTiNkrW93ulrWOa7G5ki3i2sseOo2Xp+Yy5Wjw/4
 66N191QObZyEbo6deTxI+oZ7V3aITv+MrA+HOtpFU6LaffBSV6AekOmYWbRFNELCPaxR
 134QO2isJsHmrhoK5RywavOXzPav4Zq/daYp09emT3tuQcKDQR6oxt8xT/brV/U2wjP9
 QRndxe1gesLl8NHiew+8MK5lG40DKIRwDWceS3Xq3Ij7Ck6wsslcK7jGzkT2V5EC31il
 PaSmJgc3X4QTRWRXPUmbBNnJdXJh0NG/zZsh+mlVehxCJ1EOfLmhU9IU7Zc7KIlWpHC5 6Q== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg3gs4ts-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 21:58:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RaZNFEexBfp5lcbTKY/YMjc+ulNB0v5bfgCcZCgV+Vk9zsxr+3QqmuMdKAaLPnXbhnfhqtCnwuOl2F+Er9WzzvFgCMem/ct1v8SUTbKxAOlxF/X0yg92ZTm8R3njzsVHd8djRJa0EB4YBAgF944S4un/XgvtAfOsbqyg65jrY9pKSw8ykwIMJkUeEtwt8V/ipE9n92g0jwA/xH+zvpFNERtq9ptlHBpx2AeD9wMf7/vW/BWqz0o6O5hoK/NLBVZYz0RahO/LBXBspLWzlnjbC0WkWlTqWupAW5QpjuLJBO8kyBqxHyhNIXskKpIUv3hrH8lrNO/5GSaBIm36tA95pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLhacHRwL8fUc2NHT+7N2mRS2uOsKJ1uYgdb73cCTy8=;
 b=mwpqNPqJSqtbWvYEeKHQqpOyQBsU//H20dP3HhltK0z6yHQ0GvE/yBBG/UAs+HawOLBTPPTK2yaQv52wLSgmrfCAOBNthxuJEUJtfgI2rP5Np8jBLzOTVBUGUbuV3qDkl+40w2boKlV0rNRqg+1UAcBmByyWf0BSSYtpVEZxubvP6P+9P/4zSWUCnjDngU0NnAT0p43rR6QZbtTqxBca0XViyN4+xDoPToD3uG8FsVVqH3pquXgJ9/MlRnqQGIPEH/FTHENJovLo0g2vO/i65fgZBMZNBAb8MWtRoH2PtwChSKgsuNRAZO68XmWxSJzh/BLn3Am7idBWUwEsMr1OWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL1PR11MB5351.namprd11.prod.outlook.com (2603:10b6:208:318::5)
 by MN2PR11MB4632.namprd11.prod.outlook.com (2603:10b6:208:24f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 28 Oct
 2022 04:58:06 +0000
Received: from BL1PR11MB5351.namprd11.prod.outlook.com
 ([fe80::9a11:fa81:cdd8:b201]) by BL1PR11MB5351.namprd11.prod.outlook.com
 ([fe80::9a11:fa81:cdd8:b201%9]) with mapi id 15.20.5746.026; Fri, 28 Oct 2022
 04:58:06 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v6 02/11] tests/qtest: Use send/recv for socket communication
Date: Fri, 28 Oct 2022 12:57:27 +0800
Message-Id: <20221028045736.679903-3-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028045736.679903-1-bin.meng@windriver.com>
References: <20221028045736.679903-1-bin.meng@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:100:2d::21) To BL1PR11MB5351.namprd11.prod.outlook.com
 (2603:10b6:208:318::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5351:EE_|MN2PR11MB4632:EE_
X-MS-Office365-Filtering-Correlation-Id: 76d62c7a-bb85-4bbb-6097-08dab8a1004a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bt2Kds/pAn6QWVbH7SJXrZz0T9RU6UM0Ww9sGQbyGHw2SGSbKY7kXU65sPnPXoOEdrz0DfC8G3OY6w0SJA1Cl8LwWIaohG5dQsslC9e88vBTkdH5GFeA8F7OqEzbHXS0tZuKguoxSlqN9S/dTsGkK5RVs7JWuIWPHYoNfLBwnG1VQAw3QLeiwXMSFpG1Bet6PvfoHY3KUycwPizZr2jn02GYnUh4zC7eG1JJnNGdiSBs/LwbNQStp3K22q+21lqni1NBaeXgvFxdy5y+cmp3V+nFgPWlG0y2rwJZXX1obsX01TVCpwliUPE4GGGC3Y2yRYwYOqGA0IBCpwZgQurDM+LyifKrxsxPN2wPZFI8joiTXioKSSvxOLF3rbfyZFGzL+yUUHFExVuQAf8FgW4K4b6iJZsEcT9tb2wM2myfXx23vKv1OHD7xoE3EWIFBmRFC14APZLnXYe3C22Gh1LoztodrDxAllasbIDXrajbTiPdd3MeC6lbjGZFMIIrwFoWmYAABPpL846zqx8f1ORo2rnRpmhGx75AOlEp9M+8SdYORbilu2bjeMkMZIa+MDq0GWnBu88iKY7QM5+V6K71OLTCw5ej4yCMbJQvpA7FZWA+/OGKZCHsCj6KxYQGscOcVzP9R3pEKVLH+bseKFpBU581pQlgD7uvpoPHU+bkED/YKV8VB/lwGNFfeBDHymL/vApH3gpCIZh9EHJ6XxJ55hr8iiKYdRpq0tHhqBAXg9HPRSGMAKiPfPf3LKzroK6V3cUuNH8iVnNkJRlZNir6yg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5351.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(451199015)(478600001)(26005)(6486002)(6506007)(36756003)(2906002)(83380400001)(52116002)(6666004)(86362001)(5660300002)(38100700002)(38350700002)(2616005)(316002)(186003)(1076003)(6512007)(66476007)(8676002)(54906003)(4326008)(6916009)(41300700001)(66946007)(66556008)(44832011)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlBqOXR5NElCYWZhb2pMZFRGV0JlYmU0ZldQY3A1WENvRTlsOVFsRk10ZVhI?=
 =?utf-8?B?ZkFLMi93dlZCdHRZbE1jTDNOSUhCWXNRU05xVUtqZFpYYlRsRkJmZlhyR1NX?=
 =?utf-8?B?NU1QSitQRGpSVnZYTWxEZzYxYkhud1Vkc003U3BEcnNOc2ZrdEQvRVQyMVJS?=
 =?utf-8?B?YzZwcytGNkZXQUFHYTF1WTJnMXJUbnhxYzNReXI0c0puMG1vVmt4RzdndDNK?=
 =?utf-8?B?TWFPcXRaTFg1R25MU092VUxlTW9WTm9ZUjBMKzJiejJUM2Z1SzZQRzNjZEhZ?=
 =?utf-8?B?Uk9KeUtLbVRJT3gxT3g1MmFvLy9aN3ZJb3VaWnlwcms0N1o1VExabS9LMENm?=
 =?utf-8?B?RVRXNTlGZUtsZVE5cEJ3TkI3b3psVXFxVVI5LzB2RG9KblBDRG1VZlg5d0Jj?=
 =?utf-8?B?N3lKdVdtQ3orY01pbjU5VXBZQ0dLTEZsQjVGZTR2RldhVytBMzBtbkI4K1F3?=
 =?utf-8?B?K0FzVzRKbUcvKzltNFlCUkVKMDBKL3JhWlZmUXRYT3ltK045WEZtOXpDMTEv?=
 =?utf-8?B?Y1RmdXpxcWYySFNrVzNDRkN2VlNmZ0hzQVJWamVrR1I1T1MzUFJrWGROQUdF?=
 =?utf-8?B?alg3QWp2TTRtbXYrRG5wU3lvYTFWUVVMbVBNY2htTHdwNzhSSitPQ0dsZzBW?=
 =?utf-8?B?RnNhWTdwdGJrUS9IdXBRVkVmdVE3amwrdmJCdTE3MTd4b0VSR3l4OHM2a1BY?=
 =?utf-8?B?TGZPR2JBQ20yNlg2bnJNMS9OTVo3cFhLL2tDM1ZoV3ByNUZoNm5yM25FQWlD?=
 =?utf-8?B?KzNVTmxRS0FwU1FQTmU4bHFuRnpNeWVadVJQd0Y4Z3pIZmVIbGR2YzlBMCs4?=
 =?utf-8?B?ZWlCTGRVQ1hZc1RDVjVaNkVqcm5oNGsxQ2I1TGE5clhVazB4c29xRFVOakhS?=
 =?utf-8?B?TmRKUDlXdDRzdldQeU52SzdXR0VBa005dkEweTRxM3VGU1JSSms4bFY4bG5y?=
 =?utf-8?B?ZzFhVzJKeTVhbXB2RC9HaXpoL2w0dzU4OXgzcGdMbExML25wNUZOK3I5bXE3?=
 =?utf-8?B?dkxtRVN1eWMrOGtVbFJMaTJpaWlYSHBDY1dkV1NHblN2ZnpUVzFrTDg2M3Rt?=
 =?utf-8?B?d3RENE1TY1RUQjUxVWs4U0xydmJ1V0VWWDV0QnJGY2w2YWVBKzM0Yjk3WlU2?=
 =?utf-8?B?OW1ScnF5bGdxTFZUdWRLMU96bktkdk02cEI3UHVYUDRJU2FGTGptNm15NUhy?=
 =?utf-8?B?MGg0MW1jWXZFQ0pQU01pd1VBbTJHVmV6anBhSWVXcHhCckRnRWFqRmFxUXB3?=
 =?utf-8?B?TWhDMytGcERjRXpWanhmUm9EY2Y0NUdlRS80ci8xK2pCa2lFeGtwbUl1bEVO?=
 =?utf-8?B?STRyQXZwcWV0dEkwUUJaMVFTQitUYUViUzhiY1NJUGN5VDlwd25xOXNRSkdI?=
 =?utf-8?B?Q2JYUjdMOVRYa3Z4NVR0bDA3ZVEvVVBqYWtCY25VbXRsUWJZQThXT1RmSXlO?=
 =?utf-8?B?M2FzU1VSSlBodGhGZlFGemtHMnZBYmxxWWlHVWFSRWkySGJRTTRQZGR2SHJy?=
 =?utf-8?B?cWJmbnQvWUZJWmtiaFVabVNNNlpXYTBpRXkvWlpMdEVESmNmUTREd2Q0WGFO?=
 =?utf-8?B?cWF0QUx4a2FuNGVhWGdtMitqMERGR1B3d2o1UjNMTm5GWnBVd05xZTdtcjFq?=
 =?utf-8?B?YTA4TGN1dE9Qd0VPVEhpNkxRMnRWVU96OXkxSGoxZHdaL1pBT2N6Qk1iZE9B?=
 =?utf-8?B?RFEvY1dQUmo0am1mbUI4TVVlb0VQeXFkMS9KTXZtemZxc3VRQmtOajBWdkhw?=
 =?utf-8?B?NHBuMTZTSi8rWmhIVjUzYWI1bTFvTWJ0U1B0MUFoSnZiK0hQNi8zRE0rR0Vj?=
 =?utf-8?B?akF2YXFLdTJXOTRzSUlwbC9uWnlZd2xVTXJNbG1ORlhmNGVZK3lidmVmQlk1?=
 =?utf-8?B?UWNQcGMzZ3JZQmthZ05Bc05vUDZVbE1GRVIrYjBGUVFSaFBlaUw0cCt6cUhu?=
 =?utf-8?B?cGY0UUlNWGRPSVEzSjJRTFBhaEk1YUQzUEpkb21HYk4rbGNrR0RJSURaL2xw?=
 =?utf-8?B?VjJvbTBqSjFDV3U5dHRGeHY0V0h2SGd3azkrSDU2UjVWbDh3YWJBWEVubHRJ?=
 =?utf-8?B?cWRjRGd3WUJ0RVVlNVRka2lvMGtSdkpZVmZ6TE9XcGxkNnhuZGkvR1ovNDlj?=
 =?utf-8?Q?HotwCACAD17a3eqfzm0nO4Be8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d62c7a-bb85-4bbb-6097-08dab8a1004a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5351.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 04:58:06.2340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MA2Qo1pV0T96WPDXgqqH5mloK08DAVNCbI6QvHl+kqo4/sYZGgKI1iLx3I1U7QNX5LSRjqziiffjvpff4S2RCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4632
X-Proofpoint-GUID: 7VRUoZNJEAXUkrmhvxtKtS_1uTbCKXrv
X-Proofpoint-ORIG-GUID: 7VRUoZNJEAXUkrmhvxtKtS_1uTbCKXrv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_02,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=980
 mlxscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2210280030
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

Socket communication in the libqtest and libqmp codes uses read()
and write() which work on any file descriptor on *nix, and sockets
in *nix are an example of a file descriptor.

However sockets on Windows do not use *nix-style file descriptors,
so read() and write() cannot be used on sockets on Windows.
Switch over to use send() and recv() instead which work on both
Windows and *nix.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

---

Changes in v6:
- include <qemu/sockets.h> in libqtest.c
- move documentation comments of qemu_send_full() from util/osdep.c
  to qemu/sockets.h

Changes in v2:
- Introduce qemu_send_full() and use it

 include/qemu/sockets.h | 13 +++++++++++++
 tests/qtest/libqmp.c   |  5 +++--
 tests/qtest/libqtest.c |  5 +++--
 util/osdep.c           | 22 ++++++++++++++++++++++
 4 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 036745e586..61648f3f3c 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -33,6 +33,19 @@ int qemu_socketpair(int domain, int type, int protocol, int sv[2]);
 #endif
 
 int qemu_accept(int s, struct sockaddr *addr, socklen_t *addrlen);
+/*
+ * A variant of send(2) which handles partial send.
+ *
+ * Return the number of bytes transferred over the socket.
+ * Set errno if fewer than `count' bytes are sent.
+ *
+ * This function don't work with non-blocking socket's.
+ * Any of the possibilities with non-blocking socket's is bad:
+ *   - return a short write (then name is wrong)
+ *   - busy wait adding (errno == EAGAIN) to the loop
+ */
+ssize_t qemu_send_full(int s, const void *buf, size_t count)
+    G_GNUC_WARN_UNUSED_RESULT;
 int socket_set_cork(int fd, int v);
 int socket_set_nodelay(int fd);
 void qemu_socket_set_block(int fd);
diff --git a/tests/qtest/libqmp.c b/tests/qtest/libqmp.c
index ade26c15f0..2b08382e5d 100644
--- a/tests/qtest/libqmp.c
+++ b/tests/qtest/libqmp.c
@@ -23,6 +23,7 @@
 #endif
 
 #include "qemu/cutils.h"
+#include "qemu/sockets.h"
 #include "qapi/error.h"
 #include "qapi/qmp/json-parser.h"
 #include "qapi/qmp/qjson.h"
@@ -36,7 +37,7 @@ typedef struct {
 
 static void socket_send(int fd, const char *buf, size_t size)
 {
-    size_t res = qemu_write_full(fd, buf, size);
+    ssize_t res = qemu_send_full(fd, buf, size);
 
     assert(res == size);
 }
@@ -69,7 +70,7 @@ QDict *qmp_fd_receive(int fd)
         ssize_t len;
         char c;
 
-        len = read(fd, &c, 1);
+        len = recv(fd, &c, 1, 0);
         if (len == -1 && errno == EINTR) {
             continue;
         }
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index b23eb3edc3..b01846fd98 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -27,6 +27,7 @@
 #include "libqmp.h"
 #include "qemu/ctype.h"
 #include "qemu/cutils.h"
+#include "qemu/sockets.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qjson.h"
 #include "qapi/qmp/qlist.h"
@@ -428,7 +429,7 @@ void qtest_quit(QTestState *s)
 
 static void socket_send(int fd, const char *buf, size_t size)
 {
-    size_t res = qemu_write_full(fd, buf, size);
+    ssize_t res = qemu_send_full(fd, buf, size);
 
     assert(res == size);
 }
@@ -460,7 +461,7 @@ static GString *qtest_client_socket_recv_line(QTestState *s)
         ssize_t len;
         char buffer[1024];
 
-        len = read(s->fd, buffer, sizeof(buffer));
+        len = recv(s->fd, buffer, sizeof(buffer), 0);
         if (len == -1 && errno == EINTR) {
             continue;
         }
diff --git a/util/osdep.c b/util/osdep.c
index 746d5f7d71..77c1a6c562 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -502,6 +502,28 @@ int qemu_accept(int s, struct sockaddr *addr, socklen_t *addrlen)
     return ret;
 }
 
+ssize_t qemu_send_full(int s, const void *buf, size_t count)
+{
+    ssize_t ret = 0;
+    ssize_t total = 0;
+
+    while (count) {
+        ret = send(s, buf, count, 0);
+        if (ret < 0) {
+            if (errno == EINTR) {
+                continue;
+            }
+            break;
+        }
+
+        count -= ret;
+        buf += ret;
+        total += ret;
+    }
+
+    return total;
+}
+
 void qemu_set_hw_version(const char *version)
 {
     hw_version = version;
-- 
2.25.1


