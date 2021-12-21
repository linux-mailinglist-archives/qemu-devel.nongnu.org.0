Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4122747C1DB
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 15:48:49 +0100 (CET)
Received: from localhost ([::1]:33212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzgRc-00086c-C9
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 09:48:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mzgKl-0007MU-6p
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 09:41:43 -0500
Received: from mail-eopbgr130109.outbound.protection.outlook.com
 ([40.107.13.109]:16870 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mzgKg-0003cv-9a
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 09:41:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVhvo0nAvq420dxpMm9Dx/A630z6E8wtYjHia3LsU/S+G8+S9j0nTmt+WIDh8/CP3VCNPrYwDreQKSs31sJbaxuaWHNvEz+x3+nuAas/E4RtzxWJ1o7TitB5wK6+p4wQfRp5jJ9jyXWP8J2aPLvpimoshn0N8u1oepZmrzxvkkiJ6XXOsnt0Yl2d/izWRZ33jq76Z2EE528mIDCvwmrXt1DY2z3UOX8WcPgr4TqT7JTM7zHiNuGP2KDhNXK/9xEvMxPmSU9JMSHwpdxxQQdkCZRl2BRh0/BTF0N+HmPlqigBgVVqpRWiD1RMJPQUS+95eD2vR51E6UvhIzkaFW/6AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIZNrFGF9qTZ5w9B8q544PtZWa0EHZWJV+0OS65HIo0=;
 b=TsrvB/dXWH4osNalGcEE1lzzRPzwsUMJ0bZGtpJEOX7yT5jZK4PenXYT6BGbl2rqu84N+nTy30sSDKEsJm0VGyStQ3Grx1d3iYF2HhwbAuwi84shLWeiLwtdogMgnSi0QhNpVwVJV5TAGy9FyhtCrl90SE4awUwxmkqZFHt99dHU2s+8nNUzw01ZyXy/nwWlwK/uBCL+PjHoSUUoE+IVP1wn4bvewLNL9wzKh3dL6GLWaP0e1Bbn3aA1s0Y1V/iLqpyCR0oW+5Wi0ToA22DP2xwjEcg+wlVlM8Nv2ki2UIkcI6MCNGT3z5oNgOxlpxoGZkYrxGYIy5GtMu0XhF8WWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIZNrFGF9qTZ5w9B8q544PtZWa0EHZWJV+0OS65HIo0=;
 b=Hx8pa+znjm0G9Qta93RwfNZ6wSQc3HTzMutVDJEpgMHkxqZvJ29vcamQzBY7BALwFy+0Ag1/m/im+Ao5+YVhhpOBDXWHbVTb6TY4Vk7uv6+mqIXVVIo90IgS7RcXleycMn78TOUAnqwRX/AGLetISGMw035z0gpSRA1oANq8Frc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB7PR08MB3435.eurprd08.prod.outlook.com (2603:10a6:10:4b::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Tue, 21 Dec
 2021 14:41:26 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::c1f8:2b2d:9298:7550]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::c1f8:2b2d:9298:7550%4]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 14:41:26 +0000
Message-ID: <705bb47c-78a4-c66a-e0da-7871786380a6@virtuozzo.com>
Date: Tue, 21 Dec 2021 17:41:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/2] qapi/ui: introduce change-vnc-listen
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, eblake@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com
References: <20211220154418.1554279-1-vsementsov@virtuozzo.com>
 <20211220154418.1554279-3-vsementsov@virtuozzo.com>
 <875yrihwmm.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <875yrihwmm.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR02CA0008.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::18) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5519eff-3147-4bdc-9317-08d9c48ff79e
X-MS-TrafficTypeDiagnostic: DB7PR08MB3435:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB3435C9DA52F10FD30D384CF9C17C9@DB7PR08MB3435.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NwUUND8TAZq9Ln+SroQsekFIus29zveOJ4EO4VAYAy48byhal9Hda6wGaONfFHH5Twb+7FIGy0z1m9RzZgVSs7XDatC1vdzyPzWoYivDZi/03W775J3oDnURifog391JJYWoAl4mG4Gb9Uctk9mwFxsUo+3NZ6K2mHa6A9HW9glVcJan5XIhlNOndj+y2DGELJ15GI1Kc0dXIQ9hoG2iYL2dwGd4skscrnVWNoGZR63+YN2DzbpdPAphtdUd5dO9iYHdHEMnDw8jhkn7ks7/7zG1iIjEs53EQ74mj81UhC7tMMxbOgkujP9uijR5h7KS4JCR9BAVIou/fESv8GlqblTDjkowAMOen0VhMaB/7I/wqwuICgxaPleN5FltWjqtOZFw6U6p/H7wTKzj02OU7Iu1go4TeXCpbRG4ySMCTM6PIvdOseo74YZnH3dYrdMGsS7NBkkc7l0KlnNy/oCQhwIkMVd/1E+Nf7I9+EKUCGGXCX7y0VasIir+irgt6ApFHiKQeG3q+Eq01EC/iSBLod+8cshRxEvfbf6Ut8M9mV1pqZU32octiZ6gOOVmdkJNKGh/1LWGklciMJ2h5LdAlcogu8JmBiX+mVa22oMIpF4r6QFcMuIOLLsulkZVH/i1HtcRkIqhZpxTcvZuFq7Oz0b7vnlOywKGPpUgs5wPU+3rN9C1d3VfF++NIYHEnDP+oGt/kGPhbooOpdYGA9dPwUjKs/9MgIgcgdprr09WowWE52gMW/h/q8ADAWImy87W/7jNwjFw0rQNROlZPJWmqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(66946007)(6666004)(66476007)(31686004)(52116002)(38100700002)(66556008)(6916009)(4326008)(38350700002)(8936002)(6486002)(6512007)(31696002)(5660300002)(83380400001)(508600001)(8676002)(86362001)(186003)(316002)(2906002)(6506007)(26005)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2J0L2p3UWNKK2l0V3hST3NaeEdGaWNmZHVtdG9PMXhUbTl1UUxrcnNZVkgw?=
 =?utf-8?B?WmE2ZmxmeUJoZlBrMUN2d0hxTTBHVEZYenpVMXM2M2dmSmtEejBrcjdidGFW?=
 =?utf-8?B?dSs2eEpKMHhtTEsxWnd2eFNRTnk4NUtPRkxmblMrSmMzeEZqOFhFMFgvQndt?=
 =?utf-8?B?VHZVV0xZeFdaZWJJVVoxZ0dCKzVNWjJSOUlXWUdyb2pqRUsxMlovdTczREFa?=
 =?utf-8?B?blJXQXNxSDJwR3EyVk1abXZrK0FadnQ2Q29MeVc5aEhvT0dOdjl6STB6Umk3?=
 =?utf-8?B?QTJyVkxhWnhpNUJ1SDVUUGJPbEdJeVoxL0l0dzVybkpJeXQwTWJoYVB0MGtq?=
 =?utf-8?B?UUdRWmlTWGcrTmwyd2VxaFJHYzJZM2NBQnlteFJCRlVESlNsOEZLcm52ZDRw?=
 =?utf-8?B?QTZ2RmZDelZ2L2RwbW5iTnAwTWM4SDdoQWx2VDUvRC90aUs5bVU4ZzNjeHQ2?=
 =?utf-8?B?bUNrNHFtbS9CcTFYY2U1SG5tVFEwZkFmMlZVUlhmVzRQVHQ1NS80QlhSSUY5?=
 =?utf-8?B?NVd1K1dYcXR0MWovblBHcldsNjFycm5tdmdlUS9Qakx4cFNPQnVyMFFRK05Z?=
 =?utf-8?B?cE11TnNlMmJ5RG9vWHJlSEpyRnZBNmZZZEVQZmtPU052ck5kS2h1NjJTR096?=
 =?utf-8?B?eFJia2tUOE1jK2IwTE9GTEhvSXFKa1JsL2F1UUhiMHc0U2IyRXlUZEM3V1dM?=
 =?utf-8?B?MGJkYlBSMjc3azF5YjJjQXVZR0xvT2wyeXdTNjkxKzQ3ZENoRHBzZnFJOFNI?=
 =?utf-8?B?eGgrWEh2QnRudGtxS2U4cU4wemxjOXRGc25zc0M2OWlIazZvTUh6YTlCZk15?=
 =?utf-8?B?Y01kUDJFdW53aHlOM203TEFUN1lWREgyZVFlekVIV3BCVHRLU09QMXRZbHFa?=
 =?utf-8?B?eEZwUmNCUXJjUENIdFRxQkpKUkM1d1ExNXkvT0x1amFYVzNKTUsxRjJiOTZu?=
 =?utf-8?B?YmhPc1k1dXlCQUVHbkZwN29KWmlEcTMrTG5idUxTbmRQR3NJbnNCb2syNytm?=
 =?utf-8?B?KzRsc3RzTlZWaE93T0JwaGVHdDErSWxweDB6amNLbkpMNHJUSzVaNzNzOXJv?=
 =?utf-8?B?RVo3cDZ5SWNwdHh4ZnUzbmxnQmQ4YThybURYbFVUaG5admY4OTZQcjhPaVMx?=
 =?utf-8?B?cTB5S3dtOWpRR2dzL0xQd2VST0x6VWlRa1piU0o5c25kZmZjcDVQMVEwYmpZ?=
 =?utf-8?B?U2RWdG0vd0lBMG1pODBmaWR2Q0phZlJISHZ3QTRPTzB0VVJoeEN5SHZNMnJK?=
 =?utf-8?B?aDROcVR5N1dHYi82N3JqaTllK2VTd2lTaGRxRHhEY2pLM1hzdzBnWjhURG4r?=
 =?utf-8?B?TVI0LzRoblRMZk5nNTdWMXh6STBCcGpzQ2gvaGhmSW85dEo4N1BDR0pXWjJN?=
 =?utf-8?B?K0ZqQnZFYUExUW1UV0pJWWxmMmtpZ1BPV1VJczlLK3lVOUVBSm92dGJTL2pT?=
 =?utf-8?B?dWFaczFBNlRTMWJvUWtCdno5MGJnQ2NzSE04SFQrVHZIN3ZLMDdpSTBidk14?=
 =?utf-8?B?YldnNUNycDdSSEdqLzk4aElzTHNwY0sra1VESFlrbnRVSnZ6NzhYbVQ4dWNL?=
 =?utf-8?B?ZTVTTFB0d3orZ3dxWVNuSlEzYzFjaXQ5V1NDMGdxYktBWW5VTlgwbUFQSTUv?=
 =?utf-8?B?QXhHbGduangyVzc1T0NjSzBWSlhmMmxTMFhTK01JZDZXdndubGRsVyttTnB6?=
 =?utf-8?B?SDVzUFRTcG11eVZ0aDBJa3RFOU9Nd2ZWQUtKSTU5a2xLWVdFNjN2VWxhb2JR?=
 =?utf-8?B?UlBYK3VEbXZSdWlsaXU0OWcxY0dBeE0vSEJGaGorSmVzWDUyZmR2UVNQbmpZ?=
 =?utf-8?B?Z0x2TytTY2NxbUFOdVREdXgrUk5mS3dTM0VhWFpPS3E1VVZ2TTlBWjdHMzdV?=
 =?utf-8?B?djRNdnZnL2dzbENOaGNybUNZNGQ1b3J1UjlsM25ncWxLOVpmV0xyVHB3TXZp?=
 =?utf-8?B?NUxpcWpzMk1Uak9xaHNsYjZkMXU3cGJoWUNDYVJtNHREWmdUNjMrcjlvQkFp?=
 =?utf-8?B?TVNwemdPV29Bcm95Nlp0NU80RDlKdi9nZVYyenMzL3lMeitOY3Rkb2daUkFH?=
 =?utf-8?B?VG1JaGJwNVhCSWpwOStUekphcENldnJPMEpnSEJyQmp6Qzk3a0VxNUNkWlFE?=
 =?utf-8?B?cEZaeTR2WEgzdXBWMDBTUVF3VmZVU0FyMVA4U0VrTkc5L0FMaHZ4RURLc0pD?=
 =?utf-8?B?ZytWTUNsVm9lelRpZUEwdlcwcUp1eDJsWUJ6bDI4RERabEJBVEtmeVp1aFJp?=
 =?utf-8?Q?jEJxhzBvRUStuzrHG1UNHqwwvb6IbnrdD8jpo2beRc=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5519eff-3147-4bdc-9317-08d9c48ff79e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 14:41:26.5398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EqHjalriVyqKeU9qzlsYsABOExqWOJmgquslFi4lN+DJPTsP+3xWIRGUL6hUzoCmcGjRQRQSNZTspiUWX0jmse99ZnwqpN4a4UgkrphIj0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3435
Received-SPF: pass client-ip=40.107.13.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
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

21.12.2021 17:15, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
>> Add command that can change addresses where VNC server listens for new
>> connections. Prior to 6.0 this functionality was available through
>> 'change' qmp command which was deleted.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   docs/about/removed-features.rst |  3 ++-
>>   qapi/ui.json                    | 12 ++++++++++++
>>   ui/vnc.c                        | 26 ++++++++++++++++++++++++++
>>   3 files changed, 40 insertions(+), 1 deletion(-)
>>
>> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
>> index d42c3341de..20e6901a82 100644
>> --- a/docs/about/removed-features.rst
>> +++ b/docs/about/removed-features.rst
>> @@ -348,7 +348,8 @@ documentation of ``query-hotpluggable-cpus`` for additional details.
>>   ``change`` (removed in 6.0)
>>   '''''''''''''''''''''''''''
>>   
>> -Use ``blockdev-change-medium`` or ``change-vnc-password`` instead.
>> +Use ``blockdev-change-medium`` or ``change-vnc-password`` or
>> +``change-vnc-listen`` instead.
>>   
>>   ``query-events`` (removed in 6.0)
>>   '''''''''''''''''''''''''''''''''
>> diff --git a/qapi/ui.json b/qapi/ui.json
>> index d7567ac866..14e6fe0b4c 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -1304,3 +1304,15 @@
>>   { 'command': 'display-reload',
>>     'data': 'DisplayReloadOptions',
>>     'boxed' : true }
>> +
>> +##
>> +# @change-vnc-listen:
>> +#
>> +# Change set of addresses to listen for connections.
> 
> Please document the arguments:
> 
>     # @id: lorem ipsum
>     #
>     # @address: dolor sit amet
>     #
>     # @websockets: consectetur adipisici elit

Oops :)

# @id: vnc display identifier
#
# @addresses: list of addresses for listen at
#
# @websockets: list of addresses to listen with websockets

> 
>> +#
>> +# Since: 7.0
>> +#
>> +##
>> +{ 'command': 'change-vnc-listen',
>> +  'data': { 'id': 'str', 'addresses': ['SocketAddress'],
>> +            '*websockets': ['SocketAddress'] } }
> 
> Lacks 'if': 'CONFIG_VNC'.

Oops, yes.

> 
> We already have change-vnc-password.  You add change-vnc-listen.  Is
> there anything else we might want to change?

I don't know. I have a request to change only the port of connection.

But creating a special command to change only the port is too specific.

On the other hand, creating command that will allow to change many other vnc parameters means deeper refactoring the vnc code, it's too much for me.

Old removed "change" command allowed to change many vnc arguments as I understand, but they we parsed from one string argument, which is bad for QMP.

So, I decided that the golden mean is make an interface to change the addresses to listen.

Actually, I don't need "websockets", and even don't know how to test them, so we can drop this parameter for now, it's simple to add it later on demand. Or we can keep it as is.

> 
> Aside: what's the difference between change-vnc-password and
> set_password?

Looking at code, the difference is that set_password can also change password on spice, and has some additional logic  with "connected" argument.

> 
> [...]
> 


-- 
Best regards,
Vladimir

