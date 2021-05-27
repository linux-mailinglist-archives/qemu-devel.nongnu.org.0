Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8638C392F36
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 15:16:20 +0200 (CEST)
Received: from localhost ([::1]:57976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmFs3-0004N8-4S
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 09:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmExW-00052b-MM; Thu, 27 May 2021 08:18:00 -0400
Received: from mail-eopbgr80134.outbound.protection.outlook.com
 ([40.107.8.134]:2575 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmExK-0007sL-R8; Thu, 27 May 2021 08:17:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7t+QwDNgGkG6Fix1JKG32BxMpaW9w33xmBC4CGG8BwLRiS2kIk03yDFjeGBjdhD6SzrZxZpEHJkMsE70YkERT8nC20vYxnC8Dx9NURhqTYzWpx3HXjLoL60FtbVt6G6+o8WdR0eGONpOpgq1+o8YZGTxNvqrpYBPrp78cDzz/kdBIgbMXZRqF9ypOoDqIA2y2uTNew2B3dFke/l3Y9aJMkQs7Yd4dFovYmddGoyU7dIW2rmA8u6Slp7NTrM7i8A/PP783hQUx1FgV1upgOmieawRWEmbWUllCGk6MLNvOQql4mxRZn/gnaZ3luSBDrsvBgA3GSuOQK4+5jYfp++mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuKRBrq/VdM1PujunUrHq7VWeMBLYpzIbYHtDUqtVHc=;
 b=iLeW8yjeLRgg9ZSXWklJDtxfF9G1YR6O3mRNzfIHA+l7INA44PK1GPf2fRjhRoVYdTKyCRqb6EbvYtxyxnPCJhW4WnwwquCWx9i5YloQS8pCrMKZJPAhc+5wxheAx1OPDYrODU3ixaYDwlKshRX8DpWeqxbpUXbH+IeTegtapj4y78D1QOLXe+qhAEJD2eGiNIc5lU+TT5EU78asoo/O/yk3lDSlWS+PV/DffXDorG5ng3MZHQafHZvzhr1zBkSKe3Z7nYeNECLNdqtFaO3wnAC5jv0dVSj3KMzc9yz8ZZAEkyNAwqwZ2/zDOmuOqybUYWX2YCA1QI7llBoSzdI0aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuKRBrq/VdM1PujunUrHq7VWeMBLYpzIbYHtDUqtVHc=;
 b=VKZci9brLIRlm3Rfzh32TwpS8KoeUpld9P98t0xMnIMRb2+bXgG6LrtRYggCQ5LVHERKiYTZMkgQN+QJqDO2R3/3clZOSuZHoBIv8zE13OEcgMvU0oxKayFtSGUvTMACAhxZvyZkwGjiVvUdPGS7qxoblu6R/f6tqaCsaUW96TQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6437.eurprd08.prod.outlook.com (2603:10a6:20b:33b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Thu, 27 May
 2021 12:17:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.022; Thu, 27 May 2021
 12:17:33 +0000
Subject: Re: [PATCH v4 04/15] qemu-iotests: add option to attach gdbserver
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-5-eesposit@redhat.com>
 <59cfe4bf-6d2a-6a4d-a93c-b02e4af6c8b1@virtuozzo.com>
 <89984f1a-9816-fe96-7363-32cd13f94114@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <26e17f6d-39bf-f7ed-1081-976037c9572e@virtuozzo.com>
Date: Thu, 27 May 2021 15:17:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <89984f1a-9816-fe96-7363-32cd13f94114@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: AM8P189CA0021.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.226) by
 AM8P189CA0021.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Thu, 27 May 2021 12:17:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84815b1d-f38e-4783-c49c-08d921096787
X-MS-TrafficTypeDiagnostic: AS8PR08MB6437:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6437B51418F53D4E5C3CEA47C1239@AS8PR08MB6437.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3uzEjrVH/tvW61BuDsSGaTpbZ8FwFZpAb/EyOIcKBLG07RuumexZ0uMh3YNhHttUe47yO8diKyWigQwDFA0oqSShwwYcQ49t22Uy/nmwNYo4msprxda7XAFLJ/U4XyGYlYLY7MrgYivDGJc3gkOpKqYWZaSc8wxktJHabb0Hp5F5f8f204dgYTLyMlTV6SFaHZxLyhGQodTe4OqNs6TlkYaHPOQEmXZEg1xaEWIkZmuGivhvjzjmtmRkIAjQMZ6uMYHkjGEgvY+/77PCr1KrZ017k/xpmsFNgIT+WQNtoEF1MscqbzmssLClQ4IpFNsnemjIpjKOUTZHGAOAWsAHK+tL46KRz91TI+xwN15zT0xs4Qy1aIVR84/5wj0f197zwP+OL97pIxYNhirEP759gxjMlhQ0mKvupHYQYDimWMs9q6IobqkIfixycWheejHvs5MTMIzl/R0bq+gctAorcD94/Kyn+1/0MSNLARWfpaNy0QOvGPdySbNerynXHSVIcspaEAdKfoXG2ZEJ4jHe+J9QBux6jn9Ua2/lzEBfF1DlhhvA2CqnjWXp3cU4c2WPgctxT+QRzOKx3cIfUwjaEbF16KYtXEa04wfODhpEySXUktAWvmaPh0YI5cUwppQ05YoFzuTveqGOYKtq2138IsVczoyujlc3k2TIzZ/jxC2dNMBVzfCwahp5bOoqWHUeRWeqUVSMZ5pjQROfswp21SJLnQCcfWYYL9qfqoi6jB1+PSP4PAvQpvVU8yEdRTVd7FFwQFwpDzz7pcF1p1t1LwDQhUYJFWqP4H69Hh39kjdHmTJ8/kH5jCP0MsKQsgrIReT6kowyVYH+wxBatJU8Gg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(376002)(396003)(366004)(136003)(8676002)(38100700002)(316002)(83380400001)(8936002)(2906002)(38350700002)(31696002)(16576012)(52116002)(53546011)(26005)(54906003)(2616005)(956004)(36756003)(16526019)(4326008)(186003)(6486002)(966005)(5660300002)(66556008)(31686004)(478600001)(86362001)(66476007)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UEs3ZFlaZm04WXFFZUZPbXg2cXNma1RtK0t5YnpVNXBCcXJiN1hWMGpGRGdz?=
 =?utf-8?B?Q0pzSXhCdXJkL2lZeEx1dU84R3A4MVl4Skh6MkxKS1V4WUVWbHM4Nk11RlF5?=
 =?utf-8?B?ZWJDeWRBYkZ0NTNsQjZpRHZUZnk4ekpjbzBwQkhwdFZtZnErZm4xNy8wNUE3?=
 =?utf-8?B?TWpDblE2RWRzVjROdEZiZmpkalVzNlBKb3NPdjMzdVBUSjZ0cVlsNnN0VmtM?=
 =?utf-8?B?aUhOVEtGL0d1RktTelR0SlR0bVFjaFRldW8wa251UEh0T2pVRnZCRDBVbTdM?=
 =?utf-8?B?OVZXMDN6bXNhRmFGRGZQSCticVV3UENIbWJnNUpyK1JDOGIzUzJEcVRDQVFk?=
 =?utf-8?B?ZkNTUTBKNGdtRnZhSnNuT21wbHhxV3djZXdLdUdSbUtDb2lCcVFNN2I2ZElY?=
 =?utf-8?B?N0kzZzBFaFpvS0tSbnBDMjVXSlZUbzllb3ZpYjZOZnJlTG5MVGZFSzVtL29X?=
 =?utf-8?B?MktLSVYxUDlidklvV1JFVmFvSUhlSFBsT3gzVWg3dHNvb2daUUtUdE1TMTBx?=
 =?utf-8?B?TlZYUlhJUFhmWTFZSkU2TXVFblNqTk5RbHk1MXFsbW9XM2dBbEVHaEN4VERn?=
 =?utf-8?B?VHpXL1lTbVRZVTRLREl2TkwrTlRpYzNOV0hEVU1qdFpaNUNmZEVmYmorNzNu?=
 =?utf-8?B?V3ZkZkx0OFFKUWd0ZUVidHp4a0hEY1kwTm9JeGh2MjhzemZTNmRmSmVsUjQr?=
 =?utf-8?B?dGJsczM4M3NuUHNLbzhSTzJjQnJzL09rZDhzRG9hNnJRMFZYUS8wRkhiY0Vj?=
 =?utf-8?B?cUZ4OFBBcGJCWUdvdFZIOGxXOHJQcHMvUXhEeGZCRk0zSVZvay94TzRzK3lL?=
 =?utf-8?B?NFJ5QjVNVU1rbzVzV3MvY050ZlNISElEWnJyaFE0eldnUlh5YWM3a2FrWWNw?=
 =?utf-8?B?ZE80WkxrSnlaWW9kOXI5UkJyUzRoNE5Fc2dLdDM3MCtlMFRDV2JMZE10dHJS?=
 =?utf-8?B?NEJ1azlvdTBhOVNPUXFsekI3WURpYVJmZFFJWUg1QTJJeFdSdnFGOTVCL1pC?=
 =?utf-8?B?K0drL1M5VVFHa2s1Zkk2YVgzRXdJZXJiL0xyMGJoSWExRlV1eDR3bWdOZENj?=
 =?utf-8?B?ZVE4dWdNL05lVXVjOUtwaXN6d1RtMVpZeDZlakwzbjdmM0cyT1dEeG43ZWdH?=
 =?utf-8?B?Mk52QVdxUEpTSzFNdjkyQWk3eGE3WnNMNCtNcThuMHBIN3pMZ2p1cFczOHJ4?=
 =?utf-8?B?RnozT2o2c1Ixd0l6aWpmd1psT2FkRDRjYTNyYUlqU0JUK0dramFXekNmYmJy?=
 =?utf-8?B?WFZOTU9WOHVjMWxSNHFkV1ZmaXo4Unk5dVpObVJ0MkZZOHNoVkhLZmpsT2ly?=
 =?utf-8?B?ZXg1VHEzby9md1VreWlFOVUyMmdoc3hsZWU1Z3lvbnRzWGh4Z0xEZENCREZH?=
 =?utf-8?B?ZThncCtESnpzMVNabzRTNVZNeGllWVQwZ0pKTXZiSE1waDRiZkZKY3dDTHdK?=
 =?utf-8?B?a2JVN3pRclJFQnRYU290V1hpMVowRDJYRmFjWi9TSzZ6MWFoUVBDMWxyNHAr?=
 =?utf-8?B?dkkyYkVSYXVNWHZqaW9GdzVMNXpqYXpERWZqYVlTdUdYZkk1U2RVbEpaeUl5?=
 =?utf-8?B?RzJLeGc5SlNDc3V3Z3Z5cmRlSUtyb2t4UjZuRlBKcXdzN1gzd0x1ZWQ2NVBK?=
 =?utf-8?B?ZkVZR3VHQUFEZTZPNm9oR0J1ekIyc2F3N0RkS1hCb1hQb0EzT2NkQnBUdk4x?=
 =?utf-8?B?aFJzeWl3VXFOVVB5d2xSbW14QnZMN0NqbjB6ZWFLYlFwVk8zUDJqdHFNWkFQ?=
 =?utf-8?Q?gtHEkKH9PU6SygW3XFybUKagEh55Y44ITa/SmyH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84815b1d-f38e-4783-c49c-08d921096787
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 12:17:33.1271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/zvAT3MqYWaoBZzNYuYFK1wpjocEf9YKMgZpPbTe8hJJSk7H94UaJVI5e68ld3+CyTEYMZ557PNL7+2K7zKgWh0PBQLRoAl/XpQ1uGrMSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6437
Received-SPF: pass client-ip=40.107.8.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

27.05.2021 14:06, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 26/05/2021 21:15, Vladimir Sementsov-Ogievskiy wrote:
>> 20.05.2021 10:52, Emanuele Giuseppe Esposito wrote:
>>> Define -gdb flag and GDB_OPTIONS environment variable
>>> to python tests to attach a gdbserver to each qemu instance.
>>> This patch only adds and parses this flag, it does not yet add
>>> the implementation for it.
>>>
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
>>>       p.add_argument('-misalign', action='store_true',
>>>                      help='misalign memory allocations')
>>>       p.add_argument('--color', choices=['on', 'off', 'auto'],
>>> @@ -112,7 +115,8 @@ if __name__ == '__main__':
>>>       env = TestEnv(imgfmt=args.imgfmt, imgproto=args.imgproto,
>>>                     aiomode=args.aiomode, cachemode=args.cachemode,
>>>                     imgopts=args.imgopts, misalign=args.misalign,
>>> -                  debug=args.debug, valgrind=args.valgrind)
>>> +                  debug=args.debug, valgrind=args.valgrind,
>>> +                  gdb=args.gdb)
>>>       testfinder = TestFinder(test_dir=env.source_iotests)
>>> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
>>> index 5d78de0f0b..d667fde6f8 100644
>>> --- a/tests/qemu-iotests/iotests.py
>>> +++ b/tests/qemu-iotests/iotests.py
>>> @@ -75,6 +75,11 @@
>>>   qemu_prog = os.environ.get('QEMU_PROG', 'qemu')
>>>   qemu_opts = os.environ.get('QEMU_OPTIONS', '').strip().split(' ')
>>> +gdb_qemu_env = os.environ.get('GDB_OPTIONS')
>>
>> should we specify a default? otherwise get() should raise an exception when GDB_OPTIONS is not set..
>>
>> or you need os.getenv, which will return None if variable is absent.
> 
> No, os.environ.get does not raise any exception. I tested it myself, plus:
> https://stackoverflow.com/questions/16924471/difference-between-os-getenv-and-os-environ-get

Ah, I'm wrong than. OK.

> 
>>
>>> +qemu_gdb = []
>>> +if gdb_qemu_env:
>>> +    qemu_gdb = ['gdbserver'] + gdb_qemu_env.strip().split(' ')
>>> +
>>>   imgfmt = os.environ.get('IMGFMT', 'raw')
>>>   imgproto = os.environ.get('IMGPROTO', 'file')
>>>   output_dir = os.environ.get('OUTPUT_DIR', '.')
>>> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
>>> index 6d27712617..49ddd586ef 100644
>>> --- a/tests/qemu-iotests/testenv.py
>>> +++ b/tests/qemu-iotests/testenv.py
>>> @@ -27,6 +27,7 @@
>>>   import glob
>>>   from typing import Dict, Any, Optional, ContextManager
>>> +DEF_GDB_OPTIONS = 'localhost:12345'
>>>   def isxfile(path: str) -> bool:
>>>       return os.path.isfile(path) and os.access(path, os.X_OK)
>>> @@ -72,7 +73,8 @@ class TestEnv(ContextManager['TestEnv']):
>>>                        'QEMU_NBD_OPTIONS', 'IMGOPTS', 'IMGFMT', 'IMGPROTO',
>>>                        'AIOMODE', 'CACHEMODE', 'VALGRIND_QEMU',
>>>                        'CACHEMODE_IS_DEFAULT', 'IMGFMT_GENERIC', 'IMGOPTSSYNTAX',
>>> -                     'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE', 'MALLOC_PERTURB_']
>>> +                     'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE', 'MALLOC_PERTURB_',
>>> +                     'GDB_OPTIONS']
>>>       def get_env(self) -> Dict[str, str]:
>>>           env = {}
>>> @@ -163,7 +165,8 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
>>>                    imgopts: Optional[str] = None,
>>>                    misalign: bool = False,
>>>                    debug: bool = False,
>>> -                 valgrind: bool = False) -> None:
>>> +                 valgrind: bool = False,
>>> +                 gdb: bool = False) -> None:
>>>           self.imgfmt = imgfmt
>>>           self.imgproto = imgproto
>>>           self.aiomode = aiomode
>>> @@ -171,6 +174,14 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
>>>           self.misalign = misalign
>>>           self.debug = debug
>>> +        if gdb:
>>> +            self.gdb_options = os.environ.get('GDB_OPTIONS', DEF_GDB_OPTIONS)
>>
>> everywhere in the file os.getenv is used, let's be consistent on it.
>>
>>> +            if not self.gdb_options:
>>> +                # cover the case 'export GDB_OPTIONS='
>>> +                self.gdb_options = DEF_GDB_OPTIONS
>>
>> Hmm, a bit strange to handle 'export X=' only for this new variable, we don't have such logic for other variables.. I'm not against still, if you need it.
>>
>>> +        elif 'GDB_OPTIONS' in os.environ:
>>> +            del os.environ['GDB_OPTIONS']
>>
>> Don't need to remove variable from envirton, it has no effect. The task of TestEnv class is to prepare environment in its attributes, listed in env_variables. Then prepared attributes are available through get_env(). So if you don't want to provide GDB_OPTIONS, it's enough to not initialize self.gdb_options. So, just drop "elif:" branch.
> 
> You forget that there are bash tests :)

It shouldn't differ, environment is prepared in the same way for bash and python tests

> Think about the following case:
> 
> # export GDB_OPTIONS="localhost:1236"
> 
> # ./check -qcow2 007 # a script test
> 
> The output will contain:
> GDB_OPTIONS   --
> VALGRIND_QEMU --
> PRINT_QEMU_OUTPUT --
> 
> BUT in common.rc we will have:
>      GDB=""
>          if [ ! -z ${GDB_OPTIONS} ]; then # <---- still set!

Ah, I thought  that we work through testenv.get_env.. But we have testenv.prepare_subprocess, which propagates the original environment too..

the bit I don't like in this all is inconsistency in interfaces of check and tests:

New interface of check:

with -gdb option use GDB_OPTIONS or default value to start gdbserver
without -gdb option ignore GDB_OPTIONS

New interface of tests:

with GDB_OPTIONS run gdbserver
without GDB_OPTIONS don't run gdbserver

So, GDB_OPTIONS is different thing for tests and for check script.


I'd go another way:

Add GDB option (boolean false/true, default false)
Add GDB_OPTIONS (string, default localhost:1236)

Add -gdb argument to check, which is an alternative way to set GDB variable.

This way environment-variables interface is similar for tests and ./check, and we don't need to drop a variable from the environ, and new variable behave similar to existing variables, doesn't introduce new logic.

But that all don't worth arguing. I'm OK with patch as is.

>              GDB="gdbserver ${GDB_OPTIONS}"
>          fi
> 
> so gsdbserver will be set anyways, and the test will block waiting for a gdb connection.
> 
> Therefore we need that elif.
> 
>>
>>> +
>>>           if valgrind:
>>>               self.valgrind_qemu = 'y'
>>> @@ -269,7 +280,9 @@ def print_env(self) -> None:
>>>   PLATFORM      -- {platform}
>>>   TEST_DIR      -- {TEST_DIR}
>>>   SOCK_DIR      -- {SOCK_DIR}
>>> -SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}"""
>>> +SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}
>>> +GDB_OPTIONS   -- {GDB_OPTIONS}
>>
>> Not sure we need to see this additional line every time.. Maybe, show it only when gdb is set?
> 
> I think it can be helpful to remind the users what is not set and what is available to them (yes, one can also do ./check --help or read the docs but this is something even the laziest cannot unsee).
> 
> Thank you,
> Emanuele
>>
>>> +"""
>>>           args = collections.defaultdict(str, self.get_env())
>>>
>>
>>
> 


-- 
Best regards,
Vladimir

