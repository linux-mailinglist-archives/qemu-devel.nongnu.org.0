Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0261347E51B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 15:48:18 +0100 (CET)
Received: from localhost ([::1]:46222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0POC-0007zg-RL
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 09:48:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0PL4-0004te-Ge; Thu, 23 Dec 2021 09:45:02 -0500
Received: from mail-eopbgr130107.outbound.protection.outlook.com
 ([40.107.13.107]:26305 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0PKu-0005F9-2q; Thu, 23 Dec 2021 09:45:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLeMpqu8PrPPX96fH6Tt0TG0rDLn4HsRpIZgCNjx0fEwTB/GRmKaINEHOR/FrIIEkJKwvKviiPAAHTQRarvB22Y3PwQHtlBRKaytIgKz34IHnVqlc03uA3YsS+Xx0Od0Ri++vNGdDuBWbF5sVVdmlPDLTO4CJdoEpf3lzmAsQsWR2i/AzRCMGw/2Yg9R4K+0QDz366iw1VUkmiGA9FwdHhRDR+Hx8g/pfZ+xUdqDEbCi1wbMXXXtUzd8P8aIBij61XOoLpovzwyyrVQwb7xqmfpreWtMK/SlA0RroIEeIaVbky/p9R+kvMsg+lCs647itMv3ie5c3eaGq57lg9E21A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TE5XD6QBNiPWvR5HKeic41K+3PSQgz3sy08r3Ht/1qw=;
 b=cP8K8eeVJYJrvZEqESeGYGaXvLBm02KvJwpKRirph2f06MtItr50sZZNt9OiGTq8tCAS6z14VvyKR7xv1/NIRTAsJNwspGdthHFRA0graFxW54lAR/l/hGocwYV2pS7GCHe9QliHVd0jD8UHIi8gOPIMSPuZTNX1DL6lStEKO7Z1t1aOoThLvPNsX0cvTGlAToxDJTmlREX1RSi83areeCChji9kZRc8+wPyiZHYAQuxqkK/ujFbHA0Ip2Q2zE9fIl+bdLaC3ZpDQE1krJabTERcPTGyZWZJwZn8e/oqiaBXC7bTs/zwplnCv/jenfNSlnSx5AWMtW4qLKwMpn/0JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TE5XD6QBNiPWvR5HKeic41K+3PSQgz3sy08r3Ht/1qw=;
 b=D4VXBQ0FaEHyziBG4jsA6jvTrkvORM/7EDi2lHmqtqJLlRcdsEXsZYFoN7aD2rLY1Yq/+dgWg3R+zIoo11n58wRCdXFDO3KTdQtjbJtjSS107T9JC4fkx9GidCpJ6sEgM+WyhnKksJMo5LvrPKjGYXXUkR5Of/Dx9WVBhk3Vbmc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB5395.eurprd08.prod.outlook.com (2603:10a6:208:188::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 14:44:48 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 14:44:48 +0000
Message-ID: <c68e6209-2939-d0b2-aa48-77e45c7003bb@virtuozzo.com>
Date: Thu, 23 Dec 2021 17:44:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 18/19] iotests.py: implement unsupported_imgopts
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, jsnow@redhat.com
References: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
 <20211203130737.2924594-19-vsementsov@virtuozzo.com>
 <f93baaa5-7d05-5a59-d439-c4a7e99e48bd@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <f93baaa5-7d05-5a59-d439-c4a7e99e48bd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::17) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 233244e0-e20e-4229-91ce-08d9c622c4b6
X-MS-TrafficTypeDiagnostic: AM0PR08MB5395:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB53959E1133A0D647E07D0334C17E9@AM0PR08MB5395.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vuNnYvBvwksgKWPw/kQhPxjmzDh3vPXxgtMOcZJEFNw1TNHc2X/huSeHmEglvxycwi+6IoCklnaXTfW1awlfLDEndp5XVebSWPYu81Mr3lg0g6EexWkt/oDgqMpKHpmUpO3n66iDz9J3Df0+01LdUmWDsheoNXF+8/5g4XugQUVuIwu8YoiOIhkdoOkAC4ytI7C6RnRxO8oa94SOHWPlqHLra37rz/8fXrO9WbTZlZnawoBsrsZcgGvKbDguXy3hkHMnrSYMD6EWdamO4aLdap55UAQsRAVnpk6gzn+3uS9ialAaYo7NMjVe0b97SZI8gW9vEbJTxN1/Wwwngju4+Qrl0amNbUQqdzWoQG/893AyUJvEzunPoVu6iiLN/oT9tONqUPDj/kgaFs3X9RJxa7NX8U1Q2DQEePcCff7eSQmP+sTTpXNRqnN4SsKVv12IZCuakRSsyCOeeeKYEvkx84BkZ+SC+ekZujj4psTq4cWeFDVoQzNeNYJD4/KVr0xlQ2+q+gWSnCpzHt4ZyhOretqcij1WDcAUMTcbFpxD0fvtPhOdoK/zZEKPxnW5Bqe8X/ZmOp6gE7do5DUFxd5jGnRu9NyHQmjNAJ0urbBA3NblMOylKIFK5tbzbhO9Qu9YfY7naXvg8gDd3eIgYhHs+2WdsTdX8Y1czsimP9okegjMEzV3NquwkbBnZuL5t+yN9hBZseMNyc9nMz175dylNJ0eHDdOpVE0ljwlbZIc8TXnZInrJf6gSZsBx4xM/vzurva0YqXTASInBtDSZRGduw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(31686004)(53546011)(316002)(2616005)(66476007)(4326008)(86362001)(186003)(8936002)(66556008)(6506007)(26005)(52116002)(8676002)(31696002)(6512007)(83380400001)(38350700002)(5660300002)(2906002)(36756003)(6486002)(38100700002)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDBBRmI2TXR6VFhaSnhVL2xoRzlQSDdNUE9QV0VNOXpVNFZNUFQrSXh0RGhH?=
 =?utf-8?B?dWsyaklUK2V1Y0RKdnZYWHlDQnZTelFFN1dkUUhtaTlpaXJ2WjhIeDJJZ042?=
 =?utf-8?B?eFduN1ptSkdNb21YUjdYaW1Sek84TnRvdERmZ3hVL2JoZWh0Njd2UGtIK3RG?=
 =?utf-8?B?RVhWMS9YcGJQWUNiQ3ZOZksxbHBUamJCUVY4QlpHV1FLdDE4Q1FhNmFnRzFm?=
 =?utf-8?B?aUplTXVWL203UGE3cVlQUTBOV25BOWlOY1A0TmNjU25sVmx5UXkrV0NURUhw?=
 =?utf-8?B?b1ZHODJPay84eHBnRk5Cc1VxZm1vaVY0aHNqNW85bU1sTWJyWllnWnFpY1Z4?=
 =?utf-8?B?MmE1ZldKTU5qdUpOeWxrRFVCS01xTEswVkgrajM0ZGJQSnN4eHd5a3ZDYzFJ?=
 =?utf-8?B?QTFYQldBdk5aTkFCUkNHdG1IOUtaKzh0RkxpanR2V2Nlc05namxyb0NNaW5n?=
 =?utf-8?B?cGJDbnNLUm9nZmhOR3kxZUZRZ0xISXloaCtzSFVPSmFiVDFOU0p4bGNiVXI5?=
 =?utf-8?B?cHUrM1U2d1dKQ1NqL2NCUlFFbUQrZytjdkJMV2dHRDRoNGFiVnlmOU40Vi82?=
 =?utf-8?B?NmJ5bTRYdFJZVFU2M2JQeGRISGhidlc5YnI3OElzbHgzUjFybElBTHlYVFNv?=
 =?utf-8?B?ZU5jQjU0T1lqRmM3NlI0ZEFKaTdZSHZ1dWxrUkN3Nk9vWmZEL0NCdWpmcXMz?=
 =?utf-8?B?L0t6RlV5eUVqa25tblc4b1lpbEZIMGxiRVlUWThlNktHSkp0WnhwYitEWkhS?=
 =?utf-8?B?ZjdVSnB0VjBEcFl1MytHa2poK0MrcFJwNnk4L2t0cXJtZ3g1QlcrbGVDVEJD?=
 =?utf-8?B?VDZrdG13VmY5VnNEK1ZjeE1Hd1dEczI3Y2cyRUp1cVIyZ0Yra1J3aTR5akFY?=
 =?utf-8?B?dW82Y2s4S1loekdSMVhWUnFyR2pRWEc2aUczeFhoMEZ0TTFRdURINnBsVzl3?=
 =?utf-8?B?aHgycFVCdkRNYTBxT1g0cGVvTkpjK3FZQ2svcFNTS0xQQmNzZEJMbFREY1Zv?=
 =?utf-8?B?bDA1Sm5mT2pCZ1dhRmNVU05td1hzdmtxbDFaVFNIY2NsdHE4SHl1YTV1V0ZF?=
 =?utf-8?B?Q1NMRUNZVS9tUmxrQWI2YUhIc21zVjRDSmhFVERzV0FFUkd5TXhDdUpwQ0Z4?=
 =?utf-8?B?Yy9CcHh5THNqSVBBNlB1N0FWQXA5aERyQSt2WHVZRmE1MVF0MkUwV05IcjZN?=
 =?utf-8?B?Ulp0blRkUEEwY2VFNXROaEtPSmQwNitXb29KWVRWODZVSm9ZMkJVbUZQM1ZM?=
 =?utf-8?B?ak5Lc3M2TTNybGYrcUYxcmdMUzBrMkdqQytLQVExNGtEYkc3RHRPLy9adTNR?=
 =?utf-8?B?ZVc2MkhWSWdZdWIvOHV3akE3elhwTld0aEgvU2tkR05CUlB2NGQ1VjlacUZ5?=
 =?utf-8?B?M1ZyN0p6RjR0U0ZMSkRnWTVxWmJPT0FGL00xZFNyaWNYZThoS2FGZ3U5cVhV?=
 =?utf-8?B?ak1vZzNaUTNONjVqMXkydzdwWnhoZ2ZCaFhIeThwRUNvcVowL1F2N3RBaE1F?=
 =?utf-8?B?UkRZZjlURHM3V2sweTVaWkFSZzFxT21TSVBEMjhXeE9HaVlnQjV0VGk3U0t5?=
 =?utf-8?B?aVVEcWtFNzc2WjVHMmdRTmc4d2lDbG5pbU5vYmdRTFR6T2R6OWVaOVJ1cEkw?=
 =?utf-8?B?cXRMMmVLeHlKc0VNTmlhNW0wT3NhZnd5UlNobVRuK2lBSG9yaXFiMjBMakdk?=
 =?utf-8?B?bUdLWjB1QVRCRDFIWE9Vdk13b241MHh5c2QwOFpHUGt4RGNuNERybHBvWmU2?=
 =?utf-8?B?ZXJaS0VzeHBaS0pkQjJ6enpGM0ZyTUt6eTNUOE1FNlE0NWJoeE5lYms4NXBM?=
 =?utf-8?B?SXpsMVR6eXBvU0pJWnZQblpBKzVQR0YzZWg4SHVpSXVDa1BzZnV5aHdualdS?=
 =?utf-8?B?TDZ5QzViNnEya21CVTV1TEFYY203UkthaDh5ZHJlSEM5d3lMRmJuNGdBWUJw?=
 =?utf-8?B?ZzQ3OXlzektTK1g2aEdqRWROS2FKcjR4TnVXTTgvcGhkN3V5NkNlVjBDUHdS?=
 =?utf-8?B?ZjgyUmlZSDArQ1duYUxPQVg3NFFrUGdvZ1JjSStBNzJ5MXF6MHpQc0l2UnhT?=
 =?utf-8?B?NVhiVjJqWTFyZFo2cjJiQm1DaGFSRE1JTnoxRHR6TkxwSDF5dkZQV2YwejFT?=
 =?utf-8?B?UE4vd29ycnV2dVVtZW4zRXFGWnNVcEszekw0TGNqUkljM3luVm55TkhmT0Zh?=
 =?utf-8?B?b3dxd2xqeVpwd21DbUdSZ3VQU1BScXU5MkwwNitIWXZ2eTJnWEVqcjM0a2VJ?=
 =?utf-8?Q?VpneGKy8at6zAZMWvfY0Q/eYvXRlcyupLXnJM7ptuI=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 233244e0-e20e-4229-91ce-08d9c622c4b6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 14:44:48.2841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vtlyPX+WE/HzV6tXJXvqISzbP58M56fFAzT2T1oxpZuhyvb2Yqz5pzUchSqlA6sQEKhnC2ymv3Pqdtdnj2yA0+26NB6xJv+3bMoENbRu/U4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5395
Received-SPF: pass client-ip=40.107.13.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
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

23.12.2021 15:41, Hanna Reitz wrote:
> On 03.12.21 14:07, Vladimir Sementsov-Ogievskiy wrote:
>> We have added support for some addition IMGOPTS in python iotests like
>> in bash iotests. Similarly to bash iotests, we want a way to skip some
>> tests which can't work with specific IMGOPTS.
>>
>> Globally for python iotests we now don't support things like
>> 'data_file=$TEST_IMG.ext_data_file' in IMGOPTS, so, forbid this
>> globally in iotests.py.
>>
>> Suggested-by: Hanna Reitz <hreitz@redhat.com>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/iotests.py | 15 ++++++++++++++-
>>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> 
> Can we move this and the next patch before patch 2, though? Otherwise, the tests adjusted in the next patch will be broken after patch 2 (when given those unsupported options).  The move seems trivial, just wondering whether you know of anything that would prohibit this.
> 

OK

-- 
Best regards,
Vladimir

