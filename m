Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D34613E1EF0
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 00:38:21 +0200 (CEST)
Received: from localhost ([::1]:57706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBm0K-00048p-Ru
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 18:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mBltc-0001zf-2q
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:31:24 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:57952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mBltZ-0006iq-P6
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:31:23 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 175MUwuH009440; Thu, 5 Aug 2021 22:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=45OhlR7SlCVp/xRrtHyab9dZ+SPh6iBGrJB0D4Vd82s=;
 b=UeETe8ql2tuoOpQg6s9370BXcxzfdmxDPhDpPVoB4ElfXAvZh5/ZgWPFFmlvTQiQd8Wd
 q5gegfZH0mVQ8LreE6KccGcxhJ9ThyNb4Fy5oE2KqhQ+5awi+QX7FMiR7CNuDGiMrE/K
 7Qy8nXx8KKF7VdQ1L9ve1X/Bx8zKd5Lv8tOr+hUrJhVjXSZKXHFmZhynUdXwCVGSrMar
 XYTFlvxs6QmDsHWbyYpZWPtJhGA4iftXN6hjOXFFOeQUyubwErNwA/t5n706xTD+mLOT
 LG6yBtqq96fOqKSPrr1uq3R06Xn7asLdyOFp2klUcb+w3cTZGoPdEUScI9a9b+VUdSws qA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=45OhlR7SlCVp/xRrtHyab9dZ+SPh6iBGrJB0D4Vd82s=;
 b=wj4qK2Gdcm/2sbRkydEfoUJCLfGf3ksCifh1RwNBlqkap3GR2EOj/Dt7jzRJpRqKt2Vf
 D69zyXdxPISg4DZxzxVndy5onLSEdqY8+RqaGdU8DEtyEXuI1QLHA/HodgDWhyQVy4LK
 U2pyU8ahktEAnYmjM2hQA+y8PicrnZBcvv86v3d4m5xWxtxWuqdiQwtWTuXtDZb7Gc7U
 AAepL225tB1q6i6vg3b8KMhAiUNIT3lNfOROZyw5gGPiBpRR5Rz/Jj153nrica7ozoAS
 H6KNRmZSlTYvDWoVsMToRHTNb5XQJGq7A5eT72o2cFj63bLQDifn37Vhk0Z9lGrv79S2 4Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a7wqubj6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Aug 2021 22:31:20 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 175MUFIh166810;
 Thu, 5 Aug 2021 22:31:19 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by aserp3020.oracle.com with ESMTP id 3a7r4ah26u-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Aug 2021 22:31:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZZNDwN49J5SzNut1sCIMUakXyUyHQB3JE3mWopf50LGys25Su8lxpGS6K08r2Xo1tv9qlEYSVdKsB1odCIwqmQ1mivKYJAT8ZXzWIJSLLr/28lSrkd3i+xGY8Nv0oYas4MWo+8dfDrhAOwacn+8Ox7Y114ajRSl+eSfRRCFYEYi2d2hC6x3TdE8eytZbje2lgfSk3cCWdBnWqGQGG/JxjepcNzH+h0FK268BwxIWhfOnam/kzu1AdlNpR85AZkHVsZu6Q0L+bSD98g+0Wp8Nz82DlQ2UtrZ19Dhz3wQVLEehSH5tip6Uf+fTN9kqN7pSySjQ6ZUFbckJ6RuTeyVxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45OhlR7SlCVp/xRrtHyab9dZ+SPh6iBGrJB0D4Vd82s=;
 b=dZos3H9fquC6u1zguVsHm7i+gkYEWxttUbOSXk3BNBfpI2xhJUi7GQkZ6mVqXHpjhpmYzM7TSByRN2otCjLVMVq4mwtJ30sbTbVvDle7r33fM/tVwGwcj5kErc90TNMRtSwgDu3fQJKnOE29D2Cx14odmQMdy1vjY4dMqgAVEyTiQl1t0slMzIdIA8EH1NSy9bEJk43cfBI/KLMf6S1jaE3gG0AZJDpIsONKyBUHY8mNXFfjB6mkiY0b//FtHpAcPxFXL14awNHXLAYmaX75JQbJ8nS5+rF1dV48f5bazS3b9oZ+nsHzZEweRfZD+Zya1kGrwnxD8EHd5r/22ToCBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45OhlR7SlCVp/xRrtHyab9dZ+SPh6iBGrJB0D4Vd82s=;
 b=utMjincD5gqStKoIgPe0tiY+grOO2lGlMwpvGnpu5RpHIteDkGupluCAubPYPGU+KR4uOlt17NvM944YPI35+2eV7xckwB1kkWUWBGO+V3Zy/OuZoZD0jtvrqjoprXv+zJQc6U7YW+zhj7zTjWtRv+ZQQ22phMnL/C64EFwR46A=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR1001MB2221.namprd10.prod.outlook.com (2603:10b6:301:2c::38)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 22:31:18 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d23:ea44:5df6:2bbb]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d23:ea44:5df6:2bbb%2]) with mapi id 15.20.4394.017; Thu, 5 Aug 2021
 22:31:18 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org, imammedo@redhat.com
Subject: [PATCH v6 03/10] ACPI ERST: PCI device_id for ERST
Date: Thu,  5 Aug 2021 18:30:32 -0400
Message-Id: <1628202639-16361-4-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
References: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:217::27) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 BY3PR04CA0022.namprd04.prod.outlook.com (2603:10b6:a03:217::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17 via Frontend
 Transport; Thu, 5 Aug 2021 22:31:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b61fb3a-d8ce-4240-d049-08d95860be23
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2221:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2221708B36ACFC51D479D94D97F29@MWHPR1001MB2221.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MkFQ6BeI+zHahBo2bjQzcbJHLmbIBhve5+V/2oIu5OeLp0ttCwGyojOdu0Wx/obGqSE3P9tRmzSwbj3ZA/ABMlXjyfiQr71TPrUQiKGuYsISz6To+00pA2y0lo00IPZ4KfDU60JT+BoLvT/d1tB2s8NeMYA3D1zw7mGY0VfVNqxjXiC1bDcXsYgzh0e+o2R+TQnAuZkEgCpFyFaUrGQHWuBTx8zKUehLqfIb4cxHfnGnH/ptSGWTtoMQjb40QbyU0fQPQM+KqztFo5beqkKp1D12JQrkqVqX3Hl+NvUkhsTf2RYivixY4cdbWKIDREIYOVNinhjv2nLZcBEs/u3kQN+h0QY635nW09rRf7c5anacWiYWU33T6Pil+Af6VdFBC1Vl51aXTQRBJ6jV5sw2H8e79sSVnhEhk1QH/++MBnNF5OmGXTPqCwEQUA4TWtPZMBsO0kpKkeAE/ROpN4wzlTbLNsBXK4GQsxCoGQ+HglkQzrhrBkVCOVPPC4ZdsVw61Es5csb43jStLY+dIxw/5xZe2iLVxPSDDkBkSVW2NoT+BcP/YkiqLaqMZjXAiSknmODbO4UW/noV/w8i7n6xIlR1/FohmqPlaRjgumMLWjI+mPAcBDiRf+4+FYrqMP6y+utYbsU/zusUET2uPE3BdfnXQ5GiJbo1TLKBexvKb/k2EvfHxbGbCtiSZNPdsof0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(366004)(346002)(136003)(39860400002)(8676002)(6486002)(38100700002)(38350700002)(107886003)(66946007)(8936002)(66476007)(66556008)(316002)(2616005)(36756003)(956004)(186003)(5660300002)(52116002)(478600001)(7696005)(86362001)(4326008)(2906002)(26005)(4744005)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VNnucCkXmdXVvvKKqS0ofnCQT4MjjaibwbZ3t9qm/8VWlQaUuLdnutAD1PYW?=
 =?us-ascii?Q?3qqGEjYvHxXA7HDSDhs/NJ68qU5wEg1p8uj645hKiwdh9vSKXz6YcPf/jskI?=
 =?us-ascii?Q?Yq9+DqGoB3cvTjg2l35371QnrO4qm12MjCR9/ZYiuKjz0YcUNmltSQPpM1dy?=
 =?us-ascii?Q?dekCFWAj7YHgC/6E30wfkthY9OlqkkKUJyyuTgy8nZ8eATt/zXYH8ARmtlvE?=
 =?us-ascii?Q?q7OEUaIeNtSrUhxnTjYBgvNvnASyq2KEJx7ihbs/K/rvhKIyqHbvEykb8YWf?=
 =?us-ascii?Q?IRWpfNKKJ+4lfPKMLwod5nAbGMKQJaOv+NBN4cD4JBBtAwY5GTQINOjASMSp?=
 =?us-ascii?Q?JEjcnAPuuaV7mJfvnCS6zdHjFab03G8yuGx9RStcChL5UdHKuCOB5dqo2xb6?=
 =?us-ascii?Q?VW1I0gnHcFOKjQ42mYnD6qJ8JmHO6uK+K5zgF3soxB8VFaeTkf2xSEXPO51c?=
 =?us-ascii?Q?seWkpb85ZxdrTSBx9V0Nq/RzJsBk3lAjpVvlmx6bHcM0gYGiJqXOtg2uXk+0?=
 =?us-ascii?Q?VluGBR4MMVdWvE6EqpD7dw0f8bRBZlgbUNw6sNi93bbfAYppG4wqKWz0jeEs?=
 =?us-ascii?Q?oNIS3+HoSBFERP8Lg+4epkcQ66PIbRwpOnoCQPorwgS8fbxrDG57jMRRfWlt?=
 =?us-ascii?Q?30SVUJSeYsgZma1GOUsl3AQUbaj9PzhTKKkezJMk5CdhnIkJ0tEcUMVdG2IP?=
 =?us-ascii?Q?f3R42OI01pr3xIpjmbZWmBJ5x4x1Vq8ZBRtqLzgI2yTO8FM6KSaP3YuiAYMt?=
 =?us-ascii?Q?Ws2y1IVI8bVsd5IALgnkYlUvtVMOaspB9zDlL0Ozj0XEpkCDNpUg1AEFy/iz?=
 =?us-ascii?Q?stGcW8lkqDrJCYKzJmwq4qnldXhZlrXm5WJYyI3M64yhx8CdzHWhSZI60ygp?=
 =?us-ascii?Q?DZvHy+h1Y9W7MwCEGk8uq5cyqS/uecHo45atRQLoOq54+Islrj6rjwHwZQSw?=
 =?us-ascii?Q?qNCfVxfn2NLJ4cWQV4gT9bmPUzvhSUiaxFNkBS3HDkCN36d3TwMHYPSpzpKk?=
 =?us-ascii?Q?GWms9v99ANCyVXbUiXFOIcl3RuxC9oJpNickSiGXgBV0k+Qb0vJSHy0LYsaH?=
 =?us-ascii?Q?j71pDyEvc2u3iF48rAhegdVQ3W8UrV44ZsneEb4dm4/ncqp1FH63rVEfmJiV?=
 =?us-ascii?Q?WiqU97KXz9NpfQOMufeHH8Yci+clF3Iu/yUN2kQx8Ws1qxPp5qxkbBesa3Nz?=
 =?us-ascii?Q?qh+Kj80DNTXVtLVbJby7RzFLIXjrUZoN8by5Ac2j0rOy3h1QpFtnbusU0hOT?=
 =?us-ascii?Q?3MyHSFQTNdTVeHY52Relp7Z0ZkT0rSnqfnuDTNC3s2m0zaZQfA+A2LRoO7n1?=
 =?us-ascii?Q?dbrCfS7lt8Jx2+cmWDTneqg/?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b61fb3a-d8ce-4240-d049-08d95860be23
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 22:31:18.1660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GTR3dnLsYVIwc/1nnOSmMZKbco/BnI+8xsB/80BwhYm1SCQPquItHQroFqK+NslD30E4h2KQeXo2tyc9CRY27LDtA+ZTAHCwVOsIjvECifM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2221
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10067
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108050131
X-Proofpoint-GUID: FwqyxDoc7Hj0TdIbDjQxKHEUzwv1XAMZ
X-Proofpoint-ORIG-GUID: FwqyxDoc7Hj0TdIbDjQxKHEUzwv1XAMZ
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ehabkost@redhat.com, konrad.wilk@oracle.com, mst@redhat.com,
 pbonzini@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change reserves the PCI device_id for the new ACPI ERST
device.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 include/hw/pci/pci.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index d0f4266..58101d8 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -108,6 +108,7 @@ extern bool pci_available;
 #define PCI_DEVICE_ID_REDHAT_MDPY        0x000f
 #define PCI_DEVICE_ID_REDHAT_NVME        0x0010
 #define PCI_DEVICE_ID_REDHAT_PVPANIC     0x0011
+#define PCI_DEVICE_ID_REDHAT_ACPI_ERST   0x0012
 #define PCI_DEVICE_ID_REDHAT_QXL         0x0100
 
 #define FMT_PCIBUS                      PRIx64
-- 
1.8.3.1


