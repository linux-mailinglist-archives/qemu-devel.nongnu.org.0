Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1A73A43DA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 16:11:47 +0200 (CEST)
Received: from localhost ([::1]:56852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrhsw-000440-8f
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 10:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrhrY-0002fE-3m; Fri, 11 Jun 2021 10:10:20 -0400
Received: from mail-eopbgr30130.outbound.protection.outlook.com
 ([40.107.3.130]:17031 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrhrV-0001Nw-VO; Fri, 11 Jun 2021 10:10:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYlZdyGkARpuNRrGeZKeBI8ENZOEw+2+/IC7NTqBZbGwT5E9C/mVG1GWvp7xhjQfdrDonLhcopOmpkcfO94uam0PxL4EaccP2nD4Nku4MSZ+v0txRt7THY677rugOYfd7G4Zn78j1pzSxbuuzFczKlblspEfWcMygQBlueOyoBscsMbcJyz0D26PjolrDsAqXkXhVs5zRSWKe9kBi+cMZ/Psfu1W72ywganffQNhHbGUTVQfSDi7JK+bWYgeBIp1TD9nufqSjVWSGEZLPPS5ajzye2+jRSyAJaJqYtr8Oe46OEh7cImGa2y31IPuWFV/jaMgty2ftGBOimskzQ1Olg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5E9q9ucT5md25UyMRdLyb+r4cTRLduw6HhyPWg+A4vM=;
 b=hL7c1q53w4+dO9C8Iiqftz5nbw2FaAHyF0HwkBl9Bvel/SGzZolcfm48dnIJtodmNgrs3jB5P4ZKTCV/swgylrGJd7UVLUVakx+Pn/1qmybpMBpRW06riapWThwqEuivYxvBI8NISUMPBTwbonNHkVqB3SCQx6D6zNU5/jKqqJKR7hY6Oqeh3umCPGVNA1G09zb1M4GEfEbsBH0SK/H33C40QJ3XIdufqYy9xZDzku70HOmrWimIYwDwZBKFiP63OmcsqxCdASc4NYrR7YgucmUMi0ekhwRYsThzAKkK4PxySQLfuzbjF8solA4C8srUlXhqteWn9uUt6R9FdfspnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5E9q9ucT5md25UyMRdLyb+r4cTRLduw6HhyPWg+A4vM=;
 b=iwtlV+gJXxQMy7uGHSL7K8ulgPONLFIhGJGPxZRCT0pVYu/N8oDBQ4tlynmy4Gea/uvNSzASqFFtSN4NrYcqPDzLHsdYOFOxLTIhbpxG6cSMzq7zN9uOmYyHuzlouUbkp6IJK33+BL579Hht1BsX8L7RM+xpPvXDxkpuFR9/bLc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3383.eurprd08.prod.outlook.com (2603:10a6:20b:50::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Fri, 11 Jun
 2021 14:10:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4219.023; Fri, 11 Jun 2021
 14:10:13 +0000
Subject: Re: [PATCH v4 05/32] qemu-sockets: introduce
 socket_address_parse_named_fd()
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20210610100802.5888-1-vsementsov@virtuozzo.com>
 <20210610100802.5888-6-vsementsov@virtuozzo.com>
 <20210611132228.k34szri6lv6c46m2@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <33d0c2b2-0bbe-589d-13e7-b7ab6d8c2b84@virtuozzo.com>
Date: Fri, 11 Jun 2021 17:10:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210611132228.k34szri6lv6c46m2@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM0PR01CA0105.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::46) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM0PR01CA0105.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Fri, 11 Jun 2021 14:10:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da783591-4854-435a-6ceb-08d92ce2a184
X-MS-TrafficTypeDiagnostic: AM6PR08MB3383:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3383B9306921DA846BB66748C1349@AM6PR08MB3383.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z7w1tA3D038D5hkCRjxe8Jdgr6yp7T785Wfc3k+802sDeT/k6Jk0uWNr/THGQWr6PlSlDfT2Qx4iizHu3JnyL1TUuxSiiKucNNMtsDa2UQHKKMJaZeqS1looR5VwSDzczlYkQ7vv/z0pACAz5meL6Snd3RZfm5y+K6kGoB9yv+hdVr+MYr/RVWZcKcYjb8MvAAUvpJd336w+NmOc4AAZFypLlc7Fx2raEPT9GcbvrLSyc3jMDmkwzdzBvu//fzivaKIWBnJUJIJlu6MCJ6r58ebnrGgQKeJZ4XpvSLu4WWCcsKNF/8GX17JFq0XE3rhs3rEuVfkCksspT2uJ7yDyspLcCLMOY8es6sPwwROWHXaBz7t+r/V3CJE5CslG1ElBy1uDAB/++cHyFdIf+KflTby0SuXz6LOZHPf9r8jWEAsVc+pazaULbxox9vFXkiv6tHE6GrkMyO3T4eJbU8wYM00Nq/JVo3CksoLEZd7SXRFATPyabjuWSu9IeIju1P9EEX3KDifrDpoOiiraILmo177ev10fWegeNB95P/6/mK9ZElO/f9Vt+4AM4wv47zxLlqzzMqNQyt4UTrESJFTk40SRoXo7liWJWqGh3f3GB8r0VioubRCHGhNSByjj2mz6gDTh1wqBeq7RE1ai5ZeEgzEhVIlENEzwy8zsNvtQrn6pfMETjVN8fBD61YdnLriH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(39840400004)(136003)(396003)(31696002)(8936002)(2616005)(38350700002)(956004)(6916009)(478600001)(38100700002)(86362001)(16576012)(316002)(4326008)(66946007)(66476007)(8676002)(2906002)(16526019)(26005)(31686004)(54906003)(66556008)(52116002)(186003)(5660300002)(36756003)(6486002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzFvSHJpblZuZURHdVA3cmlHY0NYb3BNRk9WalloRUxpY3VreWNTV1hBSFVl?=
 =?utf-8?B?UTIxMzBNS3VkcjF0bTFxMW9pNWx3QXY0TThTT3NEako4bmRSY1JjNmovcUM1?=
 =?utf-8?B?UXdla0ZjV2FXR08yYXRyRnBnVFljTlFQV3VxQjJJRlU5T1dMbVg1aEFRb2Rt?=
 =?utf-8?B?cFp6d25YUUxXRDMrbTlzUDR2MFl4QldVemZDYXUzY3hmeE1nUDVpWHdlYmhR?=
 =?utf-8?B?bkZjSER4UWRLbHRTb3RYdWczdjFKa0svUmdXUUZVbUMxMWF3Q0oxUlFOL0o5?=
 =?utf-8?B?NmtDREhpeWcrRzFUbWM5SXlKNmJuNW5qYmFldzVZQ3NJUGY5UzlBck85V3k1?=
 =?utf-8?B?SXVCelVRVEhjb3AvZEVDclZCaUZvc0dzSGtaT29WZVhvZ0dZL2VFQ0dORnZi?=
 =?utf-8?B?WkxXVEJRcFY3TVEyYXhyK2pnNXJtK2hJQXQ2T21lSTA2cko0VHNiWi9mZmg0?=
 =?utf-8?B?eFBpc0JpZDJYeE9XYXF4UUIvTXFxZStYU1ZEN2VOSVR5VWxGbVlNZTIvTUpB?=
 =?utf-8?B?dGQ1Sy81QmhZNEdndFFwMFdDNHBYdHhnc0ZSUlJpQ1hvZ0hwSWtHOUJCQVZM?=
 =?utf-8?B?MXNHZkZWTzRXT0VSbXNrQWEwZk10NWVoMkN6eENoNUNyclowYUs5ZDFpVk5v?=
 =?utf-8?B?SVBSWFhDVzNOT1Zha2pMSGtKcFNET0d0WjJCdGgxQXp2ZDJrRitWU3dhZlJm?=
 =?utf-8?B?NE9obEkxSUI4Z3Y4Q2E3QllEVEJqeGwxT3Z1czJhbkR4MmtRVWNpSGZMMThi?=
 =?utf-8?B?QXBITmR0cWJ5OU42UXdmWjVLRzJmZThuTmNVRVdFdG1PRHp0bjUydXQxaElC?=
 =?utf-8?B?em1MWnI4V0ZOTDZJdzZNWU5pSVFqNmg2cStSZHdmQUUyNXY4a0lTSDNTSkdJ?=
 =?utf-8?B?L01IVHhReHlPenJqYyt1Yjd6ZW9XcFQ1Z3NGU3FkdGlhWXR1eDdCM2lJRDZp?=
 =?utf-8?B?UkIza3doeG5nS2FJcDU4RThOMzVBdWNia0t4SktxbUhnZGxmcGZCVWVjN1RX?=
 =?utf-8?B?bnJtTkRSVDVndXc3L2hzblF1VTBnZzdranM5eTA2b0F0QktRTjdYQ3hNRHdl?=
 =?utf-8?B?cnpMNDlIWStTRG42bjNFcnEwVkJIcWV1SjJyV1hXMlN6elVSbnQxdy85bzNJ?=
 =?utf-8?B?d0N3SWcxT3JiOFlLNWQrTFpnaEEyNWVCTzFFTno1LytPMUtHMllmYnJGOGNl?=
 =?utf-8?B?WTFlMzJ2bTNXakEzK1ppREFGOXhEajNDbG1ETnVLM09nUW05TmljV1B2Q1pE?=
 =?utf-8?B?cEFzTEUxUTRDKzNwR05Tbm9CdEFGVzVZdldVa08wRU0vRTNqM1F1L0xiMkRq?=
 =?utf-8?B?Q1FZY20yN0xPa09kN3BiTnppWW1kaDJwRU5OSzFDVWE1cWhLL1FmaGNITHlO?=
 =?utf-8?B?NUg1MUwzR2w0SnR2Rk1jdWE3a3FNYTNteVhMSjBQdkJ0YyszcjI2Yk9UREM3?=
 =?utf-8?B?dVBtU2djQlR6RUZXS2VqbXdvYmhSM2FFOE1JVHRRem81T25BbjJxNVp5ZlRQ?=
 =?utf-8?B?THdROVd1Y2pKSHdTVUNaWVJ1dkRyT2RKaTJSaVI2L0hJY04vTW9EZ3RlRTlU?=
 =?utf-8?B?NU1MRXorWld3TEhENjhnb0VaWHRPaDFXaWN1KzVjcSszVlBRZUFYUWNNQXBu?=
 =?utf-8?B?OXpSdHhjL3BCQ0lsQzdJN1FEdkZrZktra04vUStra2YzZlBTYy9MWXRmZ0Zl?=
 =?utf-8?B?dEdwaVhnNUNoRkkrSlI5YURnck80Vk9wa1ZWL2VxaGptdXlzV0dnck1IL3kx?=
 =?utf-8?Q?lqv92EXF1Xoqsu3ZxjNhJ7yX+9dadr/PsUukzTI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da783591-4854-435a-6ceb-08d92ce2a184
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 14:10:13.4274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KxuFHx+gtItINgj1EtLoDz4ZEVmcGw+sCrz5BhbNZdpCjM6MNsFi3vENOXJNjmEEOQxHY845kAIwYQWnXBFwU8AurqHyKNL2R13jndYQMXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3383
Received-SPF: pass client-ip=40.107.3.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

11.06.2021 16:22, Eric Blake wrote:
> On Thu, Jun 10, 2021 at 01:07:35PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Add function that transforms named fd inside SocketAddress structure
>> into number representation. This way it may be then used in a context
>> where current monitor is not available.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/qemu/sockets.h | 14 ++++++++++++++
>>   util/qemu-sockets.c    | 19 +++++++++++++++++++
>>   2 files changed, 33 insertions(+)
>>
>> diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
>> index 7d1f813576..1f4f18a44a 100644
>> --- a/include/qemu/sockets.h
>> +++ b/include/qemu/sockets.h
>> @@ -111,4 +111,18 @@ SocketAddress *socket_remote_address(int fd, Error **errp);
>>    */
>>   SocketAddress *socket_address_flatten(SocketAddressLegacy *addr);
>>   
>> +/**
>> + * socket_address_parse_named_fd:
>> + *
>> + * Modify @addr, replacing named fd by corresponding number.
>> + *
>> + * Parsing named fd (by sockget_get_fd) is not possible in context where
>> + * current monitor is not available. So, SocketAddress user may first call
>> + * socket_parse_named_fd() to parse named fd in advance, and then pass @addr to
>> + * the context where monitor is not available.
> 
> 2 different wrong function names, and reads awkwardly.  How about this
> shorter variant:
> 
> Modify @addr, replacing a named fd by its corresponding number.
> Needed for callers that plan to pass @addr to a context where the
> current monitor is not available.

A lot better, thanks!

> 
>> + *
>> + * Return 0 on success.
>> + */
>> +int socket_address_parse_named_fd(SocketAddress *addr, Error **errp);
>> +
>>   #endif /* QEMU_SOCKETS_H */
>> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> 
> But the code looks good.

Somehow, C is simpler for me than English )

> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 


-- 
Best regards,
Vladimir

