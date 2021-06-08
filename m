Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E35D839F31E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 12:02:34 +0200 (CEST)
Received: from localhost ([::1]:59034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqYZ7-0007GI-Ug
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 06:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqYWx-0006Ge-AD; Tue, 08 Jun 2021 06:00:19 -0400
Received: from mail-eopbgr50137.outbound.protection.outlook.com
 ([40.107.5.137]:36421 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqYWt-0005rv-D2; Tue, 08 Jun 2021 06:00:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YlKqC8rLR7fVaOSfyTBKDq1j5im7bMWyBm1vjZUHB3v4zzmQfPprpPnPMqWD7nUYru67JV5GqJYFoSgRwJnduXLaO1Kiro/HR7Sr8bzuiqJYRPz48xmeqNP5Df20pCb1EkaHPwtxIP1ZIqzHUwaCB+CPch2zn0SDbNL2Fax+HzUrcsKMB17z/FjICGxqg8j85l3zPhkfQDRrYtx3+IQyvNd/cMaG8WIkQr83gX3CdITSdfdgS4QuZvItwgGxafvwqVntck/GO9WWrpG/ZnCCfl3I2ti3Voe6ur/p10XFcTAOwZ2nsv2vYqMh5RbLUwCP7vdlYNmOy2gODa1n0LetlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVfPIupk9IvV/qVjD6/vc8evin477FB4IUMEQbduQB0=;
 b=S/aKrHIPTpA986Sun7CjSBFngQmEY+jHoUFNkojVPPkfDJK4oFfuOIU4xF7iuRSkNxGcJ/JhG/WJk1eRxWPVuAfIbqqpqrgdDqQbM/aitrh/wD3x8Uj7FDStel07mJIxzoOvhieW/9QjdQ0K3tizTcKZKnfpnLAX9Squg4PpFPlySNWRb6s5llC/Me5pVvwKK9ftAan8JqJEaA5u7zUaxAfBTPT7KNBmsoEOcWbik8p2V2/uwiqq9t9T1VRHrHus+dhjB4I1vRTd7uf8XwB3MzeljTat1nDLF5AXqr8TRGg7bbOoDIr8UGChaXT3HnBa7KFDj24bX5g1bmp4daiStg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVfPIupk9IvV/qVjD6/vc8evin477FB4IUMEQbduQB0=;
 b=SgM/UBhQS25vmmlwwlOspNDDTmuTYLsRxOt1CofF7CS6xExv7vCWRAsDZkKopwqIVajaE8bsuaVAqJIbAUQHswlhxNaXrbsSD7yiXudRYPRbm9VdEjDpvkJ11BuJci+vet3Jq5HlPmcDGN3kroVFvmnIkj9Wna3+FaxP+7++Fzw=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4599.eurprd08.prod.outlook.com (2603:10a6:20b:8f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Tue, 8 Jun
 2021 10:00:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 10:00:11 +0000
Subject: Re: [PATCH v3 13/33] block/nbd: introduce
 nbd_client_connection_release()
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-14-vsementsov@virtuozzo.com>
 <20210602212714.qqduut7ifmoconfo@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b544ab72-4386-a24b-8c73-71a4d1e44d89@virtuozzo.com>
Date: Tue, 8 Jun 2021 13:00:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210602212714.qqduut7ifmoconfo@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM0PR01CA0088.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM0PR01CA0088.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Tue, 8 Jun 2021 10:00:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4a932ac-af5d-4071-9a3b-08d92a64347f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4599:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4599548B5596533E409C3529C1379@AM6PR08MB4599.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a8fkM4rzRnBtI3717J4nRpqUaYaSiLaMGUwV4oxoh7SEY7riENNGyHYIOlQHAkIXozl65rE9Sxtijl9ubGa7WSQ7cbQ0jqvFLx+8WIdFUbioPuvLYUDsd7Mspev7pxXXv65cDw/Rql8q6uw25OO5bnEQRKsxBwyvpeThw+4RuWufppMPs68lLBHtsY0GkLKB9pW5J0N9DocV/ajnPrz+0WK0MSTMEvvZkzXpPXvoBmcVapWhhagfXuaD8ldyGKNZxIcf+ZC5gttiqQeIoZJzTwkzq7qnvmdkTgWC3RF7bHOA08PaX9DBuI4HytWuG55gDO6XgQRPeDPrG5hhsTM2hPTnaWVUPhCmnQKbtwB8zuAkKNhM1gpEsLI80WgVTXvHVL7Dh0euxT55nSJmhsut5I+qEaxMkDdU/Y8eN6o24nV4w7x+OtVfmH0+8Uc8Wl1uODJdP48GAKVf4cELh7l1Eg7dQzP7YemRtBL67jlugtn0n5jRqvgWg9aFzitc4nCzSTtbnq8PsIHdFeq5IzMMaav3QOHG5KjDpyJAR12F96Bg7Q6p0TOANpRxbdTBzqMJKcg3VDNfjMHvlwDPGrq4I/xO/DS/L7EO78TuZdxT94CO7O3yYkPHPVrpComTFNAwrMzDQphdXZ9G3bIjwX0eR8XJvbkqoldShTOUK3q8QTgzzHQJcZUMr91gXTQq1vZY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(376002)(396003)(346002)(136003)(52116002)(107886003)(478600001)(31696002)(83380400001)(8936002)(186003)(2616005)(5660300002)(956004)(6916009)(86362001)(36756003)(316002)(8676002)(6666004)(26005)(4326008)(31686004)(66556008)(66946007)(66476007)(6486002)(38350700002)(16576012)(38100700002)(2906002)(16526019)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bUlzblg0U1NYeTIzRFA4blZvdUQraTJaQnIwS3prNGhkc1dJSUtmOVMvWS9l?=
 =?utf-8?B?QnM5enhIMXBRL1REdWZyeVE1K1g5aHlWSjlYNGNQL080V3hYekRLNzVYTWY4?=
 =?utf-8?B?UytDSnlNRWxWODBuZXNvZDVWdmd2Nnl2Vno1eGRtZzIxd01JZW1SU29vaTRj?=
 =?utf-8?B?VHc5L09aMkxhMmRHelNtRCtqM3VrWS9QNzY2YlhReU5TSDhrYWMxMElvcWR2?=
 =?utf-8?B?dnNGYU84SitQNHJwVllvbUp4WlB0NEsrUHEwTjNBRGE3Q0VFcHg1a3FzTFNS?=
 =?utf-8?B?ZXB2MHZ1clQxaGowaUdFVDE3YXQ3S3lpUXU3dTdGa3pkNDg5Z2VTSHBvbU9J?=
 =?utf-8?B?Rmk4RlYwZzQyZEp5MkJYdEZnYzhMRlNBbEZzZVZlc1VycFZrOE1CREdmNC8x?=
 =?utf-8?B?NEdzNWRBUWNEdGZxa3FWZDE3eGRyeDdWemtNSVlVdkJFZ1V2eHVpNTNNMldR?=
 =?utf-8?B?WUEyejFkZGFEaWdTK3BHQ3lHVWN3QytSeFArVVk5cDVrL2g1Z0dnaW4rSXQ3?=
 =?utf-8?B?SkVUaWIvS29FWVNSZWJqWmwxZXhMVXZJVEl2WmRWYVhOMjNoOHlCeVhUY1Zo?=
 =?utf-8?B?dzVpNTdQZmNBYkJaM3RMUnVwc1FCU1BtTzE2Q0JTc2ljVkdyaU9vWmtwZUR5?=
 =?utf-8?B?T3JtMStYUWZnVzhLUUZBeGFYNmVZL3pMaStnR2YvelM5MGxJZDNiSWRuQWh1?=
 =?utf-8?B?MkViK0xkSzA2ZEtrWWMxRFVUTTZOVTdKRTZjeHptZ2Z5NEFPL0ZBc0pTVkdh?=
 =?utf-8?B?T2R3VkhKUndtOWoyVk9NUCtxYmc0V28vVCtxQjBrbkVNTlYxam9NamF4NWg5?=
 =?utf-8?B?K082dVZnNUMwaERVMC9Gc3RRTkxjV0FibllNUisxd3d2NDdEblIyZ21MdUkz?=
 =?utf-8?B?TmxqRG1mZ0tZUThSZnlUV2N1NUE4RjBHMG10OFl3alJTd3NDNTc2c29qOWFP?=
 =?utf-8?B?WjlkTlFnZHJSTTNXMjJZL3hZSXo5Nm5pWGRvZ3VyYURuMDg5a3lCT2FxUjB6?=
 =?utf-8?B?WDVpVnpxM0RnRytodkdLQ0hkMlM1TXNwd1JpNlFKVVVuaW4wdjdHUlJ2QVI3?=
 =?utf-8?B?TDlHSFFQTG10SS9aV0lxSERtQTNVTnJtMGNmZGFOU2JUbEpTNFpmYktGUTl1?=
 =?utf-8?B?Snd2OTBFaEM3Y3dBVEI5S2dESWlza05zQk10VW1GVkhhZWtqckR6VGRZeGRY?=
 =?utf-8?B?eWlVc2hyU2R4TFJ6dXBUQ3NzdGtjQWdNWERVM1Q5QTBSSGh3Ynp3aWl5K3R0?=
 =?utf-8?B?bk9EMVRJeTgyYmtLNnVEOFZqU0U4a2lUR3lhQ3N3WjlUWFlSamJyTE9KS0lv?=
 =?utf-8?B?OXZRMVVEUXdVYkNiUEN6czRKcUdiQlpMcjZSblZNSFpSRlhmZGZ1K1RsaHJx?=
 =?utf-8?B?SzNtTUZYbUpzUTJZcmpGcHNReSsycGxoVVRwQUt2RHNRQ0lUOTArbXFCUjRV?=
 =?utf-8?B?QXdJRFMvQ1luaUZyNDEwYmJBczJ3QnpLdWtqODVjWnRUR25OY0lFUXdDdkJK?=
 =?utf-8?B?Z1B1NWdBUitVWmpkQWQ1aG5sRjZMN1V2UStKU1pzMk93MUx2U1NXZXhreUNK?=
 =?utf-8?B?MmJpZmFlUTgremxBS2phMlpMeWpHVEkvWnZtM2Q5M09pVHJoR2U4WXp6R3g3?=
 =?utf-8?B?dDg0NkFXaUZaZmFhazcvV3RpSm1DU0N3ODRVaTAwZXFqdWt3K0g0VXEybXd3?=
 =?utf-8?B?VnhNY2JjaXRQSGJPeGJIbFcwRDE2c0xCK1ZZcFh1RjBiajZLVmRFNkJ4dk1X?=
 =?utf-8?Q?4IVOA8aq2gEYGdrrwq5Y8KoJ3ce1MR3h5AzKjvj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a932ac-af5d-4071-9a3b-08d92a64347f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 10:00:11.7909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3TThyRP2F07bhH2bWeeTWQ1dPa00DrILFHKOX/tMCrLJX5EU0vPGYrY3L9jj8zYi82HyPai+BhkS3RDcJDTCU1rhveUHX/zocuz4Y4XyVPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4599
Received-SPF: pass client-ip=40.107.5.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

03.06.2021 00:27, Eric Blake wrote:
> On Fri, Apr 16, 2021 at 11:08:51AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/nbd.c | 43 ++++++++++++++++++++++++++-----------------
>>   1 file changed, 26 insertions(+), 17 deletions(-)
> 
> Commit message said what, but not why.  Presumably this is one more
> bit of refactoring to make the upcoming file split in a later patch
> easier.  But patch 12/33 said it was the last step before a new file,
> and this patch isn't yet at a new file.  Missing some continuity in
> your commit messages?
> 
>>
>> diff --git a/block/nbd.c b/block/nbd.c
>> index 21a4039359..8531d019b2 100644
>> --- a/block/nbd.c
>> +++ b/block/nbd.c
>> @@ -118,7 +118,7 @@ typedef struct BDRVNBDState {
>>       NBDClientConnection *conn;
>>   } BDRVNBDState;
>>   
>> -static void nbd_free_connect_thread(NBDClientConnection *conn);
>> +static void nbd_client_connection_release(NBDClientConnection *conn);
> 
> Is it necessary for a forward declaration, or can you just implement
> the new function prior to its users?
> 

Actually, otherwise we'll need a forward declaration for nbd_client_connection_do_free(). Anyway, this all doesn't make real sense before moving to separate file


-- 
Best regards,
Vladimir

