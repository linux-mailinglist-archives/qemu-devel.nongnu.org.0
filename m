Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC5C4CC40E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 18:36:40 +0100 (CET)
Received: from localhost ([::1]:42066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPpNX-0007TS-5H
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 12:36:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPpMa-0006eG-Kl; Thu, 03 Mar 2022 12:35:40 -0500
Received: from [2a01:111:f400:7d00::723] (port=10273
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPpMX-0001yl-9p; Thu, 03 Mar 2022 12:35:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gTIGsc1ABhUHsVVhKCZsmfpG7ARB3WBJ5+6fhpLoxZNxlqnt63UZUg7kZ4xzSaj2ic3eUx+IvpD7KdiBBilGHf+1gFR8bTbu95U4Zexmty3bfJ2+Iq0y5idpuBxenhHuEatoqbJPcJMXb+HdiRbn70GNABlqBBTil+euxd9xLkm7kSnqL8yAqfrIQdKE90voSV4jE2p/nV1M4bofwBpmDrzl3XUkl/GjHvlYojAvBM/h8gJWSvZS3spXm9GnduhQhm1lWENPW4HWMw7YP1Sp9KExmhKIbNQGUAoVLdof171VnnNYTlNphiDLNpBmXqfEV7C7fZaGa9KDqhBFFPtg/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lai0xEsqRitUZ9DzdIwirFNdKQif5lSc/BmEF7OGlFY=;
 b=j6BRkw5+Bgy2Y/k8YxQQAuW9z6Vz99bQGhKv5W6YmRTkPd9hMMRxkdzkz0ap5HGDv/v4r9wxzo/tWeluF900hqOcyE1qGzT1MWP1vPUXzdEggJdmzeR3klLuj3Fle/X1N8a/GxpdPcjjpSIAh6a1y6LITpxSBvsA8NNXJVq312X1sSrSzFtpw1VccSWBPcipDyyRjpaTP0288vzkLx4cywb9QrnI42YgZ3WfknBzYQ7mN3Dq8mjZ7/DtKgAswtGGrDF+4YYInzl9WjNR60esaDsnEb8ZUYabMtT8YtNm+Eu4QinqD/JqtK4erZC1b9jB5Qvw97+CcudA+0h4ABv8GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lai0xEsqRitUZ9DzdIwirFNdKQif5lSc/BmEF7OGlFY=;
 b=IEx3X7cIhyr6cBCo9qNMH6Wpt6FS3xnI5rupo7LJgahDi0A5ZZxL2N21ghiygAVjriwLp6bC6uV+3bcdkhAWiRsz0jwaOF0YNFOsS3GnsOm/By1U8wOaPPnEFmpyFLovoTl7CpVdenMFQCCKX8aXzXqkue30yXqTBuPQ9OveuM0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4993.eurprd08.prod.outlook.com (2603:10a6:208:165::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 3 Mar
 2022 17:35:32 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 17:35:32 +0000
Message-ID: <da60b713-497c-4b59-766c-650a98ee568a@virtuozzo.com>
Date: Thu, 3 Mar 2022 20:35:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 16/16] iotests/image-fleecing: test push backup with
 fleecing
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
References: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
 <20220228113927.1852146-17-vsementsov@virtuozzo.com>
 <1cb8456c-60c9-3a25-50c2-10b00a77ae5f@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <1cb8456c-60c9-3a25-50c2-10b00a77ae5f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::10) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 244f0452-225a-4d00-0fe4-08d9fd3c37c8
X-MS-TrafficTypeDiagnostic: AM0PR08MB4993:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB4993EF67DF779A79CD595563C1049@AM0PR08MB4993.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8OpaV41E+CNySmHcmIFGmSTIoUzqMQ2Ap5S+ZuJcrrjkDD2V5BWKl33M/OHxtddl65y+Xc+VbF0S6kBhRSJ2fQ5leffgTekVXH3Oo0q/RrFIKsT+SSwNqCUZXEl08bgnRMhE0dw+3QNy3PwkQA/ayqAljaAYpXgZNjoqZ5q+BR27miSLQaDvfSxD5/L9ObjywiJp50Z9NKMoWkCW63KlbDNgUsliwRNY/SeerIhvSYF8W3LKWzSaeSH42ckmqJhcNDlhmDgQyB/k21vPFYyXuCpY6mEcANz0uDn3CnhokAe+pHoJcvodVy7qoK9+njRJqvUzlKEnKlF/CUPexQcE3YDH35lMo6+2f0iCgHNn69j7ZuDql2zlmYxzC2vOPtwZeUUjKi40JGzDvB5xraUdcUB9Kb3tYj4Zh0jrCq93svODw777x9BD68KJCdbFnqud/qu5kj+9TKZCKgBudEepV7a0FhwTQ5jYCnNDGC6XfkGm1WYMO7ChO8p6gPif44Cu0kPaXpm4AyLOLPYOFjqpMeHFbzBXUn8E9Bx+OI3+DV1RKUMkpbZf6N3PvPqPGsqaCcPfnWOakGkiDhCyAdehNyYr/T+4yGJcVsYFB3cJC4dyynqMOvkaj0Frw66eX/GwJYC4nwThWcJRnxMXrjtVZGScLq4e9Md74mLQbdFTsbbQQihhmwktXHqqkrarmAKM4NmSIALncM+hdbbeDGSAIyhPKclWr/OgzxP8s5Gk1T55guHRcVycomkN3LiAJ22VSjgPbxKg0m9COzs+xodztQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(6506007)(6486002)(52116002)(53546011)(107886003)(2616005)(86362001)(316002)(31696002)(186003)(26005)(66476007)(66556008)(8676002)(66946007)(36756003)(4326008)(508600001)(8936002)(38350700002)(2906002)(5660300002)(38100700002)(31686004)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0crVWF4UXp4UUcycElTRHdUdktxRzRLT1lma3A3eFMydmVFNDQ4aDhqQTA4?=
 =?utf-8?B?bDFxMG0vdnBzTHZRTnN1dXFHeE1uaEpuazFBb1pMNU1idDYycEphUW0zSkQ4?=
 =?utf-8?B?WFc1ckZDTHgvbW8ybXdwcFRpMm9VN28rQmN0MmI4VXZhVHpRWWlJTXIvMFh0?=
 =?utf-8?B?SlVieEtBTHorS2Z0ME80NTdMWnhGejY3OGxNNm1DVG1Nc240SFBtSTUwYXUr?=
 =?utf-8?B?ZjFHSm9hWjdPTjFpalV2THRuVkZTT0ozQy83SGFJa1I4NlhIajNaQ215NVc5?=
 =?utf-8?B?R3k1Yy82WHV2OVRGdWdiVWZLdW9RR00vZ2dXNUxNR2h3ZEpLZTZlUFliUVBL?=
 =?utf-8?B?Tm9uWEFrWGxTUG5BVUtnSXRWVitLV1AzeitHZjNuUENsVVk5L1NqSGl5emhQ?=
 =?utf-8?B?ZUZNZGRITGVMRTV5Q2taS3NTQ2VuY25qVVNyd1FPeUgrU0J1aEdhWFd2VS9V?=
 =?utf-8?B?alFIUDZOMDFkMEwwTTNuZzhjYk5vUVJOaDcvcGtuL3BPT3l5N3ZHM3BRTWRi?=
 =?utf-8?B?QXZzOWpwcCtRU010QnlpTXRxbm9Qc1ZYMURBRFJsRS9HUXc5RUFQeHhxc3Q3?=
 =?utf-8?B?OXVoanNoaXk0ZGhsTGI3dHdGQXJlTUxNVEloc2xYbWxzd25FUUNBMjlqZjV5?=
 =?utf-8?B?aXdGL3NWU3g2VWUrS0k3ZktWOXJVdmFnTXpzME84ZU1UQmxQczBDQ2dJSTUw?=
 =?utf-8?B?V3FWZ2hHMGpRbEd6V2J1OURaa1o4Vm0wa3ZFTXc3bFdTbGtZaUlGVVhLRDNR?=
 =?utf-8?B?Z3Y2SWVTck1QK0dmT3ZIZFV6MG9GeCtoMFk4dEJjVStMWGVYOEJnVXREQ2RH?=
 =?utf-8?B?cEhMMEJJY0loUTJrMjdiZzludi9ucWlaQkJZTGxaR1R3ZUJRaCt6aDdRZmI0?=
 =?utf-8?B?SFkzc2QzaElHaHZtTVNlUWhOK1ZXUm82UkcrRnRyU3hlZUEyUDhwRzNxNXpv?=
 =?utf-8?B?UmVhRUp1VW5SRis3ektEVVhWb0hmU3c3U2JraS9zZVBvUU1TYkpweE9nZFRK?=
 =?utf-8?B?Z3J6Y3hGeitFajVNSmNFVUtaa2hndDZ0Yk83ZHEzMFg3N2tua3gxWGxtdFFP?=
 =?utf-8?B?dUFzNVpoc1JPQXRGekxsSE5MOHRxMDQ1cHB6cnZCSkI4RFlUTFZzVk9qYXFp?=
 =?utf-8?B?VzY1L3lNOU9EZ01kWnJFQ2NUWi9VRGpuWW94eVRqTGlOdTY4UFd3SHduNktr?=
 =?utf-8?B?cTZ5eldUaHZhcmQ4RnZEWDBGSlFWWmVid210UjUwMjVMZlJHVEJzMjlGNHln?=
 =?utf-8?B?VlQvZXRZZnFqcFFMa0gzWG50STgwdC9YWkJrdW9hT1cxVjNzWlRYRU1BWkJq?=
 =?utf-8?B?Y2svRzhaUXNuOGdYZ1d5MGVxNVpLeExQZDNSWk9EbUNici9ic0ZLOUxVOEY0?=
 =?utf-8?B?TkRMeEtpcjVsL2txbnI2aUF2VjNhWkI1eW9mV0dPdjZtQXBBNWl3ZWVPbmpk?=
 =?utf-8?B?enE0dklpOVEvRXpYY3daOEZ0VGN2MStSeGZ5elMrSGVhcG9zK2tJcU1kQ1po?=
 =?utf-8?B?c1NCMFUxTEpVQUdmb2hmWEsvZjg2c0FLWjdETjN4MFpvWjU0U2REbXh0Z3ZQ?=
 =?utf-8?B?Ym9WR1lodzRQd0Q4bnBiL25WU3hncEF6cExtZE5OQ2dXNWZHUnpnVXJ6eTlV?=
 =?utf-8?B?VklzcjhEUjNacHQzbVFvOHFBNTQ5TlVaRzVHalNzQ1pwcFJyTkRCUjg4bXZ4?=
 =?utf-8?B?WFRMQUViYUhIaUF4TWlDc3ExT0REcHVGcWlNTXNWeTh5LzlMaGE4ZzFLc0M1?=
 =?utf-8?B?Tzhocmh1eWxGWEZ4T2dYS3VXQU5Nc3B5NXdsYnYrSk8rR1JOME5ONjkyM3VX?=
 =?utf-8?B?Um1ncGUzQ3d5RjhkMm85MGpiNlNpai9kcGI5d3lLdmpEWXNDcVloQVVpNWhk?=
 =?utf-8?B?L240dmZKWkpsMTBNMzlaZFE4RkRoTGtvUFVkYmhnUGdNYmFnbUllNkdab1Nv?=
 =?utf-8?B?VFFGSm1Pc1F3SWtMcDJ4RGtxVHR4eWdCTnVpMGw0QWxqL3dKcE1sRHFyd3Iv?=
 =?utf-8?B?b1RyWElWR2NEQVNLbDlRRnRNamE3Q2VJNURvb05OYnRaaVI1eFJlM2MzL1Mz?=
 =?utf-8?B?YXNnbUdXVFZ0RGpHZ3hhaVpZclBidzl3RzA0QkFiK3R0ZG5LendRaUFGVVdY?=
 =?utf-8?B?dCtjOHMvbFJSMDFucXV4MFVUcmpTZzB5T0YwdzdGUVlDd3BQK1lLZmk5dFF0?=
 =?utf-8?B?R2s5cXA1RWFIM0hFNzhxdkVkZCs0YmtsZEcyUkFoU0FxcUVkei9nK2lTR1lm?=
 =?utf-8?Q?LGhlFvK2DV1hvaVKHN2+CSCc4jEYFyENZsWRyHz0rM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 244f0452-225a-4d00-0fe4-08d9fd3c37c8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 17:35:32.7389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOjsuR+IRnJZi+Ie3JND2pCcfhvTFcGE8o3Uv+42+ZHWGSTnMyRwMazUDWsdFTXWF5LWdKdjICBLKpB4m0cGLkL41isA+9Rj2hZOMygPK7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4993
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::723
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::723;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

03.03.2022 13:58, Hanna Reitz wrote:
> On 28.02.22 12:39, Vladimir Sementsov-Ogievskiy wrote:
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/tests/image-fleecing     | 120 ++++++++++++++------
>>   tests/qemu-iotests/tests/image-fleecing.out |  63 ++++++++++
>>   2 files changed, 151 insertions(+), 32 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
>> index 33995612be..89c79af698 100755
>> --- a/tests/qemu-iotests/tests/image-fleecing
>> +++ b/tests/qemu-iotests/tests/image-fleecing
> 
> [...]
> 
>> @@ -170,6 +196,20 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
>>           log(cmd)
>>           log(vm.hmp_qemu_io(qom_path, cmd, qdev=True))
>> +    if push_backup:
>> +        # Check that previous operations were done during backup, not after
>> +        result = vm.qmp('query-block-jobs')
>> +        if len(result['return']) != 1:
>> +            log('Backup finished too fast, COW is not tested')
> 
> I don’t understand why this log is here, its message sounds like “case not run”, but first this logged message will make the whole test fail...

This log means that test doesn't test what it should. If that happens, we'll need to adjust disk size, backup speed, or something like this. I hope, that will not happen, at least it works for me )

> 
>> +
>> +        result = vm.qmp('block-job-set-speed', device='push-backup', speed=0)
>> +        assert result == {'return': {}}
> 
> ...and then this will fail, too.
> 
> Either this is a hard failure, then the log shouldn’t include “COW is not tested” (because it is tested, and the case has failed); or it’s a casenotrun, and then nothing should be logged (the message should be appended to .casenotrun), and the block-job-set-speed call and waiting for BLOCK_JOB_COMPLETED should only be done when the job is still in the job list.

OK, I understand. What about this:

# Check that backup is not finished yet. If it is, it's possible that backup
# finished even before guest write, and we didn't actually test
# copy-before-write operation. If this happen, we'll need to adjust storage
# size or backup speed or something like this.
assert len(result['return'] == 1

> 
>> +
>> +        log(vm.event_wait(name='BLOCK_JOB_COMPLETED',
>> +                          match={'data': {'device': 'push-backup'}}),
>> +                          filters=[iotests.filter_qmp_event])
>> +        log(vm.qmp('blockdev-del', node_name='target'))
>> +
>>       log('')
>>       log('--- Verifying Data ---')
>>       log('')
>> @@ -177,15 +217,19 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
>>       for p in patterns + zeroes:
>>           cmd = 'read -P%s %s %s' % p
>>           log(cmd)
>> -        out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd, nbd_uri)
>> -        if ret != 0:
>> -            print(out)
>> +        if push_backup:
>> +            assert qemu_io_silent('-r', '-c', cmd, target_img_path) == 0
>> +        else:
>> +            out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd, nbd_uri)
>> +            if ret != 0:
>> +                print(out)
> 
> The existing principle of “print qemu-io’s output on error” seemed perfectly fine to me.  Why not continue using it?
> 
> (e.g. like
> 
> args = ['-r', '-c', cmd]
> if push_backup:
>      args += [target_img_path]
> else:
>      args += ['-f', 'raw', nbd_uri]
> out, ret = qemu_io_pipe_and_status(*args)
> 
> )

I don't remember why did I changed it. Your variant seems good.

> 
>>       log('')
>>       log('--- Cleanup ---')
>>       log('')
>> -    log(vm.qmp('nbd-server-stop'))
>> +    if not push_backup:
>> +        log(vm.qmp('nbd-server-stop'))
>>       if use_cbw:
>>           if use_snapshot_access_filter:
>> +read -P0xcd 0x3ff0000 64k
>> +
>> +Done
> 


-- 
Best regards,
Vladimir

