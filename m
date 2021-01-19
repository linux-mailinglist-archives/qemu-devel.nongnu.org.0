Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEF72FB9B7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:44:46 +0100 (CET)
Received: from localhost ([::1]:57600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sFR-00032v-Bg
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:44:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1sDR-000182-OZ
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:42:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1sDN-0004y1-18
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:42:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611067354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Q/U28tkX454BXZEHwLCs0x6AWOIGn+IuaqDAKUUp5I=;
 b=UnS/xA/YEeV8lwBDz+EyDwtoJva6/ygz2fCj+16m6Jhapt2YoKY+o4k3VR9GF18MplpZD+
 SpZ9VrcoraNPu8INEjsCKlCgVLQr+tsJYvuvVwBawazA13ZpufTKwM+uM/6I3cNh/JSckD
 6op27fLG3ecXkTJIigtE6NSqCIDN0SA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-tN8nTWawMla-UAGPvzg14A-1; Tue, 19 Jan 2021 09:42:31 -0500
X-MC-Unique: tN8nTWawMla-UAGPvzg14A-1
Received: by mail-ed1-f71.google.com with SMTP id a9so9548118edy.8
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 06:42:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1Q/U28tkX454BXZEHwLCs0x6AWOIGn+IuaqDAKUUp5I=;
 b=RPX7OY+2L0TVslOvF10EbeSF+wPQOmjqqYFyr1bHXu4r1XYsxVYMssOECcgjtOIr3d
 Gha5poTHGYvGw9ZcVG2rcmKJ/NSt2m8RX4fuQoV+73PIQIVj0BrZQmyxt4g7up6LCw67
 v4GyBsctME9UVAnDcNT9Q/kPNX7qluQYIU/JW7VUchNXNDgOAiAaMQcg5Da5kw4tRBiE
 zKZC1cKjVIEX0GCWjcE7W8C5uH+bRFhkX54Gv8//h2uzDL2xah4pY4Q8buCxwz4j1Jmi
 LCsUlmKWIvcfEH/QDa13qq43MLlsMNkKP/0V/eXtxFGHKE6Dlntux9nvm8BHEeY+hdDx
 yC5A==
X-Gm-Message-State: AOAM531uapKBQKTE+RQfPREZVMeSnTq4o2w8VPQz0qUswtkQWAZqXlpm
 Xp4ckDv1wFYIJu7dEMSrDYJwiG8rzQcfJ167sOnmYVw7823Wl0/h8L7+ncmLXdN2/7tqQhMiIir
 engHX8lMOURt++i0=
X-Received: by 2002:aa7:d352:: with SMTP id m18mr3705417edr.190.1611067349418; 
 Tue, 19 Jan 2021 06:42:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyADvd6i2uq1LEoBj8IGImyBKjHHvvudCWv8VbgMxO7Av9GLwnEnTnjvVIm9AS2W1NiC+Fxwg==
X-Received: by 2002:aa7:d352:: with SMTP id m18mr3705402edr.190.1611067349252; 
 Tue, 19 Jan 2021 06:42:29 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id k16sm10828794ejd.78.2021.01.19.06.42.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 06:42:28 -0800 (PST)
Subject: Re: [PULL 05/30] Makefile: wrap ctags in quiet-command calls
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
 <20210115130828.23968-6-alex.bennee@linaro.org>
 <CAP+75-XSyx2yCpz5uvx2ZofCGY=9pQ88ffSDRSXVjJk48qXNFw@mail.gmail.com>
 <87h7ndutwx.fsf@linaro.org> <147a0893-c584-0a0a-7dde-c24888c3b7ce@redhat.com>
 <20210119142700.GG2335568@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <50232366-3390-0baf-33cc-3a829343b1e7@redhat.com>
Date: Tue, 19 Jan 2021 15:42:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210119142700.GG2335568@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/21 3:27 PM, Daniel P. Berrangé wrote:
> On Tue, Jan 19, 2021 at 03:24:56PM +0100, Philippe Mathieu-Daudé wrote:
>> +Daniel
>>
>> On 1/19/21 11:00 AM, Alex Bennée wrote:
>>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>>> On Fri, Jan 15, 2021 at 2:08 PM Alex Bennée <alex.bennee@linaro.org> wrote:
>>>>>
>>>>> For prettier output.
>>>>>
>>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>>>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>> Message-Id: <20210114165730.31607-6-alex.bennee@linaro.org>
>>>>>
>>>>> diff --git a/Makefile b/Makefile
>>>>> index 0c509a7704..bbab640b31 100644
>>>>> --- a/Makefile
>>>>> +++ b/Makefile
>>>>> @@ -250,8 +250,13 @@ find-src-path = find "$(SRC_PATH)/" -path "$(SRC_PATH)/meson" -prune -o \( -name
>>>>>
>>>>>  .PHONY: ctags
>>>>>  ctags:
>>>>> -       rm -f "$(SRC_PATH)/"tags
>>>>> -       $(find-src-path) -exec ctags -f "$(SRC_PATH)/"tags --append {} +
>>>>> +       $(call quiet-command,                   \
>>>>> +               rm -f "$(SRC_PATH)/"tags,       \
>>>>> +               "CTAGS", "Remove old tags")
>>>>> +       $(call quiet-command, \
>>>>> +               $(find-src-path) -exec ctags            \
>>>>> +               -f "$(SRC_PATH)/"tags --append {} +,    \
>>>>> +               "CTAGS", "Re-index $(SRC_PATH)")
>>>>>
>>>>>  .PHONY: gtags
>>>>>  gtags:
>>>>> --
>>>>> 2.20.1
>>>>>
>>>>
>>>> Build now fails if ctags is not installed:
>>>>
>>>> $ if test -n "$MAKE_CHECK_ARGS"; then make -j"$JOBS" $MAKE_CHECK_ARGS ; fi
>>>> CTAGS Remove old tags
>>>> CTAGS Re-index /builds/philmd/qemu
>>>> find: 'ctags': No such file or directory
>>>> find: 'ctags': No such file or directory
>>>> find: 'ctags': No such file or directory
>>>> make: *** [Makefile:254: ctags] Error 1
>>>> make: *** Waiting for unfinished jobs....
>>>
>>> Wait what, how? Have you got ctags in your MAKE_CHECK_ARGS? How did it
>>> not fail before?
>>>
>>> I suppose we could add checks for all the tooling in meson but it seems
>>> a little overkill for a developer convenience.  
>>
>> I figured out I was still using the Docker images generated after
>> testing Daniel's 'start using libvirt-ci's "lcitool" for dockerfiles'
>> series:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg772839.html
>>
>> Daniel, lcitool's ansible/vars/projects/qemu.yml apparently has
>> a strong dependency on ctags.
> 
> Huh ?  It doesn't mention ctags at all.  If it is present, it is only as
> a side-effect of a dependancy from some other package we genuinely do need.

Sorry, I meant QEMU as a strong dependency on ctags.

I'll send a patch to lcitool.

Regards,

Phil.


