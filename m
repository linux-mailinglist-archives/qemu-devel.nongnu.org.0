Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AA1490957
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 14:19:30 +0100 (CET)
Received: from localhost ([::1]:56234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Ruz-0003VS-5h
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 08:19:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brijesh.singh@amd.com>)
 id 1n9RD0-0000oh-MS
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 07:34:04 -0500
Received: from mail-bn7nam10on2047.outbound.protection.outlook.com
 ([40.107.92.47]:62208 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brijesh.singh@amd.com>)
 id 1n9RCw-0000RO-P3
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 07:34:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EaPwx/Y+yjvlt3b6RYcEpMbSp5i1+P/Kk/SW0+Kc4hT90MeuIt96c9K3y4RiSGnBTV3u0hsGMmzSDulS8XFn89IGT3FOwggMYKBo1Ip9V9PoqTfIOf/Z+vbp3rG9Z8dSJSx/9L6lLFGJCQ8yEKmXZ4G6xpL1q1MiqgnZE/hbZmgzCI1j9RmEsm45s2K88tDu0zyYOwXTcaDkkbGGTTTGkpnjV5BY5UI65X8KRwlAGmWMMdFcSmnqgrpL4e6EYiQt/2zl6yg01BCOyDuQiEKGeTI6tEdeFQNgRZdoLu0XeVH5ViFm1jUIDwMrKKrcgOsLoca8rJLuc6RraQCAx/BC4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWzrSFGdRByZBt0qyOWlsF84Ene0iSMrCRVrgBgXMe8=;
 b=fXGu5PImDrX7kC+B5tSmRmEbXiheNcch9YjBdbNV/SZQQwiK5fWldvz0mkhR8VUnjIacRJUCG67qSchiiOflBa9yMQfOPsdZrzf5NlBDXjC6sh+veo1QWJKIX6KLELo7UAJDDGTgCIcNKdvoDwggRaLz211aa7/3ywhxFkyLD5WdnyddQFGxbAJcgL9sY4ijdv8Typl/p6AhvWq3Ti4cYE8fHi2pC2JqLNJYDhTZJ1n0ODobgqiCa6f9xat6yjsLKYNwyFobi0niCDTAfNiiKcjm9BEgpWcmwoQeW/jgV4MBeXh6F9OKkBLbJS0OcyWSUaletacbYgcTH3V/BtQ9JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWzrSFGdRByZBt0qyOWlsF84Ene0iSMrCRVrgBgXMe8=;
 b=bVDt4l8pTzuk8Y5iT8F950btS+jaj/z1U4z3PQJUJ57jmaxfmGyRRVccmFCFm0vUXWdEKC0RiZWx6JislMjDZovD9hX1aK/zOdEq3lZ9mF0e8BDllyKDsg3H+fINsPoNKsP1jm+RjxXhwVOxseEO8Or17ITYRaYKKMhwpuu6UdQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:6f::22)
 by BN9PR12MB5244.namprd12.prod.outlook.com (2603:10b6:408:101::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Mon, 17 Jan
 2022 12:12:53 +0000
Received: from SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::35:281:b7f8:ed4c]) by SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::35:281:b7f8:ed4c%6]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 12:12:53 +0000
Message-ID: <f746b847-d1e4-082a-0796-b3cf0f7873b5@amd.com>
Date: Mon, 17 Jan 2022 06:12:50 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Cc: brijesh.singh@amd.com, Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <Ashish.Kalra@amd.com>
Subject: Re: [PATCH 0/2] Improved support for AMD SEV firmware loading
Content-Language: en-US
To: Dov Murik <dovmurik@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20220113165511.46098-1-berrange@redhat.com>
 <59d81ace-8a66-4ab4-2768-a68d302e62d8@linux.ibm.com>
From: Brijesh Singh <brijesh.singh@amd.com>
In-Reply-To: <59d81ace-8a66-4ab4-2768-a68d302e62d8@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR10CA0019.namprd10.prod.outlook.com
 (2603:10b6:806:a7::24) To SN6PR12MB2718.namprd12.prod.outlook.com
 (2603:10b6:805:6f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db73ea56-9c54-4fbc-2b64-08d9d9b2afeb
X-MS-TrafficTypeDiagnostic: BN9PR12MB5244:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB524437E0C1C998AB160BCC97E5579@BN9PR12MB5244.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: titNEnuRZyQn5EN/TSzkMOQoNstML5sqLr18ug1fAZtXk0l3FxP1Z5hj5fyZCodh22ctd2yZsBjLRnvyzNONZCd2luHzwBjQ0nuUHpwmm9aeVQHxxnXRJZif7hqnHg5lOdn5M3gHTLXS8qkN8ELLYfI2SzDgUxuOVX22R6lJ2mAyN+o2dYdAqunFT5mPYuvwc7/l8tAJovr4LQ1Yc/rA226Edcfbc2UPfuZq1Ao20wQ3L9VkVK9gK9Ic0/I54e61nwm3/n4VKDCdi9PKbJUHEGnMPASVSv8qCAPfbos9U7U/NIn+uJa7lAFBJocS7d7ywMxZnQXiNHsTLle6qXITUU9QneJ5pm9Ys1/6FecCjoFiyq1/cJwvljZ1FsgXTbsDygMfy8tRR1KPs+pNssPJOi/G+E8ReiwlbmL05/YTcRUaGWZCnJy5Gwnc9NdPrdmK7yqhNVZliPZ3uWHShq96BB++V8KDhf0tjnjvAUCk3e+len8pY3DATayRr/O4vaJpz+zkEczEUBgNGFjvwGiOm6eCKH7BqJup4hAUhcFY4s3Buhd1mMzV564b8nK0NVzYf0skwPZlxX/G/VKvdP1qeWjXis3il2jNvXVMcmWWiKc4toVpF4BMWJpQxeleZnmbMJTdfioyHnunFnpEh/rgEePa9+wgRKPHYd11Ui1H1ympKyxKzfkXTfB4rc/m+klA/lyYDGMS0mehGB9oxVF/Qv2DBQQuegw17vQVgswhaag=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2718.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(54906003)(8936002)(110136005)(2616005)(4326008)(316002)(2906002)(44832011)(6512007)(186003)(508600001)(7416002)(5660300002)(66476007)(66946007)(36756003)(86362001)(38100700002)(6506007)(53546011)(31696002)(8676002)(66556008)(6486002)(83380400001)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDVnWktWTWlLWjk3TFZ5UVpFdGZyRnkzWkkvZVdFQXpvbU94Nm1KbHdjYjJu?=
 =?utf-8?B?ZmlaK3NoemJSeTdFcGFMQ2NjMzlwd1ZWeFA2K05WWUlpdXVWdUgzdDB1NjNN?=
 =?utf-8?B?L3RQQTI0WUxnd1BtZlR2aUdWWjY4M1dicFRzV0lUZ2wzeUZLM2FXOENWT3Jm?=
 =?utf-8?B?NDNyaEJRVWZ0RUNReVl0N21OTlJ4T0NzempPTU1sY2tDSURLQlVVRUFjUExu?=
 =?utf-8?B?YlFCZWhjWGdZWSs1bkpveElXY1g3WkZjRTRlT1dQanRPRjFINXRaU1Zxb1FC?=
 =?utf-8?B?NDkzMmVHdmROejZpVXFqcCtYUlM0VGc4QUc3OEErUmFWcGphRVV6bXp1YktD?=
 =?utf-8?B?aEZlYUx6eDIzY0J4cEN5QkszWWNUMHNmNVZkTXZyV2IzcnE2SjkzcHJKKzlU?=
 =?utf-8?B?ZXlCV2NYTlZteFp5ZmVmQWtXYks3ZEJJL3o0bVRoTXVXZnVzVHNpMlRac1Qy?=
 =?utf-8?B?V1FnOTB6S3FrWVQ5U1ovVm54VmZISHZEbVdpdy83Y2hwcmFjMmMvTWZLVmRl?=
 =?utf-8?B?VXFHZ1BDV0lqODQ2VmRIb3RuNUlpTkxxczFjMzlTU0EvME55QWZ6TlFiVFZ0?=
 =?utf-8?B?bE41MlJIN2FjRnl0b24zVzk3ZGlpOEJ0UzAxakExTUNVaExYNGN3dlViRk1I?=
 =?utf-8?B?bEVnY0V4YmFYKzQyMkN0d2pXMmI2TE1ubXhBN1ZOb3J1K20rbXk2bHpLMHpK?=
 =?utf-8?B?S2UwZ3lONmRSaWIzQVpRS2NCSXJjR1pDTHRXdFovWm1US2swelhiTjFqOGRN?=
 =?utf-8?B?WStCYndJRHk1RUFjaG9YelBDd0RWZ1gxZCtkZlh4cUpVN09OeFlCNDBaZytn?=
 =?utf-8?B?eFhSNi96TFJHcGJ1YWlwY1FDTWRwM29jWTVqOTFuSlFTZ1dTaXVVcGs2RTV1?=
 =?utf-8?B?MWp3K2hXc1VpRWJHVkVhamFReDRnYklZZGZHUFpwTzY4ZzAzeDNFNlZ6MnFo?=
 =?utf-8?B?M2JOK1RSYi9FM0hlb1Avc0NxRVZIR3VjUWZ3c0w4SXZYVTA1SlhiR3JKVXhN?=
 =?utf-8?B?ajBTRlpXSGxGNVVXOTQ4WUp2WE1wVmJnQ3Y1TVNBVGQxa2NKYVRBVGZ6RHBV?=
 =?utf-8?B?dHdqWk5VTFJLU0pobEdVcDNqNCtsVVpobzBkVnB1VGdqa0dNUDlDbWZhTS84?=
 =?utf-8?B?bTJyOU9Ga0VPT2svZHU2OG9IbmhBeDQrQXROaXhpZ0ZZNCt6elQydndoVy9q?=
 =?utf-8?B?V3JDd0VRRlg3V0lGTVJoNTUvN3ZBdFdrbzFsd0lYVHExUS9zaVQvQmRZSmF2?=
 =?utf-8?B?azJiV3hQWFpkd2hlc3JOL0REZUovY2MxdkhKQUlmeEJBRTlKQzQ5djE1TXRH?=
 =?utf-8?B?djJRWG52MU5FdXhIYTZUZDVqblE1QTBqTTk0ZlBWNEgzeFY5ZVJla1ZNaDZw?=
 =?utf-8?B?TkZXNnAzYitlY1d5KzhYN1pSckkxTnVwZ0s3aTNVY1A2cFR1WmxLM25IN0JG?=
 =?utf-8?B?aG93d3ZVckc1bUx2cENFOXlDeGVQYkh3L0lxZURiSWhrZG40N0NBbmJsWUdM?=
 =?utf-8?B?elIzWGZtYllIcE8vYVZVcUFwOGh0MVgzK2FTYjV1YlpYeFFUWXJQRXlVSWxl?=
 =?utf-8?B?YUdQQ2ZENzFnWXhqbTVqYTk0UGZGblZZbjZSSWNmS3JQZ0xEQ014d2xPUEZV?=
 =?utf-8?B?QlllenF1UXYwb3M4SksvcFZIZFBmc2JYMm1ERldGdnBmOFlzYUpQSEIzMldH?=
 =?utf-8?B?bjVnaXRob0NSR0VFUjZ6QXhYbkJsaU56RkhWTmtvQzlIZS9kR0tka0laL0dF?=
 =?utf-8?B?WnJ1bVhOU1pZeW9tb0F2TXN6YWVqRmlydlI4R0QwZ3hZRzBHd2IyS0RQaDd4?=
 =?utf-8?B?N3phSW95RGpTdHdkMEl3KytLNFIrOWlMWDloY1VML1ZtMHpzSjdqSzVXN2x5?=
 =?utf-8?B?RXhWTFg0TmZTbHBUcTAveVI0VUFiQXFCdTZqR1pRNEdrRktMMks0d09oSVZx?=
 =?utf-8?B?S1Y4MlFwVkdPeWhORUNsZFRQZWdiTXBjaG5Ld3ppVk1uS0hCV1orVXBjMURS?=
 =?utf-8?B?ODlOQVAxMmM5blFQK2RrVlJTYkRtY29PN1Yxb2JqcS9NTXpKTDRYdFBvZTVh?=
 =?utf-8?B?QkxJRzIzQXdlMW5nNWdONnJrM2ZwZ2VFQjY4MitvMVU2RkRhNS9SSHJKWGVR?=
 =?utf-8?B?Y3J1Z1oyb3VUVnN1aEJsUVhaNnBER0toM2ZxWTZjOFlBRTBJTDczK01oR2R0?=
 =?utf-8?Q?XVg33V2i3IYMgtCrR7iwe64=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db73ea56-9c54-4fbc-2b64-08d9d9b2afeb
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2718.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 12:12:53.0415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hGHJ1D1Zf2pmRckeQyTnCtlNlq7w1lYc7Y7XW3nk0bvt3roW5rzwqBgqYU155ra7sFI9LVYF2TcNSIWsItY5ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5244
Received-SPF: softfail client-ip=40.107.92.47;
 envelope-from=brijesh.singh@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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


On 1/17/22 1:34 AM, Dov Murik wrote:
> [+cc Tom, Brijesh, Ashish - see SEV-related changes in this series]
>
>
> On 13/01/2022 18:55, Daniel P. Berrangé wrote:
>> The AMD SEV build of EDK2 only emits a single file, intended to be
>>
>> mapped readonly. There is explicitly no separate writable VARS
>>
>> store for persisting non-volatile firmware variables.
>>
>>
>>
>> This can be used with QEMU's traditional pflash configuration
>>
>> mechanism by only populating pflash0, leaving pflash1 unconfigured.
>>
>> Conceptually, however, it is odd to be using pflash at all when we
>>
>> have no intention of supporting any writable variables. The -bios
>>
>> option should be sufficient for any firmware that is exclusively
>>
>> readonly code.
>>
>>
>>
>>
>>
>> A second issue is that the firmware descriptor schema does not allow
>>
>> for describing a firmware that uses pflash, without any associated
>>
>> non-volatile storage.
>>
>>
>>
>> In docs/interop/firmware.json
>>
>>
>>
>>  'struct' : 'FirmwareMappingFlash',
>>
>>   'data'   : { 'executable'     : 'FirmwareFlashFile',
>>
>>                'nvram-template' : 'FirmwareFlashFile' } }
>>
>>
>>
>> Notice that nvram-template is mandatory, and when consuming these
>>
>> files libvirt will thus complain if the nvram-template field is
>>
>> missing.
>>
>>
>>
>> We could in theory make nvram-template optional in the schema and
>>
>> then update libvirt to take account of it, but this feels dubious
>>
>> when we have a perfectly good way of describing a firmware without
>>
>> NVRAM, using 'FirmwareMappingMemory' which is intended to be used
>>
>> with QEMU's -bios option.
>>
>>
>>
>>
>>
>> A third issue is in libvirt, where again the code handling the
>>
>> configuration of pflash supports two scenarios
>>
>>
>>
>>  - A single pflash image, which is writable
>>
>>  - A pair of pflash images, one writable one readonly
>>
>>
>>
>> There is no support for a single read-only pflash image in libvirt
>>
>> today.
>>
>>
>>
>>
>>
>> This all points towards the fact that we should be using -bios
>>
>> to load the AMD SEV firmware build of EDK.
>>
>>
>>
>> The only thing preventing us doing that is that QEMU does not
>>
>> initialize the SEV firmware when using -bios. That is fairly
>>
>> easily solved, as done in this patch series.
>>
>>
>>
>> For testing I've launched QEMU in in these scenarios
>>
>>
>>
>>   - SEV guest using -bios and boot from HD
>>
>>   - SEV guest using pflash and boot from HD
>>
>>   - SEV-ES guest using -bios and direct kernel boot
>>
>>   - SEV-ES guest using pflash and direct kernel boot
>>
>>
>>
>> In all these cases I was able to validate the reported SEV
>>
>> guest measurement.
>>
>>
>
> I'm having trouble testing this series (applied on top of master commit 69353c332c):
> it hangs with -bios but works OK with pflash:
>
> Here's with -bios:
>
> $ sudo /home/dmurik/git/qemu/build/qemu-system-x86_64 -enable-kvm \
>        -cpu host -machine q35 -smp 4 -m 2G \
>        -machine confidential-guest-support=sev0 \
>        -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1,policy=0x0 \
>        -bios /home/dmurik/git/edk2/Build/AmdSev/DEBUG_GCC5/FV/OVMF.fd \
>        -nographic \
>        -global isa-debugcon.iobase=0x402 -debugcon file:ovmf-1.log \
>        -monitor pty -trace 'enable=kvm_sev_*'
>
> char device redirected to /dev/pts/14 (label compat_monitor0)
> kvm_sev_init
> kvm_sev_launch_start policy 0x0 session (nil) pdh (nil)
> kvm_sev_change_state uninit -> launch-update
> kvm_sev_launch_update_data addr 0x7f42e9bff010 len 0x400000
> kvm_sev_change_state launch-update -> launch-secret
> kvm_sev_launch_measurement data PF6n7+Vujx5sW8PC6iMRtHXfpXdJ4osbcfYvoknu7gg4ypMqs727NTzG86Ft8Llu
> kvm_sev_launch_finish
> kvm_sev_change_state launch-secret -> running
>
>
> Here it hangs. The ovmf-1.log file is empty.
>
> Notice that kvm_sev_launch_update_data is called, so the new
> -bios behaviour is triggered correctly.  But the guest doesn't
> start running.

I have not looked at the patch detail yet but address looks wrong, it
looks like the hva 0x7f42e9bff010 end of the ROM. We need to encrypt the
entire ROM to boot, so I was hoping that hva will be 2MB aligned or a
page-aligned. You can enable the KVM trace to see if we are able to
enter and execute anything from guest.


> Here is the guest's state:
>
> (qemu) info registers
> EAX=0000606b EBX=00001268 ECX=0000440c EDX=008328d2
> ESI=000091e2 EDI=0000e9e3 EBP=0000a451 ESP=00009af0
> EIP=00003612 EFL=00000082 [--S----] CPL=0 II=0 A20=1 SMM=0 HLT=0
> ES =0000 00000000 0000ffff 00009300
> CS =a76e 000a76e0 0000ffff 00009b00
> SS =0000 00000000 0000ffff 00009300
> DS =0000 00000000 0000ffff 00009300
> FS =0000 00000000 0000ffff 00009300
> GS =0000 00000000 0000ffff 00009300
> LDT=0000 00000000 0000ffff 00008200
> TR =0000 00000000 0000ffff 00008b00
> GDT=     00000000 0000ffff
> IDT=     00000000 0000ffff
> CR0=60000010 CR2=00000000 CR3=00000000 CR4=00000000
> DR0=0000000000000000 DR1=0000000000000000 DR2=0000000000000000 DR3=0000000000000000
> DR6=00000000ffff0ff0 DR7=0000000000000400
> EFER=0000000000000000
> FCW=037f FSW=0000 [ST=0] FTW=00 MXCSR=00001f80
> ...
>
> (qemu) info sev
> handle: 1
> state: running
> build: 10
> api version: 0.23
> debug: on
> key-sharing: on
>
>
>
> If I try the same with pflash (instead of -bios), I get:
>
> # sudo /home/dmurik/git/qemu/build/qemu-system-x86_64 -enable-kvm \
>        -cpu host -machine q35 -smp 4 -m 2G \
>        -machine confidential-guest-support=sev0 \
>        -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1,policy=0x0 \
>        -drive if=pflash,format=raw,unit=0,file=/home/dmurik/git/edk2/Build/AmdSev/DEBUG_GCC5/FV/OVMF.fd,readonly=on \
>        -nographic \
>        -global isa-debugcon.iobase=0x402 -debugcon file:ovmf-1.log \
>        -monitor pty -trace 'enable=kvm_sev_*'
>
> char device redirected to /dev/pts/14 (label compat_monitor0)
> kvm_sev_init
> kvm_sev_launch_start policy 0x0 session (nil) pdh (nil)
> kvm_sev_change_state uninit -> launch-update
> kvm_sev_launch_update_data addr 0x7f0343000000 len 0x400000
> kvm_sev_change_state launch-update -> launch-secret
> kvm_sev_launch_measurement data esqzlr4xX2eEY92xsKEKL7FyKRDW7VYiyIb+aXS4S/ctON2s1xxwFjAKU7ImfULJ
> kvm_sev_launch_finish
> kvm_sev_change_state launch-secret -> running
> BdsDxe: failed to load Boot0003 "Grub Bootloader" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(B5AE312C-BC8A-43B1-9C62-EBB826DD5D07): Not
>  Found
>
>
> The "failed to load Grub" is what I expected. So this works OK. 
> The ovmf-1.log file shows normal sequence of AmdSev boot. 
>
>
> I tried the two options with the standard OvmfX64 package as well - same behaviour.
>
>
> Do I need to build the OVMF file differently to use with -bios ?
>
>
> -Dov
>
>
>> Daniel P. Berrangé (2):
>>
>>   hw/i386: refactor logic for setting up SEV firmware
>>
>>   hw/i386: support loading OVMF using -bios too
>>
>>
>>
>>  hw/i386/pc_sysfw.c            | 24 +++---------------------
>>
>>  hw/i386/pc_sysfw_ovmf-stubs.c | 10 ++++++++++
>>
>>  hw/i386/pc_sysfw_ovmf.c       | 27 +++++++++++++++++++++++++++
>>
>>  hw/i386/x86.c                 |  5 +++++
>>
>>  include/hw/i386/pc.h          |  1 +
>>
>>  5 files changed, 46 insertions(+), 21 deletions(-)
>>
>>
>>

