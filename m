Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE74F32545C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 18:07:52 +0100 (CET)
Received: from localhost ([::1]:36420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFK7D-0000Ir-4G
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 12:07:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFK2F-0005Bo-E9; Thu, 25 Feb 2021 12:02:43 -0500
Received: from mail-eopbgr130101.outbound.protection.outlook.com
 ([40.107.13.101]:59128 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFK2C-0007OJ-KL; Thu, 25 Feb 2021 12:02:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNnjQGv1tNi7T+aCHOGYl13+ugEMwIJwXI4bC8xYLfXRof9NuLBMx9AwN6yN3X7VH4RDPsfgo62Eyb41Dnnm8eNPQbUrAk8v2zr+XVGnj8CdEVMinPsvpbL23aWiGN842HHGYiofv7vCyw1eYC78oc7uej1g689CBkMkfmeCfar+xEAzpv6weCClVIk8VrOoPxmnbHd3cyKjFF0uf4mSQSaJgPDODi12yl+bCzX1Wh4pnGOoNoG15iBHbhmY3SupzWuC3Ky5sSsjwJ7tVVePVFdjTCoHJptX2ozqpWvSGmAJVc1HgriZBV9phOZeb+0aXTVJT+O/KXE5hHHu7elb2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwO/7mfPfrOjPE/MZgWYykKNWtybDn6NfHGKtui/eK0=;
 b=HHMCFUIHg6W7PAeu51Qrb+si36auN5Ymxk2OT+hsBU3IHzsBlZeeobvETov9/8EYooJLQ8VeuNCnCsO+2w2vTn85ygMvTgz3Q4PxmZP54H3Vs3JRtOb3+ihnKihGzv9Op6/WHiPO9I/jkOIgqN0H3k0ATjqeR1RVy9H9U2dWtVy1BemG0XadA4lx6d2jqv1QascIuuNb5IVnKiNVGivyuGyuwJNxByoqLJapOYpHoHPtOJAkRFrIkq6MUfPMHAwg1Ia03gGf/tnOcqb2Cia8fsx2YaoO6R51KhpzLIkg+BqeHQyEkERRoSS32Xp+eFlVe9HIc/eCfEsKC1GNxxEu1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwO/7mfPfrOjPE/MZgWYykKNWtybDn6NfHGKtui/eK0=;
 b=mfQxMglLOYaZYanggoeSvrgHKn9EaOLG9brGL0TpgRCUBG7LCJIM5aHhOvn7pDL8fB+nMtC3oC8/PEBpi0/UoMAEY+YL2UYg0zAYbHxLekXwJY4sFAzpU65k3YoTe3C82cC59SwYw3UgzY/U6uE1eoXOK0Emwrn+r5qS3a/jx7U=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4216.eurprd08.prod.outlook.com (2603:10a6:20b:89::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.30; Thu, 25 Feb
 2021 17:02:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 17:02:37 +0000
Subject: Re: [RFC PATCH v2 3/4] block: Support multiple reopening with
 x-blockdev-reopen
To: Kevin Wolf <kwolf@redhat.com>
Cc: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
References: <cover.1612809837.git.berto@igalia.com>
 <145882bca942bb629bce2b1f5546fe0946ccdfcd.1612809837.git.berto@igalia.com>
 <06587add-3242-6041-6a76-e2fd41e8c040@virtuozzo.com>
 <20210224123305.GA11025@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <05d57ba7-684b-a897-5e7e-1ebb6350ca31@virtuozzo.com>
Date: Thu, 25 Feb 2021 20:02:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210224123305.GA11025@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: HE1PR05CA0228.eurprd05.prod.outlook.com
 (2603:10a6:3:fa::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.253) by
 HE1PR05CA0228.eurprd05.prod.outlook.com (2603:10a6:3:fa::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.20 via Frontend Transport; Thu, 25 Feb 2021 17:02:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40bae1aa-2278-43f9-38aa-08d8d9af26fd
X-MS-TrafficTypeDiagnostic: AM6PR08MB4216:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4216424DE3B272B991BFAF5EC19E9@AM6PR08MB4216.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SNgB46R9MWHP/fvKKyZLO++wiZNLrNgnrJkHFeu/DAD3UxbEWrt7i6mwmZw3uAesbV+rX06PbcpSnTTFmtCpFzsTQmSZbfymNNcX3fj9QVBCgSx6+bd9K3YOzqbOn94s4DeNjE2HxTrIk7UkC/7HsVJoBR05Odwj1BTEgPOAghR3odkXXnv4VgnqV0aAusOVhATEAU/OQT1UmMcjat8bRqsqq3nBBDPtD51t37H9mYYJv7T+sXOYyfUj8C2AkeO2DtG6iAOQ1PhpCavWJrbX+fd0fkRz3U5JCnkpBy6qjYFvTVMHEoa5ygJGHuhUVxKqcNUcGxt+BC3dYEfSe4Y/kDv6OUhT/seMBsDggohZaCZ3YbyobU4l0d7rEkWb8vTBYm4Y8iCYZpqavbHLH6AndxElfyVOLp2PenATWAa2IgItW3Hhhf2jP/0GKi1HL7tWtNZSVN9pyLbHGnx51KIXdB2ob45ueE5OFqOge28UqrRkAi8i6IJCGiiIVzHCb8DE4pNC8b0/ADlFfxnEDrH3A6WSkRA01JaGv/tfuQYmDAhbH5+7nDblF9AxrK9QbfWdihDuUplD9/YXLmyQ+YtPkKw/I0bGwBD2bnzDZ5G1y7E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39850400004)(396003)(136003)(366004)(346002)(6916009)(66946007)(478600001)(31696002)(31686004)(66476007)(6486002)(5660300002)(16526019)(2906002)(36756003)(4326008)(54906003)(186003)(26005)(6666004)(8936002)(8676002)(86362001)(316002)(16576012)(52116002)(66556008)(956004)(83380400001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ck9FeHFqSDRiMjRDVEJCSHUzWDVMRkFKejdlQzNRdVc0Q1pCSUFpb2VCb1lm?=
 =?utf-8?B?UlQrSWdkbDdWUW5oV0lkWVNPUGhYT0g1WEd0a0sxVi9FdVBWbWVKYUxCbGI1?=
 =?utf-8?B?VThHaWtYOUFyMHNjVGM1VG9xRExxbm9jS3JoQU52Q1NTTFg4ZDJKWm1IRHV1?=
 =?utf-8?B?bG9wS0JtblZZeXZzZ3ViakNNTytSc3FWNndrN2tsTTdod2xLTW1BZ3VrOVVZ?=
 =?utf-8?B?aWlNMjBJNTlYd0FUMWtrVXdMdzBwamQreTBxUzZPUld4QS95M25SbjlTQ1Rv?=
 =?utf-8?B?Z2xpWmZNRTYvSVJDaS9yeHQ1ZnM2cTkyYkxIdFpPajNmVmVGNHR0QkpSbjJU?=
 =?utf-8?B?Qzc4ekdqWkZ1dDJxV25HWk5wL3RXSUhCVUgvMnMxVnZxWDNXdE5XZUxIbXFv?=
 =?utf-8?B?Y3Fhajg4dnFXMUU0eEhKcG1vazV1RDcwS3hZbDJTeGs4QkpwaldXZGZvSk1P?=
 =?utf-8?B?LzFxNlBvZzRObmxZc0xYSDVCcGluRVJ5RTA5WkpTZENQQkdLazFIVzJ1WUhx?=
 =?utf-8?B?aVpsdFRYV3E4QXVPSWh2eFc3SEwrckJSQndEMnMreitFeEtnY21pMWpnMmVj?=
 =?utf-8?B?ZVJ6MmlZYWhlWm1wS1dya2lyT2NqVVk3WXVnSlNUNnlpVTEvQ2NFN1pGV1po?=
 =?utf-8?B?N2ljaTljRFFNY2Q3SThSWWxiU0dqYlJnaVlVQ1l4akhIaE8xN0t0YzBNdkN2?=
 =?utf-8?B?SE5DaUdWWGRJdEVvVmpveXBUdEl3dmRQOEJFUzR1Vlcza3lVM29QbEJKV25F?=
 =?utf-8?B?RWprakNOMUZEQ0NxQnNJZWRVcG8wTW1JaHdDVk0ralpmdmNJbHJPSGdLTm9o?=
 =?utf-8?B?aHdmbVo4Zm4vSVVMNTIyVm82RTVmUmZ4eDhYcllMMmNIL3l2bE5mbGVUKy90?=
 =?utf-8?B?cnNNVHg5ZDgxQnFlMTE3Wk5lVENyVFVWc2RqOFh2ODZEekptY3BqMDVWOURV?=
 =?utf-8?B?WFdERitJL0ljd3dXZGdoNnRJMERQTkF4S3dyL2hNTGt1NVJDZnRMQ29wRkNn?=
 =?utf-8?B?U3o4ZjNZcytjMEFQTm5NUDJjNWlGczZ6MFJ5azdHZmw1eElqU0syZlJQdzcz?=
 =?utf-8?B?SFE3Z1A0VnhkTFVsRlFmM25nODlwKzh2NEt1SGVpSmpMMUU1RzJxRTU4NVY3?=
 =?utf-8?B?UWFuZkJua2hqM1NadlBpeFprZlBvTlplY1B2NnhmQXlWcVQ1em9aeWVaWlFS?=
 =?utf-8?B?VDdWcFlLOEFFMDhzZ3F4eG1WTSt2N0JCdFBkclZqenRvODZLRGg2NkREeDdF?=
 =?utf-8?B?TUZyRUQycEZCUm1xZ2xsNkpSc1hpT1NYMFYvdGxSeFVIaHBRRmtKSE5QdTY3?=
 =?utf-8?B?M2tyZVMvQU9LZk5icThvUElGbGR2K3NWQ3M4dk80UmRzRC9laitueENRQ1E0?=
 =?utf-8?B?MzN1SWwzL2xUN3JXWWk2Nld4eC9ObDNBM3Y1MVhVNzh0eFZISnRUSGQ0dUJH?=
 =?utf-8?B?YUxmUUFyNFZaRWZpTFZXOVRZWWE0L1lFNkduK1MxamRXV0xCZzI0K2Jza0hM?=
 =?utf-8?B?MUkvYWZSTjRqSWtEcEEvYlk1eDB2YjlVai92VGpWU1lsUHhGbnhkK3luOTht?=
 =?utf-8?B?UzlxREx5bWRsK0d3em42NnN3WnVkZzE5ajZNSEp0ZktyRDgzejdINjRyYmxO?=
 =?utf-8?B?UTgzckVrZjBpVndVZlhyWU1YNHYrb2V5dDQ2Nnh0ck9MWk1mL0kxc3FJbDI3?=
 =?utf-8?B?ZHV6NlRuR1N5d1FVakpTT2piUXpoSnJ0ci9kamsxYXJpbENlbS9HdmNuK0Fz?=
 =?utf-8?Q?HRn4R9V1HezECjN83ySH2pkr7/k777SIAH4K2EO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40bae1aa-2278-43f9-38aa-08d8d9af26fd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 17:02:37.0395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYIc1rVYCa1o//klyD4TVepTfnHFDEKb1GTzCGL1fZBOmTObKFdRSxH7dXTgLZgm3ICPz1No951GJk5WjCtVWhiqg/TGT72f4LA9aPDjXPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4216
Received-SPF: pass client-ip=40.107.13.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_NONE=-0.0001,
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

24.02.2021 15:33, Kevin Wolf wrote:
> Am 09.02.2021 um 09:03 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 08.02.2021 21:44, Alberto Garcia wrote:
>>> Signed-off-by: Alberto Garcia <berto@igalia.com>
>>> ---
>>>    qapi/block-core.json       |  2 +-
>>>    include/block/block.h      |  1 +
>>>    block.c                    | 16 +++++--
>>>    blockdev.c                 | 85 +++++++++++++++++++++-----------------
>>>    tests/qemu-iotests/155     |  9 ++--
>>>    tests/qemu-iotests/165     |  4 +-
>>>    tests/qemu-iotests/245     | 27 +++++++-----
>>>    tests/qemu-iotests/248     |  2 +-
>>>    tests/qemu-iotests/248.out |  2 +-
>>>    tests/qemu-iotests/298     |  4 +-
>>>    10 files changed, 89 insertions(+), 63 deletions(-)
>>>
>>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>>> index c0e7c23331..b9fcf20a81 100644
>>> --- a/qapi/block-core.json
>>> +++ b/qapi/block-core.json
>>> @@ -4177,7 +4177,7 @@
>>>    # Since: 4.0
>>>    ##
>>>    { 'command': 'x-blockdev-reopen',
>>> -  'data': 'BlockdevOptions', 'boxed': true }
>>> +  'data': { 'options': ['BlockdevOptions'] } }
>>
>> Do we also want to drop x- prefix?
> 
> libvirt really wants to have a stable blockdev-reopen interface in 6.0
> because enabling the incremental backup code depends on this (they just
> toggle the readonly flag if I understand correctly, so most of the work
> we're currently doing isn't even relevant at this moment for libvirt).

Do you know what is the case exactly? If they do it to remove dirty bitmap
from backing image after snapshot operation, probably we'd better improve
block-dirty-bitmap-remove command to be able to reopen r-o image?

(I just recently faced such a task)

> 
> Given that the soft freeze is coming closer (March 16), I wonder if we
> should just make this API change and declare the interface stable. We
> can then make Vladimir's fixes and the file reopening on top of it - if
> it's in time for 6.0, that would be good, but if not we could move it to
> 6.1 without impacting libvirt.
> 
> I think we're reasonable confident that the QAPI interfaces are right,
> even if maybe not that all aspects of the implementation are right yet.
> 
> What do you think?
> 

I think it's OK.. We have it since 4.0. What will we win keeping -x for years? Even latest change from updating one device to several could be easily done with help of 'alternate' if the command was already stable.


-- 
Best regards,
Vladimir

