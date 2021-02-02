Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F44030C0B8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:06:25 +0100 (CET)
Received: from localhost ([::1]:42210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wK0-0005rh-9H
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:06:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <priyankar.jain@nutanix.com>)
 id 1l6w8r-0005DV-5h
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:54:53 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:8816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <priyankar.jain@nutanix.com>)
 id 1l6w8n-00059h-Pn
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:54:52 -0500
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 112Dpro8013364; Tue, 2 Feb 2021 05:54:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=proofpoint20171006;
 bh=V0lFg2Y5jPSZx/q13O3BxQmgKmGKxuBxp7lqGkPud3M=;
 b=2ey588RKJxRzamrvPDrs8fJ3Sd0/02T9CZq9BTbN3Dq5nzBFstms6Iopb/jPVJJpto7M
 +rpx33SWv5pecjonYKepCwKb2lKG7aZvmUEyUl694MXxUhPKUwPGLqelivZ7yo3xdeMy
 68Inn7C8Sc57ctkgfNmFEt4yM2WmIkGOLl+is5pWappLcvzdtqqnr05xBAQ6xux5PW+7
 hYf9hcp0pNnyKuVpKBTZwTnS61lAxjLoe2/pSxQmUt3icNuaCNwTIN6w1B12raf2Pm5C
 wHoMAOK26pESI2AVvuTVMDaXQT+FQghNFwSgiJPDBSb3RhsU77aI0BuSNnPBZzzUgvNN OQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by mx0b-002c1b01.pphosted.com with ESMTP id 36d7v5xabq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 05:54:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIFMeQVbHvxhPZlV8jzU3j9xEHdelr5IKbPl6KUqK2dZy5gT/FtGNj/CQrfES7EGrMx1zSFxuChBV7jhPtAdWjjfwWCz1E1gSiIdRPYar6onYAxj0zrx/uFh0o/8XM+AtFWxxFad1TICFFMNEwPtCXZSdekm8banAEu0PZehsAnfxZ+kWx6OLe1tGXuaqyWc1lZ+xcFMb5wV/GSBM94caAm7hzV+MMc+6O+Mf9FrXDJ9GhDr2oV7Q4kbjGV4qkUEeXd4zbJCRBU3VJYImeBidSy0p7ESrIZulN3kgg7NUSYIp7eu9D880ia14VnGLWnrYWB3KyQw6hTh2t8M86MR8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0lFg2Y5jPSZx/q13O3BxQmgKmGKxuBxp7lqGkPud3M=;
 b=iABLV+4agS4nKYr3oafkNWFPONoigoXKdyOmGwy+1bk5A3u7MMe++ABXAKlOFaDskqtREbsmLSMwxxcdvxpKFD/5qkWAyWadvcHacdRzaoWU4/CcmG0vdQSJXdEfMUNaIeYdvWfKgdCD1vK1JZicM27EEmy3cdZRXoWnzSmMacb7bitRgibs/LouhH7C3SlHH7zExDAnC+CEGR25EqgHIN3Apg3CR7gDU/1dbn+rost1sZu4L9LsY7koBC0VVAowu1wNhIAtJ7p2HAv8lEyG8QBIXzbjRE4/56f2/QL5oBTO81oSZ1eCw7GnIylxWx0LAylybVIwYLDWy1DU5VLbMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=nutanix.com;
Received: from SN1PR02MB3822.namprd02.prod.outlook.com (2603:10b6:802:31::32)
 by SN6PR02MB5567.namprd02.prod.outlook.com (2603:10b6:805:e5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Tue, 2 Feb
 2021 13:54:46 +0000
Received: from SN1PR02MB3822.namprd02.prod.outlook.com
 ([fe80::550f:6427:2444:2f72]) by SN1PR02MB3822.namprd02.prod.outlook.com
 ([fe80::550f:6427:2444:2f72%7]) with mapi id 15.20.3805.027; Tue, 2 Feb 2021
 13:54:46 +0000
From: Priyankar Jain <priyankar.jain@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] dbus-vmstate: Increase the size of input stream buffer
 used during load
Date: Tue,  2 Feb 2021 13:54:20 +0000
Message-Id: <cdaad4718e62bf22fd5e93ef3e252de20da5c17c.1612273156.git.priyankar.jain@nutanix.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.146.154.242]
X-ClientProxiedBy: SJ0PR05CA0210.namprd05.prod.outlook.com
 (2603:10b6:a03:330::35) To SN1PR02MB3822.namprd02.prod.outlook.com
 (2603:10b6:802:31::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from priyankar-jain.dev.nutanix.com (192.146.154.242) by
 SJ0PR05CA0210.namprd05.prod.outlook.com (2603:10b6:a03:330::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.8 via Frontend
 Transport; Tue, 2 Feb 2021 13:54:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8195c1d7-3735-4e25-5220-08d8c782197f
X-MS-TrafficTypeDiagnostic: SN6PR02MB5567:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR02MB5567630F3A8B766E5A87AFBA83B59@SN6PR02MB5567.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Oob-TLC-OOBClassifiers: OLM:118;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 89BXaIIXqCnv9KXRHqmgD2RCEF8d6+wwZlHbn/laApV6mDBRr/GrIuPFvzKKdoWi/rKEDCpENpzVH5V+a2Mk/ARhYLP4Huynzooq5TqBZIOdnO6cqA5516D0hjxSiM3Z2teqG8gPNro6rbn2+VsOgXlslx+eBTIG0DNMHwhqGH8aGSQ7wlrnQ3+7D7x515sFrO6Dcnh5hx2TaWNLdj6oS8e7DwCkl2U8dK35GArH9M0bbhjVqdn4MjWSCKbxMEn2+xbW0d56ex+Abe29VOPNHI/lhsEQUFrncM7P1qmb3p4qf2drYECSm4LhgRhHdoZ7tWI6Z1G3Pgph09fQi7e1T23typWxCnDmU9TH/KnaLKN5Qe+F/fhqtty4IbeR6wjw99z4eUBwCDBgRRiLqNHMTiSdFpje26vUJLTE3NgkeMKrkfFEtljV1QEkj0z57N1A7pk6/eAXwbZpC4vn86I8H6y1pBmYPRNQHB900n74uqZt6x5PnIU8iXyOicnAM3R+91EdqsJxXKfd5anwqHoHLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR02MB3822.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(346002)(396003)(136003)(39860400002)(6486002)(5660300002)(52116002)(6916009)(66556008)(6666004)(66946007)(316002)(54906003)(7696005)(66476007)(26005)(956004)(2616005)(36756003)(86362001)(8676002)(4326008)(44832011)(16526019)(83380400001)(186003)(2906002)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bnNvVThLNkJxTDUrK2IrYUppbmUvOVRwcitROFVkR05uZC9NZVpYY1F2cDlk?=
 =?utf-8?B?Zm9ERnFXeTBIVThOc0U1TUxjZ1EzL3grdmNUK1BUajFvdVNQajhDb0pCWmdj?=
 =?utf-8?B?TjV5c3V6UzJxOGdCZ1V2cjF1RFR4Mk5OeHo4M1BnaTNOZUtJQys0aStCb1hL?=
 =?utf-8?B?M09RSEtiTGFUNE4wMWJ4Ujc2a3g0QVZrOVJOK3V3cjl0VVQxanZ3NWY0a2ts?=
 =?utf-8?B?QzNLNVBuVkc1L2FaYTRyNXZuZWNjUFZsZjJhR2t2em12RmZxeWxzbDk5WlAw?=
 =?utf-8?B?MGdKN2l0RGU5ZnBSVmVycnhUbFVCUVFVTitJSldaOXBiQkMxSHlxSUtFVEFi?=
 =?utf-8?B?ZVBMdHh2WWdsMDBlVWNlOVdjeGNGKzNTY2p6UGxWN2RGdEVwSU41TjRFcU53?=
 =?utf-8?B?ZVBGanJ5QWtiK1BUbURXLzZxL0p0T3lBcDJmdVlKK3VNYzNsWk1iMFlSR3Fm?=
 =?utf-8?B?U3hESzZid3BHdHRsazY5N3A5RXNyZEpXbk43VjB4eTRtZ0dxa0Z1UUZEc2FV?=
 =?utf-8?B?ZWE0OHhnU01ocjB4aGxZU1JjN2R6MlVrbHN0eG1FSFdtbnUzd0JyVTJsSk5D?=
 =?utf-8?B?dmc3OE0rUWlaZFVueThzTWFZOWF0bzZMRXVUZjg1OEtsSFNLbzlJT3Q1YVly?=
 =?utf-8?B?MmxWTWRpTjZ4Uk82VlB5RE1KQVkrNzBMSDJwa2dZWU54cXBkMVdPL3dZZkQw?=
 =?utf-8?B?Vmlra3RrN2taQlFnSXpoRmplL2FFbm13dGw0VGxCaVE1NkY0MnFIcWtzN1gz?=
 =?utf-8?B?RU9EVjR6Rjh5ZDFWOVpqVy9EeHVJS3BvWlBOaXp3VWR3eVpGSnlDV3k5dGgx?=
 =?utf-8?B?R3QwNmhLdW5xWnNjM1BQbFFMOUlIanU3SUlSeVY5K3JUWWlhZE02Tnh2RHcy?=
 =?utf-8?B?akJDUm9VdDlNNU4xVVBsek5xL3pjQW8wUEw2WVREYlp3VkIwUnlPeFpQOWF1?=
 =?utf-8?B?Q0FpcnAzQmFHTnpzOWphV2ovYWlhSjExY21HNlVscSttZnZMMFBKOUtHN3VM?=
 =?utf-8?B?YzJmcXB2LzJQOUtRU1F2ZTFsak94SXVodzJib3M5ZEQ1ZzNCWmoxVTk2N2lH?=
 =?utf-8?B?WXZQWWxSYjZPVjdJMmJOcnNDQ1BLZEt4OVlJdk00UWhwSEcrSDdtLzVEZW1Q?=
 =?utf-8?B?cDcxT09aQ1VaejNaQmtESFpBOFRIK3FUWGdDWVVGa21vcHkzYkh1aldWTGFK?=
 =?utf-8?B?WHR1TzBubUNBTFRxamVtelhCRENyT3RLRDZLaWpqZWlYNGsxRGNua29Yakx4?=
 =?utf-8?B?K0V3cSsxblNWS3Y0R294Zm5qTk85L0VLZHVSYlJHS1ZPZlBNbXZkVzRrR3pU?=
 =?utf-8?B?ZVdWZTFBS2d5MG1kazJmc0V2akpUVHZEUUVwc2dqVlF5L2VKTExFNFBjWWJU?=
 =?utf-8?B?b3VUd2I1d2lIZENiS2FVOHhSVjY3SWdmSWIrNjgvaGJzampPcnlEV3ZJb2Vj?=
 =?utf-8?Q?yQUexZ23?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8195c1d7-3735-4e25-5220-08d8c782197f
X-MS-Exchange-CrossTenant-AuthSource: SN1PR02MB3822.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 13:54:46.2024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9Socfh5VtxlHxQGcBt0ODVshnb7zjXVv4Q6YPWErXLChlY5/pwMMGJ6C4BGm0Mv6DcZF0cMG3PHKr7n839SyyqJWjrTAahKhJlMI8oN/Ks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5567
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

Fixes: 5010cec2bc87 ("Add dbus-vmstate object")
Signed-off-by: Priyankar Jain <priyankar.jain@nutanix.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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


