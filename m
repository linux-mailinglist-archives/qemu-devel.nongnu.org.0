Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A93436FAB78
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 13:13:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvymp-0000Dd-8T; Mon, 08 May 2023 07:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pvymi-0000DT-NA
 for qemu-devel@nongnu.org; Mon, 08 May 2023 07:12:04 -0400
Received: from mail-sn1nam02on20619.outbound.protection.outlook.com
 ([2a01:111:f400:7ea9::619]
 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pvymf-0000b3-QE
 for qemu-devel@nongnu.org; Mon, 08 May 2023 07:12:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTkR/zh4CuRvp6pEe0VuE/RhzU4fO1VBfBd6cW1J1OUlE5UhYp8gew43C7u1UcdxZ+cyJlFjHNqWftAYCrIMLwe/iI9vIBaaMw9aS7e6Tt6UJ+hyMMmIeyIKzbXSzYKKLlGAlyyZbUTYYTMYLxel5UVIiEsyClarYxStTrzcWMO+n8EsCF2OJw9pD/DGOoSCuHoNpKA7e4geTt8xFj2kR7sznCMv0D5rLgnZFldg5nuXVqO46Z81BXEC6T/+u9/EIDfo+xWdKlzLmyOQHY4Kjovn0HA6hT1st5+ETel1Wh9Skl0cetFfCBbDuxAjZbbeA1IhukfG5DMkNGjM6KnPYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+pU2APRvLK1F2UNmti6b0SaJdcIjSNpQqvDaqAmpk4=;
 b=Sv59lXogBP/mgVdLBcoN3kQZw4betoIGX94js/1lCbkry0qLHXxxzsyBqkViuIAoYoTyd43hcBt6zSHkAWC7FY4r2m/jaSEXTsgADQzPBVH4O7q4A4vqxHH7oGaCV/iHhmrBPMEPwmq6Z8TzE8dH8759fPpP+XXUPlswLpGctAeQ9Blv3C/INFgdRlYJlwhQo9YSpjdKJHS+/5Xe548HjrO2fVA+VQoA4L59sksvYqSi2x3wAi2kF9SCVmrebLhJquJjDyAoEDmfO20XSEk3gO5GnHyNUSS3C4nhpLJY6pNMM0xH9jw3fPJgkXez/Lb4aR/09EiCRaCSAWtBYnEiIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+pU2APRvLK1F2UNmti6b0SaJdcIjSNpQqvDaqAmpk4=;
 b=JXSk2XUxiSC+bNNxJ1A/ex5CJwXFp1KLqf0/Ck/6+8P4SqVf1+omAFhBA0XODWVvf7dO2sAp8sEcVpks1S8KjhHniaqylJWrr/u1hV2kVqXvWVyDtln8jmAm7tyTTmO/NyLr3EOMcHhbDAhm0HUzxeVAUHGsg1xwdB7APegjslrFvfwbnv5Ea5LLEV1vPWpqKoPV0REXNHlTKXPGFib92P8Tkg7OPyUkeaDybFHFdlvHfj3c31l/v1Z1lckLY93Ym7VeY0mZseNAHePpfX2adfoQA/Zn66kR9gT6QHecjeLYPDHOFBrLJVLDS6iX1c5G/kFktKH8QlGzX7Y4G/qYUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by BL3PR12MB6620.namprd12.prod.outlook.com (2603:10b6:208:38f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 11:11:56 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::a29a:c3cf:5edf:9dad]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::a29a:c3cf:5edf:9dad%7]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 11:11:56 +0000
Message-ID: <688acb4e-a4e6-428d-9124-7596e3666133@nvidia.com>
Date: Mon, 8 May 2023 14:11:45 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 0/8] migration: Add precopy initial data capability and
 VFIO precopy support
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
References: <20230501140141.11743-1-avihaih@nvidia.com> <ZFGTerErJWnWHD6/@x1n>
 <72e14c81-a953-c288-c570-4987492b3569@nvidia.com>
 <ZFKCg2xnws2Smchb@x1n>
 <cd16086f-7c82-47ab-d893-b33d64f121d9@nvidia.com> <ZFPUOeuICJ1gehNk@x1n>
 <95db8c9d-c649-09b7-843e-215756820bb1@nvidia.com> <ZFhHHzrIWZbBiIgi@x1n>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <ZFhHHzrIWZbBiIgi@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0203.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::23) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|BL3PR12MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: f1d217ff-c412-4e7a-f31c-08db4fb508d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Y6AzyRVGbmm0xhUwOQVZ+fJjXeTVAP+TxqyBHzJkAZmIShP7AOnDis/YJYows8ziGxvf/Ew1SIv4aSlC+tR5V0rdjp+jT6YMK36cyf4UCrMYuIOedulCM3fH1dgC0HieC4dh5P6yATG1qbS7m93FlkCBfjaHnXte1w1feeKqSz0cZMiC26RNwvUNuSRqQam2Sv6f/q3MSFKpvzj5e7X4n2w8TfbxCBe+7bOOKZ1LmcS9MSiMj2Hi6tMCU/Dw7kN9RmIkpBWQNI+Ogj++pcaaWzV3R08yK7ost/0j58R8mVg49dwAJLB7P1T6okJwlGTv2SsLB8cU13XEgqE6cWxk35AbKzzmfSoxZ9Sx2OtpnJQabk4n7Qc1Hsy7/Xq6zFzp3k6K2tWtrMOAZ0BrjnLk+UmkdZGJ8EE6Lv5I0BVMEvWip02nXJhMaXjdmaErfVezerQETgZgmxGZMGb1e0Tlad8DDwjojik/zyTcVAexTH13GHE5JmLK5/obXCoFe1qNAFfbQehhYktoXE6CqlbivzrijYccjVSuF3VLdW3P0cp3jL7R0XhuVUIwA3VNPIoU0l5SXbQsjaxUVIKrdPIbalf22ogUHM0kLl1TYpDj06CxJCtrpEK+zuWuMKsIwOyFrjZDfeOz59Mp4RYqBErHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(366004)(376002)(451199021)(36756003)(53546011)(86362001)(31696002)(66476007)(54906003)(66556008)(6916009)(4326008)(66946007)(6486002)(316002)(478600001)(5660300002)(8676002)(2906002)(41300700001)(7416002)(30864003)(8936002)(186003)(38100700002)(2616005)(6512007)(26005)(6506007)(83380400001)(6666004)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWlFYTBma0UvcTdpZkJRWksxUDhHYXdHdjVsdWJjTS9YZEROc1BFc2hFNnRm?=
 =?utf-8?B?VFl4SXhSeWhWU2JRT1FCUHZCTk9GNTFjdDZEMWdQMGF6S0JSNkMwdHM1K2d3?=
 =?utf-8?B?WXExUEtZUm1aVjNzNmZpVm5GZThnbmZaR0tHWU8yV3dWakhadjRaYjg5cGZY?=
 =?utf-8?B?QVYwQ1R2OUE2L1FMSk9HeExGd2Y1NlozakRPVmVJZ1BzdVBLNENvMXlmWnFs?=
 =?utf-8?B?MTVtRHAzd0RMeXVLMnVJQ2M1dHhFUkh6YldJMTZqdVpmMkZKc2hlZlo4bkZW?=
 =?utf-8?B?ajZiejlhc0JRZE1ZNUlyZDV2UDJtellsaWdpOGNEU2JZQlpydDB5NGNsS05G?=
 =?utf-8?B?ZDZlczYrRFZodERkaURFeVFZQXF3QWpFVXNJU0kweWFNQVFiUjluNk9uc3F0?=
 =?utf-8?B?TjhDRUI4V0p4bGhhTVBJRTNyWURRR1pnWVN6SzBCSXVnOTF0SGVvblFjSjBG?=
 =?utf-8?B?dTgrYnhKdUlRK2dVNXArUjkxMFJKb2M0YTBmcHc1WTlRanVwVVlVVzJKUmNj?=
 =?utf-8?B?Umd0a2tpSUxseUJXUitLSzZIVmtrWkFmU1hvNjhSRk15R2lZNGRSNVRDNDky?=
 =?utf-8?B?YTZRaVVOdWI3Rkl0ZDNsYUhiMUlZRWtFdGpyY3Y2cXpOU3c3U2J5TGR6Y3VF?=
 =?utf-8?B?N3BMbTFvSXB6TFZMSTdMc3dBZjcwZm5ad3Z6aThhb3JSL0h3QjlPK0hyUGRH?=
 =?utf-8?B?V2hVUDg1VHV5dDFEZFY2UFBUd0FzTTJ0UlJ1VzdMaXYrZ3I5aUxLaE9TQVlv?=
 =?utf-8?B?aWJ0WVc0ODI2Z3MvVlh3R1ltZHA4dE0rVVp0OWV2ZHVReER0bTg4c08rcHkv?=
 =?utf-8?B?L1d6aU9tczJvRGZmMmF3VXNZYTkwUGQ2WkRycU0wZ1d3WGx0S3JncXMrK2hs?=
 =?utf-8?B?TzNySzlIcWlETW9YbnF5aHpKc2FUbVpqdDZhTlUwTzA3b1ZNOWRPc3FBb1lr?=
 =?utf-8?B?czROSTBWQnMzK29RNmgrbEQ0cU81bGp5M1dHTkhUS3pQLzQ1cDhIcjVud2ZI?=
 =?utf-8?B?OWQ5SXE1UUdOMXFaU1BySWs0VmViYWlCdHA3bWg2TEhQa1JQeUFhdEpQU0dM?=
 =?utf-8?B?MXF1aG5GNm9PMG9jRDlFdjNMQWo0L2VlU2s1UjhYNzZpb045U3dXTTNac053?=
 =?utf-8?B?QTJudkpMeFJ0SE1PUlVnbHVxTlErNzBad1JOT2NsRnRnRWtoaHhNbzJWY2Mr?=
 =?utf-8?B?dWwzbllQY0Rxb05vYk0rckY5UXpiSExOd2U4OTQwZjhGeHlpVVBOR29NSTVr?=
 =?utf-8?B?UnBKMU4vbGoyMFF3cjhBNFQvVWIxaW9NSmU4RklJTEF4emROR3NzcHBGMHdK?=
 =?utf-8?B?MS9Xb0FOMG51VWc2UnJRR0FTVzhuQXFkcWlrQW5ta203c0ZIaUZ3VjE5ZjQ4?=
 =?utf-8?B?U3lwRXF5U3dhbXJtNmVQWHdHUGVZblZjclNwRWYyN3hOenZlSVNvbUs3QjhP?=
 =?utf-8?B?T3YvTWI0VmdSV0ltUCt5bXVJbWkySVlGY2c2RWZscWRPV3FndElCcGVVWXZS?=
 =?utf-8?B?NzVvdnhOUC9rUUtVWWUramhhZklJY3RJTnZvNTc5WDdWM3NGTFAwdUQ3ZHdy?=
 =?utf-8?B?b1J3OGZVZ1NRMmNOVUtwSEgwUCt3S2NFMFdCdS9WQTQxUzl1TFk1WHE5UTFp?=
 =?utf-8?B?L3AzRnNtcEVtNVBjaSt6V0RScEc1ZGNiMjlkWG9IOWhaODlLMStwU05sRXVv?=
 =?utf-8?B?dWh5aGNjMWRQeWd3WWxubVNNdXpCd2JZaURsbmdBRUQvM3U4d3dSWktDeTNI?=
 =?utf-8?B?WFVoMmlYTDlNck1qZXNuM3U1SFBOSkMvVTRmSUdrOW1BNTRaa3FzOG5DRldX?=
 =?utf-8?B?cGp0eTQyUnNmZm9vVnUydFRhdVNYUWI5aHEvdWNIVUZIWFN2dk9qa0F3aDZY?=
 =?utf-8?B?NklEN0RNWWVJaC9LNjEvM2ExQzdxMm5YVUVCYmUzemdJM1ozNXM5WUdtWmVV?=
 =?utf-8?B?OGh4RERYNEU4SU0wTWxwQVkxa0hYZHlCblJGRVgwQzFva1lBOWdzQUxuZ2U2?=
 =?utf-8?B?RmVTMjBUamJ6azRjRjZpdWJBVWRwaGYrRzBDMTJ0ZEhCWnZWQzBCWGdieW1z?=
 =?utf-8?B?ZlMxaXViUS93LytlTXBUd2UzeHgzTnJ3d3RmRldkRUlkamVrOWRvMUp1aisw?=
 =?utf-8?Q?qgXRYxJXQfxecB/3AYl6CTI4I?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d217ff-c412-4e7a-f31c-08db4fb508d3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 11:11:56.1456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hjaIhRVNoNy05EzdvJhBu2Jn4TeWOzTAx9u6LBBchf3ekd+3xzNC1h27VOL7d2GW+D3xpZHF5D+vE6Yv9Ovd3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6620
Received-SPF: softfail client-ip=2a01:111:f400:7ea9::619;
 envelope-from=avihaih@nvidia.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.964, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 08/05/2023 3:49, Peter Xu wrote:
> External email: Use caution opening links or attachments
>
>
> On Sun, May 07, 2023 at 03:54:00PM +0300, Avihai Horon wrote:
>> On 04/05/2023 18:50, Peter Xu wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On Thu, May 04, 2023 at 01:18:04PM +0300, Avihai Horon wrote:
>>>> On 03/05/2023 18:49, Peter Xu wrote:
>>>>> External email: Use caution opening links or attachments
>>>>>
>>>>>
>>>>> On Wed, May 03, 2023 at 06:22:59PM +0300, Avihai Horon wrote:
>>>>>> On 03/05/2023 1:49, Peter Xu wrote:
>>>>>>> External email: Use caution opening links or attachments
>>>>>>>
>>>>>>>
>>>>>>> On Mon, May 01, 2023 at 05:01:33PM +0300, Avihai Horon wrote:
>>>>>>>> Hello everyone,
>>>>>>> Hi, Avihai,
>>>>>>>
>>>>>>>> === Flow of operation ===
>>>>>>>>
>>>>>>>> To use precopy initial data, the capability must be enabled in the
>>>>>>>> source.
>>>>>>>>
>>>>>>>> As this capability must be supported also in the destination, a
>>>>>>>> handshake is performed during migration setup. The purpose of the
>>>>>>>> handshake is to notify the destination that precopy initial data is used
>>>>>>>> and to check if it's supported.
>>>>>>>>
>>>>>>>> The handshake is done in two levels. First, a general handshake is done
>>>>>>>> with the destination migration code to notify that precopy initial data
>>>>>>>> is used. Then, for each migration user in the source that supports
>>>>>>>> precopy initial data, a handshake is done with its counterpart in the
>>>>>>>> destination:
>>>>>>>> If both support it, precopy initial data will be used for them.
>>>>>>>> If source doesn't support it, precopy initial data will not be used for
>>>>>>>> them.
>>>>>>>> If source supports it and destination doesn't, migration will be failed.
>>>>>>>>
>>>>>>>> Assuming the handshake succeeded, migration starts to send precopy data
>>>>>>>> and as part of it also the initial precopy data. Initial precopy data is
>>>>>>>> just like any other precopy data and as such, migration code is not
>>>>>>>> aware of it. Therefore, it's the responsibility of the migration users
>>>>>>>> (such as VFIO devices) to notify their counterparts in the destination
>>>>>>>> that their initial precopy data has been sent (for example, VFIO
>>>>>>>> migration does it when its initial bytes reach zero).
>>>>>>>>
>>>>>>>> In the destination, migration code will query each migration user that
>>>>>>>> supports precopy initial data and check if its initial data has been
>>>>>>>> loaded. If initial data has been loaded by all of them, an ACK will be
>>>>>>>> sent to the source which will now be able to complete migration when
>>>>>>>> appropriate.
>>>>>>> I can understand why this is useful, what I'm not 100% sure is whether the
>>>>>>> complexity is needed.  The idea seems to be that src never switchover
>>>>>>> unless it receives a READY notification from dst.
>>>>>>>
>>>>>>> I'm imaging below simplified and more general workflow, not sure whether it
>>>>>>> could work for you:
>>>>>>>
>>>>>>>       - Introduce a new cap "switchover-ready", it means whether there'll be a
>>>>>>>         ready event sent from dst -> src for "being ready for switchover"
>>>>>>>
>>>>>>>       - When cap set, a new msg MIG_RP_MSG_SWITCHOVER_READY is defined and
>>>>>>>         handled on src showing that dest is ready for switchover. It'll be sent
>>>>>>>         only if dest is ready for the switchover
>>>>>>>
>>>>>>>       - Introduce a field SaveVMHandlers.explicit_switchover_needed.  For each
>>>>>>>         special device like vfio that would like to participate in the decision
>>>>>>>         making, device can set its explicit_switchover_needed=1.  This field is
>>>>>>>         ignored if the new cap is not set.
>>>>>>>
>>>>>>>       - Dst qemu: when new cap set, remember how many special devices are there
>>>>>>>         requesting explicit switchover (count of SaveVMHandlers that has the
>>>>>>>         bit set during load setup) as switch_over_pending=N.
>>>>>>>
>>>>>>>       - Dst qemu: Once a device thinks its fine to switchover (probably in the
>>>>>>>         load_state() callback), it calls migration_notify_switchover_ready().
>>>>>>>         That decreases switch_over_pending and when it hits zero, one msg
>>>>>>>         MIG_RP_MSG_SWITCHOVER_READY will be sent to src.
>>>>>>>
>>>>>>> Only until READY msg received on src could src switchover the precopy to
>>>>>>> dst.
>>>>>>>
>>>>>>> Then it only needs 1 more field in SaveVMHandlers rather than 3, and only 1
>>>>>>> more msg (dst->src).
>>>>>>>
>>>>>>> This is based on the fact that right now we always set caps on both qemus
>>>>>>> so I suppose it already means either both have or don't have the feature
>>>>>>> (even if one has, not setting the cap means disabled on both).
>>>>>>>
>>>>>>> Would it work for this case and cleaner?
>>>>>> Hi Peter, thanks for the response!
>>>>>> Your approach is indeed much simpler, however I have a few concerns
>>>>>> regarding compatibility.
>>>>>>
>>>>>> You are saying that caps are always set both in src and dest.
>>>>>> But what happens if we set the cap only on one side?
>>>>>> Should we care about these scenarios?
>>>>> I think it's not needed for now, but I am aware that this is a problem.
>>>>> It's just that it is a more generic problem to me rather than very special
>>>>> in the current feature being proposed.  At least there're a few times
>>>>> Daniel showed concern on keeping this way and hoped we can have a better
>>>>> handshake in general with migration framework.
>>>>>
>>>>> I'd be perfectly fine if you want to approach this with a handshake
>>>>> methodology, but I hope if so we should provide a more generic handshake.
>>>>> So potentially that can make this new feature rely on the handshake work,
>>>>> and slower to get into shape.  Your call on how to address this, at least
>>>>> fine by me either way.
>>>> I'd really like this feature to get in, and I'm afraid making it dependent
>>>> on first implementing a general migration handshake may take a long time,
>>>> like you said.
>>>> What about keeping current approach but changing it such that the capability
>>>> will have to be set in both src and dest, to make it similar to other
>>>> capability usages?
>>>> I.e., we will remove the "general" handshake:
>>>>
>>>>       /* Enable precopy initial data generally in the migration */
>>>>       memset(&buf, 0, sizeof(buf));
>>>>       buf.general_enable = 1;
>>>>       qemu_savevm_command_send(f, MIG_CMD_INITIAL_DATA_ENABLE, sizeof(buf),
>>>>                                (uint8_t *)&buf);
>>>>
>>>> but keep the per-device handshake, which is not a handshake for migration
>>>> capabilities, but a part of the protocol when the capability is set, like in
>>>> multifd, postcopy, etc.
>>>> This way we can advance with this feature while making the general migration
>>>> handshake an independent effort.
>>>> Will that work for you?
>>> Yes it's fine by me.
>>>
>>>> BTW, with your suggestion to add a notification mechanism to notify when
>>>> initial data is loaded in dest, I think we can drop these two SaveVMHandlers
>>>> handlers:
>>>>       /*
>>>>        * Checks if precopy initial data is active. If it's inactive,
>>>>        * initial_data_loaded check is skipped.
>>>>        */
>>>>       bool (*is_initial_data_active)(void *opaque);
>>>>       /* Checks if precopy initial data has been loaded in dest */
>>>>       bool (*initial_data_loaded)(void *opaque);
>>>>
>>>>> In my imagination a generic handshake should happen at the very start of
>>>>> migration and negociate feature bits between src/dst qemu, so they can
>>>>> reach a consensus on what to do next.
>>>>>
>>>>>> For example, if we set the cap only in src, then src will wait indefinitely
>>>>>> for dest to notify that switchover is ready.
>>>>>> Would you expect migration to fail instead of just keep running
>>>>>> indefinitely?
>>>>>> In current approach we only need to enable the cap in the source, so such
>>>>>> scenario can't happen.

[1]

>>>>>> Let's look at some other scenario.
>>>>>> Src QEMU supports explicit-switchover for device X but *not* for device Y
>>>>>> (i.e., src QEMU is some older version of QEMU that supports
>>>>>> explicit-switchover for device X but not for Y).
>>>>>> Dest QEMU supports explicit-switchover for device X and device Y.
>>>>>> The capability is set in both src and dest.
>>>>>> In the destination we will have switchover_pending=2 because both X and Y
>>>>>> support explicit-switchover.
>>>>>> We do migration, but switchover_pending will never reach 0 because only X
>>>>>> supports it in the source, so the migration will run indefinitely.
>>>>>> The per-device handshake solves this by making device Y not use
>>>>>> explicit-switchover in this case.
>>>>> Hmm, right.  When I was replying obviously I thought that decision can be
>>>>> made sololy by the dest qemu, then I assumed it's fine.  Because IIUC in
>>>>> that case how many devices that supports switchover_pending on src qemu
>>>>> doesn't really matter but only dest.
>>>>>
>>>>> But I re-read the last patch and I do see that there's a new bit that will
>>>>> change the device protocol of migration:
>>>>>
>>>>>      if (migration->initial_data_active && !migration->precopy_init_size &&
>>>>>          !migration->initial_data_sent) {
>>>>>          qemu_put_be64(f, VFIO_MIG_FLAG_DEV_INIT_DATA_SENT);
>>>>>          migration->initial_data_sent = true;
>>>>>      } else {
>>>>>          qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>>>>>      }
>>>>>
>>>>> With this, I think what you said makes sense because then the src qemu
>>>>> matters on deciding whether to send VFIO_MIG_FLAG_DEV_INIT_DATA_SENT, it
>>>>> also needs to make sure dst qemu will recognize it.
>>>>>
>>>>> Do you think this new VFIO_MIG_FLAG_DEV_INIT_DATA_SENT is a must to have?
>>>>> Can this decision be made on dest qemu only?
>>>>>
>>>>> To ask in another way, I saw that precopy_init_size is the fundation to
>>>>> decide whether to send this flag.  Then it's a matter of whether dest qemu
>>>>> is also aware of precopy_init_size, then it can already tell when it's
>>>>> ready to handle the switchover.
>>>> The destination is not aware of precopy_init_size, only the source knows it.
>>>> So the source must send VFIO_MIG_FLAG_DEV_INIT_DATA_SENT to notify dest that
>>>> the initial data was sent.
>>> Then, can the src qemu notify instead?
>>>
>>> We can have similar notification mechanism on src qemu and if that can work
>>> we can further same the other MIG_RP_MSG.  The counter counts how many
> I meant s/same/save/ here..
>
>>> special src devices are there and we don't switchover only if all agree.
>> Do you mean the following:
>> We will have the pending counter and notification mechanism in source
>> instead of destination.
>> The MIG_RP_MSG_INITIAL_DATA_LOADED_ACK message will be sent by each device
>> in the destination that loaded its initial data.
>> Each such RP_MSG will decrease the pending counter in source.
>> When the pending counter in source reaches zero, source can complete
>> migration.
>>
>> Or did I misunderstand you?
> I meant the notification can come sololy from the src qemu, so src qemu can
> skip the switchover if any of the src relevant device hasn't yet
> acknowledged on the switchover.
>
> Then I think we can avoid introducing a MIG_RP msg?  I'm not sure whether
> I missed something, though.  I stated my understanding on the ordering below.

Oh, I see what you mean now.
However, I don't think it will work -- knowing that source has sent the 
initial data alone is not enough.
We must get an ACK from destination that it processed the initial data, 
as processing it can take time.

For example:
- We have one device that supports precopy initial data.
- Loading the initial data takes 2 seconds.
The device in the source just finished to send the initial data, so it 
notifies that it can do switchover.
The source sees that the device has acked the switchover, plus the 
general pending precopy data is below the threshold,
so it decides to stop the VM and complete migration.
However, the destination is still processing the initial precopy data, 
which takes 2 seconds, during which the destination
is blocked and can't process new migration data and complete the migration.
The source VM is already stopped, so these 2 seconds are spent during 
downtime.

What I suggested above, of having the notification mechanism in source 
and sending MIG_RP message for each
device in the destination that loaded its initial data, solves the 
problem in the aforementioned scenario ([1] above).
That's because switchover_pending will be 1 in source and will reach 
zero when device X in destination acks that
its initial data is loaded, so migration could be completed.
With that, we only need to add a single new MIG_RP message and the 
initial_data_advise() SaveVMHandlers handler.

However, I'm not sure this will actually work.
Supporting initial data may require special handling/preparation. Device 
Y in the destination may expect to get
initial data, but device Y in source will not send it since it doesn't 
support it. Depending on device implementation, this may fail migration.

The per-device advise can solve this by syncing between the devices in 
source and destination.
For example, device Y in the destination will not get the advise MIG_CMD 
and thus will know not to expect initial data.
Plus, in case device in source supports initial data but device in 
destination doesn't, migration will fail during setup
and not only when destination device gets unexpected initial data. This 
gives a clearer and constant behavior.

This will add some complexity of sending a new advise MIG_CMD per device 
in source and handling it in the destination,
but I still tend to include the per-device advise for the reasons above.
What's your opinion about it?

Thanks.

>>> I know that even if !precopy_init_size on src, it doesn't mean that dest
>>> has already digested all the data in the send buffer.  However since we'll
>>> anyway make sure queued data landed before switch over happens (e.g., when
>>> we only have 1 migration channel data are sent in sequential manner), it
>>> means when switchover the dst qemu should have these loaded?
>>>
>>> Thanks,
>>>
>>> --
>>> Peter Xu
>>>
> --
> Peter Xu
>

