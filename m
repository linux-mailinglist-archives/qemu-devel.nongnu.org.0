Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7766E2B7195
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 23:30:07 +0100 (CET)
Received: from localhost ([::1]:54104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf9UE-0006Hz-39
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 17:30:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kf9Sr-0005UW-1a; Tue, 17 Nov 2020 17:28:41 -0500
Received: from mail-am6eur05on2113.outbound.protection.outlook.com
 ([40.107.22.113]:46469 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kf9Sn-0005RC-Rl; Tue, 17 Nov 2020 17:28:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYIOR2y2NDmiinaRcPuKwBxEvFceHRbPx4xyehwPDj5mXBamR83+0o6XXgTkBbmGE+DQ0RsFAxf5x0n84PNsprCdEC4w7ZWf1QaonmB/pbX6xYMwyjduywFQHHTjvzsWNJU4skQatx4XSff1lo+zA609P2DHrB/0cDK9qS72cmzMcJiNhwMgXuWUheRdXuYEhW6P+7VwA8BduWZCiv4CgrymCScZ53w7FOeFU5NqDFcM4LBruwa+qgaQGBQHR6JvbDq2gJk+/CLAm4wNBQFXRbmbCrkT3F1POD7qGxZBWrPczH91ijymF3MU/la3hU0KRvOzw46n0cKjh7/LW7VUZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sht2qdMk2odN7Ifl1PsLH0OISQQYPM/wWeJgZuXr6YU=;
 b=kaBPAnW78d+3V895wykmv/TluqXzaAOqpONINvbPkEmZviiIYlOyT1meX2riH8qlvsR6thxy5ODaiqgo+CDp6Ve/hLpATX74/vr2DfHweBQWWgHdWIll194BQ56FvLkkNnjfkC7AiRAIo3a+y/H3eghJTFy/r6ERc0Chj6bVG0vKmQirY2Y7WPI4jXbKCci3Ct3g9KLuSgHYkMybbR3BOR4fHyB3BR26Q7EZGEcd0wEx2rvmcws2mXJxka6VCySel+Fk3eqz7BqYPVsyz68pL+pVohl9h5ZGVsBWgFNq1NZwTLd3XI8A1IwaSaQH5vtnK1lhbbE/xHJuFTtE4MGrgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sht2qdMk2odN7Ifl1PsLH0OISQQYPM/wWeJgZuXr6YU=;
 b=A//VKrjA2aASvaRMGncuWxeLzye1tXuCvGMdTPSuTFlRXOHIDSYEnLC9h2ZNJO80T+pv0gPZJosiKYHiCDOGELi3aug8Ag2ReJQAF7Ibgw8x4La6ZhUTFrpOiAN6fFwOCNPwcZZLPU/GXHKYBr7m35yCJRU3QOaSyi/KVH51PB0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2609.eurprd08.prod.outlook.com (2603:10a6:203:98::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 22:28:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 22:28:32 +0000
To: qemu block <qemu-block@nongnu.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: question about bdrv_replace_node
Message-ID: <54b9259e-1344-b3a4-2f8c-9bd79f950a74@virtuozzo.com>
Date: Wed, 18 Nov 2020 01:28:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.107]
X-ClientProxiedBy: AM0PR02CA0102.eurprd02.prod.outlook.com
 (2603:10a6:208:154::43) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.107) by
 AM0PR02CA0102.eurprd02.prod.outlook.com (2603:10a6:208:154::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Tue, 17 Nov 2020 22:28:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00516f09-fe8c-46ca-35ca-08d88b481dcc
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2609:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2609A0813A63C2C91AD55D03C1E20@AM5PR0802MB2609.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WFlgj4pgoQAgsV0eP7IwojoHEzXL1WqRGE9QMaXdgvUVWsBfl7ddYwSk8Y50zlIegMdThHA8BTqLmP4wVXuSb6n+p7gO4ptjwstz63tXM7AkzEA6lhrA/58hBiWaY1wj6bdc7jrbrKJIMYowAihpnFg2nwG9LK6K/utkx+POxmzAQYdmSlYpDhsCSIu7/YowbAIXyucWU0DJEskzqrg8mphRDk38obD9OmxhqKgJ9TwTVQBQSa9EXtdOmOhUJwdAa2uOK330O+S6q5KftHqRE3e5EC2AKRgodfuFE1dwdIZJQ/np6FM7tZgBNuXZMcR+SChX2Hukdg5PMKrMHw3nKX0pzSVXKPwoB9zZ5HvmoIQeFm//kJ7SPV3turWcPFJO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(39840400004)(136003)(66556008)(2906002)(66476007)(956004)(31696002)(66946007)(83380400001)(186003)(52116002)(26005)(16576012)(31686004)(316002)(16526019)(54906003)(5660300002)(8676002)(7116003)(2616005)(8936002)(6916009)(36756003)(4326008)(478600001)(86362001)(6486002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: ngfNk6m7H1uWv0dLH9waWBGLloa7BJGYkviORn8Y8Dx5qtDfoZH/PN1n4lTT9noiSN9xZxwZB0u+wQmg1JQxPLAtyJqSYrHAnoTEt9UON2a41jF9miZZmDOsA/zG6wn5QNvb+zI63Bec95SHMc1HCBO4pNaZg4Iuo1UKQHfVExxyf8+sJzU9pwMTN47Nejyc8k5lKbY1VcOp1gLTLojXwBv+VfySt5DPGmNypArWS/nNwu9blZDGreFEaC+E1xl66JpI5c8/Bb6WkWntVoFuhhB87SxfTlN7nHdUBcXs4frxXeLnU7Fzjq677y0wY20+vFfR9mM0pbCfkg/PnxcrT6nmOb6RUvZ9b0QpUE/LvxnEr+YAJS3MvCTXFPs2jmHLLD41jJeLbwBb3rp/n3URldtL9BFLxX2fNsPFFfnwoiMyBKQNLlQTqeDXFUCbjiVp+wM7fXR1csIKXwY4VRiW4g4APYTHZ1KGIh0vAy3weDq8zK1AnYfQatZsy13PO+6ATL3N8xtLVb3I0In57ZvA0h0saF/tKC1knEe98IUK6YCILaQA+tkFgwNSjaO4uMIdewSFr/FSC/foPQn4eu8QX0NvlACSRhR+Q8s+kq7A8dFeuOucI2gf3/ncChKigtBT3fTVFm4DTiqnjIIVzFH7tQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00516f09-fe8c-46ca-35ca-08d88b481dcc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 22:28:32.8506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RSGNlYrcj7+YD5CSAY7MrlICwXW0+y6we5s4w8Q2f8XLCrCOf8eLKNYFArXjBZM8W0Kig/fsla8dfEofsN1e2XYZPu1Oty0WaRE0d/3GHi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2609
Received-SPF: pass client-ip=40.107.22.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 17:28:34
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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

Hi!

bdrv_replace_node_common() keeps old node parents in a list and call bdrv_replace_child_noperm() in a loop..

But bdrv_replace_child_noperm() may do aio_poll, which may trigger any graph change, up to freeing child which we keep in a loop.

Actually I've reach something similar with a lot modified code, not sure that it may be reproduced on master. Still, here is a backtrace, to illustrate what I mean:

#0  bdrv_detach_child (child=0x5555557e50e0) at ../block.c:3073
#1  0x0000555555609d53 in bdrv_root_unref_child (child=0x5555557e50e0) at ../block.c:3084
#2  0x0000555555609e57 in bdrv_unref_child (parent=0x55555582de10, child=0x5555557e50e0)
     at ../block.c:3124
#3  0x000055555560db2a in bdrv_close (bs=0x55555582de10) at ../block.c:4728
#4  0x000055555560e7eb in bdrv_delete (bs=0x55555582de10) at ../block.c:5056
#5  0x0000555555610ea6 in bdrv_unref (bs=0x55555582de10) at ../block.c:6409
#6  0x0000555555609d5f in bdrv_root_unref_child (child=0x5555557e00d0) at ../block.c:3085
#7  0x0000555555588122 in blk_remove_bs (blk=0x555555838df0) at ../block/block-backend.c:831
#8  0x00005555555875c0 in blk_delete (blk=0x555555838df0) at ../block/block-backend.c:447
#9  0x0000555555587864 in blk_unref (blk=0x555555838df0) at ../block/block-backend.c:502
#10 0x00005555555aeb84 in block_job_free (job=0x555555839150) at ../blockjob.c:89
#11 0x00005555555caad3 in job_unref (job=0x555555839150) at ../job.c:380
#12 0x00005555555cbc7f in job_exit (opaque=0x555555839150) at ../job.c:894
#13 0x000055555569a375 in aio_bh_call (bh=0x5555558215f0) at ../util/async.c:136
#14 0x000055555569a47f in aio_bh_poll (ctx=0x555555810e90) at ../util/async.c:164
#15 0x00005555556ac65d in aio_poll (ctx=0x555555810e90, blocking=true) at ../util/aio-posix.c:659
#16 0x0000555555639c2b in bdrv_unapply_subtree_drain (child=0x5555557ef080, old_parent=0x555555815050)
     at ../block/io.c:530
#17 0x00005555556062e1 in bdrv_child_cb_detach (child=0x5555557ef080) at ../block.c:1326
#18 0x000055555560918e in bdrv_replace_child_noperm (child=0x5555557ef080, new_bs=0x0) at ../block.c:2779
#19 0x0000555555607f11 in bdrv_replace_child_safe (child=0x5555557ef080, new_bs=0x0, tran=0x7fffffffda08)
     at ../block.c:2189
#20 0x000055555560dfce in bdrv_remove_backing (bs=0x555555815050, tran=0x7fffffffda08) at ../block.c:4884
#21 0x000055555560e3fc in bdrv_replace_node_common (from=0x555555815050, to=0x55555581c1e0,
     auto_skip=false, detach_subchain=true, errp=0x7fffffffda80) at ../block.c:4972
#22 0x000055555560ee57 in bdrv_drop_intermediate (top=0x555555815050, base=0x55555581c1e0,
     backing_file_str=0x55555581c211 "json:{\"driver\": \"test\"}") at ../block.c:5318
#23 0x0000555555583939 in test_drop_intermediate_poll () at ../tests/test-bdrv-drain.c:1822

Here a child is detached which is kept in a updated_children list in bdrv_drop_intermediate(). And we'll crash soon with use-after-free.
I'll try to find a similar reproduce on master, but anyway, it seems to be a wrong design to loop through children with possible intermediate aio_poll..

This problem breaks now my work on trying to move child-replacement to prepare phase of transactional graph updates (to correctly update permissions on new graph).
In short, do several updates with bdrv_replace_child_noperm(), than do permission update. If permission update fails, rollback bdrv_replace_child_noperm() calls in reverse order.

But what to do with unexpected aio_poll? Seems we need a way to do several child replacement operations not triggering any drain-poll and do all needed drain-poll things at the end.. But how to achieve it I have no idea.

Any thoughts?

-- 
Best regards,
Vladimir

