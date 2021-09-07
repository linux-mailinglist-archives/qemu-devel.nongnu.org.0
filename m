Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06DE4027C7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 13:32:27 +0200 (CEST)
Received: from localhost ([::1]:34196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNZL0-0001oy-8a
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 07:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNZIh-0008QD-8T; Tue, 07 Sep 2021 07:30:03 -0400
Received: from mail-eopbgr60117.outbound.protection.outlook.com
 ([40.107.6.117]:44002 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNZIe-0003rL-O8; Tue, 07 Sep 2021 07:30:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYwwf7NBnUm+Ojj2lq84EGKgfUH5kVZFfYiktX3eXWLsPj30VWKlU5ByVOQpG3LHUeCNAriP+0EYSRKTc35XjSzbADsVcag4wxRYxXdcgVH5V7+a8Sub+gtWYqqAWxtFyqZ8W5Hb0hb2H/1tZ834MxcKdq6C9QWDJpl0DXY+Kz9ya+VADBKpYGnqC7ksUmeWbXsuVXKIFVcuzqRnWvjNJHblqpCTP30FnHSzaT0VMjaQs4pd8YoupZVkWabCtnRiP8JSosxBHPyDvKTJkD5YAdpQgoqSWLi+BXXay/xfPwmyPBAwC0eYKoNr9FIJRAW/Cl/dMce/jAcFuVk0nexqfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=cgRhR4pjBB0S2m5TiyYKCVHsYNyXNdT2HTQiJU/wQ+4=;
 b=PavPgPzoTzwI9HIzk9JacuLjxjK1U3PaSGAh/ndx790C3LoakWeQwwRU2m0is+hHuxpgslnjhVnI9mh78OZhMUAaceA3pe8uIrwbxpiLlLv0xKAfeNd/ksG2eJgbFh9A2kkQcxxjbzor8jFcJvqDL+JkeHVokHmgmX0SpzHH9wo0XwxfwTpM5bhkMJC4soyOEc8nnplQKocuGkVBYheJ9+OkSs58JPDjV8cITBO4nz/hXjIOn6QMscLQOQxVUpU3WkU5EGZ/IZmFYTXCWUyugcw7964uPr81d+RiLToBwvVhH5W1R1GU2NPVdI/HWOiGBzUN7hkdWyNM+UiPxCQh/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgRhR4pjBB0S2m5TiyYKCVHsYNyXNdT2HTQiJU/wQ+4=;
 b=jvzeU0cbgv/0+/qsMj+/6JwisIjYbXmU372KScM0wt+LIqykW5fsaxRkRRdOj76dkQ1EQA0hE+SfoFf/EwVagdG1FzXtUEY2bv76ijFtT4HeMNEjKpLtgMfF1ttmMgzkzPR9MgG2gaIjXnmmzk6IfPertM+hWrQN8EpVCqsbtdk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6805.eurprd08.prod.outlook.com (2603:10a6:20b:396::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Tue, 7 Sep
 2021 11:29:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 11:29:56 +0000
Subject: Re: [PATCH] qemu-img: Allow target be aligned to sector size
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210819101200.64235-1-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9cf39acf-38fd-3d2d-1750-439c630f0df5@virtuozzo.com>
Date: Tue, 7 Sep 2021 14:29:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210819101200.64235-1-hreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0277.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 PR0P264CA0277.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 11:29:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6aa7475-2596-4faa-51ea-08d971f2d16c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6805:
X-Microsoft-Antispam-PRVS: <AS8PR08MB68058D183BAC290C7AFF3F1CC1D39@AS8PR08MB6805.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +qbMbY94dO84HlrY3ZRpqyWBLvBtXy3Rf6CXP4kJBSGtlG2scXFPMIQJu4kQRBXmfUt61eLjdVd4RqYCgY4e3VTluz1vHl1MJ+tYdMDWDURPSpmBJWQTTSMhfpjkpx3VpAMNLf0FqNNw1XgeiDfpwFt77SXpFuPAuY01LD0Y9xySywYFOPa77s3cyUmnK6GriOCLEkgCxB3LltdL2dxe0kEmdRe213vLPp6TGV1iX+vadaytLOdDj1SdBw+l3FMKRe4M++ShESrM880mToiNERfWGWNkTLXVvWtabsO63gT8l/OQIDOPExDW9VOp49plhdS//yN8tS1yoe1L6OKhIaS8pmdILJ+gjyH79pUIWCXVuES+0HrrCYuaKa0llukdR+GciGwuU7fG88XQQ/CFkP9f2lcM3Q8g4PU25PnNjUxBJ1nl1gAq7Wa3ZbxPkhHzB+JyN4Ao3euLjHkRjrQ3W2SIS3CfItHuoyhBwnOPzHLMN28g/FgUO360arsA/UE2Oo630E+jY9TDKwbyHFhhc8xR75WzKudHGqtQ6wQqkPWLIz233s7HJ8ikL0xOz3b8KgC8vmHpcXBO+eACR2fH+YwubccGdpfm3OhweUhkzjVcodfPvi0XIOnhYsNRwPHm56S6xQ8vLm23j5PIoB3ksj6wpqLO+nUzlaT5TdsIcZKvv0FCWJdkgSokAQF3N0S97esbzURK6HBVvQezU8W7Fu13POoCWM3Uu0tu8MhFbArxgcse1E8V973ZXXC5fS1G5LQ6FF4o5grZK8eXKqFUY2wa4GMoDrB4OdFWjnTiYA/MpHo/sY7o19GaaAjOc9395uSOvspVn2VhY9dzEprMhka4hZI0Qay+ioKq2k7lqlA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(39840400004)(376002)(346002)(66946007)(66476007)(66556008)(38350700002)(38100700002)(966005)(31696002)(478600001)(31686004)(5660300002)(8676002)(52116002)(86362001)(83380400001)(6486002)(8936002)(2906002)(4326008)(36756003)(316002)(26005)(186003)(956004)(2616005)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGRyUThuL0ovZDE3N0VGbW04RzhYWkMycWxiajA4YTR0YW5SNi80WEw2QVR2?=
 =?utf-8?B?djIwbFJjKzdjNURPMEhWVlhOeHREZ1N2TDM3eDhZTlAxNHU3Z0E2SkVJR3g4?=
 =?utf-8?B?MDEyQVFxb01uQ3dLajBQUjMxVjlEOWJ0aktHS1FoaTdzSlBoZzYyRWpmRTFE?=
 =?utf-8?B?Z1Brbi9ybXRKek54TWhNa1poQVBVbjFSbjkya0pva2h6U2Q4NjdCbEVxbTYx?=
 =?utf-8?B?OTZVWU9rS25vT3cyTUh2bWlYY0xhSVZtWXM0cVRTeDM3MmltTDk4Mm9vT3ZZ?=
 =?utf-8?B?WCtEbUE2SjQra2xXaXhhUlhxdm9kSHJsbms1MzNSUG9Ob0NucUtPcEloT0ZQ?=
 =?utf-8?B?TktoNnUvZ3NJRitOMHVxQ2dnMHNYaWpkZUxEZWNrUFAybjV5VXVkbUo5d1lD?=
 =?utf-8?B?d3VkTENlZE5ob2VucjJsdUtkdGlHeCtlalo3TDJuNnVVeHdKWmc1dkloMmNa?=
 =?utf-8?B?Y05kY2YwMU9wN3FKZVpDZ29ReW5PMmg2ZjArZUQzYzZRdi9vdDkrQXRwQUdl?=
 =?utf-8?B?b2RSYzI2dWpwdmdZcng3YWZjTmp3NHYzSTNQZldadWo4RWlSNkIvZXJSbCtE?=
 =?utf-8?B?d1ZDQTZ0emJGVXpRaTNDb1Y3U3h5Sk1FeVVqR0dqaHY0YkhORU5wSDBHNi8x?=
 =?utf-8?B?aGJjL3FFVm51V28rbEpBRlN3OWs0enVUcmpCbnJUZHdmSW1kdDJmSjJJaU1x?=
 =?utf-8?B?dzU3OEppSDRpb3oxdVp6b3dic2U4M0tScjFSN25RaXR1Y0w0RTVYK1JEa1RQ?=
 =?utf-8?B?M1pFQnlpYkIwbFpxaWlnYTNuYVplVjdJTEtDdUtNditiNmZXSlR4RGhpcWVV?=
 =?utf-8?B?V3lLYS9PZFRhbVZZbEpYRC81ZWpldlRSbmJrNGNVVFFvd1paYmRQcXl1aE9h?=
 =?utf-8?B?T0hOSk1zbWExT2xEM3JyTkNYRGg5N3dmUWZNMW0wU0t5eHRkNHRIeWZuTDhu?=
 =?utf-8?B?bDRkUmIwTndycFY1VGRlREZjSTlMbjRTbWhmNExNTm81MVpOU2p3b3lvYjE3?=
 =?utf-8?B?Uy9BUTJFSGNjVFNsOFZ6SXFQejhTU1JXc0hONXZZT0ZrZTlQREpienYyVVcy?=
 =?utf-8?B?YTVra2xHSjdnQ24yWU51MTl4M0Q0S2ZEbU1Nb24xRWRuL3Z4RHI2aWxUdzA3?=
 =?utf-8?B?U1ErUlAydHRVRmt2eEFFbHhkSDJCcXRwbU9qZDhmZUhXVDVIQmRoY1R4RHR2?=
 =?utf-8?B?Z3o5aEczcldSejZLblpCdU9NQmJkYk9ibEg4OTR3TytUbnhwQmZ2VEdvWlJh?=
 =?utf-8?B?QzJJaXkvU3ByM3pkanhta0d2dEhyaC9QM0Q3TXhIQWhpNnA5VlVsTE52cXZp?=
 =?utf-8?B?SmgxMVJFREhrekZoQ2p1YnppWCthajNOQ0F3QkxJZ1hHUXBReVBibktOenFt?=
 =?utf-8?B?TVVvR3kxRzRaK3RGUlhMZDJTeXpmeGxuNnhsbFl4OUppbkFyWEJGQXVMSlgx?=
 =?utf-8?B?MjdtZmhxZ0dnWGp3TUwrMXVJSGx5b1JMZFc0UTNCWFN5bWV4djduSFB6NlA5?=
 =?utf-8?B?TnpxTjBJRWpGNGdSY05leXQxRkIxVmY1THQyR0EwaWpySGRvL2lLQXNYbnBz?=
 =?utf-8?B?Sm44SUNJNVRlelJ3S2FWdzB5Zm1oR0YwSzErZGUrQnBaM0VLUVZOMTBwblhY?=
 =?utf-8?B?Z3BwanNjc2EyRHBLaktLVTNscmxJU1hldGgzcEp5SmwzSCt3NE9oQ0J1bWp4?=
 =?utf-8?B?aXlYd3BVZW5KSkVOWlpWRTNQMHRNS1diU1dGc28xWVhqR1UyTlFvN0V1U2gx?=
 =?utf-8?Q?iZoHRTMjNHsaXr3SxHY6EHrAiCqJ2Q19GsfbX6o?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6aa7475-2596-4faa-51ea-08d971f2d16c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 11:29:56.1118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kzt/SKcJ1R2ANrctnm0S5pyMbmIL5+dTPsoMsQfNuyNiSc0GwAyNg15VcXbfW0l+vU7ejDqFLPQNyIHFlJLOV0pUxCbn26AHIaTAiEyy1ZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6805
Received-SPF: pass client-ip=40.107.6.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_NONE=-0.0001,
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

19.08.2021 13:12, Hanna Reitz wrote:
> We cannot write to images opened with O_DIRECT unless we allow them to
> be resized so they are aligned to the sector size: Since 9c60a5d1978,
> bdrv_node_refresh_perm() ensures that for nodes whose length is not
> aligned to the request alignment and where someone has taken a WRITE
> permission, the RESIZE permission is taken, too).
> 
> Let qemu-img convert pass the BDRV_O_RESIZE flag (which causes
> blk_new_open() to take the RESIZE permission) when using cache=none for
> the target, so that when writing to it, it can be aligned to the target
> sector size.
> 
> Without this patch, an error is returned:
> 
> $ qemu-img convert -f raw -O raw -t none foo.img /mnt/tmp/foo.img
> qemu-img: Could not open '/mnt/tmp/foo.img': Cannot get 'write'
> permission without 'resize': Image size is not a multiple of request
> alignment
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1994266
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
> As I have written in the BZ linked above, I am not sure what behavior we
> want.  It can be argued that the current behavior is perfectly OK
> because we want the target to have the same size as the source, so if
> this cannot be done, we should just print the above error (which I think
> explains the problem well enough that users can figure out they need to
> resize the source image).
> 
> OTOH, it is difficult for me to imagine a case where the user would
> prefer the above error to just having qemu-img align the target image's
> length.
> ---
>   qemu-img.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/qemu-img.c b/qemu-img.c
> index 908fd0cce5..d4b29bf73e 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -2628,6 +2628,14 @@ static int img_convert(int argc, char **argv)
>           goto out;
>       }
>   
> +    if (flags & BDRV_O_NOCACHE) {
> +        /*
> +         * If we open the target with O_DIRECT, it may be necessary to
> +         * extend its size to align to the physical sector size.
> +         */
> +        flags |= BDRV_O_RESIZE;
> +    }
> +
>       if (skip_create) {
>           s.target = img_open(tgt_image_opts, out_filename, out_fmt,
>                               flags, writethrough, s.quiet, false);
> 

Hmm. Strange. I am experimenting now with master branch without that patch and can't reproduce:

[root@kvm master]# dd if=/dev/zero of=a bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.1 MB, 2.0 MiB) copied, 0.00153639 s, 1.4 GB/s
[root@kvm master]# dd if=/dev/zero of=b bs=1M count=1
1+0 records in
1+0 records out
1048576 bytes (1.0 MB, 1.0 MiB) copied, 0.000939314 s, 1.1 GB/s
[root@kvm master]# ls -lthr a b
-rw-r--r--. 1 root root 2.0M Sep  7 14:28 a
-rw-r--r--. 1 root root 1.0M Sep  7 14:28 b
[root@kvm master]# ./build/qemu-img convert -f raw -O raw -t none a b
[root@kvm master]# ls -lthr a b
-rw-r--r--. 1 root root 2.0M Sep  7 14:28 a
-rw-r--r--. 1 root root 2.0M Sep  7 14:28 b
[root@kvm master]# dd if=/dev/zero of=b bs=1 count=2097147
2097147+0 records in
2097147+0 records out
2097147 bytes (2.1 MB, 2.0 MiB) copied, 2.76548 s, 758 kB/s
[root@kvm master]# ls -ltr a b
-rw-r--r--. 1 root root 2097152 Sep  7 14:28 a
-rw-r--r--. 1 root root 2097147 Sep  7 14:29 b
[root@kvm master]# ./build/qemu-img convert -f raw -O raw -t none a b
[root@kvm master]# ls -ltr a b
-rw-r--r--. 1 root root 2097152 Sep  7 14:28 a
-rw-r--r--. 1 root root 2097152 Sep  7 14:29 b

It just works, and do resize target without any additional BDRV_O_RESIZE...

-- 
Best regards,
Vladimir

