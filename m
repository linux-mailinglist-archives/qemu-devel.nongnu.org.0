Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 516ED650A21
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:32:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7DHC-0003Fo-55; Mon, 19 Dec 2022 05:21:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGh-0003Ak-4L
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:13 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGa-0007N0-Uh
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:10 -0500
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJ8ll8t020840; Mon, 19 Dec 2022 10:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=iwQ0R/yWlmKEf7imNX6mBrEsuYMI1SqX+GjLYpCPnWQ=;
 b=Hwg8lA5Klk1FLHi7UdxqOVsxtpIimu5nkOO91EW04ZBAZJk6kSmeGJNQLZcQ36sm0atv
 uFtLofidMKA2pEMD3vT/n7bwytNREbGOn0RFEIq3B7dByP61OcwpuLh29ul3a4ImhhNZ
 LVk34Tfldti/oYZL6FfqLcke4/MYWdqvPx09xVxoskMD9JOijINtR8xWwdsDAaFlkZxO
 XgPiMQbHWcnD45kwEZtwCGD0qh12RGizNpbCuWGdwKf33H77ZhUSeHm9AdMBr/JmRxQq
 OztAUPx9WevRgbilIRqPjjtdzzto5MyT4DNsnVqYBFDlWOjczQ4RYi7ReqjErd6panAD Jg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh4r99b74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 10:20:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KsEJyStlrv9Y1+hoBc+e21txdlDAxwTCoEmda/2bEhTc5W0/gl8yyhJ2IpHuV2FzG5oC8E0Sd67P+SV4xXKJXlmyOlDhh3IxFiWBWYaKIxr2oeqpUYw0DlsebRbxq1XbeNHyR/nml0vn1PibKfjWS7ap4LaXgnO6ka8nUvU8EeaMdB/ZojodNFh10HGnZutk/JMZ48abZ9ywvT7i7gwVdFxbFeXgvlCpO44A2QZpAppt27d7BAFj6C+0liClNJbjIYn8l6m91n8U005mJx3+XtfDb23/UyJlG8o1SMKG+kIu4g4iLWOzi8754KPKJ3GN35gSLGhx/E7Rf4IHP+Y87A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwQ0R/yWlmKEf7imNX6mBrEsuYMI1SqX+GjLYpCPnWQ=;
 b=iLSATNI0Q0sTwJ7g6CpwrznCK4FyEHnU2YS/j+8pQ0mwx0UtuixhnBZ6MRYicA+j2lmcwGt8ujfuhpvzJIP+Qk6B57AuJGDmkKWHj+1BgwFR7eDqmQ2mJro1qJ8KI81+NpzQFxYm8Il6e3z30xIYCaKrRGt11olVVvWdGv2wKOSvcJLmcbEp827yJzleAcKInfMqFD47Mtm5YQi9RPo+ugHAEk8MqkSaV06gMlImpRc2YxyaG01ylQFqzvpMw3L4rTGhtibx21SKoh3emg1P1UAKQNye1gT0NYqAxvUN9rmBkZQdRvtNsAPadaiqxziknTfagjCBA5QvLHf9Cl5YmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Mon, 19 Dec 2022 10:20:48 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5880.019; Mon, 19 Dec 2022
 10:20:48 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v3 02/17] hw/9pfs: Drop unnecessary *xattr wrapper API
 declarations
Date: Mon, 19 Dec 2022 18:20:06 +0800
Message-Id: <20221219102022.2167736-3-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221219102022.2167736-1-bin.meng@windriver.com>
References: <20221219102022.2167736-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0158.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::14) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|DM6PR11MB4691:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a42f6a9-569e-4933-4d32-08dae1aab2ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8JmU3Yhuc3SnUPSRH889DBWzRDne/SDnOKpDj7UZNu4khbClrCNlRJK0/taWdiSJ6UBA7Mxwz8tWKUzibuAUSS38mWh12d740r1uetyTzS+jgKmZDsoV6fvc9UuJIIaBl0jbORUuz1wsD5RCs+DvvMSiMpmNZxOdehVRa/QF6znmccxN1hSv5JKnUnfElommoj3cuHIsOFI7BIEyez+NMrvBK4zE25Go1FqnseXwJAnkvfd5TM0n+9JgFE0CGg1f8ILycnW9YT3JJ33k/wv7xogTRiH48kQMMoFBTi4A6rY8dITikS00oYN2g7zsNRVrZjCzg/H0rt4Z23AEQiHih20AUAhxH/fW6khLfbNdxnO0Hk/I/qQVtL4qfCUJhUlSYLKsmFbR45qYeaOGxIeCtgp0sdf0kFzRRQKUo/jnks8f2rzZdfHuoeAOsofriqv3CBm//ca4YCGtikIEyOWVuLIpQwKduhl1cgzS6uS9fS8FwlS5q3Jg08zMnnzQ+ItoHSICcwEjTqAiZgVGhDFxC98dRy3n0g5sNfDfSjkrnUnF9YLD/HW31JbDr20xttJFqqOXWKMMh7bbAU/k+znpPqU0C+FP8P5zE066wZHg5vv5QJtyEXhJyp5gNqpAN/QGWTY8i7ROdksu8c4sfa7QXlhufeu2vuFdxpn2SxQ5qwzxrkkREdevOOoxiefAPgGkhxMM5hLAnO+FDzw9QGp/Bw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(136003)(376002)(346002)(366004)(396003)(451199015)(5660300002)(6666004)(8936002)(83380400001)(186003)(26005)(6512007)(44832011)(2906002)(41300700001)(36756003)(6486002)(110136005)(1076003)(38350700002)(52116002)(316002)(478600001)(38100700002)(8676002)(66476007)(2616005)(6506007)(66946007)(66556008)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5bITlT081/nzDiNbEcDb4IaAh8po2SqAGCjEfLtcg8GLTeXnZN9G6xgnSBY9?=
 =?us-ascii?Q?OKe/CkAKY3jLhwW03Fk+KH1+vqgyT4o3yxrT0ptoJMbx4ENmMqsQlMIdchdY?=
 =?us-ascii?Q?bvViJVbikZ6eYpCTKgQid19bFJPLWnmwORI/5YReltxgMzlXfcbz0e7gx33W?=
 =?us-ascii?Q?aVi9NJHtb7X278tCYFYkF/u9uu9U8c+VE6RSGKr08MMcI0SHvctq5SKD1doI?=
 =?us-ascii?Q?RdU8qsM92rA1IwCswDyRs784xvoz5rHJ9fiMm5o+pwxBVWrRp9abpf654GO2?=
 =?us-ascii?Q?mu6z00uuforUxzU1onvqkJqHCRo1YgL4xrVVw8y2Eme9lGv2CpPtUt3+8usE?=
 =?us-ascii?Q?JiaYLggQ5hQIiaKjmwLoectMGwjP439yrxJJqpYhtK34JWyuRT4MfXMGS7+l?=
 =?us-ascii?Q?/yNACk5XCj4ZkORKLoDkB2gsoGbRshDTQH8+/Z66WMyniBgy+RJR9QIutOI9?=
 =?us-ascii?Q?FhgiTD4weqRgfFehxI1omAY4Qcu71aI0my7o/nlWncr+PQ+QJqefNcGo2WiN?=
 =?us-ascii?Q?K5FZBamXJ+DV9xH0PWQjvPFNo/4Sz98nNNjMhaDNUyeKbA5n1cr2b6ju8AEM?=
 =?us-ascii?Q?UcV9Pth8L3WULP+iDSyucmhJGqY3+GeU8BtFM1HXTL+AMr5dB41I2jP/laxu?=
 =?us-ascii?Q?Par0QCIymCI6CLoD4T1WccjmPRB13kvg30TxkTw8jqM9tH2HGrdt2Gd3l+pO?=
 =?us-ascii?Q?KB0BIVIg/WQDRzKT9Q4HpSU8I2+mwc/S0toBLxrEg7jP2oiotFvdHCJXkqee?=
 =?us-ascii?Q?q8miQdZdYoXkyA0MffyUFp9TO2qCllYsRHmzkNbE/QUSlDmoonJIWXg8va0B?=
 =?us-ascii?Q?tGkdnSOSV/RPXzZFwC3yC8RaJb4JDg61y7OUitxB79y0g/XeBuex8mYY6U07?=
 =?us-ascii?Q?mV4J7rVHzHhkcokvSUk56BsjuBE5kN90tBukBq/ZmBCj8rpUHqdq18GQyNNa?=
 =?us-ascii?Q?hmApsWhWGO50BMFO+qZk2qecte/WtCnzrZGh19UcK0Yk1nZpNQJh9bWjtSdM?=
 =?us-ascii?Q?HKTcn6EF5tfmh71Z0uXIqu9FdbfXq5Dw3MHYw2daiEXQq7s1mbQEOnsybi0a?=
 =?us-ascii?Q?WdZypGrYwd91qoA6oH7TC1TLlhJaKgcw0NuCUU2NIibF0M7wTUUEVdq0Nyct?=
 =?us-ascii?Q?7SK+0K+fnrBxdgOqf7Cw9yAet+mUubJgEWreKAtVW+TYruOFXIn8+CoUC+Y3?=
 =?us-ascii?Q?u8Y88YM/dCWUPEo94H2JFL5xcuO1rFWs/7oYQgjKVctTGRGwKbgZ/ZKRyRhs?=
 =?us-ascii?Q?7ONQcihkPfL1Ii/cVLEaw6aQOEczo0yrFYUrbye/hMM476gUz5v4X2328zKP?=
 =?us-ascii?Q?an9r/lgf7+78rdP6xAGnMGZNfogI5uqs8sCAlqPIKASH/cF3wGZLfkQp2O1P?=
 =?us-ascii?Q?GVXOl1gnmZHhdMIL0Fabpyhe+C/D8+MJ35fGzQUgPAZ7noSTssKxNGRhRax1?=
 =?us-ascii?Q?t+qeelrTecKzYUDaj9DxS51VPJC1GZfGv7TBj9Hbm+kuWIWPKctdzmsLeAty?=
 =?us-ascii?Q?vBGUrtOM257/YjVBY5cjV5nIn93P/9Zy5VRWZCLf4+QRUYBRA+csZ41TbfiA?=
 =?us-ascii?Q?jp+rqcabyHR/ZpUNXOerNrbTdgU9KYBZrR2j7Nu4aIxJG8hTichmb8TvCwuq?=
 =?us-ascii?Q?uQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a42f6a9-569e-4933-4d32-08dae1aab2ab
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 10:20:48.7744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2/xZpgQ/Jzj2zZQKa2Me9kJHi76aXFenKoLzjR1qRYsbTerAcJhxlDyqRQeHJefGaYQQMtVAFKDMSDwb8+FAUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
X-Proofpoint-GUID: YhDuYg8R8nF0pitj2oKezhkd7qYjbLxd
X-Proofpoint-ORIG-GUID: YhDuYg8R8nF0pitj2oKezhkd7qYjbLxd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-18_13,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 mlxlogscore=910 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190091
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

These are not used anywhere in the source tree. Drop them.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---

(no changes since v1)

 hw/9pfs/9p-util.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index c3526144c9..ccfc8b1cb3 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -90,19 +90,8 @@ static inline int errno_to_dotl(int err) {
 
 #ifdef CONFIG_DARWIN
 #define qemu_fgetxattr(...) fgetxattr(__VA_ARGS__, 0, 0)
-#define qemu_lgetxattr(...) getxattr(__VA_ARGS__, 0, XATTR_NOFOLLOW)
-#define qemu_llistxattr(...) listxattr(__VA_ARGS__, XATTR_NOFOLLOW)
-#define qemu_lremovexattr(...) removexattr(__VA_ARGS__, XATTR_NOFOLLOW)
-static inline int qemu_lsetxattr(const char *path, const char *name,
-                                 const void *value, size_t size, int flags) {
-    return setxattr(path, name, value, size, 0, flags | XATTR_NOFOLLOW);
-}
 #else
 #define qemu_fgetxattr fgetxattr
-#define qemu_lgetxattr lgetxattr
-#define qemu_llistxattr llistxattr
-#define qemu_lremovexattr lremovexattr
-#define qemu_lsetxattr lsetxattr
 #endif
 
 static inline void close_preserve_errno(int fd)
-- 
2.25.1


