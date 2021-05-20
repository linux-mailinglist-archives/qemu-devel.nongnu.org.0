Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A0B38AFCC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 15:19:35 +0200 (CEST)
Received: from localhost ([::1]:46316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljiaM-0007Pq-Pi
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 09:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljiYm-0006ZB-4n
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:17:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljiYe-0006vP-Vx
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:17:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621516666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5/2xfKdqvhrfYvyNLa/7uhXRTUN7D4oZ/we7lHrn/Ek=;
 b=fzjayS+HlKAwUxwFmfESzzB4QVwWPFCkyC/+CrISQlc4NOhpRA8kqryjV3rG7n+ynLrcqZ
 QBWzx69UEPmpnShM4Ibx8AFjasyMsAKW5dFE6+m047PKLE9IrpWnb6S38pqcOXgzxs+fqj
 mz06aFpRRws1MgbRLbOgvXriZ+N8IJo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-A6R6aiQHP9ahVjWCVd6x9A-1; Thu, 20 May 2021 09:17:43 -0400
X-MC-Unique: A6R6aiQHP9ahVjWCVd6x9A-1
Received: by mail-wr1-f71.google.com with SMTP id
 t5-20020adfb7c50000b029010dd0bb24cfso8618171wre.2
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 06:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5/2xfKdqvhrfYvyNLa/7uhXRTUN7D4oZ/we7lHrn/Ek=;
 b=HCnQOkSN9itE7TB1S24FWOugxtBZavhJNvKaHN0uTvNlzdSe8RjarsWKo5w/0SxjES
 lFrHMm6zzUsd9GoCGRdPRGhtTdOVXM+RTyYgI7ZeTnI2c05kJXg2jznAjLfNhr8QkS6u
 YZucGyvHoQ8o7krzJGxH9g3FVVsrPTPVN4sWvIGaNw1rHZonH7uTFRm0Vsb818TAseIh
 /j6GiHw5RkLEbG7bJlIHs3Sk/4mWzvsU9pCGKESpXmwtgg1vFzfff+/BeOjYXpu++8Jk
 3Oxv+yUFW1w72+bFTqP0nBj1M/t5qw6hxD/zhcN337a2q4c797fdpLBy8acLfzJePO2F
 MOtQ==
X-Gm-Message-State: AOAM532enyw4aYsFKkDEsECBbiZnhP8cD+rfoicoiR3yrP5/5fz1AMw7
 AOo9Mc8KWf+/Jt5sLV89BYEUA5yHcR69NWlFIdEYi54XZMqgW45Qz0oeC5ghfLswhl8eyta+tzp
 7/GvioATgrHk4Md4=
X-Received: by 2002:a05:600c:2256:: with SMTP id
 a22mr3929797wmm.138.1621516661808; 
 Thu, 20 May 2021 06:17:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztXyuXWiI2NK6lwGpmzlngCgqkBgREx/k9xVx1c0S4gwfskNDOHjl04cWu8K5zn66zvlvI/Q==
X-Received: by 2002:a05:600c:2256:: with SMTP id
 a22mr3929776wmm.138.1621516661621; 
 Thu, 20 May 2021 06:17:41 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id q20sm9072676wmq.2.2021.05.20.06.17.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 06:17:41 -0700 (PDT)
Subject: Re: [PULL 00/59] Linux user for 6.1 patches
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210518053131.87212-1-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8e7668fe-9457-112c-04ec-ac91d67b0484@redhat.com>
Date: Thu, 20 May 2021 15:17:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 7:30 AM, Laurent Vivier wrote:
> The following changes since commit 6d34aa9969ff85ca6eaeb4dc1988a4d4e13e7d79:
> 
>   Merge remote-tracking branch 'remotes/marcandre/tags/rtd-pull-request' into staging (2021-05-14 17:20:08 +0100)
> 
> are available in the Git repository at:
> 
>   git://github.com/vivier/qemu.git tags/linux-user-for-6.1-pull-request
> 
> for you to fetch changes up to 4a1e8931eca05077afd0b7ed092ab0f10c5b457e:
> 
>   linux-user/elfload: add s390x core dumping support (2021-05-18 07:10:46 +0200)
> 
> ----------------------------------------------------------------
> linux-user pull request 20210517
> 
> - alpha sigaction fixes/cleanups
> - s390x sigaction fixes/cleanup
> - sparc sigaction fixes/cleanup
> - s390x core dumping support
> - core dump fix (app name)
> - arm  fpa11 fix and cleanup
> - strace fixes (unshare(), llseek())
> - fix copy_file_range()
> - use GDateTime
> - Remove dead code
> 
> ----------------------------------------------------------------

Can this pull request randomly trigger this?

timeout --foreground 15  /home/travis/build/qemu/qemu/build/qemu-s390x
linux-test >  linux-test.out
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
../Makefile.target:156: recipe for target 'run-linux-test' failed
Segmentation fault
make[2]: *** [run-linux-test] Error 139
make[2]: Leaving directory
'/home/travis/build/qemu/qemu/build/tests/tcg/s390x-linux-user'
/home/travis/build/qemu/qemu/tests/tcg/Makefile.qemu:102: recipe for
target 'run-guest-tests' failed
make: *** [run-tcg-tests-s390x-linux-user] Error 2

See:
https://travis-ci.org/github/qemu/qemu/jobs/771784674#L12147


