Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA0A3C893E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:00:36 +0200 (CEST)
Received: from localhost ([::1]:51624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3iFO-0004bS-ON
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:00:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m3iC9-0007gX-Ra
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 12:57:13 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:21534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m3iC7-0003f3-AZ
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 12:57:13 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16EGtcdt032238; Wed, 14 Jul 2021 16:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=imGJZLavO3HM5Ul8UPo2ousBPYxvdod4skLtnsaEUYE=;
 b=IA2+Ydnc7aDAZuw696DWH/PRXZRCPie3CSCPUDltbnSNGHESuI5OE4xQkwgFstu/0maJ
 +yRWB2h9UOcHgvcR3RMBGAS1spmgyIa7wectW6xstITGgziaCgpKLFqxWKtVOzlXAKm1
 3N6daN+m03U169XJ2XPK3DAL7ixSH0o5a9w+XvZ5eQ0GPjxgJ37sEta4fqZQXfTVzX5+
 vo6UUqyaR/o99rqVrrY0XL612kPU9/TXQwaTc1i06tt4GIidfppF9d1SBl9lZlrmgQ4w
 DK7+rMcgm/NwGZ8/Dc2ureKoDoQhotOi/PHWAh/hhVSowF909iPG1cklW0pC1mWuN89W FQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=imGJZLavO3HM5Ul8UPo2ousBPYxvdod4skLtnsaEUYE=;
 b=nUB+NneA1mqW+fKjFG1yp3NcbHmc8yVbkiIsfs9GVGCAaA5kK56ZEtxYXMnb7mkfKROx
 znoxRgy3des+toehpDeJn2PxUlHiLmhD6GSjurN4PSNvJAEuHI37W1WfjC5ydS3UQLgk
 EGQ/xKQDYY9DZZn8tSQGx/J0sRbECIubIxCAVkm0sNG4/OTYzWEMsbDJir9oSi92Lk4u
 Rpzth2JEdphUEO7VYu1XI7QVHuZB54NwOAkj2lQOA2yY3tC9np1ec6zhq3kWSIsKcNje
 wA2H9wyiUwd6qZXf+nSsYlbhXEp4l4wmouPfmRPbzodXBCedDHzM77jbPOI1pDGbmb8O dw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39sbtujx94-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 16:57:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16EGovq9168314;
 Wed, 14 Jul 2021 16:57:07 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by aserp3030.oracle.com with ESMTP id 39qyd12hr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 16:57:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Enmh8nVwhB+tQ+dB+bpcP0Yjlw6NEqI4XdCyPdG2sD77XbLlibrRgsBqzVD8e1bdBcookDyq9YvAkluVZjHVNe2cEbXs6YaRr/ruNWuLNgV+HQCy15CTuGJgID8yjZfm7mebq8iaB76jWDIC795WydmVpa9LWta4TB8/Hf0FO6kgwGf8sn/d9lRYpQKD1fsKU8aOl6YtcqOGIp9kVw14r3A2F8DYhCUioIhNUQulZ+LzWpvnNm3IGGZAJsbQxwrzh9vOzupGhQV2B7n2qEMvI2eKkm93Y/uoD1CJRwuZsK7sIeuuWILoAtog6llyPgS3BI387PrwkhNAktL+LZR18Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imGJZLavO3HM5Ul8UPo2ousBPYxvdod4skLtnsaEUYE=;
 b=aTNjbry4y30EWghOhalY3AQV78AdDj/MzeV1sHST4zcb6/TmJ3BDYXOd+IyxIb/47oDTUyODKbfS7rENJgvjb/2Ur6cHz7i/X9rDjLIvryhHDnc7xwPH5O1RQl8Ixf36a+a/gq2IosgQNWP86g1HKvah/V2GDYkp1Xlqd9Czlaeg5snHaS1ivvtjUXC224um0QXI0OAxNeCgBCPBXafz8+a+XTj9JA6TR1TPHmCw6/VyD7ZezuMF4OOvfTbRowQ+n6I+hlK8LkeSdB+n3bfgGnFKnD5XVcWFRb5Y2HHnW/EPQwWK9NDjvejYKnV7W4ga3GJ+pNi7jw1ZQ0pQZ4R0GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imGJZLavO3HM5Ul8UPo2ousBPYxvdod4skLtnsaEUYE=;
 b=Pf1H/cQ9NAQWxW1e8CeBcDf1L3sqJHGmy21DTOmw8Z5i4gKc16Jsd/7EK1VwVkbUYvcvZJdngS79rafvfCuvuHOno/ntDRZ+myr9LpSOX6LSsQmFKT41r8Brdv19qykyMjTWTMlRuvwlHj4AZn/dlXEKXgY2oOICkVgRanZwgWw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB5438.namprd10.prod.outlook.com (2603:10b6:a03:3b8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Wed, 14 Jul
 2021 16:57:05 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::fd75:49c3:72bb:ca64]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::fd75:49c3:72bb:ca64%5]) with mapi id 15.20.4331.022; Wed, 14 Jul 2021
 16:57:05 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/3] msix/hmp: add hmp interface to dump MSI-X info
Date: Wed, 14 Jul 2021 09:56:52 -0700
Message-Id: <20210714165654.23211-2-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210714165654.23211-1-dongli.zhang@oracle.com>
References: <20210714165654.23211-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0009.namprd11.prod.outlook.com
 (2603:10b6:806:d3::14) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 SA0PR11CA0009.namprd11.prod.outlook.com (2603:10b6:806:d3::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Wed, 14 Jul 2021 16:57:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fd6c143-4a1d-485f-0555-08d946e868bf
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5438:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB5438702AE742FDF729F58F8AF0139@SJ0PR10MB5438.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:22;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dqE/xeKrQquz5Vpfu+S7T6hd+YZo7FYQGX9rq8gHkzJ3/NqhYZ1OEQeltZDCVx23qZnKFmbywzToRqdAN5NN08gKFs4TtEJiylfLclLGwxe2Arh5mKKssAFktEaM6522RMlIMAC+sIRmVMf3PLq+yHlzViCLkmXcd5tJc2Cyh4R7hCv8SWcCEAmhCpoRSEStFUBI8pPQBv+KgXmCPGXC6APfs5udo/a1Sza+FqdLWo9P4BQoKTA0zLeNTOYhnWxyrBc1p/ZdECA0hztgwg6Q8Fh0Af686DFrmnivXaFwiuBeQtLxvuUuuQ3j2fAr5pAuETnejgjcl4Z2QXqXagZh4hv1ldStHY0ttnPBR4NQRkef9baqEvL7du4ey+7IBzrSoLDIyPVi5oKRAjYLkkh1GpMJ3gjJ2/n/xZXXYETQNFAlcvQB32q3QoTpwJDyIh9AOlVXvpo1FBJlU9FVgTHqQ6+9pkz94tCLnX/XuxhaK/KBVhuyPxKUVy+2q8D+7UCBsRENMvFGFn1PwH+AAo9pDatqJmbN0HjOcKa04OzOHzD0rMh/XscTOu0g0hZ1gnzTScKrUI8xobj3H5UThLOUnp06F+A/s/s9TPRrpvtuGFaBjNSvymzrCwsqCZZvPKgsGhUFEdDUgu6Xcs5fUWfIyjpNBYjSVmFuuUTMto2wgZf/65n/obbZV5jS1vsf4FXtuhiITWlZKuBkWZ6GxsndWQqv3sUL4LkAfEE/gT1nKMQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(376002)(39860400002)(346002)(366004)(36756003)(52116002)(6916009)(66476007)(6486002)(38350700002)(2906002)(8676002)(956004)(6512007)(44832011)(66946007)(2616005)(66556008)(6666004)(478600001)(8936002)(86362001)(5660300002)(4326008)(107886003)(26005)(83380400001)(186003)(1076003)(38100700002)(6506007)(316002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8P2PsxqeRIbfWTtJjX0YiD/7Iu8T5rng0EGgctA1P6MF3Wed7kReMYre6bt9?=
 =?us-ascii?Q?z/CWtCmaDLsknnecLqth6YZHvBJLrOvj20yzic2q0Ba2qQWr5Ul1rogADa9+?=
 =?us-ascii?Q?KVqoao/MRd3V+yHIhu9qoZE20QYtdxXbacMKNUtH2IB83mJWbCITVKQGjcsZ?=
 =?us-ascii?Q?Wb8KOWQacjmwlRUnNvaQqn3jY6+gzfcoX3PK2zq/BKAL2kt+HgCWWyvJCHeV?=
 =?us-ascii?Q?XtHNZhbRtdEmeF9NXskSxu+YZfoyl81DbOl4ToGi0at0F4hyMSCDnYXO88UI?=
 =?us-ascii?Q?CXJGDFMkOpDTPekd2LbfZXEoMYVzpmaGPm7C0orSgHZnO0ZejJgk5Za9aVLx?=
 =?us-ascii?Q?FRMj/Q6wmcIUg25rqNGrsoRzFUafOb/KM25CVUQEpA2/jGxNMkYQ8y/BsXvf?=
 =?us-ascii?Q?3ROj9TRzlqv/GeDUzmUBjEaYRLzsUpVUES1HiY2w0wXGBxYX8Qlv/0QnDJ0T?=
 =?us-ascii?Q?/K252CTojg3kAp3vlbm8UIOQuhAz0bcr8oWgODvEzFhaZ6xDd9XkW16s7pbk?=
 =?us-ascii?Q?0pvWiURmtdzKLI3+mivW6g3mrdtwhzIa9UWwc3RvEm3Yf16DXO7JTqmjwAzg?=
 =?us-ascii?Q?qBpt+G62tfb86bwMOluebo9ZUSPfImstqA8madAxkeotaKTo/eZv5SUL30MO?=
 =?us-ascii?Q?9auTRq9JPLvb/rnO1MCYWP6faL+A+CmUurCrGAK22uaGIpvATMnMCgFJ79hQ?=
 =?us-ascii?Q?54HyS7p/UGIRex4kTOe8R3GOx3Iv0AUCbbhbD26De126raNH58g2X2yRpaa4?=
 =?us-ascii?Q?sUqihEtca4hUDTUQwIHElFmDc8UqEFE1U3sTOPIzddA9brLfA9eg6swPmGLD?=
 =?us-ascii?Q?qgWmqDSOURKcfYbOFbF5BavZzNdOrJ2yOpDXkh4+l0BDn4czIq98SrGZuthy?=
 =?us-ascii?Q?QA0zKgptdWZUAfiejmrZkleC+oo8/lU4fm6U6+SezPucxr/RbUh7+II1gLV2?=
 =?us-ascii?Q?Ffj8YGB0gVNaSelbShOHeOhZR9MOdzddB/a8m+PxEhgmEteliVxzfmbXiOhk?=
 =?us-ascii?Q?LPKCahGxrenZDpB6Lt7jD8QKXpkozn3G5ZzeFvfDTAeWGmC4/b6moY+l+0Qk?=
 =?us-ascii?Q?//DthNN6FRYZ649qRJQnw2hJzxtViY3ZhykNH/SoSnteghr4ylDOLNGuzzls?=
 =?us-ascii?Q?+Xe/KTpG09+x5RNmt/EWg8f7F3mqVO4nYGnbdM3UJntRZoOT+Axym+z0uNFD?=
 =?us-ascii?Q?mWvx+DcoSRi0+Xc8cCFJ+Ezv6XR2qvEJp7iNyliSmfoYvzUODi6EEyrZdg8M?=
 =?us-ascii?Q?5A3Z9l1Juqdzgb6qJLVCHMxwa/84TSyD7X4ZBkZ71n06lGwMc8iVnURhI5+w?=
 =?us-ascii?Q?ZNY+pmmY6wOvYEX8OD8/1hED?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd6c143-4a1d-485f-0555-08d946e868bf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 16:57:05.5300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KsICGugb9f5OVour55UyOWjAzGqHQc1wmq3Jxc0QwEAQLtzixIufvZWoJIgpa2RYEWIARBA2v/m7LH786T/2jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5438
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10045
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=992
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107140101
X-Proofpoint-GUID: mHXQqjivm6-2aRMnC3kwNDmnJsmwKhUd
X-Proofpoint-ORIG-GUID: mHXQqjivm6-2aRMnC3kwNDmnJsmwKhUd
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 jasowang@redhat.com, joe.jin@oracle.com, dgilbert@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch is to add the HMP interface to dump MSI-X table and PBA, in
order to help diagnose the loss of IRQ issue in VM (e.g., if an MSI-X
vector is erroneously masked permanently). Here is the example with
vhost-scsi:

(qemu) info msix /machine/peripheral/vscsi0
Msg L.Addr Msg U.Addr Msg Data   Vect Ctrl
0xfee00000 0x00000000 0x00004041 0x00000000
0xfee00000 0x00000000 0x00004051 0x00000000
0xfee00000 0x00000000 0x00004061 0x00000000
0xfee00000 0x00000000 0x00004071 0x00000000
0xfee01000 0x00000000 0x000040b1 0x00000000
0xfee02000 0x00000000 0x000040c1 0x00000000
0xfee03000 0x00000000 0x000040d1 0x00000000

MSI-X PBA
0 0 0 0 0 0 0

Since this is just for debugging by humans, provide the command only in
HMP, not in QMP.

Cc: Jason Wang <jasowang@redhat.com>
Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
Changed since v1/v2:
  - Add msix_present() to pci-stub.c to avoid build error
Changed since v3:
  - Rework commit message to explain why only HMP (suggested by Markus
    Armbruster)

 hmp-commands-info.hx   | 13 +++++++++
 hw/pci/msix.c          | 63 ++++++++++++++++++++++++++++++++++++++++++
 hw/pci/pci-stub.c      |  5 ++++
 include/hw/pci/msix.h  |  2 ++
 include/monitor/hmp.h  |  1 +
 softmmu/qdev-monitor.c | 25 +++++++++++++++++
 6 files changed, 109 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 27206ac049..ce5c550d44 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -221,6 +221,19 @@ SRST
     Show PCI information.
 ERST
 
+    {
+        .name       = "msix",
+        .args_type  = "dev:s",
+        .params     = "dev",
+        .help       = "dump MSI-X information",
+        .cmd        = hmp_info_msix,
+    },
+
+SRST
+  ``info msix`` *dev*
+    Dump MSI-X information for device *dev*.
+ERST
+
 #if defined(TARGET_I386) || defined(TARGET_SH4) || defined(TARGET_SPARC) || \
     defined(TARGET_PPC) || defined(TARGET_XTENSA) || defined(TARGET_M68K)
     {
diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index ae9331cd0b..4b4ec87eee 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -22,6 +22,7 @@
 #include "sysemu/xen.h"
 #include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
+#include "monitor/monitor.h"
 #include "qemu/range.h"
 #include "qapi/error.h"
 #include "trace.h"
@@ -669,3 +670,65 @@ const VMStateDescription vmstate_msix = {
         VMSTATE_END_OF_LIST()
     }
 };
+
+static void msix_dump_table(Monitor *mon, PCIDevice *dev)
+{
+    int vector;
+    uint32_t val;
+    uint8_t *table_entry;
+
+    monitor_printf(mon, "Msg L.Addr ");
+    monitor_printf(mon, "Msg U.Addr ");
+    monitor_printf(mon, "Msg Data   ");
+    monitor_printf(mon, "Vect Ctrl\n");
+
+    for (vector = 0; vector < dev->msix_entries_nr; vector++) {
+        table_entry = dev->msix_table + vector * PCI_MSIX_ENTRY_SIZE;
+
+        val = pci_get_long(table_entry + PCI_MSIX_ENTRY_LOWER_ADDR);
+        monitor_printf(mon, "0x%08x ", val);
+
+        val = pci_get_long(table_entry + PCI_MSIX_ENTRY_UPPER_ADDR);
+        monitor_printf(mon, "0x%08x ", val);
+
+        val = pci_get_long(table_entry + PCI_MSIX_ENTRY_DATA);
+        monitor_printf(mon, "0x%08x ", val);
+
+        val = pci_get_long(table_entry + PCI_MSIX_ENTRY_VECTOR_CTRL);
+        monitor_printf(mon, "0x%08x\n", val);
+    }
+
+    monitor_printf(mon, "\n");
+}
+
+static void msix_dump_pba(Monitor *mon, PCIDevice *dev)
+{
+    int vector;
+
+    monitor_printf(mon, "MSI-X PBA\n");
+
+    for (vector = 0; vector < dev->msix_entries_nr; vector++) {
+        monitor_printf(mon, "%d ", !!msix_is_pending(dev, vector));
+
+        if (vector % 16 == 15) {
+            monitor_printf(mon, "\n");
+        }
+    }
+
+    if (vector % 16 != 15) {
+        monitor_printf(mon, "\n");
+    }
+
+    monitor_printf(mon, "\n");
+}
+
+void msix_dump_info(Monitor *mon, PCIDevice *dev, Error **errp)
+{
+    if (!msix_present(dev)) {
+        error_setg(errp, "MSI-X not available");
+        return;
+    }
+
+    msix_dump_table(mon, dev);
+    msix_dump_pba(mon, dev);
+}
diff --git a/hw/pci/pci-stub.c b/hw/pci/pci-stub.c
index 3a027c42e4..8191d49d56 100644
--- a/hw/pci/pci-stub.c
+++ b/hw/pci/pci-stub.c
@@ -91,3 +91,8 @@ MSIMessage msix_get_message(PCIDevice *dev, unsigned int vector)
 {
     g_assert_not_reached();
 }
+
+void msix_dump_info(Monitor *mon, PCIDevice *dev, Error **errp)
+{
+     monitor_printf(mon, "PCI devices not supported\n");
+}
diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
index 4c4a60c739..10a4500295 100644
--- a/include/hw/pci/msix.h
+++ b/include/hw/pci/msix.h
@@ -47,6 +47,8 @@ int msix_set_vector_notifiers(PCIDevice *dev,
                               MSIVectorPollNotifier poll_notifier);
 void msix_unset_vector_notifiers(PCIDevice *dev);
 
+void msix_dump_info(Monitor *mon, PCIDevice *dev, Error **errp);
+
 extern const VMStateDescription vmstate_msix;
 
 #define VMSTATE_MSIX_TEST(_field, _state, _test) {                   \
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 3baa1058e2..97c040a3c8 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -36,6 +36,7 @@ void hmp_info_irq(Monitor *mon, const QDict *qdict);
 void hmp_info_pic(Monitor *mon, const QDict *qdict);
 void hmp_info_rdma(Monitor *mon, const QDict *qdict);
 void hmp_info_pci(Monitor *mon, const QDict *qdict);
+void hmp_info_msix(Monitor *mon, const QDict *qdict);
 void hmp_info_tpm(Monitor *mon, const QDict *qdict);
 void hmp_info_iothreads(Monitor *mon, const QDict *qdict);
 void hmp_quit(Monitor *mon, const QDict *qdict);
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 721dec2d82..7837a17d0d 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
+#include "hw/pci/msix.h"
 #include "monitor/hmp.h"
 #include "monitor/monitor.h"
 #include "monitor/qdev.h"
@@ -1005,3 +1006,27 @@ bool qmp_command_available(const QmpCommand *cmd, Error **errp)
     }
     return true;
 }
+
+void hmp_info_msix(Monitor *mon, const QDict *qdict)
+{
+    const char *name = qdict_get_str(qdict, "dev");
+    DeviceState *dev = find_device_state(name, NULL);
+    PCIDevice *pci_dev;
+    Error *err = NULL;
+
+    if (!dev) {
+        error_setg(&err, "Device %s not found", name);
+        goto exit;
+    }
+
+    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        error_setg(&err, "Not a PCI device");
+        goto exit;
+    }
+
+    pci_dev = PCI_DEVICE(dev);
+    msix_dump_info(mon, pci_dev, &err);
+
+exit:
+    hmp_handle_error(mon, err);
+}
-- 
2.17.1


