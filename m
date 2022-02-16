Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C334B9302
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 22:08:56 +0100 (CET)
Received: from localhost ([::1]:35422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKRXj-00005L-9B
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 16:08:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nKRVJ-0006TM-Vk
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 16:06:25 -0500
Received: from [2a00:1450:4864:20::532] (port=44564
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nKRVG-0003GM-VZ
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 16:06:25 -0500
Received: by mail-ed1-x532.google.com with SMTP id x5so6045347edd.11
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 13:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JZ34b1pTOCWTCCR+vcaeUxJXtmWyzwWkGOsgWbGrGXc=;
 b=U3vef0ioD6ABJVmp/tYlpFzZnyVKlIm2Xg/RKZHC93NYIVa62kx+CsQi5AM3Rl4tIG
 P8LXkoNRPLH8AxU+V04ou95j2u5WNeXlmyFWK4HZPIGeBk6HBd6OiZ8p5yW4T1+CY4Cg
 SO0W9CyX4O9jHrGnat1Is6Bk9eYdrye/M3ssnU7aOPx9F5Ji0QmzdAhU4p3BitpgnSKV
 1m81T0K+Z3Bwcz6ZfjQ8QkeBSRHIr4g0QZcJQeAlajb1ORAPpohQ0c2J0xXLjUodEZhQ
 TBcvubeVgfk0O4Bo+rhHzpq4Zs9gMef1a7eUJN66XYU2R1mge35e5XdUbeEZ6vC+S3jy
 GXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JZ34b1pTOCWTCCR+vcaeUxJXtmWyzwWkGOsgWbGrGXc=;
 b=MaINaCpUyUHaOwpssd6lCJColyhOl0ZolIg54IWDDaLpe+1gCEU9DQi6gG0rrX/vv6
 i4X9dzKCOy7KPt0ChMRbdFrlAu5S/XqUBsgl+K1Ys8UXgSa8c22wTPy5VJiTarwXjqcl
 xyb+BYEmzSgfE5mHF2AaSBRJgBxp3WZs9nadSy4lxlVqOYggS7ZWmNKyPKQUYdFdtaeP
 47i2U21+MvSBQL720BcAatRo6bW7qwneB9rW/xeRBOktSu/5i+/ywBHP1AybXkYvqIGN
 ovtz81fYstUSY9tyuywOWHVhMgMiCziO8MabvgCSBEKMWan2VVorHUyu7fGGfNY2L1mH
 hifA==
X-Gm-Message-State: AOAM531rSCIMOF8fG+1arLn0elkBo80Xz4nEO3YaYZNNDz+vNhl8A975
 T4rYa6FJNQLo3cKMaJzuF3A=
X-Google-Smtp-Source: ABdhPJzcY1rZvDN9rvG9a3EYUSJ1TM8YkE3t6IXiBKv0uc6HLlnX6a+75x5s0Sl0jUrhkEnbKK2phg==
X-Received: by 2002:a05:6402:511:b0:40d:e8eb:1dbb with SMTP id
 m17-20020a056402051100b0040de8eb1dbbmr4941723edv.418.1645045580485; 
 Wed, 16 Feb 2022 13:06:20 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id en27sm286536edb.5.2022.02.16.13.06.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 13:06:19 -0800 (PST)
Message-ID: <bf2d63eb-54f1-16a2-b133-4932f8021250@redhat.com>
Date: Wed, 16 Feb 2022 22:06:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL 00/30] Misc mostly build system patches for 2022-02-15
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220215093223.110827-1-pbonzini@redhat.com>
 <CAFEAcA_xPeknSFpf0M9vETUXk8fW0gfiKg7eiJszJfagsJubqw@mail.gmail.com>
 <d4976978-b8bc-83ec-1a8a-9618d6ea6e98@redhat.com>
 <CAFEAcA_DvHUN_TJ4-4oDsu9sDOAqde967YtcJhGCqvBC8u4zbg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA_DvHUN_TJ4-4oDsu9sDOAqde967YtcJhGCqvBC8u4zbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/22 15:41, Peter Maydell wrote:
> On Wed, 16 Feb 2022 at 14:03, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 2/16/22 10:56, Peter Maydell wrote:
>>> Hi; this fails to build on OpenBSD (on the tests/vm/ setup).
>>>
>>> Meson thinks it's found OpenGL:
>>>       OpenGL support (epoxy)       : YES 1.5.4
>>>
>>> but either it's wrong or else it's not putting the right
>>> include directory onto the path, because the compiler
>>> fails to find the headers:
>>>
>>> In file included from ../src/hw/arm/virt.c:42:
>>> In file included from
>>> /home/qemu/qemu-test.sr5128/src/include/hw/vfio/vfio-calxeda-xgmac.h:17:
>>> In file included from
>>> /home/qemu/qemu-test.sr5128/src/include/hw/vfio/vfio-platform.h:20:
>>> In file included from
>>> /home/qemu/qemu-test.sr5128/src/include/hw/vfio/vfio-common.h:27:
>>> /home/qemu/qemu-test.sr5128/src/include/ui/console.h:11:11: fatal
>>> error: 'epoxy/gl.h' file not found
>>> # include <epoxy/gl.h>
>>>             ^~~~~~~~~~~~
>>> 1 error generated.
>>
>> Yeah, there's a lot of uses of ui/console.h and they all need
>> epoxy/gl.h.  That's in need of some cleanup.
> 
> Why can't meson just do the same thing configure was doing,
> ie add the include path to the cflags and the library path
> to the linker flags?

Yes, it can do that as well.  I found it now:

@@ -43,7 +43,6 @@ vnc_ss.add(zlib, png, jpeg, gnutls)
  vnc_ss.add(when: sasl, if_true: files('vnc-auth-sasl.c'))
  softmmu_ss.add_all(when: vnc, if_true: vnc_ss)
  softmmu_ss.add(when: vnc, if_false: files('vnc-stubs.c'))
-specific_ss.add(when: ['CONFIG_SOFTMMU'], if_true: opengl)

  ui_modules = {}


Paolo

