Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 912703251CC
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 15:58:45 +0100 (CET)
Received: from localhost ([::1]:52260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFI6G-0006eR-Ke
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 09:58:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFI59-0005yu-F4; Thu, 25 Feb 2021 09:57:35 -0500
Received: from mail-db8eur05on2118.outbound.protection.outlook.com
 ([40.107.20.118]:27361 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFI56-0007oU-Gp; Thu, 25 Feb 2021 09:57:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nniinNko+gnnv4CL6wMpEwWWBcpW1IAL2m2pp60aGTIGRUxx6a6kYlrNGjiiOXv34ze/05NxbuSfte8T5cLaRWepWGYx6CT1J23svSqxsd7BbU6a5h5Xse0cWqk0Ns2fV44BSo/mIWeT00Tu3GDoRPyv22eB/Ov17hEsGdCSOcN2ITKycblZ5IqyJ10S/+0BRpjFvKT0xOSyhJrZ1zPKqofXPqU8VRn2uMcq+jNaPLyasC4xLwmViAYv2nbt62G3HZFCAQ366Ekug1zkYaybreq2jk0JRH2si8yUN3y7EGc9Mhhl1Jbh3sartC/6R/0o7VnUSvngZBptZqqjXjTXkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4fxT1u2KjnFp0VqRCnLydCRGII8H3rFHDy8nrpXeLI=;
 b=T39EiUvY9Sgfl3BXOXMNsdmc1AGIdX7P4AgNS4Yg49hLyDMutcOUwDgG3J1FzyBoKTx1QYiSYjXwUqFMKAVTAk9VuYr4vzEEMaO3HTUbcEVg78enJ2QO7c1xU8bKn3uYk78Zsk9v3w5kADk9jNc6dBvexL00FEA/EMTIPk/3u2byQO94p2LYSjls91SySoDMFyNFHdCt50Hq+nbPY1tqaSiCyF8drNwCtgchVZ++PL+MyO6dhz+aBC4mSQamDpQVJs5wXEXJYAE0WTkbxe2BZuMPrrX9WJcJn4Lf+VCF33MeXRicxgCaxqOvgAserY8WGkcIt1XnNBI53oln4FrjdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4fxT1u2KjnFp0VqRCnLydCRGII8H3rFHDy8nrpXeLI=;
 b=g2hn6y7G5j4kzSa7ZRi2P4TSFL9Me01R/HapnPSTmZwbwKk4VEx+H5o6CrX2VYSvuewq7EeCueObhIuZ0RSBU0BupX94/wN1H9Cl9lWvNZUnulpTTsGArSP8t8i9Y5yPSL7xkvTPfCjGIO+b3MSUJGV82Yfw9vnOseyVkFA6XtE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6374.eurprd08.prod.outlook.com (2603:10a6:20b:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Thu, 25 Feb
 2021 14:57:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 14:57:29 +0000
Subject: Re: [PATCH 1/5] iotests: Update 241 to expose backing layer
 fragmentation
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
References: <20210218201528.127099-1-eblake@redhat.com>
 <20210218201528.127099-2-eblake@redhat.com>
 <a31b0bf7-56af-94a8-4d83-eac366bf62b9@virtuozzo.com>
Message-ID: <b471d0e3-b7cc-f62f-25a7-d7d59fe6093c@virtuozzo.com>
Date: Thu, 25 Feb 2021 17:57:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <a31b0bf7-56af-94a8-4d83-eac366bf62b9@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: HE1PR07CA0001.eurprd07.prod.outlook.com
 (2603:10a6:7:67::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.253) by
 HE1PR07CA0001.eurprd07.prod.outlook.com (2603:10a6:7:67::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.9 via Frontend Transport; Thu, 25 Feb 2021 14:57:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5e8e30b-a131-42fd-d554-08d8d99dac1e
X-MS-TrafficTypeDiagnostic: AS8PR08MB6374:
X-Microsoft-Antispam-PRVS: <AS8PR08MB63745608C35CCD1FF76D22EFC19E9@AS8PR08MB6374.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:46;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w5Gm0hOMmysWoSjy5KE7mr2DRjy5giI81WelQD/4fU4inixDmt0QoDUBHdI+jXm95Nz6vC+WSujTbJ4COrb7/PJRc9SoqNixeH53M5JixlGOaOuzn/tDkd+0eut7SzWakjmqBq3N6Ur4Qyhk3n/SywgutOaq9yAzL+EqE/F1hvNKOP8RGmqf98NK06/mtLzLTouqQwWcM2Wn56pzg+ix1vY3R4luPfL7e6hG2xuGjRSvjWnCNWXECpjUvPPj46gSXtE+gtD8nRy8y6P4RHrt19rtMAG0VAOq+hxTR53x2eS/0vRTrsXf71FldH/nxbju/Jxlkn0vcvX4TiCAng56Eho8Nai1wwTef+epZ8gTUPF9q8pJsRqtHkYFRnJz4Vf8SLG4WK1QAG0qfhkBvJPiUfN7UNIAkCeYCrtLs8yHtijXT2cXgauPAqRNQ1XHAmVY4c0nrbWIT7cNy9E3+Sjqq0tD1T9IJ+v1emw88w3scmDE5IZOWSJPd4GR7vOuZrOklKYVvNZGSBNNG8VGGFEvV8b5zXxhdk0NQy77eY+vM26bWcvCamiHMcrYnjYRW3Qe+jhigixkUFMfGu8Gz9bAd4c5LfscEbIFTVJtQ6uSnXU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(396003)(346002)(376002)(366004)(2906002)(4326008)(83380400001)(316002)(16526019)(54906003)(16576012)(6486002)(66476007)(66556008)(5660300002)(186003)(86362001)(15650500001)(52116002)(26005)(31696002)(956004)(31686004)(8936002)(8676002)(478600001)(66946007)(2616005)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SHpqZXpyYlBvZ0lwd0FjZllJc3cwWEswU1ZzQWlRSURFR1JIZm11bTJyMFBu?=
 =?utf-8?B?SFRpMW9xRG1BcnBGV0Q0VENBM0s2dit0SGljN1BsWDBVNHdyOE9ZZCtWZC9W?=
 =?utf-8?B?YmN4V2JDN0tGcjVXTWo5SWdDdXZvMnpPdGpyV1BneGRvRmFrWlBXdUhRT2NJ?=
 =?utf-8?B?ZnVBbDNGQ2hsL215bFNiQ1RkTHFwNGFiRXpPVDdJbjI1Vk5yTFNNUjNzZkZZ?=
 =?utf-8?B?R1R0d2NBc1ZnOW5iVVU0RGYwNjRKSmJ1blhoOWh6V0taeW1HQlI5SkptcGdi?=
 =?utf-8?B?dzQvbWV2Z2hPdWdJNHpPZVN5dlBlN3B5NDJZSnRvSmpnaVp6WkpjS1RjcktH?=
 =?utf-8?B?UEpML1ByNTRHdEphcHcwZHNCbFZ4eFBOMWMyaGplcmZKMklaeHVGaE9iQ2lW?=
 =?utf-8?B?aVNaLzkveDdmVUxoQ1B6TFVtK1drVU5QcC9raEJIUzZaY2V1Y09yNklNZlJQ?=
 =?utf-8?B?N25vUUlkTjN5UDBhYzR0RVBkdnpPUU43M2Uya0lyaVp6RGFjS1kvRTZwY21U?=
 =?utf-8?B?RkdZcHRCSVdlSDB1aWlmVVRJMlZRYXJCU1lyNEUySWFKU0Qrc2dhQ0RoaVF5?=
 =?utf-8?B?VjlRbTA3WHlCS0ttSWdEYXREVjByOUNURTFlZ2tyRkl6SC9CVm1kdkpPZXIw?=
 =?utf-8?B?WmRoQ0t4eVJZUDZxQmw4OTZ6bE5RbTRrZDVhTlkvbytCNkdqVGl6Wjl6elZU?=
 =?utf-8?B?TStQYWJxS0k3aEloaWpia3E4THhsTmVYekQrNVdpL2pCbjBpMXFmOGJzNGtD?=
 =?utf-8?B?bGZzSTUzREs4YU9mTi91WTVla2xuMDB6SkpWK1QrU0dsQWFidHAzdnBQZmFH?=
 =?utf-8?B?SmxQWnM0aXRjcmgva3hpb3B1aVBwd1doSG5uL25Yd2s1MENncFVNdTJLQi83?=
 =?utf-8?B?NWhvSUEwam85Y1V4bFRrUFZVb0dPbkR1alZyRTZLK3dyeGJtblg5WU82Q0hR?=
 =?utf-8?B?bG5rV0EzaGxUVzBMeXNsdlI5bmdMNFZacXh6OFc1RmpvU3Q0UTVNV1B4U05x?=
 =?utf-8?B?blRWM2RyanV5U3dJNzZxMkhvb3hrdmZETHY4bVdDZDVNelhvWFVJUlFsVFVw?=
 =?utf-8?B?MFlKVWdZR2V1bWY2c3RzTlIwR2NmK3BLeEQ2ZVdBd3NaczJVZTVZSmE3Tmd6?=
 =?utf-8?B?WUN1WmRVYWNyTXBHMVZCRC9oUS9iN3Z1YWxQMVY3NVdyaUQ1YmdvcGV6RCtJ?=
 =?utf-8?B?bXZjQ0lhVG96ZmtOa3NoYUtrV0Q2ZDBnZVZhWmZ3TENFUFFKTXdob2RhYnMr?=
 =?utf-8?B?ZFQzbkNPWmhiWVZ1SmE2WEdFOFdZWnFyU3lScVQ2ekhxVEQvQzN1blR1aWdF?=
 =?utf-8?B?UEVKZ2F6TmlFYnlCNTdDVGZ5dHlxaWhpQWtlQUJpMTN6a3o0d0p5Znp3bkNp?=
 =?utf-8?B?OGFhZWxPMlBqdlZ5V2pZcGxrM1FPZDhYMXl1MEZ5amRxd3gxUExKUzY3ZUJK?=
 =?utf-8?B?Y2NQcnRSUnI0d29TRjdyMlBnTnpzci9mLzA4V3pLQlBXa0Nyd25TSkkyNXZQ?=
 =?utf-8?B?RGxBWjhHSDI3YkN6SWN0SU8rbzJScHQ5UFRpR2hpNjFncE1qczVzb0Z6UUhs?=
 =?utf-8?B?Y0ZoM1ZZZEtDRUFmY25tajgzTm9ybzBRZmVDSjI0WmZHRk9ldU15MkN4NFQw?=
 =?utf-8?B?SEQ4S0tIc0xSdnEzN3grNXpVa3l5OVVEd3A3ajJNZjROQ0QrNjNNR0hzelNV?=
 =?utf-8?B?WWwrMXBsQm1FQTdKOWN6cVF0NEdVak1CK2FXY3BybUsxS1ZCQ01qVmVtWVl1?=
 =?utf-8?Q?J9v1OqxOzuXkgtyLV0QY4EjAVTpAXtnFjKcZILI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e8e30b-a131-42fd-d554-08d8d99dac1e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 14:57:29.4835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2ESXZO7+SHS6S1TAs0sFh809X5QfaGmXpmzVkUJGk0IoLy2L8G1gKC5Uq+tFR/rehsxPAQUcOAXW5cqeV2uG9PwAgIMBjEIYnUzYHzYc4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6374
Received-SPF: pass client-ip=40.107.20.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7,
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

25.02.2021 16:50, Vladimir Sementsov-Ogievskiy wrote:
> 18.02.2021 23:15, Eric Blake wrote:
>> Previous commits (such as 6e280648, 75d34eb9) have mentioned that our
>> NBD server still sends unaligned fragments when an active layer with
>> large advertised minimum block size is backed by another layer with a
>> smaller block size. Expand the test to actually cover these scenario,
>> by using two different approaches: qcow2 encryption (which forces
>> 512-byte alignment) with an unaligned raw backing file, and blkdebug
>> with a 4k alignment.
>>
>> The encryption test passes with the desired results, but only because
>> the client side works around the server's non-compliance; if you
>> repeat the test manually with tracing turned on, you will see the
>> server sending a status for 1000 bytes of data then 1048 bytes of
>> hole, which is not aligned. But reverting commit 737d3f5244 shows that
>> it is indeed the client working around the bug in the server.
>>
>> Meanwhile, the blkdebug test gives incorrect results: remember, when
>> using x-dirty-bitmap with qemu-img map as a way to sniff alternative
>> metadata contexts, the meanings of "data" and "zero" are determined by
> 
> How I'm tired of this abuse:) It seems that total amount of comments
> about it in code and commit messages worth creating more intuitive
> interface.. Don't you have an idea in mind?
> 
>> that context.  Our client workaround is assuming that the fragmented
>> replies can be merged according to base:allocation rules, but those
>> rules do not work for other contexts (merging dirty and clean bitmap
>> should produce dirty; merging allocated and unallocated should produce
>> allocated; see the FIXME for more about the decoded values we expect).
> 
> You could instead keep the test output correct (without FIXME marks) but
> add the test to "disabled" group and drop it from the group when fixed.
> 
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 

Now I don't think that aligning qemu:allocation-depth information is a correct thing to do.


-- 
Best regards,
Vladimir

