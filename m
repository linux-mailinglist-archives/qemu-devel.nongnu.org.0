Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E3330BEFF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:06:11 +0100 (CET)
Received: from localhost ([::1]:51742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vNi-0001kG-Aq
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:06:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <priyankar.jain@nutanix.com>)
 id 1l6vJk-0000e4-V7
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:02:05 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:31208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <priyankar.jain@nutanix.com>)
 id 1l6vJi-0006xP-Ck
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:02:04 -0500
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 112CqsSr004647; Tue, 2 Feb 2021 05:01:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=proofpoint20171006; bh=lCdze3Gl8m4E0JfPANr0pN8IcMbvGM57Iess/mzYIh0=;
 b=Ip8qvMyf137fZl6yQDhCf+Zs64VgE6PVWpOEbWFwiBr5ilh69mpuG+y51n1/QXeOthae
 eBDj1BKJIQ56OeI2nqWzUnbOqEoM6K6p2uNHRkFRfqXWT3NYzXQH2uiAPJAmPc4AoXct
 E5/M/uuxPrGq5PTCft1xOUPUQDD+oNXzHPYMg/cQtlzM+bI2Hfotu3PpzCFseruhC6QT
 V8EtKbCBp0MOvRdQWf8LgGLdsipe4SaXpB/zpRJFa2vAE69f+YSDAR+b2Hbiz7qDwynz
 wlkWtUu2y+s7WyGhSKx1Z+mxnnjGIEfwQ8FpgVqmxKgslqIaypYLbClVr4yuKtMIBjMw hQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by mx0b-002c1b01.pphosted.com with ESMTP id 36d5vdpb2d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 05:01:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KaE419j7yXGX5qcGrHyLe+njqPmw7SrV1TRKZenLt5A5MfNPnQ2oNe78cx2WV8Ft9zcsCk37jZJk1hOjm+VXn0uNV5Wsh7p8uxzc4C9AmUygZy9ynuUTIpdAqXN5k9vZ0U4i69k1HhacbnZj0qgMSbHv2i5ra3GcgWsHKZmgPWalswU1HuCEg8X3r9uHg6tOtNIp+SgSuwak3bt7spyelMUi8eUYHxrWTc8+ptZVZJUqJ0sKy1GCQ2fJKnFCtgpWdmpvuigNSkVM1m32NlVofa61OJ0JT4Mv/LUKRud2VIxdt32BWwsBBOzI89ppLqpZfNHSZwMu8I+SYvHESOkyzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCdze3Gl8m4E0JfPANr0pN8IcMbvGM57Iess/mzYIh0=;
 b=W3oNg31/YzX7M2pTQSP9+y6Q2E/cphV7vrLc8pCpjsoVeAekiC3KFzlHXe1HVncPtBBxlYg/5c8MFUkDDbImH9wdcU/rYqK1AOosjuXhPYZmu/kYT4KX2QXApNVGOIfjdnIWXFFUxoEjC8Hx/7uZomKI7WT25y7wRBRJMXXolsRf2ZKGMMnVYryx8JpFMVbgPVKBsSySe74gmRBFve1MBWlGvujASkfYZq1rAGnDFSeLxhHRU1eJrRJbMzrYXlGCk1w/x8jJeECaXOEsxzRkbRGdN/7EBTBtIwYhzd/29jfcsoCHTQz1CD0STGF9+ro0B0jra08NKY+/Q+XArcP6Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=nutanix.com;
Received: from SN1PR02MB3822.namprd02.prod.outlook.com (2603:10b6:802:31::32)
 by SN4PR0201MB3582.namprd02.prod.outlook.com (2603:10b6:803:47::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Tue, 2 Feb
 2021 13:01:57 +0000
Received: from SN1PR02MB3822.namprd02.prod.outlook.com
 ([fe80::550f:6427:2444:2f72]) by SN1PR02MB3822.namprd02.prod.outlook.com
 ([fe80::550f:6427:2444:2f72%7]) with mapi id 15.20.3805.027; Tue, 2 Feb 2021
 13:01:57 +0000
From: Priyankar Jain <priyankar.jain@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] dbus-vmstate: Increase the size of input stream buffer used
 during load
Date: Tue,  2 Feb 2021 13:01:46 +0000
Message-Id: <1612270906-153951-1-git-send-email-priyankar.jain@nutanix.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-Originating-IP: [192.146.154.242]
X-ClientProxiedBy: BY5PR16CA0015.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::28) To SN1PR02MB3822.namprd02.prod.outlook.com
 (2603:10b6:802:31::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from priyankar-jain.dev.nutanix.com (192.146.154.242) by
 BY5PR16CA0015.namprd16.prod.outlook.com (2603:10b6:a03:1a0::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend
 Transport; Tue, 2 Feb 2021 13:01:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9fbe7aa-cebd-4b67-676b-08d8c77ab8bb
X-MS-TrafficTypeDiagnostic: SN4PR0201MB3582:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN4PR0201MB3582703C5B857C380AB6B7BF83B59@SN4PR0201MB3582.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Oob-TLC-OOBClassifiers: OLM:118;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MGEE9k/Hqfb7Mb6Myjve/RTo0xEIeXyrtgnD/Xesy66txGOwpKE2d2Vt0oqytrPBTLoVhUhQR1YvwV5YVXk6ooxwpOg7ehjllMmp7NnVmwXhM1e0z/arwcRP+8mKIpFpDD1CHje2Scp3u6SN04Xzl1YMpDu7YxrgtGk+plf+osqg4fUu5Mj5PbL8PDlxYfMWujmToMjDXgpFbhdEDXfQeXNWIPNv1H09Qp3H0tRnO+ULHQWAgz694mTA36F2hZt03Sz3xVXG8S40oqVXX0eTlfHtC5DLQ9yniCJg0tvuxoS8k9RGOXdjY05fAdLtXDD83WL15k2t/nzP2xaUDJWqY/p3KEAcO06gMUIOEFQk6I3Jh2EfRUGGREGH7pefbW3IVorO0nRluk5P22Gs0XQWPRGTSCu4fhngo1V11wt9i4ftTHvdcMiKGVc3DWbrJFPdJSccQnSnRxozNHcMT5/MZpPVaK3nUkdWjL+lpbKX0VevPsoT9fYl+PZYPSz0jfgmvI/uH0tdNjk2hT/8IYJ61w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR02MB3822.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(136003)(346002)(39860400002)(376002)(16526019)(36756003)(186003)(26005)(44832011)(7696005)(66556008)(83380400001)(316002)(478600001)(66946007)(66476007)(54906003)(5660300002)(52116002)(6486002)(8936002)(6666004)(86362001)(2616005)(8676002)(2906002)(4326008)(6916009)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?P8RSUgP4Cx+x0KabfaR2nv4YAZaqrTh+rbFAVvwcLLhy6F7MxZoXgShxuO+U?=
 =?us-ascii?Q?kvlMpIJneRReb0iJeOAJQn4ods8tc152KK2C2KMyDh08zmYhihLGdFChNe7R?=
 =?us-ascii?Q?B7KVr27xSeQve0P+LGsoKen1aUgYUH+74zU22fekTmpb9E5ck35T/zlhQNbM?=
 =?us-ascii?Q?361lMqJkY51/oo/11zccYOr4vlWrIfOBGNNIOJSQ4KHgkZVlCWY1zGm4p65D?=
 =?us-ascii?Q?S3bhcwoU0T0R+5rlHrgkMVBJXmLquDISFe2g5q8lnRUGj+AVk4x6mXM/oEst?=
 =?us-ascii?Q?e/K4jdvMPrVNGUK79bd1Jux1aX2cFFjEufx1JJ0De09gYb65ArtZdRKWhtWx?=
 =?us-ascii?Q?NRQ62gDw8rM/qgg69HF5OHenNIVsTU37gWvQ03tlYLYWe/S/gstT9R2WzoZb?=
 =?us-ascii?Q?+6CcWohRa0zo9xlIQLtXEQ0181mDOeXhBV/1kFeHOJrIuLqxO+TiSPwiTQHY?=
 =?us-ascii?Q?sKfiA8puMxONKa9XXjjJxw9ZwnDWgrpzlgM9w/DXK4oUR2O2r7sSNoQNojDP?=
 =?us-ascii?Q?3/kV6lD1AogK8orI2Hn4BXzGtXkT0E6zpjfchfkB+N4Iuz5kDFPZ3JDhfDC2?=
 =?us-ascii?Q?J9m6Bqu4/JKVJVqEVz4XPrVPWs2gccds/Ov+wuvtZNmu1pwVLJSpJ0IQqqma?=
 =?us-ascii?Q?s1b1QX8RXGiknyyrwbUyZAZL8f7vRwGVVJAvGZZCR9t4rx9nd8dVZqiKiKue?=
 =?us-ascii?Q?uooDduTD93Obpt4Fe7aO1uQ7NpOBxqAWlolFoBtRpUDXB0b1LR72vdy8InbE?=
 =?us-ascii?Q?JgLBHnWuQmvlWTo8WJqtuibByW2KMGNRDOC6q18K+WNlXZ49GJNbFtdCBXYy?=
 =?us-ascii?Q?WrgEps8H33zf6EhHOvsDWSBicYLd8pJb3ecB0IBiV/MrSF3zI4wU5VbA6m+s?=
 =?us-ascii?Q?XTXtsyCfi2wCrijxnILsF3sC5N06wTEmTmxyymhMVj5VtvmjKPP/9gwYX//F?=
 =?us-ascii?Q?o+dpNWn5bTzd8bFBpq8XR9q6BswuCCN4haoDin2WcNbiYdT2WXB2+wrmMLH1?=
 =?us-ascii?Q?GMR8Z72uIT93YStSIo5M2Pcq9485/fP7YHVQ5nPYeNHRxkt2GhHhzM9eo3wL?=
 =?us-ascii?Q?DH0MjpD+?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9fbe7aa-cebd-4b67-676b-08d8c77ab8bb
X-MS-Exchange-CrossTenant-AuthSource: SN1PR02MB3822.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 13:01:57.4180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jwRoolBEtRzKuVeQCeAO9mQUPu13sHFg8NynZSGHODjn151m+ynsQMfbBmaC+yLB5m9eD1qcD1s3gckW1CY7ZfoigxQqZfS9cfoJ5X+I1sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3582
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-02_06:2021-02-02,
 2021-02-02 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=priyankar.jain@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Priyankar Jain <priyankar.jain@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit fixes an issue where migration is failing in the load phase
because of a false alarm about data unavailability.

Following is the error received when the amount of data to be transferred
exceeds the default buffer size setup by G_BUFFERED_INPUT_STREAM(4KiB),
even when the maximum data size supported by this backend is 1MiB
(DBUS_VMSTATE_SIZE_LIMIT):

  dbus_vmstate_post_load: Invalid vmstate size: 4364
  qemu-kvm: error while loading state for instance 0x0 of device 'dbus-vmstate/dbus-vmstate'

This commit sets the size of the input stream buffer used during load to
DBUS_VMSTATE_SIZE_LIMIT which is the maximum amount of data a helper can
send during save phase.
Secondly, this commit makes sure that the input stream buffer is loaded before
checking the size of the data available in it, rectifying the false alarm about
data unavailability.

Signed-off-by: Priyankar Jain <priyankar.jain@nutanix.com>
---
 backends/dbus-vmstate.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
index bd050e8..3b8a116 100644
--- a/backends/dbus-vmstate.c
+++ b/backends/dbus-vmstate.c
@@ -204,6 +204,8 @@ static int dbus_vmstate_post_load(void *opaque, int version_id)
     m = g_memory_input_stream_new_from_data(self->data, self->data_size, NULL);
     s = g_data_input_stream_new(m);
     g_data_input_stream_set_byte_order(s, G_DATA_STREAM_BYTE_ORDER_BIG_ENDIAN);
+    g_buffered_input_stream_set_buffer_size(G_BUFFERED_INPUT_STREAM(s),
+                                            DBUS_VMSTATE_SIZE_LIMIT);
 
     nelem = g_data_input_stream_read_uint32(s, NULL, &err);
     if (err) {
@@ -241,11 +243,23 @@ static int dbus_vmstate_post_load(void *opaque, int version_id)
         }
 
         len = g_data_input_stream_read_uint32(s, NULL, &err);
+        if (len > DBUS_VMSTATE_SIZE_LIMIT) {
+            error_report("%s: Invalid vmstate size: %u", __func__, len);
+            return -1;
+        }
+
+        g_buffered_input_stream_fill(G_BUFFERED_INPUT_STREAM(s), len, NULL,
+                                     &err);
+        if (err) {
+            goto error;
+        }
+
         avail = g_buffered_input_stream_get_available(
             G_BUFFERED_INPUT_STREAM(s));
-
-        if (len > DBUS_VMSTATE_SIZE_LIMIT || len > avail) {
-            error_report("%s: Invalid vmstate size: %u", __func__, len);
+        if (len > avail) {
+            error_report("%s: Not enough data available to load for Id: '%s'. "
+                "Available data size: %lu, Actual vmstate size: %u",
+                __func__, id, avail, len);
             return -1;
         }
 
-- 
1.8.3.1


