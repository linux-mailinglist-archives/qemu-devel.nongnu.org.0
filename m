Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED533C7AB2
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 02:51:21 +0200 (CEST)
Received: from localhost ([::1]:43136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3T7P-0005pn-MS
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 20:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m3T4S-0003di-0O
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 20:48:16 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:36976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m3T4P-0005Vm-KH
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 20:48:15 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16E0fZFx020511; Wed, 14 Jul 2021 00:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=WQoRbsKdohY41mUW6Vx8LOe0aR2yI9PFQUSjfNmjf4A=;
 b=osCbX5fkWIv7kRyjRrHzzN86pTbBNTKkpw8tGtuA2St4sJbmYnKbkoKQhUQ0rBPHs7gj
 monPt1G6I0AcampDrOqbwjuCqlsvcMTl54wsQZs3Qcj7t/GIJP0QnJJYY/WPv06Nsr8p
 syBaank5IbnJqzFnlkbxTbjnrBKGdW7U0RFhJiB9DJ13/8CER/tCbEKOm+I3+Ujg3LD/
 tHA5lxfDQkkAo0zfsfPpsDXl1duguLmeWztL2w1OvV4vSIrk3gCRRVzFIGqyUsFKk09o
 3c3XA5ncQsYWCVdsh0YPPdq8+y579ophD6sG8c1PcyeSb99R/tYevKQ0FS13uDOdD5K6 vw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39rpxrbjvs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 00:48:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16E0eubk195448;
 Wed, 14 Jul 2021 00:48:06 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2040.outbound.protection.outlook.com [104.47.74.40])
 by userp3020.oracle.com with ESMTP id 39qnb1bb89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 00:48:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPXPLllxyREW5a+yBdkXpZ3fmx+qijRn/mjurPVKoNKpheARP1GmI1QFAAjKU3vzdo8NRL36rE4lEXDyI15Q/iR3JB/brp8Gmgsg2kjKNxSRhS1zaJEZi7BwiLzzF0OeidnrGsDaYDBQj6+uFo1gP0PRc5EUMWdpQk6x0NWpoQ98PbAW7fgHq2LbrmCGytAukdv9lr3gnQ6aRbMg/H2vOl+SqzZncqi7cdylBxthv0fMThpA4Ze13/b6cknGZ7Eecj2XjUgRbE6zw4+cDTULqEXHHTyr/3+F4EiloxXjwAR2j9s1WQaM0q4s9Pt/O/492WLkGaZ7vYbz5V4i/jS2Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQoRbsKdohY41mUW6Vx8LOe0aR2yI9PFQUSjfNmjf4A=;
 b=emJGCG/zwPDd05RzrcBuwOmgXKdKXCUG92HgLrP9cI4Q5k8M+4XDjz/ZNw/UG/l7q7pR0xJVjyyR4V2Cs+7BQsBsPY4d4eW53WLQDSNx/PLA+JpJkFSzyg4uvsaLFpfPa9vWVlnb7HrwpTqDwzzRn2KhGtw4VLCVxJibg5ghHkZC/XbCVhjuQE3oRn+mfRDGsMcFxqyCVEW2bfxWeDMRxorPbhIiBnUqEDjVuDLRqk4FvrbJIi70s/N+FHMW4ObJdva0p9LMlD66qiVwB28fFgu9Gp8bQxhHDA+aHUJk+acZ9XluE8v7de2EzmkZ3QGhoAd1Iau8FbDHfEwbB5cU3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQoRbsKdohY41mUW6Vx8LOe0aR2yI9PFQUSjfNmjf4A=;
 b=gW1uQQsLGaPV+R+Nb7+GehSQlHWF7jtz7i40clSOZX+qm8Y11vvIWGH7Op9LFA+11nJXInTLB7ZZCekSWIrWaFgDPsJccP4x36FUM7AKbGtfV2IVnNhLmmeZNF4kzy/Q6FwNaX9/ml81kwjboFKzdzeTx0JcI2lOancfxsF6dmU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB4592.namprd10.prod.outlook.com (2603:10b6:a03:2d8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Wed, 14 Jul
 2021 00:48:04 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c%3]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 00:48:04 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] To add HMP interface to dump PCI MSI-X table/PBA
Date: Tue, 13 Jul 2021 17:47:51 -0700
Message-Id: <20210714004754.22243-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0042.namprd04.prod.outlook.com
 (2603:10b6:806:120::17) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 SN7PR04CA0042.namprd04.prod.outlook.com (2603:10b6:806:120::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend
 Transport; Wed, 14 Jul 2021 00:48:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d9b9410-39fc-493f-1109-08d9466109c6
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4592:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB459230A1D8BDC180E28C7036F0139@SJ0PR10MB4592.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xDp5wJLxM1YNTXLBWzhKkkWMIDcwfiwQKnilmfsOyhp8Ph7WoBoi4vnjh44p6yUVEjNgFD0rlTi6004eHZYRPLwQLTTCd6GW5rpUqAlwH71llDDKK1Ijx8ViOUI1OQ/eYW5ABQ1p5sp/BKKaLAT7kwAG1k2s1iUYInKh7TvLErNGfDfaDTEbGde1sBiKHnLAtp1amPccTeBtmmST7f1JbbTm3i8TXhk/Dw2O5yeayVQDULtXSFKj2f8CoTJzTpHKOf2wx/ytgSAUgPAkftL28jahx9FRZnXeMRJrQXSTZHe17eAnyv+aBykgShIcQ5xibEixx2ryBJ6+coe1H5xzfIAD+fEKXFUzuhSoXdlFynjYABTOqXNM5ypuXQbnw1RxTxyq6xOPw2fbKq+3FDeH6p8ys9jvYZJEspVsSGmVn5P4dA3nErKA32NaMXk92Rxlgse5Fd0CodOYF6Pv5MpJWyTVKkXL+FvqO6Faq8Cj8McnFcrvE+1fjC0+iuQJFtgW39/c/ahDKW47ZIsmxvifWzr7D4JSrl/H8BqfLw0yv4rN7lcZ0FjmXbSQxvvr9xLUxn4gcW/yGms0lfiXNCQYe438NKX4tfQKAmZo+rtB6Vf8eyawBHduLeaOIMKmVb0aQlPH9DoAaDZ40zYKK1Xn1qJ0yKS1OwNRKKBJH7qvoLQTnyjrZKHhUpEm9R/iKhSbYW+UwIp+06gSLDpBXqtERCvdq/j+dSlBLPF/ydgI0MqCyKWqIEu2sJ7bydwPMHsaqsuCRDN5EXxIYVUuacRIwHTaMuEa586aFopkl9rmEOpzZrFlMQ1ZpagpS9eE5JU12Qv7Cxlon/38o7M0U/rEcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(346002)(396003)(136003)(376002)(4326008)(66556008)(966005)(2616005)(6916009)(956004)(44832011)(8676002)(86362001)(52116002)(5660300002)(316002)(66946007)(36756003)(66476007)(186003)(8936002)(6666004)(2906002)(26005)(6506007)(38350700002)(38100700002)(1076003)(6512007)(6486002)(478600001)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N/FndE/+hfz9D4V4WVKYWs5pb60zBUjwyCKIjUxn+wN/qJD7MwUkcsV9UuMk?=
 =?us-ascii?Q?2SyQACANuZW6E1vyBBvEsmXcpIcQFEChVwL65gl2pu2a0sIOiwUMVJRoPz0A?=
 =?us-ascii?Q?oOE6kgoy5PXp/lnoGN09MBXQ3plsnldJ2OjqPu5mg4LurkAWPfYzhNUgIvK/?=
 =?us-ascii?Q?XEGxgvyt4Zu82SknoZxxOtlUoScfI99QUmw5CPGXaEnX7hCvrW62kQzCuUwS?=
 =?us-ascii?Q?LgLwB5jOsGykJdGLb3MRLH1RI/4Ul25eQq9YVgAtvK2B9WrID5iulrdF4mdo?=
 =?us-ascii?Q?y/XzrHnx8gpnN84S5TXYTkHnZUcBIzDkzhA68utBXhJJ80+hRY695cbQis5S?=
 =?us-ascii?Q?0CIvrJWGPCuXrSQdUN2n8GbIaMIoMb2fj/mU2VrXuSmTPbyr6Xxn5HuNN6Ds?=
 =?us-ascii?Q?9ABYZzc0EvK2nlAaMLHjzew5sWCEt7Xh62Lmliugm5BozAHzo5NbFXbQvEIW?=
 =?us-ascii?Q?2K2wC4rcQQbWqqYGb8/WA/b0T2bYHmMH001zbSwO4hv+0FSF46bV0nr1vGvu?=
 =?us-ascii?Q?mGFxgufLttc1/+ziUKaQlbWhGcLYAXKNvEHxdMkm5X///fpzSMKuil/uHIp/?=
 =?us-ascii?Q?WfEWWU76ZwrO7zw3NcRtvmZ2haMQkv1E3N45eBvgKIbbtO9XbMLNH124r1Yq?=
 =?us-ascii?Q?XvmwT2RKp7cbA7Tkt05v1Sg1/CF23zfhGsvOv36phKkgvB+UfbEtHD5wExXX?=
 =?us-ascii?Q?c/DsynqCEHBrgT4RR6TXWCvq4H0Ti/TyS/SgJ3u1p0n3Ir9UMIIn9uWfZD9e?=
 =?us-ascii?Q?RZ8kwMOLBVpPXZR5r+UTIRRVWVowaNB9AHZb0jKWHGuQHcfYZq0WjRL6kQ+Q?=
 =?us-ascii?Q?styUowz5NItZQE/TE/KnFgX7Sxkp88blOx/aPFKnbX0mzn5v+wgImIV5xr7r?=
 =?us-ascii?Q?pxcZhHWFzyPFqrPVuGsev5Ge7tpWmQM8KCoResrtxqqKVNOmvvFymrumUJZo?=
 =?us-ascii?Q?F0q2zlDchDPortcBiuN5sF7AB+As7DIq3tXD2QfBe8U32iZMvCMEPG940tee?=
 =?us-ascii?Q?pvqWd+OtCh3sJO4en7EdtnHSchaTqtnjLQQ4+FRpOoa6aZql/zJX7DncSUMt?=
 =?us-ascii?Q?pVbi2jfr5HakeJTg3NtOI4Tbnn6Z9pmtAzOtVv2nT3bbQAHiSr5MZUdfypjP?=
 =?us-ascii?Q?OQnhyJi7WOeCgG0B6kgtIAis+N5WpyGjqn1hLEvtS80D3Gn12d8m4OAuGSy5?=
 =?us-ascii?Q?6lOq4I6+CqdjozDyU0mLdRTuUKwEb1C4P3N377jG0SVO/hpVuVDdq93plWew?=
 =?us-ascii?Q?FAUmuDSPeP5dMl65o/JWFBEWUD8rVf3/7rtXL1O2ORiZNVlkvv/iXyenL+Ax?=
 =?us-ascii?Q?MK0Rcfm7u1BQM+QHZKYX5Oss?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d9b9410-39fc-493f-1109-08d9466109c6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 00:48:04.0782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4rxRxTzeQn7AxDWBzr5+mD3JAP1v6+RCGDjy4wJlhnwRSCsoJetgZPYWaDxei0pJCWgxLBe9L8i5fGyI8TIvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4592
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10044
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=840 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107140001
X-Proofpoint-GUID: z8XHSAEpTW0twsTml65rCBUAeE0XtICO
X-Proofpoint-ORIG-GUID: z8XHSAEpTW0twsTml65rCBUAeE0XtICO
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 jasowang@redhat.com, joe.jin@oracle.com, dgilbert@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is v3 to add msix_present() to pci-stub.c to avoid build error.

Changed since RFC v1:
  - Add heading to MSI-X table (suggested by David Alan Gilbert)
  - Add device specific interface, e.g., to dump virtio-pci queue-to-vector
    mapping (Suggested By Jason)

Changed since v2:
  - Add msix_present() to pci-stub.c to avoid build error



This patch is to introduce the new HMP command to dump the MSI-X table/PBA.

Here is the RFC v1:

https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg04673.html

The idea was inspired by below discussion:

https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg09020.html


(qemu) info msix -d /machine/peripheral/vscsi0
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

virtio pci vector info:
config: 0
queue 0: 1
queue 1: 2
queue 2: 3
queue 3: 4
queue 4: 5
queue 5: 6


 hmp-commands-info.hx       | 14 +++++++++
 hw/pci/msix.c              | 63 +++++++++++++++++++++++++++++++++++++++++
 hw/pci/pci-stub.c          |  5 ++++
 hw/virtio/virtio-pci.c     | 22 ++++++++++++++
 hw/virtio/virtio.c         | 10 +++++++
 include/hw/pci/msix.h      |  2 ++
 include/hw/pci/pci.h       |  3 ++
 include/hw/virtio/virtio.h |  2 ++
 include/monitor/hmp.h      |  1 +
 softmmu/qdev-monitor.c     | 36 +++++++++++++++++++++++
 10 files changed, 158 insertions(+)

Thank you very much!

Dongli Zhang



