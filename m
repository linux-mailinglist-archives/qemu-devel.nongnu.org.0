Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7945A4721
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 12:28:39 +0200 (CEST)
Received: from localhost ([::1]:56492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSc0U-0006Ac-6J
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 06:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSblR-00015D-HA; Mon, 29 Aug 2022 06:13:05 -0400
Received: from mail-eopbgr70135.outbound.protection.outlook.com
 ([40.107.7.135]:32646 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSblP-00066Q-OY; Mon, 29 Aug 2022 06:13:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiIJGsYvzv3lLvaxdCqb8orJKvGROXaArw6+wmzONtxKLRVvuSFgDzdLQeItMFFMVUJ/VddAIkL34fVj4XlmSrvRbMqYlnIghsOrp5hH62fEWSa9HaWBhdNdK6EJrQCz8BOjOjY7O9RI/qhVW5b1PseVZy+lTo92LWOJAd6e0cQpaddeMp8ugVOVjYdiEvHTpR2eQ9IpRi71KNnYW+jAvQ4k2jyXsbZ7STXX3lw2Zqkw71NM4OJZzLM6PSgq4WMtB6DjZFDJuxRfQxfwvHg9eTWNEbsBBmbq/fPmNOh1phjzWLfH9NAICPUL+CjHIuGEDGGYuF8sx5GWAJguU5V3xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2iHD9ZuqkW49ytEgmewpRVI1oNPJycke20yFKQs7Oc=;
 b=lEpVo52NYVxtMdIA6Kf8N+3jOZvanE5RjTlZr35+PQAUHm+81vEgtCCikMTlrGeJLLjHjJeeVpDjSBACL+odWEL+99+PeWPtH2TU2bqg3WGs3pOhD9hTAaDhphDhq3KmFneTvEydsuEojswms0Ldk8usg/86QjxPO4NLDgn/hj4COPoPbsmx3aqOQJQSoUSl5CmmlcrDoMKUb2rsV2WIUaGai5vrNMdT6jN9t8m1BnL86QKKt0mvu2yWrSH0eeYyCdfG3VbH2dSgdKuRcz1IxqaoRUUZsaKxJb/nVA+/VrUQYIob67qVZMNny5vNcayoMbZwHNNsbTdT22efjOmDeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2iHD9ZuqkW49ytEgmewpRVI1oNPJycke20yFKQs7Oc=;
 b=e2XaYVZR0xdVYdntWkHzAlkALXAP4LdFYKPudhwHDcp2VDYdKH0zhqRr/7YOUMe1WVbswTVoK4IFpwsz29CMgh5bhfNyzSrfAT1weaYcohTHf9FR8aDiJlKR6ZyQ+ceaBzRdc2LEuGzMR7xr94lxhUMHaXzivefwcFniPr+kYCZurN9ArUKobg6yTGtpmN9CSyblXPvgGiXojqpMoV/xtXBw8ncifiuMiYzAAKZ4G0iVF0ZH8kF/B3bQk8FXlcgz5JfFfcvEIKP3Blaj8MELbpDTSDztKG8UEogyRjeC/7dDfqs35hn+gofZxzsGErMTJ+bpaHDF3Ec2irb9XguHwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DBBPR08MB4725.eurprd08.prod.outlook.com (2603:10a6:10:f5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 10:12:57 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 10:12:57 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v7 05/10] parallels: Use generic infrastructure for BAT
 writing in parallels_co_check()
Date: Mon, 29 Aug 2022 12:12:40 +0200
Message-Id: <20220829101246.343507-6-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829101246.343507-1-alexander.ivanov@virtuozzo.com>
References: <20220829101246.343507-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::14) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfc3c0e1-7b3a-4397-dc2e-08da89a70b2b
X-MS-TrafficTypeDiagnostic: DBBPR08MB4725:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vTcS1J7mPANmzwjf0Sd4Xv2BLvLTdKU73XIeIxe473pBmJ777rfy39zAuKRbHxeS4G0Uy0KKniKfhSsZ8oCF76k4BS7xVyJedVwBDT4xfC1As+0Yd/WRYOmucXZ/LWF9DKH+tURiqb5BD9SWO/h/dsKlDsXuVOLXlWZyY7q9SHrXGGohi275vOLdHBaSpJDKAiBU/vA1u9wmQnSgeavHj23/igTF1b0gFNckljBDt8zq9yqFHBEM0c9LCaUpmQjDhx4F9dEJtL1Yodujoj+V9xuAkV+R6OJSaZ3qpOJHA7waNuPtcLvyVao/ZItxsfozYS1sGZ4qy4FYU2+TJPfkVKFITU7tMJiIL4xIxquIQiVqr20AoZqEM656yk9Yp7gkGXdeIh98IiAPliN3SoMviILsrRl+Q2wQsMsPbKk9Vag4Na00Qg58G9Kvj5H5kZGi1FceQWw5eT3vKYSFX1CmJtFqUxatBmxSk4eCnIcnjsNRwVTd73EFshpXCA7bAucxWUM0TxOYeNkMEPo26MG/q5K3zr5Uhthj8klgm34RkJE3KyN5WUYSazPebF3FKwDcxXDc2mC0kphkikM9fk+W0WWKT/M2cK04zYwgfY+x6oFXBykSEmCoxSI2Bm41MbU/xji/24y9CA7yXwj81UcKb+SLtAgHy+9agDq/l/LW0L/jy9EfXUFPnwOOqxLABBVJNrdBbLoEA0KkUSvA4WHJVomjl6wLO9zoG3akF4cApYHroZaC1E2wLHtMzmz1jgQpP6xIZfowVBF6VfzfUf8MNcDfbiRAkGFp0gG5SfFm6b4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(346002)(376002)(396003)(366004)(136003)(2616005)(316002)(1076003)(36756003)(38350700002)(186003)(38100700002)(86362001)(6916009)(52116002)(83380400001)(2906002)(478600001)(41300700001)(6486002)(66946007)(66556008)(8676002)(4326008)(66476007)(44832011)(6666004)(6512007)(6506007)(5660300002)(8936002)(26005)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?svm0HfQyMUgpTv0uC+mTtJmvbCHT/q2LkZfXw2ole59REeiDggIF03avM0Dq?=
 =?us-ascii?Q?NXpJDY3OcxQsW3FPCXR3IL9odc//wwkf3tbM48JWYd6uZDG2akTgnLBOtb4V?=
 =?us-ascii?Q?ww/cpttH6SCpnxC31Pg9pR33o3F3iKyq+mjOpFO9/w2h07n0yuyHlw9YV2sk?=
 =?us-ascii?Q?sa8fMaRVm8mLWhmu52G1c7MdCC0zPpirL83THs/MzlIQvRuvem/LV4CnsTzi?=
 =?us-ascii?Q?U7Z9PX0XG9Oukv0qh1xEo1CU0/Hzfj8EYPFdL077YiUVMr5pO+j4dhXjFfkd?=
 =?us-ascii?Q?lpUVaOsYQmw7p5Ft/QvTwBxAWiGKKitFMOrjPxU/Ez7WveRAMcRzeQElQ6s2?=
 =?us-ascii?Q?rME4xgDyrZEsqXQbmbNVzeXMfoYmT789SXBvzLCykJx0HJxKHRMxAFvFuL53?=
 =?us-ascii?Q?Jvnjcxlhn+gcopBGDGFpaDvmsIi6/9xKmqS67u6peN8N5A8pkQ+tQ4sNxRiV?=
 =?us-ascii?Q?0N4cQfjgYyYHC+JJle4zc0usxY1uRTJ6b14COckarzseqZAkxDwKcWIJWty1?=
 =?us-ascii?Q?4UOqh73/SCauutEZGv88J9FIErEYIxQRorwMJ5e10+dbx4sr1xnZ75YU6WXB?=
 =?us-ascii?Q?SGCt0deakU3J0Wsz060/w0cMUa4qkYRcbkJwDfyMaZHtk/a5Qg68OVK+pJAn?=
 =?us-ascii?Q?3T1a53rkMsRtVCO6S/0UwJUwKuXy8c6kNOZwFRNNgEf2bpG2GGAA7pJTh7RA?=
 =?us-ascii?Q?Twvpso3oQateNt+A6mDy7jn1r+7sf8TdDOE7UzjgkTThW2vmuDtHJ/DlqSyN?=
 =?us-ascii?Q?qkdff+gjURuZ3BJonQtO7VXEW/ajIvgKQj4gY5kOSYOypjvOx7v2hcO61fZy?=
 =?us-ascii?Q?D5D2wePDaHNZJlnrfNnmMaq1AJwNugDhl5Q1e3FjbCJIU8KLFiJGy6mquz27?=
 =?us-ascii?Q?Bbj4zLLcc1Vc/eaqEKdVeudV3jKCCMB4rjOnTuaOq4HBoJwCtEkMnZZE+R3C?=
 =?us-ascii?Q?H+bFX5VMkOuUGn0tEKJOLhc3pUGwUjAEgr2h58lnbsk2b43GatrHvHKjMcvl?=
 =?us-ascii?Q?dcm+yd9vfuJrjpDpSddVbKGO72G3Mg7Tl2BVuy/FrUXVGMikC9Nn7+HNsXfg?=
 =?us-ascii?Q?1q0abXBHfPe/ns5x9Mh6xjvUPVimbU9ixk+S/cKd+z/goLyfeWMXbZNCQbMs?=
 =?us-ascii?Q?8b2TUNqh2o5snuut9ZwKBqjVV6jJkPAg7ztYnbEewV0Ft/Tqctbo8Dq0vFHA?=
 =?us-ascii?Q?RNxlqfmlhDzpL7Xf/jkEeouSMHK98d6tGlwuXn6acB6q7qr2rDI3sxwii/FA?=
 =?us-ascii?Q?6ROYISLzYTATWDn2YNGHJjeIY/yd3zEBq9VflU241z7BpPGJbpAcV/ij9F1t?=
 =?us-ascii?Q?dPQK7fKWWbsp5IlfPm5uLkpT6mhsoXtsQifugV8GXVjC4G05qPpPF3WQTzMX?=
 =?us-ascii?Q?cBl/tE0Bhf2XShteURlgGd3Ha4KCqm2JqzzL1sIUK1QfSBdR00SEeNhmgnOw?=
 =?us-ascii?Q?euxkzar3yhmNr1U2G/NFHXAuW1okkslABWwBLrw8vbJ5Km5zXJ57mwHAnTfs?=
 =?us-ascii?Q?kI3iiKj4HjGPa7C0vLFs85VfO8oYGl48VA3gKIv0EW25seq5F2XvHKgKAA9L?=
 =?us-ascii?Q?rebtuHswgy3mv53zO6uJNSed9zG/yNEppDlTipf3Jwa+y+k3DnpCFJIKgcxA?=
 =?us-ascii?Q?XJLXZJxKjbC6NF/RuDU2ZWc=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc3c0e1-7b3a-4397-dc2e-08da89a70b2b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 10:12:56.8188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXyd7Vn7v92JvDy97uui5IKcZrQict7T/PAyymhDif4b5NoMUSLgbVprG/NcE1DtzDZDcotlxrNbY31yelgU2/jd5KLigt2B9H78SOt3eu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4725
Received-SPF: pass client-ip=40.107.7.135;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

BAT is written in the context of conventional operations over
the image inside bdrv_co_flush() when it calls
parallels_co_flush_to_os() callback. Thus we should not
modify BAT array directly, but call parallels_set_bat_entry()
helper and bdrv_co_flush() further on. After that there is no
need to manually write BAT and track its modification.

This makes code more generic and allows to split
parallels_set_bat_entry() for independent pieces.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 52a5cce46c..b4a85b8aa7 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -425,9 +425,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 {
     BDRVParallelsState *s = bs->opaque;
     int64_t size, prev_off, high_off;
-    int ret;
+    int ret = 0;
     uint32_t i;
-    bool flush_bat = false;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
@@ -465,9 +464,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                     fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
             res->corruptions++;
             if (fix & BDRV_FIX_ERRORS) {
-                s->bat_bitmap[i] = 0;
+                parallels_set_bat_entry(s, i, 0);
                 res->corruptions_fixed++;
-                flush_bat = true;
             }
             prev_off = 0;
             continue;
@@ -484,15 +482,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         prev_off = off;
     }
 
-    ret = 0;
-    if (flush_bat) {
-        ret = bdrv_co_pwrite_sync(bs->file, 0, s->header_size, s->header, 0);
-        if (ret < 0) {
-            res->check_errors++;
-            goto out;
-        }
-    }
-
     res->image_end_offset = high_off + s->cluster_size;
     if (size > res->image_end_offset) {
         int64_t count;
@@ -523,6 +512,14 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 
 out:
     qemu_co_mutex_unlock(&s->lock);
+
+    if (ret == 0) {
+        ret = bdrv_co_flush(bs);
+        if (ret < 0) {
+            res->check_errors++;
+        }
+    }
+
     return ret;
 }
 
-- 
2.34.1


