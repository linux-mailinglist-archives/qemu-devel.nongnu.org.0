Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D6A1C835A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 09:23:32 +0200 (CEST)
Received: from localhost ([::1]:56558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWasU-0008SL-LJ
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 03:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1jWarR-0007gK-NL; Thu, 07 May 2020 03:22:25 -0400
Received: from mail-eopbgr60119.outbound.protection.outlook.com
 ([40.107.6.119]:37303 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1jWarO-0001Is-IY; Thu, 07 May 2020 03:22:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fA4B35zW+ns3f/GsZSngSRZKlQc1o7p0Y3O8Wx3uwda+p0FJpcrhf7Qg+drdgyBx8O1KW33iuz1QrA+U1AJmkvqunPO3NrYb34UgXyL7c1FU1+aqHoPy6aFfdQHRbCh6uLavMuJg4mOI3vScTEBNMc0+wyVTdf6p2O7OF9RmwSkVawz5rpw3shCpsduvxhEpHQ4DkjVtzzOh0LlQEZe+xV7M6aUsGNl+DH0vXRKGuMmhGc/dyGujRLw1oU9FrD9GB+jtDHmy8Eo2f4fuaGRoYQz3T87ezevAPqJ4DLcNFB3cwUTnpQeO9WujVWRD2QDc+Aa/Y1PyoubmD/Cd6EYUpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTI/RhfswTFVxUtRINx3dMmG/Vwti51XV+W+AhcDiO8=;
 b=FyNGn1QnWM7kwkF7l+tG8tpCwAzguUJwfIqDv+GWDcUlc9h7+7SpygtwlAhQs31VR+UFxp7D/UE+B1ulET5vwAvj4mBhSuLpsXEaP4rEzSR06DtKV7LUUELVFnmpXzdIN40d+nw4+mzTNQzFUKN4lmhHBmyEG7js5i/fa3t+VzHIjMchXBxtNy7+/t329udqp+im+9/vEwFNcGj6z16ICY5NAHdtSoJ0GvY3lfh8f5TOtbVm8hw4wfxOI2Ym6qW9EAY0pAkQ86KdqlGhamz/Lt586hDUl3zjs5cOeXIJcu/y5fgGHOYITseoNqwunFrJrlsmv9b86bXPhjUy8h1k1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTI/RhfswTFVxUtRINx3dMmG/Vwti51XV+W+AhcDiO8=;
 b=vhvn3pOuyt/Bhn2xwlmAzyfdVANqaU9r9h8dayAR063DTmxBHTTSgjgH71XuU55Qngw8f8lg9nrrEGpblpr7qxRXyk48+6x7pH+sQkTECplcRB8j7ZMH+QR4iL/mv7gdCejn6RRZb6FweFcFDirz8vaoV4g8F4Y+tXmKu4tqXHs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5432.eurprd08.prod.outlook.com (2603:10a6:20b:10b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Thu, 7 May
 2020 07:22:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::acfa:5:88c8:b7b9]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::acfa:5:88c8:b7b9%3]) with mapi id 15.20.2958.034; Thu, 7 May 2020
 07:22:17 +0000
Subject: Re: [PATCH 1/8] block/vdi: return ZERO block-status when appropriate
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20200506092513.20904-1-vsementsov@virtuozzo.com>
 <20200506092513.20904-2-vsementsov@virtuozzo.com>
 <496d65c2-ae7b-7456-532a-9acc90d1f926@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Tagtoolbar-Keys: D20200507102216024
Message-ID: <7479123c-ed70-6909-6d92-3bc307cdba73@virtuozzo.com>
Date: Thu, 7 May 2020 10:22:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <496d65c2-ae7b-7456-532a-9acc90d1f926@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0P190CA0014.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.2] (185.215.60.171) by
 AM0P190CA0014.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.29 via Frontend Transport; Thu, 7 May 2020 07:22:17 +0000
X-Tagtoolbar-Keys: D20200507102216024
X-Originating-IP: [185.215.60.171]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55e5e14f-9b11-4f4d-6455-08d7f2575fa9
X-MS-TrafficTypeDiagnostic: AM7PR08MB5432:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5432D52FCDF80C5F5BC6EA47C1A50@AM7PR08MB5432.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oU9USvVl89MBPW5ipCSnr7q0NK5NXWfzqSoFGOzaposk7j76I6uPuJn2rJ/1PHQ8KuikOeL9JZaN//SklgHGg/sz5zDudZITkd1UqhR+gjQr1rF6E4X9OpyZzM3KwgbmBWqFTLHJjOn/XEfeW3LM7JtwrZlslY3CVZWNGyuDSSZSZTGCKEDG//uX6hN0Aby9HRuLMS25/pDa+DnQPq2hSRisqBANZQPTYzX1QDj3sAtTqBisM3YhIHdCPJI/bpipuRivMMQqVWXwxj92RpeXp2bg4MdH43WTVJsFVIkupODYuicoXBJLMi/JPb4E5FVOufXWQ5PZLv+ECL4a34MloM+G0QEscU7+dmt3IM6B3/GzrS3o/geL/0L57joPW/qdJENzk218WfPJlmLkHPU2TnmrLjyRpfmze88fbnUYfbhXi+z7XX3Up35Xr1PtbDmkjIIODxI8SUvKe68TV1oqjh1AFkbQTuwecUYe1EMfF2KOlE4dD4gPc0zVY7EX+mWNY2zpXLtpcZ85yKt7cxjeTTSB7lbVEl1rqKnSbaxsV6nyGFx5bEI7fPYezccVIGNm58YKY31XInumU2NT+06pNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(136003)(346002)(366004)(396003)(39850400004)(33430700001)(5660300002)(66946007)(66556008)(66476007)(478600001)(7416002)(316002)(83300400001)(83290400001)(83310400001)(83320400001)(8676002)(36756003)(2906002)(16576012)(83280400001)(956004)(2616005)(31696002)(186003)(52116002)(26005)(86362001)(6486002)(8936002)(53546011)(4326008)(33440700001)(16526019)(31686004)(60764002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: NVD31StDJjr8fxizUCY9lOsP8cP/KvNFEWfez/yv3PqTFiEHwD6Msr7JYjZcCt/56cQWD10IVtA7YNCeKo1mPLIBuXYrJhVJMmWLNdmCYe/EbbKr78LUwVlEY7AJyeMDaENjhtUcSMfh1BfT8pxSBPqaPmoSSqRvjVfAk74QZ8lHKsEwqiYKIpZ2/WTDioOL1FGcB2K9Kyx1/R5y+YG0gR//O1Oc4vrmWRt4XTXCr7BWdVkCMitEOyPvrmlwLtC0SB56YLES1cIGLOdgnPEvWByZ3kkM2es9T0kCd3hB546D8fURjRD27T0zHpFFCcPzyz9RnzAcUzbDEZ79mS6ZReF6f701ZN1vzjgb8V16GKswovvGhe30VVR+su1UrVpFGCzIe9VRYtxIWAPnn6H2gl/RR/7jsZ4HPoZ7KFgHQs9vBBi7djQZzc/jBr9Mgk6TMktf5Xxl/VB/DCoEWDXKm/xVdlUUgV3LZ/HNGY5ucKbLW5vnIqmS0qxQ8utakW+WKa4F/MPko9vMGA8joOWef/Z5oPSoAYRo5e3aHL1NuYznHJBN6njOABLthbIgJpiRSKaopBXKfyFHKZgP7iwmHaE+9jfHN1ZrsK2QvQdXq2uMfMAHDgQPysimaq67y10pQBGFIxqB6a99amrmmtVihD9MEeDGYuBwiw87FyssOLq8j5/CR5fuv59A7+B502b5O+UJmeDuYo3Yu2VpGq6VwQgkeQeClR95pRh4PTNDsfIl8BxrwP8FDtejRiSS0Wntici0XRJ2b8XOGPoSVBHj5YQzTC206X9Ox/hoH4X6WC0=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e5e14f-9b11-4f4d-6455-08d7f2575fa9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 07:22:17.8203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t+aReADKlMb1vKmVJuBLLsvcwlHHBHHknLm2f1IcM0usOL1EjKQvBQm4MjbOxGE6SSv4bfwdPS4bHXSJ7UX+6XJiAd2w6WsnAkS8Mg5ONGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5432
Received-SPF: pass client-ip=40.107.6.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 03:22:19
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001, T_DKIM_INVALID=0.01,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: fam@euphon.net, kwolf@redhat.com, ronniesahlberg@gmail.com,
 codyprime@gmail.com, sw@weilnetz.de, pl@kamp.de, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com, pbonzini@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

06.05.2020 16:57, Eric Blake wrote:
> On 5/6/20 4:25 AM, Vladimir Sementsov-Ogievskiy wrote:
>> In case of !VDI_IS_ALLOCATED[], we do zero out the corresponding chunk
>> of qiov. So, this should be reported as ZERO.
> 
> This part makes sense outright, since vdi does not allow backing files, so all reads of a VDI disk result in data rather than deferral to another layer, and we indeed read zero in this case.� However, it _is_ a behavior change: previously, 'qemu-io -c map' on a vdi image will show unallocated portions, but with this change, the entire image now shows as allocated.� You need to call out this fact in the commit message, documenting that it is intentional (it matches what we do for posix files

posix is bad example, as we do have protocol drivers which may return 0 block-status for purpose: it means not go-to-backing but fs-unallocated-non-zero (iscsi is an example of it). And we need to split these meanings I think, but it's a task for another series.

>: since neither files nor vdi support backing images, we guarantee that all read attempts will be satisfied by this layer rather than deferring to a backing layer, and thus can treat all data as allocated in this layer, regardless of whether it is sparse).
> 
> Do any existing iotests need an update to reflect change in output?� If not, should we have an iotest covering it?
> 
>>
>> After block-status update, it never reports 0, so setting
>> unallocated_blocks_are_zero doesn't make sense. Drop it.
> 
> This is a harder claim. To prove it, we need to inspect all callers that use unallocated_blocks_are_zero, to see their intent.� Fortunately, the list is small - a mere 2 clients!
> 
> block/io.c:bdrv_co_block_status(): if .bdrv_co_block_status sets either _DATA or _ZERO, block status adds _ALLOCATED; but if the driver did not set either, we use bdrv_unallocated_blocks_are_zero() in order to set _ZERO but not _ALLOCATED.� This is the code that explains the behavior change mentioned above (now that vdi is reporting _ZERO instead of 0, block_status is appending _ALLOCATED instead of querying bdrv_unallocated_blocks_are_zero).� But you are correct that it does not change where _ZERO is reported.
> 
> qemu-img.c:img_convert(): calls bdrv_get_info() up front and caches what it learned from unallocated_blocks_are_zero about the target; later on, in convert_iteration_sectors(), it uses this information to optimize the case where the source reads as zero, but the target has a backing file and the range being written lies beyond the end of the backing file. That is, given the following scenario:
> 
> qemu-img convert input -B backing output
> input:�� ABCD-0E
> backing: ACBD
> 
> the optimization lets us produce:
> output:� -BC---E
> 
> instead of the larger:
> output:� -BC--0E
> 
> Do we have any iotests that cover this particular scenario, to prove that our optimization does indeed result in a smaller image file without explicit zeros written in the tail?� Or put another way, if we were to disable the post_backing_zero optimization in convert_iteration_sectors(), would any iotests fail?� If not, we should really enhance our testsuite.
> 
> With that said, we could just as easily achieve the optimization of the conversion to the tail of a destination with short backing file by checking block_status to see whether the tail already reads as all zeroes, rather than relying on unallocated_blocks_are_zero.� Even if querying block_status is a slight pessimization in time, it would avoid regressing in the more important factor of artificially bloating the destination.� I would _really_ love to see a patch to qemu-img.c reworking the logic to avoid the use of unallocated_blocks_are_zero first, prior to removing the setting of that field in the various drivers.� Once bdrv_co_block_status() remains as the only client of the field, then I could accept this patch with a better commit message about the intentional change in block_status _ALLOCATION behavior.
> 
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>> � block/vdi.c | 3 +--
>> � 1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/block/vdi.c b/block/vdi.c
>> index 0c7835ae70..83471528d2 100644
>> --- a/block/vdi.c
>> +++ b/block/vdi.c
>> @@ -334,7 +334,6 @@ static int vdi_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
>> ����� logout("\n");
>> ����� bdi->cluster_size = s->block_size;
>> ����� bdi->vm_state_offset = 0;
>> -��� bdi->unallocated_blocks_are_zero = true;
>> ����� return 0;
>> � }
>> @@ -536,7 +535,7 @@ static int coroutine_fn vdi_co_block_status(BlockDriverState *bs,
>> ����� *pnum = MIN(s->block_size - index_in_block, bytes);
>> ����� result = VDI_IS_ALLOCATED(bmap_entry);
>> ����� if (!result) {
>> -������� return 0;
>> +������� return BDRV_BLOCK_ZERO;
>> ����� }
>> ����� *map = s->header.offset_data + (uint64_t)bmap_entry * s->block_size +
>>
> 


-- 
Best regards,
Vladimir

