Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 582943A82C6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 16:26:47 +0200 (CEST)
Received: from localhost ([::1]:52652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltA1e-0002Gb-6Q
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 10:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lt9a3-00054w-T7
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:58:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lt9a2-0005gg-21
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:58:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623765493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=obwO+MtwkPg0nGh/vTFW7gFiYtri8bglGdRNRTuW0eY=;
 b=WktxdhL6w2sKe5p2E1EjCu0kh05Y82CpUb2gduxpKN31/jNUWpZKo7ZtBfMGPE5jyfX1b7
 oSYZUew10WoYqqxSkCQOLDW+eiBSJVPQJ0ugQUPzjkukXqKqiA0OTEczxuJeBY8q9jIJcv
 O+ynksyJZU45jHN6476ArYkWtuMk1Qw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-cncWXpHXO8yTT0bJ8ctkFQ-1; Tue, 15 Jun 2021 09:58:09 -0400
X-MC-Unique: cncWXpHXO8yTT0bJ8ctkFQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 jy19-20020a1709077633b02903eb7acdb38cso4552716ejc.14
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=obwO+MtwkPg0nGh/vTFW7gFiYtri8bglGdRNRTuW0eY=;
 b=KpfHlerKk+2iL5HntqUyyeZ6afj9kgEeJV/cbXVtmFKiah4byKsP7fO9zl+AIoL8Gz
 BltryhwwAPCmnLO3QUldzSAbmLjXdswK8doyXXdHoTVzwmmHymwauHpW0il2ewZUg6Fh
 SykBt6M43gm98zJo237nV3KQJPYK3o+QJy3o868OGzhrvhsZ8WXX3bS9S+iLMUiJoVB3
 J8UhAHEAJ5jJ5FEWuPg8A9IKjSa/6R4+mFAMMDetNKQNG5RjZDH5AEP57/hb0vExvI7P
 SR3W7bwySY9OOjXASfDjvX2y0HcreHh/wMJJpSPJHToUHrajJQXxevwOHBXf0LnmMa04
 r+2Q==
X-Gm-Message-State: AOAM532H8uQUddl3Oyp+EMdK7/a/B0Gr1V7Vub3mEbepYg+ZOTEhMxd8
 ft3b5lNgkSA31sbR7fkZLEY/C0ZK/s2xGB2OPCf9Dl4SdVl40Ub2RkykIPqTsuk/+CZPevo+O6M
 N/Pwr1ecnrWfeRAuqbl/rbi+E/BmPcP5R5vKQFbfJv/AZAAhymuiIfdZ6pt6T18Dbluo=
X-Received: by 2002:a17:906:eca7:: with SMTP id
 qh7mr21484129ejb.143.1623765487907; 
 Tue, 15 Jun 2021 06:58:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykYJV7eLJ79YiLrJbCDQod8stEDCuDBwke3rKvHoCqUDAIw4WB6xE06xYA0zrDlyDwU3SDoA==
X-Received: by 2002:a17:906:eca7:: with SMTP id
 qh7mr21484110ejb.143.1623765487721; 
 Tue, 15 Jun 2021 06:58:07 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q5sm7492457ejc.117.2021.06.15.06.58.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 06:58:06 -0700 (PDT)
Subject: Re: [PATCH 05/26] configure, meson: convert pam detection to meson
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
 <20210608112301.402434-6-pbonzini@redhat.com>
 <08135c0f-ce6b-53ad-be57-eba428fbfbf5@linaro.org>
 <YL/RJUcRTCzlLq2y@redhat.com>
 <c5386a2c-a3b4-0354-5cde-dcbecc587ca9@linaro.org>
 <YMDkOv/bkV5cWLp2@redhat.com>
 <54a2f6fd-64af-77f9-7e70-bbb335bdfdb9@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f29570b0-2bd0-fa3b-97ef-b6a952193687@redhat.com>
Date: Tue, 15 Jun 2021 15:58:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <54a2f6fd-64af-77f9-7e70-bbb335bdfdb9@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/06/21 18:47, Richard Henderson wrote:
> 
>> feature==disabled does not map to required: false
>>
>> https://mesonbuild.com/Build-options.html#features
>>
>> [quote]
>>      enabled is the same as passing required : true.
>>      auto is the same as passing required : false.
>>      disabled do not look for the dependency and always return 
>> 'not-found'.
>> [/quote]
> 
> Ah, thanks.  Documentation is all over the place with meson.  Anyway, I 
> would very much prefer the "if have_system" test above.
> 

The more complicated one was done to cover two cases:

* "not get_option('xyz').auto() makes --enable-xyz fail even if the 
library is otherwise unused.  This matches what configure does and I 
think it makes sense.

* have_system makes --disable-user without any --enable-* option not 
warn if a library is only used by system emulation and only has a shared 
library version available.  Here, configure used not to warn even though 
the configuration is bad, while meson does.

With Meson 0.59 there will be another way to write all of this:

   pam = cc.find_library('pam', has_headers: ['security/pam_appl.h'],
       required: get_option('auth_pam').disable_auto_if(not have_system),
       kwargs: static_kwargs)

Also, for something like

   if targetos != 'linux' and get_option('mpath').enabled()
     error('Multipath is supported only on Linux')
   endif

It will be possible to write

   get_option('mpath').require(targetos == 'linux',
       error_message: 'Multipath is supported only on Linux')

However, that's a few months away in QEMU.

Paolo


