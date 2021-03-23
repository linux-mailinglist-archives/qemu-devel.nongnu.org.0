Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2C2346797
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:27:45 +0100 (CET)
Received: from localhost ([::1]:52292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlkm-00015c-63
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lOkj5-0004ol-8r
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:21:55 -0400
Received: from mail-eopbgr20132.outbound.protection.outlook.com
 ([40.107.2.132]:53569 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lOkj1-0000u3-Io
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:21:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGEBDc7rmdVhDbmmAyVcz6e6BD2bNaCZZc76F8mvQBagKWr7vMUluxZMTckDK4vV374o78cTQZbH7dBMGGft6tQB6F77+eonpvzbG9VC+qbFe0134TSwjjVvMCMfb7JDbG33E8wv5Ysaw3ZlXoS1acj3IAS70YqPxoYutRf7hoco1pnWvoYvuELqKhKEe9Hk03n5uMGLsFc4wX4S23Hb11fDfGuM4z6FpyQanG/q63sHTRJ0yMz7HAJ5AbWcB+TMnTLBOVyGR77WZYOISt7YWI76Xe3Scv/fy72UcHmM7Pn8dHgRr6ni0RlJP4AAXQvw6QmUL7pk8aXAxaSOToZRdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3b0EN1I8N79WlC6DTjqkvbsp5uqndCSFw3bOT7l/HvU=;
 b=MwNQGgXFZ0EUj8Rx87DmS5GMUO06NNWwbVfTGatJpfBLu74nc+ZJC36mcdZVvhpMpKK8PlzcFgdJmvfRn/zXWnNIeeHjpNC4NPZd0kh8E+SSJGIgZHIlSczIYmlxnykHA+2JgFX/o3mFW6+DZ32wxeJEx3ExlxXGlYQwBopZ/11v8/NJB4NWJkyVEcwsusSELBXu9LFsjwGPCLlAOyCv8A56VqkjjdAzhCvc2S7wEiny4IpWOigTSB0dvVmUeWVP283stgcjPkR5dc6dyPn+hmIkb2SNei1M88ZOIkZxv3BRHX1a6PbNlSldObw4vwsn1VmxcVipGKd15OU2xSWz8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3b0EN1I8N79WlC6DTjqkvbsp5uqndCSFw3bOT7l/HvU=;
 b=O4MsLmf8iPbU6oW1cup7ihS8/RUdAXSPJL4mcpTAtRzJJXM/ttLzVF+Tfl15i9yWMi2SEaXZ42cmC405KgzG76Fl4nC7rrPi6Jfl4Ik70/pwAwwC4m+0l28nyD4SgeyuhztAP2HGo9TpdrJ8k1RjebRWpSmlRpdB35ql/uO6xUo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM9PR08MB6050.eurprd08.prod.outlook.com (2603:10a6:20b:285::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 17:21:44 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b%6]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 17:21:44 +0000
Subject: Re: [PATCH v1 1/3] migration: Fix missing qemu_fflush() on buffer
 file in bg_migration_thread
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>
References: <20210319145249.425189-1-andrey.gruzdev@virtuozzo.com>
 <20210319145249.425189-2-andrey.gruzdev@virtuozzo.com>
 <20210322201716.GG16645@xz-x1>
 <2fb49f83-e31c-8c93-50b7-833026b06518@virtuozzo.com>
 <20210323145457.GC6486@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <9311f31b-298f-d235-45bd-0ed9d66f9468@virtuozzo.com>
Date: Tue, 23 Mar 2021 20:21:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
In-Reply-To: <20210323145457.GC6486@xz-x1>
Content-Type: multipart/alternative;
 boundary="------------1FBE36BF16998587DF66DB32"
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM8P191CA0024.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::29) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM8P191CA0024.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 17:21:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47794458-a697-4d37-6316-08d8ee2021d8
X-MS-TrafficTypeDiagnostic: AM9PR08MB6050:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR08MB6050B6F42E84E6301F3FFAC29F649@AM9PR08MB6050.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ig8GrWg01BMe5obpqse0jx0wJHkmy09JeJPOLPVgkYOQk9abnipICqnK1/ptf0KkTV9UZsRCXxtXvDM29YXS/fcLrq4zneyWlNBApDwqjFM7LgjXnNnGVJMPcpT4RqundvFqyyp6yeQQ56Trj/cPUopdiMiqy732Z0dQpq4uYYYzaHrBzrKtRZKwZApVR4zaQS5u0NqDYZNVl/QC11XeH6POHGZlFnRgM3ap0CmNMQ36BtufrU1HsOXU3x3SaoxMFPsWGrVTQXJ9Zi+Reo1bhlBKiosoZDgWmAvB4PqMV3HX77xF7cFuMKBag2qSy6maPGMrB+mVHy/6y5egee+sT1zJkDx/olQ5IkFwEJUH0y6TyjYlwHykX1hZGIP6vEEZcFei27RbJ1WCk/W5AyZwqWIph0TxPGAVALIx58LgllsnfgW7aUN5pDpqggELz7zqUiCsudNtCkL5OBowuMCwW6Y6D3HauWt/OCQATGtPj9+bmOj8y4yoynGyEIFiK8yKjbWrk9B4UIlanGGJrjSHkDThz5w/LEYz8wqHULHuJfOdUtrdUTZK9jvhilO3i/zn9zdIwzE7FNWRehAu3YVQOsqwStkl3qeXmOVREx+S+j2DsjTQX3YjqIVFApgC6VkNwUUFqxjkAilrcjPrx06B5sko6pRKesU5hfPu4J98tF8gkI+kOdFN1PVwqh35WPgOkNUjeALXoSG/XqPV8rNh7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(83380400001)(956004)(31686004)(33964004)(44832011)(8676002)(2616005)(66556008)(186003)(52116002)(66946007)(498600001)(66476007)(6486002)(26005)(16576012)(16526019)(6916009)(53546011)(86362001)(4326008)(31696002)(36756003)(2906002)(38100700001)(5660300002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SUFYWmZRRmZRQnJpQWo4WHljMWRPNHArQWx2MkM4azdERlg4ZkgvdyswTytQ?=
 =?utf-8?B?TmNQMWVKNVJqWGpvRmRxTllZbjZoOGxHamRBMDVLc0gybllDdzJSWWErMmdP?=
 =?utf-8?B?czZiRStZVFpGTVFVTnE0RzJqU1MrbXpxcG5MdUhsV2NsS050WmYxQ0dDUllM?=
 =?utf-8?B?M0UrM3dSdSt2Q21nenI0anNGMVc3SnZpUkZxc3lsZ211SDRPUll4UFRjZXVQ?=
 =?utf-8?B?U0VUcHNxM29SMG1za3RFWkVQMTZ5amNsdDdUcWNvdnUyYk5ONi9jVlJDRjdv?=
 =?utf-8?B?eklSdlVocjZPcTlZa2duNk82akdwQXdWWnNuZ2x1SVFrc05hdENvSS96VWIw?=
 =?utf-8?B?Wm41TDN4YlhVWEZoNFBaZVpnZm5nYzlyRGd2ZlZHTElRRWg1WklBQ0hxZDRm?=
 =?utf-8?B?WHprRHczaEZoM1F5eG5NazZQVEJtQ3N0TitvNEFmSWtDZEhXZVROUlJoWHlk?=
 =?utf-8?B?TEIvVm9UTk1YT2xwTU1uQmpUS285NWFFY0Q3MzNNdElrYkdrQVlqZWhiWHpX?=
 =?utf-8?B?cThsWHZTMm1VU1ExUzNLazl3Z2Z5UTRjd1dTeVd0eFNlN3BtUG10MWFKaW1v?=
 =?utf-8?B?SVVIOU5GMlBsUWJNUjN1T3dlSHRGZ2p3ZWFtYWt6SjhWekN6WjRNbXpoVzM3?=
 =?utf-8?B?MU5TeTVESGZmQkxmWW85Y0JCMlRnSTRHck5meWcva0NYcFNHU2VaRDdXais2?=
 =?utf-8?B?cWhIWEVBYW02NFhJZlNBdmZ1RDNtSXREOFlSRXo4bEdSMlFDRjVCeGVWRlVD?=
 =?utf-8?B?SkFDdFlrWFVZblp3TTlvWnJuYjRUSXV1bzI5SWNGYllmSE43MUVRckNJc1Yr?=
 =?utf-8?B?UGNlRXRuQUpFaU1yelJEc05sdlUrdWlPcVd5YzkvNFBINmZvYkcvQ1NJQlEz?=
 =?utf-8?B?VFBYM3kzOHh3UjVaU3MyaERJVXFBY3hycURrbXlQV3dUL2pSV29JQzB4MFVW?=
 =?utf-8?B?UUtXVTgrY2duVHpHVG1Fa2s0NDBuQjZxMVhtT0NrY0F6VjJMN1BlSGJ6RGFq?=
 =?utf-8?B?bFhLUk9tWEZtdG5Od2N6U0ZHZ055Mndsc01aMkg0cjR4NzRyempCZkdUbkwz?=
 =?utf-8?B?QXh3eURVcTJaSVNGYW9JMzBoUWVGdjIzU2p1c1pEM1pNMUlNQWY3UGt6dUtR?=
 =?utf-8?B?enpJeU9WRjdKMVhHOG1Bbmg4ckY2OEZETUwvbjZKSzhIOS9DT2lzN295TEpR?=
 =?utf-8?B?Z09FTjMrWldEdmk3WEdSblRGQUQzQlU1b3JnS1lGMzB6Y016RlVPc2p6L0ZW?=
 =?utf-8?B?NFF2ZlhWL1JuUGMvdlA2c0pWcXJZQXlDbjhLUjI1NmVyK205azJxMVBuaGNp?=
 =?utf-8?B?OHFJUFJQVFVHNnZxVGlhb2w2RnBqSVk0OUVabDh4WmtVT3VHQnRlc0ZjbDhL?=
 =?utf-8?B?MjZuMUVzZ0ZQcHNtaVNJaFYwSCtTaWFvMW5oN25OVTREQXZVMjkxZGZxblVM?=
 =?utf-8?B?T1YyUG14Y0hpa0dtMDhDUC9HYVhqL2RoZWxRUklYTlAzNHpBZGoyUm4zVXcy?=
 =?utf-8?B?YStpa3dSblpUMDlUSDVmMG9LL0tJd3owdGRMeldua0ZmYkRlMlNGY1NzNEJP?=
 =?utf-8?B?VFJlNkNEVDlyQkpkSlIvbUxSdUVkaHFBNHl0cXpTVTZoOXUxTUx4YU8wUjJp?=
 =?utf-8?B?Q3E0YlYxUTVqSmMwNzBuSVVSK0N6cVczN3g0MHF1YW55SkZUcDR0dWtIRzZj?=
 =?utf-8?B?aE9VbVBpK3FnS3pwK3gwRG5KVTQvUTFYbmc0NTIrU1U3WnpHc000bkI5T05h?=
 =?utf-8?Q?hinSMBxrNA5UyhfxAgnNv8OPe/eSYO/c5YaFN5/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47794458-a697-4d37-6316-08d8ee2021d8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 17:21:44.8237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gLtjamE/JezMVdSmDiP3PB6Q9rR2/zWuAP93BQLu6cBlPiZMh3JKBWeoUhBsk3PX2Pzs4ZMLIDIGjhq2Z43+ttn9xXTZ9GG+HRdD2tjX0pw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6050
Received-SPF: pass client-ip=40.107.2.132;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--------------1FBE36BF16998587DF66DB32
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.03.2021 17:54, Peter Xu wrote:
> On Tue, Mar 23, 2021 at 10:51:57AM +0300, Andrey Gruzdev wrote:
>> On 22.03.2021 23:17, Peter Xu wrote:
>>> On Fri, Mar 19, 2021 at 05:52:47PM +0300, Andrey Gruzdev wrote:
>>>> Added missing qemu_fflush() on buffer file holding precopy device state.
>>>> Increased initial QIOChannelBuffer allocation to 512KB to avoid reallocs.
>>>> Typical configurations often require >200KB for device state and VMDESC.
>>>>
>>>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>>>> ---
>>>>    migration/migration.c | 4 +++-
>>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/migration/migration.c b/migration/migration.c
>>>> index ca8b97baa5..32b48fe9f5 100644
>>>> --- a/migration/migration.c
>>>> +++ b/migration/migration.c
>>>> @@ -3812,7 +3812,7 @@ static void *bg_migration_thread(void *opaque)
>>>>         * with vCPUs running and, finally, write stashed non-RAM part of
>>>>         * the vmstate from the buffer to the migration stream.
>>>>         */
>>>> -    s->bioc = qio_channel_buffer_new(128 * 1024);
>>>> +    s->bioc = qio_channel_buffer_new(512 * 1024);
>>>>        qio_channel_set_name(QIO_CHANNEL(s->bioc), "vmstate-buffer");
>>>>        fb = qemu_fopen_channel_output(QIO_CHANNEL(s->bioc));
>>>>        object_unref(OBJECT(s->bioc));
>>>> @@ -3866,6 +3866,8 @@ static void *bg_migration_thread(void *opaque)
>>>>        if (qemu_savevm_state_complete_precopy_non_iterable(fb, false, false)) {
>>>>            goto fail;
>>>>        }
>>>> +    qemu_fflush(fb);
>>> What will happen if the vmstates are bigger than 512KB?  Would the extra data
>>> be dropped?
>> No, the buffer shall be reallocated and the original content shall be kept.
> Oh right..
>
> Would you comment above qemu_fflush() about it (maybe also move it right before
> the call to qemu_put_buffer)?  Otherwise it indeed looks more like an
> optimization rather than a bugfix.

Agree, better to have a comment here.

> For the long term I think we'd better have a helper:
>
>          qemu_put_qio_channel_buffer(QEMUFile *file, QIOChannelBuffer *bioc)
>
> So as to hide this flush operation, which is tricky. We'll have two users so
> far:
>
>          bg_migration_completion
>          colo_do_checkpoint_transaction
>
> IMHO it'll be nicer if you'd do it in this patch altogether!
>
> Thanks,
>
Sorry, can't get the idea, what's wrong with the fix.


--------------1FBE36BF16998587DF66DB32
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 23.03.2021 17:54, Peter Xu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210323145457.GC6486@xz-x1">
      <pre class="moz-quote-pre" wrap="">On Tue, Mar 23, 2021 at 10:51:57AM +0300, Andrey Gruzdev wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 22.03.2021 23:17, Peter Xu wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Fri, Mar 19, 2021 at 05:52:47PM +0300, Andrey Gruzdev wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Added missing qemu_fflush() on buffer file holding precopy device state.
Increased initial QIOChannelBuffer allocation to 512KB to avoid reallocs.
Typical configurations often require &gt;200KB for device state and VMDESC.

Signed-off-by: Andrey Gruzdev <a class="moz-txt-link-rfc2396E" href="mailto:andrey.gruzdev@virtuozzo.com">&lt;andrey.gruzdev@virtuozzo.com&gt;</a>
---
  migration/migration.c | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index ca8b97baa5..32b48fe9f5 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3812,7 +3812,7 @@ static void *bg_migration_thread(void *opaque)
       * with vCPUs running and, finally, write stashed non-RAM part of
       * the vmstate from the buffer to the migration stream.
       */
-    s-&gt;bioc = qio_channel_buffer_new(128 * 1024);
+    s-&gt;bioc = qio_channel_buffer_new(512 * 1024);
      qio_channel_set_name(QIO_CHANNEL(s-&gt;bioc), &quot;vmstate-buffer&quot;);
      fb = qemu_fopen_channel_output(QIO_CHANNEL(s-&gt;bioc));
      object_unref(OBJECT(s-&gt;bioc));
@@ -3866,6 +3866,8 @@ static void *bg_migration_thread(void *opaque)
      if (qemu_savevm_state_complete_precopy_non_iterable(fb, false, false)) {
          goto fail;
      }
+    qemu_fflush(fb);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">What will happen if the vmstates are bigger than 512KB?  Would the extra data
be dropped?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
No, the buffer shall be reallocated and the original content shall be kept.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Oh right..

Would you comment above qemu_fflush() about it (maybe also move it right before
the call to qemu_put_buffer)?  Otherwise it indeed looks more like an
optimization rather than a bugfix.
</pre>
    </blockquote>
    <pre>Agree, better to have a comment here.
</pre>
    <blockquote type="cite" cite="mid:20210323145457.GC6486@xz-x1">
      <pre class="moz-quote-pre" wrap="">
For the long term I think we'd better have a helper:

        qemu_put_qio_channel_buffer(QEMUFile *file, QIOChannelBuffer *bioc)

So as to hide this flush operation, which is tricky. We'll have two users so
far:

        bg_migration_completion
        colo_do_checkpoint_transaction

IMHO it'll be nicer if you'd do it in this patch altogether!

Thanks,

</pre>
    </blockquote>
    <pre>Sorry, can't get the idea, what's wrong with the fix.

</pre>
  </body>
</html>

--------------1FBE36BF16998587DF66DB32--

