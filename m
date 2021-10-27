Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FCA43D167
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 21:07:27 +0200 (CEST)
Received: from localhost ([::1]:43946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfoGk-0001KN-94
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 15:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfnOp-0007Jf-U2
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:11:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfnOm-0005GZ-CW
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:11:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635358299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B7UVc2EIVESYguL/38yveeQc2aVFr/bfxolagqC78ac=;
 b=Yz0QP7OCrJUjnJ1Ygn5qg6gL1oES+7Kv4F7IDyqoWcRw5s1500ceCztkcaTD6RKeqEi1rD
 dQM2+n3Njj9oc2bWU1kW+I8XR3wWbIGdMHpDmkvteMKU+4M3UtplPFxcob/9DyM0b2dP3C
 Mt+ayKrPWokudMaccuCfCS790V6X7RY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-EjY7KNqVOM25WaMLyFh4mw-1; Wed, 27 Oct 2021 14:11:36 -0400
X-MC-Unique: EjY7KNqVOM25WaMLyFh4mw-1
Received: by mail-wr1-f69.google.com with SMTP id
 f2-20020a5d50c2000000b00167f5c0a206so979692wrt.12
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:11:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B7UVc2EIVESYguL/38yveeQc2aVFr/bfxolagqC78ac=;
 b=erEFSqDdofXOUhluObIe39BNGVNqlevvvw5oHI3HW2CtmaVG4r2Kp/AdB9U7FVLfKM
 1ZoVgHq3hBA2S+x0a5kca4ZxjB3soLCE9LTUke9X0rTh0tB4E6lAboK7ytXcMUMFmR4H
 Zuu4Z06cZd1F3jNuEbZ7Qajgl3BPbN2DHK9cEuV/DA0YwLnjH4Y5NjZCZs0ea9GunZ51
 GV5PER3fswnLA/KhyBi0fR1XJ+gQAg2vXH35vxMKhicRYDk0xMmIhkbhml60NflM4CXE
 HgVWzAjZkKEApoQ6uKIUiIPesmZKWXfUg8Dgbx9hDIGQR8ur9U7nbc/kYu+DC5RshsPm
 30Xw==
X-Gm-Message-State: AOAM532zq/sykmwPWnUSdHnLeVSZduf5pzIYh4+6Rb0RKUcpRLq4YcEg
 c/H2PblGBR1PGqQEUL3vORppCUtFmjp7P4m5HXPZiF5hP6Q0oAIbbj8yqKdx5UVsy6vn++b/aqH
 Tomb8vHtQZXJJ6eY=
X-Received: by 2002:a05:600c:2199:: with SMTP id
 e25mr7330678wme.157.1635358294792; 
 Wed, 27 Oct 2021 11:11:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGlPD6lPA6d3yevsLKthQTmVhsu2srbLHhzZntR7XhbiQsuh0h/a82a7X1vkdPZ+lNL3djew==
X-Received: by 2002:a05:600c:2199:: with SMTP id
 e25mr7330660wme.157.1635358294590; 
 Wed, 27 Oct 2021 11:11:34 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id s13sm4254596wmc.47.2021.10.27.11.11.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 11:11:34 -0700 (PDT)
Message-ID: <89f91648-1263-32d3-953b-84bcc147135b@redhat.com>
Date: Wed, 27 Oct 2021 20:11:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 0/8] 9p queue 2021-10-27
To: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <cover.1635340713.git.qemu_oss@crudebyte.com>
 <2647527.eb0YlLX8Cn@silver> <36b93ef0-bcff-1be6-ce8d-03cd61f0a0fd@redhat.com>
 <13405882.ftTnZbQXCH@silver>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <13405882.ftTnZbQXCH@silver>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 10/27/21 19:29, Christian Schoenebeck wrote:
> On Mittwoch, 27. Oktober 2021 18:48:10 CEST Philippe Mathieu-Daudé wrote:
>> On 10/27/21 18:21, Christian Schoenebeck wrote:
>>> On Mittwoch, 27. Oktober 2021 17:36:03 CEST Philippe Mathieu-Daudé wrote:
>>>> On 10/27/21 16:05, Christian Schoenebeck wrote:

>>>>> Regarding last 5 patches: Daniel raised a concern that not using
>>>>> g_autoptr
>>>>> would deviate from current QEMU coding patterns:
>>>>> https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg00081.html
>>>>>
>>>>> Unfortunately I saw no way to address his concern without adding
>>>>> unnecessary code complexity, so I decided to make this a 9p local type
>>>>> (QArray -> P9Array) for now, which can easily be replaced in future
>>>>> (e.g.
>>>>> when there will be something appropriate on glib side).
>>>>
>>>> Hmm various patches aren't reviewed yet... In particular
>>>> patch #5 has a Suggested-by tag without Reviewed-by, this
>>>> looks odd.
>>>>
>>>> See https://wiki.qemu.org/Contribute/SubmitAPullRequest:
>>>>   Don't send pull requests for code that hasn't passed review.
>>>>   A pull request says these patches are ready to go into QEMU now,
>>>>   so they must have passed the standard code review processes. In
>>>>   particular if you've corrected issues in one round of code review,
>>>>   you need to send your fixed patch series as normal to the list;
>>>>   you can't put it in a pull request until it's gone through.
>>>>   (Extremely trivial fixes may be OK to just fix in passing, but
>>>>   if in doubt err on the side of not.)
>>>
>>> There are in general exactly two persons adding their RBs to 9p patches,
>>> which is either Greg or me, and Greg made it already clear that he barely
>>> has time for anything above trivial set.
>>>
>>> So what do you suggest? You want to participate and review 9p patches?
>>
>> Well I am a bit surprised...
>>
>> $ git log --oneline \
>>     --grep='Reviewed-by: Philippe Mathieu-Daudé' -- hw/9pfs/ | wc -l
>> 18
>>
>> I also reviewed patch #3 if this pull request...
>>
>>
>> Now I see you posted this 4 times in 2 months, so indeed eventual
>> reviewers had plenty of time to look at your patches.
>>
>> Note I haven't said I'd NAck your pull request, I noticed your own
>> concern wrt Daniel comment, so I looked at the patch and realized
>> it was not reviewed, and simply said this is this is odd.
>>
>> Regards,
>>
>> Phil.
> 
> Philippe, of course I understand why this looks odd to you, and yes you 
> reviewed that particular patch. But the situation on the 9p front is like this 
> for >2 years now: people quickly come by to nack patches, but even after 
> having addressed their concerns they barely add their RBs afterwards. That 
> means I am currently forced to send out PRs without RBs once in a while.
> 
> The mentioned 5 patches look like overkill on first sight, but they are just 
> intended as preparatory ones. I actually should fix a protocol implementation 
> deficit in "Twalk" request handling, and that in turn means I will have to add 
> complexity to function v9fs_walk(). But before even daring to do so, I should 
> get rid of as much of complexity as possible. Because we already had a bunch 
> of issues in that function before. I believe these are trivial 5 patches. But 
> I can also accompany them with test cases if somebody is worried.
> 
> Greg, I could also drop them now, but the general issue will retain: Reality 
> is that I am the only person working on 9p right now and a fact that I cannot 
> change. The rest is for other people to decide.

To be explicit, I just asked clarifications to Christian. I understand
the 9pfs subsystem situation, and I am not against (Nacking) this pull
request being merged.

Thanks both,

Phil.


