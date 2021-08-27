Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A75223F9E84
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:07:58 +0200 (CEST)
Received: from localhost ([::1]:33934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgGZ-00081k-Nd
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mJg3R-0005qy-Im
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:54:13 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:40362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mJg3O-0006yX-W1
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:54:13 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17RGWtYW010418;
 Fri, 27 Aug 2021 17:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=V+ltWcVfIoiwJaQuc/RORtOZ5xq7kVc8hIjIQsjMCoU=;
 b=PNh5ywFfAh/r70l249KEPcnkziI+KgBv8ayI6YP+davslyaCNvgvgbGoDY2m7m93kRXF
 jTzPUCDkk/0jhbTExgLngPa19URxgbSJiZypUStUvo+yh3e0pyC2wdShvIOpc+YjuOCH
 jDWNmt22UEX5l3AOLvc6uh432BJi8qIWS4bOaesuDLQvoo5iXvoqKC2m0U8+Vdqgy48A
 DUvlzbJV/SIhkvBQyVR6ES2htPnBISoQLk36EvGlJI2zzyEMsTS9G3Pwlcym7pbrmEkx
 sqtQM9aSqkZbGR33F2eYkXgmBrsSkIa8w2kFLXntjClC5MqRCa/YASpTfJV2sfq2WGQZ TQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=V+ltWcVfIoiwJaQuc/RORtOZ5xq7kVc8hIjIQsjMCoU=;
 b=h7P+8TpK6F1NiM+ixdk8lQcBuWHS4EYUk55CptCwu8QwMJ/6ZD6/Ud/V4kyFrqYsaBwB
 GEElVhE1u9noD6yp457O3lFLtEBE/Hs7TgXcbGCkbxg5SmWK9CV4a0QtVe6DVZA8r4Lb
 e/wrc74zyvaB2uuC0kdAB1ANN+dvF6HUYwA9bU1HRKsEhqKDh7+EOfQb52Utj0msMzaR
 2lfxTQTkpd68c2I3+9KlsbUIS66oTqrVF7+m6ANuDb9vVu6UDenKNx84iL/7HA+pu+jd
 PK1R4PYx4cjjysAdX3wI5Heje1gSLXkqiUfrojJN44vpnuZFh16gpkmz04xEot5O+YVJ Zw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ap3eavcd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 17:54:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17RHnsen178913;
 Fri, 27 Aug 2021 17:54:07 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by userp3020.oracle.com with ESMTP id 3akb92hjc0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 17:54:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CluvybeYoPtHUB7LcAVxxC/U9aKDRWqNXs8hy+sJgYb0vZs0QbrtC4+EI5mgpBldFlTUTNztD31D2UkbMdAkNqYAcongCz5eEtCytcOepvgvEZOX9rlpC8G6DgwXMBtBj3dcfqIbMUrg50GMjvbSFvIXyhQZauxBms/yWWlVuYEAZQHEyPH3fnYqZxhsnkqqvn708UJ57lTvto5Z/CnbA7Sg21lnoiWstvINv+kfF5YIk01O/sRTSEp1TD25wkQ/qnqAVE083LxhB/u/Wc0eMTmtkh02mXH/CdC7AkJyAr8fyMHR0eEvk2yvYraDNqfbE352WEocRrsoZycpFZTSbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+ltWcVfIoiwJaQuc/RORtOZ5xq7kVc8hIjIQsjMCoU=;
 b=htNXcQN7r+OGsUiLDM/MNbBVLctvGzu9s1wTu9dnMD7UqfHswWWVYx/bYEi69w4n+6Yi3L3dVlSW6hk/qwKPCUX4VHbjfsAMkDQq2/G3ZS2032q4mF9CwTGkGljK4l9DfdIdOh9uLMZ8OVX9DVsNxak5zYTe32WetWR/4it9WTyFjf8dUYfawJIlKi8rTAdmBHxBM1vmb00r77MRZ/NDcn18BsX4SLhjP8A0UkYewXyf7o0acfhjGITMV9ixTUTNR3sgceN2GQOPAtaHrGKLE5P6lBjDb8mVnEVgPyvovQIPmJ6aviUtBiCWO9x9hCOCbtMR4wj9WrkuKLVjv15y1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+ltWcVfIoiwJaQuc/RORtOZ5xq7kVc8hIjIQsjMCoU=;
 b=fwf5gkLpGUNM2JWyyMLeXMAW9MFPp5dhdn6Dyny8Cl5niDP2UY2rfAMIcrHJ1KCchyvAYmCHgOoquUyUsvUMwi6InR5TGBuP7WjcmGkthBKokSsUKz22K7blWBA4WpYlqY0npBLDK9jPYYaDsYk1GZAelg6UuwcsGX5YgKpkZZw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB4865.namprd10.prod.outlook.com (2603:10b6:208:334::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Fri, 27 Aug
 2021 17:54:05 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::282e:c371:7a10:b122]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::282e:c371:7a10:b122%5]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 17:54:04 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC server v2 09/11] vfio-user: handle device interrupts
Date: Fri, 27 Aug 2021 13:53:28 -0400
Message-Id: <a2f26e37bab99d353341c024f13db2774034acbf.1630084211.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1630084211.git.jag.raman@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0093.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::34) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.46) by
 BYAPR11CA0093.namprd11.prod.outlook.com (2603:10b6:a03:f4::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Fri, 27 Aug 2021 17:54:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1efaa16-07ab-4a3e-cc96-08d96983a8c8
X-MS-TrafficTypeDiagnostic: BLAPR10MB4865:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR10MB4865D528C0FBD9FE9AD0FF7090C89@BLAPR10MB4865.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ilZOKEsYgFBp7RSsL3vcux+279ui1M0OoXtGIBPle7oMmTkSSIksEXAEHL2zoW92XzIwxqPyQR+Fq1H/dEK2pt/sghgS/isUv0UbmDdxMsTaJxWEQG17GdAOH+DoVo5INF06umXVo9bwqI1aYpUIEf6EwWVoKNnAeXZP96RyfoL762DM0hNzb8wl39Gffy5J3hJ6qxL18SkKlzqZT7rpCs0bpDJDOHr3IuMI3dmBa6duXIEi4opsiXr1xr45Ays6Ea3EhEQo1uuG9kohqnJcfOa3MUJvK3KM6jKTjXhjAQZwcZPARYfUxzPYMDY+L3SXXjMib/p5/7m2kIWXeaBtA52CIvqe+xeLkIViKaY/UoVb9L7ap8Hjcmp3CWPKV7F5ahLdHy26NaKi3OBGuhduTuNGDAiJitRKiiO6jyCGf3EHlWu07Vxl1ufqwRd9ypLMpj4ZCiFG5jWUFv+731nL10s3+ain769cYN6gsuKx4EYfsaGxgMwYyHsnvG3JvcE+bQ6Qz8uq/C1JX/wWDuHtkniJjm23VdmOuyF/J1XwUvRMOKBtcwpdmuUXwlRJHHevBBI6/3shE8aTBVeoeWVbCfVQhpKWWyvO9YDO34mMQAkqypJW0i+jYc70fUD5NO9mEmdQgRG5bWFby5zaLHLpL0aL//cu+HT1Htp/vwnepq/BBWpnMawNLrTp5cGlQPoa19KntE3fov7zDUOlS+pgdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39860400002)(366004)(136003)(396003)(2906002)(186003)(2616005)(8936002)(26005)(8676002)(38100700002)(36756003)(52116002)(7696005)(83380400001)(107886003)(478600001)(38350700002)(956004)(7416002)(6486002)(4326008)(6666004)(66946007)(5660300002)(66556008)(66476007)(316002)(6916009)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m8+Ob/Tot2S/HKNBWVULgmnfayeO+B7u95jFTO86Z/bFQVBupr3lVzbyN/1k?=
 =?us-ascii?Q?4Yi3Y4IapokmpTQwtNCHuRn+ZrkjvpNCCvlGyzemXSubQaAtxFpZoMD8GSS9?=
 =?us-ascii?Q?X/hFROI2bypPUsJPfTs6jaUXfu5EGd6jqyZoYU8w4Ppc8+U4D0lwaaVV0U5Z?=
 =?us-ascii?Q?5yLsWSgKu5kX+6pQJlHk/90FgAWFnotJm2G1rIlqL6i+go2SJehYKFhphK4c?=
 =?us-ascii?Q?dhJFn8fLYGIhSfX/n0hsbi/VcZP4qpEc2OhkHUinr/vb015KpW0Xa8cBj1wO?=
 =?us-ascii?Q?VtGKEhonAcikqAk9/dQdn8VU1h+qI2aLTLqJcPRYgY3OqF8/OdXwCGtuFU7k?=
 =?us-ascii?Q?VOLGdEoSW5mBivZD7S6Fl5CRJ7CSU+55BvDPK2dsBx+rmzlTHaSFplwkOEkA?=
 =?us-ascii?Q?Zs9lU3AMuo5QqMz3qCTQOnLXlFUD11OuSv6OmSd/0BuHTHSJO/1DssFFh44K?=
 =?us-ascii?Q?aFpTPc/iYqqL0ZZlMnOPb2Xt3e9ZPpk1W9jEyT21NZbkXHQ3xtt8omh1WNXh?=
 =?us-ascii?Q?DGRDR4qZgqMHrcurR3cRrS5Gohm96ey2DeKZnUNagWG4XC3oCPKW2794t4CP?=
 =?us-ascii?Q?uPp5MVW4ZMqzkYFmB8wmgZhpzrr/h2p+xnXbIEcIr7nJA2UtJYW3+80D26HQ?=
 =?us-ascii?Q?38lj7LOpPlfjilPnOI4ctFRL8EA1ldsMJp9TpIxV2PttUlQBCFkJ9SZQbxk3?=
 =?us-ascii?Q?rKTlw5qkMD8/7USDDeRRTDF2E1WePPrgRsFcFynkuh+i6MophFRl3BNmknbS?=
 =?us-ascii?Q?L2n9He/ZyLIj0haIfrNiloMh5D3B1PKBtc1V3l+a4v1ERmi/teUOE1lQY1hn?=
 =?us-ascii?Q?HmN7P3+M6b5gqYsTJB7DNlQME4NrmZ9uYtRimHDu614hwdlGfg+FRpMpZznD?=
 =?us-ascii?Q?7XWCobLziWlvUhTlBgI68W8CtmeDxNwwFgD2/5rSHcwFJPVeR+E8sItXKO0k?=
 =?us-ascii?Q?tpGbfuqxusAyEzhGIrVsDUsUUd/DuwPIN7axD31LPAypk5CU6GOaORWNdvxk?=
 =?us-ascii?Q?QtFGzIYE6DwY6nvmJSjCUzLPdzPJ/lHt0W6b6cg67MQ1lD8rMphPsrnUKArh?=
 =?us-ascii?Q?b0DVf1pAxsZnZxk5weXnAEej4y3QlsRhUZXViH4pOTH6ii2Q0QDIrcyGuhia?=
 =?us-ascii?Q?olCvzFuB3KrgdmtZpSkhTRHXWA7YALqY1RLvGgCmBK9g1WC3cuUIWjGnd9v/?=
 =?us-ascii?Q?Nb6b6vmb3lTikmYTWZk6LD3M9PnMF0ivn5WFpM1eEuH2nsDJ18W9L9+5/ufG?=
 =?us-ascii?Q?KQ+tfJjp8gXkGoh4JHgKq59aIaRXQSUz90ePFLoGN+Vc8gA1Q8VT4k8gG0kQ?=
 =?us-ascii?Q?8+Dac0odR2n33gZ4sn4hYtz6?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1efaa16-07ab-4a3e-cc96-08d96983a8c8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 17:54:04.6058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sl4Nft3yAVR3cY3GYo8URZmsKySs8RmW9PyW4C7ISF6HwFlbEt/sAKBVAc/6cx5a/Y2qcXO4BKL0ioBlmmDQGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4865
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10089
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108270105
X-Proofpoint-ORIG-GUID: bjO6Q21blNiKjdqtPV3gGTuPKGeU43gJ
X-Proofpoint-GUID: bjO6Q21blNiKjdqtPV3gGTuPKGeU43gJ
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, swapnil.ingle@nutanix.com, john.levon@nutanix.com,
 philmd@redhat.com, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Forward remote device's interrupts to the guest

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/hw/remote/iohub.h |  2 ++
 hw/remote/iohub.c         |  5 +++++
 hw/remote/vfio-user-obj.c | 30 ++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  1 +
 4 files changed, 38 insertions(+)

diff --git a/include/hw/remote/iohub.h b/include/hw/remote/iohub.h
index 0bf98e0..d5bd0b0 100644
--- a/include/hw/remote/iohub.h
+++ b/include/hw/remote/iohub.h
@@ -15,6 +15,7 @@
 #include "qemu/event_notifier.h"
 #include "qemu/thread-posix.h"
 #include "hw/remote/mpqemu-link.h"
+#include "libvfio-user.h"
 
 #define REMOTE_IOHUB_NB_PIRQS    PCI_DEVFN_MAX
 
@@ -30,6 +31,7 @@ typedef struct RemoteIOHubState {
     unsigned int irq_level[REMOTE_IOHUB_NB_PIRQS];
     ResampleToken token[REMOTE_IOHUB_NB_PIRQS];
     QemuMutex irq_level_lock[REMOTE_IOHUB_NB_PIRQS];
+    vfu_ctx_t *vfu_ctx[REMOTE_IOHUB_NB_PIRQS];
 } RemoteIOHubState;
 
 int remote_iohub_map_irq(PCIDevice *pci_dev, int intx);
diff --git a/hw/remote/iohub.c b/hw/remote/iohub.c
index 547d597..9410233 100644
--- a/hw/remote/iohub.c
+++ b/hw/remote/iohub.c
@@ -18,6 +18,7 @@
 #include "hw/remote/machine.h"
 #include "hw/remote/iohub.h"
 #include "qemu/main-loop.h"
+#include "trace.h"
 
 void remote_iohub_init(RemoteIOHubState *iohub)
 {
@@ -62,6 +63,10 @@ void remote_iohub_set_irq(void *opaque, int pirq, int level)
     QEMU_LOCK_GUARD(&iohub->irq_level_lock[pirq]);
 
     if (level) {
+        if (iohub->vfu_ctx[pirq]) {
+            trace_vfu_interrupt(pirq);
+            vfu_irq_trigger(iohub->vfu_ctx[pirq], 0);
+        }
         if (++iohub->irq_level[pirq] == 1) {
             event_notifier_set(&iohub->irqfds[pirq]);
         }
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 299c938..92605ed 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -42,6 +42,9 @@
 #include "libvfio-user.h"
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
+#include "hw/boards.h"
+#include "hw/remote/iohub.h"
+#include "hw/remote/machine.h"
 
 #define TYPE_VFU_OBJECT "vfio-user"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -313,6 +316,26 @@ static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
     }
 }
 
+static int vfu_object_setup_irqs(vfu_ctx_t *vfu_ctx, PCIDevice *pci_dev)
+{
+    RemoteMachineState *machine = REMOTE_MACHINE(current_machine);
+    RemoteIOHubState *iohub = &machine->iohub;
+    int pirq, intx, ret;
+
+    ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_INTX_IRQ, 1);
+    if (ret < 0) {
+        return ret;
+    }
+
+    intx = pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
+
+    pirq = remote_iohub_map_irq(pci_dev, intx);
+
+    iohub->vfu_ctx[pirq] = vfu_ctx;
+
+    return 0;
+}
+
 static void vfu_object_machine_done(Notifier *notifier, void *data)
 {
     VfuObject *o = container_of(notifier, VfuObject, machine_done);
@@ -371,6 +394,13 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
 
     vfu_object_register_bars(o->vfu_ctx, o->pci_dev);
 
+    ret = vfu_object_setup_irqs(o->vfu_ctx, o->pci_dev);
+    if (ret < 0) {
+        error_setg(&error_abort, "vfu: Failed to setup interrupts for %s",
+                   o->devid);
+        return;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(&error_abort, "vfu: Failed to realize device %s- %s",
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index f3f65e2..b419d6f 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -11,3 +11,4 @@ vfu_dma_register(uint64_t gpa, size_t len) "vfu: registering GPA 0x%"PRIx64", %z
 vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
 vfu_bar_rw_enter(const char *op, uint64_t addr) "vfu: %s request for BAR address 0x%"PRIx64""
 vfu_bar_rw_exit(const char *op, uint64_t addr) "vfu: Finished %s of BAR address 0x%"PRIx64""
+vfu_interrupt(int pirq) "vfu: sending interrupt to device - PIRQ %d"
-- 
1.8.3.1


