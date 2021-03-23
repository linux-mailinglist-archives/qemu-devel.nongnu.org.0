Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D99F3460A4
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 14:58:54 +0100 (CET)
Received: from localhost ([::1]:57122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhYb-0006BP-G9
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 09:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOhOc-0007Mk-UP; Tue, 23 Mar 2021 09:48:35 -0400
Received: from mail-eopbgr80091.outbound.protection.outlook.com
 ([40.107.8.91]:12455 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOhOX-0001uO-9C; Tue, 23 Mar 2021 09:48:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmnjxO275Gu78nLOj2rLgOwl9fb73bSprYiJIpQ7RrAgNP7cL0VrPTk7FJfxbpyqcE++3gpekvML5PUg9yvXxpE9ZSe03s74CExWqPzmOqziZURaIBrZB+LPzpDkoBnxt7zi59YRZx4D3LGxZ0pQuEFHPd10HmPMugEhLTTcOeATGZXLFXAQfw5Eb4HKQCAXUiWOaDO352LmQ0xvIYQI6vS41dk+0edzM3IcR5l75x0FfQ7wQi2s8GjiAS03ryrR1Pu+6mMAqfI6jd9ubnIQMGLXqabCrgO+28CGTl7rwoNMZqFykJj6nSaGcqtuBp8JA39tPHiXvPHMaPwLz/ASjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpUmSfFN1yxZHU3U53uYlXMOuX7KGRCiX1RJ3BY+FBg=;
 b=H0p19fcIPK3Oe2A9xo0jHxFhL/kVrLuMAwLDPNXYomIweJ+Mx98obV35FvqX6LGbzDZyEALCFJj4ttaga6ihFhbcR5Yd1ffJYvMHIbxRUtmqBrmExAJsHIeQueERmnu0zUP9IfOgLfXBP9QyWGlxrOhh9rcG5eUyQvaKI+j7bK7wMaUf5zNNP01X8vT451Lpwd7qyFedmBMnxKvb5SSQvk/G4VvchdhJf2npG6dnBIdB42wcKif9dxOECE44Zib9Prdx0CpbGRLN6i3qk9BKgQAYYiIRLYgPKkT/AO4KxhDsqpjVv1wdmUuVDXB9hRYPTi9+OUPxPGd1bFLiWlCYWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpUmSfFN1yxZHU3U53uYlXMOuX7KGRCiX1RJ3BY+FBg=;
 b=UGD+rPWKEWZZ/W6Npga0pFA92Eg+5jPfJti0+YECaIw++s2g9NEf5EMDfqjxfX6mSIxvpGOBfB9iMVZtbm2NmHHLQk59X0PxMDgzh7+9bktzf7Kb5RrSiF2OjJoR0LW0KdwNrcZg0dlN+uv6OTW3OyYdT63EZkR2DE2aW8HBKBs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2034.eurprd08.prod.outlook.com (2603:10a6:203:4b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.25; Tue, 23 Mar
 2021 13:48:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 13:48:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, vsementsov@virtuozzo.com,
 mreitz@redhat.com
Subject: [PATCH v3 9/9] MAINTAINERS: update Benchmark util: add git tree
Date: Tue, 23 Mar 2021 16:47:34 +0300
Message-Id: <20210323134734.72930-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210323134734.72930-1-vsementsov@virtuozzo.com>
References: <20210323134734.72930-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR05CA0184.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR05CA0184.eurprd05.prod.outlook.com (2603:10a6:3:f8::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 13:48:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69acf5aa-e226-4384-c689-08d8ee024b02
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2034:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB20346E5BCDBE4361E04895CCC1649@AM5PR0801MB2034.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3yCWI9RXShhq7SJnAMRDDjnDtw/ZMhiDv+XVmtUCqDeLKQFcYzeWjSNlpxtSg688wtPnKl8f3f2/+H3wdgltxagFeJG31LdVlB6D38LDmBsg/r0UpstMqB/1BPrWJCgwACf50uEk+nK7imdtzI1D7cFAbbbXifJlUGy2S5iN18kSwwovZ274Bpfi3F3pkezesI3wGqYNybcyVja1LZ06D6mQAPbqeR6LJsn6bvIGzlFjSiuRSYYrlNLGjF+xCfMgS4gmj0BsRwZdCo2Yz8BGtZK8+nssfTSxaFL80obrg0gMqIBjA0oPBMglolxC+NpVSS5bVaAjHr54P238wnQXFsh5YMIkifyajzqmd+jKndjTwGc/X0hzuxAj/ct5fk4Jq8LyAuDCCNEYEjqDVjFtzWRAwB16sZV2ZZZDIBf2tfpUK07j+NpbBKCe3NyGQTqH4CwmOdg6qzwJ552nZKcBorrYG2Ap8KDfiQURupDASbQ2zClv2eSkretjVt6Pj4BEN07+CVCX4d2/2z35YwwqWmVNz7pY6Bct+Z7w1TGtFwKuX7atj4kiDpoT/VDByVJEI/7Jor23HJvrlz8xXTGXlHfCqzHi3zK+0FcGNMiLhMGISP2OcA6u3pDKUwgJHX4igZTRAl+SFWyLSZbTP91MXAlSlIHmfISSa5ptoEOQ95Sfb0XgNNfhkOKU0/OtuP7rsnYGR4cVDzeaWnw307KBZrn1SuS0DAIv0KQjpPsEXp+kXxVSi3NROxao62XqGsWqMuQ9zFA8qLnoqcCN+VAR5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39830400003)(396003)(376002)(4326008)(186003)(1076003)(6506007)(52116002)(16526019)(966005)(66946007)(316002)(26005)(6512007)(6666004)(8936002)(2616005)(38100700001)(956004)(4744005)(2906002)(8676002)(86362001)(66556008)(66476007)(36756003)(6916009)(69590400012)(6486002)(478600001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0xcWdblCsRMOc0MXW5mJTM5VZ5+l34xaSk0FI3qZOI1M+hIVRUVfoMB6wVH7?=
 =?us-ascii?Q?u4bxyL1L2ANyGSumNEQiY21QTqiDAAwsR3crgbAxH34Rl6nQfJL7crq+RoNZ?=
 =?us-ascii?Q?sovhJES0zIRtRQJ7YFkGckPt7pa1GWYlJyfZVkI6rqf8xs+zS9mx41beKiXL?=
 =?us-ascii?Q?o7PBoD84ElPKV0I6/q86QLv9J4whVIrnb6M8LQM/G+tF4OVkAJ2+dN6+p8g6?=
 =?us-ascii?Q?NWuW5QXJmfKgkpUa4oKmHsbEX/e9JDnaIZP+e7/h6Hc5fRDRcsw4U/B/2JHw?=
 =?us-ascii?Q?XBTQKNTGLqZHUTgXX+XQdLLuEZKg9lJ5PhxoGMbda3Mgz5nNx7kCPQG/SVpt?=
 =?us-ascii?Q?HWI1Ii9WQ5811+RHZUscgrOukpBuAPV4iwU2cu9D51eGTK5yOTorDFS0ElfB?=
 =?us-ascii?Q?HU1qo+AnZYDeSqoUXX7GgV63jOm9+kcQK1dbVhD1vbqL649Zt2wCUIqiKupK?=
 =?us-ascii?Q?FTjmfLgfzSB9x3d0m0rsuFN/HlWV4ZJJ6WWayXCJm4NAp+C1T94+N8s7xLIf?=
 =?us-ascii?Q?Ym82ME9D9KlxG14b6zcw5YjKTMKwb+ciHVFBFK1XAVMX2lXKzzryE5k9FYjD?=
 =?us-ascii?Q?KZlyx/6tjF2ZNYzliwJA6P/IHdhr4Q5Jof0P96PNvB21Gpfu7nhJ5FgbXhQq?=
 =?us-ascii?Q?+t7mqaBRzpdo8NC1xF0rcU5ylndxoDLKs5fixoKPNiwwPgv2eSGniIKYamSe?=
 =?us-ascii?Q?j1qRfHgGfMce6H+PLrxqedlNR2+dc/Ydu3rCWNXMnryId7HFPoRojklfdhYY?=
 =?us-ascii?Q?1ni9Oe49VHb5yvCbZ0JdBngtdjksx0Fb/AcKXdpbV4BG5ED8lLU2KfGEP5q1?=
 =?us-ascii?Q?Hmkj5HwdwwEo/BrNOw0Gj35PDpaacQ+OrT/iOW9wh4QBCP8cTdFRYTb6Bd/E?=
 =?us-ascii?Q?Ozdwlla3HolCqyE4q5QIrya4kvKU2fz16HQV7aKmsA/508J7XNda3P6HwNft?=
 =?us-ascii?Q?55epGIFmLUJKJu0ImJoExHfZ1GI7l9A82VmEpVnrgcu2OlcIgRbg2eZMqOAl?=
 =?us-ascii?Q?fZxFEHqhaNYIRlFw7y5QcljSClAVXpF/d/34J6CB+ypHzfLlm5S0bO4Ecrrv?=
 =?us-ascii?Q?fHd4UkYD+6B7y808ynRYGwyzDvxgpV7cvhnFD9Dt8w9e52xo9TJptW+Z6y87?=
 =?us-ascii?Q?F4tC7Zw8Meag5FwJ9UhRc+q+Pry2aoGXZcLUUAOE+haXc/geOVnd8ZcvK53k?=
 =?us-ascii?Q?MQ1F7dywksbTSj2UQkj5+QSAMRcaxwz9VukWbsZnC6O3Lu2rb0qr9gZkLfaS?=
 =?us-ascii?Q?2PlCqf2/lQyW2K5OCeIjf2au7+ExCODY2L7kHzCD4ePwYGtj9ywisvDU57S0?=
 =?us-ascii?Q?VRu6pWQ8hNPxzK7aHHIfxb3G?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69acf5aa-e226-4384-c689-08d8ee024b02
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 13:48:09.1043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43za1zypgBD6VHJtGDx62DphcnlItubz3eLqiBxmBfgvbXdye1oyLmIC3GitL90D74nWO86pJXcHpfeIbkPg8+BD3NclT86Xcy1SP6MMrjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2034
Received-SPF: pass client-ip=40.107.8.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9147e9a429..7d83d64d14 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2531,6 +2531,7 @@ Benchmark util
 M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
 S: Maintained
 F: scripts/simplebench/
+T: git https://src.openvz.org/scm/~vsementsov/qemu.git simplebench
 
 QAPI
 M: Markus Armbruster <armbru@redhat.com>
-- 
2.29.2


