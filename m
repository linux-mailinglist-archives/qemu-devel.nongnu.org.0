Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F01A387BF9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 17:07:45 +0200 (CEST)
Received: from localhost ([::1]:37568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj1Jw-0004sV-3k
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 11:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lj19M-0001vA-79; Tue, 18 May 2021 10:56:50 -0400
Received: from mail-eopbgr140091.outbound.protection.outlook.com
 ([40.107.14.91]:42532 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lj19F-0001SN-3E; Tue, 18 May 2021 10:56:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vp90DbiCws54KIRBwkt2moKOH4qHqSxSLNBVjUh+tsdzdZPobEYvApZeTx/tlC5VDwtTj6pbJ9JQ1nRJ52wUPLIOnmPo2+c11L1EEwUTGkEKwb9YV9aqPTb0l14K4v4bDN/au0jlwucwDBWICJ4KiY4/nQIhyRaBPXeZZcaV1vsqHYd8/FIpURYPanHdW61u6bySPIZxsBpXZSwy7OcZ7KZ9+Y0vc2CbSEt9R3s7SnFZiIWGSeJ9oI2ZX6gzXgQdSmJ0LsIRyCqCgqWIWck7X+pmysQtRoyfL2hvkyThkJkBoJLSy1nyb20lOolv24Nl49iCVYC2L5w92RlFwNeFsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIOSg2SGEk3HMH9XAD/e1/KA3uUxlBXvqBgf6ab6YOI=;
 b=GoP4U6KSxV9GiqqV3t4DLRVwOok9iWCLpzL39SexUtPT5sd/rcB8+svSdJw1fMzmMc7m6CIDbiLhW41xG6kRbDyz9lMDScJF676N1YUUU0R0Lop6Yow0yxtPWRGKwsEdkvo2iuSDD6J86LUOJpJ7/J7qVLqlkSuhz7XsUwEdy2W+GeL8smwvR335wonSd3SQ8zgZRTkpdgzd71auuADRBoHNmgc0f70GkMQOMuI1FkPgGqJBZbod5Tct8B5ofgZqIS4OQi51u+MyXeBYp1qR+N277wfFycSpbUEiwq0PKjFVFdocX+gr0bOkfdS2Xr+Zf1k3bDBzIuiL+ob77sBp3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIOSg2SGEk3HMH9XAD/e1/KA3uUxlBXvqBgf6ab6YOI=;
 b=heh1PxVPr7crMcvAUU2/iV6mxAZb2D76+P6DLSPb+LhPnQ7OFYK9jt8MXgqSgYanDqz+ATRtwwAEi+3Akjm2lUToLbJ2vPBw+UejOAdx3mx3csRCSBO9VaPmMVxW/Vp/+Xy6dvAMVG5rJ4H8Hjo2yVCjPTU8IK1ButE0nTvnZIo=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6631.eurprd08.prod.outlook.com (2603:10a6:20b:339::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 14:56:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 14:56:35 +0000
Subject: Re: [PATCH 20/21] qapi: publish copy-before-write filter
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 jsnow@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-22-vsementsov@virtuozzo.com>
 <b6c8a8e6-63f3-8437-93d4-5f1522383b7e@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5b4989e9-33ea-4c11-27eb-22cdd424ed15@virtuozzo.com>
Date: Tue, 18 May 2021 17:56:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <b6c8a8e6-63f3-8437-93d4-5f1522383b7e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.199]
X-ClientProxiedBy: ZR0P278CA0007.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.199) by
 ZR0P278CA0007.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 18 May 2021 14:56:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90d6eaee-ab38-4f63-025c-08d91a0d21dd
X-MS-TrafficTypeDiagnostic: AS8PR08MB6631:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB66318FBBF47FE8B68C3BE609C12C9@AS8PR08MB6631.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dkgD+ItQQQzX1lJUptLO128gHtDVNedtltSkgDK3dXO8KGTNN0AXkmWoaYMX1N2RbASS2a9Zq4ZDeRb4yLtQF1ExIa8Eu0QunzOBb1Cfo8bVZdNEh3CQUM1sgYt2FwyEwB1YNwEpNiP+nVvsPt0jjVi+tvGqdbBFsO7WDYyInqUpeWfrc0mqs4MXba2wbcPK6mPuYqzl+2GPCO2f0ZOpwmGntg6M9K7kIdwFIblWLMExJ1rUppxbh0WkWoxCM5ArCME1qD3xJiLc8oeHBuB9d9iE6vUvUfjycMcyrc4kuYZa9ihJi4VTai7NVqYMvPVoob3duZcSuN6uVouUUtrQadRMsuCw3yeOv2bmK2elYf3GdgreqD2NPl/zbf7d+50BP/+rRDRsmeZL4ZY6qLw8a/n29xw6Ybeyl1WoEAjwEUvNPFXgqXl265XEVo6RCw33oob9YsU87OG86ctTdvaia42EPl3Tj8YWzrMULzMKIou9VVkHSQMfGLe8xQIbMgD4TC3mrY+hYkqQk1x/UPZtXt2F+EZNK15aggv9H/nljswqJY73NKD24J1/NxkEf8LoyNU6p+4Kx1+8iHhVwRyB3OQ88JggNtmvJnwnXfITj2A/jvfjxmsBeAbcZ7uGUd0DppRdSd9agm9OjiIAyNaxvbqyWGKC+X7KtnOesUWcbT9h1guP3lYPVyWiy2pB/V8aFGnFJRnJDjXICAFgLWLn4wBgMETryhnNhoSbzARDKO0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(366004)(376002)(346002)(136003)(36756003)(66556008)(2616005)(956004)(4326008)(6486002)(66476007)(16526019)(66946007)(52116002)(107886003)(38100700002)(38350700002)(53546011)(26005)(83380400001)(31686004)(5660300002)(478600001)(2906002)(31696002)(8936002)(86362001)(16576012)(186003)(316002)(7416002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d3cyK00vQmpkaDRaMWhGcVB2a0VVaXVONzY4bC8rVm01WHN5ckxvWEYzOS9N?=
 =?utf-8?B?N1lodUJmWnJnQUpTUFQyQmxCZXhzY3AzMUpWTWtVMlBEOVhmSkZta2krSmFL?=
 =?utf-8?B?WVo5QVArdHhsNTVvRDlaVkdncEhGS0lJRVp6L3lWeUxQVnpBZ29IY3cvcktL?=
 =?utf-8?B?L1B0b1lPYVZBZG9BemlMV2JBc0duR3QrTDZlRnRaYVg5UlBIWi8yL0ppY1px?=
 =?utf-8?B?SjZSRk4yN2JreDdqSmI1Y0t0WWswWmVMek1tbEg4YVZGZ2YvSkhqYkdZclkz?=
 =?utf-8?B?OUNSSTdDMW45UEU4aTQ2Sk9yeXFvbVExQTZYdlVtRVFqdHBoR0JOb0NaZFRF?=
 =?utf-8?B?K0R1ZmpEdUkvcWdHcDFIMS9TT21FK2xQbE9MaE1jNzExZi9lcStULzhyZWhp?=
 =?utf-8?B?VzgzTVduZmpFMzdEbWtqWk1kT0g4WGNYd3RmeVRDUW5WalFsRU9qZlprOEgy?=
 =?utf-8?B?eGk3ZmhEejRYVVBSdlJrM2s2bG1aREdCY2xMKzlhNzRvTStvYnoraWZETW9m?=
 =?utf-8?B?S2hkSHZXN1VpRE1aM0NhRzlxNEs0a21mZ2tWQXlPbkRCTlBMYkNYbk5uYVBw?=
 =?utf-8?B?dHpKbFVHc1ZPZDBBMXpjMWVsdXNwa2ZMS3EvK2kzalU4cG94clF0MmV5bGZB?=
 =?utf-8?B?VS93SWdqZ1U2UEtxV0ljNFdOVEtaN2pDT1BuaFhnZDE2RGRIeE9meWZjbzZL?=
 =?utf-8?B?ZTRpSXJCdlY1NzZTSFhIaWJwOTZIL3ROOUhHTEFKZEh2V2lBeXVqbUpiZjVB?=
 =?utf-8?B?VThjSUlKZEM4VGlGaVJJUkRaTUljTjlQaFU0ZytrZlpybVo2MWNsd3dpRER4?=
 =?utf-8?B?am9jYjFWRy8xT3hRTE1sRnBjS0dxTUZ6ZEhROTBKVW91OXNtNnFwZlczU2l6?=
 =?utf-8?B?VkVpd0NEUis3QldxZUFEQTlyUmRpaFlkeHoxNWM1Zkl5V3N5TUk2WnBxb0VO?=
 =?utf-8?B?dGkyMzR0NXhjaTZzWGdnL2dndTc5MERKQktpRWRkNWh3Q1doMytjQkk1cktN?=
 =?utf-8?B?SFMwSUROaDlwWUVCUGo0cHA3anVpNk1VTmpxN013Ym1RT3FSQ3JMMDgvZUNs?=
 =?utf-8?B?dWp6ZjJzdnQ2dDdPR2lUT3NLbGo3SjJrRlhiTXBvMFdpVWJ4dVFHb2pzOU5N?=
 =?utf-8?B?T1J4b2hDYTA1cHFjbmRIRDdReXdLRWNlblVOUTdaaEFoU2l0dDdFc25FK0I3?=
 =?utf-8?B?MEl5c0xMbi80RWp1M0ZTZmtGRXNOSzkwOCtaTnl0Mm5aME5zTStvUlBsRy9i?=
 =?utf-8?B?MmhhaUwrMUh6U0dpOHNYRHRUY25EcUZ0L1czemtlUFBpVUZvU3ZneVZ0OEZn?=
 =?utf-8?B?M091Z3Y5Z1NWQzArVzY5a0lPMUhnMjEwREFHdnRyemk0ZWFyeGNQRTJicWdU?=
 =?utf-8?B?c2Ntd0lSTkd2RUxHUkhQRWFDd0I5bG9maUx5UGRxWmV4cXdRMXdrRml5MGRN?=
 =?utf-8?B?TURrQkhIY21SSlJGS3BZYlZVYUVaVlNSQzdQaEVTcSttd2JLRjNRUTRvaVF6?=
 =?utf-8?B?ditWT2tkUUJkZzd5eUFXVHRSbnFTaUhxczlXM0RGT1JqTnZhSWVrek03NVNz?=
 =?utf-8?B?SHZQS1lsZlpiV1k1NjFoVEVUVmtvZDZSdjB4b0Qwb3FtbkFvR1k4MWp6dFQ0?=
 =?utf-8?B?cXB1cXNINWJzMFF0U3dWYWt5emkrZ1Y3M2UzTVBqTDBxMkNpUEVvYUl3UzdC?=
 =?utf-8?B?bHpKdzdzdm4xZnVkQmpJd29maHBkYlJ3ZFBWbVhZZ0lVdHlEUXRVWU84VThJ?=
 =?utf-8?Q?TFryLTQ960K/V5X+6MVN4sUcC3HrJJ7JCEIBHQJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d6eaee-ab38-4f63-025c-08d91a0d21dd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 14:56:35.5959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VRNdyjdpqGiBDYvyl+dHiTGOldJ0cONE3Xcud2RzXZXW0tCNWAF134V90PajTGpV27nbaq6L2WkzER2q+3ogSNNDxSC8HYQfZP/M2m1UKIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6631
Received-SPF: pass client-ip=40.107.14.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

18.05.2021 17:48, Max Reitz wrote:
> On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   qapi/block-core.json | 22 ++++++++++++++++++----
>>   1 file changed, 18 insertions(+), 4 deletions(-)
>>
>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> index 2ea294129e..f8fbcb6416 100644
>> --- a/qapi/block-core.json
>> +++ b/qapi/block-core.json
>> @@ -2808,15 +2808,17 @@
>>   # @blklogwrites: Since 3.0
>>   # @blkreplay: Since 4.2
>>   # @compress: Since 5.0
>> +# @copy-before-write: Since 6.1
>>   #
>>   # Since: 2.9
>>   ##
>>   { 'enum': 'BlockdevDriver',
>>     'data': [ 'blkdebug', 'blklogwrites', 'blkreplay', 'blkverify', 'bochs',
>> -            'cloop', 'compress', 'copy-on-read', 'dmg', 'file', 'ftp', 'ftps',
>> -            'gluster', 'host_cdrom', 'host_device', 'http', 'https', 'iscsi',
>> -            'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels',
>> -            'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
>> +            'cloop', 'compress', 'copy-before-write', 'copy-on-read', 'dmg',
>> +            'file', 'ftp', 'ftps', 'gluster', 'host_cdrom', 'host_device',
>> +            'http', 'https', 'iscsi', 'luks', 'nbd', 'nfs', 'null-aio',
>> +            'null-co', 'nvme', 'parallels', 'preallocate', 'qcow', 'qcow2',
>> +            'qed', 'quorum', 'raw', 'rbd',
>>               { 'name': 'replication', 'if': 'defined(CONFIG_REPLICATION)' },
>>               'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' ] }
>> @@ -3937,6 +3939,17 @@
>>     'base': 'BlockdevOptionsGenericFormat',
>>     'data': { '*bottom': 'str' } }
>> +##
>> +# @BlockdevOptionsCbw:
>> +#
>> +# Driver specific block device options for the copy-before-write driver,

which does so called copy-before-write operations: when data is written to
the filter, it firstly reads corresponding blocks from its file child and
copies them to @target child. After successful copying the write request is
propagated to file child. If copying filed, the original write request is
failed too and no data is written to file child.

>> +#
> 
> I think there should be a description of @target here.

Right, I forget. Something like:

@target: The target for copy-before-write operations.

> 
> (Looks good otherwise, though.)
> 
> Max
> 
>> +# Since: 6.1
>> +##
>> +{ 'struct': 'BlockdevOptionsCbw',
>> +  'base': 'BlockdevOptionsGenericFormat',
>> +  'data': { 'target': 'BlockdevRef' } }
>> +
>>   ##
>>   # @BlockdevOptions:
>>   #
>> @@ -3989,6 +4002,7 @@
>>         'bochs':      'BlockdevOptionsGenericFormat',
>>         'cloop':      'BlockdevOptionsGenericFormat',
>>         'compress':   'BlockdevOptionsGenericFormat',
>> +      'copy-before-write':'BlockdevOptionsCbw',
>>         'copy-on-read':'BlockdevOptionsCor',
>>         'dmg':        'BlockdevOptionsGenericFormat',
>>         'file':       'BlockdevOptionsFile',
>>
> 


-- 
Best regards,
Vladimir

