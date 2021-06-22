Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6612D3B029A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 13:17:32 +0200 (CEST)
Received: from localhost ([::1]:56628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvePL-0000V5-Gn
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 07:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lveMG-0007uJ-UD; Tue, 22 Jun 2021 07:14:20 -0400
Received: from mail-db8eur05on2127.outbound.protection.outlook.com
 ([40.107.20.127]:1792 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lveMD-0007i0-O4; Tue, 22 Jun 2021 07:14:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItXDLMHtLYeFD6N18OAuaUmaQLszUHyPsw5mGixwt266v9i1q8xyxgosBeBwjM5N4UZQg+FzWSmTNsl3KQMvTzX039wCmqDmmgtOxt/yCHRDmDTbCp2ETVS+CWnR/Ul/hEqZ12sG7LZmE/q8geywJP083TApYSH/5z/TqZ7zl2ZdrAwweZovEt6LFeAU8jwLATO7BhwKfTerUQ2EUtOeH6GeiaDdaVAWhuDN81A4gBnUR5BaQien3ywLumtr1hEl5X1tVFeGsVbhxG7bw5QTFNC6apB+0aAkV8JhaMvTlGvq1WtZNvL5xMya3YO/m3BIzhBuLRH7Vh3fQWy+FSdZFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3oZ5LMmsh4hOF2MjA0UQGCPSCC88HjIOngHqWUyasM=;
 b=AI3o5myi5WLXUTaL0U21HCRvsScbshjcNDu++NZ5mt3zri0W0GPAkChaJOZmQX3n2Y9B3Ho17ujTGlMlLFGWbCv9JSdnhnWMf1knTGehKisAig0zofmP5ASk813xJFKLXWGK7dObb29DtGbAZZmM5+0PxCUlF+dr6GkmNcpFoeXLUgG4Lsj1U7/E0aiThREFQxnzFX86bq/nl+ZvI3ItipH/8UeJh6yVbHO2Mjzu/ShvIGW7qhQAKLboRradeLDgV5HA0AV2TnHP25MuTBA4mdswXRdudmtP1hH0XhFJ4ql9wrYr6aacz9K/I/GG4z32upcpWbxhoMwx5o8SKQMUfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3oZ5LMmsh4hOF2MjA0UQGCPSCC88HjIOngHqWUyasM=;
 b=BoQNibxqwbNvz2syf+HjgZbWZg7aun2tpDgUm+bu3Rev2Cf4hIWsqcU9wDFCHPZczPMY3Gn1F4WlwhSURLrdCxe53Pt9KnCvL4/KcuTFuarwCHLYhC6zB07i+rHSMb84MbB/zgvKn2tHfB48C/TpwcoQ4wQ+K6YsZ0GU/D6yUZE=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6261.eurprd08.prod.outlook.com (2603:10a6:20b:295::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Tue, 22 Jun
 2021 11:14:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 11:14:12 +0000
Subject: Re: [PATCH RFC] docs: document file-posix locking protocol
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 eblake@redhat.com, den@openvz.org, Kirill Tkhai <ktkhai@virtuozzo.com>
References: <20210322182738.60395-1-vsementsov@virtuozzo.com>
 <69357fc0-7c67-ace5-867b-135b6abc69bd@virtuozzo.com>
Message-ID: <bc400a16-3df4-30fd-9c6d-3cd5bbd00e4a@virtuozzo.com>
Date: Tue, 22 Jun 2021 14:14:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <69357fc0-7c67-ace5-867b-135b6abc69bd@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: PR0P264CA0196.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 PR0P264CA0196.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Tue, 22 Jun 2021 11:14:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e72afca-1711-472a-a14a-08d9356edd55
X-MS-TrafficTypeDiagnostic: AS8PR08MB6261:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6261E1336F738263C9B7719EC1099@AS8PR08MB6261.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rg9XxTtD1bvgSa/hoYaTd4BpcZQ9YAlmhj1+DWep8cEnqG8zqzdLfxjw1Va3DIcxr/OvLSZXac+o7tyuSDdi6f1+LkopazI0arUiVyaL/9vFKGMkCieBzTrf/1GZwD7LhwYb4heiekusjOJ4Q5+8q5L7/F68RlGH2TUztBtfICd16YA0kFJykNHoEozs1NcMdSABya9jXCmfDsAe4dNTK4nAA2dXth2u/5ZBtDShzjB0sOQVYM7L8XZfYUTGBKQJcP+lsi04jiuKMCrfhlGNowYALeHrbMgbgmNreGalmsvFoYxAfysC5R3LQvC24Nn/owvVfVmvquLoNPM9A+w2ILpQuCIZnLokknFYIo9Y8wBVuAZ3utzyWB3z4DLxI6F4xFrxLx15xjT3pb1pg3rfIHRoF6FY/DtkxqcvETpaPartH6muPAxvuOhSn3MVM17z/tI5x/DGL36SOcWnf2j4zfLFgpn7VjgCwYsavWUqzsEwyYyKpJODG0dtP9lQtVC8ksAHtB3B+/26XjcXkupFW/sj7mG2y0Gqsu75JC7g/58/ZF5EQbzRLbj+b21Ty8gXGHiKt1FDc6VSR8TL905YE2kHhQIDV631vIFvkQ8zAtAXTkjs0HWB1h/p5BVU0x6cYitH5m1HkeFMeOTpPQjlZ41GLuQEhHLD5fEcciFIvsXIrE02NrfN2BLri98GfeG561xV8nnlx6+TZkrJazVB8d3DgZVP1WjqBHY/iiR+6kg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(366004)(39840400004)(376002)(8936002)(52116002)(8676002)(316002)(16526019)(26005)(83380400001)(186003)(31686004)(6486002)(6916009)(16576012)(66946007)(956004)(38350700002)(107886003)(2616005)(66476007)(2906002)(86362001)(31696002)(38100700002)(478600001)(66556008)(4326008)(36756003)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGZiSTVBc21kSHZBYTRCZGtHN242RGhIRDEzRkVzRDM3dGdZZFJUUVpKcFo5?=
 =?utf-8?B?cWtFVitrUE84Wm5sYzJNcG1Xck5qdExHa2ZSamYwTld6WXdFYzlMZHowTC8y?=
 =?utf-8?B?dnBTMWxlN3BGU0ppS1JjOWxTV0dWVWJHR2tYNFRtVFJGWDJQM2NJaStPWWFj?=
 =?utf-8?B?Zis5VS9GdTZjY2VVOGl0TEVuWnNvT1F0ZTEyTXBoVkhIUW9ERHhRc1cyaXNO?=
 =?utf-8?B?R2k2QzBpOC9pN3FPSTQxMGx6UTlSZjdUV1lyeXRjYWZ0cFUrQ1hPSTZ3RERH?=
 =?utf-8?B?eHorNEtpb09NV3RFZkU5dVNpYUlJUXZyZGFqUFFrZ0tBdS9OUmR4dE8yeTND?=
 =?utf-8?B?YUdSaFgrVS9yZ043R00wMTAwTk9CbVM3c2Q3REhQUldNenlkOHgzTmVJdUo5?=
 =?utf-8?B?NDUrb2hIRThHeTNQTE01a1BRQjg0bGR5MlcvcUFPMzk4cXBnQjZHV2dvU3dT?=
 =?utf-8?B?UkFCRFpJR2pBbVR3RUFSL3BJeVNlNitBWWRnN1pyeFMxVUZQSDRzaWt6Sy9M?=
 =?utf-8?B?NlMyNkx4aTg4d01BbC9VZnFSQ3pNMUc0dDg2V1RwNURGYW9qSGVoUmQ4RENY?=
 =?utf-8?B?d1ArdWFmWWVDQlVzTFc2Q1A5RDlvemZkaG9ZRjVoOCtIRHJZV04xMkpRRkN5?=
 =?utf-8?B?VnpkTjlQZXhqOGRROXAwUk1ySmlBQWtTdkFXdzRpeVRyNldnRzNzSFg1Q0FU?=
 =?utf-8?B?UlNGQjV5SXJScTFnU1dMbTFvZFozYnh1UGJjZUswNHpPdzZONmQybGRtRVBD?=
 =?utf-8?B?dHBvQU1rakxHZENPa001eTRtS091ZVhDalFEYnhNODBhNTAvbWwvRmtNamZD?=
 =?utf-8?B?emNEU3p3QTBja2pzWkVkSDMvOVlVQkhLK01RY2dnTzhnczMwQ2ZWSU1wUHh5?=
 =?utf-8?B?b0FJNjhpUVJ2bktZT3h1YTdqODgzWWxGYjl5UE9IQUJHZDFYbStJL25EdEg4?=
 =?utf-8?B?Vy9sT2VqRmdxSDVqMHZIRlozdXBUcUpPb3hwNkJENE1PNWo0RnNIU1Z6WldB?=
 =?utf-8?B?Zk85VllaUGZtSWRsVnkva3VFSXM2cWEzbzMvTWgzY2h6Y3N5WXk1YUt1aENO?=
 =?utf-8?B?bTBwb3dJa1NETGljUVZKZ2dKckVNUlNrU2V6ai9RRzU5UkwvT3pIYWQ5MjhF?=
 =?utf-8?B?SmFJL1BlNDBUWnF0LzFJQ2FiSlMrVDB0OWZlMGtXdzl4ZDNWSTBzYVlDa0hG?=
 =?utf-8?B?SnBrN25PZ3pXZGxNa2VDQWozaDB2d20vRUkwSCtvQTZWUy9rKy9iOEphQjNM?=
 =?utf-8?B?d3UzbE1VTVk5NGJta01OYWd6b0lRNFZpM3JoOWNDK0pUNmFQT0hnUzl6c0V6?=
 =?utf-8?B?WHJjeFEzaGcxVW8rNTFkOHF1WGJ1d1pETGpBeE5RSzRoNmpVVGJyRit3QTVU?=
 =?utf-8?B?V2RjYUxvTWRPVWlNOS95dGcybjA0dzJIZ00vcjRrblZ1ckM4OTBOU0dBRUlt?=
 =?utf-8?B?VnVyUkVmRnVjVzZwME1FOENYa2Fkai9OazdlVHRteTAwWUtvVkMyT2JBTzc1?=
 =?utf-8?B?NGFOY0kyci9VeEE5YWJUcW5TTkdTendIbVUxd28vWVp0ZHZPdXE3TDhsL1Fz?=
 =?utf-8?B?Y0pjdEpCNmtkaVp3VENqY3J1eEx3MHhzK2p4YlZPQWdPUzRhMWZQK2RnQjUv?=
 =?utf-8?B?NjdCZXhIVEd6QkVVdGdva1RMQ3N4UTBkdkRCWXN1Y1diTGlHL0taWkI1cFlN?=
 =?utf-8?B?Uy9zSC9uY2tlNXh2WmJSYzFJNVBLSlF4SkZyRTM3OEwvam9aN2tHMFc1ZTlV?=
 =?utf-8?Q?3bGZI9iPhh6PxXKMdNe/6ujoq+n4J58NLV+jDiZ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e72afca-1711-472a-a14a-08d9356edd55
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 11:14:12.8763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZQ5wgqfYMU1Rj8ZFs9Y8pfHMQVL3um7xLdNWd0MARqzdLF1W/sykCDXvAzlSOe8ZPoERVJ68qHh1OK7VCz41DAXOoZWCZ5MJYNdfX8Ru28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6261
Received-SPF: pass client-ip=40.107.20.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Ping. Any thoughts?

24.05.2021 17:40, Vladimir Sementsov-Ogievskiy wrote:
> Ping.
> 
> We need to synchronize access to qcow2 images between Qemu and our internal program. For this solution to be reliable, the locking protocol should be documented at least..
> 
> 22.03.2021 21:27, Vladimir Sementsov-Ogievskiy wrote:
>> Let's document how we use file locks in file-posix driver, to allow
>> external programs to "communicate" in this way with Qemu.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>
>> Hi all!
>>
>> We need to access disk images from non-Qemu code and coordinate with
>> Qemu utilities which may use same image. So, we want to support Qemu
>> file locking in the external code.
>>
>> So, here is a patch to document how Qemu locking works, and make this
>> thing "public".
>>
>> This is an RFC, because I'm unsure how should we actually document
>> different operations we have.
>>
>> For example greaph-mod is a strange thing, I think we should get rid
>> of it at all.. And at least, no sense in locking corresponding byte in a
>> raw file.
>>
>> The other thing is write-unchanged.. What it means when we consider a
>> raw file opened in several processes? Probably we don't need it too..
>>
>>   docs/system/qemu-block-drivers.rst.inc | 55 ++++++++++++++++++++++++++
>>   1 file changed, 55 insertions(+)
>>
>> diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
>> index b052a6d14e..3cd708b3dc 100644
>> --- a/docs/system/qemu-block-drivers.rst.inc
>> +++ b/docs/system/qemu-block-drivers.rst.inc
>> @@ -952,3 +952,58 @@ on host and see if there are locks held by the QEMU process on the image file.
>>   More than one byte could be locked by the QEMU instance, each byte of which
>>   reflects a particular permission that is acquired or protected by the running
>>   block driver.
>> +
>> +Image locking protocol
>> +~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +QEMU holds rd locks and never rw locks. Instead, GETLK fcntl is used with F_WRLCK
>> +to handle permissions as described below.
>> +QEMU process may rd-lock the following bytes of the image with corresponding
>> +meaning:
>> +
>> +Permission bytes. If permission byte is rd-locked, it means that some process
>> +uses corresponding permission on that file.
>> +
>> +Byte    Operation
>> +100     read
>> +          Lock holder can read
>> +101     write
>> +          Lock holder can write
>> +102     write-unchanged
>> +          Lock holder can write same data
>> +103     resize
>> +          Lock holder can resize the file
>> +104     graph-mod
>> +          Undefined. QEMU sometimes locks this byte, but external programs
>> +          should not. QEMU will stop locking this byte in future
>> +
>> +Unshare bytes. If permission byte is rd-locked, it means that some process
>> +does not allow the others use corresponding options on that file.
>> +
>> +Byte    Operation
>> +200     read
>> +          Lock holder don't allow read operation to other processes.
>> +201     write
>> +          Lock holder don't allow write operation to other processes.
>> +202     write-unchanged
>> +          Lock holder don't allow write-unchanged operation to other processes.
>> +203     resize
>> +          Lock holder don't allow resizing the file by other processes.
>> +204     graph-mod
>> +          Undefined. QEMU sometimes locks this byte, but external programs
>> +          should not. QEMU will stop locking this byte in future
>> +
>> +Handling the permissions works as follows: assume we want to open the file to do
>> +some operations and in the same time want to disallow some operation to other
>> +processes. So, we want to lock some of the bytes described above. We operate as
>> +follows:
>> +
>> +1. rd-lock all needed bytes, both "permission" bytes and "unshare" bytes.
>> +
>> +2. For each "unshare" byte we rd-locked, do GETLK that "tries" to wr-lock
>> +corresponding "permission" byte. So, we check is there any other process that
>> +uses the permission we want to unshare. If it exists we fail.
>> +
>> +3. For each "permission" byte we rd-locked, do GETLK that "tries" to wr-lock
>> +corresponding "unshare" byte. So, we check is there any other process that
>> +unshares the permission we want to have. If it exists we fail.
>>
> 
> 


-- 
Best regards,
Vladimir

