Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0723F5FD4
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 16:05:32 +0200 (CEST)
Received: from localhost ([::1]:47238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIX3S-0008W3-DC
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 10:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mIX2R-0007lt-Cv
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:04:27 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:38844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mIX2P-0008T6-03
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:04:26 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17ODfZGP030422
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 14:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=UyO/xmIWF4gyj5cBnKXC4kT9FViCFddWbZThkJ6ynMg=;
 b=phEfMQnwea9kZ7iG0EhufEkxlLPPEUhEZ8gJA73byN3z+89ljPI04uGUR9UHezJbMpU7
 u3zEgBv5PzPP0YwWmX6sVtXdeF8ACHhVrlAVYQHzJRxTWoMSVEWw7pUdDZabZ2odv5CF
 vEbuqWfLcyDyd9JJt80R6Lnpw0Ch1JkkigqMNX7b8neCFOIeix9XwzJ4eHrKD3c9w/ga
 wG1Xj1yQVohzyGBG7WwoxL1y30ly20i1sGixiK3vDUgk3U3QiSCQGtB4VaxkDvs/1uIB
 bTMxTzofuQNmhWWZO1qyfUPC2EWXc/pJQq//WWtLWIhPK04P5Q2A0IXpjRVLf8Z2Inhn fA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=UyO/xmIWF4gyj5cBnKXC4kT9FViCFddWbZThkJ6ynMg=;
 b=M+5bEut7u7+SUohSQoyGmmngow81FtspiCsCQqeZ9pSIl8u+HKLt6++deZwGb6ZoZimO
 FAg02TOmFgA0PcrCPsMIpnGWJMQQjiyiwC063LE4odEeNtQj7adE7wMVgFVFjKNpBHek
 Ek/ZJ473Hc7mCutjWQtNqST9nZD9wbnWOQrZbW8UFu/iW/YHkBCexdYhF2UxQk8DLhYH
 JHz+5pCQxmsSp7WAaBx9HE327RUUgcgGdGovNxyfPrWXssUjVDEgNvuVXvtEV7OjSQWN
 tgUnRuGNFOQzvcMMnL6SYkSXlyLw7XBimnALZI5YpbjZZXKO3sS8vwQP8hHRyh69bYPH bw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3amv678yxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 14:04:20 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17OE1R2W022141
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 14:04:19 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by userp3020.oracle.com with ESMTP id 3akb8uu4e0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 14:04:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yd89VBK6CTXdGDCVY3ZEgDowvbV8mAiTxuoPII0WWog0yaoCwkcrMcBKFi6xoECuWqJiKh/Qd1m0ruJVal1ky9bqQluJ4Oe3/XU+gx/w+V6awhZMZbVp90WPwMjK6bMhetjoDkKuCEQGRgcKSwpB8E6dWeN9ZWbSXSHT5001ixbXbJ8oSWf1nqp8+5GAIjk2ul5p9ciVRTkBrIngrZlheesez52qSZr87t26X2HV9ShoVZyP7DO88Z9MIiCfLF+tM2eZgqTAdU7vFRI14GsAMM2OVE3pio5ACjxiN6biwOBXX0S40erJjOMICpl0atnqkW8SSUFoDNz1EvR32w26mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyO/xmIWF4gyj5cBnKXC4kT9FViCFddWbZThkJ6ynMg=;
 b=HQQceuFS+lNlcf0QDI9bKFXALR00ARRr/uAkIKOUCaEMMZUGS8Hp5iicsYQbdVDOoezPxAqqr0G/vRG4RPY940C7vNkJrS2bCXw1Nkr6qSrxDZrmnaJ6YK/SEB6J+9VzBiRs5l3uF3uR/TjWzKXiWUoNw12sYDMC20z2tmPulyVidqD88FJlGdZaMj9QL2mxGCZ1HiDMtIYXuyhkirkedyUOt7txhMUhKMo3rQ8nqNGgg2fDzxgvhqfDMRXUm1OmA/KMoifpag9F5ftmBSR0UDQfP12U5ygP4DYn0k+fK5aUUyystZHQzqSjylyYfDUxjpwK2a35MVtkXOVH/UAGUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyO/xmIWF4gyj5cBnKXC4kT9FViCFddWbZThkJ6ynMg=;
 b=TtyvuM/g90TPSyY/+4BFj4ZKGJD2rsoa3RD8hUP7X0oZ3bK+GT3pkdS+56roNTUZc367Hvu9D1mnP6HFN0LRZPz358FMzJZp4I7fa2RdjK0tWvmqHS0dQsl+UEbjG8NQF1AvrFPdr3Wo11cBfG5msLvR9pcyFasNOm8hGRTcx1I=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by BLAPR10MB5234.namprd10.prod.outlook.com (2603:10b6:208:30c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 14:04:16 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::6c3b:ee48:fd8:b568]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::6c3b:ee48:fd8:b568%9]) with mapi id 15.20.4436.024; Tue, 24 Aug 2021
 14:04:16 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Add myself as a reviewer for Device Fuzzing
Date: Tue, 24 Aug 2021 14:04:01 +0000
Message-Id: <d9df51f9a474f544e773ad6fee4fcaa6bac2f645.1629813697.git.darren.kenny@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SN1PR12CA0068.namprd12.prod.outlook.com
 (2603:10b6:802:20::39) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from darrenk-20201221-1634.osdevelopm1lhr.oraclevcn.com
 (141.143.213.44) by SN1PR12CA0068.namprd12.prod.outlook.com
 (2603:10b6:802:20::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 14:04:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dab393fb-0ba7-4b2e-fcc4-08d967080f57
X-MS-TrafficTypeDiagnostic: BLAPR10MB5234:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR10MB52340499E74DD390D7C3E0F0F4C59@BLAPR10MB5234.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /C5M965fVa+S7AJe7dYVVuxlnxXWNtMhOuavQuc4l+ojNSWySxcMhBqTttryuu9FFchwzdN2Aj5ucxCqXNY3W3Dhg09HoDQcq0mMV2QI+3GjNoyLER77WIOyzyqJxil7BMPB9jhcmFvSrtoC7EH9bJV/gI1aGW1NRSeE2VLrRdX+SCzgJmOiYm+UmjpoIZHtXaxn3SisZP1tIXnzyeA6xAKHxBc4v39MdKRE7TW2RDz+oHZ5d3PYHl7k4bbTGc7UumZAXd4OuLgLZZBCM0HnFEPSKsbey1kyRKIyl7ZSefCSgCbMBPGPkmzUO+xVawliyrmLwcFkn9T4D56/Nz8Xesc7cMzTQr6vg6hV3JuC4ltjsbBhZtwQijhsuaCcC+bBKnahNAIuN+iX4AQ/2IE7RMYXDFAe9cqzKfbkU6+h3Hj/2Z3+0xYu+FIcDbB0xOJuwWqFU+NHlEofZxo1oBjBSJNqp5vynh6vGr1jRjikyHP+vA8k5HOGHtbTs6D7MLDT6WjyVKuJObEkZMTb9n7eGupksm+SVdW+Ocle7mSRkT+VvALUBOk7/7RA4gb56kO68sImw6Eu6+xOXV5v8vH7VVKVp/9Xh3AIOW45Mka6S8Sxgljut5Osja/+aYFK27AaYES7wewk16cuxtInfOM7ajTOlu7soFJc8JwLZ/bz3QwrWeiiE/Z2OIHFZSKYdxLxb/3t7nwm1lvxs9uqZtjQaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(366004)(376002)(396003)(136003)(66946007)(36756003)(66476007)(66556008)(316002)(107886003)(8936002)(6512007)(6666004)(8676002)(956004)(2616005)(4326008)(6506007)(52116002)(6916009)(26005)(4744005)(186003)(38350700002)(44832011)(478600001)(38100700002)(6486002)(86362001)(5660300002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dEEjfdWibZHaob8QWFSCbsV5MDvINJglgOXIB3k+Q64k7Rjm7+YnuIC89Bqm?=
 =?us-ascii?Q?bSyja17dfosIjF9PElK9JZlzdkLvOMY5e6MpO8c26dVpX3ycj/7h1NtUawv3?=
 =?us-ascii?Q?t0LEFBvMAF+KDa2hJybs4oi4K9M5z31fiAcXjwrsQtBhmKSuMMe/l8mIoBBY?=
 =?us-ascii?Q?++Rs6A0Xy0VvIdj78YJqRRncUvXzuZ8FMs2bQbWVz9E2+CHbNdvGAoNHmO9W?=
 =?us-ascii?Q?7nLDAXkKnR5YzxNefL35aautokeQAqaUqta6ihur8p4+HvE2pTwi7/pd7oSm?=
 =?us-ascii?Q?t5zAmHi1/AvgA1x327VQFLZSmP5rn68VZ30uHBpP5Peh0wlMGjDtBBR+jKVg?=
 =?us-ascii?Q?ZM85tJAkWEqBhqnP2qNVJnJQZa5BQ7RW06thdM9sHEYDbr0bq7y8pN6B+6w2?=
 =?us-ascii?Q?ji53Bd/ZJb3bwUjxSFlUpJO35vNZn9Q2vnrhnj7uToNouAuKKWv+b4AjlmYl?=
 =?us-ascii?Q?jVqvpfj+yj3EpBTVUYpoqWeMJWldTTUAkWUDLE8FIJ0wvAtvD/91HRxJuFR+?=
 =?us-ascii?Q?9z+lThOPfX1sw6UDxVIGNwL58/QXeLT/rzjyQTYUPqX27YJZ75RZph8OfaeZ?=
 =?us-ascii?Q?btq14xDxi+05lTNygQNwIG6w0V6Di8utZsSHw7IoQ9spmPUoR0flvaG3QmUN?=
 =?us-ascii?Q?XGOeKm3P4HkGChVMEBDoOeNVX63+wRjMlr5RAGtbuclF8N+2Ae4Z5BuNCMxK?=
 =?us-ascii?Q?SHu+Kal7AZ5HkycyATz7Gy+jqP+HmYXCmEPwL3eqcsrfd7gJ/9bi9stleS7Y?=
 =?us-ascii?Q?ZNDgziBPxSIiieBVvAVDxQV9nf9FrplBWrSi9eeT2t/oGWRL7AG/bKMMXvLb?=
 =?us-ascii?Q?NXxC8+tPANK/oUxchf5CJBdUQ3sCFv6tIgGNtVOee6FxpPx9gN8UGGoQ5PUZ?=
 =?us-ascii?Q?lFc3tZpdlojPxqPW5212vvT5uj3+6YTnszdipW4YoVSimVA5QCY8RMydExW8?=
 =?us-ascii?Q?0omAdn6pGepVhsmcrYaNci6gWfU4Bl1aRHDAzK2RQQLuG0Gp3ON0OSsPbG0x?=
 =?us-ascii?Q?/dPPKtCNKjybDLjmsQbdh0oeednmKcdg82gfjMns5z5bsCUf26+h9vFmNG8R?=
 =?us-ascii?Q?ecuVJyeoJlGLh91QdKFiygZlDyWE2xYA6fz4gOPoXL8SOY8uxwrA+2F1RS8T?=
 =?us-ascii?Q?MeSChQ9Fg0nRB3oqa+L0CqaUMQK33dovxIeI9adwgJI5u/vSc8Aa6eYLB8u0?=
 =?us-ascii?Q?yf2TJTJ4Yrv2aYIROposyEViz1254w/mQ9c2MI62Joh0Qh7PcOvI49NUMcBd?=
 =?us-ascii?Q?Yi2XQVMzSQoT4QKapm/a1S4HLrE3tngDjjEy0cRDdY8hS13NtJ625j9fdwhB?=
 =?us-ascii?Q?FgcHMCoa17aB8F9/QYeAG5or?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dab393fb-0ba7-4b2e-fcc4-08d967080f57
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 14:04:16.6002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jNYKEbg9cPRJSLpiOCIUVCWYdJEwtrkAGtC3fnjHBS7awrMAJanBsftR0wYkFENckTOKZNdeJtk1I2PfmmNvxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5234
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10085
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108240094
X-Proofpoint-ORIG-GUID: uI_2v22x5GTMl6n2yAMMaY9U0IVuO6Eg
X-Proofpoint-GUID: uI_2v22x5GTMl6n2yAMMaY9U0IVuO6Eg
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: darren.kenny@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Should have done this much sooner given the amount of reviewing I'm
already doing in this area.

Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6b3697962c1b..5bef084ca173 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2706,6 +2706,7 @@ R: Paolo Bonzini <pbonzini@redhat.com>
 R: Bandan Das <bsd@redhat.com>
 R: Stefan Hajnoczi <stefanha@redhat.com>
 R: Thomas Huth <thuth@redhat.com>
+R: Darren Kenny <darren.kenny@oracle.com> 
 S: Maintained
 F: tests/qtest/fuzz/
 F: tests/qtest/fuzz-*test.c
-- 
2.18.4


