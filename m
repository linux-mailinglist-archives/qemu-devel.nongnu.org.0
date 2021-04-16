Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3E036200A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 14:44:20 +0200 (CEST)
Received: from localhost ([::1]:57426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXNpb-00072x-7w
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 08:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lXNnj-0006Ho-NU
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 08:42:23 -0400
Received: from mail-db8eur05on2122.outbound.protection.outlook.com
 ([40.107.20.122]:43121 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lXNnf-0001Hp-9T
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 08:42:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awo6m/D2il7G1EGpXsdfIHIVlVTTVl7nLoV5KzRnG0mz41C7bXIrjJFhgN4RR/4XGXnX0UJUeQp5nFZe+1ms5uGNZsdhyjeKz0sDq6CmTTwihAOkmMRBdXyFVZm773xBmQRTuclk5CMzHeangbibJDdDhRAngSKoYXiekHwYONgX1tSRrG+6EqL6f08FYzct2hDl/SrYupd/R+FS6rVXzHff/zVDSf9RROtmukd3+mX6LRQ8kGfMLoUkRWfAJzCiPDrYwb2yHyGAEW7G1Nf/eEwTmquLhcQy8EtUGDTpo3g3mep9swP2leHJoeXJRp9nE1zQlmc4rPnVGVrsSRuL+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6K4nbPFnjH3VUyc+BsRJnBEE55UtitXTS1czcZtSLM=;
 b=b7YZwBBOC1r0lOtxt1Fpxy7nnuqPXssE85k3Cu4uq+3NhRrXe9GeXI38fFg1rV6zp6dr9gJW+tYitoB9QtUYPv13/x7VSFdJFI1QJIzxfLnG28q/c4wIR67AFE7ykCzpatyteOfI/p3UdN9p7/L4a2Q7LKaeHBdTZ8g1ppfU1jjz8b0SWQyprtlV+GECKOZBINkrCnMf0quTDqYNUlvUYudylYFWygYqsaC5rq4OhzAeeuR6U9Xpr/lDiY53r7nQGsZO9Wev/V3d0xvmRg3HwtTgFkw0M/mlLpOC/UocQy+P9THiigWuyKHojsnfznKOFUPykQaan5kfjXv0Zs7UAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6K4nbPFnjH3VUyc+BsRJnBEE55UtitXTS1czcZtSLM=;
 b=th0u543QTuLvavXDDQclyW+XPseTcsTy70VhzsoxCGZDz9wG5d353XFHDHRl5Kr7BNEaUYUHXRo6YG5UcJqFetOounvT9RCnEOzzSFyesH0of5fT/a6UaqHcgb7JOPLyX5KVPGgrF//YjU5xkZO9E1EvbMrJUsxDmy1vfMqJ0OM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM0PR08MB4433.eurprd08.prod.outlook.com (2603:10a6:208:13b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Fri, 16 Apr
 2021 12:27:10 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::d4d5:1c34:eadb:ca42]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::d4d5:1c34:eadb:ca42%4]) with mapi id 15.20.4020.022; Fri, 16 Apr 2021
 12:27:10 +0000
Subject: Re: [RFC PATCH 0/9] migration/snap-tool: External snapshot utility
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210317163222.182609-1-andrey.gruzdev@virtuozzo.com>
 <20210415235032.GS4440@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <7a9f8bbd-01f9-f7fe-76ee-12a17b5861e0@virtuozzo.com>
Date: Fri, 16 Apr 2021 15:27:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
In-Reply-To: <20210415235032.GS4440@xz-x1>
Content-Type: multipart/alternative;
 boundary="------------EDA78BD7D07424FF733B5238"
Content-Language: en-US
X-Originating-IP: [109.252.109.82]
X-ClientProxiedBy: PR0P264CA0095.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::35) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.3] (109.252.109.82) by
 PR0P264CA0095.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 12:27:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c10181ad-c5bb-4439-8ae5-08d900d2f4e5
X-MS-TrafficTypeDiagnostic: AM0PR08MB4433:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB4433979323C4BEA1F0966C739F4C9@AM0PR08MB4433.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RVxPD2bLlWuDLfLCCKtLxkPcP/wSdJ0annFtuU30PLl1ReTQ8Ihy3bzCOV7i/XCB2XOC/ZdqNyEZZ9J4T3xGeHqw5n7OSDA3Rm+mK/b4jGFgLqkFObPPCl2Dvs1DAG6Wi1uxomc3CTZt1rc2auT/G5s3aDiaF7TstFHohImZaDKfwW7XVxU9vgxSaH2+p5bN/MQpzDtoy+HVyOZ3WA8SmjraTiwFHgFaQIa3t1f9Riq3KUR8vNxeBOHXEoWv1ue1eN3cJEA2MfdYtpImVCAMn2IpqejI9kgLjWzG3FY90XL7YkQ/3WtAEH34nuXUzOnSaAG5/n2JPLU/tPUqq6XM62n59LALlyQkFU8GhK6ROobcIbToKR+JcOSX70vNtXus8Yd6RVDTjyPVM+VlOM6uUJLrwQ5jyB3W8/J+xqofe4Jw1Ef5ZXNse0JtPBmM+UuWZGlVOLcX/4vj9wkzB8Xg0KLbW1e0m4GW22v3z/ZdLmGW/phR2BSTuj8nknN1lvhLwH2PmsMoHwb7VxgMDly/ns5hKSNd+ISYk1t+SJrVu0oL+SRhXszY7F3SlmLSwZ2eNupVs+dvqlc0XCcdSkpcyg+ZzMv2jCf8Cfa7197YZ8whka8Cg5tc1jvzIqfnNDHw6m+f6oYx61YwTn3M6gNarDQMzLVlSOXEzTfFgTiNZ9/jdUhNRpENf8R0D8f3O/Kwx84RHV3G1OgnZhqgMNRacw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(396003)(136003)(346002)(366004)(4326008)(53546011)(8936002)(16576012)(66476007)(66556008)(8676002)(44832011)(26005)(16526019)(5660300002)(66946007)(31696002)(52116002)(30864003)(478600001)(38350700002)(86362001)(6916009)(316002)(36756003)(2906002)(54906003)(33964004)(956004)(2616005)(83380400001)(186003)(6486002)(31686004)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UG81QWRSUHh0aXZwMEkxb0dDMkFaa1hBTW03MENxSTBsUFZSVlBRN3FpZ0ww?=
 =?utf-8?B?SFRJeHMwS1k1WThpRFlLZ0loMGQyWS93OUQ0a3paUjE0QUdmM1o1anRXZW9k?=
 =?utf-8?B?Vzk3V1kxbHBKWFJoeEdLc1daeUx5ZkFKQkN2eGRneVorWVdERjV1NXlCUVVV?=
 =?utf-8?B?bWpaVlBxeUVSdThJNFZRQzE0bWdQWjZjeGFZeGtidmFmNFFSaUVSU3VYTVZ0?=
 =?utf-8?B?akdTNjlTSEovSTZLSDlnWTVlSTZlNHc2QlFpMWo0aXJtcjM2SkY2aDR6UXhR?=
 =?utf-8?B?YlNKK205TlVKSy82czRKUTc4VmtxN0Z2UFFnWS9pckdTT1A3QjB4WlNXbm5S?=
 =?utf-8?B?eFE3ZUQrY1pqVDZIK1h6alBKa2pjMldzSS9reFdHUVgxT2Z0K1k0TGVSMnIv?=
 =?utf-8?B?VHpSamw0a2thekpkMUMxQ2tRWEdrYVNkWm1UQkxsdWluOE5sc2N1Qnoxb0or?=
 =?utf-8?B?c0FIL3BYOGNMSGx5NU00N0dJY0ZHdWc1MVh4dG5lR3F2MHlMSTRzZmFlZitm?=
 =?utf-8?B?NzF4UkU4QnBXOE4vU0pWNVVxWlVsN3c1S1JTWjR6TkpmeCt1R2padlFIV2lQ?=
 =?utf-8?B?OHlXRjJHM3VkR1BNNEp2Y0RaRS8wbHFVTHlXWWp6clJxbmNVSG9lUlkvMmlE?=
 =?utf-8?B?YU9MSVR1NWxPVUZFcTdlVVhGQ3VxQzRzcTRwWFkvV1pkRThGbkcwZ290RlRN?=
 =?utf-8?B?WWtnNlB2TjVBYlZtcGlXUTJNRkFjRFQ4NGhDbVIwRFZLU010RDdvL3hnY0lD?=
 =?utf-8?B?emljZGs3bmxHNjhaSVJHU3R6U0dGY2UzWGdqZHlrcG50TExXTU1EdFB5c0RJ?=
 =?utf-8?B?NEMvRTdzRUZiQmJra2ZQdUIvZmQzTmFtZkowYmZCZ1RjSFB4RmhVOWVEcWVx?=
 =?utf-8?B?V214bmlJNHZyRVIzSGpXYmdZQWdrRWRpRnI4Zi9MRm8xUWM4KzdDOEY0ZEFD?=
 =?utf-8?B?R0VURlN2Q2pKSUh0WDFKWTRrbzRSamJqMDN6QWpid2VWbnNtQVowQzRtMVNz?=
 =?utf-8?B?amtVcXdmWFR6NStEZHZRZUpKTE9JRWUvUnY2UEdIUTQrblRWa0VzckkrcU9G?=
 =?utf-8?B?bWwxZUt2alpOQXBSTWZScW9lU1RnYWxqZ1dxd3JOclFGVkIrdW5SYytadVhZ?=
 =?utf-8?B?eU01d3dOL1p4WG5zeGtqN2tBT01oMmJ5ZHdCNW1GRVduNGRMbWVOZnZwOEpu?=
 =?utf-8?B?YWdPYlJrTWlLWmdHckNnUHUralZvdFdHaTFVOU02RHp1NGlSdEl2eHlwVnJC?=
 =?utf-8?B?Zkh4U29LcWNUMkN6OFBsZWRFRTh0RllSdExRTlRYM01ycXEzelJNY052dkdV?=
 =?utf-8?B?MExoYWxqR1JCRFkrbnBQem5hR0lOcnJPd0l2Mk1IN296TTdIeEpDT2NJMUl1?=
 =?utf-8?B?QlJiS0s1anc4NzcvTXF5dzRuM3RXbElNd2wycWVESUZDVm1ia3hpbEt4VlZ6?=
 =?utf-8?B?VFZvc2JPSk56cGZzYUJtK1ZtaWNQcVNkM3laVS96Zm5JNlp3enJvMUdRZnhV?=
 =?utf-8?B?RnQ2M0FNQzY5QVhaY1QvODU0MEFWQml4V2IvNmQ5SiszRUhpbFNqRHQ0di9E?=
 =?utf-8?B?ZjNEZUQwRW9RcERYQlFuMklNT1A0VzlIRDRROFZPcmpETDZJVGlmM3ltYXU3?=
 =?utf-8?B?d21RN2xUR2tFc3JZL3lBTDlabDhWanNLVitkbzBnK1BUTGliRC95UWdHYkZU?=
 =?utf-8?B?S3hlOXZ1aXRoMnJQclVGdjRrSGl4ZGRJU2IrbGZWT3lpc0czOVlFUWdWdFFV?=
 =?utf-8?Q?IH9b8qgd8agogrzYO95rPzfHCe+rT2dD7ZoM4yN?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c10181ad-c5bb-4439-8ae5-08d900d2f4e5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 12:27:10.3430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rmn0crOXrVd4EpV+QRXEdhd+HNYrgZ/ig8spD8gFGL0shv7Rsm2iDZq7Ji6MDSWEEjbAhUgEOIFcs1xmacTbPHxvIhFIPjNovi07Kn2jR7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4433
Received-SPF: pass client-ip=40.107.20.122;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--------------EDA78BD7D07424FF733B5238
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.04.2021 02:50, Peter Xu wrote:
> On Wed, Mar 17, 2021 at 07:32:13PM +0300, Andrey Gruzdev wrote:
>> This series is a kind of PoC for asynchronous snapshot reverting. This is
>> about external snapshots only and doesn't involve block devices. Thus, it's
>> mainly intended to be used with the new 'background-snapshot' migration
>> capability and otherwise standard QEMU migration mechanism.
>>
>> The major ideas behind this first version were:
>>    * Make it compatible with 'exec:'-style migration - options can be create
>>      some separate tool or integrate into qemu-system.
>>    * Support asynchronous revert stage by using unaltered postcopy logic
>>      at destination. To do this, we should be capable of saving RAM pages
>>      so that any particular page can be directly addressed by it's block ID
>>      and page offset. Possible solutions here seem to be:
>>        use separate index (and storing it somewhere)
>>        create sparse file on host FS and address pages with file offset
>>        use QCOW2 (or other) image container with inherent sparsity support
>>    * Make snapshot image file dense on the host FS so we don't depend on
>>      copy/backup tools and how they deal with sparse files. Off course,
>>      there's some performance cost for this choice.
>>    * Make the code which is parsing unstructered format of migration stream,
>>      at least, not very sophisticated. Also, try to have minimum dependencies
>>      on QEMU migration code, both RAM and device.
>>    * Try to keep page save latencies small while not degrading migration
>>      bandwidth too much.
>>
>> For this first version I decided not to integrate into main QEMU code but
>> create a separate tool. The main reason is that there's not too much migration
>> code that is target-specific and can be used in it's unmodified form. Also,
>> it's still not very clear how to make 'qemu-system' integration in terms of
>> command-line (or monitor/QMP?) interface extension.
>>
>> For the storage format, QCOW2 as a container and large (1MB) cluster size seem
>> to be an optimal choice. Larger cluster is beneficial for performance particularly
>> in the case when image preallocation is disabled. Such cluster size does not result
>> in too high internal fragmentation level (~10% of space waste in most cases) yet
>> allows to reduce significantly the number of expensive cluster allocations.
>>
>> A bit tricky part is dispatching QEMU migration stream cause it is mostly
>> unstructered and depends on configuration parameters like 'send-configuration'
>> and 'send-section-footer'. But, for the case with default values in migration
>> globals it seems that implemented dispatching code works well and won't have
>> compatibility issues in a reasonably long time frame.
>>
>> I decided to keep RAM save path synchronous, anyhow it's better to use writeback
>> cache mode for the live snapshots cause of it's interleaving page address pattern.
>> Page coalescing buffer is used to merge contiguous pages to optimize block layer
>> writes.
>>
>> Since for snapshot loading opening image file in cached mode would not do any good,
>> it implies that Linux native AIO and O_DIRECT mode is used in a common scenario.
>> AIO support in RAM loading path is implemented by using a ring of preallocated
>> fixed-sized buffers in such a way that there's always a number of outstanding block
>> requests anytime. It also ensures in-order request completion.
>>
>> How to use:
>>
>> **Save:**
>> * qemu> migrate_set_capability background-snapshot on
>> * qemu> migrate "exec:<qemu-bin-path>/qemu-snap -s <virtual-size>
>>             --cache=writeback --aio=threads save <image-file.qcow2>"
>>
>> **Load:**
>> * Use 'qemu-system-* -incoming defer'
>> * qemu> migrate_incoming "exec:<qemu-bin-path>/qemu-snap
>>            --cache=none --aio=native load <image-file.qcow2>"
>>
>> **Load with postcopy:**
>> * Use 'qemu-system-* -incoming defer'
>> * qemu> migrate_set_capability postcopy-ram on
>> * qemu> migrate_incoming "exec:<qemu-bin-path>/qemu-snap --postcopy=60
>>            --cache=none --aio=native load <image-file.qcow2>"
>>
>> And yes, asynchronous revert works well only with SSD, not with rotational disk..
>>
>> Some performance stats:
>> * SATA SSD drive with ~500/450 MB/s sequantial read/write and ~60K IOPS max.
>> * 220 MB/s average save rate (depends on workload)
>> * 440 MB/s average load rate in precopy
>> * 260 MB/s average load rate in postcopy
> Andrey,
>
> Before I try to read it (since I'm probably not the best person to review
> it..).. Would you remind me on the major difference of external snapshots
> comparing to the existing one, and problems to solve?
>
> Thanks,
>
Hi Peter,

For the external snapshots - the difference (compared to internal) is that snapshot
data is going to storage objects which are not part VM config. I mean that for internal
snapshots we use configured storage of the VM instance to store both vm state and blockdev
snapshot data. The opposite is for external snapshots when we save vmstate and blockdev
snapshots to separate files on the host. Also external snapshots are not managed by QEMU.

One of the problems is that the vmstate part of external snapshot is essentially the
migration stream which is schema-less and it's structure is dependent on QEMU target.
That means that currently we can do a revert-to-snapshot operation with the sequence of
QMP commands but we can do that only in a synchronous way, i.e. vcpus can't be started
until all of the vmstate data has been transferred. The reason for this synchronous
behavior is that we cannot locate arbitrary RAM page in raw migration stream if we start
vcpus early and get faults for the pages that are missing on destination vm.

So the major goal of this PoC is to demonstrate asynchronous snapshot reverting in QEMU
while keeping migration code mostly unchanged. To do that we need to split migration stream
into two parts, particularly these parts are RAM pages and the rest of vmstate. And then,
if we can do this, RAM pages can be dispatched directly to a block device with block offsets
deduced from page GPAs.


-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------EDA78BD7D07424FF733B5238
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 16.04.2021 02:50, Peter Xu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210415235032.GS4440@xz-x1">
      <pre class="moz-quote-pre" wrap="">On Wed, Mar 17, 2021 at 07:32:13PM +0300, Andrey Gruzdev wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This series is a kind of PoC for asynchronous snapshot reverting. This is
about external snapshots only and doesn't involve block devices. Thus, it's
mainly intended to be used with the new 'background-snapshot' migration
capability and otherwise standard QEMU migration mechanism.

The major ideas behind this first version were:
  * Make it compatible with 'exec:'-style migration - options can be create
    some separate tool or integrate into qemu-system.
  * Support asynchronous revert stage by using unaltered postcopy logic
    at destination. To do this, we should be capable of saving RAM pages
    so that any particular page can be directly addressed by it's block ID
    and page offset. Possible solutions here seem to be:
      use separate index (and storing it somewhere)
      create sparse file on host FS and address pages with file offset
      use QCOW2 (or other) image container with inherent sparsity support
  * Make snapshot image file dense on the host FS so we don't depend on
    copy/backup tools and how they deal with sparse files. Off course,
    there's some performance cost for this choice.
  * Make the code which is parsing unstructered format of migration stream,
    at least, not very sophisticated. Also, try to have minimum dependencies
    on QEMU migration code, both RAM and device.
  * Try to keep page save latencies small while not degrading migration
    bandwidth too much.

For this first version I decided not to integrate into main QEMU code but
create a separate tool. The main reason is that there's not too much migration
code that is target-specific and can be used in it's unmodified form. Also,
it's still not very clear how to make 'qemu-system' integration in terms of
command-line (or monitor/QMP?) interface extension.

For the storage format, QCOW2 as a container and large (1MB) cluster size seem
to be an optimal choice. Larger cluster is beneficial for performance particularly
in the case when image preallocation is disabled. Such cluster size does not result
in too high internal fragmentation level (~10% of space waste in most cases) yet
allows to reduce significantly the number of expensive cluster allocations.

A bit tricky part is dispatching QEMU migration stream cause it is mostly
unstructered and depends on configuration parameters like 'send-configuration'
and 'send-section-footer'. But, for the case with default values in migration
globals it seems that implemented dispatching code works well and won't have
compatibility issues in a reasonably long time frame.

I decided to keep RAM save path synchronous, anyhow it's better to use writeback
cache mode for the live snapshots cause of it's interleaving page address pattern.
Page coalescing buffer is used to merge contiguous pages to optimize block layer
writes.

Since for snapshot loading opening image file in cached mode would not do any good,
it implies that Linux native AIO and O_DIRECT mode is used in a common scenario.
AIO support in RAM loading path is implemented by using a ring of preallocated
fixed-sized buffers in such a way that there's always a number of outstanding block
requests anytime. It also ensures in-order request completion.

How to use:

**Save:**
* qemu&gt; migrate_set_capability background-snapshot on
* qemu&gt; migrate &quot;exec:&lt;qemu-bin-path&gt;/qemu-snap -s &lt;virtual-size&gt;
           --cache=writeback --aio=threads save &lt;image-file.qcow2&gt;&quot;

**Load:**
* Use 'qemu-system-* -incoming defer'
* qemu&gt; migrate_incoming &quot;exec:&lt;qemu-bin-path&gt;/qemu-snap
          --cache=none --aio=native load &lt;image-file.qcow2&gt;&quot;

**Load with postcopy:**
* Use 'qemu-system-* -incoming defer'
* qemu&gt; migrate_set_capability postcopy-ram on
* qemu&gt; migrate_incoming &quot;exec:&lt;qemu-bin-path&gt;/qemu-snap --postcopy=60
          --cache=none --aio=native load &lt;image-file.qcow2&gt;&quot;

And yes, asynchronous revert works well only with SSD, not with rotational disk..

Some performance stats:
* SATA SSD drive with ~500/450 MB/s sequantial read/write and ~60K IOPS max.
* 220 MB/s average save rate (depends on workload)
* 440 MB/s average load rate in precopy
* 260 MB/s average load rate in postcopy
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Andrey,

Before I try to read it (since I'm probably not the best person to review
it..).. Would you remind me on the major difference of external snapshots
comparing to the existing one, and problems to solve?

Thanks,

</pre>
    </blockquote>
    <pre>Hi Peter,

For the external snapshots - the difference (compared to internal) is that snapshot
data is going to storage objects which are not part VM config. I mean that for internal
snapshots we use configured storage of the VM instance to store both vm state and blockdev
snapshot data. The opposite is for external snapshots when we save vmstate and blockdev
snapshots to separate files on the host. Also external snapshots are not managed by QEMU.

One of the problems is that the vmstate part of external snapshot is essentially the
migration stream which is schema-less and it's structure is dependent on QEMU target.
That means that currently we can do a revert-to-snapshot operation with the sequence of
QMP commands but we can do that only in a synchronous way, i.e. vcpus can't be started
until all of the vmstate data has been transferred. The reason for this synchronous
behavior is that we cannot locate arbitrary RAM page in raw migration stream if we start
vcpus early and get faults for the pages that are missing on destination vm.

So the major goal of this PoC is to demonstrate asynchronous snapshot reverting in QEMU
while keeping migration code mostly unchanged. To do that we need to split migration stream
into two parts, particularly these parts are RAM pages and the rest of vmstate. And then,
if we can do this, RAM pages can be dispatched directly to a block device with block offsets
deduced from page GPAs.
</pre>
    <br>
    <pre class="moz-signature" cols="72">-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com</pre>
  </body>
</html>

--------------EDA78BD7D07424FF733B5238--

