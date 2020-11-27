Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA412C6270
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 11:03:09 +0100 (CET)
Received: from localhost ([::1]:34978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiaap-0001nI-TV
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 05:03:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kiaZq-0001O2-LP
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 05:02:07 -0500
Received: from mail-eopbgr60109.outbound.protection.outlook.com
 ([40.107.6.109]:3305 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kiaZm-00016p-Vw
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 05:02:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANkv0t4HE9EnhCXGi2Rz6dFKuNmrVG2lERuxXzZDwoYKRY6kRrRhedYb6wEUhi3QWrIOTWff0AMP2V9FqzaFT7cKzJuV0rmkM4SK5NI1beRGvVJDjt4gC697TAX14GgjDCFZ94bdzHUWDXgJ322ajOLzoWTTLZ/pzHH06PuRRP6zhKcUzUisgxUqmCWF4U0rHlOlmYDVTlyvToPi2GsP1iAPlMI54gXV5H1bet2apsxEslOkfWsfYpHeJr+jncvMm/pKXYFbtqwt9xW3DjihvFR0dLFd8C/ZrCh73JXIE/Gx6c60FtqzQvOvoBwap1LLkR5UgRGgOw5hVKojwxMrtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrwHjWGrXCuE42B3ImAfQRy1bKW/5xN6Q7KU9EtHhPQ=;
 b=HarCgFueNEGLo5L4etriYIE4+MesqG3dMwXpPNixQF/jDOJ5KHa4pM1tjzsOGXgPGlQOjTFL1pG86M6Z5tpxz1p/aqMs4PdUb5buVxRp+7ef3TZZGpjA32/loqA8SWWtJyPH0+WGWvetMC8QSXZA43s4b14eWdJFQxVtd3kh4hBm3JT3fCssRh2ZrDHgp4n2yqOwVlCBtm2HFz7gl1WsB4Wynlv9pp4Nx+pVaLHpQGwtL6Y+0DHmUeTwF8ELNegyBMBXJ5XaTT5fH+Du3RolCRWGt6tSjOOcbabIcBFkKgUx/8UyJKP7uillCTJeaagxrUutWs0p1TmvFQsN48j9bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrwHjWGrXCuE42B3ImAfQRy1bKW/5xN6Q7KU9EtHhPQ=;
 b=QujfHfiPFH/6Eovycl5eElSJzOH7i12n8fCVa+p0FEsPWb78sYflEe8gmFZbP+EGuepY0lbjxeQkp5Z4QyObHGmR+racbyHIDLPgwz/NHLnOW99YIMT+Gg0xapCd2yaAJ6+ifdNc0//f8hvSW9/Ws4vSKGYQr/7+b4VWzj4+9oA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR08MB5472.eurprd08.prod.outlook.com
 (2603:10a6:803:13b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Fri, 27 Nov
 2020 10:01:59 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543%7]) with mapi id 15.20.3589.032; Fri, 27 Nov 2020
 10:01:58 +0000
Subject: Re: [PATCH v4 0/6] UFFD write-tracking migration/snapshots
To: Peter Krempa <pkrempa@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201126154751.GH2366@angien.pipo.sk>
 <673bec91-31cb-5533-b223-8725948e2189@virtuozzo.com>
 <20201127094911.GI2366@angien.pipo.sk>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <23cbb153-9260-3357-04ba-94da7da8c0d2@virtuozzo.com>
Date: Fri, 27 Nov 2020 13:00:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201127094911.GI2366@angien.pipo.sk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: FR2P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::20) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 FR2P281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.9 via Frontend Transport; Fri, 27 Nov 2020 10:01:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0aa817e-603a-4d56-7710-08d892bb7a88
X-MS-TrafficTypeDiagnostic: VI1PR08MB5472:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB5472977CAD0E20AAEDB386439FF80@VI1PR08MB5472.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ovQHUuo/nbr0XSnpA1P4GYdSKksp+g6g7d6yvP7THVPIIdozQjBBU2IpTfpB1BUWjyhIiRjhEIAjPgLihP5SgGxK9xwUfldcdeZgNq3noQBEUzDByaM26ibTUEcXrjM/uUTIUUujKwL4XLty3ZcTxWvGgmIfWiAqBTtm7alJS3kh6w50W8d0ar9hAEJqOKzQ56V1R2d5OB3KJb7BSie7Ujg0fURm+YY9DerL/Arwb5wzuvHEy/UcbEneYM4EDWjBJor0iFhryubvmCqzTnTWpgFADCeJJsW/ERN7xy32EfVOfJkb/llVtgTj8boHe+S3E5IebmugB876XXkDjmQUzynxqMQU2fOb5Ilf8IffSSKWHMB7ltbHPLXi1ajuI2tH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(39840400004)(136003)(376002)(44832011)(52116002)(2616005)(956004)(66476007)(16526019)(6916009)(8936002)(66946007)(66556008)(83380400001)(16576012)(86362001)(8676002)(2906002)(53546011)(4326008)(316002)(186003)(26005)(6666004)(54906003)(31686004)(31696002)(5660300002)(36756003)(6486002)(478600001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bUJzMXVLWHdnU3gzNWl5aDJOTkZmY1JEQXZGWGpNVFNyaVh0S2JsZUxWQU80?=
 =?utf-8?B?TzFVUUdJZWZzNlMvL254Ui9LbW91eFgyQzZoN0VpQXRBNW8zclE2c3B1cTYx?=
 =?utf-8?B?OEc4NjdLV01SVWpIZk9Nd2pOS2c3QmRtdi9xV2tUbDg1Q3REV1JCN1hUUkZp?=
 =?utf-8?B?eFlSSkFtbGVKRjR5Yy94WGlWb2NPRjBQeEhGZjgxTUp2TGFjdVE0OWVLUXFs?=
 =?utf-8?B?NlZVekdCYTJpUFRRblVQYTFnUWRLcWhadllwN0lnVG1iNHcxN3ZsS05hbGNa?=
 =?utf-8?B?S1duT0xuZ1lQSngxT3FkS0c3MmxETVJTMlBQU1ZRTE5GMWVDbTl2ZFZWcWpw?=
 =?utf-8?B?K3RoVFZoTGhjaGZUcGthci9BYWpFRGNhWERBSStYdERmclJqTTAzTTArQ21m?=
 =?utf-8?B?dWo0K3VEVWY3OC9EcTdKQTU3UjZtNWVFdXhXNmZoZHpWV294RTZ5V2k4VHI1?=
 =?utf-8?B?TU5TS3ZCSlo4VWNmQmw4ZU9qN2tPWFZZRmwrY1k0WWJITTVEU3pqU2M0MGZa?=
 =?utf-8?B?UXAweGdlTkl6bEVuOG85WHNRSm9FYlhQNFVoZFBIUXBsNHFGck95K0drM2po?=
 =?utf-8?B?R3dacENkVDNodzE3em54WGw3Wkx6NXYwK2QxazFPY3h0VGVEYXhNRmc0RW9t?=
 =?utf-8?B?QWZiUWNMR1gybHBjYXV3bEFVcGRVNlhSK1ovU2ZmVnY3bkwxMUV2OSt1RExy?=
 =?utf-8?B?T0FhRHhPbWVzTXFLdzZsRzNkQXJ4VllKTm5SdDhXZFZXQUlQa29MNGk5bHR2?=
 =?utf-8?B?bzduaCtTTjQzMlptY0FCamx0TnMySDNXT2ZRT2lNMVRvVjA3ODV2bG5LelBC?=
 =?utf-8?B?L1lwMmRxbllFdFVBbFN0MEhiaDhQZnZTWVdzdHBCTmU5VTN2S2ltRGEyTzlv?=
 =?utf-8?B?bjkzKzFENE9pY1plUEVxU041U1J6ZVFHZ0YwSmx1U29CbEV5Rzd4Zm5ydXZJ?=
 =?utf-8?B?aElGeGp5Q1A0bGRZYzRXcUNZaFAvRjB4QnNVQk9OMGRIdFhhRUFQSWJvbDZu?=
 =?utf-8?B?V0VFbHprQU01bEtpYjVSNEZGcXdrUlIyemtDekFZanlRbWlVaTNHM2FhVlRF?=
 =?utf-8?B?UytaRzBNOXJwbXZnd284RTgycktpT2RuTGlHUGVLTnJhTEhGdGpKZGlIdmVD?=
 =?utf-8?B?OURsVm5zRVUrL1Zmd2V2Z1prZjlyUlpERXAwb212SGMwMDZIemFETEhDR3Ny?=
 =?utf-8?B?aE5HK3RsSFhTSGc1dVlUbm5tK0w0VWxlWURLUUdKdmFGei9WQTZQU1VyOGJn?=
 =?utf-8?B?RklBWFRXMEtqNEFmZVhmSXdoWWh5aE91eEEwbG4xSlJYV21FTzQrNXgrNUll?=
 =?utf-8?Q?GVhoHGW/AVGBhOUd/MfmsrXSd///if+Yu7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0aa817e-603a-4d56-7710-08d892bb7a88
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 10:01:58.7757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOTL4M+vxbNLWiXMu0LTWWp+TxdEwQON19RKebBe22rVdwpV+wXizVSejA/urL3n8VdTmMWvdImLDgkgAEWzyVzQSR1FGk94W8p5u7IeuIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5472
Received-SPF: pass client-ip=40.107.6.109;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

On 27.11.2020 12:49, Peter Krempa wrote:
> On Fri, Nov 27, 2020 at 11:21:39 +0300, Andrey Gruzdev wrote:
>> On 26.11.2020 18:47, Peter Krempa wrote:
>>> On Thu, Nov 26, 2020 at 18:17:28 +0300, Andrey Gruzdev via wrote:
>>>> This patch series is a kind of 'rethinking' of Denis Plotnikov's ideas he's
>>>> implemented in his series '[PATCH v0 0/4] migration: add background snapshot'.
>>>>
>>>> Currently the only way to make (external) live VM snapshot is using existing
>>>> dirty page logging migration mechanism. The main problem is that it tends to
>>>> produce a lot of page duplicates while running VM goes on updating already
>>>> saved pages. That leads to the fact that vmstate image size is commonly several
>>>> times bigger then non-zero part of virtual machine's RSS. Time required to
>>>> converge RAM migration and the size of snapshot image severely depend on the
>>>> guest memory write rate, sometimes resulting in unacceptably long snapshot
>>>> creation time and huge image size.
>>>>
>>>> This series propose a way to solve the aforementioned problems. This is done
>>>> by using different RAM migration mechanism based on UFFD write protection
>>>> management introduced in v5.7 kernel. The migration strategy is to 'freeze'
>>>> guest RAM content using write-protection and iteratively release protection
>>>> for memory ranges that have already been saved to the migration stream.
>>>> At the same time we read in pending UFFD write fault events and save those
>>>> pages out-of-order with higher priority.
>>>
>>> This sounds amazing! Based on your description I assume that the final
>>> memory image contains state image from the beginning of the migration.
>>>
>>> This would make it desirable for the 'migrate' qmp command to be used as
>>> part of a 'transaction' qmp command so that we can do an instant disk
>>> and memory snapshot without any extraneous pausing of the VM.
>>>
>>> I'll have a look at using this mechanism in libvirt natively.
>>>
>>
>> Correct, the final image contains state at the beginning of migration.
>>
>> So far, if I'm not missing something about libvirt, for external snapshot
>> creation it performs a sequence like that:
>> migrate(fd)->transaction(blockdev-snapshot-all)->cont.
>>
>> So, in case 'background-snapshot' capability is enabled, the sequence would
>> change to:
>> stop->transaction(blockdev-snapshot-all)->migrate(fd).
>> With background snapshot migration it will finish with VM running so there's
>> not need to 'cont' here.
> 
> Yes, that's correct.
> 
> The reason I've suggested that 'migrate' being part of a 'transaction'
> is that it would remove the need to stop it for the disk snapshot part.
> 

Hmm, I believe stopping VM for a short time is unavoidable to keep saved 
device state consistent with blockdev snapshot base.. May be I've missed 
something but it seems logical.

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

