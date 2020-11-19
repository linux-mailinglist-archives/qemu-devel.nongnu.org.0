Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5252B8E56
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 10:01:01 +0100 (CET)
Received: from localhost ([::1]:51940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kffoE-0002Sc-QL
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 04:00:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kffdH-0001zP-18
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 03:49:35 -0500
Received: from mail-am6eur05on2115.outbound.protection.outlook.com
 ([40.107.22.115]:12897 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kffdC-0003kS-F7
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 03:49:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kj9vjWaSkZyU8biOpuZhxYW4DEAueiBCFzl7VaIEepDXnGnj6BeUFtbtJas6brJww/qwq0IK3/2u52Ct30GAUCmqBrHcQlwiGu8Gc4YxrppTLoMlRS6ZII+zJqAyt+OXa7XCKvUlM6qOIift2W72cG8DvP7lWs1K7OIqJTL49rNGJQV/Mpw86GnwPRwZ65T7u2Ndk+z81n1sJyS7yB12EpImDRMJD+96O8qpdoKrF53xtuuSLlx73UtR+C7FKkU6WKtJvdueSDepIB105NCoIF7WUV0BaK3ggVvtrFei3ONv3XXt40JlTxW9lmpJjcv0fxTlbqZLJDLHOI5YNn8vog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mRJsk0Gq72jVk4rHs4+Sc1yKWHKchIRCScvlwRFTnD0=;
 b=CZzX2007TkEmGsTa775imvt8U/i+QaR3hwo8VBpI9nPja6rxPcsV0593sGktsHq3FSgeQmjXMBjXPqtCNxqYpBqt3fFV7f7PcOk+Vzjhszmp+o7TGQOQ4q2qHHjyag6AewZ0lawj4YtBr7L+oQTI1W84LsF4WtAJ9cQe8bygyyG0FbUSOggs6Y3BdOXX6hbalP2JRiJwTuk/TFttnSOMilmqr9a7RA6NZw2JZdEh0ZR5vGjqm7PzANmPKqZqjAjOBX+ROE3H1nrsyrpBScMZv+8ZAQz4J3ODmaq+gOBvLHstsVLM+FCmib+9B99tRk6cCm5fSiJbLC32SVWJ8G/5Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mRJsk0Gq72jVk4rHs4+Sc1yKWHKchIRCScvlwRFTnD0=;
 b=PDlWLiNnVrMUppH6Pn4gGLOUW97rKkpvgzZiu5EyMjqzRlJee0nwg1CJ9K6Mn+SFZqoBOZmUuOlExAKWPJKv6cdw7QvuhSLNQEeiVMS2qu5a9ID9x4fzQSA4alv/0bBNGonP3DfD3w90JpUAljDrBgDehmZZNRsO4QW6Tx2R1xY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VE1PR08MB5200.eurprd08.prod.outlook.com
 (2603:10a6:803:105::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Thu, 19 Nov
 2020 08:49:27 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543%7]) with mapi id 15.20.3589.020; Thu, 19 Nov 2020
 08:49:26 +0000
Subject: Re: [PATCH v2 0/7] UFFD write-tracking migration/snapshots
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20201118132048.429092-1-andrey.gruzdev@virtuozzo.com>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <31ef6a21-a333-5f72-64c0-7b83695139b6@virtuozzo.com>
Date: Thu, 19 Nov 2020 11:49:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201118132048.429092-1-andrey.gruzdev@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR06CA0115.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::20) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR06CA0115.eurprd06.prod.outlook.com (2603:10a6:208:ab::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 08:49:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8623dc6-61d0-4b8d-57d0-08d88c680550
X-MS-TrafficTypeDiagnostic: VE1PR08MB5200:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB52008BEE7B8C008B2DC26CC39FE00@VE1PR08MB5200.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2AHpg0qnlxNbLiNWwC1ZGKjW3t13Q/0DWyicZ/f3l4aj3xRGpkW2Wbjd0YtD/azh9D2JLhxwnfni8jAu78fak4jT6iWr/TDM+bb9D07vHWNYTdahKIwWFXQGfmtAIuf9m1txB1Aalva905fEndzclHiz5cn6a/0B9yowl6I/C7uFFHnzm88xGse0bkDrX/aYECMJJdzg7aPUw+3DNDE484SYlrpHxlkxJXIMkjjm3vkHgXglh/Wp5LFKnxIUtA6aHBz7/amxKmqNxQmeOruEkCsuh4LI6GGc46RYkmz6Iw1E1t54YByYabndq/cWcKJ6KbA4YXGnrcff/L9JyaEZIzrFqPnw3bQcUm6WUEVAikXEsgJ7eZVr9i966nSMdL7B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(39840400004)(396003)(346002)(8676002)(6916009)(16526019)(4326008)(6486002)(31696002)(66556008)(66476007)(83380400001)(2616005)(66946007)(53546011)(956004)(316002)(54906003)(2906002)(36756003)(5660300002)(26005)(186003)(44832011)(31686004)(86362001)(478600001)(16576012)(52116002)(8936002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: PP8ZGGZ4LCxV7DywQ4e6jeD4UgAgYg6D8kNQulIetts3rplRsrPrrv5B0p31MXIow+hIagHAhipd9tEMEasMOIqNhNl4SZWZEd0QS5YYYzfmijEVKEwWUNVWwMVp1VUbDQP6a3eNyStES7kZ0kKlxYj84eRcA5SgoS0nhcf18WaLGxK1p5V0eEh1PjUCG0djNpL/l3QBlZoO4TYsLQymRrZjNtsG4qod9aZ1LLwMVCyRV8EXb6ELpOc5+bmulOQFH0PE/XFNutIInGQlY51FpCACM6Yt/zHFW6tjlQg+TwzW/nMG1uzbo+wduOFil0RTwbCteiNWqV0svWFLVbGBk1UyKsN7N87YTGWbKjyUQnhPkGQvsAfzF/zudAeV1VzjEqR94Xg+9qBwH6ZJxCii/uEnabHT3BYyH/3UAGl0J4SOlN4jbeY6DxiM0A/6rfzOH96e/IFquzfuqFAjfRHxwRrLRbJoxQqlhTw7giWFcE9WOJ9vIMWC2AjhhM8EohaqP2O4e1+vMhZaWldvL3sVjid7PSRTYzmf79qIz2xI9KwrqURC843AduvAsWCdC/5Bt5L6ruSSnFOzIJVxfCqos8HcZW7b5aAi/CWyNHH5JwJv70+QdZjXfceMAOIT8nkWJ1O6NXMAnRNDRtcnpWJGlaKloLp7kxvEtFsol1eDzvDR0I3WGfVQhgTO9pZwotfpxhDPqnwzBjFs4VDaWbNtB5aRfmeuKjpQIs03LY73xTGCU1mfLpKD7ucRk299z/kvM4DmWkikfPS/oF0kVWFHpq6Q8NYs3+2EleeiMvBrgexCV812bwDcJl81TSFAyhYGR6lduS/x5O3m9UrW4GkRDs3ruwa9SKC3IVLWZfEcs0OCeTj41Y33fkYtPkMdd5f2JMj+A19TatHuWI6LwOMlOg==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8623dc6-61d0-4b8d-57d0-08d88c680550
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 08:49:26.8573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3GyKrJqykMNpZ6tWM4Z0aFoP1XmarYLd0pr8vn9zr+HHnMZC2mO1TdoCmlucZQuMOXMS6aSX5c7uAiRPFH0cliLZSvxlrnsmvYAkaScIh1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5200
Received-SPF: pass client-ip=40.107.22.115;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:49:28
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

On 18.11.2020 16:20, Andrey Gruzdev wrote:
> Currently the only way to make (external) live VM snapshot is using existing
> dirty page logging migration mechanism. The main problem is that it tends to
> produce a lot of page duplicates while running VM goes on updating already
> saved pages. That leads to the fact that vmstate image size is commonly several
> times bigger then non-zero part of virtual machine's RSS. Time required to
> converge RAM migration and the size of snapshot image severely depend on the
> guest memory write rate, sometimes resulting in unacceptably long snapshot
> creation time and huge image size.
> 
> This series propose a way to solve the aforementioned problems. This is done
> by using different RAM migration mechanism based on UFFD write protection
> management introduced in v5.7 kernel. The migration strategy is to 'freeze'
> guest RAM content using write-protection and iteratively release protection
> for memory ranges that have already been saved to the migration stream.
> At the same time we read in pending UFFD write fault events and save those
> pages out-of-order with higher priority.
> 
> How to use:
> 1. Enable write-tracking migration capability
>     virsh qemu-monitor-command <domain> --hmp migrate_set_capability.
> track-writes-ram on
> 
> 2. Start the external migration to a file
>     virsh qemu-monitor-command <domain> --hmp migrate exec:'cat > ./vm_state'
> 
> 3. Wait for the migration finish and check that the migration has completed.
> state.
> 
> Andrey Gruzdev (7):
>    Introduce 'track-writes-ram' migration capability.
>    Introduced UFFD-WP low-level interface helpers. Implemented support
>      for the whole RAM block memory protection/un-protection. Higher
>      level ram_write_tracking_start() and ram_write_tracking_stop() to
>      start/stop tracking memory writes on the whole VM memory.
>    Support UFFD write fault processing in ram_save_iterate().
>    Implementation of write-tracking migration thread.
>    Implementation of vm_start() BH.
>    The rest of write tracking migration code.
>    Introduced simple linear scan rate limiting mechanism for write
>      tracking migration.
> 
>   include/exec/memory.h |   7 +
>   migration/migration.c | 338 +++++++++++++++++++++++++++++++-
>   migration/migration.h |   4 +
>   migration/ram.c       | 439 +++++++++++++++++++++++++++++++++++++++++-
>   migration/ram.h       |   4 +
>   migration/savevm.c    |   1 -
>   migration/savevm.h    |   2 +
>   qapi/migration.json   |   7 +-
>   8 files changed, 790 insertions(+), 12 deletions(-)
> 

Also need to note that this patch series is a kind of 'refinking' of 
Denis Plotnikov's ideas he implemented in his series
'[PATCH v0 0/4] migration: add background snapshot'.

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

