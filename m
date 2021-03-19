Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9D2342714
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 21:43:45 +0100 (CET)
Received: from localhost ([::1]:39218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNLyB-0007uz-TH
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 16:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lNLwL-0006Ql-R0; Fri, 19 Mar 2021 16:41:50 -0400
Received: from mail-db8eur05on2115.outbound.protection.outlook.com
 ([40.107.20.115]:11872 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lNLwH-0000km-0b; Fri, 19 Mar 2021 16:41:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PsySnp8vRqagOshp4JcQW4Q4jqckzbKSfERYNbv8Zq3iju4/mmLfkyErmEfmXEgpgoXNFRU96NUlI6VkMtX+PJeT/h8v/YfBRBDN5RA7fFzoCPCOoB8oGJpo2h4fVoBN0Q0MZhCprQOnP++aDv+yjPOZxf/+NSEbuhpjwBeVdsyOXPxpsfM9S6OtBlSu4nLI8FO6C2+1nYeWHeyHSSerZeM44oGeGvMY20eQix5QjGxWAzGb2Gi9jnGU9p4Gppmrzeq0E+RQmi5boatczY3GJ6InuREksRr/90uLarrkzONQN2ykEmdmqFtrjK2nxswi+eog1wZDqZeeTOE56OChHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJi73HmNb7HFsQEkhwi3JG/QGoX0Mn1rKl4+9yU0eJY=;
 b=L/mz7WmcrWVVTHUFCJEx7iMVqOg7NfG+zTuYALJ3qH4kX0IfUJdV6DvzTjZ3QTipuInL63q/jw6+eR5lbMcGLXXSG2BVsMt/rpce+JPYvXe+m1bEGp2oRy+oXpFoRp/REtYL/TkjQ1SHMOTSQM2aHlgcLzsG+Clg5diOB/Vwm6YfGIqQuCXlLAe4U4CJnOas4FUAsACZzTsHm6UwrM0W1GCrFD+5U9z9XX6d2pkzj4cNxYCWE9e3SlLJeSVOd4+t0LT66PY6rqLouztMYIlgwRlUGM1KbrM6sVHQgJLlBz+YDHRkghRUKP+/M/ZrLBSg1ieQchgd4QGcVBHgxGEHcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJi73HmNb7HFsQEkhwi3JG/QGoX0Mn1rKl4+9yU0eJY=;
 b=v0bbACAiEMrc9vxckMtWeF2aHvUSoPb2fFi24xXPkEdiGa7ke8gO9J8rslQJuyE84xB6VWzupmEjdIoy9YlZFzxSTr7WNZhnqgBQmtUl6+eQxy90Xs01xYcwCCpUfr6A4ht2bb8lPRGHmYXUVqJ6QJxpmfNQ7ARW8vW2GuqukJk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6134.eurprd08.prod.outlook.com (2603:10a6:20b:291::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 20:41:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 20:41:41 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 dgilbert@redhat.com, quintela@redhat.com, fam@euphon.net,
 stefanha@redhat.com, jsnow@redhat.com, vsementsov@virtuozzo.com,
 eblake@redhat.com
Subject: [PATCH 0/2] Fix crash if try to remove bitmap on target during
 migration
Date: Fri, 19 Mar 2021 23:41:22 +0300
Message-Id: <20210319204124.364312-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR0402CA0008.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR0402CA0008.eurprd04.prod.outlook.com (2603:10a6:3:d0::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 20:41:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81992e0f-34dd-4aed-54ae-08d8eb17666e
X-MS-TrafficTypeDiagnostic: AS8PR08MB6134:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6134780BA1BD89E120243179C1689@AS8PR08MB6134.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KIwcntLaDHyRFfNQ8XA8pgdg3jAqgmr7PcMPVK0Wlb6o9zSSa25kC52jhk6km4fdSSoxg1hG9E9M9O6a4Q6Ka7KUZ8uo4W3KrAR3WUxKTO0bEVRGKEhXbnG/9zArzU2R4c+u5tNR/yU+136awkSCMs9667yyTX/58ePUK5YshuN22trJG33mxC1scJ67TWV6k9GDOi9aIpoj7b+37f6GwsgwSc0bLdiohIPRCtBeKmibOnjj/tsWejVxkvodxaYWcMTbGs1iy88fRRTYc2+5Lf2HSGpqmAxIq2dmpxSCXFpnWLPK7Ur2S7YSe9x54Bl9bwr3/H6TjX2jro52VOVxCSZImcr2T1Axec9Ltz/OsDwdrSZwxi35/CStudqjHH4Tgtyn1t5dQOTVl71B2Y9zcXJxZKut8NzZUVBAeEhHdBqCwtxTC/iQAvSoeiys6plFt0CsxDK6NKCdOj2Ai424o7/eBWrqbWLuSySNjHgtB/ibxvG4fn7mlQT20/2HLyq+0LZOwZ9uMCJJTQ11OssfsFfIoNwtuDacopKWDina6hhxC6ONUYDlbkQf29DI0w0KQrTark0SoENQIjfGwfktoig6UwAx20gR+yC0GIi37A+5QZmRhhgQ5Ra48Ei1ecHV2x7gxokSdj7VQ0OtKV3PFIDsFgFR/IOe4OBij5ZMXOlG3TQXlQrjAsQ06UKqg1So
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39830400003)(136003)(396003)(346002)(376002)(4744005)(26005)(478600001)(7416002)(66556008)(38100700001)(16526019)(316002)(956004)(2616005)(8936002)(5660300002)(1076003)(2906002)(186003)(36756003)(4326008)(86362001)(69590400012)(83380400001)(6916009)(6666004)(52116002)(8676002)(6506007)(66946007)(6486002)(66476007)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?RxaPQYVA8Pvr76qgsUfGVS7POH6qZpoe4/d00ID+FG7j9b8GXOeA0X6tvpzd?=
 =?us-ascii?Q?8MpGVVPoAi+vVKpPikAIgBj4M/uqW14zUZExbzgoK6HD+bhfoxm5yVx1IFea?=
 =?us-ascii?Q?ESw2L+MYlPmrs3npX8lW7reVokZVCrVbarqVx8vGoMnxRm8cp/AdzCNUIwie?=
 =?us-ascii?Q?i0HdNhHl7MUH6FzPC6fzsuwX1XffM6D9v7+3Ob4FZplbEwRA1FgyyIIBdVdi?=
 =?us-ascii?Q?Dx1MobhpOOQio6FtUEJ0DGBCocZv5UxXUv2SQfj7QkXBL1w++N8DES8ijIP5?=
 =?us-ascii?Q?Ukatw6uRhl10Nc1zGw9lxeRyL7mC0xPJ+eJEXloizWwG7eBY4s3htqVHY0Im?=
 =?us-ascii?Q?I3bVLMxf88lTWMXCzOwYtwSNhVfL/135jYYE+SEzJtbR5N20IkdDgv0DAQLa?=
 =?us-ascii?Q?yPQ1h/Tp/g223+ym1EcFylodt56g5ZxNGMTeEFYyvOtqcdRfg4QYpowEtlQH?=
 =?us-ascii?Q?5uLmt3uPLhaj+r0uAS5Atc4DB8MQpphJ0VU/X+5xlym8skie66gfr3ETnLwy?=
 =?us-ascii?Q?f+QCuaDXZArVFL5wLTeD8Q8/GUIdBd3byLO28doQfpB9HjEo+pMiKNMrtIwd?=
 =?us-ascii?Q?O/c3Y5PfEqs2JEamPs+xyZkJ+F/6j8vfMREfhGhFC3b031pBS9LgctKYucCG?=
 =?us-ascii?Q?2fpWZaF7V8wxSU8wthwwO0YYys/hbyq7gWXOXGThhucXG+COyTif37iC8dUB?=
 =?us-ascii?Q?Kv5DhsKd2YL8jKC+iCokyAZkkVgA4Elp/3FCHhH10pkxowtNEZRMK5W8u08r?=
 =?us-ascii?Q?Xppo2caeSKsnYsungAzwns05u0lb692QUB6Qx0kSEScRR90YSLcx1loOsSvO?=
 =?us-ascii?Q?68jx/QJvlOFNyBjl3DQZbVEOTYW6x716aq0fbl52QZARsvCyJHng673JPOom?=
 =?us-ascii?Q?/PSS5xT/r1J9CnW783PU2tTlDf48YyByGyVzIT9/rNARduuh8rctjkA9HtlT?=
 =?us-ascii?Q?+kND1diM5si9MPpBx+VmrelQfNO/5Lc+0RXv6caoB2/KVtB7UGC4xHVB5/Ql?=
 =?us-ascii?Q?TeMnhhI6AVQAsj8q7lWKBDrRhQdZfAxOg8iVVpdvsQIiwE/HHh85T0F3ZROg?=
 =?us-ascii?Q?x7IiZ+X9HxSfdEuC2w3aKLU2zbqA0RcU/0Rzdi8Nb5Wue9Fd31cFPQKytn5V?=
 =?us-ascii?Q?8pzYiylV2EgaqUBrzSmDq4AYgNSOZmzBgq/NbH3/+11pcgEUIYd+8TLuSe1y?=
 =?us-ascii?Q?8grUHnZU+W6wJjtDnKdsyoiY9kcR/+MIMYtePKShyJWfCBQmSLRqc+BkjcOl?=
 =?us-ascii?Q?RkBdsFJYTUbWTOdkCxmP7T1qT+CDDIyL9qTyPJ2GIAHJ9Q37uEUBJXmVETSt?=
 =?us-ascii?Q?xH07+DQ7qyjNGrUTvYls80+9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81992e0f-34dd-4aed-54ae-08d8eb17666e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 20:41:41.0706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y9Y7Vu/FLkT50IUbsSEHAo9DnZ+4b5JYxc9G+/Vqt13yiwAIiTsLZxaSK9r1aYXF0ddmcdrGEOAh/+NrX+uofvzsO3CKWD0biAji4MFSAf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6134
Received-SPF: pass client-ip=40.107.20.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Hi all!

Bitmaps on source are marked busy during migration.

Enabled bitmaps on target have successor, so they are busy.

But disabled migrated bitmaps are not protected on target. User can
simple remove them and it lead to use-after-free. These bitmaps should
be marked busy.

Vladimir Sementsov-Ogievskiy (2):
  migration/block-dirty-bitmap: make incoming disabled bitmaps busy
  migrate-bitmaps-postcopy-test: check that we can't remove in-flight
    bitmaps

 migration/block-dirty-bitmap.c                         | 6 ++++++
 tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test | 9 +++++++++
 2 files changed, 15 insertions(+)

-- 
2.29.2


