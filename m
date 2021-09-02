Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E273FEC4D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 12:40:48 +0200 (CEST)
Received: from localhost ([::1]:56514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLk9H-0006wY-Su
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 06:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLk72-0004C3-GW; Thu, 02 Sep 2021 06:38:28 -0400
Received: from mail-eopbgr30115.outbound.protection.outlook.com
 ([40.107.3.115]:38273 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLk70-0005xI-0R; Thu, 02 Sep 2021 06:38:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQbUFN+x/6VJnCtvNhDbKxdltvsg3cOMSpeICLjChpCbgUBGKSmwod38Cjcn52GLNlde8ozHpajQvCUVdedj13Tv17Ued4xnlgQi1XNjqklMZhyMWE9pT86oS39ug3TSoRsRsYEXzmzSGdll3W7+r/03Wc7+wriUQlGE0YMqysANSj3Eclw7YXa+BMl46BU7xZiY+T0goJ41uO57KHMcoSeu4WDAjIvsu+9pqlHWS6GPIqfjp7Id3KlKjz4/PLWglF07pVS+2kxWHpi5zEZZ/9aGFb/kLR3mJVK9rIPF/mz7Q7aiSpQTSfwcKCEAsJ1nbYGyj/rv15M3HM67juTILA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=tOfqXbW4GVJbtsuK0Vr/J8kvscqeKy+acRjQUPUujYw=;
 b=I3wM3qwqu4eOqfQ0AbO05sp8EfQDRkSix8WCFX4bB67CvJv+xLHdNfytQnaBEg3xvZ53IoX0KLA6koykjqtlKx4TdI24DkrJQMp9Aycq9SToBtQSdGVrZ6b0blIwIiWzpaLROSPVbtwsi43Dyr4ugaA22YEoOX9EtSejwKfB4MNyOcEyvZeQsiemnC+66ARdzcmuvAoKrvla5paghx8hGJTGhkJVdaQYtyf92Nm0cKHDcWUxnwQCRfEozxFmYJRD6HyZvPD5005nVmsKGkTgHuZZHgK8soIc/nOeO4vKCGHHuVGNpRhtzERdqYuMor8zKBIDM+wZ0Yzkb95hIE+7sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOfqXbW4GVJbtsuK0Vr/J8kvscqeKy+acRjQUPUujYw=;
 b=Chj46Euc44AahQUkjl8VcsplFIjVEAJzJFvpF0EWZasLrIT2VpK/29JfWoxKswH0kF6kFQSTBe0Gr57Hfh2WjraPkSooAX4XZGJGVs5do95fq8vtEijCCxHs6MjnsTxwUtU0mTcwiHROtSetOFZ9VJeoW4a+zbP/vBdj3T1/eO0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4472.eurprd08.prod.outlook.com (2603:10a6:20b:bf::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Thu, 2 Sep
 2021 10:38:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 10:38:22 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, rkagan@virtuozzo.com
Subject: [PATCH v6 0/5] block/nbd: drop connection_co
Date: Thu,  2 Sep 2021 13:38:00 +0300
Message-Id: <20210902103805.25686-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0402CA0037.eurprd04.prod.outlook.com
 (2603:10a6:7:7c::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR0402CA0037.eurprd04.prod.outlook.com (2603:10a6:7:7c::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 10:38:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d45e187a-5875-45a6-4bd1-08d96dfdc987
X-MS-TrafficTypeDiagnostic: AM6PR08MB4472:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB447201B9D91A23DB3E107580C1CE9@AM6PR08MB4472.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NhtCDr4AYogHBtaEMwrMFXMcznOBeJaUNAszF3idz1jWMEEzHb+VeojPXqKdI2Os7pDXIlj7XMPHCtNjRsGcCUmU0I+WofnlbH6bmKhEeMKZHYPR7NequXUEBRubLGx6BOucjcHjcTCEwCeV008Up5JevlVEH9zswCBYk7rDIPjwAfbVWU54TpCwWENBlYAGZhZAsO6zdCkEAsas62dGWin3OvdcusX/GefA3cYRPBQe0eKZklL8B95khq2mFIkZ2JT8E/c4okR80+SgkXCPpjZp9PLnHhqUNQSD+itTQyccsgXujdMqwBFrreMtj5drbahGubZvxyFGlZ+v4YRNNCJ24drUMZYanuPpF6h/NaxLCqgjpdKZ1KjpkgSsj1pw/kU/T5unb8iOTJyhNi2QA6uycMrsvqJglYjoBFe5x6oXm6UNCOeYlA/o3P4rkasH6KCyZf6aMVEtGRaONq1HAfc5Snt9chYSNTeWzMSP4J0jqHvxyxXO8hdntYEsialpj2CILObjLWw5nrus2WAU/NNeTycFfEvXH199PZ8m0Ru277JnD7eyCfrRJNz3slQeIgwJuVC8fBy+3epUtH4Qtd97WUCONh8ov8qHql25GAncqBTQfe8v+NBguwF34SC5E9afx2M7/KFOFhzzS7RnhRAM0b5F8HTxbV0e4ELD7VIn67OPLxfjndVHxiz3H9CXmwdwem263qoPEodphRDGSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39840400004)(66476007)(4326008)(26005)(6506007)(66946007)(6666004)(8936002)(1076003)(5660300002)(316002)(83380400001)(186003)(8676002)(6512007)(38100700002)(38350700002)(4744005)(2906002)(107886003)(66556008)(36756003)(6916009)(52116002)(956004)(2616005)(86362001)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ymEIXU859d+KlIIHPW3H70VRZaKeEz9CKgQI/ILT1XMjH9PBUcq/YAEZIete?=
 =?us-ascii?Q?04CaLyNMpCdVs6vojR5bhYOxeEHkrVY2OYImBdjgU7MrgdW97W5ZIGcBBsAS?=
 =?us-ascii?Q?mL25nYFiBubt6hgJ+p93Bfk1jm8NlgY+F/kA5FnAojMu6Dehp64LSiuEAxWr?=
 =?us-ascii?Q?+d6X+i1RfjZvInJaJfjEWWuW7pVt8sWCgL+9x4DMUwQ+GlqZin+ZYyK9kj3K?=
 =?us-ascii?Q?IeUlecJz9HMNcsAXKuqGjQQbTxcm7zp0R+a0uulIeEXPtVg3PWh2F0KuICPs?=
 =?us-ascii?Q?K7cZt1t0H09AIokELpPr2ia18w/KMalDrFlZSifxi24baXL/74K99vL48tMf?=
 =?us-ascii?Q?zFAVHKOwEJr1uSKMP13dS0JWo0zokzivCO/RFyLD4+IXiDYIEd0WfgzlbKDX?=
 =?us-ascii?Q?akjzSQiZgV33MNJULw4TemzI7l7caUsQruCSdtG2VZtha9j4rBRJvGdwwf5w?=
 =?us-ascii?Q?IZHDrpB3bttF4YZacptfTfR/jhC3XQWc6gSDm3vq859mRjn55hOx6cIHXrIN?=
 =?us-ascii?Q?04r+nof+qB1m1lmPd/hXi5kiyJ9dzA8zNaDlbZabCHDfhwVULn/AmhU3pQ7o?=
 =?us-ascii?Q?vpWHmSfxwsMGeJLG4NN3B5VS6invB4GVoVY2KYGp6f34RR0qjOGu3O404FmB?=
 =?us-ascii?Q?S+fALU1LLzemt/aHtxQwqSITZ5rMwbkQns0s2Qi8yljeSyxVh9YU9JBfA3dE?=
 =?us-ascii?Q?ubRlXnK/qDggszV8mQBVzD6oisACCWdhGg6OsM0ephAHeRViftfNRQqbXmyS?=
 =?us-ascii?Q?Ip3zVUhNiNZJ0cgRmfh/QtcSzpp8JxTBhnjN7h1i5dkcjKoPxLUOaR5EajCA?=
 =?us-ascii?Q?1a52xOhTVMcUylsqlUBUPX/O7ZimSHPQvPdd0s5kOBE61zM97YLOWksmBlGo?=
 =?us-ascii?Q?KqS1c1jgq1fc1ePTKvzqgyLeMnGgqAAzIazRkHAGWlRyfUE9cDem3VZ4kCKJ?=
 =?us-ascii?Q?BfnzJGxNGDNnmqmUQ+sM27zMxhkJbbWWAgg4eec0+GYvArJ1e9zWNGhGpvRk?=
 =?us-ascii?Q?FrVeM/czewHJO9XkwRLpW56TgTIE/MuwSlIL3OC8URIiu0CNVMKiUs4AR/wh?=
 =?us-ascii?Q?3ljoba/XtOjGGLshvVS0j5hm30yJuNtESr3HRPcuNVgryVADzsXSLCGdf94J?=
 =?us-ascii?Q?SX4uLtcCFVwUTbuP1FJXO0+jYvaPbbp6Mgs2URnv24kxaxqo3v8gOOWbKyrR?=
 =?us-ascii?Q?xFRqErM/rUgvYEqlAtVXvLt4XSx/L9kd7Ae5bkqmjCjRGFVL/U2fBJpSFArC?=
 =?us-ascii?Q?nNoWLb2OF5NPVhmTnlyc7gSKn0Rmv/GoeMvc90XIE9jJRfJcliWWg58clfkg?=
 =?us-ascii?Q?im5+yPqpRF391w9L+oWSTAtP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d45e187a-5875-45a6-4bd1-08d96dfdc987
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 10:38:22.6270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PTfDndt0nz8eBTLHO5zsyri51Q4qcpgSeNL/w8RVy764NYX4Qytz7jsMSVf0hagVDrgbAjt6OQaxNh77r9mhAAhuL+6/DGddv5uaZsbBoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4472
Received-SPF: pass client-ip=40.107.3.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

v6:
01,02: add Eric's r-b
03: make new interface clearer
04,05: rebased on updated 03

Vladimir Sementsov-Ogievskiy (5):
  block/nbd: nbd_channel_error() shutdown channel unconditionally
  block/nbd: move nbd_recv_coroutines_wake_all() up
  block/nbd: refactor nbd_recv_coroutines_wake_all()
  block/nbd: drop connection_co
  block/nbd: check that received handle is valid

 block/nbd.c  | 412 +++++++++++++++------------------------------------
 nbd/client.c |   2 -
 2 files changed, 121 insertions(+), 293 deletions(-)

-- 
2.29.2


