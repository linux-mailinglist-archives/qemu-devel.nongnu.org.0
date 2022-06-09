Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 853E4544FD1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:51:05 +0200 (CEST)
Received: from localhost ([::1]:35876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJV2-0007Us-J6
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1nzCfW-0002B5-UE
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 03:33:29 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:1688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1nzCfR-0007uP-1L
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 03:33:26 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25964eWX027717;
 Thu, 9 Jun 2022 00:33:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=7+LOV4TNbMSsT83B7FiHwpFKsg7v6LYRFo9WTGpek9Q=;
 b=paowXkW4ALIv6J/uzuQG2R2vBYG0Y4CLyi+B2fA+FBkdyEuof7qDptjBSpRywjIgofO/
 U1RBm+nlzcqNdZJZVpTGYL4hrtmvSxrNiWLAp1XiSwaltNa8FG5jZ30QgRNnOjXCEmn7
 motD+P3cDFsOWWFp9TS/s16++Whb9ZVjDbX2sNE4JsOBJAfhG+QLr0AGmbC6Pgg3u9OB
 2mxttXFzW2Riz6R2L3m8wW8DUS/rXP+k0TXvr5IGjCAc+DKRp3RSKtjTWfzCUxBHd/oQ
 1qeOscZbxh6f2pQ6/HaIhQf6tJlKBWx3kd490cvysObVUvxIeRRahyD4gAfcMOLb6iAe 1A== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3gg3aatafk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jun 2022 00:33:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elAJyHOELTYrPwCtRDuFg4hhys4f2aCr51aCv1XIDVSb9atTpqpYuGe2oKW7/AJSX+ATDDjqL0eU97IkJE+GMlLo9ov8lImW9W5c8aEQh8vAgpOcb5XKbzZdaYfZHhaE3j+TjskucneGU9XzXiQfGBg/rhvpW+1dB5nCbuAVANz5kCeDtx6G/my5Qf1bLH2NZqRkahrs6zz4eyiy4ethl1BclWPPIhCOixq2R5z4hBYXNfYvirzMNDv2rZ7klQ22KO5xLO1Ol5ajDKNcTwSsj7+FdBEQIQi2umbvJ8Fviuo7aE4VzFMlBzhzO87NPEncyoL0n8KyYeuWWDwz3P0u2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+LOV4TNbMSsT83B7FiHwpFKsg7v6LYRFo9WTGpek9Q=;
 b=hZ16i10EAYeOGgLZ0Pun16vPhkpb9bftO7zPnzxfJLrRcYMoCX4NFAEqwZKfFvDhqUILGXSFM3dQbKC343jyJQrk+jMad624IbTQ7Zs1ebFH5R0Ijw6a8b2HRMkVEX/vAL3HvbWYFm9xMXpP1gYCnooaNnVA+ADbPBcYY1iPXtggZN0Cpv9scLUmNysFRUKl1cLWa+VK4HWK03bAt3nYHpVncZLmIcQEoJ1c+Tj1QvPT2sJX+euZW1FQwQNaqWzARUsdFEiBiBZZ1j5Ce2wuXFd93+gT4mGTJC5bH8yiiBfgF8bFEToqFuv2RMV16D1eOvM8VjFJk4ORGFHddk17EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SA1PR02MB8639.namprd02.prod.outlook.com (2603:10b6:806:1fe::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 9 Jun
 2022 07:33:17 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f%5]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 07:33:17 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com, armbru@redhat.com, eblake@redhat.com,
 Het Gala <het.gala@nutanix.com>, Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH 3/4] Establishing connection between any non-default source
 and destination pair
Date: Thu,  9 Jun 2022 07:33:04 +0000
Message-Id: <20220609073305.142515-4-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20220609073305.142515-1-het.gala@nutanix.com>
References: <20220609073305.142515-1-het.gala@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::12) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23c25bc8-a97a-4bb1-7f5b-08da49ea51d5
X-MS-TrafficTypeDiagnostic: SA1PR02MB8639:EE_
X-Microsoft-Antispam-PRVS: <SA1PR02MB8639398E82600CACD7DADECF98A79@SA1PR02MB8639.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z3zPjrVWAgypVcp97VylpyAVZfq8LlrvPwyYXo/CfSok9AhxHd6tuKvqQERJXMRxrvXCtTRzbNzxC5GTjVc2sI94oLVIJQ2q8JZGC7vVU4lc4NA8LyIrN3qhDdmOmGpCLJ7pzcPbfng4yiIna/GkQm6zvdmlLrESjx1wDCJLZY4zClX1D4mCF/a/HUMWnWnZSDgk+ok/5T0nKDMHi4+GFjsaCtRhLSYonKBeCAltUgFj9Ehw37w/HGx39XFI7jklqWlpGcDuFg5UVgO2OVncIRDafNjC8Kxd7eF7cSkeC6zzLBkdNdw1EUYTeR864lGBuTT0rQpIUujChsW4CNtNDhzsm4wn2PQmiZqtzO3t22SzzETgENL7ghw22DUeG9Nr5efVannrBm8vx1+pmAKRAckcZT7G6n5krcpoFalbWaq4dj3SgWrPSYd3qKiReD4AsTpPhcGKRYxdIqj5Ni4iMo/6T+nMw5Zxc3Uix1W4Vi/fqDcvOLMyXtnQg+W/gUjZ/8QG0oEQXIKNMX/zve3HsNgs4dQuXJIOHcEMCiM8nT7MSRM84/FcIMX/ZloPPm0pSWZnFBzRJ+oD0C6dpGrvaeiQJ3gXf63ZCIEx28F4N2drbSZ13iGhuysCG/e3Y93DTkV70jFr/inwaRZhUxbKQc8ylJPOfVE1gLkhlsWPqJUvKYtVgjI7whieXFVht4XnM1YSK0YU/wccYyLAgNt8Hg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(107886003)(6666004)(1076003)(2906002)(8936002)(52116002)(54906003)(86362001)(6506007)(186003)(5660300002)(30864003)(83380400001)(66574015)(6486002)(44832011)(38350700002)(26005)(38100700002)(36756003)(6512007)(2616005)(316002)(66556008)(66946007)(4326008)(6916009)(8676002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lcj6Sw3ExuixowQ4EdM/YuUgmYqwG8oKw1elvcMhqWH5dhzoWN2z2UclmWI7?=
 =?us-ascii?Q?NHEDaxuSMIJ9SORms4V01Gyo+TtmeZh3ufRffDT4wLHselOVCAMxVnBjmJL/?=
 =?us-ascii?Q?DnvT9iD81Pn8hxW6oMHiL7gMQDoQ0pq+CbFfKI+KTnWy5MDaVzo0+1jc5GgY?=
 =?us-ascii?Q?0eCNR0ye0Oi74sOBVSsj1A1DaN28sRNuybbnuXb++WiKrOWCkkyOw6EpKJQM?=
 =?us-ascii?Q?7JfIV0ZMGFUbMcWz340sDiedwdqrznBbiwMhrNiy0rEeNVBKprJAEB7gLQHV?=
 =?us-ascii?Q?fOJPJ+DbqVy+831SmvjVXt/DucTU5SwumhlACEauMl2wT4gKKfNBGtUBGQTT?=
 =?us-ascii?Q?K98KU2UA2FiK5/0NSi5Jzy76gy4PpNjrbc+jbWu42yzhXPwRiEIAvzsIYqNV?=
 =?us-ascii?Q?EvbEyHv75YMotaQPOSu58cfvvrk5ja3XV++IMsatRXu44IPN8WXvN4F0sv4x?=
 =?us-ascii?Q?B3IZSTPijWqqxokb6S8IM5J9Dcg4H5J0DWHodB3/W1oFlN+cu26TXy016iiM?=
 =?us-ascii?Q?9s5YG7JxvriDIfEfuve9sH+mY9vjmcE1fZ7xhPbqnQ4qPYyANS/aFpscScOK?=
 =?us-ascii?Q?USsWTrRdNRq3UnbSWkPLEE3MsXOpzRaQuDhuXm4rrGRw6kvBEHJfK2muqLZf?=
 =?us-ascii?Q?SDPCgLl95Nc634zegFB5GSgSAe+zYwPE0tYUMW9tiS8WI8ncldUVqqECHjDO?=
 =?us-ascii?Q?o3yrCT8LqymRL2MmvNcHy82oGJZudFGMSB1SrB6w8h0uH1RJ4q+BWQ10AJTt?=
 =?us-ascii?Q?sY8irg+3D5JNuAQjMlRvXj8s3MPA/rRpGFLwmZSy2Q0DvXzz/GDnV17kozMH?=
 =?us-ascii?Q?7bC80Yla0Lq0btbZiR94a4tn8o/Po7KiLySBcAYZVNDjLkuUb/V9GsrV36Pm?=
 =?us-ascii?Q?U/Q37Oop1VagxeFdLB7jsLgIRbiX/uvX9+dVwof891OJe8hsnhB0HgrOV8YA?=
 =?us-ascii?Q?ieRj8tFDr1QoifhwzDBIUldZhc+g9TTPJ3QeDcRoyXMQsTui27Xukdmppbzn?=
 =?us-ascii?Q?9LkTnsT3nhPaDcYGewd6Xk8fy4bjFg8ue81Y3dLmVC5svXbvF9tQPePi8r8M?=
 =?us-ascii?Q?Re5sRJgOXw/dHY7ge4erBX0k609GPQiYxc5t/0OtQJS3aw0MPxOEOCbUnAsa?=
 =?us-ascii?Q?4D4pDRgq8FGVET5gKAwAwO9AudjQ2ja3KPGPUJfN4bv3zpz4mXH0osrjZKLz?=
 =?us-ascii?Q?RMyE8Pmk6+X6O+DJPR3sAvK8kF39BSdTBEISA41ffecO3dKZaOsJsKs6m+sB?=
 =?us-ascii?Q?NdvuPB2k58104qvfjBGRuDzjnNxVwo800pRghkLoKgTedYHgRaGRTZeNhGpW?=
 =?us-ascii?Q?MLn9rmjc2/PdQF8j2imdnYb55szkgI1d0teYntVPAF9/hX+rzD8T3QjYj4V0?=
 =?us-ascii?Q?k1DnVtv7n/ZlStD9wmVg8LHa+JIHdvdiMY2RjiRS6Ri0C1GQn9D0q+fda4MX?=
 =?us-ascii?Q?F5y7OdHIklNSILn4WKJzfn/XEilDrfhrZ3+waYIatHzTEqj1MzXHSEf3BibS?=
 =?us-ascii?Q?qOXjSwsSXVQaJ/ySg63GOAtMqSULaoCHbAwDNP2lxgsCJT4P3eJ7pN7Xm9Vh?=
 =?us-ascii?Q?dfWTxWe57rTjimi4J6NoK8dP7zAGDwZj6dqh5Nue6XpkPcq+1joO31kYoBb6?=
 =?us-ascii?Q?AlLEzp9r4eapR9j5r5r1PPWk1zjYCZCZAnN+GNOmch0RMBsCVqu9rG5hpXSa?=
 =?us-ascii?Q?iya8V1ipzPiE8hMENTLi988NiaedrLLKRB67mtGi/V09aKQHOyBoUQHWDyhY?=
 =?us-ascii?Q?nidwMIuUvKrDSsmyjCgumvMBHHfgDlI=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c25bc8-a97a-4bb1-7f5b-08da49ea51d5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 07:33:17.1561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igLBSBi71NhsVNfDXhGpjEhLo8DnHHM03EtZxvwv0IMv7inuuVFx3nDI1cfwfP57KD31LdFUCrhEjhx37HDKIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8639
X-Proofpoint-ORIG-GUID: K9vbwjo7tXBeykz6lizvtVKQz9qLKN04
X-Proofpoint-GUID: K9vbwjo7tXBeykz6lizvtVKQz9qLKN04
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-09_07,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 09 Jun 2022 09:30:32 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

i) Binding of the socket to source ip address and port on the non-default
   interface has been implemented for multi-FD connection, which was not
   necessary earlier because the binding was on the default interface itself.

ii) Created an end to end connection between all multi-FD source and
    destination pairs.

Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 chardev/char-socket.c               |  4 +-
 include/io/channel-socket.h         | 26 ++++++-----
 include/qemu/sockets.h              |  6 ++-
 io/channel-socket.c                 | 50 ++++++++++++++------
 migration/socket.c                  | 15 +++---
 nbd/client-connection.c             |  2 +-
 qemu-nbd.c                          |  4 +-
 scsi/pr-manager-helper.c            |  1 +
 tests/unit/test-char.c              |  8 ++--
 tests/unit/test-io-channel-socket.c |  4 +-
 tests/unit/test-util-sockets.c      | 16 +++----
 ui/input-barrier.c                  |  2 +-
 ui/vnc.c                            |  3 +-
 util/qemu-sockets.c                 | 71 ++++++++++++++++++++---------
 14 files changed, 135 insertions(+), 77 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index dc4e218eeb..f3725238c5 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -932,7 +932,7 @@ static int tcp_chr_connect_client_sync(Chardev *chr, Error **errp)
     QIOChannelSocket *sioc = qio_channel_socket_new();
     tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
     tcp_chr_set_client_ioc_name(chr, sioc);
-    if (qio_channel_socket_connect_sync(sioc, s->addr, errp) < 0) {
+    if (qio_channel_socket_connect_sync(sioc, s->addr, NULL, errp) < 0) {
         tcp_chr_change_state(s, TCP_CHARDEV_STATE_DISCONNECTED);
         object_unref(OBJECT(sioc));
         return -1;
@@ -1120,7 +1120,7 @@ static void tcp_chr_connect_client_task(QIOTask *task,
     SocketAddress *addr = opaque;
     Error *err = NULL;
 
-    qio_channel_socket_connect_sync(ioc, addr, &err);
+    qio_channel_socket_connect_sync(ioc, addr, NULL, &err);
 
     qio_task_set_error(task, err);
 }
diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
index 513c428fe4..59d5b1b349 100644
--- a/include/io/channel-socket.h
+++ b/include/io/channel-socket.h
@@ -83,41 +83,45 @@ qio_channel_socket_new_fd(int fd,
 /**
  * qio_channel_socket_connect_sync:
  * @ioc: the socket channel object
- * @addr: the address to connect to
+ * @dst_addr: the destination address to connect to
+ * @src_addr: the source address to be connected
  * @errp: pointer to a NULL-initialized error object
  *
- * Attempt to connect to the address @addr. This method
- * will run in the foreground so the caller will not regain
- * execution control until the connection is established or
+ * Attempt to connect to the address @dst_addr with @src_addr.
+ * This method will run in the foreground so the caller will not
+ * regain execution control until the connection is established or
  * an error occurs.
  */
 int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
-                                    SocketAddress *addr,
+                                    SocketAddress *dst_addr,
+                                    SocketAddress *src_addr,
                                     Error **errp);
 
 /**
  * qio_channel_socket_connect_async:
  * @ioc: the socket channel object
- * @addr: the address to connect to
+ * @dst_addr: the destination address to connect to
  * @callback: the function to invoke on completion
  * @opaque: user data to pass to @callback
  * @destroy: the function to free @opaque
  * @context: the context to run the async task. If %NULL, the default
  *           context will be used.
+ * @src_addr: the source address to be connected
  *
- * Attempt to connect to the address @addr. This method
- * will run in the background so the caller will regain
+ * Attempt to connect to the address @dst_addr with the @src_addr.
+ * This method will run in the background so the caller will regain
  * execution control immediately. The function @callback
- * will be invoked on completion or failure. The @addr
+ * will be invoked on completion or failure. The @dst_addr
  * parameter will be copied, so may be freed as soon
  * as this function returns without waiting for completion.
  */
 void qio_channel_socket_connect_async(QIOChannelSocket *ioc,
-                                      SocketAddress *addr,
+                                      SocketAddress *dst_addr,
                                       QIOTaskFunc callback,
                                       gpointer opaque,
                                       GDestroyNotify destroy,
-                                      GMainContext *context);
+                                      GMainContext *context,
+                                      SocketAddress *src_addr);
 
 
 /**
diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 038faa157f..dc863c3df8 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -33,7 +33,8 @@ int inet_ai_family_from_address(InetSocketAddress *addr,
                                 Error **errp);
 int inet_parse(InetSocketAddress *addr, const char *str, Error **errp);
 int inet_connect(const char *str, Error **errp);
-int inet_connect_saddr(InetSocketAddress *saddr, Error **errp);
+int inet_connect_saddr(InetSocketAddress *dst_addr,
+                       InetSocketAddress *src_addr, Error **errp);
 
 NetworkAddressFamily inet_netfamily(int family);
 
@@ -41,7 +42,8 @@ int unix_listen(const char *path, Error **errp);
 int unix_connect(const char *path, Error **errp);
 
 SocketAddress *socket_parse(const char *str, Error **errp);
-int socket_connect(SocketAddress *addr, Error **errp);
+int socket_connect(SocketAddress *dst_addr, SocketAddress *src_addr,
+                   Error **errp);
 int socket_listen(SocketAddress *addr, int num, Error **errp);
 void socket_listen_cleanup(int fd, Error **errp);
 int socket_dgram(SocketAddress *remote, SocketAddress *local, Error **errp);
diff --git a/io/channel-socket.c b/io/channel-socket.c
index dc9c165de1..f8746ad646 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -36,6 +36,12 @@
 
 #define SOCKET_MAX_FDS 16
 
+struct SrcDestAddress {
+    SocketAddress *dst_addr;
+    SocketAddress *src_addr;
+};
+
+
 SocketAddress *
 qio_channel_socket_get_local_address(QIOChannelSocket *ioc,
                                      Error **errp)
@@ -145,13 +151,14 @@ qio_channel_socket_new_fd(int fd,
 
 
 int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
-                                    SocketAddress *addr,
+                                    SocketAddress *dst_addr,
+                                    SocketAddress *src_addr,
                                     Error **errp)
 {
     int fd;
 
-    trace_qio_channel_socket_connect_sync(ioc, addr);
-    fd = socket_connect(addr, errp);
+    trace_qio_channel_socket_connect_sync(ioc, dst_addr);
+    fd = socket_connect(dst_addr, src_addr, errp);
     if (fd < 0) {
         trace_qio_channel_socket_connect_fail(ioc);
         return -1;
@@ -177,39 +184,56 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
 }
 
 
+static void qio_channel_socket_worker_free(gpointer opaque)
+{
+    struct SrcDestAddress *data = opaque;
+    if (!data) {
+        return;
+    }
+    qapi_free_SocketAddress(data->dst_addr);
+    qapi_free_SocketAddress(data->src_addr);
+    g_free(data);
+}
+
+
 static void qio_channel_socket_connect_worker(QIOTask *task,
                                               gpointer opaque)
 {
     QIOChannelSocket *ioc = QIO_CHANNEL_SOCKET(qio_task_get_source(task));
-    SocketAddress *addr = opaque;
+    struct SrcDestAddress *data = opaque;
     Error *err = NULL;
 
-    qio_channel_socket_connect_sync(ioc, addr, &err);
+    qio_channel_socket_connect_sync(ioc, data->dst_addr, data->src_addr, &err);
 
     qio_task_set_error(task, err);
 }
 
 
 void qio_channel_socket_connect_async(QIOChannelSocket *ioc,
-                                      SocketAddress *addr,
+                                      SocketAddress *dst_addr,
                                       QIOTaskFunc callback,
                                       gpointer opaque,
                                       GDestroyNotify destroy,
-                                      GMainContext *context)
+                                      GMainContext *context,
+                                      SocketAddress *src_addr)
 {
     QIOTask *task = qio_task_new(
         OBJECT(ioc), callback, opaque, destroy);
-    SocketAddress *addrCopy;
-
-    addrCopy = QAPI_CLONE(SocketAddress, addr);
+    struct SrcDestAddress *data = g_new0(struct SrcDestAddress, 1);
 
+    data->dst_addr = QAPI_CLONE(SocketAddress, dst_addr);
+    if (src_addr) {
+        data->src_addr = QAPI_CLONE(SocketAddress, src_addr);
+    } else {
+        data->src_addr = NULL;
+    }
     /* socket_connect() does a non-blocking connect(), but it
      * still blocks in DNS lookups, so we must use a thread */
-    trace_qio_channel_socket_connect_async(ioc, addr);
+    trace_qio_channel_socket_connect_async(ioc, dst_addr);
     qio_task_run_in_thread(task,
                            qio_channel_socket_connect_worker,
-                           addrCopy,
-                           (GDestroyNotify)qapi_free_SocketAddress,
+                           data,
+                           qio_channel_socket_worker_free,
                            context);
 }
 
diff --git a/migration/socket.c b/migration/socket.c
index 21e0983df2..d0cb7cc6a6 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -47,7 +47,7 @@ void socket_send_channel_create(QIOTaskFunc f, void *data)
 {
     QIOChannelSocket *sioc = qio_channel_socket_new();
     qio_channel_socket_connect_async(sioc, outgoing_args.saddr,
-                                     f, data, NULL, NULL);
+                                     f, data, NULL, NULL, NULL);
 }
 
 int socket_send_channel_destroy(QIOChannel *send)
@@ -110,7 +110,7 @@ out:
 
 static void
 socket_start_outgoing_migration_internal(MigrationState *s,
-                                         SocketAddress *saddr,
+                                         SocketAddress *dst_addr,
                                          Error **errp)
 {
     QIOChannelSocket *sioc = qio_channel_socket_new();
@@ -118,20 +118,17 @@ socket_start_outgoing_migration_internal(MigrationState *s,
 
     data->s = s;
 
-    /* in case previous migration leaked it */
-    qapi_free_SocketAddress(outgoing_args.saddr);
-    outgoing_args.saddr = saddr;
-
-    if (saddr->type == SOCKET_ADDRESS_TYPE_INET) {
-        data->hostname = g_strdup(saddr->u.inet.host);
+    if (dst_addr->type == SOCKET_ADDRESS_TYPE_INET) {
+        data->hostname = g_strdup(dst_addr->u.inet.host);
     }
 
     qio_channel_set_name(QIO_CHANNEL(sioc), "migration-socket-outgoing");
     qio_channel_socket_connect_async(sioc,
-                                     saddr,
+                                     dst_addr,
                                      socket_outgoing_migration,
                                      data,
                                      socket_connect_data_free,
+                                     NULL,
                                      NULL);
 }
 
diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 2a632931c3..4bc505d26e 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -133,7 +133,7 @@ static int nbd_connect(QIOChannelSocket *sioc, SocketAddress *addr,
         *outioc = NULL;
     }
 
-    ret = qio_channel_socket_connect_sync(sioc, addr, errp);
+    ret = qio_channel_socket_connect_sync(sioc, addr, NULL, errp);
     if (ret < 0) {
         return ret;
     }
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 0cd5aa6f02..fe178f271e 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -191,7 +191,7 @@ static int qemu_nbd_client_list(SocketAddress *saddr, QCryptoTLSCreds *tls,
     int i, j;
 
     sioc = qio_channel_socket_new();
-    if (qio_channel_socket_connect_sync(sioc, saddr, &err) < 0) {
+    if (qio_channel_socket_connect_sync(sioc, saddr, NULL, &err) < 0) {
         error_report_err(err);
         goto out;
     }
@@ -284,7 +284,7 @@ static void *nbd_client_thread(void *arg)
 
     sioc = qio_channel_socket_new();
     if (qio_channel_socket_connect_sync(sioc,
-                                        saddr,
+                                        saddr, NULL,
                                         &local_error) < 0) {
         error_report_err(local_error);
         goto out;
diff --git a/scsi/pr-manager-helper.c b/scsi/pr-manager-helper.c
index 3be52a98d5..6e3e00eadf 100644
--- a/scsi/pr-manager-helper.c
+++ b/scsi/pr-manager-helper.c
@@ -114,6 +114,7 @@ static int pr_manager_helper_initialize(PRManagerHelper *pr_mgr,
     qio_channel_set_name(QIO_CHANNEL(sioc), "pr-manager-helper");
     qio_channel_socket_connect_sync(sioc,
                                     &saddr,
+                                    NULL,
                                     &local_err);
     g_free(path);
     if (local_err) {
diff --git a/tests/unit/test-char.c b/tests/unit/test-char.c
index 5b3b48ebac..fd5f281777 100644
--- a/tests/unit/test-char.c
+++ b/tests/unit/test-char.c
@@ -691,7 +691,7 @@ char_socket_addr_to_opt_str(SocketAddress *addr, bool fd_pass,
         if (is_listen) {
             qio_channel_socket_listen_sync(ioc, addr, 1, &error_abort);
         } else {
-            qio_channel_socket_connect_sync(ioc, addr, &error_abort);
+            qio_channel_socket_connect_sync(ioc, addr, NULL, &error_abort);
         }
         fd = ioc->fd;
         ioc->fd = -1;
@@ -748,7 +748,7 @@ char_socket_server_client_thread(gpointer data)
     SocketAddress *addr = data;
     QIOChannelSocket *ioc = qio_channel_socket_new();
 
-    qio_channel_socket_connect_sync(ioc, addr, &error_abort);
+    qio_channel_socket_connect_sync(ioc, addr, NULL, &error_abort);
 
     char_socket_ping_pong(QIO_CHANNEL(ioc), &error_abort);
 
@@ -1147,7 +1147,7 @@ static void char_socket_server_two_clients_test(gconstpointer opaque)
                              &closed, NULL, true);
 
     ioc1 = qio_channel_socket_new();
-    qio_channel_socket_connect_sync(ioc1, addr, &error_abort);
+    qio_channel_socket_connect_sync(ioc1, addr, NULL, &error_abort);
     qemu_chr_wait_connected(chr, &error_abort);
 
     /* switch the chardev to another context */
@@ -1161,7 +1161,7 @@ static void char_socket_server_two_clients_test(gconstpointer opaque)
      * succeed immediately.
      */
     ioc2 = qio_channel_socket_new();
-    qio_channel_socket_connect_sync(ioc2, addr, &error_abort);
+    qio_channel_socket_connect_sync(ioc2, addr, NULL, &error_abort);
 
     object_unref(OBJECT(ioc1));
     /* The two connections should now be processed serially.  */
diff --git a/tests/unit/test-io-channel-socket.c b/tests/unit/test-io-channel-socket.c
index 6713886d02..bc33ce6956 100644
--- a/tests/unit/test-io-channel-socket.c
+++ b/tests/unit/test-io-channel-socket.c
@@ -72,7 +72,7 @@ static void test_io_channel_setup_sync(SocketAddress *listen_addr,
 
     *src = QIO_CHANNEL(qio_channel_socket_new());
     qio_channel_socket_connect_sync(
-        QIO_CHANNEL_SOCKET(*src), connect_addr, &error_abort);
+        QIO_CHANNEL_SOCKET(*src), connect_addr, NULL, &error_abort);
     qio_channel_set_delay(*src, false);
 
     qio_channel_wait(QIO_CHANNEL(lioc), G_IO_IN);
@@ -136,7 +136,7 @@ static void test_io_channel_setup_async(SocketAddress *listen_addr,
 
     qio_channel_socket_connect_async(
         QIO_CHANNEL_SOCKET(*src), connect_addr,
-        test_io_channel_complete, &data, NULL, NULL);
+        test_io_channel_complete, &data, NULL, NULL, NULL);
 
     g_main_loop_run(data.loop);
     g_main_context_iteration(g_main_context_default(), FALSE);
diff --git a/tests/unit/test-util-sockets.c b/tests/unit/test-util-sockets.c
index 63909ccb2b..aa26630045 100644
--- a/tests/unit/test-util-sockets.c
+++ b/tests/unit/test-util-sockets.c
@@ -89,7 +89,7 @@ static void test_socket_fd_pass_name_good(void)
     addr.type = SOCKET_ADDRESS_TYPE_FD;
     addr.u.fd.str = g_strdup(mon_fdname);
 
-    fd = socket_connect(&addr, &error_abort);
+    fd = socket_connect(&addr, NULL, &error_abort);
     g_assert_cmpint(fd, !=, -1);
     g_assert_cmpint(fd, !=, mon_fd);
     close(fd);
@@ -121,7 +121,7 @@ static void test_socket_fd_pass_name_bad(void)
     addr.type = SOCKET_ADDRESS_TYPE_FD;
     addr.u.fd.str = g_strdup(mon_fdname);
 
-    fd = socket_connect(&addr, &err);
+    fd = socket_connect(&addr, NULL, &err);
     g_assert_cmpint(fd, ==, -1);
     error_free_or_abort(&err);
 
@@ -148,7 +148,7 @@ static void test_socket_fd_pass_name_nomon(void)
     addr.type = SOCKET_ADDRESS_TYPE_FD;
     addr.u.fd.str = g_strdup("myfd");
 
-    fd = socket_connect(&addr, &err);
+    fd = socket_connect(&addr, NULL, &err);
     g_assert_cmpint(fd, ==, -1);
     error_free_or_abort(&err);
 
@@ -172,7 +172,7 @@ static void test_socket_fd_pass_num_good(void)
     addr.type = SOCKET_ADDRESS_TYPE_FD;
     addr.u.fd.str = g_strdup_printf("%d", sfd);
 
-    fd = socket_connect(&addr, &error_abort);
+    fd = socket_connect(&addr, NULL, &error_abort);
     g_assert_cmpint(fd, ==, sfd);
 
     fd = socket_listen(&addr, 1, &error_abort);
@@ -194,7 +194,7 @@ static void test_socket_fd_pass_num_bad(void)
     addr.type = SOCKET_ADDRESS_TYPE_FD;
     addr.u.fd.str = g_strdup_printf("%d", sfd);
 
-    fd = socket_connect(&addr, &err);
+    fd = socket_connect(&addr, NULL, &err);
     g_assert_cmpint(fd, ==, -1);
     error_free_or_abort(&err);
 
@@ -217,7 +217,7 @@ static void test_socket_fd_pass_num_nocli(void)
     addr.type = SOCKET_ADDRESS_TYPE_FD;
     addr.u.fd.str = g_strdup_printf("%d", STDOUT_FILENO);
 
-    fd = socket_connect(&addr, &err);
+    fd = socket_connect(&addr, NULL, &err);
     g_assert_cmpint(fd, ==, -1);
     error_free_or_abort(&err);
 
@@ -246,10 +246,10 @@ static gpointer unix_client_thread_func(gpointer user_data)
 
     for (i = 0; i < ABSTRACT_SOCKET_VARIANTS; i++) {
         if (row->expect_connect[i]) {
-            fd = socket_connect(row->client[i], &error_abort);
+            fd = socket_connect(row->client[i], NULL, &error_abort);
             g_assert_cmpint(fd, >=, 0);
         } else {
-            fd = socket_connect(row->client[i], &err);
+            fd = socket_connect(row->client[i], NULL, &err);
             g_assert_cmpint(fd, ==, -1);
             error_free_or_abort(&err);
         }
diff --git a/ui/input-barrier.c b/ui/input-barrier.c
index 2d57ca7079..ee78654e3b 100644
--- a/ui/input-barrier.c
+++ b/ui/input-barrier.c
@@ -506,7 +506,7 @@ static void input_barrier_complete(UserCreatable *uc, Error **errp)
     ib->sioc = qio_channel_socket_new();
     qio_channel_set_name(QIO_CHANNEL(ib->sioc), "barrier-client");
 
-    qio_channel_socket_connect_sync(ib->sioc, &ib->saddr, &local_err);
+    qio_channel_socket_connect_sync(ib->sioc, &ib->saddr, NULL, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
diff --git a/ui/vnc.c b/ui/vnc.c
index 6a05d06147..c3dd84026a 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3931,7 +3931,8 @@ static int vnc_display_connect(VncDisplay *vd,
     vd->is_unix = saddr_list->value->type == SOCKET_ADDRESS_TYPE_UNIX;
     sioc = qio_channel_socket_new();
     qio_channel_set_name(QIO_CHANNEL(sioc), "vnc-reverse");
-    if (qio_channel_socket_connect_sync(sioc, saddr_list->value, errp) < 0) {
+    if (qio_channel_socket_connect_sync(sioc, saddr_list->value,
+                                        NULL, errp) < 0) {
         object_unref(OBJECT(sioc));
         return -1;
     }
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 13b5b197f9..bbe0dc0ee0 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -226,7 +226,7 @@ static int inet_listen_saddr(InetSocketAddress *saddr,
         return -1;
     }
 
-    memset(&ai,0, sizeof(ai));
+    memset(&ai,0,sizeof(ai));
     ai.ai_flags = AI_PASSIVE;
     if (saddr->has_numeric && saddr->numeric) {
         ai.ai_flags |= AI_NUMERICHOST | AI_NUMERICSERV;
@@ -282,8 +282,8 @@ static int inet_listen_saddr(InetSocketAddress *saddr,
             e->ai_protocol = IPPROTO_MPTCP;
         }
 #endif
-        getnameinfo((struct sockaddr*)e->ai_addr,e->ai_addrlen,
-                        uaddr,INET6_ADDRSTRLEN,uport,32,
+        getnameinfo((struct sockaddr *)e->ai_addr, e->ai_addrlen,
+                        uaddr, INET6_ADDRSTRLEN, uport, 32,
                         NI_NUMERICHOST | NI_NUMERICSERV);
 
         port_min = inet_getport(e);
@@ -358,7 +358,8 @@ listen_ok:
     ((rc) == -EINPROGRESS)
 #endif
 
-static int inet_connect_addr(const InetSocketAddress *saddr,
+static int inet_connect_addr(const InetSocketAddress *dst_addr,
+                             const InetSocketAddress *src_addr,
                              struct addrinfo *addr, Error **errp)
 {
     int sock, rc;
@@ -371,8 +372,28 @@ static int inet_connect_addr(const InetSocketAddress *saddr,
     }
     socket_set_fast_reuse(sock);
 
+    /* to bind the socket if src_addr is available */
+
+    if (src_addr) {
+        struct sockaddr_in servaddr;
+
+        /* bind to a specific interface in the internet domain */
+        /* to make sure the sin_zero filed is cleared */
+        memset(&servaddr, 0, sizeof(servaddr));
+
+        servaddr.sin_family = AF_INET;
+        servaddr.sin_addr.s_addr = inet_addr(src_addr->host);
+        servaddr.sin_port = 0;
+
+        if (bind(sock, (struct sockaddr *)&servaddr, sizeof(servaddr)) < 0) {
+            error_setg_errno(errp, errno, "Failed to bind socket");
+            return -1;
+        }
+    }
+
     /* connect to peer */
     do {
+
         rc = 0;
         if (connect(sock, addr->ai_addr, addr->ai_addrlen) < 0) {
             rc = -errno;
@@ -380,8 +401,14 @@ static int inet_connect_addr(const InetSocketAddress *saddr,
     } while (rc == -EINTR);
 
     if (rc < 0) {
-        error_setg_errno(errp, errno, "Failed to connect to '%s:%s'",
-                         saddr->host, saddr->port);
+        if (src_addr) {
+            error_setg_errno(errp, errno, "Failed to connect '%s:%s' to "
+                             "'%s:%s'", dst_addr->host, dst_addr->port,
+                             src_addr->host, src_addr->port);
+        } else {
+            error_setg_errno(errp, errno, "Failed to connect '%s:%s'",
+                             dst_addr->host, dst_addr->port);
+        }
         closesocket(sock);
         return -1;
     }
@@ -446,13 +473,14 @@ static struct addrinfo *inet_parse_connect_saddr(InetSocketAddress *saddr,
  *
  * Returns: -1 on error, file descriptor on success.
  */
-int inet_connect_saddr(InetSocketAddress *saddr, Error **errp)
+int inet_connect_saddr(InetSocketAddress *dst_addr,
+                       InetSocketAddress *src_addr, Error **errp)
 {
     Error *local_err = NULL;
     struct addrinfo *res, *e;
     int sock = -1;
 
-    res = inet_parse_connect_saddr(saddr, errp);
+    res = inet_parse_connect_saddr(dst_addr, errp);
     if (!res) {
         return -1;
     }
@@ -462,12 +490,12 @@ int inet_connect_saddr(InetSocketAddress *saddr, Error **errp)
         local_err = NULL;
 
 #ifdef HAVE_IPPROTO_MPTCP
-        if (saddr->has_mptcp && saddr->mptcp) {
+        if (dst_addr->has_mptcp && dst_addr->mptcp) {
             e->ai_protocol = IPPROTO_MPTCP;
         }
 #endif
 
-        sock = inet_connect_addr(saddr, e, &local_err);
+        sock = inet_connect_addr(dst_addr, src_addr, e, &local_err);
         if (sock >= 0) {
             break;
         }
@@ -480,7 +508,7 @@ int inet_connect_saddr(InetSocketAddress *saddr, Error **errp)
         return sock;
     }
 
-    if (saddr->keep_alive) {
+    if (dst_addr->keep_alive) {
         int val = 1;
         int ret = setsockopt(sock, SOL_SOCKET, SO_KEEPALIVE,
                              &val, sizeof(val));
@@ -506,7 +534,7 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
     Error *err = NULL;
 
     /* lookup peer addr */
-    memset(&ai,0, sizeof(ai));
+    memset(&ai, 0, sizeof(ai));
     ai.ai_flags = AI_CANONNAME | AI_V4MAPPED | AI_ADDRCONFIG;
     ai.ai_family = inet_ai_family_from_address(sraddr, &err);
     ai.ai_socktype = SOCK_DGRAM;
@@ -533,7 +561,7 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
     }
 
     /* lookup local addr */
-    memset(&ai,0, sizeof(ai));
+    memset(&ai, 0, sizeof(ai));
     ai.ai_flags = AI_PASSIVE;
     ai.ai_family = peer->ai_family;
     ai.ai_socktype = SOCK_DGRAM;
@@ -574,7 +602,7 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
     }
 
     /* connect to peer */
-    if (connect(sock,peer->ai_addr,peer->ai_addrlen) < 0) {
+    if (connect(sock, peer->ai_addr, peer->ai_addrlen) < 0) {
         error_setg_errno(errp, errno, "Failed to connect to '%s:%s'",
                          addr, port);
         goto err;
@@ -727,7 +755,7 @@ int inet_connect(const char *str, Error **errp)
     InetSocketAddress *addr = g_new(InetSocketAddress, 1);
 
     if (!inet_parse(addr, str, errp)) {
-        sock = inet_connect_saddr(addr, errp);
+        sock = inet_connect_saddr(addr, NULL, errp);
     }
     qapi_free_InetSocketAddress(addr);
     return sock;
@@ -1182,25 +1210,26 @@ int socket_address_parse_named_fd(SocketAddress *addr, Error **errp)
     return 0;
 }
 
-int socket_connect(SocketAddress *addr, Error **errp)
+int socket_connect(SocketAddress *dst_addr, SocketAddress *src_addr, Error **errp)
 {
     int fd;
 
-    switch (addr->type) {
+    switch (dst_addr->type) {
     case SOCKET_ADDRESS_TYPE_INET:
-        fd = inet_connect_saddr(&addr->u.inet, errp);
+        fd = inet_connect_saddr(&dst_addr->u.inet, src_addr ?
+                                &src_addr->u.inet : NULL, errp);
         break;
 
     case SOCKET_ADDRESS_TYPE_UNIX:
-        fd = unix_connect_saddr(&addr->u.q_unix, errp);
+        fd = unix_connect_saddr(&dst_addr->u.q_unix, errp);
         break;
 
     case SOCKET_ADDRESS_TYPE_FD:
-        fd = socket_get_fd(addr->u.fd.str, errp);
+        fd = socket_get_fd(dst_addr->u.fd.str, errp);
         break;
 
     case SOCKET_ADDRESS_TYPE_VSOCK:
-        fd = vsock_connect_saddr(&addr->u.vsock, errp);
+        fd = vsock_connect_saddr(&dst_addr->u.vsock, errp);
         break;
 
     default:
-- 
2.22.3


