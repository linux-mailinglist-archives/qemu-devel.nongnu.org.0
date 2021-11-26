Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F4545EFC0
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 15:18:01 +0100 (CET)
Received: from localhost ([::1]:58806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqc35-0005ds-GA
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 09:17:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <priyankar.jain@nutanix.com>)
 id 1mqc0p-0004Gc-IT
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 09:15:40 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:2374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <priyankar.jain@nutanix.com>)
 id 1mqc0h-0000DS-BA
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 09:15:38 -0500
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AQE9pjq007740;
 Fri, 26 Nov 2021 06:15:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=proofpoint20171006;
 bh=j/i3dtnaKFJe9LDjxs+hhTWvzmO/fJd4w5YBpccswbQ=;
 b=N7RMXXLvIQT4AUP3MJl+lMCdZ9tr3sm3DB++sd2+WaP386HpAXUfLP27jZHXO9VPjfiy
 Oh+H706u1mJ5Fs9Rsu7cQ7fapV9VmUJ4l4r5849h5xExAkvFA5/JZ2i/meEG+PwjvS/l
 ADLmXYkhBk6MS20cvTfypjuorXSo9XcmmcP4eaNLOA6kSI05VimVA8zXwfbnIz+9JplP
 s0qStL5f/CCPH5+qOPo9Pe0STiBov+wmP8A1/DMf3ezjR4JNZ5cLEIkHReURt7+qGqVP
 qAvqOqqQzf4z7g3rglp/vyEAnqK34PxJPen++dq63mPzl85pXKt7+lBx7aqz27dDuPWI sw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3cjpw5gycf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 06:15:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRSZsQyuxNYJTcD3s/imnKKcwKEyTMg5W8N3BvmbpLG2YxKfOwYrdaYgYAnszuLxPtk4PyfBFPN1XbBQxViMolfhtCLWlRUbcspPdKNl1QOF6CObl6dd4w0OkYcsEc36i2b7KRDJmPqbue3dZG3QPr9Z5SmeOGWc+T16Cw3hoUanMITnflbJF3I4nhvW6QJHhN2q+pl5or1J514wWAzKOGj/cPmGLn/PF/ERUM1LuCaxjHPryZRqxAgX8yFmEMkz2sZ51auw/JhZ5aIBbKyof/Jl5CvBey7RfGofaNP3Onxv3/mq0ez5BvkiIxYD1SIgH9ie3UIpUQVvo76eQSwPHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/i3dtnaKFJe9LDjxs+hhTWvzmO/fJd4w5YBpccswbQ=;
 b=FV+titrauoA8crZqa0XYJgxKe/ZUYS6ooka0O7NvVmdbQMP32GC/HrBMRUjuwC7RPBcteot+3ORRYrRtNnKcQZht/ePMP/1vnvZ5QoyW1uuD4b/NS+LoejPO3KouuW6X87G+Z+qMTmj134KevHWluduuiS1Gr1k0SSV7gKdiuc7oz7wlXYplqZIXIXK666ukT+ZZBMB5HXlroJLzUGRZAa/L09/YKf0/G4EUR6IZjXI5EJSn/3T9b/EssuLElAEh1NKNBlwtIfVI31dawfqf+Ly6wKZMyg5f54cM8VaUV2F+9E8I5cZbbq8aTwjCPSfCXjPS0vZYBxMoep3CTb5M2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7496.namprd02.prod.outlook.com (2603:10b6:510:16::12)
 by PH0PR02MB7430.namprd02.prod.outlook.com (2603:10b6:510:b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 26 Nov
 2021 14:15:26 +0000
Received: from PH0PR02MB7496.namprd02.prod.outlook.com
 ([fe80::f9e3:ac9c:d609:691d]) by PH0PR02MB7496.namprd02.prod.outlook.com
 ([fe80::f9e3:ac9c:d609:691d%9]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 14:15:26 +0000
From: Priyankar Jain <priyankar.jain@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] dbus-vmstate: Restrict error checks to registered proxies
 in dbus_get_proxies
Date: Fri, 26 Nov 2021 14:15:17 +0000
Message-Id: <1637936117-37977-1-git-send-email-priyankar.jain@nutanix.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0089.namprd03.prod.outlook.com
 (2603:10b6:a03:331::34) To PH0PR02MB7496.namprd02.prod.outlook.com
 (2603:10b6:510:16::12)
MIME-Version: 1.0
Received: from priyankar-jain.dev.nutanix.com (192.146.154.242) by
 SJ0PR03CA0089.namprd03.prod.outlook.com (2603:10b6:a03:331::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Fri, 26 Nov 2021 14:15:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be609a45-cc85-4510-e117-08d9b0e73173
X-MS-TrafficTypeDiagnostic: PH0PR02MB7430:
X-Microsoft-Antispam-PRVS: <PH0PR02MB74305E441A51BC8CE1B917B283639@PH0PR02MB7430.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Oob-TLC-OOBClassifiers: OLM:199;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r+NpXDImBaP/rG/2iP+4NhgNPEpC1vEianMd/FycTA9BBMLig1pYHycDv3ATkmfEcBru6CyN9hskel9SHrgw+UXXPcJV1hT9sxdCQQiHTIYZziKT+Pv4HdIYSjM2Jz5+HJg/B9E59dpH8UssozDbv2/5eWGAjWLRtAz35FmK4Qf3eaX2fXMofRPZDO6nxE2XRuQrCZzilbigCm5aEn13EURl6GsCeAz9lM1Xld1EMX+hDqDglj/FBvtfNqUt1E3eSKSadhOvwiJ9zbO+KPueIJu1zQWGBbd514KxjaK+RG1RFMoNTODusiOwFMYoodiYhWD5qdKKW2yrL2B/IOLdNExoh4ghGLIg684nkmuunoD6gebu/6ZYzR15qNkeMdSJPvLo0xf1b3tvsZg5DqgWwrMJvw74m24mMBQ92pClJEJP95/uzBwbggsOgo+oaBjyYkZsFiYQ0j7pV6xyZnboRmoBF1xTzF0N2DeIJY1l2xiYwhJQ/T25V6/CAWXP2LE0bVWShRVAZvMB0fadZ/L/Fy98+b99aJmzcNk3Nke0VL3ZVe9pEyNHtYLJDInNlV8lcpKgodK3e3PpQaf1iDskQ3U1tXglWty+Yk1udX69Pb2R6GisdVcsbDQ8oT3nDZmYU0KCH72pWlc+mamuVlRb0Fc2ginhC8HgaaDyckwkJ/F0MvOJsR0iterjJMPlLUdZydrbXpir/ttMijbD0w8oiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7496.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(54906003)(36756003)(4326008)(44832011)(2906002)(2616005)(38100700002)(38350700002)(508600001)(7696005)(52116002)(186003)(83380400001)(66946007)(66556008)(66476007)(6666004)(5660300002)(8936002)(956004)(316002)(86362001)(8676002)(6486002)(26005)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UG9mNXFZRWt3RzVhRzJyN1FVY3E4YXlKR1N3ZXlPT2tZZ0t4M1hYSU5oMHNM?=
 =?utf-8?B?UVdRQWYySmhVQ3EzQlVDcW10VzVTWVppeFdKOUkzd3k0azJDc0RpdmdROTBk?=
 =?utf-8?B?Zmd5T1FpMlQxME91NHhyRUp2T2pkU3pONmphS2R2anUwenZyazhrWktKaWNW?=
 =?utf-8?B?VjZWTmd3TFR3S3FVL05tUDI3SmowamRCZytGV3MwUW0zYS9XV2NicTErYWVD?=
 =?utf-8?B?ZVBpZ3NHOVhqQWRZSmlxM3ZBUkRMaFArbXRGSmdHSEtONFBCa1dacXNWSnF5?=
 =?utf-8?B?U09QeUE1RE5VNkFlU2JydXgvRGpYYjY0Q0xKbXdoU0RLRzVmQnRIMGh1OS81?=
 =?utf-8?B?dlNqYTJMQkRHRmRYTkt0YXdsV0EwSld5eHRTdjZ5L0NEWW9uRG0wNVNacmtm?=
 =?utf-8?B?MkI2a2JmbE5Kb1puV2YwTWJiQ1J1LzJDLzN6TUVwRHF3RE1XOTNrTkluSGMx?=
 =?utf-8?B?SThpRzZkLythelR2czJxQzdOWUdrajY2bVRoVWk4YkdmbFRlSm9QZm9zMDQ5?=
 =?utf-8?B?S25Va0FTbjdHTDJTWklDQkFOVUdWNzVOVVBNSHVmb2tNUmpzS3lhYWZGRGg5?=
 =?utf-8?B?bkx6b01hOGZhYVAvemdWVnRma0NkTGtlU0FuQXpSbThUTWJnaHNURHZUY3RZ?=
 =?utf-8?B?bDFsYTJ0SWFtK0xyTWVlY1FIQndJa2ZnamF5SU9xYWVGYjdjcnl4Q1I5dU40?=
 =?utf-8?B?VTg3cXN0RmQyc2piNXlYaC9PbFNudFIrN2ZLWS9Yd0FoR2JoNlhDeUQ4b1dY?=
 =?utf-8?B?ZWFaTEdXaEJGWWxRV0RQWjhMeVowSUVvSUNVTHAxRjJuNnM0Yzl5dFZ4MkZj?=
 =?utf-8?B?Q3FCUHVpMXlrTzU3VjV2UHYwdkcyQUx1MWgvK3VJMXNqZS9GYjhJa1R6KzF6?=
 =?utf-8?B?bTBRU2xRdklwbGgyVEZRa2RrRGhJNGlidmdUbkdhS3JvNy9Td2JRRUlQTFlB?=
 =?utf-8?B?WWpubHBnL1llZXVtcjkvc3Z2LzNQUjhNNExlcVNYUml1TE4vQWZxeHJBeDQ0?=
 =?utf-8?B?MmtFTVN6Y01BR21EcHlJak5MTlF2R2NQbmpxY1J1T3ZaK25tOXdpYUtjK1BZ?=
 =?utf-8?B?dmxEM3VhVVVVS20xNXAwL1NhNklMOWxqNUc0M1hHczlZak54ZmZyM1BBbnZw?=
 =?utf-8?B?dWJxeGxvZnZNcjNlMjc0dVZqb0h3bjV0ZUFsZHMxdjFkamJTOTZYRHpzYWxW?=
 =?utf-8?B?Rnc0Y2txMzlCc0pZZGt2VzZUekh1UnJZWE1WL1drUHZ0YTc2RGIvRnpDanBo?=
 =?utf-8?B?bGJEWld6MFNkOGt4R05oSUN1cWJjekhDNmkyMW43WE9ReVhva0xYZ0VvS3pC?=
 =?utf-8?B?aDFOV09NMHFlOEFER0tRVkE3RHFrNDVmYVpEZmpzRjlkUitudzJ6WWN0aCtD?=
 =?utf-8?B?b0ZFK2FxY202a2NWaHJPZVc1ZWdncCtvVFYvWXpUNzBvQ2k5SVZzWlc3OWlv?=
 =?utf-8?B?ZGhzUTVmSHlRblYrakszR2VueWMrVko1MEhJNSt5a25qbzB6dWJRdVFpZXI2?=
 =?utf-8?B?S1M1dndtSlZQNDd4VG9YbFQrdjJvVnVPek55clBMUmxUMmVyZ2dNMHlxSjh0?=
 =?utf-8?B?Y0dRcUY5QkZTRWswZ05FZHVxQ0MzNHZjdlRVa3lzeURuSVRHbWdIK205dkhF?=
 =?utf-8?B?SE13NXFhaitONE04WmdROFdaeERxNVJEQ281SVRPaXhtRCtEWjFidlJzaU1Q?=
 =?utf-8?B?aHZ3Wmd5VXVqSWZlNWhYYzJNNXc4Z3pManVTQWRpM0x0bkhiaHY5UGpmZ3lD?=
 =?utf-8?B?MFJPTi81bENzbWpWUDJ2bWt1QytON0FVbGVveWdrSnlrSUlQYmdqZTE2bW43?=
 =?utf-8?B?Wm1pc0ZQT0lObGlOamJzNFZHanJDbWxhZnVpYVBSZTNYR2N6S1ZGTFVFeTNs?=
 =?utf-8?B?dE5sb010cW1YelpLTko1NXNSZlR0aE0wVkZBSGZOMC9HUXo0dTk1bFUzc08r?=
 =?utf-8?B?Ulg3ZG1nQzh0TUNKVFk0SnplMi9ieWY5cW5lZm1HY3V3WnhFTEtqU2RHdlhu?=
 =?utf-8?B?NWtNYU9mVllRend3cUxFS2FCNkJqNm13VlQyTnJBcldpYWJFSW9xNzJkOHNR?=
 =?utf-8?B?RDlrbTFzYnVxM0EvZytCeDFwVm92ZG1UQjJrcm56Y1oyaHJqWmh2Nk5zQkIv?=
 =?utf-8?B?Q2xKY3krcEVWVFN3NEo3K1Rwd1pCMitaV2FnNGpURDBjNmYwZ0hxRjhxQkZI?=
 =?utf-8?B?L1cwdDlQN1ZkTlREd1pOSFhRNDRvSzFsaFJoMDBENlpKVktJaytDMmNoeEQ3?=
 =?utf-8?Q?FFh7rPL4eZyiDRNCRnRRO2+G0ngyDab0wvx9liaNrA=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be609a45-cc85-4510-e117-08d9b0e73173
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7496.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 14:15:26.4751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aDWGWytqhrD2NvSiwEdtXf7hbDlbC4WhvJIQuDgEqmIG4R6Wl6BJ3YIu+n7ivF/3u39Br0Jx5P+FEXjUiOqMok5lI/xkjlwXP6LtEr2MbMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7430
X-Proofpoint-GUID: neLmXSDvfJpFys1VKgOI8FanWKe2L6JO
X-Proofpoint-ORIG-GUID: neLmXSDvfJpFys1VKgOI8FanWKe2L6JO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-26_04,2021-11-25_02,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=priyankar.jain@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Priyankar Jain <priyankar.jain@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The purpose of dbus_get_proxies to construct the proxies corresponding to the
IDs registered to dbus-vmstate.

Currenty, this function returns an error in case there is any failure
while instantiating proxy for "all" the names on dbus.

Ideally this function should error out only if it is not able to find and
validate the proxies registered to the backend otherwise any offending
process(for eg: the process purposefully may not export its Id property on
the dbus) may connect to the dbus and can lead to migration failures.

This commit ensures that dbus_get_proxies returns an error if it is not
able to find and validate the proxies of interest(the IDs registered
during the dbus-vmstate instantiation).

Signed-off-by: Priyankar Jain <priyankar.jain@nutanix.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 backends/dbus-vmstate.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
index 9cfd758c42..57369ec0f2 100644
--- a/backends/dbus-vmstate.c
+++ b/backends/dbus-vmstate.c
@@ -114,14 +114,19 @@ dbus_get_proxies(DBusVMState *self, GError **err)
                     "org.qemu.VMState1",
                     NULL, err);
         if (!proxy) {
-            return NULL;
+            if (err != NULL && *err != NULL) {
+                warn_report("%s: Failed to create proxy: %s",
+                            __func__, (*err)->message);
+                g_clear_error(err);
+            }
+            continue;
         }
 
         result = g_dbus_proxy_get_cached_property(proxy, "Id");
         if (!result) {
-            g_set_error_literal(err, G_IO_ERROR, G_IO_ERROR_FAILED,
-                                "VMState Id property is missing.");
-            return NULL;
+            warn_report("%s: VMState Id property is missing.", __func__);
+            g_clear_object(&proxy);
+            continue;
         }
 
         id = g_variant_dup_string(result, &size);
-- 
2.30.1 (Apple Git-130)


