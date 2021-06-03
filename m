Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F3A39A22C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 15:27:55 +0200 (CEST)
Received: from localhost ([::1]:44894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lonO6-0005yb-AP
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 09:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lonN7-00057G-Se; Thu, 03 Jun 2021 09:26:53 -0400
Received: from mail-eopbgr10101.outbound.protection.outlook.com
 ([40.107.1.101]:36110 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lonN0-00015T-Lx; Thu, 03 Jun 2021 09:26:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDcL6MAeiKQkQ01R3qcgeANtJCnjYthVnSausCFBGvjk+6fFzJTLK5855tWFzw9rGKXJ17XBYBls4y1Wk2ynXrRt7HbyC4gkPshRvsyL6u/KnIy4qJTpbFlBXBDsCh501cmXwM1jQjtUSG8Ubz4sr4Do5XZW66b5O9q/PIgE669JqxKwSOjM9jIyQkyEYBzYgjRUv14k+Sa/TryphJrBsPQXAG7kEg5JWkK2TVAnTdLKSCoawsLgMKRFVrWzYpR29uUtUzMTgaeuijMI2NfcjJr8l+cTBUle0T14sAJycVDJ7BR06oU8YvgEF2BR0K2LeKg+IjVG/j134KMhBUSX2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5c45eJKr2q2DQHFpVMa+9c34ZMgcKJUz405qniEadM=;
 b=KUShxgPRQLQd+HEgafHSwdrLWJQNMKs9GmAHGrSD6x6j+o9R3yc2i6hQSRCISmksyCvGE6QVzCGBr4sWGoIJ3S12xM5lfY6/st+jtZovSLPei1BpfOoFeWVvuZmrZuHmJt18JgTlFuylS/7qMxbuzsNy1FikC0NFuB0GWjcxUPjGmU2rvqNekk5oF5kA/9PEZqo1WgLDTb7iBWElIo2/KpimTPDqjUX/YcZ0+EsMz86tJCDYHk5P5caI9AqBnzuOHFiK77oWR2fTY1TCDvHu2HBmJTNbY5OAOrwoX28VPMNLbAU+w5UZaMHqFLGnYjHQATqXKOKt+REeiIBYP8gNQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5c45eJKr2q2DQHFpVMa+9c34ZMgcKJUz405qniEadM=;
 b=jH0oDSQvLvJma182F+NZ3dn0T3jo02zyDO9CH+OiZv/Bn8o7mga3gey+aM3BlZzrrMBdO/2F5zjkof6oN60euUa/Xz4QRrMBGLnJ1AlIEHCy72CIY6D3bDX4al+4WQvSTPaeWoxGOfOp3qWwSzsXfwf3dVosIGKyql0pvL6C5bQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6117.eurprd08.prod.outlook.com (2603:10a6:20b:292::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Thu, 3 Jun
 2021 13:26:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Thu, 3 Jun 2021
 13:26:42 +0000
Subject: Re: [PATCH v4 25/35] python/qemu/machine.py: refactor _qemu_args()
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, mreitz@redhat.com, kwolf@redhat.com
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
 <20210602131108.74979-26-vsementsov@virtuozzo.com>
 <e3d89875-2d78-10eb-a531-d53ce460c562@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <45a0f864-0890-9463-2dc6-0b925accc4e3@virtuozzo.com>
Date: Thu, 3 Jun 2021 16:26:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <e3d89875-2d78-10eb-a531-d53ce460c562@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.243]
X-ClientProxiedBy: AM8P190CA0028.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.243) by
 AM8P190CA0028.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Thu, 3 Jun 2021 13:26:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc1d1d28-a9b2-4607-57f8-08d9269339e0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6117:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6117441607EB0B9DEA2727C6C13C9@AS8PR08MB6117.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2JPYjU6sMWHGZFInBUgTyPogfEma56D9q1LKLfQRzNNZ6wtIux2LadtAFhgB1zwtFoVcniKDCbiSIKI9cISR9Z5vUKH/Nkiv4Mr6HEdy3CHn0gwz4WwJ6tSgxNuHL0K67TOgQl1pU1VDlv8Wpd1kYU3oIDqhmkJiL+P7xaeZDoojGasbEEgoq41C7nJhhy1X53WoCvPbCGZTUPXQjRzi8YV3RXjxjvk4e/oGcO1IGlt1jJkm8+NZJHleAAsp0oIwd8UiKeN3QBEL9PiHL1tbBINSYVXJ+WlUa+Bbihhlmd4axUBuaTj9HJ4/GYZdqYb3u/3j/y4C8BTCpmDw9dklIQHyT+6Cn8SXvOzTb+JyBKDkjcvgm5mjTo1K7RlsHzn4v6t84JzZMClCZHB54TUy53FLKQtOZEJliM59nORmHFzaBL6GEOiyDyuzBVdGvm3Nqb4u+iiVoHT3vJtEe7Yx4NgplxOWlHsPxRz1E1t9vxKe63a+NyTjsfhxENeU8zpSLdtRkjQ3pgp/KX6nSitzzFORN68+oAqJbAXs+mPUx6qTkiJYCJmPkQDPoSlQlvzywFYvOB8rzavLzDY873ZzEPpG5IZfG73K1Q4wjScpeBTPWEZRlgBAc2K3pJzZvHiyO4KewU1vVextsoKUFMH9y1AJIQbLWiwuNJoFmVu74+guSwxdrs6ucx9ZO9vLDKqKYoszed7r3xRAqrxa16Lr5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39840400004)(366004)(136003)(376002)(38100700002)(7416002)(26005)(16576012)(38350700002)(4326008)(8936002)(16526019)(478600001)(186003)(2906002)(316002)(83380400001)(31696002)(52116002)(53546011)(86362001)(66556008)(66476007)(66946007)(6486002)(6666004)(8676002)(2616005)(956004)(36756003)(5660300002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WW1mNGh5aWpQa0tVUmd4YnJRTVorczF4OWlYTWVPVlFHb1pZTWQyUG1Ldndo?=
 =?utf-8?B?WG5LSXA2UEpyZGlQRnFicFNXUjVlbFdqK2g4QXhkNTZlcDhTMXlaLzVTcXNu?=
 =?utf-8?B?ZEU1UHEwVzZKai9YaHVEWjBxbXQzUWxETnpWQkVESTFHb1Y5QUtJOHJKTGFC?=
 =?utf-8?B?aVZ1MkpWc0RJKzVRN2QxWmNOUTdTdEdCaUd6enhxVU4zL2lmZWEyNmtPWU5q?=
 =?utf-8?B?VGZ2NDQxMkdHcCtYbWJGTWpBTk5zNGFIblVINHN1bnZZbkxadDBQMTI1UHlF?=
 =?utf-8?B?cngxZlduRHFDWnJia1htY3M5UFZGOStEL293M0ZObmlxMXZuOERKbVdVbzNC?=
 =?utf-8?B?RGJxSGRLekNCSVZ6ejFjUGJVS05saExGU3BuYy9qN1YvUGRxSXdOaW1MdTR2?=
 =?utf-8?B?OElmOVhsV0QyN1NoSnVlYkdFRXQ1V3E1QmdsUjJsVTREVEpXNCs3aHRVS2dK?=
 =?utf-8?B?T21uWFRVQWd5MFZQa09VcHp4WXRUeGtZb3VNZWQ2YXZRRDY5bzFCb1pSVW1S?=
 =?utf-8?B?ZTNTRFQ0NzNTZGZpQklEb3FyRklMV3lUK0tncTVNaGhZTFV2T1NBTGdvZHhC?=
 =?utf-8?B?ZENnQk84YmhrcEdNS05SVTNVbUpSaW1IbElTcGVPcTBOdWlMUXJYQXNHdFVW?=
 =?utf-8?B?dHQyR1pvanRkaWdqcFpnSml0U1VHZjlvcXQyV2JhRE5HNjY2NFhJaUtVY2dE?=
 =?utf-8?B?RGE2Mm1kRjhVVElROVJTSXlxenhYU3dMamZMNWxQOHJCWUp1eWdhaDQ2OExU?=
 =?utf-8?B?WkhpQ0Z3WXFLWGdCMjVPbXFoM3c3djhNRG5XVmdVakxJZlMwUzBBaUZiM3dt?=
 =?utf-8?B?NmRnYVphL3FLVlBaeE42enZzZWl1SGNSWHFUZnFrMW5VZU1DTGtlUDJMMXFi?=
 =?utf-8?B?R0tESlFXMzM1NVJucXlPb0RjOTZPRVRkZTNpMWtSOFVYZnEyaGg1SUVuZ1RG?=
 =?utf-8?B?dkVVZGphcmVJcVQ4UkoycldNM0xORWdnT0JWV3JIRmg2SW5iRk9DQWJtVW1W?=
 =?utf-8?B?NnNwdWZnK2Y3Z0JiN2RGK1hxVlFNOXpQUEdFbTgxVjZFOXhQcmN0WjVrKzNq?=
 =?utf-8?B?Zk93MFhSbGw3bFBHam1PWWVsWkFYSnNCR1M3cGxvckFGMXNYamZheDNwT2FN?=
 =?utf-8?B?VzJlS2lkSkZNSjhNY1BYcXorV2dqU3NJalBwRGJDV0FZMmhzbUl5RUcycUNT?=
 =?utf-8?B?TXkxdEtGL3FzWElQVnFZd0dITEJ2cjlOZTNTOTF5MGVqZWpKdTFXN0syRUFs?=
 =?utf-8?B?UEF3ZTk1MTRZcnFpMXM4Smc2bW8zMmlUQ20yYWR1TGFna1h5a2RDV3Jad1Jl?=
 =?utf-8?B?VkRXWTFpRTZLT1plcDl5dmk2YTlYK2pwaE1LT0VsTm5VcVJrcm5sRUV4b01Q?=
 =?utf-8?B?RHlYZ2EyOVFNSWg2K3RGMGlzSklLK3VvcHJ4amJJa29OdXdtcXJkZHJzRXox?=
 =?utf-8?B?RWhENUw2ZWx1RDVZMngvOFhzNlZjZzlWci9QckZ6VDNvZU1wckFNMExmajlz?=
 =?utf-8?B?Mkl4RlVBS0hjc0lwZ29pM0F0cmllT0lKUWFCZXluUnNZUWYvYXpGL3Z5RFBM?=
 =?utf-8?B?TjE3RTRFVTkwSHVxT3lOZVQxTDhCbDAyVVlDbnBzdEhBc0FiWWd0dFgya1hB?=
 =?utf-8?B?ZVNsZnFzK1lkb2VLNmtDZ0NBY2pnOWlEcnFtZ3g0QU9KVzNDNmh4UnBBNGFC?=
 =?utf-8?B?Yk9MeTFWcUc5UndsdnE3UWFxNmRma0JxZ1IrRklLcy9MSS8vT3YyUkw0eUc4?=
 =?utf-8?Q?dtnSNl7RaTuYBHV8bZqzcxbqa+TIXH1WOsOYT3E?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc1d1d28-a9b2-4607-57f8-08d9269339e0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2021 13:26:42.4211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZ7LXl7GYnoTPhDBRprtiTiRx7uCSupsdNmiuvwRw7aW2zPBMXdkWzTG0vX4aTQiT8N/5FLPwnG9VGTIcNRDa+21NRoTYkJMfTdpXLHNmG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6117
Received-SPF: pass client-ip=40.107.1.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_NONE=-0.0001,
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

03.06.2021 02:38, John Snow wrote:
> On 6/2/21 9:10 AM, Vladimir Sementsov-Ogievskiy wrote:
>>   - use shorter construction
>>   - don't create new dict if not needed
>>   - drop extra unpacking key-val arguments
>>   - drop extra default values
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Reviewed-by: Max Reitz <mreitz@redhat.com>
> 
> Sorry, I shuffled around the Python stuff and this doesn't apply anymore. I have applied it myself for review, though.

Not a problem, respect and congratulations for final landing of your python series!

> 
> (I don't anticipate any more major shake-ups from this point forward. Thanks for your help on reviews for that series.)
> 
>> ---
>>   python/qemu/machine.py | 18 ++++++++----------
>>   1 file changed, 8 insertions(+), 10 deletions(-)
>>
>> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
>> index 6e44bda337..ff35f2cd6c 100644
>> --- a/python/qemu/machine.py
>> +++ b/python/qemu/machine.py
>> @@ -541,14 +541,12 @@ def _qmp(self) -> qmp.QEMUMonitorProtocol:
>>           return self._qmp_connection
>>       @classmethod
>> -    def _qmp_args(cls, _conv_keys: bool = True, **args: Any) -> Dict[str, Any]:
>> -        qmp_args = dict()
>> -        for key, value in args.items():
>> -            if _conv_keys:
>> -                qmp_args[key.replace('_', '-')] = value
>> -            else:
>> -                qmp_args[key] = value
>> -        return qmp_args
>> +    def _qmp_args(cls, conv_keys: bool,
>> +                  args: Dict[str, Any]) -> Dict[str, Any]:
>> +        if conv_keys:
>> +            return {k.replace('_', '-'): v for k, v in args.items()}
>> +        else:
>> +            return args
> 
> qemu/machine/machine.py:558:8: R1705: Unnecessary "else" after "return" (no-else-return)
> 
> Also, can you try using Dict[str, object] instead? This keeps stricter type checking enabled for callers trying to utilize the return value. On my review branch (based on master, not kwolf's staging branch) it passes Python linting and iotests 297, so it should hopefully not be a hassle.

OK

> 
>>       def qmp(self, cmd: str,
>>               conv_keys: bool = True,
>> @@ -556,7 +554,7 @@ def qmp(self, cmd: str,
>>           """
>>           Invoke a QMP command and return the response dict
>>           """
>> -        qmp_args = self._qmp_args(conv_keys, **args)
>> +        qmp_args = self._qmp_args(conv_keys, args)
>>           return self._qmp.cmd(cmd, args=qmp_args)
>>       def command(self, cmd: str,
>> @@ -567,7 +565,7 @@ def command(self, cmd: str,
>>           On success return the response dict.
>>           On failure raise an exception.
>>           """
>> -        qmp_args = self._qmp_args(conv_keys, **args)
>> +        qmp_args = self._qmp_args(conv_keys, args)
>>           return self._qmp.command(cmd, **qmp_args)
>>       def get_qmp_event(self, wait: bool = False) -> Optional[QMPMessage]:
>>
> 
> With those items addressed:
> 
> Reviewed-by: John Snow <jsnow@redhat.com>
> 

Thanks!

-- 
Best regards,
Vladimir

