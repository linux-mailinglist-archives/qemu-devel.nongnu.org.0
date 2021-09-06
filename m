Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64464402121
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 23:41:59 +0200 (CEST)
Received: from localhost ([::1]:36968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNMNH-0002Wn-1H
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 17:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNMMQ-0001sT-KC; Mon, 06 Sep 2021 17:41:02 -0400
Received: from mail-vi1eur05on2130.outbound.protection.outlook.com
 ([40.107.21.130]:12353 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNMMN-0005Im-U2; Mon, 06 Sep 2021 17:41:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IsmLbamhjxtD/XVbVEwTaEt/0c1syLL7XsJZy0WbYS9V6TeT0zLikeFjvJyMMqD1vCnC90o3cYQFeG5NhITFQ7sTP0Uy0SBdqJdGd6m4lxawCTOQvvzPeh6km9nZPtXMfC8fXlUK/miAhxcYXa9it+unlhB360RgeKB7mCODxn9/f9n/lh4xf41nW1TTrMIgwRGidskr8YStmvq9TrbVxjohvACrFuT6tSOREj5VhuHeZHkJjMpgZW2dmH6a3AhlkZ8gfIf53Eak0pM1z2exPDUdYaEk2t4MdO5JRjgdXGEuDnfGmlibhTleCFbsgW8qSFxwe+7ORHHjARorTdKXdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=qUXhbowfzXJ/XlMEhWzvldd2ufLM3YbCmrq59AJJ5D8=;
 b=FETCFhEi+EVQL2mGZM1RciLvuqswu5kBbPa8+rHkyAjsjiZ8GyQ44jX629eRTa/NCKMN4ZEC0f+f8Y8ruuFItyW/cDeRWlqj2YW00VNxKBFRGnQ5RQgjU8NckpmcTSOUF4fDSqZBZDVEoIaNgpP5DyND2ljkkSB9Z/7emg2dD8FuJjSbjK7Tp6Vv6jIl8N7Lb5Oa6/uxuA418Rrt0phMjD4bPfdPS27FwowMOF1kxHPREPy4z/XKBtbCz7xymY5v6wXil/KEKOvTNK4k1hkNveBwhXqij5e8W55B2CJ0+ZrkR5qOdyoUzQYj5cQGNNE0rJUQpe2pccbA67iW3nK5IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUXhbowfzXJ/XlMEhWzvldd2ufLM3YbCmrq59AJJ5D8=;
 b=CLbKS5r+PzBNyTuXNqjJNLfqb7R7jBw4acp40z2opMKbWL0jyE6bMbZJQka4FuuSWsbZ3R+uS0UNQ06KGm1g9tBWNvBTU5S1blZaqza43HFKnbjzeHpuxox0aj9KoG6yCTtlnafSdBq99mZReidyJGZxhbQDXahtbfuXCI1TnIw=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4215.eurprd08.prod.outlook.com (2603:10a6:20b:90::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Mon, 6 Sep
 2021 21:40:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 21:40:54 +0000
Subject: Re: [PATCH v3 2/9] qapi: make blockdev-add a coroutine command
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, hreitz@redhat.com,
 kwolf@redhat.com, eblake@redhat.com, den@openvz.org
References: <20210906190654.183421-1-vsementsov@virtuozzo.com>
 <20210906190654.183421-3-vsementsov@virtuozzo.com>
 <87tuixa4gv.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <7f9959e1-851d-b38a-c92c-ae42c340f29e@virtuozzo.com>
Date: Tue, 7 Sep 2021 00:40:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <87tuixa4gv.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P190CA0026.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 AM8P190CA0026.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 21:40:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72ca713e-9ddc-40ca-9dc3-08d9717f00f3
X-MS-TrafficTypeDiagnostic: AM6PR08MB4215:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB42153154EED8F34DD0C19E8FC1D29@AM6PR08MB4215.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wU36CEj6hX+xbY2BezgZhJwJycUG1jWk9FSb0FOJpBqpP8dmBbxN1jOfk9+Q8BIqG4t/yM8K4EclRoSN3gxuhBy23o6XfiMYCIzLRFYTVJPdO6cO45EpAJb9VLdPMP1KsJhoh64UTymn6r2KzK/frncs2/ka/OvNvz/qggbqLCecVbGL9rbThbz6eRlvuXVlzfKzTdBDb9de3BWPZDkQ1CbVpyjI0nqVeyAs0VNjVjpKRKElSRLPJRBUge6xa7L3coLA0nYqgwQA+0bXTPEjqBrmEosNCqp68DMxI2mC+VJ+w9wBP4N953w3mz2HLSE17pEf0h7fuQGyGRXMvDaZAzj8ayEpBslEtoURZRF/FDWBdh5ZV+EEmba9eDh1PAmddLlIgQ4zt0d/cUT73h8KSu1kfrd5UOtG2XPcJTXPJ7qnbw3Nktu2ydfWbtJAlBAgF/Pt3uIefKLzKro9Sz8YUXHKENiIpGPnH1wYfhlPXb6bCltk+gc4uG4Kyb6iJJmRhG2KZtNZeLj3w9btv44kEOoyYHBCr83A+nHFT7EjPI5qzBi0idX0HgSC6tlr7YvclbD92KEz4eI7dUPWULqauHE7mA6T7SZu3vP1L4+QuvQpnxN4sw6nij9t+wvLFYlAX4t3MMPj4aF0iO5/06/dUw/028GCsviMtIoNlKbaf99kNnrN5vLT9/lU0CszfitYylpsb/EUYktHUZnlxwtSMiigO4NSOjj3brEXH0NqZkN3D8JEdM7tTbGT37PiQnF/HV/jB2ogBJFEMFlGz4sifFqmxQgjmefp+F9jOFTP44ovVTs17AxTmrL6Sg719sT65aKf0MeRhCI1MhCg+eoLe57M5L25PxBTvuRdyIPobAE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(376002)(39850400004)(136003)(5660300002)(83380400001)(2616005)(478600001)(38100700002)(26005)(66946007)(2906002)(8936002)(16576012)(8676002)(316002)(52116002)(86362001)(38350700002)(6486002)(31696002)(31686004)(4326008)(66556008)(66476007)(107886003)(966005)(956004)(36756003)(6916009)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzlpK2FFU05iQ2t4bnNxTHEzZTNRN0h0VVY0R2RLazByeHNLemt3VGhINlFk?=
 =?utf-8?B?NEs3TXpWdnRSVlA1U2t3bWVKM1V4RVdOZGczSlFvSGhiTWFvclRIZUJTclBz?=
 =?utf-8?B?SzFkZWUwTHYzT0VIZ3NrRHNFSG02cXRzTk9TQlE4bzJySDBVSEZVb0dsZUow?=
 =?utf-8?B?eXBQR3d4RzlVTDUyUmh2d2VxWXg2MUFmWnlNSUJWQ21xVmxmWE1HRmtjV1Yx?=
 =?utf-8?B?VDl3UjdHT0lib211MG1Wa2QvRDhSY2pZUnFBK0hOZHlSVzREeFF1cjU0dDZa?=
 =?utf-8?B?N2RjZk84QlNNZWtkMkhYK0VuTGRVNW1rQnV5TWt3Zjk3bkxjOVY5UDNmQ0tS?=
 =?utf-8?B?UkhlOVVibnc1NnRxUzh6WGx0N2RLSW9ubUR5TEhvQWIrSjk5Z2VWK0JWVjA4?=
 =?utf-8?B?NjErQnR2Ky9yWHdDNC9FT3Z5NXR4V3N5ZW83U3ZEc0lzNS9TR1l2VEN5Z3pN?=
 =?utf-8?B?SzlKMWlCYTJYNit1RzJFclVoc01TTm12U0dRYzFmV0d5WG8wNU9oT2tqQWZF?=
 =?utf-8?B?T3FIRk5UME12M09ZbE9sS05MaG1hazNTSUFKcyt3NjRNeE90SmdaR3h1ZU5U?=
 =?utf-8?B?V2xsK0NSTWZWdEJkbEdjTEwvOTJqQnVZTjZZRW9CN2ZUL2NRUWFkalhEMms5?=
 =?utf-8?B?MVZqN3R4eUw3L05YUHBObTYxdmFVVDV4bjZtY1Qva05JTitxYTlUNUpPQS9n?=
 =?utf-8?B?YTUvbGVZYmZVRW44R0FVcURHWmprZU9xeW56c0YxUlg3ek8rL21pMTBjM2lq?=
 =?utf-8?B?dnZxUm0rOWVweVE5eERwMEdOWHBoVjlmZzRtYmZWUzB5Qlg5anNRSkRvcWZL?=
 =?utf-8?B?c3ZFQzgza0xpM0xZdnVwZWNDRk05TlYrNUlqN3FzTTNKeEpMVDQzc2ZicExi?=
 =?utf-8?B?aXFSbXhzd1VFMnhrWmhCdFdZdXdjTDE5L2ZyTWd4YmRsRXlVT1M5NG9rSFZl?=
 =?utf-8?B?ZkdhNzFoazV3QlRhOFpuU0UvTEhsT1hKc0hNc2ZuaTFoZUdvY2NsTVZyUzIz?=
 =?utf-8?B?endDUkxJY0Eyamt2Ujdia1NyLzRMb3hHdjFyRGZrSTk5ekJLY0hrUnhJcU01?=
 =?utf-8?B?ME0xSGg2Qk8wUVM5bHV3cnNNaytWNUVWL1lVb1VCcXZiR1VvYy9BbTUyWXV1?=
 =?utf-8?B?TS9PT1hVb0MwNU1yalRvYm5ZK0d2VHJ1ODA4T1ZXSmM3Skw4QlFWVnpPZ0ZC?=
 =?utf-8?B?eHlyeUhCMWZYbW1oN2I2ZWJ3ZHEzUGVuWjVRbGpJZTZmV2lOZmhkMGNqeE5K?=
 =?utf-8?B?WlkrNGRLU0ZLblFRQ2hIa0JEYWdGdnRoMVp5SU5SS29GejRLdGtkbDU2a3VX?=
 =?utf-8?B?WDJpTnZVRWdKd0t0U0lrTlY0WUNoT3ZmckFpYXJ5TXVtSDZOc3dRZGQ0TkJx?=
 =?utf-8?B?akdBUFRkd0Q2aDBicFZqVUVxenhHb2d0Vk4zUTgyL2t6N0VsemFjc29qNVBW?=
 =?utf-8?B?MC9zRFI1bVRNYk82MUsvQjFFcHJMSllxcVV0ZzRkMVpaUTFXMHF1Z0htWjFk?=
 =?utf-8?B?cFJna3ZwMXpUQ3lZdlZ3MWI0NHd3d3ZqalYydEt3bkg4UjBIZFlsNFVPaVdE?=
 =?utf-8?B?NTgyQ1FNazdDbDNBekNISVdwaUZQWk9JM2U2QU9CZWIyekRtSDRETXhmWXZ4?=
 =?utf-8?B?UXdWSWgxWlM1RHhWVEozT0FqNngxWnFMYkNGTzkvNTZBcTM4blBtYXJwT04z?=
 =?utf-8?B?QXFmQWNKbWJweWtxT0JQRitxV3NVYlRqVnN5a3RFQ2I2Wk1WL2RGZHZLTjkr?=
 =?utf-8?Q?mrgVFeZto027oha3jdRIbpW9JNjuQGGnOCe2OSH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ca713e-9ddc-40ca-9dc3-08d9717f00f3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 21:40:54.1601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qHU+UHo/HSK1V3CbvgFZpFVUNnfNULtcHyikQfPtbBFnIzOdiAvd1baLKhraze1TRZmX4BxQQmIDBXwwtzwZqqZcLx6PmbDeHs4HJxEoJ4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4215
Received-SPF: pass client-ip=40.107.21.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_NONE=-0.0001,
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

06.09.2021 22:28, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
>> We are going to support nbd reconnect on open in a next commit. This
>> means that we want to do several connection attempts during some time.
>> And this should be done in a coroutine, otherwise we'll stuck.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   qapi/block-core.json | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> index 06674c25c9..6e4042530a 100644
>> --- a/qapi/block-core.json
>> +++ b/qapi/block-core.json
>> @@ -4219,7 +4219,8 @@
>>   # <- { "return": {} }
>>   #
>>   ##
>> -{ 'command': 'blockdev-add', 'data': 'BlockdevOptions', 'boxed': true }
>> +{ 'command': 'blockdev-add', 'data': 'BlockdevOptions', 'boxed': true,
>> +  'coroutine': true }
>>   
>>   ##
>>   # @blockdev-reopen:
> 
> Why is this safe?
> 
> Prior discusson:
> Message-ID: <87lfq0yp9v.fsf@dusky.pond.sub.org>
> https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg04921.html
> 

Hmm.. I'm afraid, that I can't prove that it's safe. At least it will mean to audit .bdrv_open() of all block drivers.. And nothing prevents creating new incompatible drivers in future..

On the other hand, looking at qmp_blockdev_add, bdrv_open() is the only thing of interest.

And theoretically, bdrv_open() should work in coroutine context. We do call this function from coroutine_fn functions sometimes. So, maybe, if in some circumstances, bdrv_open() is not compatible with coroutine context, we can consider it as a bug? And fix it later, if it happen?

-- 
Best regards,
Vladimir

