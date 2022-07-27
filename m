Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0739F5822CF
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 11:09:21 +0200 (CEST)
Received: from localhost ([::1]:59184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGd2e-0005Bf-5O
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 05:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oGcwl-0000DM-Fr
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:03:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oGcwj-0007J9-7g
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:03:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658912592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IzWhJim+k0MxQWrqU8SZNvlaWrJp5GnuKl694Hs0iCs=;
 b=TMYFNVMUdkCnBALLJlFSToNjiZMo23QWoLynwboXX3zp7MZLlIVp9XvuhEnpmCp5N5rUJt
 oRNw6/ZpXsoh5y/JcQgiLJiH1HPgVnCwFWDraB9xCQDu2YX334QjM7l4HdZi1H2S2zdl8O
 zUT8nbnWFGQchGwl5tboRqAP47A0X20=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-H8WGT37qOpG_gv5j7UViHg-1; Wed, 27 Jul 2022 05:03:10 -0400
X-MC-Unique: H8WGT37qOpG_gv5j7UViHg-1
Received: by mail-wm1-f72.google.com with SMTP id
 v24-20020a7bcb58000000b003a37681b861so331322wmj.9
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 02:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IzWhJim+k0MxQWrqU8SZNvlaWrJp5GnuKl694Hs0iCs=;
 b=I1H/5ABIH1yi1CwBqyoMAuoDXE7YVPfnmzRhEMlNeKQEzKj11MRMSaLDch1aR1qE5F
 4+XXYJOJH5V3t5GWujZ+1MVQ4L1cuVhy6ALpU3FMhlhofaN8k//eX9gk+2TJZsb8dYWq
 LqZA/TlOXUzCPvOORiKeSwEykPHgulMtwjhcW7yJpNVShLqVsoMs5etVqwQqEozwTir1
 ow7ZgocgDLFWcz/ZfRlXUw5WsSgGQM1lIvslFq6Gn53N2q6zcpBQyTkQsF21wg+NIen5
 tflvs9IXNJlfYB53PFWNBuwlMHhQOEtUXOa3HviMBqtFi5esInCM+2eN8l1r/JFpZDw0
 3Tpg==
X-Gm-Message-State: AJIora+smXWApecF3LjnEUJxa+Hgo2HeZx1QT3A2GMKpPRwVeDwuYEBg
 RLL8YDPBOWcKE8ak8wXCrQSmukGJxdTPGM2V5BtLVy7/+/xv5lGCh3Pp/00xxHLuvfuwPywcIoo
 cb4UqzC0KpLFaudE=
X-Received: by 2002:adf:fb90:0:b0:21e:4eb6:b880 with SMTP id
 a16-20020adffb90000000b0021e4eb6b880mr13189903wrr.551.1658912588270; 
 Wed, 27 Jul 2022 02:03:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tDh1THiVLE15izxrSJcYUh5LFW14Ujq98tE33Q26Bb7DePpQXsrY0ZVLb/KIJy78mztm+0Gw==
X-Received: by 2002:adf:fb90:0:b0:21e:4eb6:b880 with SMTP id
 a16-20020adffb90000000b0021e4eb6b880mr13189880wrr.551.1658912587943; 
 Wed, 27 Jul 2022 02:03:07 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-164.web.vodafone.de.
 [109.43.176.164]) by smtp.gmail.com with ESMTPSA id
 e3-20020a05600c108300b003a32251c3f0sm1602104wmd.33.2022.07.27.02.03.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 02:03:07 -0700 (PDT)
Message-ID: <d90aa096-352a-fce4-4931-523cbea406d3@redhat.com>
Date: Wed, 27 Jul 2022 11:03:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] .gitlab-ci.d/windows.yml: Enable native Windows symlink
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Yonggang Luo <luoyonggang@gmail.com>
References: <20220725123000.807608-1-bmeng.cn@gmail.com>
 <874jz5i9qr.fsf@linaro.org>
 <CAEUhbmWBaCrODGY_KMncAmTy53gmid4R=OKDMTi1T1fR0PUBMw@mail.gmail.com>
 <CAEUhbmWkVfjEgkg6uQ8cVVO7ipdiKuKeuco+fGNQ4zZdCnrA4Q@mail.gmail.com>
 <YuD9YuSbmCbzo9kB@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YuD9YuSbmCbzo9kB@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 27/07/2022 10.54, Daniel P. Berrangé wrote:
> On Wed, Jul 27, 2022 at 02:02:48PM +0800, Bin Meng wrote:
>> On Tue, Jul 26, 2022 at 9:38 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>
>>> On Mon, Jul 25, 2022 at 9:48 PM Alex Bennée <alex.bennee@linaro.org> wrote:
>>>>
>>>>
>>>> Bin Meng <bmeng.cn@gmail.com> writes:
>>>>
>>>>> From: Bin Meng <bin.meng@windriver.com>
>>>>>
>>>>> The following error message was seen during the configure:
>>>>>
>>>>>    "ln: failed to create symbolic link
>>>>>    'x86_64-softmmu/qemu-system-x86_64.exe': No such file or directory"
>>>>>
>>>>> By default the MSYS environment variable is not defined, so the runtime
>>>>> behavior of winsymlinks is: if <target> does not exist, 'ln -s' fails.
>>>>> At the configure phase, the qemu-system-x86_64.exe has not been built
>>>>> so creation of the symbolic link fails hence the error message.
>>>>>
>>>>> Set winsymlinks to 'native' whose behavior is most similar to the
>>>>> behavior of 'ln -s' on *nix, that is:
>>>>>
>>>>>    a) if native symlinks are enabled, and whether <target> exists
>>>>>       or not, creates <destination> as a native Windows symlink;
>>>>>    b) else if native symlinks are not enabled, and whether <target>
>>>>>       exists or not, 'ln -s' creates as a Windows shortcut file.
>>>>>
>>>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>>>
>>>> I'm still seeing Windows build failures such as:
>>>>
>>>>    https://gitlab.com/stsquad/qemu/-/jobs/2765579269
>>>
>>> I've seen this one before. Looks like this one can be easily reproduced.
>>>
>>>>
>>>> and
>>>>
>>>>    https://gitlab.com/stsquad/qemu/-/jobs/2765579267
>>>
>>> This one seems to be a random failure?
>>>
>>
>> Saw another random failure today in the msys2-32bit build in CI.
>>
>> [313/1788] Generating texture-blit-vert.h with a custom command
>> (wrapped by meson to capture output)
>> FAILED: ui/shader/texture-blit-vert.h
>> "C:/GitLab-Runner/builds/lbmeng/qemu/msys64/mingw32/bin/python3.exe"
>> "C:/GitLab-Runner/builds/lbmeng/qemu/meson/meson.py" "--internal"
>> "exe" "--capture" "ui/shader/texture-blit-vert.h" "--" "perl"
>> "C:/GitLab-Runner/builds/lbmeng/qemu/scripts/shaderinclude.pl"
>> "../ui/shader/texture-blit.vert"
>> [314/1788] Generating texture-blit-flip-vert.h with a custom command
>> (wrapped by meson to capture output)
>> ninja: build stopped: subcommand failed.
>> make: *** [Makefile:162: run-ninja] Error 1
> 
> IMHO we need to just drop the msys jobs from GitLab. They are too
> unreliable and causing frequent failed pipelines.

IIRC they were working way more reliable 'till two or three months ago? 
Maybe this was introduced by the bump to the newest level of MSYS2 in commit 
5c570ef2f154 ? Maybe we should upgrade or downgrade the MSYS2 version again?

  Thomas


