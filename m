Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0572A3F9E5F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 19:56:42 +0200 (CEST)
Received: from localhost ([::1]:39010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJg5p-0000LV-1X
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 13:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mJg3V-00060l-22
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:54:17 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:46650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mJg3S-00071O-Qh
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:54:16 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17RGPUUa015226; 
 Fri, 27 Aug 2021 17:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=qUxgYcymVUOcPkHKKIaA6/gzrd+qPRl0kJ3LRQgd/z8=;
 b=JSuWFFv9/LAYPK8nKLxXzwEG0DjANzXDfvb3JxoT5JyeTV0kyQr0j57SDuMTxmCs2Dpa
 HYmBdj6QYSb2itrjHdZJI2eMBhDYT7j/nzScQn8EAVlg//sD88drVhT/BRM6a1ssH6EE
 hZXmI2KA00RXO4FBBpr5C1n1XE2TErTLR7hAHTY45yPd3DahlS5+Ax/f/PPd/tVFRvgn
 dLrQa0bf0HlGftHXvkeF59FQi8BFfEPVb0c5n7uVmpTA1En96xup47tZ+UQJIPw3kVoe
 Qt39zFLIMXCoQ+4Ch48BT5jR3yNPd//PD4N9PnKms6UpQN8mbufH9wyIYrrOqq6gWknH 8w== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=qUxgYcymVUOcPkHKKIaA6/gzrd+qPRl0kJ3LRQgd/z8=;
 b=o+Js5pUaUS01lg/hrebT8pfCJPOpvsbDVo2FNuh3CMz0cUE1F5tjrDKBiLSYjnDoCXJs
 7qkPoSerGGtID1WJu70IRVqh8dj2R9HqimYOJ6dTB9Q0dUmQcdiY7XsEJgeaf6TjFY8v
 GLMDEn5uRcCPWO2ZD+37VSSKSvd4Z8n4435ufVqB3oubLMbVYu+JgOXfpxtq9iDhdXQl
 1qq8WiT9oyd3DX4oaGTY3M6smNT3/L6qGWr4iBvqMcbl2FcAQ0r2W/1sCOaLKRMn+ctF
 0vHFFhRrJbYC8eYKD8qAOJqPRQYpXwLX0aPF1WvypON+pE4U06o5PwBqsGqaA4We4lXq dg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ap4ekvaag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 17:54:12 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17RHoCf9038016;
 Fri, 27 Aug 2021 17:54:11 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2040.outbound.protection.outlook.com [104.47.56.40])
 by userp3030.oracle.com with ESMTP id 3ajpm53hh9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 17:54:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YBqpbQX06O8jkhRmztRmSF6+rXUSyy+AvguI2zz33T9IKEyrb/0efqo8FV1EaatYjRS128XUAbIiyJLJWtm7GdcVnV2d7VGiJoK6BAg5957wQf4RB88/eZirpReomNSma2tlXMPsynu8iL00VJ1g76beElTjOYRsRpc5tKab6NShslULFUP8L33V9gZhhWWqAy8uEX35lbNuHau0mmsDou+cHGQ1sTcHVqHLx16sRqTrLM2P3EUiVsBcp5iZaCJHU/wWdjq3YUDNkoMo/56AIIuS6BD5a9HJGyZOfjEcha/vK5uCkHvJMrqy6jAHG8DXS0VH36adZykThFSMmBNiZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUxgYcymVUOcPkHKKIaA6/gzrd+qPRl0kJ3LRQgd/z8=;
 b=e6Ra+6ByGcU1oJNv0bL+BVaVKxbOl8ZK4YtMlA0bU/4T45vSOiUV1PdTzFsUpZCctT/ngGx7ibnKAgJ89YD7R3bvDZzVGa5QYkGGkjGzm8NO8FE/nfXomSm9ois06GPGqye95g7+Ll2swR20bUig8rlBlnqdXS6JyNuPqR7qPJtbcXUhDDT1tF7J12aKsZNgFg228WD/66sqTDi6TD3GMQ9j6sEnTvmNbaClgq+lX7d+e1Z/bYC6P2SI4b1zR4J0Elc4XZJqhISHgCNlGcEoA3ZgtCWOwPg+IYCq96XmlGsuDxN3fepT7BqTLW94LL/QWjQ2wzfFDHySmtYY+wuBmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUxgYcymVUOcPkHKKIaA6/gzrd+qPRl0kJ3LRQgd/z8=;
 b=uAV2/yeimzTX5khge7zFKwWvKvhglYx3RkVNIK6mSAJondMCwvd+CSL67Aiqu5G2X0swZWZr8jZzQMbpjB2SzpBzFpcjlWIN275eO6S0Mwg7AdebSQqfcsl+7vePjCpcygkmbyC/SaQgP8j9+jk+WFt3yusFiBlXiR5UZHKO1G0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB4865.namprd10.prod.outlook.com (2603:10b6:208:334::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Fri, 27 Aug
 2021 17:54:10 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::282e:c371:7a10:b122]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::282e:c371:7a10:b122%5]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 17:54:09 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC server v2 11/11] vfio-user: acceptance test
Date: Fri, 27 Aug 2021 13:53:30 -0400
Message-Id: <9bcb7b4cf45e2211913a57030aaf5809e3e381f7.1630084211.git.jag.raman@oracle.com>
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
 15.20.4457.20 via Frontend Transport; Fri, 27 Aug 2021 17:54:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63341781-a479-40aa-c18d-08d96983abfe
X-MS-TrafficTypeDiagnostic: BLAPR10MB4865:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR10MB486581AC2DA8B7E61FD0CA4B90C89@BLAPR10MB4865.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UFbp+vuMr/CLNPPfnvojMS7HuJXYMAJDXFvUgbN55/tE+fhvUM33sLqfiGBwNjJflyZyLgyZb5F9sv7RP3aCLDVqDDK1YSI7mpDf+cQ96cJ9LaeRVNtQc3w5Tjp4mk7TYDDq0LFSy/90w75yy8BFO0TPOiku7cMzh5YrUpRgCnPxa4+7D3QS8VrxO/u2uDV0ZoJuYC0PgNJp0QVH859d+O+cvo8JcD4JryIZTNzDkpUVmAfzHJuPICJDU8jytURhFMPtvBE5vM1YJ6nkshIk0MhbQoz68NgaWI1ml/clDin4aZ8twS4bYmXcftUQHqkkNHcN6CMTuEl8orKusVRsxZuxigbxL499Hyi5Ohvm24LDZoaIYPiK6NAeqYip3WjE+MO0EQ96wLzOZgo39Xmqn6G5Yaxk/t/xzsiS+i2C/wqyGnxmL90eBvuW6+mh5ZxP8OmKBh+MK/AUzkCpW7KKiaLCCQOHrX1CNs1QXnwVUq7HSdptOLkELSxJpctPkLO7Hs2oMHjuYJpJh+DpAcKmigf7d2irzmey+V1qEDDLRH/zFtnhKC4cNmqI10cZUD72tKdUvdQf0Qt04/ov0QY+CraFqDjPgeYp6E6uP7evYCXfQF5ei/fHLbrUCDeXgtxT3fpJyA0s3z+1daKPlkm4/G4RiDLnWL4HhbgvUH24yBkiMA1pxPe8sL0+0rIRYGoX85lK+drstIHcqZPvNT67NMNfedmp7bERpZp2hZjyyj+CdtDHZyyCnqRSz9C0/qV5dZps7stZQyLyhDYL8ao4xQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39860400002)(366004)(136003)(396003)(2906002)(186003)(2616005)(8936002)(26005)(8676002)(38100700002)(36756003)(52116002)(7696005)(83380400001)(107886003)(478600001)(38350700002)(956004)(7416002)(6486002)(4326008)(6666004)(66946007)(5660300002)(66556008)(66476007)(316002)(6916009)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d/B8pOkN7bEt8J0RemMAuxACsKldFJJw7SCbfXbRrzRYz6apnNRZSXkIDkxN?=
 =?us-ascii?Q?2Ues//MGEXMzpWxUYiWZ7qlDkwXhKEXndVt/+cSnmTKd2Ja41ZkRsP/VGeUA?=
 =?us-ascii?Q?5gGK8PfCk8k9yoiuchB0XMe5sLr/HRB0NbKbr2EHyY30ANEX0MvFQSL4Ifws?=
 =?us-ascii?Q?trkIS3RimROimRFIBQJUNoxlm/pltGQ34Jb5m3P3G59k129WFBUMCyVAupZE?=
 =?us-ascii?Q?vh3Sm++EGn0RnQJ/E80nL9BjCHZpdhFjsYSYSvzurzrsw6QTSRCfXcy3lpDm?=
 =?us-ascii?Q?79CgijG75Cp0r2cjQQdePzPACC012iPuv4NJxeAtFhTpV5RAS6MwTNmiNFSG?=
 =?us-ascii?Q?+2HftkiyyGhELySGAo5sJ8ul9Lc3Q1KLY4uQK89Yyfv1aMJ49lzRSeOmQuwU?=
 =?us-ascii?Q?I4Oukpss4A01J9v2+BkbJv3b1gMFTmE4q9jCNg6prGBwmrc4F9kEG3hWy75d?=
 =?us-ascii?Q?bWYqWrG40uCWGdStgpAUt6AQInh4taaozERY05InjWIYxXSnvIy1pBFHLTD8?=
 =?us-ascii?Q?wJzdthjQhhQgHRHTYX+stZnDTN/MNNu7MPYv234lpsDiS8RIcVqXHzZDZO73?=
 =?us-ascii?Q?eEX3w8l9CATUSDZO/9ahUc7Gn/zK6m5M2V51JrUOVwojz9yX0kmnR4A03cY5?=
 =?us-ascii?Q?P5jSDh7AR0s/ePsDfxyCWxV1zkBRrLBFD8k/5NFam62XS+5w1mWVTs7gU9p3?=
 =?us-ascii?Q?p4H6B6IJXLusaoudYs1vYidIQBFWrosCg4f/EgbLPEUl7xlYI9sJ8Q3WdgVs?=
 =?us-ascii?Q?hUW1Erjs93n1KnFKBhUueAopzvzvDXIMSvsSuYZjr+jkCjhEAwY2bqNZv31t?=
 =?us-ascii?Q?P+85/HVhGmtQ+2T10U0K0uLuM1gzFeBUqUZjC/W/K8KkKdGWM1WqWByYyzT/?=
 =?us-ascii?Q?nWMB8d0Becrzy5I2V9MfJo04tkC4TKzNcl5SpUT9Ux8RWTGoIszBJikBL0uE?=
 =?us-ascii?Q?uIBKnvGAJmtqn1IMCzzwIh19RbZ0jY6gWzs05M3bLcat9zXoEx8aQENH7+nx?=
 =?us-ascii?Q?j0uJZpiSCI18xIpAGY2coe/15/M2vcWGNNtsOoB7WnqEGNM3OsjCwcTgT0rw?=
 =?us-ascii?Q?NHlbcGqrkvvun3j7OYrRsckM7hZwssDp+wQp6SQxrja8PHqPfBk7zAOXSEcY?=
 =?us-ascii?Q?erRVTBUJ2BEOoc5eOkhr/zXBHdqCVoh5HmyyBaIYIlqhSW4O70aeARrwpyld?=
 =?us-ascii?Q?CVK5q2Dr3ATlEIfBGxzsj2obnNizt60I//gJBFrZHCVqw+TDreHz1adatp3l?=
 =?us-ascii?Q?aehN6tl0ReWRxrB2f0vEcP3S+atGnQ5NZPXLuwANFvw0jNwbZzB3Y9/o77c2?=
 =?us-ascii?Q?LqLp6v022aoJ/tJ1YjDMyr3W?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63341781-a479-40aa-c18d-08d96983abfe
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 17:54:09.8387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iSZaIItIolrpWlnDlxG8KdjW26AVL0VCtizA4iGK+DS7w7aP7/NyWQElcOE7e69SkXru5aPiR+HPzNu94q3nFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4865
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10089
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108270105
X-Proofpoint-GUID: Ugr96GCJob9b8ZQwbd6p9azTH4LyYCfv
X-Proofpoint-ORIG-GUID: Ugr96GCJob9b8ZQwbd6p9azTH4LyYCfv
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

Acceptance test for libvfio-user in QEMU

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 MAINTAINERS                   |  1 +
 tests/acceptance/vfio-user.py | 94 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 tests/acceptance/vfio-user.py

diff --git a/MAINTAINERS b/MAINTAINERS
index f9d8092..2c7332b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3392,6 +3392,7 @@ F: include/hw/remote/proxy-memory-listener.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: hw/remote/vfio-user-obj.c
+F: tests/acceptance/vfio-user.py
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/tests/acceptance/vfio-user.py b/tests/acceptance/vfio-user.py
new file mode 100644
index 0000000..ef318d9
--- /dev/null
+++ b/tests/acceptance/vfio-user.py
@@ -0,0 +1,94 @@
+# vfio-user protocol sanity test
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+
+import os
+import socket
+import uuid
+
+from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import exec_command
+from avocado_qemu import exec_command_and_wait_for_pattern
+
+class VfioUser(Test):
+    """
+    :avocado: tags=vfiouser
+    """
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+
+    def do_test(self, kernel_url, initrd_url, kernel_command_line,
+                machine_type):
+        """Main test method"""
+        self.require_accelerator('kvm')
+
+        kernel_path = self.fetch_asset(kernel_url)
+        initrd_path = self.fetch_asset(initrd_url)
+
+        socket = os.path.join('/tmp', str(uuid.uuid4()))
+        if os.path.exists(socket):
+            os.remove(socket)
+
+        # Create remote process
+        remote_vm = self.get_vm()
+        remote_vm.add_args('-machine', 'x-remote')
+        remote_vm.add_args('-nodefaults')
+        remote_vm.add_args('-device', 'lsi53c895a,id=lsi1')
+        remote_vm.add_args('-object', 'vfio-user,id=vfioobj1,'
+                           'devid=lsi1,socket='+socket)
+        remote_vm.launch()
+
+        # Create proxy process
+        self.vm.set_console()
+        self.vm.add_args('-machine', machine_type)
+        self.vm.add_args('-accel', 'kvm')
+        self.vm.add_args('-cpu', 'host')
+        self.vm.add_args('-object',
+                         'memory-backend-memfd,id=sysmem-file,size=2G')
+        self.vm.add_args('--numa', 'node,memdev=sysmem-file')
+        self.vm.add_args('-m', '2048')
+        self.vm.add_args('-kernel', kernel_path,
+                         '-initrd', initrd_path,
+                         '-append', kernel_command_line)
+        self.vm.add_args('-device',
+                         'vfio-user-pci,'
+                         'socket='+socket)
+        self.vm.launch()
+        wait_for_console_pattern(self, 'as init process',
+                                 'Kernel panic - not syncing')
+        exec_command(self, 'mount -t sysfs sysfs /sys')
+        exec_command_and_wait_for_pattern(self,
+                                          'cat /sys/bus/pci/devices/*/uevent',
+                                          'PCI_ID=1000:0012')
+
+    def test_multiprocess_x86_64(self):
+        """
+        :avocado: tags=arch:x86_64
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/vmlinuz')
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/initrd.img')
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyS0 rdinit=/bin/bash')
+        machine_type = 'pc'
+        self.do_test(kernel_url, initrd_url, kernel_command_line, machine_type)
+
+    def test_multiprocess_aarch64(self):
+        """
+        :avocado: tags=arch:aarch64
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/aarch64/os/images'
+                      '/pxeboot/vmlinuz')
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/aarch64/os/images'
+                      '/pxeboot/initrd.img')
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'rdinit=/bin/bash console=ttyAMA0')
+        machine_type = 'virt,gic-version=3'
+        self.do_test(kernel_url, initrd_url, kernel_command_line, machine_type)
-- 
1.8.3.1


