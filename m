Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE6331EE11
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 19:14:52 +0100 (CET)
Received: from localhost ([::1]:54138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCnpD-0005h1-CB
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 13:14:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lCncB-0003fw-Oy
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 13:01:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lCnc8-0007BZ-W0
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 13:01:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613671272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SxD99MwcQPP9e6ZTE+67inAiAo+a6lwl2MnBWOqCACE=;
 b=J2m3X6Bp65C7ShgSNiRXTwjCRhykRX2a0yrtzUlqWNlEyX9MBU2uaRu+gQZeWigCKmtCUO
 MgCGlynSAzlVXwkw3bF/1Ke8ALA8WTbJ/L1IFSVsI/JWayCHT+SgmrJepEU4sFdozXagxl
 mORRPtiIMUMgt5SfUqpy11DkkTxrtQE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-zNZVcvdYNHWAi0iNGLcnPg-1; Thu, 18 Feb 2021 13:01:11 -0500
X-MC-Unique: zNZVcvdYNHWAi0iNGLcnPg-1
Received: by mail-wm1-f72.google.com with SMTP id p8so1501985wmq.7
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 10:01:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SxD99MwcQPP9e6ZTE+67inAiAo+a6lwl2MnBWOqCACE=;
 b=FTimL9rBkirptc//5VbdycvaC+VSzNozPo7WpezMkwVfvaoM6OmOSuFNJ88a0UvA5v
 Zz8vzfZUMRqPoqow05HNGWYqQY8+9EHq0t5m5fDJ200+fel/dE/zfjKHiER8paKumzCz
 IWEQ8LdBJnLRcJ0KHS8Zn6G4+EvdWrXfUA5aL03itbAIQHwWD09W9US3gjDfXHAe3q+o
 mVQQLjky40sUxpne0X9H35aJCWz/pBNvo59qrH34BoiDynKnNc3RgP1PIWyG0BZ2kS4U
 5pcJ1CrDuy0u2hcGLgfb4+/bAEU76dj/NAAxLhzIyNZxSQT+z/9e1TwjRJxov/zNI6C5
 +1ig==
X-Gm-Message-State: AOAM533KXjfSM7FGJPCj6wVZrPDTHBagLf+a1lerziWwBZo96OMinX0u
 AYe6d4JW0gAa9qfcn1TVb6HNYT9OcftHp7kVrYOUovZ9Y9TppbY2FUsZBMymqMeLiASXoo9gUR5
 AqLUbW1PMIM/j4+k=
X-Received: by 2002:a1c:4603:: with SMTP id t3mr4727606wma.135.1613671267294; 
 Thu, 18 Feb 2021 10:01:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4zDs1+iVOmv6gAx7E0bsWwT//T5eEwB6aYQ+otllAUU/LT2S0OJZ81J0EKCi8C/RRt+Lzzw==
X-Received: by 2002:a1c:4603:: with SMTP id t3mr4727588wma.135.1613671267064; 
 Thu, 18 Feb 2021 10:01:07 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s14sm10210412wrw.88.2021.02.18.10.01.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 10:01:06 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210218172313.2217440-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] meson: Re-enable the possibility to run "make check
 SPEED=slow"
Message-ID: <fdc4d6ef-1a9b-ccac-9f86-588bc3fc3c1a@redhat.com>
Date: Thu, 18 Feb 2021 19:01:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210218172313.2217440-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/02/21 18:23, Thomas Huth wrote:
> "make check SPEED=slow" got lost in the conversion of the build
> system to meson - the tests were always running in "quick" mode.
> Fix it by passing the "-m" parameter to the test harness at the
> right spot in scripts/mtest2make.py.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   scripts/mtest2make.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
> index cbbcba100d..ee072c0502 100644
> --- a/scripts/mtest2make.py
> +++ b/scripts/mtest2make.py
> @@ -21,7 +21,7 @@ def __init__(self):
>   SPEED = quick
>   
>   # $1 = environment, $2 = test command, $3 = test name, $4 = dir
> -.test-human-tap = $1 $(if $4,(cd $4 && $2),$2) < /dev/null | ./scripts/tap-driver.pl --test-name="$3" $(if $(V),,--show-failures-only)
> +.test-human-tap = $1 $(if $4,(cd $4 && $2),$2) -m $(SPEED) < /dev/null | ./scripts/tap-driver.pl --test-name="$3" $(if $(V),,--show-failures-only)
>   .test-human-exitcode = $1 $(PYTHON) scripts/test-driver.py $(if $4,-C$4) $(if $(V),--verbose) -- $2 < /dev/null
>   .test-tap-tap = $1 $(if $4,(cd $4 && $2),$2) < /dev/null | sed "s/^[a-z][a-z]* [0-9]*/& $3/" || true
>   .test-tap-exitcode = printf "%s\\n" 1..1 "`$1 $(if $4,(cd $4 && $2),$2) < /dev/null > /dev/null || echo "not "`ok 1 $3"
> 

This is one way to do it, but it will be lost again when switching to 
"meson test".

Go ahead and commit it, I'll figure out something before switching.

Paolo


