Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF63544660
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 10:50:21 +0200 (CEST)
Received: from localhost ([::1]:42940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzDrw-0001mM-DK
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 04:50:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nzDpU-0000oa-1a
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 04:47:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nzDpE-0002uA-Dh
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 04:47:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654764449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ERxAYTdhpUt8CYXaZyaocUzR0FM58D4CfNk3bbLsjRo=;
 b=eor+j5sh/O0s1qwhvny51o9on35SEIgLTZuN2+wwAoFbx03en6tgQT8OnXKzlZfKd/xRT3
 4d6o0HWZT9iuH9iGMeME8HCHPE+U3J/hCbrL5An4Y49Bxf0CP4P7h+yDcrBugiBSFho32V
 tOWdSa7q7dPa/4WtDvjVQVjmAk2moiQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-p-m5IGJPPkaMIVPuyEbYfw-1; Thu, 09 Jun 2022 04:47:28 -0400
X-MC-Unique: p-m5IGJPPkaMIVPuyEbYfw-1
Received: by mail-wm1-f69.google.com with SMTP id
 k5-20020a05600c1c8500b003974c5d636dso11085020wms.1
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 01:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ERxAYTdhpUt8CYXaZyaocUzR0FM58D4CfNk3bbLsjRo=;
 b=lircktGjhDxAw+eUCkQ1dTD76ktPlMdCOhP8GCPx40jvP8toxtgV0XmWx6GKo9C10N
 mIXtqbzMnqdaT2x6xfLJtIRkSDcthaBSeAz4eoJIQuBy0odlm5BSh7cLWXmr5zdv70zv
 3Vwhvqbbi8KctYLIcdR2Iv18fzvEWKCgBKlHI0RgWZApHTH1YNC8vyKKLqyX4TqK0/6i
 c3rOHqNo6SGiRTP1Vq/FCO4sVoMeep55GvYRIAo8yIAV3V4W8HWJmRvG236RUBSQicyG
 FWhVk4e2slZmZI4xnyxaXABr1/NS1fXkKMDSGqujdLJwPxnOVGLJiHdKVlJf+ZJ0WjOq
 n3rw==
X-Gm-Message-State: AOAM532gKLa2Ub0aTmjluBgFkg6Fs1CyqULQGEQpSGkkMgjM1KHyJSKm
 mVE+sFwNBFCDnjsbkzINS5HNm4jsEAPqJshEKusAuSYJrOcc3uZc1XZ/opxFVRaJ3SF7TBXoT5n
 ejYV+nx39FdenDA8=
X-Received: by 2002:a5d:64c5:0:b0:218:3fcb:d909 with SMTP id
 f5-20020a5d64c5000000b002183fcbd909mr20161832wri.308.1654764446769; 
 Thu, 09 Jun 2022 01:47:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7vFhwbC/xPKfRRgEYVgB7itfNnU3aBdIyU33BeLYjF6Ha6jT88+AZb/Ql4gucHqgm/ogG9Q==
X-Received: by 2002:a5d:64c5:0:b0:218:3fcb:d909 with SMTP id
 f5-20020a5d64c5000000b002183fcbd909mr20161799wri.308.1654764446370; 
 Thu, 09 Jun 2022 01:47:26 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-42-115-130.web.vodafone.de.
 [109.42.115.130]) by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c4e8e00b0039c5642e430sm10925811wmq.20.2022.06.09.01.47.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 01:47:25 -0700 (PDT)
Message-ID: <03a1e04e-45c7-5002-6920-d04e29fd48fd@redhat.com>
Date: Thu, 9 Jun 2022 10:47:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] disas: Remove libvixl disassembler
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefan Weil <sw@weilnetz.de>
References: <20220603164249.112459-1-thuth@redhat.com>
 <07f021e7-1346-c6b3-3bd1-ef0d0f0e2ff5@suse.de>
 <52c51ac4-5598-faf2-d5e5-638cab0dc1fd@redhat.com>
 <7ae17984-89c4-2247-57a7-fde6206e41e0@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <7ae17984-89c4-2247-57a7-fde6206e41e0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 08/06/2022 17.51, Paolo Bonzini wrote:
> On 6/3/22 19:35, Thomas Huth wrote:
>> On 03/06/2022 19.26, Claudio Fontana wrote:
>>> On 6/3/22 18:42, Thomas Huth wrote:
>>>> The disassembly via capstone should be superiour to our old vixl
>>>> sources nowadays, so let's finally cut this old disassembler out
>>>> of the QEMU source tree.
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>
>>> agreed, one thought: at the time I added this thing, I had to add C++ 
>>> compilation support,
>>> maybe something we can now drop if there are no more C++ users?
>>
>> I thought about that, too, but we still have disas/nanomips.cpp left and 
>> the Windows-related files in qga/vss-win32/* .
> 
> That is pure C++ so it does not need the extra complication of "detect 
> whether the C and C++ compiler are ABI-compatible" (typically due to 
> different libasan/libtsan implementation between gcc and clang).  So it's 
> really just nanoMIPS that's left.

Ok, so the next theoretical question is: If we get rid of the nanomips.cpp 
file or convert it to plain C, would we then simplify the code in configure 
again (and forbid C++ for the main QEMU code), or would we rather keep the 
current settings in case we want to re-introduce more C++ code again in the 
future?

  Thomas


