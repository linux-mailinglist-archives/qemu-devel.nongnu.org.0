Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A576650A07
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:22:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7DHJ-0003Jz-26; Mon, 19 Dec 2022 05:21:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DH4-0003Ej-BH
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:37 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DH2-0007WF-Qb
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:34 -0500
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJ9mDb8010303; Mon, 19 Dec 2022 10:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=xlnfjBVVSlTgt8rLyj8y5aIPzqOjQBeoW/Whh3osAzk=;
 b=EIAMbFKk3f+RKuUf0I4pAwLNYSqPiYpy4G5SP/ahACpqVTLS7HSbAkJgFFwk38aN0oxM
 PtZm34idRlC4glLVuukTz0d7aj0Ie3fRUC4gbKCcNcDBwAyvQWGVpkDAaoFcID00Oo/r
 a8b60BaU5R3ZlhRtb7GEEkSsaWb9U2ZjM+Gev5lKkgEwzFG5XjjM/P2ku8TzN7zIRXAg
 L0IjMeuloRimUz2ahyd1ONLh47F8EGcoeMj18+YUjrjmNdaLe4b2P6D3whzFfTx20GSS
 KeL8PfwjZmzlXZoP3eDwb4zTYxHnwGznzL1nF+No3Z3li4eel73Q7wl72itVses3H3lF ow== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh4r99b7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 10:21:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTd2mSHgVjnuWm1tFqHT2Qm0s00Lx2Hd7y10Kr2EWN8qF4NDPKCqHvA4p5obH762MCfMZOdCUwIldMcxIxVXDJCf8+Qf9eRvqtBvdCKiDSijpfxhxG0jNSAIdwGpsKnICJg2HW/ToLV9+9tjCvKv5pNls+nZMJ2Fr80ebQMx48zjYiJ8zE1WtvOZeV7/EtOZQZT55+Zzc5UZnH5gml+Y+PThHcbUZCQ5Z86sBYEpYE2X3bTF2fDKLsbH74XNh0CUd74ynvlmfDOrGaY5JgQhJIp5CcQoUktLEc7eQX0pePQ08q8EJlwCjjT+YNC3Ah8WjrGwTyJ7Gb5Bbu0AmwmJeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlnfjBVVSlTgt8rLyj8y5aIPzqOjQBeoW/Whh3osAzk=;
 b=ch0z6GWTxsz+r3hbmHOmCOfomTQ2evrtykr3M448b6aonPjCJyuiLP5TntMjQNWNdVtHgkTa3/COVX+8ZLTgyl8YPywxq2kIrw3J6pP2dLIq6Rz7Nh2utP9fuqXfE5u+971XdBa1en6LQzcK/U5fP6jvDK9ZLaJYbJKjEx/hiWxCM/zZDPz6N5tBfD+ynOs4qoOv6ojDtb7cAlgUWXet8NlEaeIarF373RXx8h++bGgFJN+2VN3gS124CHrFBX2eQirwwssKI0ESSxMAh0PSnbBub3X5SgYwi99CUa6XPFzRNKGoHY39XijfwFWRRJdrn9eRAy50BkldIC1ZYEQcpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 CH3PR11MB7201.namprd11.prod.outlook.com (2603:10b6:610:143::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 10:21:16 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5880.019; Mon, 19 Dec 2022
 10:21:15 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 15/17] hw/9pfs: Update synth fs driver for Windows
Date: Mon, 19 Dec 2022 18:20:19 +0800
Message-Id: <20221219102022.2167736-16-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221219102022.2167736-1-bin.meng@windriver.com>
References: <20221219102022.2167736-1-bin.meng@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2P216CA0158.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::14) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|CH3PR11MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: 69fb60c4-a32d-4390-751a-08dae1aac2d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a0B0xh10O/3sfCcX4vd0wTulY8Y2usvGQeTJtpGRVUm96r7+ycCxCzVyaCclU0FaCyz6SWvum0mR9yzQEPvi/Jd6iudCNp7kbzrRWsmqtsfhwFaKwXQ9JQK0fcvYFQ4A3QcjB0bEqXr8FJDJ/JiC/NbXCwhiSX3RBp6xPlB0MP/PAdRoEpmHyVdsbDVW+cf7DDosCfnW/6IScirn9Ecuqka/Oh7JruxM52JSyurY7orZ497wDLX7+ymotYGPislA/JOoWamFikK5YGmbj9/v4K4sYwc6baju9fClRZCfTbIYj54+7q3ZV9VTB55Fthcgd2eEkTDvioFBnLJ5Pt1Wa7G0eEzQQ5jOi88z/fwfgDphdlJSs6XsDYpL9vdh1OIyWwlKPulltcdEFNC9mbu/cs8CMB4KpDCUigo3nh1KzMlzkp+9re8YqeTQ61GlKK7nJGR1EHnULAPnthSzI44X70sl0SNfWJq5Y+u4BU3GoPwa68PQrR8Zi1ylJ6mKoVDN0tXlczAi/34H6r5ZsUsmUjx6Wuy7PojoIMmFplND9gXitkmzzB6lY2iJIB2cg3vs+HZUdO3XAFzn4A0v0Ad+6AyTc7IJrkurt9Csgt9johWe9b5p306DpWLTlEd03TVnNu/v5vS2vEkoYGMHrHoN0e507KoSbfiRZFBmrQkIcSE3Flkk0SNUwNiLr1dN86/41ufNghMkegFowdb/qzD+Pg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39850400004)(346002)(366004)(396003)(136003)(451199015)(478600001)(41300700001)(38100700002)(38350700002)(26005)(186003)(52116002)(1076003)(2616005)(6506007)(36756003)(86362001)(6486002)(4326008)(2906002)(66476007)(66946007)(6512007)(66556008)(8676002)(5660300002)(8936002)(44832011)(83380400001)(316002)(110136005)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUtURW84TysycnNpRHM4WWxEUkZ0M0lyNGpuN1FSOEo4Y1NIRktHTWkwMWlo?=
 =?utf-8?B?V1RNQS9YdHJsaFNzK25HSUJ3SmZKbjdWbDZ0Z2doUEczZVFrSDhzcmhrSW56?=
 =?utf-8?B?UDIwZW1XaS8xYTFtUUUxRTkrRzJzd0Uyd0dyWmNCOUNyeWErSmFRZEpENk5u?=
 =?utf-8?B?NkI5TUFDZ2JZaGlIeGhuclIyTy9xN0lFZTZPc1FYMGRXVnJyaTA5c0RZQUZv?=
 =?utf-8?B?SlJDZFYwWUxHSlEzaDdVVjEwQmgwY0hxSEg5c1JCcEJQUkRKdFdONGpWY3ZC?=
 =?utf-8?B?YU5EUzVoL2pvM1hsQVd5OTRXZVVhWTd5QzdITFVkcUVLenNlZlJzOEM1T2Jx?=
 =?utf-8?B?S1A0V2pHSUdDVG9IZmlRYzNTUStUL0d6d2w2cTlLKzd4eXNaN0tFMWhEWHFZ?=
 =?utf-8?B?eHE1ZlRaTXFpaVhSbXJuV0hOUTlhR0c0c2l5RHZCRTlyb2RBQ1RrdHFvSjBy?=
 =?utf-8?B?aU1ycGRXcEUzUHFCZU02WHI4RXJ0QlVyOXBYeEt2U3cvVGFRaFR6aHVLc1F0?=
 =?utf-8?B?cGdmQm1FNStscVBlTFk0ZTdGTUFqU3pHL29nd05PbnhVZUVUNzdQOXpHc01h?=
 =?utf-8?B?dndhQ21UZy9PajlsZWpCR3RlZldjUnlSd2VtUXBnSERTMFFkRTdmTHpLWjY1?=
 =?utf-8?B?WFZBS2ZJbmFjQW1Dc3pjMzJLSEp1SHRXNVFrVUYya3pVYkhBYVJBc3hGWGp1?=
 =?utf-8?B?dm9GWnhEcmh6WFBRamxVQWtGV1BocGpaOVphdmtlNVV5RnVadnkyT1RxQmJO?=
 =?utf-8?B?ODhMZFR2ZEZDdkVqenNTcU5KVnBueCtrcWVWV29tN1hqV0pRdFJYbE5ZYWVP?=
 =?utf-8?B?NTdvOFgxay9TVXVWdXNnQUkxbmtvNFdHS1RuUzZVQk5hd2tJWmFvNDRSYU5J?=
 =?utf-8?B?a3JpYkplYUYyWVZLeElNdGw0UWxSQ3BPUjdhaDA3aVRXNmxHZmRwdDRZK1hH?=
 =?utf-8?B?SktYMWtCN2l1cnVQRjV1RktuTlZtaitYWFo2NHAzalFTWnk3ZGl4MjdUV2dQ?=
 =?utf-8?B?T3VLQTFsc0x3QSt5NTRyWW9hT0hyRm9wd1JTZys5aWI2RTcyVTdHdnp0dzhK?=
 =?utf-8?B?MEl5NmFSOEd4V1kyVWZUbDN5TFoyRE5mS2JNSWRYMlRiNjErVDVPK0ZHS2tm?=
 =?utf-8?B?a0ZCTy9MM0ZRR2c5allCS05McGREZG1iU1JKQVFMSzZ6dHZlL2c1QWhpU0lR?=
 =?utf-8?B?S2FXajltdUNGVThiNjNJZHQ4YVIwaG1WcmgzYU9MckFIOCtCRCtlQjVUTFly?=
 =?utf-8?B?RjlaZGZ2SkVoaDVmWWF2ak9rRnVHZktSSnBITEliTzRwNzNOOWhZODJDdmk4?=
 =?utf-8?B?NVhlek16SmhacWZmQnFwS3RaWWdFaTEwMU9NRW1lR3I1SXhIMGVyb3NxcGZp?=
 =?utf-8?B?TFBYT1d3UEVRclliVHVSVzk5b1hNanUzT1p2Uy9QRFFkdWtQZkJxY1J3RWNt?=
 =?utf-8?B?ZVVuMUpCTDE5d2pxS2tVUVFYY0laYXNZVmtwNVF2VjlaTHNJRlJJcjQyZGRD?=
 =?utf-8?B?dDl2SFFxL1dQSjlpMERWZ2VMVCtpRSs5NVRBeDlKRXRDNzAxMktYWnphdUky?=
 =?utf-8?B?cDJ1Q2s2QjRMVlA2UUlvK0xXckJXcnBDcm01ZnVESEoreHgvRzZ1K3dTTDhC?=
 =?utf-8?B?ZmE3N05yNE5sYlhPTGRsTjNzNmVXcWdoZnNKYkxNN3FHeWtPOHhwUnRGOTRF?=
 =?utf-8?B?TFVUamIxOVQySXdGZzNlRlpWWC9OU0tTSXliRzhQSC90WC9hQ21YQTJjdjJ4?=
 =?utf-8?B?UHB1cWlycjdWTXN5M0VxVDBiUnl5ZllPeE9FcG91WmUvWWZFNUZjZnNJZ2N3?=
 =?utf-8?B?QTBKMmFja3Ayd3ZvR2ZONDRvS3M3a2I2RnE2Ymt5UGNNSjk2eVVzcms0TXJ2?=
 =?utf-8?B?M2lTM0Y5MWt6Z1B6U2VCbGJpRkRmVXJXQkRzdVdtQzcrN2cvYko0cUhvNUMy?=
 =?utf-8?B?S0g5TUZXaUkxNmRsbW5rcWpkRlF0TFpCU0w0RS82VnpkbitxcnhXa1lhQWww?=
 =?utf-8?B?QTBibEZiN0FMaG4vL2p1dENmUlAwWFhKcXpNV2IwbXh2TC9wOTFNaTd1Umlu?=
 =?utf-8?B?TXRJenFXUmFIdGU5YVpwWU9sTnhNT3VXWFlEUUlhYzdiejJ0eWFtbkxpdk53?=
 =?utf-8?Q?tCyo7Zn0MiQFBsWJsP86YeSXP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69fb60c4-a32d-4390-751a-08dae1aac2d6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 10:21:15.8526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zhoFJSSxVC1HsIhywlr8c+4lgvDjlz/Z9SNlSTSMdzKMIN8FL/UMt3+brTa+//Vfa4sD8Gs+9eT2x/8nvWLeZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7201
X-Proofpoint-GUID: i421xtYQpW9JGH3Zt6_YJS8G0ZujSorJ
X-Proofpoint-ORIG-GUID: i421xtYQpW9JGH3Zt6_YJS8G0ZujSorJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-18_13,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190092
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=9352c01a6b=bin.meng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Guohuai Shi <guohuai.shi@windriver.com>

Adapt synth fs driver for Windows in preparation to running qtest
9p testing on Windows.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---

(no changes since v1)

 hw/9pfs/9p-synth.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index 38d787f494..dcf8c1624d 100644
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


