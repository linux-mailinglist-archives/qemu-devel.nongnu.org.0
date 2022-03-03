Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A504CC438
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 18:45:26 +0100 (CET)
Received: from localhost ([::1]:55082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPpW1-00088z-Nj
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 12:45:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPpTb-0006Ki-A6
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:42:55 -0500
Received: from [2607:f8b0:4864:20::102b] (port=37474
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPpTY-00039h-Fc
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:42:54 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 p3-20020a17090a680300b001bbfb9d760eso8300953pjj.2
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 09:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2ZZisGQmLf0AFUp+l7xldLRhWxE22TEJT2GzThS7D7A=;
 b=m5+YrSvpP6mcv2dXOASUG8r8WASyAtOsSHcdTX10idulSM7Bse4EXphRguvTG0EEvJ
 jwS7JCB9WtoF87LkeZI/Ye0roXPkDfif0T394Rxo3bZ0t7IyB3kOSSyKLLXNW192GywS
 P2XEXE+/atwIyvVTSjmNu7haeVq8qJZtmIC/rCf6jzn6hArTA4KBsjUT/fc3fmJ9O3sB
 XQnODI9JIvzaq1Q/otT0pW0Yxv9aGj9npAkYFoTikbTVXvKCPkQewqWguvzBuVNsW/PX
 ujgoOES7C9Woim51Qbbp1JNFme48mOZopcJcwqj16gFugV7hpIreCYGHz1HiT9yXKpjP
 txqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2ZZisGQmLf0AFUp+l7xldLRhWxE22TEJT2GzThS7D7A=;
 b=ejqHJm7hmqOUsd6stSiNf6UG+YNZJp7kGTIdWbCtkguvTiGdzyV9LZFpseBsSLP5RF
 ZAMds7xt2SNN0HAp283OXcmkgbjM/Lc54rqd51j0pz8naffTJV3IT4DCYTdR8Az/mXAM
 6yVw3hmkrE66bAwulpX82QVOOXBxN/OnDqH3tM9EtaCAaI04m3dr+YAuGkOI2E9Ls3WI
 AqAM7KL2fMKd8I6WW2RGx3KXn3ZLCU/G0tmEenEw2HmqtVy23TwUwzoBJoY7R9YJ1mhS
 xeWKY4xrQ49wxDgm7XIGFHNwtcqIZ153vB2tCoXmnwqqy5DD+8w248gohqfeFsDq1gzB
 9Itg==
X-Gm-Message-State: AOAM530zrX1EFqF8e6uwEo5n/PgE+3oKOnPS/YF+yZHsWlOES3IagbIN
 OecoqJBQsrbUXQqcfrhsCbUvYw==
X-Google-Smtp-Source: ABdhPJyVMRjjd1DX0AtvFLw84D/+eJthn1xS0wPDJ2/URCKk/lfgVTRVBm9KD8hRf669B/r/2E0xlA==
X-Received: by 2002:a17:90a:bb8d:b0:1bc:72a9:a07d with SMTP id
 v13-20020a17090abb8d00b001bc72a9a07dmr6457005pjr.9.1646329370954; 
 Thu, 03 Mar 2022 09:42:50 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:e819:4400:f268:c391?
 (2603-800c-1201-c600-e819-4400-f268-c391.res6.spectrum.com.
 [2603:800c:1201:c600:e819:4400:f268:c391])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a056a00170700b004e01663f59bsm3524348pfc.117.2022.03.03.09.42.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 09:42:50 -0800 (PST)
Message-ID: <9fa82035-b273-9c44-16e4-c859a6de5b6b@linaro.org>
Date: Thu, 3 Mar 2022 07:42:46 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 1/2] s390x/tcg: Implement Vector-Enhancements Facility
 2 for s390x
Content-Language: en-US
To: David Miller <dmiller423@gmail.com>
References: <20220303032219.17631-1-dmiller423@gmail.com>
 <20220303032219.17631-2-dmiller423@gmail.com>
 <9ad00abf-4380-4efc-4012-aee5a36ff6e6@linaro.org>
 <CAEgyohXjXw-aZJX0qm3dReAUkMax-SmS9oAfR90XFX_q2i1msQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAEgyohXjXw-aZJX0qm3dReAUkMax-SmS9oAfR90XFX_q2i1msQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 farman@linux.ibm.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/22 06:50, David Miller wrote:
> 
>  > Too many changes in one patch.
>  > You need to split these into smaller, logical units.
> 
> Can you give some guideline on that?
> IE: change to two,  the shifts and reversed loads into two patches or more on line count 
> of each patch?

Your best guide is line count: < 50 is ideal, though of course that can't always be done. 
  For bug fixes or code reorg you may find yourself constrained by not breaking bisection.

But for new code, like this, one patch per feature is easiest to review.  In this case 
you've got:

   - load/store elements reversed,
   - load/store byte reversed elements,
   - shift double
   - string search
   - modify fp convert
   - modify shift

> I wasn't sure if there was a reason MO_TE was used so just kept with the existing code flow.

We have to put some indication of endianness there, and "target" endian was the easiest to 
replicate across all targets.  Especially with those that are bi-endian.

I've just noticed that we haven't propagated this to the integer load/store reversed.  I 
presume that code pre-dates the existence of the feature.  But it would be good to change

     C(0xe31f, LRVH,    RXY_a, Z,   0, m2_16u, new, r1_16, rev16, 0)
     C(0xe31e, LRV,     RXY_a, Z,   0, m2_32u, new, r1_32, rev32, 0)
     C(0xe30f, LRVG,    RXY_a, Z,   0, m2_64, r1, 0, rev64, 0)
...
     C(0xe33f, STRVH,   RXY_a, Z,   la2, r1_16u, new, m1_16, rev16, 0)
     C(0xe33e, STRV,    RXY_a, Z,   la2, r1_32u, new, m1_32, rev32, 0)
     C(0xe32f, STRVG,   RXY_a, Z,   la2, r1_o, new, m1_64, rev64, 0)

to use little-endian memory ops, rather than separately reversing the bytes.


r~

