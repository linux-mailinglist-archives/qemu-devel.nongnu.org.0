Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C27F3BBA27
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:27:18 +0200 (CEST)
Received: from localhost ([::1]:34218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Ksn-0005lI-As
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0KiD-0002PD-NP; Mon, 05 Jul 2021 05:16:21 -0400
Received: from mail-am6eur05on2098.outbound.protection.outlook.com
 ([40.107.22.98]:14496 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0KiB-00087O-T0; Mon, 05 Jul 2021 05:16:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6mIHVy9HkinqG7BfGCWu8kCG/ErWAqGt4MSGffYL/BuNTRIjp+sFNIC9PyYcJ6wKjQRk++rlDJbEtjTgDCXUJCNw72F4Y5yYxTZQhC5E7BUUxFJKGNZuSbpW6VVB9qDHM+kwVeL12ufsR4wH15GdYEWmThnToPfXO/3Z2ucWlFJ0Fw9iQZuQJrjBnRGaKwkwZoGHaldL38jdsQmzYURIxvcyG9EsB6MX2zWG5Tg0HW1fmT1lZLLi8ACvtTM9G8pXmF4ZTNHrm4/9BOcEqjxpfK2YJQt/+RuHVJ3keqOeOAlN0w3jv9kbRledtmrWxwdz0Nwqam6wdmiYFDeYkvPYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RT8Z248y01LkN/R5oqnFYFUeFaGlpKitjk0b2ZU+Gk=;
 b=kzuXl/VddSQ5MyGpCxx0j8aHTxpqms9fzgXWLV3iX1Ov4VkmeTlcZ0Vd/pOf1N7VkRSwd/XJjrxxYVAhdglgjeEhW/CXd91ZU+qGUu7IB6c63WcHhDgCl+/MrEfXgc/BMEf86zFIhLXYjbZ/kkGh2iTnhbOBA93I8zuu0okz9t4iGGzKwknpzqDH6F4eShnwmJV2nYSnu1nClLKn3gK7xKHyyvgIJWhmvsdynaABj6J4BJO4TWDuon70N3VGlO36q3+nj73PxenNpO8/m/jtB79wF9opmQseuSEP/FofKhsx1JBOtrht6nH9lGPjXdzYhCj9XIq9D9ysWsHo5ZCGSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RT8Z248y01LkN/R5oqnFYFUeFaGlpKitjk0b2ZU+Gk=;
 b=YOfsZPPZ7c3t8PGkTPuEJZqIkH87GxtJIU4rZaufZ/p4g1LNtHBupYSupjiJxlPGRzI2QMtFjdrz+reh3xbuYVBeLfTFp50RMuai4DdT2LqxGAEExRXI9K4j+IxWVRpQwDwSXPwvP0/2GwAAVrQU/MMZ7/PQhZfYBcjCehMd5DU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4533.eurprd08.prod.outlook.com (2603:10a6:20b:b5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.26; Mon, 5 Jul
 2021 09:16:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 5 Jul 2021
 09:16:17 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, jsnow@redhat.com
Subject: [PATCH 12/14] iotests 60: more accurate set dirty bit in qcow2 header
Date: Mon,  5 Jul 2021 12:15:47 +0300
Message-Id: <20210705091549.178335-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210705091549.178335-1-vsementsov@virtuozzo.com>
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR05CA0235.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR05CA0235.eurprd05.prod.outlook.com (2603:10a6:3:fb::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 09:16:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6f8ba82-88ba-4b6b-ebf5-08d93f958b5c
X-MS-TrafficTypeDiagnostic: AM6PR08MB4533:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB45337048EEF6A1B556C386D0C11C9@AM6PR08MB4533.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:256;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uGNpGGcJT5NyFLBtgYy+h/IjsF3s60rweqinMA3CwTNcfmMlEQyxns2y8OdppNEIC5CmK3LjDpgK+8T3m4fhVP5mcQ4uO7i9NeILn0srll3/bvQEc+vSTrt3MFMPHegn2q+RyosE9cKj2oxzmvYTZbkeP9IxcLecrbFmemK+llaqP+ATRUnE3XtLRxY2bDTgSp5+g1OeFkWf3wDdmMY250whyHpoQ2yHeJP2GPytZ3vghwsQ/1xtlI3OYVfz1stFIF4JCtx3dLJd6Mpzfs8idCv4bEfE7R1NcEGc4KTeJsdvCPCVaJP15EfjIoz3a5l8P/JZDsajpx211O45BmFiR8HPQ2f5NcwACx/RzA6+eVEQM3ZBULRDCIWps8OX9WjF8XfVeMD8LTQ1Tbl18KO5dUctcpKygySKIt0UvgoYb81Mf9QFfHZoe2Bmf7/l29B09dA8xS+QAkxL7Ovw4oTIZLi0XS+AYl2347jTafyF6ygMjAihwrOsnXa1PIO5ciUilz0rBJqdHtOjf0bWOMZugwMSu5n/HW06diOBJZMPQIVapiEskyZm9bR9+OfQFWsCPhl4DaIP4+g3wqGJ8/0RF7TTpXJa0PIagfpqQW3t/oLUjMWdDdXLcbaljBGJIlOkFvI/R8ouiwaPFRNnlcfJO4Fxm/nE7+u7bwlvGwvF0JxHeUnXAubs3TK1P2tQKlVpU1Ip8HZCvqhwSjuM7yJ1ty+ES0S45jZD/4OJCVX1RYgpKI6DH+/Aj/aYNqzQSojC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39830400003)(376002)(396003)(52116002)(6916009)(2616005)(5660300002)(66556008)(66476007)(83380400001)(316002)(86362001)(36756003)(956004)(6486002)(478600001)(6506007)(2906002)(4744005)(66946007)(1076003)(6666004)(8936002)(4326008)(186003)(38350700002)(38100700002)(16526019)(6512007)(26005)(8676002)(69590400013)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vibEoozI95ElFQfwarzz4vydrXMBFkdYy6g+vMNT/EbEwb6j5AQ2qHEVwNKF?=
 =?us-ascii?Q?2DBqIAyGC015A+qWCL8C7T9mrFUL2xD/9BvxV6zV4f5DUG4yO2RIq1wa+x7+?=
 =?us-ascii?Q?5gfIKOFcx7RZZBhlGYc0bUZGPzRryRyoWwmX32UD1S5MgonvmHpDZhYp4NyQ?=
 =?us-ascii?Q?wzzmAnY7/RRu2SlBbdAEVrbcQPw8CiEW4B1kDDTXzeFjvXsQuepjoVjd+IlI?=
 =?us-ascii?Q?7gMEXZQMgpfd9VxQU5A94pH7W0cxWCIr+hxcoH0qj2hgNpbv4JqNcmeEi18p?=
 =?us-ascii?Q?gDuzDtrn2DNn15y2WSVeO0ryaz8bPsLqi+68PEqCbgehY0vQVLYetnN9A8I0?=
 =?us-ascii?Q?Yhg2dNfp71s746mEZxyqnJ3xxwvfDXRpCT0fX6mUxPeaTIOw3W+4NvycZFuu?=
 =?us-ascii?Q?6hlqqS2zlxK/ikc/En5H0XheYN5Kv1rkKxqreY9EEPnsD2XLXFn+fY5eyKiW?=
 =?us-ascii?Q?P91I8eUTsrm8w9efu57nzj8PNrUfyo4feuakzG29EruBT2k6R/hEF+Swrzoc?=
 =?us-ascii?Q?tADek0QrZQ+VQjrgI38khaMKMOBMtRVXk/HkesJNb2jPDgMnleI7F2ScmS5z?=
 =?us-ascii?Q?nHEevtwArh5EHsIhEiDRcR0CR6M+R+P4exu3gUijLFYuUd+HIjuaFs6tfgCn?=
 =?us-ascii?Q?qlCCghHWCg3QxGZjyVvH7YQPwotZ6YvfOo4knCEvWfEimGnJJNsWSLdtOz0x?=
 =?us-ascii?Q?67St0y3hFLo436ofPkIX86EUSfmrlePNE3rEomfFCY+uef0wHiassjD8n81e?=
 =?us-ascii?Q?Fc5RQrrGBjD02+0jWre2/mepQQ8yHIaJZjBtsdv7vVy0foh9WIBUSu0BLX6/?=
 =?us-ascii?Q?T6nnQiXfJJc4W46dn8jx4MN5Ya70uo/a1zHyPngwDuhvaZNZouwImMC+uA3l?=
 =?us-ascii?Q?ZpKC4cwv+IHd2F3/zL2PcFk8fasINnbUaF63Y+WENyhRPeK931LmyNLq6LSK?=
 =?us-ascii?Q?62RWLR7inumgC5tdPQh6N4UTSMK2/2IU2BC183ua8cxZYvMeaQbOzAte+qld?=
 =?us-ascii?Q?N9Xv26yygW0Qn8JD0WZVSmSCPRNyAWFuP+p0P7ApdBYZkpcOzHxgEZ1ilDka?=
 =?us-ascii?Q?bk2Zi2diXXg8m63KtYimLbqzk3z8Dgw/E2A/AiN7R+g/nI94fDB2cyyEZuah?=
 =?us-ascii?Q?KaHC5AGWKquO+9YBzB7d1ayg5nfBI7vLNdN6pble0Z8sGNvILnJuYeXoqEyu?=
 =?us-ascii?Q?2toNNg0t1i0FO+Y+o0byys6AdQd1/vI7b7ezcMrPpR1mAf1P6ekqre+buZrC?=
 =?us-ascii?Q?xRDTqi2BHX+KzDSv6Ek7KINVYNtB2xFajuErfBVSr9cC6R69VCqueoAU/K3q?=
 =?us-ascii?Q?ZL+o4yKNQz8S2fuLoXv/f7if?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f8ba82-88ba-4b6b-ebf5-08d93f958b5c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 09:16:17.1938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wh5IWIf+XD5swLupIQtWecuYPa8L3acA+CvnE2tb7vRvGuxLfELXsAsCj1Oh4+3psPegs4610y+rPWwMpYRyN3jUMv4dumIoKZ7fCiVRzSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4533
Received-SPF: pass client-ip=40.107.22.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Don't touch other incompatible bits, like compression-type. This makes
the test pass with IMGOPTS='compression_type=zstd'.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/060 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/060 b/tests/qemu-iotests/060
index d1e3204d4e..df87d600f7 100755
--- a/tests/qemu-iotests/060
+++ b/tests/qemu-iotests/060
@@ -326,7 +326,7 @@ _make_test_img 64M
 # Let the refblock appear unaligned
 poke_file "$TEST_IMG" "$rt_offset"        "\x00\x00\x00\x00\xff\xff\x2a\x00"
 # Mark the image dirty, thus forcing an automatic check when opening it
-poke_file "$TEST_IMG" 72 "\x00\x00\x00\x00\x00\x00\x00\x01"
+$PYTHON qcow2.py "$TEST_IMG" set-feature-bit incompatible 0
 # Open the image (qemu should refuse to do so)
 $QEMU_IO -c close "$TEST_IMG" 2>&1 | _filter_testdir | _filter_imgfmt
 
-- 
2.29.2


