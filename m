Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 670A13E00DF
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 14:08:35 +0200 (CEST)
Received: from localhost ([::1]:44774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBFhK-0002Gg-EO
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 08:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFZ8-0007H4-2B
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 08:00:06 -0400
Received: from mail-bn1nam07on2040.outbound.protection.outlook.com
 ([40.107.212.40]:54148 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFZ6-00042X-AF
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 08:00:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AsCCFqDCmomHju/yDprsF2dDa8wd/UwFyJedwc4ucsMYotYDUqazSd2++wG9I7ck9iqq9v/EZ1Q6uL/6yOexENFWtqcryxYgfWcSaKsysOgMM5DuawPwaT4jekuLLfcPyUu82lMz6IPvbj/1rK7uJxR921xt+1H0iFRHougCVNGeeWYzac0rvamT4rmxEPC+J0ChSP0g5IrKRZU1VDayYIizzMj7/oD8+6TK5/FFSrMJ2BHvgUdjIOibtZKtrnC63E7zUwwy6ZqJwkSUrwZhUe9nAaDO7wvcbMNku9C9Z9bckmQJdYj8AHZYK7bvNIfbb8w6a4vESVJFjuncSZEJ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqqYcYCa5N3WYcVTKTqhAtWPJRM3ziCL7YLYm6ABvRI=;
 b=A/6fAOZe2zg87Xa0N/OxjKUnIq4FhPkVgnzy+ADfAtFlARJ5g3ucbH+M/KmmjRBQatAx57kucsNefk+d0dCn+vqH83LTwbyFAiS5xiBxQ+1Q6TuR7ZkbDtdlVR6vmvxR4pAV4WXfUMKC983eIJLmIhHqyo5nQAAo9mPTlNwdrgOpaheIA8EWQ72/FMZVqM25zm+6OCZW3QJMzSdm0gwBWY6eANM+aUbZUTWqhJWQ6AmZCa9PwYYpFCBrkrXRvUtgrKQ7yIfFsNRX1/f79XxTO7NzPDiplkmEJR/kDDExmnPH8bWo97NvDBIRB7SOybmy7rkTXLaxQsGjUPSMrqTltQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqqYcYCa5N3WYcVTKTqhAtWPJRM3ziCL7YLYm6ABvRI=;
 b=3ioZrQ+DAbPQfDnVJxwCZK2Lu8QPXl1okfBSv+va/yDl/S5jezT5Q3e/nta7iqdU1TtOpxDaqZtEw7CNujh5UYGbJFYoaEdOn+IV2bWn6zhSZWWs7etEFlr/QG3On7DcwgCek8ahqtZ23UpJDqXObBszU4WUKDfmx9w7K7u71do=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:26::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 12:00:00 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73%7]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 11:59:59 +0000
From: Ashish Kalra <Ashish.Kalra@amd.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, Thomas.Lendacky@amd.com, brijesh.singh@amd.com,
 dgilbert@redhat.com, ehabkost@redhat.com, dovmurik@linux.vnet.ibm.com,
 tobin@ibm.com, jejb@linux.ibm.com
Subject: [PATCH v4 13/14] migration: for SEV live migration bump downtime
 limit to 1s.
Date: Wed,  4 Aug 2021 11:59:47 +0000
Message-Id: <b1468803a2200c3b5e1f1434eb74302ec4b824c6.1628076205.git.ashish.kalra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1628076205.git.ashish.kalra@amd.com>
References: <cover.1628076205.git.ashish.kalra@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::33) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server.amd.com (165.204.77.1) by
 SA9P221CA0028.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 11:59:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95035378-fcb4-4a94-9eb1-08d9573f621e
X-MS-TrafficTypeDiagnostic: SN1PR12MB2542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB254220190F3D8CE8E4F90F758EF19@SN1PR12MB2542.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:519;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X3y3TenavqHDoxFUMuuv8VqtheTepx3DmnC5iHooRjHINeeDPabsxdgRAgMa/SV38i9ec+DBw4kKWwXSPdUMRodsm+RDqSNJB9LxnT8p/sf6JDohQWapGXI7fS4rB+mF227///gEdZeS7SsUkYpHu85+JkucITc8AiReKlHT8P/kkMnZyXsTfzcRWs/8ZO/cnoV1Lci3hK35A3Ph3G33+IRgfEFnU2s6Tpu0jGsk2wNtYu37lb5kweZK66s+GYwVtKZcozEV+qtzELHMMcYEVWuLEJuupy9Nyr/FUgJc8GR9FXWRvufQIb1VSFbN2zey7XR+BdjgD6xGuo61mPQIp2eoRU386xikJRxxDwEXuljVkIjjlcA0BDSsyjAsZFxD9QughnFYbQnyc5UJOUoOjr9I26ok9PdZglfmvHgepYLLonFaKHmuObG/45SSo4KZjrrl7CdKhoO5q7np42pNzTS4f48pjnrHMfOx3hyjHdAshkT0NUfN1PtSwi112hQbstpL94QjjbAW6UHhMj5j8BJABAN+ZiPmCW5iX9j+4SmBCNQ+nYB6hPRpbZosue0LYWSMsMwI4PvIJiPPgz9ht6V+65ig2EAhXLG0hbBIpMOWSiUo1WOJly7YIxllf4/M2RrH2i9gGc/tfwVC1i41FA5ddqxXzXYsF1pykynYSRcDKv4l5/n5JwAdIXYC/jAhWd9CT9P+5bj6usSC3lfeAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(376002)(39850400004)(366004)(4326008)(83380400001)(66946007)(316002)(2906002)(2616005)(956004)(36756003)(86362001)(6666004)(8936002)(38350700002)(26005)(6916009)(38100700002)(478600001)(5660300002)(8676002)(6486002)(66476007)(66556008)(186003)(7696005)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W+cPx40PZvvp0xDtd/3E3OeZdJawgwK2/PSG0pMY6bRJ7IqIrlthACkkeXg/?=
 =?us-ascii?Q?S5gVvZL30jReZ2w7yJEiO4E5EQVvzIyRCMCkqj6nHwXQ7jmrTRn2+3/7iCg+?=
 =?us-ascii?Q?sEOfdcY+9B415hdgu/crcgwS6Wi7x/oyCLPUFrRM6c46nkVIB6eBDaIcyDwn?=
 =?us-ascii?Q?8YqT1VZZBfZLY1zQsiZo6/lX+HY5nnFVTwIVUTYvJ/ThXgC00FUANlTP+EFn?=
 =?us-ascii?Q?5p4CDfrGLEUMUv9TGEKo8VX7G/SZes3xR4QHozMi0RnNoVv45yKg9bAmhcXo?=
 =?us-ascii?Q?uznw1kr57ymb8wEqn1wg4rJg1+WPM89Hf+P1NJoRoMz1wjEDAhzfQ8SsVANr?=
 =?us-ascii?Q?E+tYif/Xi9LDosFpgBpI/oO0gUPvRBO61XIZHmk9dQzKKHjSx2EPIb1wPWj/?=
 =?us-ascii?Q?w3YBEIACHmn8UK4b5r8hcF8CfafrwQF18lFP9T+CmlnEgc4CXmTFJ+0wr0qy?=
 =?us-ascii?Q?feeUZom2lxI0XQsoUkrN4yRYUUaQznQiWVUIT8mWa1fwNf4BnwOQOLZQX6OM?=
 =?us-ascii?Q?EZuPltuKCJhKOKBLcEyhpzmXuJmwYmguP2Q9iSMEIN5zOxlm+jJy1OVVgXge?=
 =?us-ascii?Q?jurnraztvtMOmVmZQNskWefQcFx/sIlsVyCCrFXyJ+g/SUP1LqmIUuxjsc9v?=
 =?us-ascii?Q?AL1BcvEQT54ES4iZEUuVAcTTcneu8XtN/HdX9NHgIJTEBPdngCaXFl2+CdDF?=
 =?us-ascii?Q?qPeT42CBroimZN0WLa/obAXqqneGQrUQxZTiWbemVIFLZSXVQvT3YHn51L/+?=
 =?us-ascii?Q?A7j1A6OT6W8g3xwJqu/tnmnGgM66uMUZ8G0TutpDG8EGPTjq6QwvtYZaxmB1?=
 =?us-ascii?Q?XufTB0hCDbxJWO2jfJXBSNr1n4w6v0p5K3iqB80bgLRn4oxsuo+8teoyBWMw?=
 =?us-ascii?Q?voWPom+pDxfXpTrXbT5//pfvVOooDBZ+IWwAQDLKLl5T4QOpnriISZQ+gDAh?=
 =?us-ascii?Q?wiufk76SJAREk0TeSdtj+tE3E/DBsdWeDgYgKHyRjx8tpV9J74IqsH0YeXqo?=
 =?us-ascii?Q?ex24Pf2OwrGTfvy/vJ9vZNSMkK2AMlaHxwIdkS3r3HfvF9suQNFIo+POffRN?=
 =?us-ascii?Q?HVY41GCbBVSZt4R6twG9M207Jp42DZFHZqfRC7jdja4VPzJkGL6/uVfB463e?=
 =?us-ascii?Q?eXh3/zDD7JovBsNjelsCEUz2B9XSWKeeDAwD3PJDcRCTC3NrcnSRt26yUSSx?=
 =?us-ascii?Q?FqoWeU7w0qrHp1g35UhJrZDDBLXOI0KYDFqsqeHkWEspMPwLxjN0DkSKIgN8?=
 =?us-ascii?Q?qKGnn9K+gMd90ksUKLMUwtM4360JAAepAEuj7KT3kWHmMWsWzVA81kvMoVOZ?=
 =?us-ascii?Q?f00xwTDFwM9DVH+n6evitJcw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95035378-fcb4-4a94-9eb1-08d9573f621e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 11:59:59.2354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QVOITPplZ5tMXg9iG5Lopg6UIjzBXBJwuooW2ssUaS7amu/S6eP4kzp3MgRgFbfCHjemrDsI0DcfEHVedJ8QVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2542
Received-SPF: softfail client-ip=40.107.212.40;
 envelope-from=Ashish.Kalra@amd.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ashish Kalra <ashish.kalra@amd.com>

Now, qemu has a default expected downtime of 300 ms and
SEV Live migration has a page-per-second bandwidth of 350-450 pages
( SEV Live migration being generally slow due to guest RAM pages
being migrated after encryption using the security processor ).
With this expected downtime of 300ms and 350-450 pps bandwith,
the threshold size = <1/3 of the PPS bandwidth = ~100 pages.

Now, this threshold size is the maximum pages/bytes that can be
sent in the final completion phase of Live migration
(where the source VM is stopped) with the expected downtime.
Therefore, with the threshold size computed above,
the migration completion phase which halts the source VM
and then transfers the leftover dirty pages,
is only reached in SEV live migration case when # of dirty pages are ~100.

The dirty-pages-rate with larger guest RAM configuration like 4G, 8G, etc.
is much higher, typically in the range of 300-400+ pages, hence,
we always remain in the "dirty-sync" phase of migration and never
reach the migration completion phase with above guest RAM configs.

To summarize, with larger guest RAM configs,
the dirty-pages-rate > threshold_size (with the default qemu expected downtime of 300ms).

So, the fix is to increase qemu's expected downtime.

This is a tweakable parameter which can be set using "migrate_set_downtime".

With a downtime of 1 second, we get a threshold size of ~350-450 pages,
which will handle the "dirty-pages-rate" of 300+ pages and complete
the migration process, so we bump the default downtime to 1s in case
of SEV live migration being active.

Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
---
 migration/migration.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index daea3ecd04..c9bc33fb10 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3568,6 +3568,10 @@ static void migration_update_counters(MigrationState *s,
     transferred = current_bytes - s->iteration_initial_bytes;
     time_spent = current_time - s->iteration_start_time;
     bandwidth = (double)transferred / time_spent;
+    if (memcrypt_enabled() &&
+        s->parameters.downtime_limit < 1000) {
+        s->parameters.downtime_limit = 1000;
+    }
     s->threshold_size = bandwidth * s->parameters.downtime_limit;
 
     s->mbps = (((double) transferred * 8.0) /
-- 
2.17.1


