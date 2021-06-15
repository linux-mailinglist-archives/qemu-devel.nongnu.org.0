Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE0D3A78A7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 10:03:02 +0200 (CEST)
Received: from localhost ([::1]:37968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt42H-0006VD-Bz
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 04:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lt3xM-0006n9-5y; Tue, 15 Jun 2021 03:57:56 -0400
Received: from mail-he1eur02on072a.outbound.protection.outlook.com
 ([2a01:111:f400:fe05::72a]:1967
 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lt3xI-0005eW-Oz; Tue, 15 Jun 2021 03:57:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbzgZ5o/DY2xz5EZOuV9aWlayrwvQvbS0oCq+kiJDIVunyvWR9OQddFIzzRlSkna37Ed6cAXGFQIl5Mfd9WZLwyiEYmYlldwH6to8vGgL9x9L/7ullIpQB8kjWxhuT+nR9t15CDmQ4Eln0fpPmhTzWcGA1jTqxWgYZiYWmPCCuuJio2VKPCQUcBaxKaGdFpjTvfhunI9Ybq/7Pg8daZjiq9i18bMmYx4SZcPAaHl8UhEeOhRv+wX+wyqZPBBBgMvQ/4MPR54ec/qXS5OKuvi53Yj/JVXSVc8U5G9q7vZT3KW5eGW8/MH80xa81A7Ge0F4MXTdc4ACq7F7SLFfZkUqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvlks0HVAOpziQY4Fv0ESobG1oxXNih5GgJ4Hnzzpa4=;
 b=iUZX1DeXM0wm5WAktXbuuq917VIgrafFTyR6QE1SEQaxoaTR1YHtfMXnsKiFlstzlVmA08Rvy264OEiLrvX5aO1+jHrpu12t/X/XH2VMmCgSzTiuHIdB+u+o+z2MIobjFzIALfjMAKc+V5cquX3gRVZWdXTdHL6tfa+G3nON4LE+7R7OPJ1tGiRgtxIQoygbqGsGljEX/tdbZm/cjIeOPGL9HlFHxlik0eit2+Y+5WrlDf5EWN+LYbQsf2zfNpWlfEl2ywZyGaVMBh4tEg7REE1ewhUTylWo0ZKL9poNs/LGrlIfdRJSTdAAEU3Z/tUGaBxrq1w+vd5T4tTdcaSZCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvlks0HVAOpziQY4Fv0ESobG1oxXNih5GgJ4Hnzzpa4=;
 b=oPkldiH/ITVaPyUOGCbrOcPcVXHIqiiZPuJ4QMnL5mVkhcWPuRYOl1JaBAyKcEX/USzSwhXSw9PdMZWTULnr/5GxLX5aYGBsUQi9qiyN3ANtmX/yiBTxQNosPpUhxg+BS8tPRjg1umktJHUDDUgIZqMWRIztVgYgauE+OisKyxQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6376.eurprd08.prod.outlook.com (2603:10a6:20b:33e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Tue, 15 Jun
 2021 07:57:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4219.025; Tue, 15 Jun 2021
 07:57:48 +0000
Subject: Re: [PATCH v5 06/16] qemu-iotests: delay QMP socket timers
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20210604091723.13419-1-eesposit@redhat.com>
 <20210604091723.13419-7-eesposit@redhat.com>
 <879584c2-48cb-c81e-ef9c-141db1c5a67f@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f68fa8d3-a70a-7f30-9fd1-913730e2b024@virtuozzo.com>
Date: Tue, 15 Jun 2021 10:57:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <879584c2-48cb-c81e-ef9c-141db1c5a67f@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.224]
X-ClientProxiedBy: PR2P264CA0016.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::28)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.224) by
 PR2P264CA0016.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 07:57:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7093e05e-e2c4-4f23-3e1b-08d92fd34488
X-MS-TrafficTypeDiagnostic: AS8PR08MB6376:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6376DD7D4C9ECC287C807FCAC1309@AS8PR08MB6376.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t9cPdh0r8dad+WksFw/uV0HLtj/OeeKZMmReKEpYZDQYpq7JAbqCjLo67QvC9ka8LICiDKab5T39/aR91i8/5cWnVTxXUSnBT2qlVkPATofUpkNXxCS8bqFpgU3OVK/fmMl7GcOQUUlmIP9aMRkEtmfK7nCxavceT8RZzdYEpjyqvnfBy8SW5KY6bhrEUMv7bDpCSFD98YVrlSDINGDJAymGyGF8nPI6FbxdUgpcSt1KFeIqp423WfYlt2gvZ0acB79GRgSau40F+QLowfcUwxU4I3nBF7tAuWT8VRoFfj8tRnz3gx/0GtfrGdigGa6qSDUakfhIC20XpDIhI7JG4WLOA4j1NLirW35t843CSPrMMSxARkJngiu1oS5RzNpWd6ZkpfaBeQQFsouzhmJd5GlDPazpsMjsaRiBHxOamhDvsBuOrnBzygm9Z2xBT6STs2vyQAsaji9CE0fJV3lk9w2U3xNj2+B+sHfLReXsfaxAhyp4PIPliRXsdvWuA0/eN104kYWQCyvXAYLNkjeucigNtZ2WrBtYKJmrz9ku11cnzU0bp3D590b7ZBD5IRmFM3BnuQbT8rL3lu7Y4UatszpcJ/I7aIASD1XmY+6eLHFTa5LskfLsblYZV2yLcOboi1c96pVv2kipGVXillCUlZfs3JDuUtNFKTCgvPtrKU8Os1DjRKtv/ZWTXj7BElUODnjXgVGqh8n2Mqz+pWncqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(366004)(39840400004)(316002)(16576012)(36756003)(66556008)(4326008)(31696002)(478600001)(66476007)(5660300002)(66946007)(83380400001)(186003)(26005)(6486002)(16526019)(8676002)(52116002)(53546011)(86362001)(54906003)(8936002)(956004)(38350700002)(2906002)(2616005)(31686004)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmF4N01DWmFDRVRiejhIOVgvUFhNWmx0Qkh3bzZzc0tFaGxrYkQ5NzhDOC85?=
 =?utf-8?B?M0lvNS9IRXVaSW9tcnl6L2ZLT2lJM0RIZDRkT1pUb3MxczJGR3luMnNybkFO?=
 =?utf-8?B?NVNpQ1F1Z0VUUDV4UWtqNkRwLy9yTURzYUdrQitkTUlkUG1PVHI2ZzdXTGEx?=
 =?utf-8?B?dVhrSWNvZmlOTUZvMWJjVnZmbTI1K2tJc2s4dk80bHpxTExNQnhJdDRlY1J0?=
 =?utf-8?B?MGhTbkJOeFNhUldHV2tpWjRYMmNpbWZSN1VFUE0xZWpURE5FOGtvY1lWbnp0?=
 =?utf-8?B?bWdRRW1yNitzczB3ZkRvLzc4NWJoSXpCU0Mrc3NLc0J3NUpYV3R5WnVFMHBZ?=
 =?utf-8?B?dzRCam1aeVp3MzgwVlRmU2dycjB4eVVVbGdQdzRXSCtSQ2trUmFkSEh3Sm9R?=
 =?utf-8?B?dVBBOGNJbEJBd2wzZElKSU5GYVBpK2FJSVNhcmVWNSt0ckpuc3VRclcrYzMz?=
 =?utf-8?B?MlVKYWlVdDdBc0cxMEZVYVJ1bzY5V1pOWlVNSHVIeENqR0FqVGVybTBtTlpt?=
 =?utf-8?B?NlhYMVlsWlBrVkFUdWtuMHNNVCs0UHZacVpxcW9BVDNRTWVnZUtweHpaY2Fo?=
 =?utf-8?B?bWFzMmtESnNVNCtNTUgyYWw4Y1JBRDZEV2JxZG5lZlB1UXpyQUFianl3aUgw?=
 =?utf-8?B?NDV2WUd6NnN1OVhrcFV0THlQZXFzTENZM2hNY0xlWDZWZG5EdFRtL05Eam1B?=
 =?utf-8?B?TDNKRkxDelZnRVZieUdwRG5TOWZkWkNNVmpoc1YzMEQrSVZtOWVOenZYRjEv?=
 =?utf-8?B?eFA5S2xRU0VXbnZWNVBFUWNQNDdQd0ZSUlNEZG1tU0kyZ3lOaHZaRTZKSWxv?=
 =?utf-8?B?MHc1YmVJR21YcjB5SzNYMlhObmlURDBFRlAydldRVlZhQ011WHlyaDdXN0d6?=
 =?utf-8?B?QWcxbGx6TUl3Sy9iL2NPVWRDNFRrR0lralNIRkFkWHBxSVZHdWNTUlJiMmc1?=
 =?utf-8?B?c3VZU3lZb3JkVHI5SEhTdWE5T2IwN2J2akNyOHJBb21ZS1lLZGl3RWVWRDVZ?=
 =?utf-8?B?QnJpbGp0a3lOTUpVa0Z5Z3RzVy9raXRva2RqWmZoQmZsTmR3U0lRdC9UN0dp?=
 =?utf-8?B?b1pFZHJ0bjh3WTBXMmZXSkxCY3VlZ25GSzB6QnlVR0Z3MlBiY3hpUW5ScjJ0?=
 =?utf-8?B?TWpRd0VDODFHOFJ2WXdHZ0Q1bGlOZ0NQYmVuVzBkWlFuM0MyUzFvOGVMVnNq?=
 =?utf-8?B?UndzZkxHeTd3YmxpWUxTb2MyQkpXSUs3bTZPSzM3OGhiQTdjT3V3YlpiYXpD?=
 =?utf-8?B?ckNYWHRXZnVLV296ekVVZEZWc05uY2xLNEE1S3RldWV5NjhuRXJiM3lRM1FZ?=
 =?utf-8?B?ZnFjUkFCVStPSiswYkhwZzZPQXlUZWFDUXV1QTRNWTFqWnhZalBlNkZhWVF6?=
 =?utf-8?B?eEI0d1VGUlo5MVQ3K0xFRThkSm11UHdiWG9kR3hKRWRoTUJzSHhoOUk5OHYv?=
 =?utf-8?B?R2lvbTNCV0RwNG9sYzFhaWcrWktKZkZmTWNMVzBWZG9SZjlCKy9BTGovNE5H?=
 =?utf-8?B?azlINVBteDRQaEVObGFzTVhWZExueExnaWpNY21YemE4VGx5TEFNZDRYOVda?=
 =?utf-8?B?ZDlraWhDKzNOa0ZhcWJyMURMRHZrRHk0dGRYMzNzUExJUlRJakFwaklmR2Vw?=
 =?utf-8?B?WWN6L1U5bU0zVm9YZE9kdEpLaUZJWDFoQUt4RkU3Qk1JMU40RzhUSlY4ZGRi?=
 =?utf-8?B?YXlCenlWa05vdUM0QzBpTTRhVUV0RHFBbDdQU09Yczh2dWJWY2NIMldaaWZk?=
 =?utf-8?Q?ULvtoAJDFI+0fqWBxIqkL12RkOPjC34gdBuZtls?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7093e05e-e2c4-4f23-3e1b-08d92fd34488
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 07:57:48.5304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bxdEbzTNkXzNBhYPL8MitM/DmUSl6zn3KKBk1FsifVrZeeZfL39pTjE+mwxRjTo8eyBn57OICttYs8AZ/hECzR9ot4OoGIW5KBrIZIrZN1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6376
Received-SPF: pass client-ip=2a01:111:f400:fe05::72a;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.489, SPF_HELO_PASS=-0.001,
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

14.06.2021 13:36, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 04/06/2021 11:17, Emanuele Giuseppe Esposito wrote:
>> Attaching gdbserver implies that the qmp socket
>> should wait indefinitely for an answer from QEMU.
>>
>> For Timeout class, create a @contextmanager that
>> switches Timeout with NoTimeout (empty context manager)
>> so that if --gdb is set, no timeout will be triggered.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/iotests.py | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
>> index c86f239d81..d4bfd8f1d6 100644
>> --- a/tests/qemu-iotests/iotests.py
>> +++ b/tests/qemu-iotests/iotests.py
>> @@ -486,6 +486,13 @@ def __exit__(self, exc_type, value, traceback):
>>       def timeout(self, signum, frame):
>>           raise Exception(self.errmsg)
>> +@contextmanager
>> +def NoTimeout():
>> +    yield
>> +
>> +if qemu_gdb:
>> +    Timeout = NoTimeout
>> +
> 
> @Vladimir or anyone expert enough in python:
> This fix above works, but I just noticed that makes pylint (test 297) fail. My bad, I should have tried it before.

I think, just make mypy ignore it, like:

    Timeout = NoTimeout # type: ignore


> 
> The reason for that is
>>> +    Timeout = NoTimeout
> 
> They obviously have different types.
> 
>> +iotests.py:507: error: Cannot assign to a type
>> +iotests.py:507: error: Incompatible types in assignment (expression has type "Callable[[], _GeneratorContextManager[Any]]", variable has type "Type[Timeout]")
>> +Found 2 errors in 1 file (checked 1 source file)
> 
> Any ideas on how to fix this? Otherwise I will get rid of it.
> 
> Thank you,
> Emanuele
> 
>>   def file_pattern(name):
>>       return "{0}-{1}".format(os.getpid(), name)
>> @@ -575,7 +582,7 @@ class VM(qtest.QEMUQtestMachine):
>>       def __init__(self, path_suffix=''):
>>           name = "qemu%s-%d" % (path_suffix, os.getpid())
>> -        timer = 15.0
>> +        timer = 15.0 if not qemu_gdb else None
>>           super().__init__(qemu_prog, qemu_opts, name=name,
>>                            base_temp_dir=test_dir,
>>                            socket_scm_helper=socket_scm_helper,
>>
> 


-- 
Best regards,
Vladimir

