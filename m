Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FBC34A124
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 06:47:51 +0100 (CET)
Received: from localhost ([::1]:51812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPfK2-0005Kp-8E
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 01:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lPfHk-0003Sa-8k; Fri, 26 Mar 2021 01:45:28 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:35000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lPfHf-00045S-0s; Fri, 26 Mar 2021 01:45:27 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12Q5iRgd157385;
 Fri, 26 Mar 2021 05:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=nMyLHhu7qQxuEe8YxDqgkVlehVMl3Mh8P4fBY6fd3ao=;
 b=0hWI1rOHZJF9oVT+q+lpaK5q3tY6mBhXyjEr1IpqMDy370BDnOBAggW2KzQDfgcBkhVv
 IvT/tfoeOqFwiL5DwluTRD5rn8IB8T2nkAsbf2LQj3RfUOzXzbRQSGGF5MDiTN4898Ts
 XMS/lnuA70rGqDePku4OlPCnqOcC/lCTx591D6EQKgujGIGVS5xb84QQ7M/f+zXkoZPS
 0Uram776I3K/52sFU/bFXWkBJ50cAlfOZpRDNyaEdZKDFpKg3lDUtGtBgj068zCk5Apo
 bbZa4P6JFFmtxd9wG9tBb6723ZAhQ8jirPOJsC9+zM8YzTpMY9iejoN8kajDiqXwcfop eg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 37h13e8vuc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 05:45:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12Q5aJeW140931;
 Fri, 26 Mar 2021 05:45:04 GMT
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2052.outbound.protection.outlook.com [104.47.38.52])
 by userp3020.oracle.com with ESMTP id 37h14grkca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 05:45:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3Flwz5DjHI2BhhYPzrI4oB+5x05umFjhy7YTFtWLCENh5z/NFXfv9xtiMRmRAnjtrekRdzmiha8m7k4BOVs2P5/a4XqD8IcYP9LlGq41rGlXklZvbDhT43JsiAjeydciw1/iNfTrlM8luRLt/dPm0PMg4WkVI4LXuApH0iWwfwbjdPTnSaV6XklCtg5AfZuZpo70zbxapnAglqsJKF0oZAaJ3m1lLOR2VkSPrtJLszns6zubMKNh6H7Eh/hnzJfii0qTuNGPHrQ8cxKlpeu56kwUsljX1lab0fR48eWmgUdANUDXrYZm8HGScCKCfnyu73glv4rL1ZoU3xMBm4gDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMyLHhu7qQxuEe8YxDqgkVlehVMl3Mh8P4fBY6fd3ao=;
 b=hK9OCEbw6RHHDY9/p4Y8FQEgdxRGt775eyaT3/88tlAosBIa4sT/eJXVR0I+2RxYnbKoVlgF2sQGynOKHzOxvSPQhuOxTuUVLx1FyrsrTRP0/VYyczKQdY7U+l2t4cbCr1fA6TnZo2hCKvjh0Y6GMYoxHJ6GwEUEUuB/DFnpcLTc8rsenJZgC63z1uXJRSO7VjvKnvy1USNZABolrMr0aWG69CMtbg0mJN6YLmu64sj2ewZywjVh7tvchj9msimHHBWJ49fkVHafftyCEdA+KnUe0H6jooldDA7/DCagJfgAHeK2MEnJVl/yyqy1dHkBML918k8AZg5lsS3VSU0geQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMyLHhu7qQxuEe8YxDqgkVlehVMl3Mh8P4fBY6fd3ao=;
 b=rUNus+94C7Esu/a5Gz3E3ThOiDzatf/K8pOV+2UZGBtavwaKlZce/3fOxFG1mFOvstNLzmXeZ4F+z95SReQ2GE7pv56RE/B2oWjIG2k1aDyezEa6liBv4fWTytgOC2bzKOjmJ58r/P6KLoHZ4Hf3cwTx5kqvq5Cle369PdfRCXY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2668.namprd10.prod.outlook.com (2603:10b6:5:b2::25) by
 DM6PR10MB3068.namprd10.prod.outlook.com (2603:10b6:5:6a::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.26; Fri, 26 Mar 2021 05:45:02 +0000
Received: from DM6PR10MB2668.namprd10.prod.outlook.com
 ([fe80::9d2c:340:5b24:bff7]) by DM6PR10MB2668.namprd10.prod.outlook.com
 ([fe80::9d2c:340:5b24:bff7%6]) with mapi id 15.20.3846.054; Fri, 26 Mar 2021
 05:45:02 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 0/6] Add debug interface to kick/call on purpose
Date: Thu, 25 Mar 2021 22:44:27 -0700
Message-Id: <20210326054433.11762-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
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
 15.20.3977.25 via Frontend Transport; Fri, 26 Mar 2021 05:45:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e540af13-c759-4b73-227f-08d8f01a4c92
X-MS-TrafficTypeDiagnostic: DM6PR10MB3068:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR10MB30681EB910BD9B4E41B7C06EF0619@DM6PR10MB3068.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mYOS38Q3Cw6Awe+nmKcuToNe7CeXbXu2ieBzE+L9vlVrHKhHBNCmUM3RhRuumcZDYCdfevDNfzUJ3ZOf+tEsTn4fbxrPZMYSIbGs0imZc7jkIBBc6RQ7TB6HiM6ndvl5HAGLnTApp/0fWwXtW1vYfzq/eLBcrUUT4W3W+cvG5KE9srL4+7ZCHB6kTchUls+2QNbcq6+dgBsBJhyBujEN/eYLhGEwiSwieGL/sY7ZVdvgrfWTOvkpjtn4Mn+zEawYLrAQSH8r94/+q7wbUOxgPThbsQ3iacTNltVmGfvYSOP/eDCXBKy7obMdnPyrXBvpNb2vwt7EtiBFGhxua+hJo35zVDpUTNv5f48kAKphevexezzVgMulhmBmND6a9VQOZajYw0ahZd3+djgAorRQz1p5nNeJpnSPlalnMOyoAxb+Wy3IRfb+YHT7t4uKjICF6jCS9zVtDh2U0VSfOxvZK4ekKBd8NxcAhMff8s1sEYeh0gWNwONxjNP5R7GFTSHXCJMigovsTw7IwiaFOKg46whuU4U7aLXcuBvrCse8bWidAJ6LXoVSP0KLofC0FEx1K/Vhoy+Gid245ECZJUHcOO7DSqqP6XhOVA+UhPNfbT9Z8bsKqhJXu4TjnrsUABeGn30v1DdpLuB1rwElIPTcjAlM9Htqcr2Jv4GVa4hlbWICN/hLk3wlCX6RG1Nq/FtrOYL1Pxip0CVDP46HLnRyy5qr/LLH05Ux0PvEXTzX2VrHpYvR2I80kyEL6zBSWLjvMjHh9xyh/B5fTIZawspvRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2668.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(376002)(366004)(396003)(346002)(26005)(8936002)(956004)(8676002)(36756003)(44832011)(6666004)(16526019)(2616005)(83380400001)(7416002)(6506007)(186003)(6486002)(966005)(478600001)(5660300002)(52116002)(69590400012)(66556008)(38100700001)(1076003)(4326008)(66476007)(6512007)(66946007)(316002)(107886003)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hVOV4fLKiVGNGiWqB768UTX3nIweKNDsOKfgrZH2nb1Wt9iOmksxtBWSG7t6?=
 =?us-ascii?Q?OlrViOis4bIXHpLEPjyO3WdOP2lfgGawsYXkOhrEoGBhIl2Ys5jS6AEGQM/2?=
 =?us-ascii?Q?ox3jwig5dhrr+HMp0nwW7hV+LWkzyZUs2M/4qbxfKKBEvZf8zwlq8utOyrNk?=
 =?us-ascii?Q?juIss9g08GNVhvcXjWGYO6hunVbfsTnUTHmygsl0pCbeRNvj8u3p8Avs3RUB?=
 =?us-ascii?Q?Rvs7B8ebUNkcFF50IZH7chSsqlPC+J3ply+hDiTj0JCyj5RYCPsufd1h5eCn?=
 =?us-ascii?Q?UCF9wxvuZVGN0JZtFyQj84vJ25tlx7jm0CqS5hVNnmXrdFDRyQKXPAQPpZhv?=
 =?us-ascii?Q?sF8sRyP7hcmxnx9WJscXlV6FM6SWlkatV6HvSPK++cFgxUzJLnfBgWdscNdh?=
 =?us-ascii?Q?6FxMNGPR/pPLCCUzoGnCHvIyi0QernSXDnJ3N+qWl61fFThKMgbwVs5RVmsI?=
 =?us-ascii?Q?c+OjfSniOgrNCYJK3eG1AfzJ7CvMAfGMTtVFJO0LSn71oBxU7Zq9SUJo1P1U?=
 =?us-ascii?Q?j3rVWUqKJDcEI1eOJZ7yjyosV5Wn8dzGkzSdgo0SzQPQBKqTohV8RenMbn34?=
 =?us-ascii?Q?3WdiNDEGwEWZHnmQLYhsrNw2VZVQ2JuWgnCbY/tslea1qPdOhJCDrX4I2Luw?=
 =?us-ascii?Q?UIyt4j7gc1879qyzpK4MoY+/7tJwm1j5ZoG2xBfHatgNLeuyXFxGyHDmO/gW?=
 =?us-ascii?Q?K7nST1A1485CQ+Gun6pYO/Y3wTXRVgW1cU9l3Y3lf84jIGb45Jt00tzFFH3A?=
 =?us-ascii?Q?/OqowE+4Bm36dj7MtIlR93T4L3CM7h9NUrx7SOrVHQkoHXaFn50KIVFco8a0?=
 =?us-ascii?Q?69T9ercVDyIDIOAtHmFwGLt8iiAudhRP0QGs56BtM9gu53o3AqXoeD1saLnO?=
 =?us-ascii?Q?hksHUivxSqWxagFDTDhyDJrDNNzQWslVuZaQkVUasoCLemOQ50XXCSp8vQg4?=
 =?us-ascii?Q?dTvR4Sv46sUqCbdpkuyxy6xEh0cEgoKxoeO4EwXIDKISUvO6PGQRP/WNjD7E?=
 =?us-ascii?Q?w1eyWYYLe/sc3w3NS49GKBquvmCzSyN5bgH9cVCrSDQDL+QZrFKuO7HWcSXw?=
 =?us-ascii?Q?NUyiVQIxDAmw0H7Vp5bVAjtvc9tbxnBDADTRqj+j5QL941eYfRIVSKPbxb15?=
 =?us-ascii?Q?H0fOxXzJKP4sORAuyv7YIgW5IHbTGWeaItS/t4KsR0ycCfa1IvcmfPrgx22a?=
 =?us-ascii?Q?vRU3v6A0Vd2Nnrx53P9mZEYMQ8cDYrWnhaDkgOfy8NX4wD8VjZeHtXdn+OV8?=
 =?us-ascii?Q?0Pdfe8KPysCjkJTJmjNEi7IPp/0i5Q8o3TjHvN+ddZT+Gso0VZAcqEwm10Xy?=
 =?us-ascii?Q?0kSAS/yH36C6eMA5rXf7Ks6S?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e540af13-c759-4b73-227f-08d8f01a4c92
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2668.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 05:45:02.0214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p27ptjBlc6Pc3BMuOSz/CfkiYvRkw6t/FlnIddAQTCaFmuZvGurQcvBkDbf2MXKQedmln1se1dCaRDLzUH7wkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3068
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9934
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103260040
X-Proofpoint-ORIG-GUID: ufbYh_Nr7jbh1XLHHM0drL5lBmY6CWny
X-Proofpoint-GUID: ufbYh_Nr7jbh1XLHHM0drL5lBmY6CWny
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9934
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
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

The virtio device/driver (e.g., vhost-scsi or vhost-net) may hang due to
the loss of doorbell kick, e.g.,

https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg01711.html

... or due to the loss of IRQ, e.g., as fixed by linux kernel commit
fe200ae48ef5 ("genirq: Mark polled irqs and defer the real handler").

This patch introduces a new debug interface 'DeviceEvent' to DeviceClass
to help narrow down if the issue is due to loss of irq/kick. So far the new
interface handles only two events: 'call' and 'kick'. Any device (e.g.,
virtio/vhost or VFIO) may implement the interface (e.g., via eventfd, MSI-X
or legacy IRQ).

The 'call' is to inject irq on purpose by admin for a specific device (e.g.,
vhost-scsi) from QEMU/host to VM, while the 'kick' is to kick the doorbell
on purpose by admin at QEMU/host side for a specific device.


This device can be used as a workaround if call/kick is lost due to
virtualization software (e.g., kernel or QEMU) issue.

We may also implement the interface for VFIO PCI, e.g., to write to
VFIOPCIDevice->msi_vectors[i].interrupt will be able to inject IRQ to VM
on purpose. This is considered future work once the virtio part is done.


Below is from live crash analysis. Initially, the queue=2 has count=15 for
'kick' eventfd_ctx. Suppose there is data in vring avail while there is no
used available. We suspect this is because vhost-scsi was not notified by
VM. In order to narrow down and analyze the issue, we use live crash to
dump the current counter of eventfd for queue=2.

crash> eventfd_ctx ffff8f67f6bbe700
struct eventfd_ctx {
  kref = {
    refcount = {
      refs = {
        counter = 4
      }
    }
  }, 
  wqh = {
    lock = {
      {
        rlock = {
          raw_lock = {
            val = {
              counter = 0
            }
          }
        }
      }
    }, 
    head = {
      next = 0xffff8f841dc08e18, 
      prev = 0xffff8f841dc08e18
    }
  }, 
  count = 15, ---> eventfd is 15 !!!
  flags = 526336
}

Now we kick the doorbell for vhost-scsi queue=2 on purpose for diagnostic
with this interface.

{ "execute": "x-debug-device-event",
  "arguments": { "dev": "/machine/peripheral/vscsi0",
                 "event": "kick", "queue": 2 } }

The counter is increased to 16. Suppose the hang issue is resolved, it
indicates something bad is in software that the 'kick' is lost.

crash> eventfd_ctx ffff8f67f6bbe700
struct eventfd_ctx {
  kref = {
    refcount = {
      refs = {
        counter = 4
      }
    }
  },
  wqh = {
    lock = {
      {
        rlock = {
          raw_lock = {
            val = {
              counter = 0
            }
          }
        }
      }
    },
    head = {
      next = 0xffff8f841dc08e18,
      prev = 0xffff8f841dc08e18
    }
  },
  count = 16, ---> eventfd incremented to 16 !!!
  flags = 526336
}


Original RFC link:

https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg03441.html

Changed since RFC:
  - add support for more virtio/vhost pci devices
  - add log (toggled by DEBUG_VIRTIO_EVENT) to virtio.c to say that this 
    mischeivous command had been used
  - fix grammer error (s/lost/loss/)
  - change version to 6.1
  - fix incorrect example in qapi/qdev.json
  - manage event types with enum/array, instead of hard coding


Dongli Zhang (6):
   qdev: introduce qapi/hmp command for kick/call event
   virtio: introduce helper function for kick/call device event
   virtio-blk-pci: implement device event interface for kick/call
   virtio-scsi-pci: implement device event interface for kick/call
   vhost-scsi-pci: implement device event interface for kick/call
   virtio-net-pci: implement device event interface for kick/call

 hmp-commands.hx                 | 14 ++++++++
 hw/block/virtio-blk.c           |  9 +++++
 hw/net/virtio-net.c             |  9 +++++
 hw/scsi/vhost-scsi.c            |  6 ++++
 hw/scsi/virtio-scsi.c           |  9 +++++
 hw/virtio/vhost-scsi-pci.c      | 10 ++++++
 hw/virtio/virtio-blk-pci.c      | 10 ++++++
 hw/virtio/virtio-net-pci.c      | 10 ++++++
 hw/virtio/virtio-scsi-pci.c     | 10 ++++++
 hw/virtio/virtio.c              | 64 ++++++++++++++++++++++++++++++++++++
 include/hw/qdev-core.h          |  9 +++++
 include/hw/virtio/vhost-scsi.h  |  3 ++
 include/hw/virtio/virtio-blk.h  |  2 ++
 include/hw/virtio/virtio-net.h  |  3 ++
 include/hw/virtio/virtio-scsi.h |  3 ++
 include/hw/virtio/virtio.h      |  3 ++
 include/monitor/hmp.h           |  1 +
 qapi/qdev.json                  | 30 +++++++++++++++++
 softmmu/qdev-monitor.c          | 56 +++++++++++++++++++++++++++++++
 19 files changed, 261 insertions(+)


I did tests with below cases.

- virtio-blk-pci (ioeventfd on/off, iothread, live migration)
- virtio-scsi-pci (ioeventfd on/off)
- vhost-scsi-pci
- virtio-net-pci (ioeventfd on/off, vhost)

Thank you very much!

Dongli Zhang



