Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C04D36F68FB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 12:19:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puW2m-0007Bw-AC; Thu, 04 May 2023 06:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1puW2f-0007BN-U2
 for qemu-devel@nongnu.org; Thu, 04 May 2023 06:18:29 -0400
Received: from mail-dm6nam10on2060d.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::60d]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1puW2U-0003TR-5w
 for qemu-devel@nongnu.org; Thu, 04 May 2023 06:18:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3Dv5biPywt75GXA58oeQl0R7IgigRfp8y4UVHPBABl1/mf1AihcLZHPzFxVeCtKD1yJTJ3aALIZd4dpJ2j4lEVDNZCcmomhwgGbMM2H/Kfcf7l6Ivl8Ef8tXhUCnT/2ZsJ0jOX+usIK3kZOSTuSBzATs1lOGWA6kbjKUND9xZSQ7XblPq3rGv13ouqTr9xRShfw+XEJeWOi+wFeLx6X2Qz7HA/TdX134nj72NDoGCCLOj1DnMnUR81khuMzFM9HGHEPT29UorW4n1dbHrPstgcOqk+e0ZHRqxFkLDbswKAUQ5Y2x6cP1uMh9IwtXGW1+efkkMEhE2NbYxY/CJqTKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzexkpnpWv/wlzOnc41/XlfILeLK5FkKO1Hetr5IOSQ=;
 b=jwQ34CUCb78271xn2lzei3bulFyquqOqW2PKiogDTXV6QkPHEkSs3ez31HIyOcjDXYS/dYOte42AlsBmihK6Gbc8935pPmFiSYMy4qUggTgum5pJodn15jIFGXuH9+kEhRT5QTofKpLzsVPGjlqI0Xb+gjws4g+v6MraLBsEZi2H0luoxqyh2CZb1OWuTNR8liip8HPwN4dsIEcL/v/aOZnLqITWfa+af7MZUL8CUAxd471dUmPKesSTp1Ui39/oef2+UZpmNdZ3aGdbaXEg+DA3LzxNDbnoC+nWV2HkwnQRK9GuVatQ9LrxNvj4t8lHZqLDEjPoKXcUIlmnK8gVaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BzexkpnpWv/wlzOnc41/XlfILeLK5FkKO1Hetr5IOSQ=;
 b=sUXdETrlm+6jZpzf19i93Cb5RFVbwPgKVIHibPt02ugxsZdQ3yJtNc0NC64TYIqYzbLL/WP+Ld6GG5gxTdzo1/mKIzV+i7i1hFbTEqp3mPU4715sJlA0hwvUBojergx6/I06XgdMLLv2FoHMwWj4rEb65vAOGIigp2QjpIP8vXZlUlx7M9ixaMCJryFjA+CjKypDln8Rx7rdixQlLBbtwslHxdcjDpg7V8vcgVY4BY4rP8KBV7rB2TqOI9Edw594QVM+5wxf6Fuywcy5TdsK4AW31uPjXBHHS+/Z0jT8+GXc9iIShu9P5w44ddAiuH2aSXNNnEcczaGuB76+hVccxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by PH7PR12MB7377.namprd12.prod.outlook.com (2603:10b6:510:20c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 10:18:14 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::a29a:c3cf:5edf:9dad]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::a29a:c3cf:5edf:9dad%7]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 10:18:13 +0000
Message-ID: <cd16086f-7c82-47ab-d893-b33d64f121d9@nvidia.com>
Date: Thu, 4 May 2023 13:18:04 +0300
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
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <ZFKCg2xnws2Smchb@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0216.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:374::15) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|PH7PR12MB7377:EE_
X-MS-Office365-Filtering-Correlation-Id: 078596a0-1c37-41c1-d297-08db4c88de6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WYi8ggY2A67zlrK530xPRMPUc1mRBSGqi3uJ/w161527DEuX7omnh33HZqdQPicR6RXPV31biwALL3rJ5wcsgcvJW8oe1E/KnVZY9OKYBDIutwDWSoKp+RF5i1f8MSpwx1t32E4+LfLxjCNPZ60XxjJ3HlTacBmnfD90c9yqWmtb4xdRuzNXl4PMgtPkyMM+KL9/9az3EUhfu/4IttpU3xuNqnwukplwcJFVChHC2scgjtyRPu5abwqcJeSDnuN70LO744GJIvs6uHz5cdFAiZnMvdvKg3i38skArzREQJ4nA6iMUXWL6nlhEoZru6r7DovCJON77bHWsDI/zL0Dw/r3XIdS1uEwoRJH8JVJW7aDD252H8nBrR+RWk+cmYiQT6tALDcEEcPSWIXp/EiG3FqXJcqqMSDh/j+Gsa1qwCq/zQOUd0tpQsOr3uAI2taE5pcc4inTdUeBN01txF74UG/lgNVpXB5glQM7+CRiyVvvu+PYrkIYdpJCu6/gCi8lHgEysd2EHP32Ob/ZLitPEb+bTGIklKnZCj7aLahIEUC28Ogn+68gHgswZCI7YhNkYOrIaArTL5ee7WvpJaGRIXMJakFP8WMHa20/qKKRaORwk2RhLPK1fP6Tdeep+OJBvsWfm+hElOB/l4/IxsfszA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(31686004)(36756003)(5660300002)(38100700002)(7416002)(2906002)(8936002)(31696002)(316002)(86362001)(8676002)(66476007)(66946007)(4326008)(66556008)(41300700001)(6916009)(83380400001)(186003)(6512007)(6506007)(26005)(53546011)(6486002)(478600001)(2616005)(6666004)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y25Jd0NVeFVpcU5kL1BpVnVhZHlnZ0k4cWdiUGxvaWROV0E0ZzM5UDdiWEhi?=
 =?utf-8?B?SUdkTFBKUTdGZ0FxeDBIUURCQnhQeGZ5VVowODJaa0N1Ymtzc1lzZTlUZytU?=
 =?utf-8?B?Q2x3R0hyVk1wMldKWVZ6bzNvenFMNXZTWGxVWWdrZlJNdnc2eXNyaDdCWDM1?=
 =?utf-8?B?Y0RoSGI1MnErb1A5SGpndG9jTGE1ZXNpZlg0RGxmV0x1eEZodjFnUDJmcG13?=
 =?utf-8?B?YlIzOS8xeDIvMzdRN0pzKytqemZvSHplZzZJdDZlSXcxSE5VL0hoa0doaEt1?=
 =?utf-8?B?WkJ3bkxTbmhwZzVCMS9jeWVHci9VdktoOE1seDRVWnJ5bVJPa3E2eXcxeFlP?=
 =?utf-8?B?QnV5bUlOd2ZTVkkrdFoyU0U3Qm9HaHhKU2lDRnFoZk5ITTlyM0xPVms4K01q?=
 =?utf-8?B?OUsxZjlZODhWd2VyY1RZOEZweEsxLzZRc0Y3TjBnQjBZNTlPNm4vRTF2U09s?=
 =?utf-8?B?TWV1Y05vWTBSekFkRmU2clpBaExVUTlNNjBCQmVYLzMxdWYzZTIrSU5ndkdi?=
 =?utf-8?B?UndNMXJJK2syaXowOGFoWkUxV3lpemdlMWVwUUYwVjg2TzBsYVBiS3c4dDhL?=
 =?utf-8?B?SlROZXIrN3EwZlhESGlzUGFFZ1l3WnA4YnM5MkZ0d2REcnVsNm1XZzMxYUVo?=
 =?utf-8?B?dVpVSERYNVFVd08rR1p6elFsSTIzT3d1OEwvbFFUZVdwdDk5VzNSZFZRRVVX?=
 =?utf-8?B?cE1tRXJCSWRsL0xUMEFvNSt4OEJJSnpDU3pDWDNiSzBWUmRDL05KeDhXQ3Jq?=
 =?utf-8?B?eVpPTzQ1bkRyMzRweXJYYURqWlFBdWtXVmQ4R1IvWDlBTWlHRWh4R1ZPcG1v?=
 =?utf-8?B?WkRyQ3ZBTVVzRERFTXowUUxDWkVpdlpGeFlXUVkvUVNPaS85R2dXUkJGazNk?=
 =?utf-8?B?K29XVDFGcWhFekc3a1M4blZJUG5qSUJVZmJIK1UzaGJER1Q2TEpaczhlU2Zz?=
 =?utf-8?B?b1VvODl5ZUJrUWx5MUY2b3QwWFlPMDJ3dHFkdCtWdkpVK25RRFdTTnlwVWZ3?=
 =?utf-8?B?QVAvOFgxTXFMTjlmVWU5MUFDNTZqMElSZ1pXYVh6WkM3eXZ2ZU1Sc0FQejFl?=
 =?utf-8?B?U0xGTWpUVElEcjZ1ZWZtR2RoclU4OGRNZFNSQzM1OVVPeSthR1V3ckVYdCtm?=
 =?utf-8?B?NFFONWUwTDdzcUFFbjBabjc5aTIybnRiWjQzNWIwOWw0SEIwMzJIZnZ6WGdY?=
 =?utf-8?B?ZUxSdFI2ZW5UNXVON1l3aU9kOVNINzhkdzNETWlDdEE4UXczTWRwbElqRGU3?=
 =?utf-8?B?YU84TFZYWmQyNWRzUzZzV2JwSUVoVWhWYlBOVGFPNXJoTW5JTVRYK0JQNlVm?=
 =?utf-8?B?UzQ3QzVQOEY0a1Q3d3ltWXlmUmZwRTRpQklTUzRSdHRTUVJ3NHcxK0MrcUJx?=
 =?utf-8?B?TWlqYm0vRXkwNk8yM1FOZUdRencwOVk0YlNpVWF3OVpQT25OWU40Y2l3VXg1?=
 =?utf-8?B?ZHNPN3hzN0ZWOU50NjVJbEw4S1ZicHNjYmtBbEh0WnlQMjh5aFZmQ2xqQU9s?=
 =?utf-8?B?SWhJY0RHZURYNGtvSTZXYXh2ZUltVlFFcHlCL3NOaG9iKzlXcG8xNDJXZlo3?=
 =?utf-8?B?VlA3SkV1aERUK1VFaFlqTnBYK2p6alpIUXlVSXd3TXA4aXk0cEJId1FVdDln?=
 =?utf-8?B?MksvL0VtRExqOFdCZ3dvb0dHMi9rclhaZWxuZXc4Wmw0SWg2bnd4UFBldEZ6?=
 =?utf-8?B?T2dBRGNzTGY5L29rd1JmSUI4U1Rod3g4ZVRRWVd1NEJhYmRFUFNXMmxvei9l?=
 =?utf-8?B?UElqd1kvbDhjeHRTeHpyejk3ancxMXE5cGIzWjVUU3ZsZVR3aVQ3MW03YzZF?=
 =?utf-8?B?d1ZCdFFtZE9QRXBUdDk0NjNwZ280MUVhMjE4STE4c21McVRjRlUrTFFCVjgw?=
 =?utf-8?B?Y0c4WGplTHNzblQyQ29TOERTT1pxOUdaZzNXVkRIODEzcUpvaGVPRkRJV2VB?=
 =?utf-8?B?M3RmUXg1SENqZmxuUjdlWmxybTVMNkJXVXRNaXVDYndkdjNvR1M2MkllNWxL?=
 =?utf-8?B?ZDJsUDNmRFcrRTMyOEtqVWVLMHduRkphd0VnQ04wdk5nVGhvekdoZlorMnZO?=
 =?utf-8?B?SlB1clZvWG1xREw0bzVSSXl0L1ZJcWZWd1hnc3pwZEN5aURtOWtVZWM4YzdS?=
 =?utf-8?Q?wy7Zbllh9R9YNUOQTx+btDefN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 078596a0-1c37-41c1-d297-08db4c88de6b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 10:18:13.6168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LSnIQbnRHCEhmzaC5eheWwCVIkf/INfVAiW9TLZfMJnlTHWDnlscjzWFni97nx0Ei7uJIhiUFEcEAZzB39MWzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7377
Received-SPF: softfail client-ip=2a01:111:f400:7e88::60d;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


On 03/05/2023 18:49, Peter Xu wrote:
> External email: Use caution opening links or attachments
>
>
> On Wed, May 03, 2023 at 06:22:59PM +0300, Avihai Horon wrote:
>> On 03/05/2023 1:49, Peter Xu wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On Mon, May 01, 2023 at 05:01:33PM +0300, Avihai Horon wrote:
>>>> Hello everyone,
>>> Hi, Avihai,
>>>
>>>> === Flow of operation ===
>>>>
>>>> To use precopy initial data, the capability must be enabled in the
>>>> source.
>>>>
>>>> As this capability must be supported also in the destination, a
>>>> handshake is performed during migration setup. The purpose of the
>>>> handshake is to notify the destination that precopy initial data is used
>>>> and to check if it's supported.
>>>>
>>>> The handshake is done in two levels. First, a general handshake is done
>>>> with the destination migration code to notify that precopy initial data
>>>> is used. Then, for each migration user in the source that supports
>>>> precopy initial data, a handshake is done with its counterpart in the
>>>> destination:
>>>> If both support it, precopy initial data will be used for them.
>>>> If source doesn't support it, precopy initial data will not be used for
>>>> them.
>>>> If source supports it and destination doesn't, migration will be failed.
>>>>
>>>> Assuming the handshake succeeded, migration starts to send precopy data
>>>> and as part of it also the initial precopy data. Initial precopy data is
>>>> just like any other precopy data and as such, migration code is not
>>>> aware of it. Therefore, it's the responsibility of the migration users
>>>> (such as VFIO devices) to notify their counterparts in the destination
>>>> that their initial precopy data has been sent (for example, VFIO
>>>> migration does it when its initial bytes reach zero).
>>>>
>>>> In the destination, migration code will query each migration user that
>>>> supports precopy initial data and check if its initial data has been
>>>> loaded. If initial data has been loaded by all of them, an ACK will be
>>>> sent to the source which will now be able to complete migration when
>>>> appropriate.
>>> I can understand why this is useful, what I'm not 100% sure is whether the
>>> complexity is needed.  The idea seems to be that src never switchover
>>> unless it receives a READY notification from dst.
>>>
>>> I'm imaging below simplified and more general workflow, not sure whether it
>>> could work for you:
>>>
>>>     - Introduce a new cap "switchover-ready", it means whether there'll be a
>>>       ready event sent from dst -> src for "being ready for switchover"
>>>
>>>     - When cap set, a new msg MIG_RP_MSG_SWITCHOVER_READY is defined and
>>>       handled on src showing that dest is ready for switchover. It'll be sent
>>>       only if dest is ready for the switchover
>>>
>>>     - Introduce a field SaveVMHandlers.explicit_switchover_needed.  For each
>>>       special device like vfio that would like to participate in the decision
>>>       making, device can set its explicit_switchover_needed=1.  This field is
>>>       ignored if the new cap is not set.
>>>
>>>     - Dst qemu: when new cap set, remember how many special devices are there
>>>       requesting explicit switchover (count of SaveVMHandlers that has the
>>>       bit set during load setup) as switch_over_pending=N.
>>>
>>>     - Dst qemu: Once a device thinks its fine to switchover (probably in the
>>>       load_state() callback), it calls migration_notify_switchover_ready().
>>>       That decreases switch_over_pending and when it hits zero, one msg
>>>       MIG_RP_MSG_SWITCHOVER_READY will be sent to src.
>>>
>>> Only until READY msg received on src could src switchover the precopy to
>>> dst.
>>>
>>> Then it only needs 1 more field in SaveVMHandlers rather than 3, and only 1
>>> more msg (dst->src).
>>>
>>> This is based on the fact that right now we always set caps on both qemus
>>> so I suppose it already means either both have or don't have the feature
>>> (even if one has, not setting the cap means disabled on both).
>>>
>>> Would it work for this case and cleaner?
>> Hi Peter, thanks for the response!
>> Your approach is indeed much simpler, however I have a few concerns
>> regarding compatibility.
>>
>> You are saying that caps are always set both in src and dest.
>> But what happens if we set the cap only on one side?
>> Should we care about these scenarios?
> I think it's not needed for now, but I am aware that this is a problem.
> It's just that it is a more generic problem to me rather than very special
> in the current feature being proposed.  At least there're a few times
> Daniel showed concern on keeping this way and hoped we can have a better
> handshake in general with migration framework.
>
> I'd be perfectly fine if you want to approach this with a handshake
> methodology, but I hope if so we should provide a more generic handshake.
> So potentially that can make this new feature rely on the handshake work,
> and slower to get into shape.  Your call on how to address this, at least
> fine by me either way.

I'd really like this feature to get in, and I'm afraid making it 
dependent on first implementing a general migration handshake may take a 
long time, like you said.
What about keeping current approach but changing it such that the 
capability will have to be set in both src and dest, to make it similar 
to other capability usages?
I.e., we will remove the "general" handshake:

     /* Enable precopy initial data generally in the migration */
     memset(&buf, 0, sizeof(buf));
     buf.general_enable = 1;
     qemu_savevm_command_send(f, MIG_CMD_INITIAL_DATA_ENABLE, sizeof(buf),
                              (uint8_t *)&buf);

but keep the per-device handshake, which is not a handshake for 
migration capabilities, but a part of the protocol when the capability 
is set, like in multifd, postcopy, etc.
This way we can advance with this feature while making the general 
migration handshake an independent effort.
Will that work for you?

BTW, with your suggestion to add a notification mechanism to notify when 
initial data is loaded in dest, I think we can drop these two 
SaveVMHandlers handlers:
     /*
      * Checks if precopy initial data is active. If it's inactive,
      * initial_data_loaded check is skipped.
      */
     bool (*is_initial_data_active)(void *opaque);
     /* Checks if precopy initial data has been loaded in dest */
     bool (*initial_data_loaded)(void *opaque);

> In my imagination a generic handshake should happen at the very start of
> migration and negociate feature bits between src/dst qemu, so they can
> reach a consensus on what to do next.
>
>> For example, if we set the cap only in src, then src will wait indefinitely
>> for dest to notify that switchover is ready.
>> Would you expect migration to fail instead of just keep running
>> indefinitely?
>> In current approach we only need to enable the cap in the source, so such
>> scenario can't happen.
>>
>> Let's look at some other scenario.
>> Src QEMU supports explicit-switchover for device X but *not* for device Y
>> (i.e., src QEMU is some older version of QEMU that supports
>> explicit-switchover for device X but not for Y).
>> Dest QEMU supports explicit-switchover for device X and device Y.
>> The capability is set in both src and dest.
>> In the destination we will have switchover_pending=2 because both X and Y
>> support explicit-switchover.
>> We do migration, but switchover_pending will never reach 0 because only X
>> supports it in the source, so the migration will run indefinitely.
>> The per-device handshake solves this by making device Y not use
>> explicit-switchover in this case.
> Hmm, right.  When I was replying obviously I thought that decision can be
> made sololy by the dest qemu, then I assumed it's fine.  Because IIUC in
> that case how many devices that supports switchover_pending on src qemu
> doesn't really matter but only dest.
>
> But I re-read the last patch and I do see that there's a new bit that will
> change the device protocol of migration:
>
>    if (migration->initial_data_active && !migration->precopy_init_size &&
>        !migration->initial_data_sent) {
>        qemu_put_be64(f, VFIO_MIG_FLAG_DEV_INIT_DATA_SENT);
>        migration->initial_data_sent = true;
>    } else {
>        qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>    }
>
> With this, I think what you said makes sense because then the src qemu
> matters on deciding whether to send VFIO_MIG_FLAG_DEV_INIT_DATA_SENT, it
> also needs to make sure dst qemu will recognize it.
>
> Do you think this new VFIO_MIG_FLAG_DEV_INIT_DATA_SENT is a must to have?
> Can this decision be made on dest qemu only?
>
> To ask in another way, I saw that precopy_init_size is the fundation to
> decide whether to send this flag.  Then it's a matter of whether dest qemu
> is also aware of precopy_init_size, then it can already tell when it's
> ready to handle the switchover.

The destination is not aware of precopy_init_size, only the source knows it.
So the source must send VFIO_MIG_FLAG_DEV_INIT_DATA_SENT to notify dest 
that the initial data was sent.

Thanks.


