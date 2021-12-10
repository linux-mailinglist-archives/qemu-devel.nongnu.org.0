Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EA347029C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 15:19:09 +0100 (CET)
Received: from localhost ([::1]:37666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvgjs-0006zj-Tp
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 09:19:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1mvghf-0005Mq-Cp; Fri, 10 Dec 2021 09:16:51 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:42568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1mvghd-0000Kc-Jd; Fri, 10 Dec 2021 09:16:51 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BAE8c0r002176; 
 Fri, 10 Dec 2021 14:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=I/4dMSab+XqI/+j/41gDMw2Rt3KOIpLYnXYJ5JR3NVY=;
 b=m7O4rl22Qk8nQHamV68KGc3S6nR4c7pokYQs0ygF3fyI3Rbuma/29o2LfEmSNIWnq3Zg
 lHk8CUI3Sgj08fcKEPLUxd2HNfWfjpUaU4VuA/vwsTUCGWECW952mHVwwn4oucrp3H5j
 HSxsLRJ5aMH9wgnnOj9sqzfsGMJ4Jl7ygdu2CX5dekDCP5TKwa9/+bfjxv4r5ms4MrDF
 gMQECkfZWADvMutwhHbZvbqkRAmCUdQFfgTS5nqj0wiPlvyYJoG3LRu2PibHBTFHYLSF
 iSOiL/9dlpAKLoRNXepm9fLlDpeJ2hBMcKPNy82a08q7NTbounHmPDYYNs7DAZoX5WJQ 8Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ctrj2xe05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Dec 2021 14:16:36 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BAEFafW049225;
 Fri, 10 Dec 2021 14:16:35 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by aserp3030.oracle.com with ESMTP id 3csc4xrju9-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Dec 2021 14:16:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PnHXUDWDKW4xAShph0NhYeSSK9SjW6TobAQdEMf7Xx8/T8gaR3ijkkYtelXQs3K0OS26fImctIz8m+sKvkik23IL4lsDVEPLyVdaJQEQ5JkZLvB5NKTeBN/wUk6NJfMVAUU3BKB+n9I2ZBcAy2ZVagmh8LJvopPixa20eoS0Lz8iUii9mWUklUEJY+O52TksazijcdyT5o1May1lnVtFGy7jXSF+2oqbvYBO5nu07lkKtbDTfEqb+Ozjdy5Zh+S6hrI6UxaJE1odTHjy7mcmxZK4PgfDz6nGMLkYbOJM5QQXwBhcgaZNX4yd135rWeXipo4SmAhu8y6cky7ep/1/Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/4dMSab+XqI/+j/41gDMw2Rt3KOIpLYnXYJ5JR3NVY=;
 b=DrveSG7UzQnhslWpwt3yD10NWUMHjKbIwa4agxfZXfnawiEfoeEPN58Wv1xHA9BQWcaTgvTI8psKG1C2V8+G4UJtRyZqTWsUhG6hTGclKjW7ahKU0ecd/YyHrOjFDHazFEqOKY8Y4zLsDveaN4Ql0gqre7t85g0LUZb8dm4+L30CwG/nb6qkKZ6K6dAccAWvW6QKgqe2CdV16bQ9KNAdBMN2hGYdDYgkUsMsq3kcFvtBN2jQBPkwSv8mZ3Qb1+8HOImpphwMm5z9J7Q6pNpgG/37BH8wz7QNoBS4l3+ethDvsz3A81korsi+8WTcAeP98evYnsYkevREuI1Iq3pMvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/4dMSab+XqI/+j/41gDMw2Rt3KOIpLYnXYJ5JR3NVY=;
 b=jlA2ziy321FXrx6O6+VDEDEiV+QHFZsKgg3Az0u7TuthsSmKWu8nnHNBV30FPzny0LRU4CSmpmhgf1F1Hxh23DaJ1t+RR8Xmjo4dis2ERELy/nGjJ2y5XIk8Q2ks9j9v/3rdj23quFyQyZctEO1fAtr2gmPplma3+jqAdvyFumg=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB4463.namprd10.prod.outlook.com (2603:10b6:a03:2af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.25; Fri, 10 Dec
 2021 14:16:34 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::91ce:8d4f:e5d1:c67b]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::91ce:8d4f:e5d1:c67b%6]) with mapi id 15.20.4778.015; Fri, 10 Dec 2021
 14:16:34 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 1/2] scsi/scsi_bus: use host_status as parameter for
 scsi_sense_from_host_status()
Date: Fri, 10 Dec 2021 06:16:14 -0800
Message-Id: <20211210141615.2585-2-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211210141615.2585-1-dongli.zhang@oracle.com>
References: <20211210141615.2585-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0072.namprd04.prod.outlook.com
 (2603:10b6:806:121::17) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e27b9b49-1192-4611-0b7a-08d9bbe7abcb
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4463:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4463DF88E70FC0C232D0894EF0719@SJ0PR10MB4463.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PBnUXOdsN6AZzzY65UID6v1Y9RNPnuv6nDzIwXe6V1SmubGVlYBopV6Nhjv26wdEDpGcK1o5ErxZyC9jaFkR9Bw3Nozpg/jO5PhSsArGVS8RqY/jOcGaIcafCH3bPzb8R1dpxhxFSnSwiseq4mkCpYMKBcbTJonD19Q1irxCHxg6jTYxUphywiRUvLySUyFkMyGJA8qH0F4fOzVaztrqMC9m3JYhsXMJ5aEoSULIvnkVpoZoYkpKTlHW7F1qRvFsvYqjoBCh038iXFYqIRkbWmz2Ecm4ICuf0xu8gLoU7iCC49zDMNoyMBCBGf+xY+UMh+LPNwH9LHVpRr3o2qVbb4VDroPK37hUMPPRIt5OyudIxuhWtNVmHBlbCSpRUhIE9aHIEtnGPJ73UYMrUjIgDnd+XLv5Y3ILWeMA1JvtjObfQ24t0V/vr6UTa79opRjFpMmnmQKh5ttrxpWJ+2bgXpIpOuTegwaqNTMF5axfvQpk2Ao+8AZlm9Ep5nb/o6aUNUxvLDg12wibXemS71mGnj3senEV4xc6GBDdphnWpAAmp9YXIowrsr8i7XjK7ups4XLouI8RfWoUNu0370vDG5BGqyVYTo4PnmDof6J4T+5ZOELoJl0Jz1u3MEMMPlJSQgNaJD12sX7QbKo48QVKwbzxugyY4i7FCd0xJovP3zZ4cP0PIT2AnK6syNftGycellwAnU2LSW1CmDGeP0bGeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(6666004)(6506007)(36756003)(26005)(2616005)(4326008)(508600001)(107886003)(186003)(52116002)(44832011)(6486002)(38100700002)(1076003)(316002)(8676002)(8936002)(66556008)(66476007)(4744005)(5660300002)(86362001)(66946007)(38350700002)(6512007)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gueXCvx49eiq4Bd5vg4UCkMUsU25WX818jzBbqerBFAKIfSYoOdIwzFgN0Gc?=
 =?us-ascii?Q?M4z8UaLUROVeTzRE8w6QpgQc3fqCm4IdjPF62Pcbzkl/uochJKuWBWydXjwV?=
 =?us-ascii?Q?UYWrX5JP/+ERYy/i4p7gPBV/q9vZ6qIRJpsaBNjp8Rs9kWS94dIj1X0Db9dd?=
 =?us-ascii?Q?hmb7mKUpYjCpgNEpEYec1ESdYgVRUWKg8Ghws57xt9VKUq7Sj+LSM6i869DV?=
 =?us-ascii?Q?9HjGVzMB3GZriZjPV036sr6vUh2+pApF5M2U70PjhaCtKDU1zVZr9lbNGSaG?=
 =?us-ascii?Q?RMli35GBE2XAobcODykjPx6u9QvyMQrPc0fMK7demcbDZDg4mcgdfwma7anc?=
 =?us-ascii?Q?Zp/173ttIuhNTxIlo+3jXZG21rs+89JwaLAq56EMChmszuM9i06cLU0vHQLB?=
 =?us-ascii?Q?zcwBQwneU8aAk9yR1ZLxun8TdQOXTRkLLXR78glLqvrSThxpMjQHI2KAlMvl?=
 =?us-ascii?Q?u/Z9824zf6/86lxQHzg0z2qFn6UWLyDLKZCojYn4BCOBDQWQccrgzPhw0Euc?=
 =?us-ascii?Q?AMmyrxIvm2kZAL6GHrmXErjgPuH/VadtfSmR6gGRGnfoOkbRpJGwf2dmv8ht?=
 =?us-ascii?Q?HD58yGo7eUiFbxGP2XtHFUqoA0o7LWzFzlJ2EovcuBUz79PEgpKvQwWoWfJ1?=
 =?us-ascii?Q?pj2N8XjneZEcBktn+gBLAsVroYpzk9BvzxAbOzmBWdqBxEtEZo5exkFzF+eZ?=
 =?us-ascii?Q?FylNWNErCQBxrnoLZ5e2AbXph19X3ScdXGtfTvv7aR6Tg3rz2r9u92cedwE0?=
 =?us-ascii?Q?AyoaaIvwY4qQqWln1Nr5Za1jnZn4+76VPGopH18V7O2e/kf8EirX9jKcEz5d?=
 =?us-ascii?Q?7gYON4PQzjwtwO/GDqeIZbHrgG6zxfNwkcbRIki+pCoEXvgIN4YxiZ2VlKwB?=
 =?us-ascii?Q?GcOm73b+SVyo29TPq/YbfhN1GSA72K4ArgEQfJsIwxV43C4AbxKYIFRfAvI6?=
 =?us-ascii?Q?bB7h2uhR3qRD9w41GbZv9VwTyYSSfZkmfLIzITgaJ7dug1r6ksIhNa1Btr4T?=
 =?us-ascii?Q?89cfqts39NzcIYIb5rxIqQ4ndnQxK6Ok6BGBYZTkxVlqKU1up390n5lkIUYI?=
 =?us-ascii?Q?tKT19IgtKOnMGkgze3RmioxnRwxei0ja5Op2ihMKd0lSHrEcRguQ6YCW+vkS?=
 =?us-ascii?Q?4E7gatzDbu8Sl9yI/7bkmw10diRyEpSJkPMbMIjL+Z4eaCjV9XDA3k+hCcwe?=
 =?us-ascii?Q?2CuwXjlBCg+zpjCsnELrMElgVcJr1D0HkgOPwJb8xH/ZjZKef1CRnVdSynW3?=
 =?us-ascii?Q?ApqFFWip2k4hbLtfkVPmthrvuG5b54jvxPz+B7W/TsVvMQ1nVUjurTyQlP9h?=
 =?us-ascii?Q?uuN7M3zmSXSoj2p1uVJfX1GuUfqbiNe6/t8LRZF7MNgPuk/5Y7K5vstC6fk3?=
 =?us-ascii?Q?DEhZQ8ZdenuOC2HSqTd43gWYaXQoUuUOct2RsTXOI/M8IzkcNS6pJK6pxDFE?=
 =?us-ascii?Q?ZC55XimEOcgISJ9OzWSjpihINfUPjcusg9gON1IoNhjMS7rxp5pes3RNLp+I?=
 =?us-ascii?Q?snBEoahYIeE+i7JZ6d0fzBdYhXo0B63qAZ6zyOqDELk/h/15u4C7o8kA7Nez?=
 =?us-ascii?Q?54o35PyVh7ihOij8LQTm35kvYyz71VO779G0+ikLrDd3yQVwQ2wLkt9zTID1?=
 =?us-ascii?Q?lxYI+vqJUdt/sTHLN3L71UU=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e27b9b49-1192-4611-0b7a-08d9bbe7abcb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 14:16:34.5560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKOn2OIO7qdblZ46+BwwsKQOGopwSbHK5v9/NQjscHrykPui8xttJOrNlpfIwpWL+WiK+1ihiARQJtj412BxPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4463
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10193
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112100082
X-Proofpoint-ORIG-GUID: L8P1xAotmmwmPVvRtB3qzV65lFixjLG-
X-Proofpoint-GUID: L8P1xAotmmwmPVvRtB3qzV65lFixjLG-
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, pbonzini@redhat.com, rui.loura@oracle.com,
 joe.jin@oracle.com, adnan.misherfi@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The scsi_sense_from_host_status() always returns GOOD since
req->host_status is 255 (-1) at this time. Change req->host_status to
host_status so that scsi_sense_from_host_status() will be able to return
the expected value.

Fixes: f3126d65b393("scsi: move host_status handling into SCSI drivers")
Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 hw/scsi/scsi-bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 77325d8cc7..d46650bd8c 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -1465,7 +1465,7 @@ void scsi_req_complete_failed(SCSIRequest *req, int host_status)
     assert(req->ops != &reqops_unit_attention);
 
     if (!req->bus->info->fail) {
-        status = scsi_sense_from_host_status(req->host_status, &sense);
+        status = scsi_sense_from_host_status(host_status, &sense);
         if (status == CHECK_CONDITION) {
             scsi_req_build_sense(req, sense);
         }
-- 
2.17.1


