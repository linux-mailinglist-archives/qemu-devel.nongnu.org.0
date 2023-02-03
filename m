Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463CA68916B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 08:59:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNqyO-0004yu-HH; Fri, 03 Feb 2023 02:59:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pNqy6-0004u5-Sc
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 02:58:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pNqy0-00087c-AJ
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 02:58:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675411118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TkIUVPHtuc/qOqnyQx+Oo3aYHx9JbNtkqy1HFaGUNnM=;
 b=etwdXD2xm75AwsfNd4ezHOIcsVUcV5WYLERmj/YRw/GcOI5ApzSt4gguwTlSUutNCcUA4H
 i/Ui6CkC3d1uH2iOfzKLusbCapn2Ggcj8eel+MGPtCBunZPIsNO4mROF+njmB0AeD/v3EQ
 hAZygwUsjZoEtteqqXS0trpkpwQUpXI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-587-8X3ZdxLsPMmCcSyxF2Kf1A-1; Fri, 03 Feb 2023 02:58:35 -0500
X-MC-Unique: 8X3ZdxLsPMmCcSyxF2Kf1A-1
Received: by mail-qk1-f197.google.com with SMTP id
 s7-20020ae9f707000000b007294677a6e8so2859034qkg.17
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 23:58:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TkIUVPHtuc/qOqnyQx+Oo3aYHx9JbNtkqy1HFaGUNnM=;
 b=0EJjIGM9PSRiDyZUllLq784oQ6c/M5Hp/03GvK5jnupPsETIoseQGOhoOJKMH/5hGJ
 4MAkDV6ixC8sfjPgY62v7LLmL1aAY4vr5jySJWL/GWAkEoM79qsCCg324VsNlLUfqvCr
 ehm3iKwwCC6sUjRl1WXMLMpB0DivEaj+RT1Ppowej9EXrTgEEL0dm4oiMe4PbOum5N1R
 ljUZCHFbFzUERzV7gS3/SnRm5JrmsiRvKpmZlGtJuwdeDsu9/MBn2C+2U/U94lScFx3u
 0czcyjGN4RGu30bqRMYUmXrgFODviaAdm4Fenzb1IcLEkZSPZqTwaLA1DAaqnh2P8f16
 21sw==
X-Gm-Message-State: AO0yUKWjdWgKjpvUok06Yb4AO6qUH92j1DkEB5lmvYmc3DBQiNCgalRc
 LUKHvHUJzniozpV7tRo2tzxROOIJKDtEOz4oibj4KyNF6AZv0GvV46ZPu5RrYRdweezPUrgyOJA
 NDKihB4ndGTb9Ak0=
X-Received: by 2002:ac8:5e06:0:b0:3b8:3c0b:6332 with SMTP id
 h6-20020ac85e06000000b003b83c0b6332mr16926240qtx.28.1675411115006; 
 Thu, 02 Feb 2023 23:58:35 -0800 (PST)
X-Google-Smtp-Source: AK7set+a6mFB43RInkEb3RXOv2PMcbBMwR3UGr0MRGHkCWOQ6d1MucbopWlFXskRQb8rp9O4n8XYug==
X-Received: by 2002:ac8:5e06:0:b0:3b8:3c0b:6332 with SMTP id
 h6-20020ac85e06000000b003b83c0b6332mr16926223qtx.28.1675411114754; 
 Thu, 02 Feb 2023 23:58:34 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-40.web.vodafone.de.
 [109.43.179.40]) by smtp.gmail.com with ESMTPSA id
 o11-20020ac87c4b000000b003b9a426d626sm1210187qtv.22.2023.02.02.23.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 23:58:33 -0800 (PST)
Message-ID: <b674695a-793b-cceb-9083-72544fc1d67a@redhat.com>
Date: Fri, 3 Feb 2023 08:58:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230202175903.2119702-1-alex.bennee@linaro.org>
 <875ycjlwo8.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH] gitlab: call ninja directly and reduce build noise
In-Reply-To: <875ycjlwo8.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02/02/2023 19.59, Alex Bennée wrote:
> 
> Alex Bennée <alex.bennee@linaro.org> writes:
> 
>> A significant portion of our CI logs are just enumerating each
>> successfully built object file. The current widespread versions of
>> ninja don't have a quiet option so we use NINJA_STATUS to add a fixed
>> string to the ninja output which we then filter with fgrep. If there
>> are any errors in the output we get them from the compiler.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   .gitlab-ci.d/buildtest-template.yml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)0
>>
>> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
>> index 73ecfabb8d..3c4b237e4f 100644
>> --- a/.gitlab-ci.d/buildtest-template.yml
>> +++ b/.gitlab-ci.d/buildtest-template.yml
>> @@ -21,7 +21,7 @@
>>         then
>>           ../meson/meson.py configure . -Dbackend_max_links="$LD_JOBS" ;
>>         fi || exit 1;
>> -    - make -j"$JOBS"
>> +    - env NINJA_STATUS="[ninja][%f/%t] " ninja | fgrep -v "[ninja]"
>>       - if test -n "$MAKE_CHECK_ARGS";
>>         then
>>           make -j"$JOBS" $MAKE_CHECK_ARGS ;
> 
> 
> This is too much for gitlab as it trips up on no output at all. 

I'm also not sure whether it is really safe to not run make here at all. 
Some parts of our build system still rely on the "make" magic, I think, and 
you might miss them if only running ninja. For example pc-bios/optionrom/ 
does not get compiled without running "make".
TBH, I also think the output of the file that currently gets compiled is 
still valuable in some cases, too, e.g. if you want to be sure whether 
certain files get compiled in one configuration at all or not. So I'm rather 
in favor in not doing this change.

  Thomas




