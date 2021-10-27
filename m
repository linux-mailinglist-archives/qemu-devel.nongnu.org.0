Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3EE43CF82
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 19:16:13 +0200 (CEST)
Received: from localhost ([::1]:60350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfmX5-0000nb-VN
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 13:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfm66-00086c-Ev
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:48:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfm64-0007L9-3W
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:48:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635353295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iNrCMK9rEd/6FAkTNmsM1t5UDjlKMsqH9ZHK6cTmTLw=;
 b=cSmgydp6qwZixid1ZEvk4GvLDh+xLihHsw+j4KkKtX+NusqgyZy9cuxogJbdBfe2WIEF0p
 aHs9EfzLRkBKuASYSDe4aAmWcSlMkrii51U4/CGWlegX5g6XDwp0ld6fsmxBzmo8vsONrU
 cBFt2DGx/dxPJWhzX7damBaUMLnq+ns=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-4vXkBUV4PkeMEsXWvZOW0w-1; Wed, 27 Oct 2021 12:48:12 -0400
X-MC-Unique: 4vXkBUV4PkeMEsXWvZOW0w-1
Received: by mail-wm1-f70.google.com with SMTP id
 k6-20020a7bc306000000b0030d92a6bdc7so1420259wmj.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 09:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iNrCMK9rEd/6FAkTNmsM1t5UDjlKMsqH9ZHK6cTmTLw=;
 b=TJEHXeusNNVX2YOmYE53N+h1ub3JJnDobsjgEJ4THTzGveU/U3w2DtfdafLNGMJ5Sg
 SzxtU9lF4NE2cxclEAM3lp81sxS2vkQaEkSRP9S1RzF0u3VYrAxAc86lO948hJCvQGPZ
 yOdxvFwOzfdrtXUK9ZVsBj0p+KBGM49b0J97EMFVlp1lbMGDtbsqXKYdSOVFsCFOSfsj
 9HeiqvSicKIiOazCfGDWdZK+ChKKUjsNhMDYRs5W7L/CE0jy2OvH3ftiPoBNFtMq5U6X
 QSVqK+qqwFUSsrqikUj4c7MhUedF/f2elzNZCqxAJUje0V0H7S4v6UgE42amoKl1beag
 0dZQ==
X-Gm-Message-State: AOAM530PJjKAziz5aUXSxoF3GPSq3T18eXfRZKgmn+5D0IuEt7erYNcq
 7PN7itrozX63/p+yyQzVLe3vT0MVsab582nID68nHryapXvuahgcitIb0rf7Dtsjma1QMV4SjVv
 8XpEehE3MESlTTLU=
X-Received: by 2002:a7b:ce8f:: with SMTP id q15mr6797904wmj.136.1635353291448; 
 Wed, 27 Oct 2021 09:48:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdBAmLE45QYhKTV2sGdna5NjsR+ErpphgWkJBnEYw0TSuc9LyRjqT4elZmVqDAs4DUi2UVvg==
X-Received: by 2002:a7b:ce8f:: with SMTP id q15mr6797875wmj.136.1635353291225; 
 Wed, 27 Oct 2021 09:48:11 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id e18sm368506wrv.44.2021.10.27.09.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 09:48:10 -0700 (PDT)
Message-ID: <36b93ef0-bcff-1be6-ce8d-03cd61f0a0fd@redhat.com>
Date: Wed, 27 Oct 2021 18:48:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 0/8] 9p queue 2021-10-27
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <cover.1635340713.git.qemu_oss@crudebyte.com>
 <1763549.VT83FdeJ1q@silver> <dd17a177-c7eb-b879-a980-a986344b9cac@redhat.com>
 <2647527.eb0YlLX8Cn@silver>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <2647527.eb0YlLX8Cn@silver>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 18:21, Christian Schoenebeck wrote:
> On Mittwoch, 27. Oktober 2021 17:36:03 CEST Philippe Mathieu-Daudé wrote:
>> Hi Christian,
>>
>> On 10/27/21 16:05, Christian Schoenebeck wrote:
>>> On Mittwoch, 27. Oktober 2021 15:18:33 CEST Christian Schoenebeck wrote:
>>>> The following changes since commit 
> 931ce30859176f0f7daac6bac255dae5eb21284e:
>>>>   Merge remote-tracking branch
>>>>   'remotes/dagrh/tags/pull-virtiofs-20211026'
>>>>
>>>> into staging (2021-10-26 07:38:41 -0700)
>>>>
>>>> are available in the Git repository at:
>>>>   https://github.com/cschoenebeck/qemu.git tags/pull-9p-20211027
>>>>
>>>> for you to fetch changes up to 7e985780aaab93d2c5be9b62d8d386568dfb071e:
>>>>   9pfs: use P9Array in v9fs_walk() (2021-10-27 14:45:22 +0200)
>>>>
>>>> ----------------------------------------------------------------
>>>> 9pfs: performance fix and cleanup
>>>>
>>>> * First patch fixes suboptimal I/O performance on guest due to previously
>>>>
>>>>   incorrect block size being transmitted to 9p client.
>>>>
>>>> * Subsequent patches are cleanup ones intended to reduce code complexity.
>>>>
>>>> ----------------------------------------------------------------
>>>>
>>>> Christian Schoenebeck (8):
>>>>       9pfs: fix wrong I/O block size in Rgetattr
>>>>       9pfs: deduplicate iounit code
>>>>       9pfs: simplify blksize_to_iounit()
>>>>       9pfs: introduce P9Array
>>>>       fsdev/p9array.h: check scalar type in P9ARRAY_NEW()
>>>>       9pfs: make V9fsString usable via P9Array API
>>>>       9pfs: make V9fsPath usable via P9Array API
>>>>       9pfs: use P9Array in v9fs_walk()
>>>>  
>>>>  fsdev/9p-marshal.c |   2 +
>>>>  fsdev/9p-marshal.h |   3 +
>>>>  fsdev/file-op-9p.h |   2 +
>>>>  fsdev/p9array.h    | 160
>>>>
>>>> +++++++++++++++++++++++++++++++++++++++++++++++++++++ hw/9pfs/9p.c      
>>>> |
>>>> 70 +++++++++++++----------
>>>>
>>>>  5 files changed, 208 insertions(+), 29 deletions(-)
>>>>  create mode 100644 fsdev/p9array.h
>>>
>>> Regarding last 5 patches: Daniel raised a concern that not using g_autoptr
>>> would deviate from current QEMU coding patterns:
>>> https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg00081.html
>>>
>>> Unfortunately I saw no way to address his concern without adding
>>> unnecessary code complexity, so I decided to make this a 9p local type
>>> (QArray -> P9Array) for now, which can easily be replaced in future (e.g.
>>> when there will be something appropriate on glib side).
>>
>> Hmm various patches aren't reviewed yet... In particular
>> patch #5 has a Suggested-by tag without Reviewed-by, this
>> looks odd.
>>
>> See https://wiki.qemu.org/Contribute/SubmitAPullRequest:
>>
>>   Don't send pull requests for code that hasn't passed review.
>>   A pull request says these patches are ready to go into QEMU now,
>>   so they must have passed the standard code review processes. In
>>   particular if you've corrected issues in one round of code review,
>>   you need to send your fixed patch series as normal to the list;
>>   you can't put it in a pull request until it's gone through.
>>   (Extremely trivial fixes may be OK to just fix in passing, but
>>   if in doubt err on the side of not.)
> 
> There are in general exactly two persons adding their RBs to 9p patches, which 
> is either Greg or me, and Greg made it already clear that he barely has time 
> for anything above trivial set.
> 
> So what do you suggest? You want to participate and review 9p patches?

Well I am a bit surprised...

$ git log --oneline \
    --grep='Reviewed-by: Philippe Mathieu-Daudé' -- hw/9pfs/ | wc -l
18

I also reviewed patch #3 if this pull request...


Now I see you posted this 4 times in 2 months, so indeed eventual
reviewers had plenty of time to look at your patches.

Note I haven't said I'd NAck your pull request, I noticed your own
concern wrt Daniel comment, so I looked at the patch and realized
it was not reviewed, and simply said this is this is odd.

Regards,

Phil.


