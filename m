Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3840C454CAA
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:58:58 +0100 (CET)
Received: from localhost ([::1]:41358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnPCx-0003MY-HX
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:58:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mnPBo-0002JD-Sk; Wed, 17 Nov 2021 12:57:45 -0500
Received: from mail-eopbgr150139.outbound.protection.outlook.com
 ([40.107.15.139]:14917 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mnPBl-0003YZ-NI; Wed, 17 Nov 2021 12:57:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nI8VFo7YJhU6BkjwkiqLoGqCOu9Qv5HTu34RAmr/mReECLJPZ9aRau3RI+kUyJcMx3CFDQd9FWcwC27rt7+ZaFg2rysTIDJwrwltgFxSxOqHykKXpfWQF8/UJPwuaC+p97Tuea7x9JUCcUP641uINetpMnU0m5Wq31iV1cDLvCt9uEAlQhwJLeN16cwv2aGWAG3+uw/kDUJT34ksaDMiKKxBN3yZZ43Djv0OuO5HOTHdUl84O70x3ujB8EvJJyFUwBTk685Vgtov3PorgXMumnhwQ7aLcYr15AEv57BOAwt4onYCuCkE4Qa2fEmGEqFuEJiozBX2ywwVM8K2Mt5Xpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2cahgvCq62BPCcv+XjiYkxaR1HFWzcDWJ6XJhFn5sA=;
 b=JsW+n26mQwpByBAQudSFJL42Ds5MKf2QNFDV2qiYccAIElAdI4oFlCKJ+oFp4AVqWnrTg8t/w/Ab2r+9QsWX2Y9mwdD0KtSi9H4WmyqZ7fkEbJwXMvSMycz9+NLRlrI1ipV+w9mKv/Fkzd7Fh4gn8w/zdo9XoekiXQ0T78arIe1xEnpeqAeAn50BoPn9N7Q+1RGYw2boy3iMCIRR903LyG97m5j9AQSmredA0FbFsDh5v/FgPMbVUaqjjUqxtLVYFqimu9p5BVLgsJ53j9IIpA9ex/BON2RfZFLNzGWfFJ3IDrQougMJqvFIf2OO4Fagxft0gFAvTzLxOhveiCf5mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2cahgvCq62BPCcv+XjiYkxaR1HFWzcDWJ6XJhFn5sA=;
 b=RF72K66yL635IJRUpiCfn0LfZrWapGibz8W3D46sgNjrGZ20sC6wawwHi/sp7YB8v9AepYWbJ749DD16ch4uCslusC3o996FwCcmiHRISVKXWHmMYGTnWMu0I+Zo8osFCX24XPfQ41F1jDzVYms/GkN+rEppmKl3nWaxXX5Z1QM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB5986.eurprd08.prod.outlook.com (2603:10a6:20b:281::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Wed, 17 Nov
 2021 17:57:37 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.022; Wed, 17 Nov 2021
 17:57:37 +0000
Message-ID: <d4426865-fe8a-923b-44dc-b5984a2f8a40@virtuozzo.com>
Date: Wed, 17 Nov 2021 20:57:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH for-6.2 1/2] nbd/server: Don't complain on certain client
 disconnects
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, rjones@redhat.com, qemu-stable@nongnu.org
References: <20211117170230.1128262-1-eblake@redhat.com>
 <20211117170230.1128262-2-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211117170230.1128262-2-eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0056.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::25) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.233) by
 AS8PR07CA0056.eurprd07.prod.outlook.com (2603:10a6:20b:459::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.16 via Frontend
 Transport; Wed, 17 Nov 2021 17:57:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bfece79-f866-4c16-64a0-08d9a9f3bd7c
X-MS-TrafficTypeDiagnostic: AM9PR08MB5986:
X-Microsoft-Antispam-PRVS: <AM9PR08MB5986C41E216C7B0F405AA955C19A9@AM9PR08MB5986.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TKHSg2j87OLxXLbbvJy17Ce5gxoF4IW/WTW7ExpRH5+DUMBXC6IrY10tq4xb3bH7hCduEL6bnqiFENdXJeuxa5zCO/5pY3eQV+dMmx75uQ8c6jnBC4WrSW8nRAlrTo6m94JqRvO0NXFoAwolgyptBezJ/x+/0lOw/vBadY/Ll9iaY49JMWCzpI39se3NWqeVN/5WL1pnrD+D77oglNWj1sToWnu/7LUQ0Tc3QUegTENJd8pOtuK1mOBUCeHlMImYMQpDC5eRa1BwVq+z1F/1F4BXeA5+gVtgIOpmfYm3GIrcAnfxCDNNfoatNaMtlo7sxVM0XzLl0jQczluHO1g2rJqPdrBHFe/2jB3r+ytcLFIsR6MX40pivIcFalggj4C63yTZuevGJcYEW5Q/vWf14Wq//fo9pVO3dRZLpg1LTjw+f0ErnTw0oQwgPK56JabWlQjhWQVuIwPJXnedHRBRaxB2Ks6VA+D8bYKnDmM9GvWIykrfHaf2SZVrR71t9YYcdptEtpcNKKGhoxEN0CaduMPhEJqHajfu2Vv4LxP92zIN1+caG2GVnnayLr9PEfUsA6UzvGqiflrPRHZ7CpDB2Kh3oasvICNJ5xwLGNiapnIjJluhkLorZFil6MU36p2GHNtLLcoNMgvnj/5N1lRVegwAG/J5YYFsOgThprhgSKT3+trLEAD/nMIb97uTivi37z+KNvKm4H94r01zQoNWiTNJ+nsqvX1KUWHeQLnz1lz2fawSvAJrzvagkfjdDwzI4P9mN2VNCoR1M6oC3KLsvDiLoRiP8i6urfibGNEUe2A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(83380400001)(16576012)(2906002)(956004)(66946007)(316002)(36756003)(2616005)(31686004)(5660300002)(86362001)(38100700002)(6486002)(26005)(66556008)(186003)(52116002)(66476007)(38350700002)(31696002)(4326008)(8676002)(8936002)(43740500002)(45980500001)(33290500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGljS1E5YitwdHpjVk5vMDdycWVSRkFyUENITUZjaVdCN0pFSG55WUlDS3JF?=
 =?utf-8?B?cVVnU3NXVzBRbkV2TGl2T0pmREVFd2pYdy81ZlpWNElEaU1iQWdHOGZtNE9I?=
 =?utf-8?B?djlINkJpTERHcnpsU1dGMlpvekR5TWpUODNSbEQ2WG93MVRBUk02R0JlRzRX?=
 =?utf-8?B?RGU3c3ZkVWVLeW94cEtaUFRlUWF4TDJpMXdUc0VpejI2eldxZm1XdytCR1NQ?=
 =?utf-8?B?aU9vY3BLQTNWeHp6LzZtbHdrcTJFUGZrQmpjeDZrOXpOMHhBRWdIS0N0Q0Rr?=
 =?utf-8?B?T3U3UGxjdkdXUjN1QzZVYWRid0RPVGtreXl1ZlppSTVqOEJBZ09Ic1Q1WC9t?=
 =?utf-8?B?NEhSZmlDVzZ5RmVINzMvM2dEdTkydGRSeE50dnhQV2VNenE2dkJCdnFXNzh1?=
 =?utf-8?B?dmtlUVFTNmp3ckQveE9KUnlZMjBrdEJySVIyQXErMzBqaGtoaFUxNGdLbG1m?=
 =?utf-8?B?Q2JIcFlySzdPeXlUa3phNEEwdHhvcXhZQlc4THNTNGFsRVZ1R3k0OFozNk1x?=
 =?utf-8?B?VWpkclVEQzFUTDR3eTFpbTdWRzVYSFlGRHRISk1ERzhUM0xFTlpRLzYrcUNF?=
 =?utf-8?B?WG9HT3ozRjRCbFlYMDNQamZxZVZmVkVieXpZVWhoMHJXQkdhanp3R3NRMjhr?=
 =?utf-8?B?U3VEZm9HbGJ6VUJ0VGswMFhsZHRvL0VxNGw3ejNaR254WmJMTEZEQUVUQ2ZX?=
 =?utf-8?B?dnBGKzQxWDJrYm4ya0h5dzVOU2wvc0hCVnUyRys1MWdiTXZqRXdnaE9JVGQz?=
 =?utf-8?B?aHdnbEFaZVptWkRxT0FWcFVxclNpZ1pyZURRVExONkFtdUhHdVVkcExCRDJO?=
 =?utf-8?B?NFRGZUFNemdLYytSeGk4ZisyZGpaNXJ0UnFUL3VCV3MrS1Vnb3JOaDFJQ1hV?=
 =?utf-8?B?cmM2UGtwWklzbFlVY1plMWJ4c2FSMXE2UWp5Ump1bkpzU1hLN0lQTVhrMHBQ?=
 =?utf-8?B?RExXNllRRjcxSVBGRjl6d01LRHNURTloUjMvdUNPQVFrdWxwbVVNcFBYR2RP?=
 =?utf-8?B?SkZ1S1RtdHdvTk0yREJjM1pDNXlONE5FSlp4T3FpRGZQcE1TOHlkZnpNbXA4?=
 =?utf-8?B?NEYzWjlWRzhQcmdidUMxV3FQeEtPWjFuc2puckIxdXdNWStVQ3JPMFJONE9D?=
 =?utf-8?B?YVI3QTVQZ3NZRk9GQ0M4UGR5TktWZ0F4Z2gyUU5zeUhXcEhOTTVlK29sVkFt?=
 =?utf-8?B?KzRFZFN2bTU4Yi9TdGIxRWRLVm1OTmwyL09nYVdLQ3dWblIzcXFoN25HN2hE?=
 =?utf-8?B?WlNuQVpqVkhncGZFVVJIRFQ2aEg1cWlTS1NjYmc4QmdLWFVzS1FBSldyRVRX?=
 =?utf-8?B?bjBrV3hOYUZwSlVuTWJFUGtQR0ZYZ1BBRTNjS05ydXhCMUExanhrU0FZK3ZW?=
 =?utf-8?B?WGN4SXFiOW1SWEl3clg5U2Z3V2NuSmFTbjNwdUZWQjlFM0l0aGhEUFRwY1VT?=
 =?utf-8?B?bE45ay81ejhJa2ZoU1JDejNBTlBNd0dWOUpySW10QmY4Yk1JNk5rcDR1eWov?=
 =?utf-8?B?ZnBFTURwd2NGY3R2L1BTUXdiV1hHYURpMnNOQTNSSmxLZXFPSkZyenNhRTU4?=
 =?utf-8?B?dFp4VTV4Q0RYankrODlEQlhsUHdRTG5LK0I4MlA1YnA4T0NBWGpZSlNRL0w1?=
 =?utf-8?B?S0oweE9RM2ZWV0Q5TnpTZFlUS3daeHJ4bEJMWU9uLzNyOW5qSG92Rkh0Vzlz?=
 =?utf-8?B?SFlLOG1tYkZTMVlFWi9xMUY5dE82MGI3dldYMnBCV25UaEFmek41U3VUOEpk?=
 =?utf-8?B?WTM0UEVlbUNvK1Z2c1lRSkVPQnJQZnV1eTBDRW9OR3BjeVBqdGJ0RXFBa1lH?=
 =?utf-8?B?Y2hDZERzV243OSswdkN2RGlTM2U0ZG1tSjNSaEJIRGRkRXVzd0wveXRncTZX?=
 =?utf-8?B?RkVld3Z5NVNzRGJUWkRWWGdKS1duZkFuSmtJdkYwbnh2ckN2U0ltdWp0dDZm?=
 =?utf-8?B?VUsra2VuTFRUbHFGWmlrRlN1VXA2bDRpWHhqSnh0Y1pudkFUS0VWekZhOWlM?=
 =?utf-8?B?V1hjQ2FVSEJxMExXMWRYNEQ1RVk3aWdpOU5PNjJxbWgvOWx3aHVEbkFMU3BZ?=
 =?utf-8?B?aStPcjlHVVE0K1pRZEhKbHpYRnkvaVBYWG9kRmltRXpYa0daLzlvQzNTVXJv?=
 =?utf-8?B?UTkrRDdFeWxDQldvTWNJeW9jbHRqb2x5M0ZkZ1dUSmhwQ0Viek1zbXlkTDJj?=
 =?utf-8?B?S1FrM0NaTmh3bEFFbzhsaW0yRVNIMFR1TXdURjJTQk16UCtaelB5NWliVkU4?=
 =?utf-8?B?Mk5kWFFyK0x3dWo4M3VZTFpLMmJ3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bfece79-f866-4c16-64a0-08d9a9f3bd7c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 17:57:37.1655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jh3CvNB5/ITMc1tCmXf0EvIgeN/pSGTi+qzveqIk3fOUjECFP52vnSVxnIAkIUojeo9la3u8FnNsCjeJFZrR7c5cSD44arPNcbOzBaYjMsw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5986
Received-SPF: pass client-ip=40.107.15.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.009, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

17.11.2021 20:02, Eric Blake wrote:
> When a client disconnects abruptly, but did not have any pending
> requests (for example, when using nbdsh without calling h.shutdown),
> we used to output the following message:
> 
> $ qemu-nbd -f raw file
> $ nbdsh -u 'nbd://localhost:10809' -c 'h.trim(1,0)'
> qemu-nbd: Disconnect client, due to: Failed to read request: Unexpected end-of-file before all bytes were read
> 
> Then in commit f148ae7, we refactored nbd_receive_request() to use
> nbd_read_eof(); when this returns 0, we regressed into tracing
> uninitialized memory (if tracing is enabled) and reporting a
> less-specific:
> 
> qemu-nbd: Disconnect client, due to: Request handling failed in intermediate state
> 
> Note that with Unix sockets, we have yet another error message,
> unchanged by the 6.0 regression:
> 
> $ qemu-nbd -k /tmp/sock -f raw file
> $ nbdsh -u 'nbd+unix:///?socket=/tmp/sock' -c 'h.trim(1,0)'
> qemu-nbd: Disconnect client, due to: Failed to send reply: Unable to write to socket: Broken pipe
> 
> But in all cases, the error message goes away if the client performs a
> soft shutdown by using NBD_CMD_DISC, rather than a hard shutdown by
> abrupt disconnect:
> 
> $ nbdsh -u 'nbd://localhost:10809' -c 'h.trim(1,0)' -c 'h.shutdown()'
> 
> This patch fixes things to avoid uninitialized memory, and in general
> avoids warning about a client that does a hard shutdown when not in
> the middle of a packet.  A client that aborts mid-request, or which
> does not read the full server's reply, can still result in warnings,
> but those are indeed much more unusual situations.
> 
> CC: qemu-stable@nongnu.org
> Fixes: f148ae7d36 (nbd/server: Quiesce coroutines on context switch)
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   nbd/server.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/nbd/server.c b/nbd/server.c
> index d9164ee6d0da..85877f630533 100644
> --- a/nbd/server.c
> +++ b/nbd/server.c
> @@ -1418,6 +1418,9 @@ static int nbd_receive_request(NBDClient *client, NBDRequest *request,
>       if (ret < 0) {
>           return ret;
>       }
> +    if (ret == 0) {
> +        return -EIO;
> +    }

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

I'd prefer not include following hunks to the patch, as they are unrelated.

> 
>       /* Request
>          [ 0 ..  3]   magic   (NBD_REQUEST_MAGIC)
> @@ -2285,7 +2288,7 @@ static int nbd_co_receive_request(NBDRequestData *req, NBDRequest *request,
>       assert(client->recv_coroutine == qemu_coroutine_self());
>       ret = nbd_receive_request(client, request, errp);
>       if (ret < 0) {
> -        return  ret;
> +        return ret;
>       }
> 
>       trace_nbd_co_receive_request_decode_type(request->handle, request->type,
> @@ -2662,7 +2665,7 @@ static coroutine_fn void nbd_trip(void *opaque)
>       }
> 
>       if (ret < 0) {
> -        /* It wans't -EIO, so, according to nbd_co_receive_request()
> +        /* It wasn't -EIO, so, according to nbd_co_receive_request()
>            * semantics, we should return the error to the client. */
>           Error *export_err = local_err;
> 


-- 
Best regards,
Vladimir

