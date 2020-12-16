Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E7A2DBE07
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 10:54:24 +0100 (CET)
Received: from localhost ([::1]:45856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpTVn-0005QJ-Dy
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 04:54:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpTTt-00047C-NO; Wed, 16 Dec 2020 04:52:25 -0500
Received: from mail-eopbgr70090.outbound.protection.outlook.com
 ([40.107.7.90]:24992 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpTTp-0004EF-K2; Wed, 16 Dec 2020 04:52:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGVdPkwMC9fF67aSy0wTbQKDodScJReu/AOv+a2KlJuiWMga9043+z8W+obYdkHzVvHqZMMjsKEFsOpjjiMjVOt7RdcvHg4b1KNFNsJRuyHVWy0qv+3h9WzpmCLmbSbynaEEMj2Fo3kgRYJto6Ewh329XPZ6oVNhfznQ5Wst13VekofElXZIl/vwADD3I550l7PQtc/6jNR/pH0f9vyp61cljaa+L8iUFjwIVGliF/FCQ8uv1sPe2ZI9kAztIjSlA5GTfuVhekf6rJ+lijCYtOPxDLlLobXRKsd2Dbvxh50mFQfFsDxKJRpRWO28DAL7n+FOYse2Z481ff2odJ0M0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URKWY+Fzxm8flyyoESjc6hSqayqlzfzr/SeAwiNytOk=;
 b=bJecyeei96AZPBAWk/xG3cs1MEK+gNC7XWZI7sTV90KHNHqDs3qR3g+JRqXcMp8Mxf8nQw08FVwwWp4o+4Bx/irKirBEgF8qbMk7I0eYI8MVkDVtFdUf0FDibTIlg6Zrx5LUqYKA6skVVsjW/ew7Khqkh/2dGpf+EvrGac6s5d7832UbwDgUh0pYA+NlBXFjwKZKhpIlpFzufCY4kDc7yCco3gXMV1ynxo6eFAfpB9fQgTnlR8fCxZUAkt1JO9gmdKtFrlHu8SrZ9SYL5D1iMrNAOvOQxhwl10zdYYRGZqZDM2tXbjb3vCQhqj3BRBrmtrCAQLQgo+DOAMSGAdAtCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URKWY+Fzxm8flyyoESjc6hSqayqlzfzr/SeAwiNytOk=;
 b=ClxrSP+5R0GvtM5mET7qDzgqFzjFEqXVzm46OfwMXABvJ8wn633IzSIV7F5ZnitpbZYXNPudMrmnoUd+l+o8/So6SKBx2VhA4W3auZIYeYjmwl0aq+W6LaaapLuCgxH8zi5ZyrT4ub/Sgu/2S/7aeHvOBpgSbL6NQnmIxvZMn88=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1713.eurprd08.prod.outlook.com (2603:10a6:203:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Wed, 16 Dec
 2020 09:52:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 09:52:17 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] iotests: filter qom path in 172
Date: Wed, 16 Dec 2020 12:52:03 +0300
Message-Id: <20201216095205.526235-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM3PR05CA0147.eurprd05.prod.outlook.com
 (2603:10a6:207:3::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.92) by
 AM3PR05CA0147.eurprd05.prod.outlook.com (2603:10a6:207:3::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 16 Dec 2020 09:52:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a05edb19-f83b-4b3f-9111-08d8a1a84648
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1713:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB17131FEDFD2C4DE60058EEC9C1C50@AM5PR0801MB1713.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UwRX8N7peUszmnu83DEoVSKThYv+NKGlQ+/iI1IAPsUiVLpflUYq2VyrRrFo9dW/i7LSwlqCTb5JqXeDhBfIujk3yk+MvzX7OhlqZXoKPiECtDhrZuHAXBTlOxsftSmVjbFr8fV7VV5Dp0+/iA4cXjvoFUq5otCHXOeEhvdM4Ji8PNCfzMkvpdmaRCNdAf9ZYyF/QIGVt1QpQgSpKRkCTteWRKQ7aDXfxuku89BXLyGg5BmgB/ND8J9KkHbOALbJLcs34duPKWs9jXe1A03GIeGHtP1NXOYDsubHuJu6UHh53DjmWTHr091XK7gUqs9n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(136003)(376002)(39840400004)(8936002)(316002)(52116002)(5660300002)(6506007)(26005)(8676002)(66476007)(186003)(6486002)(478600001)(16526019)(4744005)(66946007)(107886003)(6512007)(956004)(4326008)(36756003)(66556008)(2906002)(6916009)(83380400001)(6666004)(86362001)(1076003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vf9UfJ2Zn1dIUUlrliNXpn5tcCWE5RI+hYRTKn4XNHAhJDwQgeakQtWKwnCi?=
 =?us-ascii?Q?GEFqcnHPmbgW/7t/95HbZtmApDYtBvn7wFvgJoE4UZYw0K29e6Ion+/N+FMU?=
 =?us-ascii?Q?PfNkVN0+gxNl6E0BwQzfx4SLhJqrRP7AJwuS9MM37pKkfpmJfpnqZP8fmw3F?=
 =?us-ascii?Q?R7aCc508eV9VNvnZIU/7cakbDsukDxQuNKESR9dkZBLUtYgAe9JXs+MwrJ0P?=
 =?us-ascii?Q?FTBoNcPw0c+GwrFxWa4F9DOgq1mLmEOo28fmugRaeo+JNjKNwtqJnWguKVrM?=
 =?us-ascii?Q?FgzZR6n1OYvw5ftmC1b5zYOgQwWGm/XzKbQfMJKLyp+01tXgwuVYOnv+Txgm?=
 =?us-ascii?Q?exG8Opeo1undZUIXz8u3S9/w5gg7C84TQXQCzZY9gLA/swNecaEOtCoR/knJ?=
 =?us-ascii?Q?KibIrPvHShacoaUcDrfafv89uE/9HoTOfFvYAwFzC1N9vXCM84C2DvTdDCmA?=
 =?us-ascii?Q?qrU4wGr4wi9/krix6a5SzGIsjfTk0XPQ0+uP5Joa3MkJov+454SL9QoPKz0j?=
 =?us-ascii?Q?yDONZ433PNDGxS8cC+7Wb5Iu9tazIGpXp1jwBT7HQFfsjPEsIgrUdqsPuZ3j?=
 =?us-ascii?Q?T5N/Q381gFt3gFYr0Y5FSvm/fpjD/WmirfgAcPjW+sNPYeirefW2+ifRLyh8?=
 =?us-ascii?Q?AZNUpf/mn7cefWj1hBjBIjZaHU0QwE/s7gzN/sahRIvqBcJlm8evFcraeRRW?=
 =?us-ascii?Q?mde8sI+nmY8iqG9ibYYMF3aoCzFHlLpVf71HDC0+Qry9DuTr/+eSGG8M3tVU?=
 =?us-ascii?Q?OyR7xvBPgZ2bsWdmwGQ/kN52KAhxyv/m7ZONAKoW1xHcXcwkwP24mbOY6V7A?=
 =?us-ascii?Q?ykBp5+EwFH8PxBzdAYDT7FsP/2xkxZqNJUv9GXRFjB+mRi3xtBGZ/aShZLi3?=
 =?us-ascii?Q?RKU8qA/xlJhx78pFtWsoVl3b/cJXUzltPH5Z0f65q6CMiuaZzOK1FZSNosdO?=
 =?us-ascii?Q?ggNjDb4yfmWYrrNMHadcWsmVPXq6KD+9WyvqNpEL4NspTAi1zZumlG5w7oZZ?=
 =?us-ascii?Q?jnF6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 09:52:17.7598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: a05edb19-f83b-4b3f-9111-08d8a1a84648
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vcid2qcmomJjNZ8F7e699MCCgkj4z5JoeFAoR+K0vmrRCUQUdR4m0jLmllChR/GqLsZD7RTuJswbXieVArv8MhPTpJWgjysnwR6nkJxRKVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1713
Received-SPF: pass client-ip=40.107.7.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

Here are two small patches to improve _filter_qom_path filter and reuse
it for 172 iotest

Vladimir Sementsov-Ogievskiy (2):
  iotests: make _filter_qom_path more strict
  iotests:172: use _filter_qom_path

 tests/qemu-iotests/172           |   2 +-
 tests/qemu-iotests/172.out       | 152 +++++++++++++++----------------
 tests/qemu-iotests/186.out       |  56 ++++++------
 tests/qemu-iotests/common.filter |   2 +-
 4 files changed, 106 insertions(+), 106 deletions(-)

-- 
2.25.4


