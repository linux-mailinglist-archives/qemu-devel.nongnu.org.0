Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB91B34A125
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 06:47:59 +0100 (CET)
Received: from localhost ([::1]:52592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPfKA-0005dw-PM
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 01:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lPfHl-0003Sp-Ev; Fri, 26 Mar 2021 01:45:29 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:35002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lPfHf-00045a-2g; Fri, 26 Mar 2021 01:45:29 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12Q5jASN160538;
 Fri, 26 Mar 2021 05:45:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=J/SU62l/o4Abi5a3LpNNvprHV0eDRuEltbaBITyBZVs=;
 b=DKRO/5SvPN6d1Pqgc0Z9QSbuY2Zbs/ogfrhuDHfnCv3gVF3IFRENyDJ5c/ZVsM0ScmjZ
 huoFgtnE0jORewyto/ehOnMualjxIux1t80TjNyIR+aG0hb+LAoz8T2ZnvBUiRMiQZPq
 vGU7fuibvmllkfr9nIAnaU0gTmW/06ajd0lv38qbv8Ysa1PwvP4BqJNPLGSd2yEFDl8l
 9vf1WbbJCJwidZLR0bLcIKPiImzfnwLhz+MK1FmvkBWOCkXgb6BJZm9pmtyqzDToptn4
 R62Zwl2nHBerTGuPsot1WWBTaiL/n97NZ+0dgqEQePB+5bnFFZokb5gvQFbBenAeWiaZ sg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 37h13e8vux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 05:45:14 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12Q5j9RJ031505;
 Fri, 26 Mar 2021 05:45:13 GMT
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2050.outbound.protection.outlook.com [104.47.38.50])
 by userp3030.oracle.com with ESMTP id 37h13x8yvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 05:45:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORkHfzt4iB4OX2qIujKhldCxmNu+OyjXv6Z67AQ92YJBYy4QhZIRsZWdQpl9jZ1lpe08iF14DkleEM7tdUay426dp87r4ghBSzSH0lTzfL9Ta+C2Ssx2jfaZe665mWoGYEEsjQoJggcZlUmXkZd9dS01weTfFsgNTddpRmmXcglXqn8Q2bP3WoRGzpyM5WR8XzIN3TL5JO/oVhczTZjj7QQIZ3OKVN4bGVGWXVp2EybYfSMS2jNWsrfyR5UPIXEAtsdRVMbykSIlrqkA/RKjkVNpDBMvuvL5EV/lz1YiqGs/KUEFpZ0Al24VY8aADiNIm+aB3sj4knFjZcmhMZf5DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/SU62l/o4Abi5a3LpNNvprHV0eDRuEltbaBITyBZVs=;
 b=jbQXOn7KXbgyF8CqqI1Qgjit5LHvEMyrarqTBKiQsZRG5cZdRLcUyZMjK2dMUCiKNm+85kFeka1MDOh9jdyEefCSBIQ+J34krz+b4tt+cUw0zSlS2TolL7ENJ/507Yu9k68NUqWw4y/t2OhVevNlj/FmM1dLVb6s7FrVINmBLVUXQyYDCyltIA13FMNVH96cwbqmlMlsgvPnjnrEEvBNIVrXhYVHbKBIAvK07S9rFwAI9HYN/l8lFiMs1EfyQP/0jjzJCRCNWORfy5Qxx770nwyI45p+riVUyPf472rVnxZyNVZ9lsgN7fwriH3Z3BS/acSsrkXHPyf0Ud7YLnOkEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/SU62l/o4Abi5a3LpNNvprHV0eDRuEltbaBITyBZVs=;
 b=nSmtIQ4HAoWYFQ4ufWfHnlhGuqjpFpad+SlwUDG6XeRy/JlO4uahvA6aJ835GiAziUtyGjVmcqSXeh2fgQOsgqZF6831TsmfVZYe1oLKuwvxKwEjD6irOJ2UnoHfcaDQ26bnP9NB1egaXO/1WVSeRsVsE4LHvXYfvsLz8RiDKRQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2668.namprd10.prod.outlook.com (2603:10b6:5:b2::25) by
 DM5PR10MB1772.namprd10.prod.outlook.com (2603:10b6:4:11::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25; Fri, 26 Mar 2021 05:45:11 +0000
Received: from DM6PR10MB2668.namprd10.prod.outlook.com
 ([fe80::9d2c:340:5b24:bff7]) by DM6PR10MB2668.namprd10.prod.outlook.com
 ([fe80::9d2c:340:5b24:bff7%6]) with mapi id 15.20.3846.054; Fri, 26 Mar 2021
 05:45:10 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 6/6] virtio-net-pci: implement device event interface for
 kick/call
Date: Thu, 25 Mar 2021 22:44:33 -0700
Message-Id: <20210326054433.11762-7-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210326054433.11762-1-dongli.zhang@oracle.com>
References: <20210326054433.11762-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.200.16]
X-ClientProxiedBy: BYAPR02CA0053.namprd02.prod.outlook.com
 (2603:10b6:a03:54::30) To DM6PR10MB2668.namprd10.prod.outlook.com
 (2603:10b6:5:b2::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 BYAPR02CA0053.namprd02.prod.outlook.com (2603:10b6:a03:54::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Fri, 26 Mar 2021 05:45:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dff57d41-45e2-46ec-f98a-08d8f01a51c6
X-MS-TrafficTypeDiagnostic: DM5PR10MB1772:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR10MB177224429A3C4444600A8350F0619@DM5PR10MB1772.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0850uD1JgBgsu/kFUqHoOu9XBQwFOt9A063nr43zHi6x+kUn/mqxBq/1EQsh8qTnLjW/5W3pugllDL2r1Bg9Ap92BhA/s0c2z+yLFPC3taO6tartljyAtmfsTtBXQ6kTEzxXGwmf9RIMMoFxpyfjKFlEwGkJVogTcN4KtxnsA9jFBeeAsYrJeEjZOsxSP5+pibbQa2QuDbXl2R4Km/FR/Su8oqXrZLUURe5F2yx2uIl6UPzi+T6kMBMTIlJ87ARKbFT0JhNbuFE2Vbg4NHCmKHVXfqbXWER81jDNg3WM4sT+khxQmke/qk9AHag8rzoEx0AMLLaoyduzQnWv9LFvlaE8P56NlxScjH4CaDoSkrf1ylRWufqqWyvFq8JC/AX5XiUzAhSiEVdYeNs8woXwDbejeZPCeplxsD5sROBS9+Qck2JW0/gmV1ypbj59d9v6XCtl6yKKpZhP2kF3Ot084y0eGdb+4XOg+n+iyjhHOG3/WxjzaCUKkyArmYUYbgDyjE6B+P9IBZ5mbssA9T4pJg3qpiLepsusg6ZzWlJ1HMO6dCQBEQm8seaecz/XYx1QvIT0J1bv4+dMOn+1klGEm2Zqal5FYZQFbL//7iDunZ5W8YkdPBu9D4xrH3Nn9UFkn/YkmWUPa8+Y5CbJpj4kxf3eECoklGsoP0Ix164s8nSrwpvtLGbkvFVkh+bCP2up
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2668.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(136003)(396003)(346002)(376002)(6512007)(8936002)(26005)(86362001)(16526019)(7416002)(316002)(186003)(38100700001)(69590400012)(5660300002)(52116002)(4326008)(66946007)(66556008)(478600001)(6506007)(1076003)(6486002)(44832011)(6666004)(66476007)(2906002)(107886003)(8676002)(956004)(2616005)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?f1TSKN5mVA7wvG4G9ArcelinacpaNewNB3LYExkQ/bzAZJKsbt2N4bt1mJJf?=
 =?us-ascii?Q?YFQtfyP/jIoBXmao9PveYir25fDWYPmIu6Fo+fWgBLcsGgoVbQyUgqw8Nmz7?=
 =?us-ascii?Q?2g9SAVG5ItNA4gVHn9BZNTVefoVBj2SxZ2SPtoHWpxbMfxxjlryOOKS1fzD/?=
 =?us-ascii?Q?NDc2TAGG8/zMMPseziKea7i3sL6RDPVbG8DLCAgHkwscWiih6gJICs5od0hc?=
 =?us-ascii?Q?caHEVlnu7tRnxhE6vj1lXcuUVT+cuQAb1eWclc1KT72I6SbQ1I04FLNrUG0y?=
 =?us-ascii?Q?uCU3FSi1Yr77GUTs+XLvjmRkQ0Ts4Fef0UIvqRUfBWzjWD/ifZoGGojRk9Lo?=
 =?us-ascii?Q?guJ6lK0JSjou/KgthzJXVv7V7k8Z4cR2rW7bgOdYNOL82cIYtytWg8c40A7R?=
 =?us-ascii?Q?qLQtQoVFLffad5pUpQZagPBN1rIZA2bBk4eFwFguPBS3JxUiywdS2JjKpbUD?=
 =?us-ascii?Q?0o2Rfb4Jq6BjH9pZnPCI6jCFGfipeTOxzvj4lUEf+4ZcGllhdl2YgUxBFFNC?=
 =?us-ascii?Q?cGNuTCks5j7EttoznXvfqpqgbIh8OgAZwa3JqM5vQwo6XFDUc4p9L8m2ow42?=
 =?us-ascii?Q?N5Idk4Lh8DGLbkh5tw12bGsGaVE2BeproSMGjhLn0GMAjUlkIu26x1t4vxH3?=
 =?us-ascii?Q?nPEp8SMQVOPaIsrVENrYtxe8zIZet0UdURCkVNJP2Ff2mpl4/5vdMP4qpJWG?=
 =?us-ascii?Q?jfnF7isJ+xXuU1DuR/GXwqhNLxAxG1CS7re7AIgb/nq66TVQMQx1vJoTMnnn?=
 =?us-ascii?Q?d4PcEDdFLng860PO+h1PN0vdRnrykaz/dUjNlYSgwYqPnnXkaIgSI20tSftD?=
 =?us-ascii?Q?hMVzrV1wD4ZMS7CHP/hI2GMYrkc8aLrveyIi+JwqC2KL1b4xpBJGQIp0AbLm?=
 =?us-ascii?Q?wISs6Xa370XJ4Lij0zX0OcQoahocbE4p7Nvuf+lw3Dp1jxN7XLLNpmbyYBLQ?=
 =?us-ascii?Q?K+vMTNPmV1OMtgNI3xvnDlPVD3jZc5Mg2JanjsQXDtlYsyObOYREVOMv24/u?=
 =?us-ascii?Q?RBoPKQx6zmpbWCIb/t59zXgOCePSftiIZUyYgoqGrS8hnXhCL7MzdLYUpUG3?=
 =?us-ascii?Q?QTeiGj8ONkYltEY/byIzDCAg8SMY7bi8kVbu2FNftE55qsZVhwSu1COG4oq5?=
 =?us-ascii?Q?btlkK4H0pmgzoxUpqZ3cn4MaFkGrO9wXohpYQ+tNFum8AhgNyeS1FoseOwx4?=
 =?us-ascii?Q?F5YaNhFt6pPlN98zsp+eotk+eGhppFNWdyx8M1Vq7fvu0I+hu2NRl1QX9Qzp?=
 =?us-ascii?Q?wVF1pLWgoKtgDWq9hst4YtvIMVa+sUdlHu49EtUUDZFPAyMwT5lgo+FQB3Lf?=
 =?us-ascii?Q?RYhlQJQ2+SArTjnfbqz9z6W6?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dff57d41-45e2-46ec-f98a-08d8f01a51c6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2668.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 05:45:10.8003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aXc8G6H1m1kfemdvevIuc1aPqDXH2q7uE5z4fOSLgnicOwjK4Tl7MAcE13Gxg1X6otTszdArtqeAonMMNayF6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1772
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9934
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103260041
X-Proofpoint-ORIG-GUID: V641eLdgVMJxal0eG88Huxd8P5MYdMD-
X-Proofpoint-GUID: V641eLdgVMJxal0eG88Huxd8P5MYdMD-
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9934
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 lowpriorityscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103260041
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=dongli.zhang@oracle.com; helo=userp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com, ehabkost@redhat.com,
 mst@redhat.com, jasowang@redhat.com, joe.jin@oracle.com, armbru@redhat.com,
 dgilbert@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is to implement the device event interface for virtio-net-pci.

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 hw/net/virtio-net.c            |  9 +++++++++
 hw/virtio/virtio-net-pci.c     | 10 ++++++++++
 include/hw/virtio/virtio-net.h |  3 +++
 3 files changed, 22 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 66b9ff4511..b5c3fa392c 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3195,6 +3195,15 @@ static bool failover_hide_primary_device(DeviceListener *listener,
     return qatomic_read(&n->failover_primary_hidden);
 }
 
+void virtio_net_device_event(DeviceState *dev, int event, int queue,
+                             Error **errp)
+{
+    VirtIONet *n = VIRTIO_NET(dev);
+    bool irqfd = n->vhost_started;
+
+    virtio_device_event(dev, event, queue, irqfd, errp);
+}
+
 static void virtio_net_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
diff --git a/hw/virtio/virtio-net-pci.c b/hw/virtio/virtio-net-pci.c
index aa0b3caecb..1fa5a6fe5d 100644
--- a/hw/virtio/virtio-net-pci.c
+++ b/hw/virtio/virtio-net-pci.c
@@ -46,6 +46,15 @@ static Property virtio_net_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static void virtio_net_pci_event(DeviceState *dev, int event, int queue,
+                                 Error **errp)
+{
+    VirtIONetPCI *vnet = VIRTIO_NET_PCI(dev);
+    DeviceState *vdev = DEVICE(&vnet->vdev);
+
+    virtio_net_device_event(vdev, event, queue, errp);
+}
+
 static void virtio_net_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
 {
     DeviceState *qdev = DEVICE(vpci_dev);
@@ -77,6 +86,7 @@ static void virtio_net_pci_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_NETWORK_ETHERNET;
     set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
     device_class_set_props(dc, virtio_net_properties);
+    dc->event = virtio_net_pci_event;
     vpciklass->realize = virtio_net_pci_realize;
 }
 
diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index 7e96d193aa..d88c9969ea 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -214,4 +214,7 @@ struct VirtIONet {
 void virtio_net_set_netclient_name(VirtIONet *n, const char *name,
                                    const char *type);
 
+void virtio_net_device_event(DeviceState *dev, int event, int queue,
+                             Error **errp);
+
 #endif
-- 
2.17.1


