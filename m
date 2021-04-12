Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6262435C61C
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 14:21:51 +0200 (CEST)
Received: from localhost ([::1]:45468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVvZd-0004EG-Ta
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 08:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lVvX7-00036u-0d; Mon, 12 Apr 2021 08:19:13 -0400
Received: from mail-eopbgr60097.outbound.protection.outlook.com
 ([40.107.6.97]:50176 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lVvX4-0003uC-4G; Mon, 12 Apr 2021 08:19:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fvY2eMl8K5t6Mr+bd3bmMP1nOZScBafeoDqCE6IWUwka2/NWn98xy5YHRDUqM8+AdFcbswjo5hUli6MHsuHa55YNBAy4m/ZnXr8Mpzkruy24oEA9tEDg/RqM98uaBkeNI3ZahYhp4YCv47pRQ/+LRa+8Z71apA/ERHKsKgf3tWHtmIVGzSTY4VzoiUvMz5sQe/eyaqaAX4iUJbnoew0kvsDJgZFYnDPSMuwrjWU3wkvPnPZb6fIlr3KG/VxgxdGxrYh4j61Y90lEhwqLwYjAQ5O8ZcYCir3N3S3gAVGSJ2lbtKG2hVT2ICUL6Tt6JjAM53cw6+JgM8T+YPIECBW3DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C926XiycFr4CcJ09XsdJ32YpnmIjLSbLvhUR1hMOxoo=;
 b=kAdO+ecFErJu5NVsGfRKsFqLy9hIQmKU6wNWsQ6cqpe1fzV2gM1kJ0F2NGuyaLujMPX+nTuSq9Lv5fP1YA4Q4T+tSv46G1Q23pA+PjpscD4hcVKCCt4STdng/WrLylAirlwo+9RARF8fAXs9emG/+0OdtXjeIUdMOV2SEUlQg+i+82oZlCBLaTGLcyJ225LOWY3OyryRbbHCIxYNU87olkTq4S26a31Dx5eRKPjLo76+AVfgg/8MMj9HCTxC+PvpE7XihsnPDge42Tbjyj4+GHCizQqlkLfQDd+P1BoPQyIQe1JjQIJOV3ADRekKHJ2JWsaEDbaa8r4QkMyEHpFqAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C926XiycFr4CcJ09XsdJ32YpnmIjLSbLvhUR1hMOxoo=;
 b=IBMfpmtmI/iQv+1HZnQr3E7S7yYZANMDpxYZL8xY6LbtVUlp8v+ru+FnOmefxgpdppgdTZE6oaleuN/tfS20p9wjVPJjidnmlPF36BZfx8UVhdzWuOaY29iRqF1BLbFpS4pSgmM2OzTg63xQRpxR9xJqLengtIN6sKlXmgVY98c=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1907.eurprd08.prod.outlook.com (2603:10a6:203:4a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Mon, 12 Apr
 2021 12:19:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 12:19:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, vsementsov@virtuozzo.com,
 peter.maydell@linaro.org, rvkagan@yandex-team.ru
Subject: [PULL 0/1] NBD fix for 6.0-rc3
Date: Mon, 12 Apr 2021 15:18:45 +0300
Message-Id: <20210412121846.144565-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.212]
X-ClientProxiedBy: ZR0P278CA0153.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.212) by
 ZR0P278CA0153.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:41::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.21 via Frontend Transport; Mon, 12 Apr 2021 12:19:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64a9f1a2-8e97-4d75-9c74-08d8fdad2acf
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1907:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1907B4AF8FCF30C6CEC9E967C1709@AM5PR0801MB1907.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:37;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Eh00hpryTyHxy9ehBP2J8DOQIepT+UG/5iWYIp6eD1TaenPONr49WEqrzeKMU+ON+1df/48yuiP/iR6+kvv5i80n+Y9sRb9A4O/exumteUYMOEwJC3gEmDIvrAXZrGDyrO/Jz1CTzICuo0SakL5mgLu5cyG6fhE1pFb9SHIBgsxoe4XXXUk6rRNTvrqji8h9Ks5zA7OZeRbUwNJTJ6puEUseK3XffDG6JkjbNrjyPs3ZZa+KQJeEnwrL/wSNtVcwgfXaK+CIfk5LMLEZAXhIBDDrQdUKf/kXLBI395xS2HeiQSVZSvOh8KkqYpx2reDTHwhj9Fp6miV1EwyXsb8sjtpjeBZ/ukPN6woZ1/aPAGP4BW8IkIU90+jjh2jL7ZyvLh/wfn9Lb08vCsnx8NyZTZ4l/5sOjWpGs3VNJ7yUpsB/MWVv9nSMb178rJWVrA8eRGbcneMjRtRcg7EIcaiT4cwndmT491J0qK0qwnjcIX8mZTo3r9Q8wUd7ql3dKfNEymEa9OHpAshfzXEZogYzsu3QAjGt2t0cYdna/OiFhSqhQvYSRsMk60nEJepOeH9C2ImkQLjgwRMvhSQXU9JRaIPF5jSxF+GlxksKQFTmRiRLZ6OC1OF+Kgxyt23X18xbJGThEfVjb3Gx+kAKNQ1RLmQL4t0jve7DzJc3BpYY57ODIE9c/xgeRVdu7UpHsmzW/e9RVFHZNnTBjfLLFc1z5yw6EypOY7yHytiichQEYB+7j+qPp2M9pVr6F1/kOCMDnd2biN8ExPRRqhJfx/QzHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(396003)(346002)(376002)(136003)(1076003)(186003)(2906002)(2616005)(83380400001)(4326008)(16526019)(8676002)(5660300002)(956004)(6506007)(36756003)(52116002)(86362001)(6666004)(38350700002)(8936002)(6916009)(69590400012)(66556008)(6512007)(26005)(66476007)(38100700002)(6486002)(478600001)(966005)(316002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bVKXUoM6tqoeQCGHjPnplvyY0xReJuIX/QnuQYkAISeowpII+47SR0HIw5uz?=
 =?us-ascii?Q?ZzOhFO+aWgoRDC+XmoXBbun5I9mTKk4OmWU9LlyEa5XYCMBRG1UOjmZEyJn2?=
 =?us-ascii?Q?K6+tZd/t6GJevC4h43zHhLKYq5i9tDpxHXvVaxARlMiVQ+4KiO3uWxfw2gU2?=
 =?us-ascii?Q?znN7P0RS0NVBRsNpGvChviCRXO7atw9Nh03a95C3hpTiebQg3s23lRCY1TRy?=
 =?us-ascii?Q?nQ4sCwwEOHZJ3B8ylp64uyUU07V4aB3NcINvpFASYFCqzeu9VOn3El646gsU?=
 =?us-ascii?Q?O263uqIxp+J0i9Ls2WueDlvVJHWsvF2lqUD+0FBptaScJzZ7JIIVNHEAVhck?=
 =?us-ascii?Q?/9sm2n17KBwz1FB4KfoDbER4SozQ+s+u4E1po46VwBh9j2aimBzZS6vwHXUA?=
 =?us-ascii?Q?omFBcyG4EJInPWtAw4zB2WHRjKY1rmWn8QUP+OAyXHpu3egDjKM6OWZzdcu8?=
 =?us-ascii?Q?GMcaO08vGRv6SduNX+Bb2/Tw2W1Vq4Zp1Kuomou1o3Ab3UHQEHo366vqjAwH?=
 =?us-ascii?Q?QBt1Um1dOZfQTElfphGu9KR+QL9ys+CyTlN8iLItP25yaTHcDYaPPkJjgfhR?=
 =?us-ascii?Q?ucVG0T5yEVKJFjnO+hSyFkQ8tJgvoeiXfO5S0j4Z0bGHIA58gN2nUy1nZj1+?=
 =?us-ascii?Q?AZZ+z7KMKcp58zuvN7I8LGcFOpd06nlubgfiGsrvR3xyHI34ZrF97eh2sKxD?=
 =?us-ascii?Q?UYNjeiVuzUq6TQewecPiKkrpNp/kASQzVMJHB2/VpPDco9Hkxgm62Fy3roA9?=
 =?us-ascii?Q?O5visEeTwUgG35wnl8Qahl93TfyI5+tRA9OOwYQaoaUS/JnF56Ythuj2XH3V?=
 =?us-ascii?Q?Mpad8yOYnA5IZg3e1YnZqgzfD5HXhaKbkjQV6YPSSxhK4/HnfecKOHoQrrRw?=
 =?us-ascii?Q?SaENjvhk7HLXO82v9v64xv3jwb5ZxFk6t6WwZX+5q6cjghoVUpl1AsJzon9N?=
 =?us-ascii?Q?2Okw+kMjurSb/70oFZW5mZbpjn4k3+41YGJcM7ixriGB6CI21ahiKaaDFbu6?=
 =?us-ascii?Q?OSNkGawgWiYND7aXCAua2XIfhU9x05xbaAC1Cg+HF/W7Q+1z0MH8FiLLdn4N?=
 =?us-ascii?Q?5uB5mpV+Iu0eeY8jB8Hp8cHKn393H1IlVNvf97LZbo/TVCD1yd82X0Yfj5oz?=
 =?us-ascii?Q?BnBeIMmO42QaBHVOywNKFDpG6G2eyJEHxHVNzNiBQcpXctwnaeGucMzCwfyV?=
 =?us-ascii?Q?wlDzn2z3H3/zzGgZPFsCRzfRwCcGY3imwp7CDSHMeL6kkEFthMMg4I28TuSX?=
 =?us-ascii?Q?YI2T0dR40ouXAguNleGzkgPulY1eFChb7uHjzCgnGA4qDXUBoku/bbhJR3SM?=
 =?us-ascii?Q?UIBr/sxcux2PtqJzZg/Z6FIh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a9f1a2-8e97-4d75-9c74-08d8fdad2acf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 12:19:06.6087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: koKP8pMWSaF7ziWpXMQTWzUcs2SBUDACC3xCrLw4k/ykgG6VgDTzVI8ogYjpsHUcYAp/oEBk9qCMy3eRbGMDRgJ0bjE1C5uo3kqau0RnMCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1907
Received-SPF: pass client-ip=40.107.6.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 555249a59e9cdd6b58da103aba5cf3a2d45c899f:

  Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-request' into staging (2021-04-10 16:58:56 +0100)

are available in the Git repository at:

  https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-nbd-2021-04-12

for you to fetch changes up to d3c278b689845558cd9811940436b28ae6afc5d7:

  block/nbd: fix possible use after free of s->connect_thread (2021-04-12 11:56:03 +0300)

----------------------------------------------------------------
One fix of possible use-after-free in NBD block-driver for 6.0-rc3

----------------------------------------------------------------

Note: the tag is signed by a new key, as I've lost the old one. So,
now there are two keys with my name on http://keys.gnupg.net, the elder
is lost. I feel stupid about that :(. Anyway, both keys are not signed by
anybody except for myself. And this is my first pull-request to Qemu,
so, I think some kind of TOFU still applies.

Vladimir Sementsov-Ogievskiy (1):
  block/nbd: fix possible use after free of s->connect_thread

 block/nbd.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

-- 
2.29.2


