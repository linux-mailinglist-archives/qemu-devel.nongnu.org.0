Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C767947B1E2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 18:10:49 +0100 (CET)
Received: from localhost ([::1]:56584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzMBU-0002cX-TJ
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 12:10:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mzKq6-00010U-M6
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:44:38 -0500
Received: from mail-vi1eur05on2121.outbound.protection.outlook.com
 ([40.107.21.121]:27986 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mzKq0-0001WG-Jd
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:44:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HkS/lD9TUlHNJp01tEoN0lSjyTl9wQfYvyRmVCG+uU98Uq1oYsizM7WIo7R2r0rFsTlK7Njj6cybfbFHmwqtvB+7Wo3ueBK6Nj7t02f9vLenyH/qdjisLI6TtQRYrzKY7+Z7dWnbsGtN/VQ7udTYbv14ByeszWHNsW1kG1LnkvBGypSh8d+XD6SK0/wlqIojOPH5Y6KA3+dD9/9GYzbQiTSUW1U/d03sOJcjASvUgVn8LUUjSt2ys19IdMY52fYl6Y2UEMI9GLbEp75F/QDWPYza87HhqMkYEL5yRXxYtVHWf21DhcLzpEf2m9Lsv3drDsao8itMj3XVeAgMXk0c1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ceET7mWVgt85HhDwqpfBNu2WzqDqQVWrAVq8F/ZKsU=;
 b=ZhM8aa/u7ebIh4QhqzHVzVXwjGIV08ppg+HpSeo1uNb+NWNNmZ6ocTAyAnc3uWKD99E++TqPPrLq6yMrIY6lIWQeYdkfOxV/MZX2hG3w/AR10B77TeGYTS/IaMXXlT1blF3AN9fVfiXyp+/B7g4x2VOWCFIEeYVGEOf12dY+/aFAQqV85Y0dWkQlHJ3NOxvvIPYUpId0LfSPfgE7F45eLNptUNvUT3bFmKTzo87viPTHe7X1Z03K6gNKUWxRg1zlC/9G1Ac4Z9Nq5pp73bB2jNdmU1xcrS5NLCUjXbEwpWNSpjHcgErQ3MxiOYeLwMqo+PaSQRpus3NrZPD7eXrRXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ceET7mWVgt85HhDwqpfBNu2WzqDqQVWrAVq8F/ZKsU=;
 b=OXhzB/gmrhAqqgFpSfbsPC5AY53s1aEL10GcSVWJ+Ei/l2exH8u8kHJCKJ3jnA3i3rTIopji38YHqFiDoUpXzkBnCRtgVVRCsG35up0hj2Jay+H9C1UwPfA8/7Et/Heef28UGRfaBLa+soCNkYbasXGRfEu3zjni9LrPySpQluU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB9PR08MB6667.eurprd08.prod.outlook.com (2603:10a6:10:2af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Mon, 20 Dec
 2021 15:44:27 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::c1f8:2b2d:9298:7550]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::c1f8:2b2d:9298:7550%4]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 15:44:27 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, armbru@redhat.com, eblake@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH 0/2] qapi/ui: add change-vnc-listen
Date: Mon, 20 Dec 2021 16:44:16 +0100
Message-Id: <20211220154418.1554279-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6PR0202CA0055.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::32) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d61c84aa-9ec3-4491-28d7-08d9c3cf9ae9
X-MS-TrafficTypeDiagnostic: DB9PR08MB6667:EE_
X-Microsoft-Antispam-PRVS: <DB9PR08MB666730378DDAB437A2BF55D5C17B9@DB9PR08MB6667.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QgVEWjg4cuWOTlcW0jaugi2lLvyk3LNR5fIiGrb+3DiF/5tPm22iGOZwnfHap+fKUEkQcwm/f0aZplbLYmK51WbtDp3HD6ksYAjq+FAK6y1vE+5n9uCZjsddeViuddfDTdGyRpUsjgQpwNXn4k9FwNldlYpUjsvQFh5FhFYgAZ44rtnnleb0KBAvdewZoFIKIk9jqizv5Q1z+Ix5JX0Bk5HvJTm1AQJH915+i2lcBXwXdbbAl10Ni0YlW5egtSTeiF8OmRlLqh2PcDZHG6/2jzIzvtH4qj84f1f/AmQLTa4LnjClZyy8nglfxwFhC4ZFKF3wWPX6IGEavN8ip7PcVFLQmnjQKtwbifSnr/Lxc4f/R9m4I+xtMFWqgWUx7usxkY/s1rHfE3obrf28c7XchCNrFk3TX6qxW4xxayp1RKQPapYl772X4n3naFOx5x07MZDE3RfUdPE9Eqzdf3tLtXhTVY+hqBE30VoAKdhHn0xSZY3DdiuqSsGBMTIqDWH4Sximg39EM9CM1J20HH9sojpQb5ZroV9MJzi8OR7Mqzd8dgeVogVa2vgMo19tYiiLJh08yMDAzzlOkcgnYY09vFFq9PTXtzvhIte5GtAr2p7WbflWhmV/ZJydntVZB0D9zVhlXcioitH+x35VCrc89x6FoZlQByPx97Xrw/wNDw9cmnUEggPYwjDDNkZwALk84rlde+iS8nZ+JT/f/00A+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(66476007)(6512007)(316002)(6486002)(4326008)(8936002)(2906002)(8676002)(66946007)(26005)(38100700002)(38350700002)(508600001)(52116002)(2616005)(5660300002)(6916009)(86362001)(1076003)(6506007)(83380400001)(107886003)(6666004)(36756003)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J7jWh31l9jNiSaUsShGeSKyjnEDS8zmZrFeNPDldU+q9qpe/YA3Y6OcWpu6d?=
 =?us-ascii?Q?Y+bMxVigKDHAaiqfGYEJ5CNVzgSUfTYx+DYQzv8Qu4P2KSCeSkWibjaZDTz1?=
 =?us-ascii?Q?8+8ujVoAaIOLT0kk3YpM0Rw/oEkGnQ43aeeUpC1IHX+FPs5m+AwBv16T2rxs?=
 =?us-ascii?Q?lbLZ+qHx3VZwgZGDjFBQpzJQAuoUc0wSPPdPqO8hVLyxUc33oPBzpe3vQ8Nz?=
 =?us-ascii?Q?nOva2qGOhdYvShhK7/tEELeJdifYotsvIlD+2gOXfKtvxjoehi3Uh4f4tQLr?=
 =?us-ascii?Q?rqp7dwy/SF4PfJ1aq0gslFIj/boCw8BBA52fprMCHy5JmqENuM6DCO5F6cCE?=
 =?us-ascii?Q?Sfv7Ybcc9MxD1YNGlQr4PDn7pRuEJCT76+Bt+nbgrEnrxk9Is4RzyK7zHgQ8?=
 =?us-ascii?Q?g+HbpqUmk/O2RDvhMRx4b6I1N5JQ+2Vv58qj9AKcoTxb8b2GZWwPUUOlcIHc?=
 =?us-ascii?Q?+1kzVxud88WUkxk76yfecTIbtn3dCrOvyrU5E3xhy0e/xnIyo8SOpSN7gI0Y?=
 =?us-ascii?Q?7oS1+J9CYGaKXvHkDgZ8fEk07yEyVUsJZ1G4056WRLCJFqjjP9YcdXbiaVdH?=
 =?us-ascii?Q?ItQ7dvaIW+UsfKjQY9CEO0L1ObOl4UFmLYCggjlz3S9ffj/wuGCh4flLBI00?=
 =?us-ascii?Q?h2EwxMgGf6xB9Vq6rQ2YmUuaAN0pkZF96g+5ozZed04dOZtO5e1l46okLB6F?=
 =?us-ascii?Q?PzFU3tu4k0hnfl7g4rmtCJGK0zVmhflLm0ccPga/8lZqrsFI/cESJ4W8QYWy?=
 =?us-ascii?Q?9QfnAcBrN1SG39ascxMwGGdGnEb+pPUxWvcYkFkeZ1m/5HBcsMBxqTXvF98h?=
 =?us-ascii?Q?U50FA4BW63Ia79lG42vHrnNhapqEJgMKKVotoRqV8ek6DVQS8EibfXBVijSQ?=
 =?us-ascii?Q?SGzSISPJ1XbqdVHrYckFYVObS+Q9qplFFVXG2B0L564VTSmXigleW1ZqlXU5?=
 =?us-ascii?Q?j41IwnNTNvd6NJ8HxkDBtLzKgYUXD9DSkKsNivzXOK116SVQoFWaChvO1GTZ?=
 =?us-ascii?Q?WTCfwmnohUSIRo1E3x2WYVWx7vgQSzNwNPwz1eel3V2f9iON33Y+nuHirmzg?=
 =?us-ascii?Q?QQbB7qzvVpBxVk+6CPbA5MpmLPMkFrm07o9cpDmeZsQgJlhetN5pfJzK3d7v?=
 =?us-ascii?Q?ouG6hMKysdilnnuspep48k1NRFUa3KZPQ99rTYjMLQtxly0h/56xYkhPwPfh?=
 =?us-ascii?Q?0628J/oLBTnAQjmf6GL5VOjupyag5eQ/2bZkDSPGCI/v3oIEWtGT9E7+7lQ4?=
 =?us-ascii?Q?Fck+EH8iccKez6yQdb0Z/dKJMCYs5Pk4Lyv4QPCTso6dKbIgiTYlL6s3NPkh?=
 =?us-ascii?Q?kF9wsa6YmkYSrfTdWwGXd5DDDc633i2EB4xu2+EDCAZDgBz15QMlW/QE3u3r?=
 =?us-ascii?Q?tGaOxqscQ6wPuKh46ESQkC7Us6Mhdm9YT4Nzaqg6wtdsUxzQ3s1wlrezrL8n?=
 =?us-ascii?Q?0qojlVYFS1nQYryigse7E2NTos2NetR6KYD0lL/7XwGWjHKDVrP+b3dGfLhN?=
 =?us-ascii?Q?iOdEm4X9HXgRh8Yh4XV+ncs9ThVuHSTfMQnkJpBWM9cdbYcz6G/6kb2zCv9i?=
 =?us-ascii?Q?h0w0c8t2Fc9XBOHyRhwvO5KBWKdSOVR0kRbZyuaBRNK3qBZpDfJPnMNxaEfG?=
 =?us-ascii?Q?64W+NCqfPJKYY3JY+VIHWfuXejzBTcsTENLAMJpYGAHfvdkgRo7ZHEsyrge2?=
 =?us-ascii?Q?Et/9Ig=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d61c84aa-9ec3-4491-28d7-08d9c3cf9ae9
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 15:44:27.5816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EfWcJfKYq0dhi7lwQMrosLV35mYD+3/+kd44uq8Cdgz8yik4T1kEKWMkCnfGiNJ+pEdZZ9xEGqyhIu8XYZCJvWYXTfDPdFG3v26BbgiW1G0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6667
Received-SPF: pass client-ip=40.107.21.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

Recently our customer requested a possibility to change VNC listen port
dynamically.

Happily in Rhel7-based Qemu we already have this possibility: through
deprecated "change" qmp command.

But since 6.0 "change" qmp command was removed, with recommendation to
use change-vnc-password or blockdev-change-medium instead. Of course,
neither of them allow change VNC listen port.

So, let's reimplement the possibility.

Note: now, reconnecting may trigger existing deadlock, as I described
in my message "Re: [PULL 09/11] ui/vnc: clipboard support":
 <973ddebe-14a9-4ba7-c389-7a97d6017237@virtuozzo.com>

Simple hack helps, but I'm not sure it's safe itself:

    diff --git a/ui/vnc.c b/ui/vnc.c
    index 69bbf3b6f6..8c6b378e2e 100644
    --- a/ui/vnc.c
    +++ b/ui/vnc.c
    @@ -1354,12 +1354,12 @@ void vnc_disconnect_finish(VncState *vs)
             /* last client gone */
             vnc_update_server_surface(vs->vd);
         }
    +    vnc_unlock_output(vs);
    +
         if (vs->cbpeer.update.notify) {
             qemu_clipboard_peer_unregister(&vs->cbpeer);
         }
     
    -    vnc_unlock_output(vs);
    -
         qemu_mutex_destroy(&vs->output_mutex);
         if (vs->bh != NULL) {
             qemu_bh_delete(vs->bh);


Vladimir Sementsov-Ogievskiy (2):
  ui/vnc: refactor arrays of addresses to SocketAddressList
  qapi/ui: introduce change-vnc-listen

 docs/about/removed-features.rst |   3 +-
 qapi/ui.json                    |  12 +++
 ui/vnc.c                        | 155 ++++++++++++++++----------------
 3 files changed, 91 insertions(+), 79 deletions(-)

-- 
2.31.1


