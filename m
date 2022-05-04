Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12EF519B49
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 11:14:55 +0200 (CEST)
Received: from localhost ([::1]:53688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmB5y-0003NC-G2
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 05:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmB2M-0008Rp-7j
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:11:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmB2H-00019f-4B
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:11:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651655463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0CsK9xPf5UsJBAS8H05MmF8FYpl67ndffOG17dNM+uw=;
 b=RjJRA5N3zYGgxfgtrotkqmo9cSmdDn8UvrDO7qLhWVmNWxfm3+RbPY9Lu32x34XrSOtQ8E
 6M35Cr36ChOuw857amWh69j0Kha37KiHUMoKsacHDxVcHYLN2jMelPW7zfd9vs9RO4+43w
 9h2H+yZPclozRsejnv3G3WjoxGfO5u4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-k-dyj2N1OgejcJdR_JxK_g-1; Wed, 04 May 2022 05:11:02 -0400
X-MC-Unique: k-dyj2N1OgejcJdR_JxK_g-1
Received: by mail-wm1-f72.google.com with SMTP id
 t184-20020a1c46c1000000b00394209f54f1so439692wma.4
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 02:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0CsK9xPf5UsJBAS8H05MmF8FYpl67ndffOG17dNM+uw=;
 b=MmcCZpbxVqYXC5L6aLDcyzRvjkmVe5heRDkUQtOOhNetueCkFbkbOkSB+eJlD7X0bX
 vUYGDdaIyfcLm8TdMAODWJRrczTJGdZ8hD1A3Li6fyAfhyzNkHHzsSnrHLKQE99DRphp
 bQ/PKkIKbJdTEe047nLzCJnIo7tPrIgQ6PJuLQMumKJHcKH5/X+teE/CAIyhirEkg6ho
 ZUbunaAKxpwhHAqVgcQZB1dYdKCTzf3utRndlIUyPNfUfips9o4m1Pmdx+r2RrodyBlG
 Y7RLTMwfK+rtbkeAyMqiAwzcbBWUs5SbktZjJaVU0IEQ8IRbjIk896YbmRH7OIQ1ZFwr
 rOHQ==
X-Gm-Message-State: AOAM532EkeJ13rAnkQexa04FQCNdMSR7gkhwd10HBeNdcf0/LYJaxLLT
 3SCb1ro0Y/8uaqZRYCyPqt7hMeBDj9JOh6XxucG839HFua9cQpylSHCkQPzvdIW8tx2nkEEgyeA
 vi11OTy8GOwH6SJg=
X-Received: by 2002:a05:600c:3ac6:b0:38e:d79e:d9a with SMTP id
 d6-20020a05600c3ac600b0038ed79e0d9amr6777285wms.200.1651655461093; 
 Wed, 04 May 2022 02:11:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPNf1DJVPNTRy4YcKhDGTtZVw3FSs1K7R5weNkCldNvUnXzYmOxuUyp9qHAs46vD9Luf4NIg==
X-Received: by 2002:a05:600c:3ac6:b0:38e:d79e:d9a with SMTP id
 d6-20020a05600c3ac600b0038ed79e0d9amr6777265wms.200.1651655460851; 
 Wed, 04 May 2022 02:11:00 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-177-80.web.vodafone.de.
 [109.43.177.80]) by smtp.gmail.com with ESMTPSA id
 j1-20020adfa541000000b0020c5253d926sm11165840wrb.114.2022.05.04.02.10.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 02:11:00 -0700 (PDT)
Message-ID: <9bb77dc1-6aef-af57-19a2-93d0f6a4e793@redhat.com>
Date: Wed, 4 May 2022 11:10:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 00/13] s390x/tcg: Implement Vector-Enhancements
 Facility 2
Content-Language: en-US
To: David Miller <dmiller423@gmail.com>
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
References: <20220428094708.84835-1-david@redhat.com>
 <97f9be15-4ccd-505b-a35e-8d95823df03a@redhat.com>
 <85dffe1d-a6d2-9e93-749b-29febb0b6dc5@redhat.com>
 <CAEgyohV9kjXUW_LMQM7YryQL1=0VW3pSCbffG2uFG7d5vNo5iw@mail.gmail.com>
 <348d3383-0bd4-1f18-2d14-08962be66c32@redhat.com>
 <CAEgyohUw8GBMaoKpVB4D0GCbKVQ1NTaT9px6LBX1BsS-ex-nxg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAEgyohUw8GBMaoKpVB4D0GCbKVQ1NTaT9px6LBX1BsS-ex-nxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 03/05/2022 16.42, David Miller wrote:
> Sorry,  It was in the discussion for v4 patches,  as an attachment .
> mail thread:
> [PATCH v4 10/11] tests/tcg/s390x: Tests for Vector Enhancements Facility 2
> So it likely never made it to the mailing list.
> 
> I've reattached and will forward the patch (by itself) to the mailing list.
> 
> I think the other solution works just as well by ignoring if compiler
> doesn't support z15.
> 
> I just thought I'd bring it back up as I saw discussion about it.

Ok, I now gave this a try ... and while this should now work fine with older 
versions of gcc/binutils, it's failing with Clang now:

   BUILD   s390x-linux-user guest-tests
/home/thuth/devel/qemu/tests/tcg/s390x/vxeh2_vs.c:14:18: error: couldn't 
allocate output register for constraint 'v'
     asm volatile(".insn vrr, 0xE70000000074, %[v1], %[v2], %[v3], 0,0,0\n"
                  ^
/home/thuth/devel/qemu/tests/tcg/s390x/vxeh2_vs.c:22:18: error: couldn't 
allocate output register for constraint 'v'
     asm volatile(".insn vrr, 0xE7000000007E, %[v1], %[v2], %[v3], 0,0,0\n"
                  ^
/home/thuth/devel/qemu/tests/tcg/s390x/vxeh2_vs.c:30:18: error: couldn't 
allocate output register for constraint 'v'
     asm volatile(".insn vrr, 0xE7000000007C, %[v1], %[v2], %[v3], 0,0,0\n"
                  ^
/home/thuth/devel/qemu/tests/tcg/s390x/vxeh2_vs.c:40:18: error: couldn't 
allocate output register for constraint 'v'
     asm volatile(".insn vrr, 0xE70000000086, %[v1], %[v2], %[v3], 0, %[I], 0\n"
                  ^
/home/thuth/devel/qemu/tests/tcg/s390x/vxeh2_vs.c:51:18: error: couldn't 
allocate output register for constraint 'v'
     asm volatile(".insn vrr, 0xE70000000087, %[v1], %[v2], %[v3], 0, %[I], 0\n"
                  ^
5 errors generated.
make[1]: *** [../Makefile.target:109: vxeh2_vs] Error 1
make[1]: *** Waiting for unfinished jobs....
/home/thuth/devel/qemu/tests/tcg/s390x/vxeh2_vcvt.c:14:18: error: couldn't 
allocate output register for constraint 'v'
     asm volatile(".insn vrr, 0xE700000000C3, %[v1], %[v2], 0, %[m3], %[m4], 
%[m5]\n"
                  ^
/home/thuth/devel/qemu/tests/tcg/s390x/vxeh2_vcvt.c:25:18: error: couldn't 
allocate output register for constraint 'v'
     asm volatile(".insn vrr, 0xE700000000C1, %[v1], %[v2], 0, %[m3], %[m4], 
%[m5]\n"
                  ^
/home/thuth/devel/qemu/tests/tcg/s390x/vxeh2_vcvt.c:36:18: error: couldn't 
allocate output register for constraint 'v'
     asm volatile(".insn vrr, 0xE700000000C2, %[v1], %[v2], 0, %[m3], %[m4], 
%[m5]\n"
                  ^
/home/thuth/devel/qemu/tests/tcg/s390x/vxeh2_vcvt.c:47:18: error: couldn't 
allocate output register for constraint 'v'
     asm volatile(".insn vrr, 0xE700000000C0, %[v1], %[v2], 0, %[m3], %[m4], 
%[m5]\n"
                  ^
4 errors generated.

...

Thus I think I'll rather go with the other approach instead that checks for 
the availability of -march=z15.

  Thomas


