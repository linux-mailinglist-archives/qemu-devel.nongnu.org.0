Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4982FEBC9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 14:28:45 +0100 (CET)
Received: from localhost ([::1]:53790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2a0y-0008Fu-Eq
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 08:28:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2ZzW-0007op-1X
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 08:27:14 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:38759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2ZzU-0002nu-4t
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 08:27:13 -0500
Received: by mail-ed1-x52e.google.com with SMTP id s11so2458967edd.5
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 05:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SmkbXrN+vkpGvit2OijH48Gmv6xPb3qQqlSzz1vBRcw=;
 b=VfoRJflZWQy2AUflS4Jfjz69bWycFAMzTpbO1hQ5PzfJU3O0mTAfm7fREbkV6wJFMt
 scE/Ku76Y7Ty6af0twJ+Niq924zidLBgikcxD8veZmn3Yk2qIeIoKsqZjGQwux3UKi41
 sYEeDcsw+3AKSOSB5sNitHN5CzICbe1jMQKrPZ2EOdXcugeue43UHhwRQoznUtAVjdC9
 qe/LvKs0SMzqC5SpmxUoBpkp1fQd9gH23VRHUwO26wLT30oXJdobajHVed+RSV1U1JTH
 e39kCTJZnzuoc2x30k4stcUWz4TVkI9zopeaIDRBLEQMmHata/S9RcD9TIJgounFmWdU
 WEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SmkbXrN+vkpGvit2OijH48Gmv6xPb3qQqlSzz1vBRcw=;
 b=VvSQDBkaUMPifyFre/GWRybepHtUuzeWUfYayieuf9UIMVcHNhSy7U2J2fol9jp0DJ
 CK/tJ274l4iLBWV5DoPI3bvbJyGBEaaadNgb8lLj9KiK+jUM9hxpqL0r1T4AAF0gP0Yv
 iuzl5TJUtH6IBHQPaMjt7kZEcYix3edi/3eLpcXslxn/ye+1dZ4jscLr0A/P4Ha+4xcw
 p0iuITtZGZOiftmx2TTAdZQ6OjaEJ83ZbMZaTmQe4AI+X9/gMTj9RNAjXOInImW4Qx1Q
 asJDkvnZuQ38Lgj4tZYQu9ZukXm80sHX4eIsKjM1TfknFP4Tq6ecxtuqEBd/b7GIZfoM
 Z5Gg==
X-Gm-Message-State: AOAM533ciRns9MHo8pikY7GdZ9J46l7zcqsmRfIknJKhCO2Km7S6EvU/
 PJpokCb74YREQE48E2A1bA0=
X-Google-Smtp-Source: ABdhPJw0g4aH76UPQpyjzdWNRMB3knbYIOfoJ2sG4ajYNdbRZ0slJ6Hm23o5LVWi6CV4LDv7teH9gA==
X-Received: by 2002:a50:e3c4:: with SMTP id c4mr11169237edm.77.1611235630651; 
 Thu, 21 Jan 2021 05:27:10 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id cw21sm2712208edb.85.2021.01.21.05.27.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 05:27:09 -0800 (PST)
Subject: Re: [RFC PATCH 2/2] gitlab-ci: Add a job building TCI with Clang
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
References: <20210110162739.858087-1-f4bug@amsat.org>
 <20210110162739.858087-3-f4bug@amsat.org>
 <78a9718b-dec0-cc31-7ada-e815d9022e65@redhat.com>
 <20210121103250.GH3125227@redhat.com>
 <b1309c5e-69f2-0c4d-eefc-9023e906694d@amsat.org>
 <20210121112154.GJ3125227@redhat.com>
 <e46b9117-59ed-cfb8-303b-1a5a013c4cc8@amsat.org>
 <20210121120241.GK3125227@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <97b12e1b-e570-bd4d-5484-376f3fe6f7dc@amsat.org>
Date: Thu, 21 Jan 2021 14:27:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121120241.GK3125227@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wataru Ashihara <wataash@wataash.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 1:02 PM, Daniel P. Berrangé wrote:
> On Thu, Jan 21, 2021 at 12:48:21PM +0100, Philippe Mathieu-Daudé wrote:
>> On 1/21/21 12:21 PM, Daniel P. Berrangé wrote:
>>> On Thu, Jan 21, 2021 at 12:18:18PM +0100, Philippe Mathieu-Daudé wrote:
>>>> On 1/21/21 11:32 AM, Daniel P. Berrangé wrote:
>>>>> On Thu, Jan 21, 2021 at 11:08:29AM +0100, Thomas Huth wrote:
>>>>>> On 10/01/2021 17.27, Philippe Mathieu-Daudé wrote:
>>>>>>> Split the current GCC build-tci job in 2, and use Clang
>>>>>>> compiler in the new job.
>>>>>>>
>>>>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>>>> ---
>>>>>>> RFC in case someone have better idea to optimize can respin this patch.
>>>>>>>
>>>>>>>   .gitlab-ci.yml | 22 ++++++++++++++++++++--
>>>>>>>   1 file changed, 20 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> I'm not quite sure whether we should go down this road ... if we wanted to
>>>>>> have full test coverage for clang, we'd need to duplicate *all* jobs to run
>>>>>> them once with gcc and once with clang. And that would be just overkill.
>>>>>>
>>>>>> I think we already catch most clang-related problems with the clang jobs
>>>>>> that we already have in our CI, so problems like the ones that you've tried
>>>>>> to address here should be very, very rare. So I'd rather vote for not
>>>>>> splitting the job here.
>>>>>
>>>>> We can't possibly cope with the fully expanded matrix of what are
>>>>> theoretically possible combinations. Thus I think we should be guided
>>>>> by what is expected real world usage by platforms we target.
>>>>>
>>>>> Essentially for any given distro we're testing on, our primary focus
>>>>> should be to use the toolchain that distro will build QEMU with.
>>>>>
>>>>> IOW, for Windows and Linux distros our primary focus should be GCC,
>>>>> while for macOS, and *BSD, our focus should be CLang.
>>>>
>>>> Sounds good.
>>>>
>>>> Do we need a TCI job on macOS then?
>>>
>>> TCI is only relevant if there is no native TCG host impl.
>>>
>>> macOS only targets aarch64 and x86_64, both of which have TCG, so there
>>> is no reason to use TCI on macOS  AFAICT
>>
>> Yes, fine by me, but Wataru Ashihara reported the bug... ¯\_(ツ)_/¯
> 
> It doesn't look like they were using macOS - the message suggests
> Ubuntu host, and AFAIK, all Ubuntu architectures have support
> for TCG, so using TCI shouldn't have been required in the first
> place.
> 
> I guess we could benefit from a TCI job of some kind that uses
> CLang on at least 1 platform, since none exists.
> 
> This does yet again open up the question of whether we should be
> supporting TCI at all in this particular user's scenario though,
> since both KVM and TCG are available on Ubuntu x86 hosts already.

I understand Stefan envisions other use cases for TCI, which is
why it is still maintained. See:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg461131.html

I agree with your previous comment:
> we should be guided by what is expected real world usage by
> platforms we target. Essentially for any given distro we're
> testing on, our primary focus should be to use the toolchain
> that distro will build QEMU with.

This rarely used config does not justify adding yet another CI job.

Thanks,

Phil.

