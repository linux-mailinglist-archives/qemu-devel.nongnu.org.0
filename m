Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C1C3918C8
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 15:26:43 +0200 (CEST)
Received: from localhost ([::1]:56314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lltYX-0001v4-M9
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 09:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lltXX-0000N4-ON; Wed, 26 May 2021 09:25:39 -0400
Received: from mail-eopbgr40134.outbound.protection.outlook.com
 ([40.107.4.134]:17293 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lltXT-0002xa-Ry; Wed, 26 May 2021 09:25:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/bbc9EvpxFAIPJioNRtiAMQEq78147edeeImvhEQ2MU1Og3eWzOMBjy6jFqj+fzspdddKJGNOT4XSB+7VBCMlrjG3pZttF2loD4iNJMP4DX5hnHh0DkzXCBGg21q7TuSc4npfhvRFJNjGDz5o7Yt+ICieAKQQqDXeXgqfRmMTTpOMKMUltcyQaeQsEsmoh9abcxk40FuyIAtqbJHQPYwNzWR0tSE/++AskwnxRySjb4MZaVQMLDzPJIOTGLUaLErNMRDuCMK8GW4S7s07Oun5gf3iNnRdLnkKVQWFLJuE1xgFn0nliNKUQ07wrDDjrI2VL8WG/PEqQc761gNIWQuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0EaighP0AIoOOFShWULWqnRNQEz6TVZ2gwRUyhg8Os=;
 b=b9XKuBM9NZiqX83YOKjGITYjdMILcCdDGyZ3yTSSTUFLM0eo7SKYHEN8SxNVrS98tDiv0eCAgD8QzFHiV+caJ1GNsjlwPogPu1yxBKCFcEttqehi8kDs/fK6FbXvY66bctbLhNDyKXrFSTH3T6aqrmf+A31LgZ1jYIlpt9Y/XyaUvAIaD+O4Jl6/pa8Fqwp5bJZPCLOzfyKuJ1tCZows6iSbmPQETJO9jYLJTcY1zXjEveOjzO0/PKeFN6/2UKmBf+VHEWPqdFMpu0SfFeLr8y4Y5+vs01UYGwrg54A7y1wS4gFURqM5YbF7rqnLXh95DfoC0u9RM9T/CeyDUPGtbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0EaighP0AIoOOFShWULWqnRNQEz6TVZ2gwRUyhg8Os=;
 b=nE69HoTQCC2uZNyiW7cSZHkT0e1B0kzL0gTn6mIpzJT3w3B/Gb9beA1JCbiJurGs/xUnROK15HxjiQR05NSH1ikym4TJEGLGEjd5Ce7+SCXVfxJxF9DfHuudGuk3K9q/8cvmQJt6tkcm1Fj36ITJaZsFnUmcaE6tQ/pWZm3D73Q=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4279.eurprd08.prod.outlook.com (2603:10a6:20b:bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Wed, 26 May
 2021 13:25:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 13:25:31 +0000
Subject: Re: [PATCH v4 04/15] qemu-iotests: add option to attach gdbserver
To: Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-5-eesposit@redhat.com>
 <becc0bde-5de8-7cd3-0b5e-76bdb830af11@virtuozzo.com>
 <e0162706-db5f-0f1e-2c65-5291fca26eab@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4009d11e-c013-51ab-1fa9-62ed2157cb36@virtuozzo.com>
Date: Wed, 26 May 2021 16:25:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <e0162706-db5f-0f1e-2c65-5291fca26eab@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: FR0P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 FR0P281CA0045.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.12 via Frontend Transport; Wed, 26 May 2021 13:25:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a1c02da-e670-413c-ff9b-08d92049bc55
X-MS-TrafficTypeDiagnostic: AM6PR08MB4279:
X-Microsoft-Antispam-PRVS: <AM6PR08MB42796AA397A5C629798B98E7C1249@AM6PR08MB4279.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XbjcAxmf4L6rrXpP3h8h0eUxkmtwt3xWBwA9KOXQFTC37U15itCR45RIothywbGb4ETN5EWJiN9+owKOXVtVdULeXjnNIFetW7Y9l3j49X0EmZcDhD2osYzDElPCfzYGdlpQnHVFMk7plEdQfW/i+7dG8kpWGwtKPkK8vaeJaQNd9MT2nfZdh2E17I8mzM1JXTPOMSxvYh8WA8AF2RD5ZhFRWLUMtS2fhU7DNRRvYLiDCaH0n6MP/QIMZt0thdXDFkbT3UeCDViQD5oEGNK/Hm3OiGMzfTHzS9/2BF8DXhjn3wYcb/qxFmV3QCnUXR97ZXOpS7iO/g8VkGLN48lhuu6Xsv9HtflreL/E0uNsiE+OOGM8dZBas5p4qaDw4oLAmWlDThxh0CRI76OMgFg0FaORFpPrhrYExlRo+mmSRcIcZ4FYTM4MoepTdBX0u6TmCd1ppTca8+qq1h5LDJow4AUJsIxlPQnbyRiRRCW5Sub4J8RBwTqg7/JwH+zHP0PQ+qk7u1aO2JoUGXe+XtiRbelAqqZARAf0jX1bg4RCvnuyovuVL9/swKao0Dk5fevyDeBnj/oojBlkOs2h98SdNTz5S2BJNMh7CpYg0Jt/rqYE76Uu2b/3XSCn5If4jYIFCKiKi+T1dQY93F2p61K/gCBgNbhJtwJ7nuieVYboXrFqp0JvStLr2coi/wPeBsA88bnD+AMW+fiXH6s5+8jYIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39840400004)(136003)(376002)(396003)(66476007)(66556008)(54906003)(86362001)(66946007)(8676002)(52116002)(38350700002)(16576012)(53546011)(6486002)(5660300002)(956004)(31686004)(4326008)(83380400001)(478600001)(2906002)(31696002)(36756003)(2616005)(8936002)(38100700002)(26005)(16526019)(186003)(316002)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TDFleUQzSDNXdlJrZFJ3OEJOcEhTd2NpbmhRMG5MakVNOXo0YkZwWnJMUzlU?=
 =?utf-8?B?c3BCNDRnbjladmcwQXc2VmN2VThMYWZWWGVkL0F2ZjhsV05BT3NrQWVhZWE3?=
 =?utf-8?B?THgvOU40RVpmOTMrOWZnUllKcjZNeURjeWc0NGFWWkkwTy9OcGgxODRBQnk5?=
 =?utf-8?B?OFFhbEVxc3d1MVRnZnNGZ3J2NzhYOHB5V0NSc0cvSHlQSzEvZ1JxcUFJeVho?=
 =?utf-8?B?b01QZzRlK1BSUVFjQWhsbkhlNG1QMm9jaGJROGQzSVlEQWFaTWxFMHF1aWZa?=
 =?utf-8?B?M0VTVU5VQUZ4Y0JybDJKUVVOZ045ZFo5Y1Y1L3Y0WllTS2RlTHNpaHlDMmlW?=
 =?utf-8?B?aExqMWRFa1YyZzRYSDNhWXFuM0trTTdCcGJTN21PNngvNTVaNjdxL0U5d3N6?=
 =?utf-8?B?MTRyOWN5Znh4ZlNmZ3hKaE4wV1lFTmJ3NE5PRlQwYlowa1J4ZWxyUDhnRHhZ?=
 =?utf-8?B?aDNpWjJNQm1kMkI2VjlXTmNDaE9vQW1tNUdYc0lnMkZwTjJCL0JQV1J1a2tJ?=
 =?utf-8?B?dEdIOU4xeVY5bmY4Y2RVdVBCQXVBdUIrWHdMWG1HbStnMXVGRWIvalJ1U05U?=
 =?utf-8?B?K2NTWUJaUGgyS2M3WW03eGM4T3ZsY0VLcXdaY0VBaVlheXNKUDBKSVJ2UDN3?=
 =?utf-8?B?ZHNyYWxGRmpsd1cyMjNsZUFuRmFXcC9CcHFNSWVvSGFhcnV4OHNFenczREZI?=
 =?utf-8?B?SWcrWFVWcStKSnBpUmFlckhkRFVWU294b0Q0QnVwdEhkcEl0VEVrWStFaWJD?=
 =?utf-8?B?MkRvMmpkTTJrL01SQ1pPdGwxa2s1TmJOY2hoR0g0dUZlTGduVEszRjVmd29u?=
 =?utf-8?B?MWxYNUtYLy9QbkNFNCtPckl0RVBQbzlVMENYODdEbmwwRmtYalJqSmd5QW83?=
 =?utf-8?B?YTFHOFJqNDlTK1RoMGoyQlVqOEpGSkdZViszSlFWL1BSM2ZOUnFDaVdhWVVp?=
 =?utf-8?B?U3JGMzFxeG12algyVWZtOWFCN0hYTjlNNXhveGxPUUNGTTFybEttSmtqOTk3?=
 =?utf-8?B?VDcvMTBIM21wTEM2dXVMSytVU0c3M1pxNmRVNktlb24rbzNVL0ZsMHNiVFJI?=
 =?utf-8?B?OXgvQTJ3VW01dUFjOU96K1dabDdTTGN6UHJkc1JtSlBBRVFCTmtOTGlZLzdM?=
 =?utf-8?B?NUE1UzZtR0sxNzZlNXJwTW5ncHdicGcwRm9ndXROeWxWL2VLVVRvUk93VEU4?=
 =?utf-8?B?K3VqTm0yQzY4VmZzRy95VnZ0UUlIOVloYzVHejlqNEFxRzJLWndVTzF2dGg4?=
 =?utf-8?B?VVlFSWJxL3NkdkJIaTE4VWloK0RRb0JTN2d6ZHJ6bUNNZHRhUzBTcU5jS0tX?=
 =?utf-8?B?NjJpVm9zVmNUVnY2Z0NQdmEyT2N4cDdCYlBnTzFvL0tyVTVDTWwrSnFWVHRq?=
 =?utf-8?B?c2JyMGJBeG95M21hd2xvTnhKQTRvSGhEWDFJemp5S3daMS8vczVHdWhUd2M2?=
 =?utf-8?B?V2NhbkdueUJ0MWNlcldmV1huR3l2c1U0bGs1Q1puRmU5WEhxTmFmRTAreFJj?=
 =?utf-8?B?ck5HRFp1aXJlNnU3VE9MYjVMVWJ5Q1dQaURPTTRuaSswdFU1dS9nUGliOHFY?=
 =?utf-8?B?NE54Skc1L3RsM3ZNZS9RSk0zSE5IbTdQTEJ6STVhM1RwQ3g3VlFrVERncVUz?=
 =?utf-8?B?MFh4WUp3MjNtS09VNkFTazh1enhIWVlHRHg4aUFremZ4c25SaGFtc2R2OXFR?=
 =?utf-8?B?RkxrME9XYTVsaEhUbzdmSElwQWZSaUZNMXRMUkdySEwrbXFZRFJXdVlRYzBW?=
 =?utf-8?Q?G/+viLI6AsBkCJXMPqKkdo3SwW+593aNqPp9vIT?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a1c02da-e670-413c-ff9b-08d92049bc55
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 13:25:31.5065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jKWXwXGUJX3lDQ/4Xss/+czZHKNfPJ3zr1hnvkZuPpLK8+ce2yYnwA6oy6jZ5oRhdGvdNWYp1RWCgD6lNiuz2c2+Bzt0tJzZ+4PakaZU0Bg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4279
Received-SPF: pass client-ip=40.107.4.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

26.05.2021 15:48, Paolo Bonzini wrote:
> On 26/05/21 13:24, Vladimir Sementsov-Ogievskiy wrote:
>>
>>> Define -gdb flag and GDB_OPTIONS environment variable
>>
>> Let's use --option notation for new long options
> 
> Why make a mix of two styles? -- suggests that single-character options like -d and -v can be combined, is that the case?

Yes.. I think think that --options (with -o short options) is more usual and modern style.

We already have both --options and -options.. So, my idea when I was rewriting ./check was that better to move to --options. I can send patch to change all existing -options of check to be --options for full consistency. It would be some pain for developers..

> 
>>> if -gdb is not provided but $GDB_OPTIONS is set, ignore the
>>> environment variable.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> ---
>>>   tests/qemu-iotests/check      |  6 +++++-
>>>   tests/qemu-iotests/iotests.py |  5 +++++
>>>   tests/qemu-iotests/testenv.py | 19 ++++++++++++++++---
>>>   3 files changed, 26 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
>>> index d1c87ceaf1..b9820fdaaf 100755
>>> --- a/tests/qemu-iotests/check
>>> +++ b/tests/qemu-iotests/check
>>> @@ -33,6 +33,9 @@ def make_argparser() -> argparse.ArgumentParser:
>>>                      help='pretty print output for make check')
>>>       p.add_argument('-d', dest='debug', action='store_true', help='debug')
>>> +    p.add_argument('-gdb', action='store_true',
>>> +                   help="start gdbserver with $GDB_OPTIONS options \
>>> +                        ('localhost:12345' if $GDB_OPTIONS is empty)")
>>
>> Hmm.. Why not just make --gdb a string option, that defaults to GDB_OPTIONS? This way it will more similar with other options.
> 
> I think then something like "./check -gdb 030" would not work, right?
> 

Hmm, yes, that's not very convenient. OK then, let's keep bool.


-- 
Best regards,
Vladimir

