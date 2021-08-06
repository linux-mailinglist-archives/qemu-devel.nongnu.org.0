Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FA73E31BA
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:26:08 +0200 (CEST)
Received: from localhost ([::1]:33840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC8I3-0003m3-CR
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85u-0007eq-UE
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:34 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:39806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85s-0004J1-QF
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:34 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MBhkI032541; Fri, 6 Aug 2021 22:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=w/vrcOivBpdqxFi9TZFcRb2nnlFEOUIrem0F/zKASyk=;
 b=DgD3bcvPeonstqklUIjh1eNRR6tCkW3IU0oX2DPLkXJRXBYl+zJgEs2Y8TYfgbh3w/Wg
 31PkHIbpRyx7ffm6wWvMeT2gxPHW1xR+xOGJaQpGJGrEjND0c5SPifcVbbsk16itPysk
 VN3om/1/tZ2pOxGYaxkh36RDfskIeJZiaigfxPW85TGlZsfBjd80oVF5w/hSw1e6qkPn
 8KxypvVz+HbFehrta2cEi7yUVU2js8R3RkiduRCM19rMARR1KWHcMo8jAhVFrFCNmV05
 TYEQz4RBxjSQFs2Ly/PV/9bheRBoEiNiL1KVb0p6AHvnWyKYyQ4OOG+XfmVO3aykvB3E wA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=w/vrcOivBpdqxFi9TZFcRb2nnlFEOUIrem0F/zKASyk=;
 b=u0nwijw2jfQc2GSSwjSacLgEYPuRDvnkncTikgNR6/jYnKjAGi146kO4lnbN/kQIVR7J
 Ma7jVqkogJl6dDztcWAqAt9kE0luUqaMeytZ4o+Mv0NlJ1YeOtM8S4kxUxnX/mSEWIaS
 DBzjrz0WWV6RQoq+6anw/SsaHldjXvesfIx3KVnruBR7NArD0mtD5QIRQ93Cjq67Av1q
 jawIQ+Ce5bdrcqyn86OsGRyyrNZvzyoLfJ6Wm96oihkd4Hz75A5rK9UAyWJ3vMolmUp9
 dxLSqfd0sUobINFHdR3CGbQLkTQdDZtqhsydLCCVziZ0IQ2qLJMMEQeqwi5Z3filzJHY 2g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a9661s13v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:27 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MACtV083059;
 Fri, 6 Aug 2021 22:13:26 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
 by aserp3020.oracle.com with ESMTP id 3a7r4cay3v-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aq8XZGiudY3WSbM4ClbyTOewrjCI17bp5IlTWXvKjysdBvcROY05/Nx225k6eU/5rTEuSdp18f6T96SEFVd+e1Uz81ZFv6OYwQWWhd3LcDoQfanPTMvq+321kLtLWI1tm5TLmSiR6dL2GYETqM/fcq+U/KtZi1Epnc5/fIbgaEYzFKqj54k70W8t9+V+VrAXRAsKlIGtL9O5NXHGoOf/dC3GLV7cqsPaYD0JPsgtgfsSzJDQpp1bdKkqK80I6mtEmfFuc7rA4qw+kz8yY7QJW4s32d+YzFTHmTmB4tiYA+wvcP+WCxkJYzhtaaXHc8MTERQbJNJ6jOD/2JIlfS6g3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/vrcOivBpdqxFi9TZFcRb2nnlFEOUIrem0F/zKASyk=;
 b=fR2T6jJ3Pfi11vEYbJ7Fr9G2PtTgAYghtNEkL170gibXEXJYExeD5k1U3YT4LNsPEr+nrEHOIJfxEdiffrpE2KDGsa27phF1aqu0keu9RFSLhhM/bPNrvtcr8/sI9IWAFsf/lm6EeIJhTbsR0rCipcM7ZeBe7Bk0F1WRSNLK5OZBOQPIujAwXX3OhmpzSkpHGkpUWAeuepV+PtuSMYruww6LE1RVmaMbcOBYGBKL+nYf4N/OVkbJYD2MpfyATRQjGj99EWQRz43AL8e0rrR5ifWL00NvW6Ir8KawQQZ+N06bylM2tfgqMSkkBHTllJQt3s/V6Dz7DD85EbteV0728g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/vrcOivBpdqxFi9TZFcRb2nnlFEOUIrem0F/zKASyk=;
 b=jinm4zFafwKe9BbqN8QliqRbH6DY3jPVzl0bSJg/cMXV0vD/lAtWDYnX9uBVNUgx3zEbpd7H+3DrA9ASXCKeDSqProSd20bu7spWA940zNb3AEnQwS0wjmOmr1ruAsDB5SNr0mL6qL2UX3R+7Ozy/613pOxop7iPA6BdlKmnDDA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4129.namprd10.prod.outlook.com (2603:10b6:a03:210::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 22:13:24 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:13:24 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 17/27] pci: export functions for cpr
Date: Fri,  6 Aug 2021 14:43:51 -0700
Message-Id: <1628286241-217457-18-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:806:20::7) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.7) by
 SA9PR03CA0002.namprd03.prod.outlook.com (2603:10b6:806:20::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:13:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc0694db-df7e-4f15-3831-08d9592768a4
X-MS-TrafficTypeDiagnostic: BY5PR10MB4129:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB4129F4EA173B9F5BC8078440F9F39@BY5PR10MB4129.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CDBcpp9ZhvFToL0Aq86f1EGjv+RzkxfWE+GhbpkUE3uCObNHRCusQMVgqjaBvcVgNc1bd/K7pc1ay/JWaj8NwtWNNBoiuZpTvdtMfn7ImEgDLiwlAnKSQbgCZmnD2SeikHniKXktLrKGsVXTH9+iTk1y9lXeot2P24uz/p+neDIo5TLAx11MOmojysYbUhGAVpIqC/oX6wlYNbx1z+Y+P0xuox4pWhZTCqJz2M8tGv4ZGdIv52nLN2TFUGfOqbJZRti8vYZFUkh4G3YzP0ye3/Jpu39jwJ0LxISQ44X4rWwgbL+UWUay+iJoyRmk3gno5yDgWhQQyuJbrFTlgE2sJSgAS5eb0yw2j5dIeaELx1qbX2UWK1LkNyFnibBW8U0QOUSosc+M0sKwD0eN6e0cj5R/f4SJs/vgyCLgme3PMjMJnY9Sn3FwCOsXknnKd4zepe01VI4zdwXW7Pcs1OGxM+pdDfrh6hvmdypSs3Pjmy+qqzoPzJlvK3C2N5S937thbYIuadLXFiWhKhCVNC4qngqql8KKEhveJryDhQnEPbVt/s2V2UfCrc45BnDQj8oGOZmbLbwbbJkN+7es4tTivpKhZYOgt6lplF5mQejg4TjuBxeShvxf7FtBi1CRSZyVARLANLRUARRoHQzerVQYp4XZbrqvhYRB3pVpsG+oEW2fNjum/C3tL3iUKYZbBuVOiyX5sMeVP3VFEuUag22nYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(39860400002)(366004)(346002)(376002)(66946007)(66556008)(956004)(2616005)(316002)(7416002)(38350700002)(8936002)(478600001)(66476007)(36756003)(86362001)(38100700002)(5660300002)(54906003)(8676002)(4326008)(6486002)(7696005)(52116002)(186003)(2906002)(6666004)(107886003)(6916009)(26005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?73WdXUqIAEITFg02cq7BGjX0zaliCKzHcrWFIeVU1Gql61PeADFSCADzulg4?=
 =?us-ascii?Q?rKNElsnQ/KtdVQ54sGeBKWF2YWjuxOd9q5ldWb74zZcLyXiS3yleTmFaMU2R?=
 =?us-ascii?Q?WiPjhM1w4iBREpgtxw9ZytjOfTRAskZumQOIbwCJAN9Uz1LOyFxPxwZ8BmKf?=
 =?us-ascii?Q?P0/T64TReahEBaVBihhGdnRjaSIAVmD3rC+73jWyEuSwphOjz+Ak1b0y6cXX?=
 =?us-ascii?Q?VhnDEhE5j6pHUdb/vqz6PXwDs8We2W4got8NYaPSk+ldu8NkAvtL2yMTa28D?=
 =?us-ascii?Q?buSH9AKjF5kdLbvEm3Q3iyyCtEJ+8Y0KRlhv3L2shuZm8c0jAzVATjiujzHm?=
 =?us-ascii?Q?evgICHs8+xj7xQPwhVVYzGedYo5VzAFeazWuNvESu96oFfBiXwRk0QnlfGmr?=
 =?us-ascii?Q?iSfuq0GZEwC4YO75ApDUJuhrQrbf5a+MA++S0x2tZZ0uGLM1QtTne4AB6BHb?=
 =?us-ascii?Q?HxLbuVXJ7oMehdAtP0n3D4vE4TgM9FZecIHHyl3aMrBYLwhiadMLM7g6Yd9M?=
 =?us-ascii?Q?h7DQhmtM1hYLzgoiKl+A4J7nqOGeF/2fxQyPGZpdw3qN6tvQlUBhRkcKCaHy?=
 =?us-ascii?Q?ZGJxgi1HQQ1pNjXAT8tsqnnxnih4hThN7Et9V9LpXHrZbY8QLGOZRDogb27M?=
 =?us-ascii?Q?2L22VtIDEZc090TBFz7HKbRYR32isSx8JrPTCkQ3upZLrwVo2ANwF4S0+lZE?=
 =?us-ascii?Q?vFjeCVk+RpPfpccIuskSUV/nul5RbyS+MllVfCc0K55Zn6w26Wnums3bsCme?=
 =?us-ascii?Q?wzzvZMxa9BSDLZgx/tmaVMUcAn1fSt7uYLV1OLrTKS5S/HGi6Z7xM8XOKSEG?=
 =?us-ascii?Q?m1DbLq9iqqn7Pq7ahCBRDpUvGORK3IkC4lxXByvW3rdzz4acEr5BWJJYStUQ?=
 =?us-ascii?Q?NohoY1r4RxQa5PEGv4vDTipagXaIewPoNtxUsNEFlhHJI4kKhTJan5wFl+9k?=
 =?us-ascii?Q?OU3iU6YgSsFzNctCyKjoy4qu4rdZrVRrf2NLw9V3wQVtK/1olhyWksFYhexq?=
 =?us-ascii?Q?p0oYLgQz6Qyr0mScMt5XmdDAyrJ0qrQrcM4q52pk06/wsNnsfVgD9MU6/q+M?=
 =?us-ascii?Q?pdVs0V/4wJPuJAutU8ivv0jooJiNFLffcMBsbNrFnFuHwexWKLC9tT4rpc9b?=
 =?us-ascii?Q?hDH0TNWtZpROa3qI/jr5T/kUfhR9wRViAVkyoyInWxjP30045PMi4UReIMND?=
 =?us-ascii?Q?Wp2Mm+qE7GK5TSuPy8sxluES005h4PwxzsEyfNc+MdZClyWK7YEUNz06cMOI?=
 =?us-ascii?Q?k59a+PHCo+AWYS7OHUGJQdAzDmBy9Onqc6rKlf0V5yl9p3+edMFhd+fzmFHQ?=
 =?us-ascii?Q?VWFDGQcbF+1M46I1MH7XZCaF?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc0694db-df7e-4f15-3831-08d9592768a4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:13:24.5104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8kSBOEUL5bywbEPBP0YHAknCJRqQ+rjhqdLdva0DmtntRZCx43C2+cvnBYW76DbjJoFmpfx0FEHe1Bia40ckV19AV5wXfIUVb1rBXnGWevA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4129
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-GUID: pwo5v9C8bJTHJXW6UCBbYQcpXZZvyHwd
X-Proofpoint-ORIG-GUID: pwo5v9C8bJTHJXW6UCBbYQcpXZZvyHwd
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Export msix_is_pending, msix_init_vector_notifiers, and pci_update_mappings
for use by cpr.  No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/pci/msix.c         | 20 ++++++++++++++------
 hw/pci/pci.c          |  3 +--
 include/hw/pci/msix.h |  5 +++++
 include/hw/pci/pci.h  |  1 +
 4 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index ae9331c..73f4259 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -64,7 +64,7 @@ static uint8_t *msix_pending_byte(PCIDevice *dev, int vector)
     return dev->msix_pba + vector / 8;
 }
 
-static int msix_is_pending(PCIDevice *dev, int vector)
+int msix_is_pending(PCIDevice *dev, unsigned int vector)
 {
     return *msix_pending_byte(dev, vector) & msix_pending_mask(vector);
 }
@@ -579,6 +579,17 @@ static void msix_unset_notifier_for_vector(PCIDevice *dev, unsigned int vector)
     dev->msix_vector_release_notifier(dev, vector);
 }
 
+void msix_init_vector_notifiers(PCIDevice *dev,
+                                MSIVectorUseNotifier use_notifier,
+                                MSIVectorReleaseNotifier release_notifier,
+                                MSIVectorPollNotifier poll_notifier)
+{
+    assert(use_notifier && release_notifier);
+    dev->msix_vector_use_notifier = use_notifier;
+    dev->msix_vector_release_notifier = release_notifier;
+    dev->msix_vector_poll_notifier = poll_notifier;
+}
+
 int msix_set_vector_notifiers(PCIDevice *dev,
                               MSIVectorUseNotifier use_notifier,
                               MSIVectorReleaseNotifier release_notifier,
@@ -586,11 +597,8 @@ int msix_set_vector_notifiers(PCIDevice *dev,
 {
     int vector, ret;
 
-    assert(use_notifier && release_notifier);
-
-    dev->msix_vector_use_notifier = use_notifier;
-    dev->msix_vector_release_notifier = release_notifier;
-    dev->msix_vector_poll_notifier = poll_notifier;
+    msix_init_vector_notifiers(dev, use_notifier, release_notifier,
+                               poll_notifier);
 
     if ((dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] &
         (MSIX_ENABLE_MASK | MSIX_MASKALL_MASK)) == MSIX_ENABLE_MASK) {
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 23d2ae2..59408a3 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -225,7 +225,6 @@ static const TypeInfo pcie_bus_info = {
 };
 
 static PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num);
-static void pci_update_mappings(PCIDevice *d);
 static void pci_irq_handler(void *opaque, int irq_num, int level);
 static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom, Error **);
 static void pci_del_option_rom(PCIDevice *pdev);
@@ -1366,7 +1365,7 @@ static pcibus_t pci_bar_address(PCIDevice *d,
     return new_addr;
 }
 
-static void pci_update_mappings(PCIDevice *d)
+void pci_update_mappings(PCIDevice *d)
 {
     PCIIORegion *r;
     int i;
diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
index 4c4a60c..46606cf 100644
--- a/include/hw/pci/msix.h
+++ b/include/hw/pci/msix.h
@@ -32,6 +32,7 @@ int msix_present(PCIDevice *dev);
 bool msix_is_masked(PCIDevice *dev, unsigned vector);
 void msix_set_pending(PCIDevice *dev, unsigned vector);
 void msix_clr_pending(PCIDevice *dev, int vector);
+int msix_is_pending(PCIDevice *dev, unsigned vector);
 
 int msix_vector_use(PCIDevice *dev, unsigned vector);
 void msix_vector_unuse(PCIDevice *dev, unsigned vector);
@@ -41,6 +42,10 @@ void msix_notify(PCIDevice *dev, unsigned vector);
 
 void msix_reset(PCIDevice *dev);
 
+void msix_init_vector_notifiers(PCIDevice *dev,
+                                MSIVectorUseNotifier use_notifier,
+                                MSIVectorReleaseNotifier release_notifier,
+                                MSIVectorPollNotifier poll_notifier);
 int msix_set_vector_notifiers(PCIDevice *dev,
                               MSIVectorUseNotifier use_notifier,
                               MSIVectorReleaseNotifier release_notifier,
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index d0f4266..bf5be06 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -904,5 +904,6 @@ extern const VMStateDescription vmstate_pci_device;
 }
 
 MSIMessage pci_get_msi_message(PCIDevice *dev, int vector);
+void pci_update_mappings(PCIDevice *d);
 
 #endif
-- 
1.8.3.1


