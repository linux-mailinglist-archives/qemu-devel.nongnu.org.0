Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C7D37F60A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:57:18 +0200 (CEST)
Received: from localhost ([::1]:41532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh91p-0001Db-3t
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lh8x3-0007vx-LF; Thu, 13 May 2021 06:52:22 -0400
Received: from mail-eopbgr10126.outbound.protection.outlook.com
 ([40.107.1.126]:16087 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lh8x0-0005Pa-4B; Thu, 13 May 2021 06:52:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LasuIrntvKFjJAbuRRH2+5taa2AzJZrIuRT0OhcoulDodxIhDr6HauLM++byULjpAN1G055YFHtFnYDPMVAFeEeXH4t2WE9CfuBtE/qiAGSwmBVLh9Gc9usFTM65l6cF8ayYV5y5EsBUNkohoejat7+GC9WwJLB/vrchLPFQWPD4HQ1mjEFOqaTCYm0k68Q79wMuLsXswZ6zGDvXxnxeKMmibQ99tmSUE5lvna4F5orojw0kNHFkITaEMVGYhDv555ptnyBCdT6Z4xmqOhMSowTVRN7HIao7r3Gc94e7LK4/JIMG2JEh9B5JPJ5o/3VaMK1GcfVuobL9GJHZ3ax83A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iSAQtQSHouuiRpUFBmMomtCbvRDxMeomMoknWkC5p8=;
 b=ai6f/Ebanq6eKynIW/slV32IaxBImLuRD3xtdv6RGeZWUjlF+qWrh8xJ0h/uzYPeDFs90d71UCDImTwf+w8gGVxmxVYEkTFi+Fzc8H+99C89P+eaJu0DAKzHdDLzjHpk/zsvw+BtUTJz/cqsdEPghP3OkJZGuHdGAAeS8faa/2Dmhtv5OmJl2ZPV6RQdcOBmCYbLGCTCKDPteAN9NAGiXPUe+uyMEf4THG22MtD5KyNVSmXQSthSfdH4MqkUXUg8K1zCBiMRVUFywembwH75kfjO0uIJmlq1FsglHlXfsrSvSdrhvleI+Kf7EpJdHtvmDpuJO7jrzDkPYQ70P8jonA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iSAQtQSHouuiRpUFBmMomtCbvRDxMeomMoknWkC5p8=;
 b=pZ/+uONPqQvxF2sGEbIxiOm6/zXWGbn7m0gQoN4aRHOxq4+OyW3hwvscbzDKWA6qLkdmVghmG0Sk17hTTvpDZ+Ogxh7uBjCXswJtosyO8ct5x/49IN2/MSjIRAPISrCM3TEbWi4UbnQZ2pSaVOOses/CdHkDOOxx7WQHReOS4Hk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5381.eurprd08.prod.outlook.com (2603:10a6:20b:105::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 13 May
 2021 10:52:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.026; Thu, 13 May 2021
 10:52:10 +0000
Subject: Re: [PATCH v2 2/4] migrate-bitmaps-postcopy-test: Fix pylint warnings
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210512174318.59466-1-mreitz@redhat.com>
 <20210512174318.59466-3-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <43b7c7dd-5a8a-b1ae-b2ad-c9fd158a3922@virtuozzo.com>
Date: Thu, 13 May 2021 13:52:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210512174318.59466-3-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.219]
X-ClientProxiedBy: AM9P192CA0026.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.219) by
 AM9P192CA0026.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 13 May 2021 10:52:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c63219a4-af8e-4c50-651f-08d915fd28aa
X-MS-TrafficTypeDiagnostic: AM7PR08MB5381:
X-Microsoft-Antispam-PRVS: <AM7PR08MB53818CC115C7FDBD60BC8666C1519@AM7PR08MB5381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ne3UbemcMYV65iMOI1k8aTLkxqlrEhx7BAs27VusAVtgKubv/u9+fk4e9D73+7wXR3KdSblRNmUsD/OhYeJ7K0pERqc+3k1Jvzqm5xu5bW25aIp+W/4c3eO6cqOjLF24ZYb4vXyI93Ps2kAscFYbVgXmM6whyEW5l2XdwfElic6yWAqDMNmrLWAUKjpImT0FaRw7vrX6DlMt22UcsHPuAsj21j8LIyJpSJWJ0yiqZpxCXtwm7pMp3RgInsamdghlMQayKDmYWROZjTKknflIHFnY35WabsMsgVEDmlvqjpLfMxnTXVP6lNhJA35RAj+HkP2AB+FDbkbRefXJ4zNzb+3Ms+EQp/PGD72qqF/OJqcs3kYeeEk2vwz7ei1E3SlkKnvLBbmnxiHQbyERaq3TLS7I73Wm3wVF0MA6tdmgqTKgicHsOR2WN0ixV9mIvYwEJ0Nzb8Rr/GhaSdtvOJ2ea6T4/3W/I6tKVyqMaFfqhGbT/Qc4yoo2fj+8dbcEtA5eON+wGXS1ywxLMsofMSsHGamn9RYNMgNQ3NW6aoeTXIrcI3th7O8KvzVZSDTTBQny7oZ+FUpyDBHJsfxLu7Oy+tAqve2Jg5NaWhUvmlhB1GfH20Uhz0NJKU8bJCXP4Z3Rnqj5UzwakgDxheEgAg5p1/ksdy+LCgwID1R4StceOJL5WU6eCd9xUUb71rA6yzcXL1sErMsBWUhqJkPCZKaiYQkY6VCHQ5HlhPC10s56ctQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39850400004)(66946007)(2906002)(8936002)(16576012)(86362001)(36756003)(31696002)(186003)(5660300002)(52116002)(31686004)(316002)(16526019)(66556008)(478600001)(26005)(38350700002)(4744005)(956004)(66476007)(6486002)(4326008)(38100700002)(8676002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YnEzOWg5d2Z6UVVSSTR2MDdHMTZXQk04SmlVZlFDV3FzZ1lLYkx2dEFBR2FH?=
 =?utf-8?B?Q3F1bTFZOXlxODBQYXRCVGRWWW1WdmVEZnFZUjlkcmcyWVN0RTRrS2RRTE50?=
 =?utf-8?B?em5OUW1aaThkYUtYQmZJOXFzUGNLcmNIbEU2M1pKSit1Um02RlZ6ZGlPbk5W?=
 =?utf-8?B?K0t4eW1RU3lmWnpmbjdkRXAvZWlmbXVGbFRFd3owWjh2TldldUhrWVZhMkQr?=
 =?utf-8?B?OVZBQ3pEbUwrSUtzMmlyQnRhbnJybmlZTzI4V0p1SU12VnNmbDV5ZzlFNGpD?=
 =?utf-8?B?eFFoUmJpUUg0cDlWak1xR2gxL3FqQSsxanlNNCtNeUhtMHA4T1ZqbWw2REJE?=
 =?utf-8?B?THBVNktZMG90VHZ5YTh0WVFydFI5QmdSK1NwM0lqZG5Ma0hIRDFyWjk4VlRB?=
 =?utf-8?B?TGpyUmhpQ1lVL2Z1c3RieWJHMHk0M1dQUWFycW94TnVBME5tbFRaVE1mMXpC?=
 =?utf-8?B?Uzl1QTljTkduL2N4ZUZzT0FiNTR3UlQ2OGNGZncrdHU1Wms4SE15eTZkb0NQ?=
 =?utf-8?B?V3ZGcTNRZnQ3WXNmRGMvZ2tOdzlSaTAzK3k1V0NNb2RJZllsdHNrd2tHUURv?=
 =?utf-8?B?cjhIY2JwWlVnaGpoeTc2Z2RsVTcycjRCYVFFZVVDcHVpYUt4dC9jczRlU2Yw?=
 =?utf-8?B?bitzVTZzM3NNZjhlL2NpMzJBSC9Ba1ZKaGF4QVNWRlN1bWFBSkhRKzRPK01X?=
 =?utf-8?B?UUFqTGVsRFVOUkpqd0JkdXpxUlJNWUFxMmRFUDh4NEZXWXp2SHNCc3pZNWtH?=
 =?utf-8?B?NDB1cWwxbGFqWEFxZFhnSkxKZEZjYmQ1NlRvaXJSVlZCRUpkemF2QkVBL0NU?=
 =?utf-8?B?UWlmNk4rWGw2b3MrOW14Q0VaYmJIWjgvUU9uZHhqWDBBblBJaTdiL2pORExt?=
 =?utf-8?B?V3VNa0hwc2h3ZW1sYUt2QzA1bTcxb3lyUVZLUGp6VEp4d2xIdVJTVmhsOGVn?=
 =?utf-8?B?MGdOYmxvWDZPQVVjK1NhTjhub2F3bVJhZVVtWXREUTZmZVpKaGs4eFdJSXgw?=
 =?utf-8?B?d3N0NUtjd3hJWmVSSXBMZHNKK0t6U1NjdUVCM1Jwb285NXhWbmVvb2VpMXBK?=
 =?utf-8?B?T01RTy90STFBVDI4Wm1waFh1MWpQSWs5ODNvZ0Q4SGxieWpVK1A0SUJHdGw0?=
 =?utf-8?B?SHM2NEJmaGNHZWVmak41R1BjZWdhcDF0SmdtNVZ3WHV6b1FZSG5XT25kTTA2?=
 =?utf-8?B?YVZZZFBnZWZ4K1Q3a09YYmIvM3FWWjF6NlJvQ1JvcGYrcmFWWjgzaDZuZnph?=
 =?utf-8?B?Z3BLRVhFN0tJall4c05iZHpPWGpiMDhZZGRKbW5ZRXk3YndQMHFHUDZCYVVy?=
 =?utf-8?B?U3ArL2xnSlYvaFJNUkpaMnIzQUlLUEJCTXdJWkVZbmlOVWtZWFR1M3JEQVBn?=
 =?utf-8?B?Q0NaU2tDdnIyTUorT2QxbEdxVGttem9wRDJ4TmRmNXNIdmRPYWxBMzZZam1n?=
 =?utf-8?B?dExmUHBTWm5BRXVTT2xSYUN6a1kzR1hCRERVOFFtd2Q2SU43VW9WNlI0UHpu?=
 =?utf-8?B?WTVkcjNxVXpzOWNlTEdvY08wd3dqQ2ZyWnZVVkRPb2JwNUY2OXFkalduV3pn?=
 =?utf-8?B?MUtpZUNYSXRVYkNrNktpL2hCby8zL1RQUmFVMXAzN2M5QXRBMTRqV2ppK0NY?=
 =?utf-8?B?c1JzMkgrYTJ5TGJLcjdIS0xQaEFBa0xnaXdDUTNmZUJmQUNnQmZJZVd2MllD?=
 =?utf-8?B?QVlXZHNkM242SGlKZThGTHY1MWxRNXo1NFhyd0pvblVjWkUxamFyR3RXRUJ4?=
 =?utf-8?Q?yuKCma+zLpHd65tupK1eEt0fHOL5fGVPqHy0ZiU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c63219a4-af8e-4c50-651f-08d915fd28aa
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2021 10:52:10.3676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: it3iKDcyczmRo4vzf1+agIxjNsI6nDKn3ORioAWS6dTMxqxKxuQMa1oRIVaKWDvf4/hFxDCdSei/azS/UKNSRt0fKpnHKIdNL5lNv9yXuAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5381
Received-SPF: pass client-ip=40.107.1.126;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

12.05.2021 20:43, Max Reitz wrote:
> pylint complains that discards1_sha256 and all_discards_sha256 are first
> set in non-__init__ methods.
> 
> These variables are not really class-variables anyway, so let them
> instead be returned by start_postcopy(), thus silencing pylint.
> 
> Suggested-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> Signed-off-by: Max Reitz<mreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

