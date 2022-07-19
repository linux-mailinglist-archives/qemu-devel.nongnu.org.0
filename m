Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B845797E4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 12:50:48 +0200 (CEST)
Received: from localhost ([::1]:45804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDkoR-0001kP-KF
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 06:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDkma-0008Ss-NQ
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 06:48:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDkmZ-0005K5-1d
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 06:48:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658227730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qmtBSPMw2hchMhazHBLccN1bzqXwnSBuZ+3GQOYYXn0=;
 b=SmGRMsUNnfZA+hUpRkYWYA22sxYNter5c61oeTkh5NBSoyJfYhgVGyAK2+9Kw3OKQVCscS
 phjdSEjRD510Ugu8St7pWUFIozt134Kcld1UcG/D0fvUtOcuToSzKWpjnkysQ1HL48lOn1
 NfFO7Mmsl1JxsZlnuKWbD9e3VzDOVNA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-MZenq6RjNIWwgCGIgONFFQ-1; Tue, 19 Jul 2022 06:48:43 -0400
X-MC-Unique: MZenq6RjNIWwgCGIgONFFQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 v23-20020adfa1d7000000b0021d620f5ef3so2464558wrv.16
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 03:48:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qmtBSPMw2hchMhazHBLccN1bzqXwnSBuZ+3GQOYYXn0=;
 b=gb6H8n4tWXZD0sZDaNXSQ8WbYNwsanHqeBeae+JIkEz3e1qXM+fKkK+vJwRUxueFVT
 naLilB2nmgpKaLqkslUa0j3zwAReet7iY7Sh4sdO5ENfzafCzgxV5ES8eejOLcF8xzVm
 Zu0wkWFYYf81nr57PSUUAungzg0OuU5U0mEUOCP3cncQFAb9MralVLVq8c6YyTgZJKEw
 G3MZ5J17jcR2jmsQYl4toBWG8AfrufSbzEHH6Pkzv4MVzHIiBGUbz6BKny9amwhdGe+T
 BxBN5mQbrFY8tPnpdGTcBcKVrLSc7ay5GFapw7kqLR6cCugIw32P3AmXjd26xh2jsawP
 Q6Ug==
X-Gm-Message-State: AJIora/IFXSCOuEkCgv/KVTenFZ7XJbRjbM6/fRBjccMGbKyhTWq/NeQ
 THO5ov2pxIxrESnzFbgNBQYQp4BgmZ6qLHtc+KzkG3z9E6Mn6NqBV2kzt5UCcXuLbivtw0Q/+3t
 2Sd+P28P1jR6TcEQ=
X-Received: by 2002:a05:6000:251:b0:21e:3acd:bc7f with SMTP id
 m17-20020a056000025100b0021e3acdbc7fmr1996306wrz.579.1658227721659; 
 Tue, 19 Jul 2022 03:48:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uBzQQLLbhRUiHbo/jupoVkAtFVkGB+1FZ3/M9zxcECP+vABPI4Tft0+mmcJoA6zQ5PxSzv6w==
X-Received: by 2002:a05:6000:251:b0:21e:3acd:bc7f with SMTP id
 m17-20020a056000025100b0021e3acdbc7fmr1996282wrz.579.1658227721414; 
 Tue, 19 Jul 2022 03:48:41 -0700 (PDT)
Received: from [10.33.198.128] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a5d4fc7000000b0021e434c7867sm537659wrw.36.2022.07.19.03.48.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 03:48:41 -0700 (PDT)
Message-ID: <89e4d09b-16d5-d2a0-14f2-3e4c778d43e4@redhat.com>
Date: Tue, 19 Jul 2022 12:48:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 0/3] target/s390x: vfmin/vfmax fixes
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220713182612.3780050-1-iii@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220713182612.3780050-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 13/07/2022 20.26, Ilya Leoshkevich wrote:
> Hi,
> 
> Uli has found an issue with finding maximum of different kinds of 0s; I
> wrote a test and found another one with finding maximum of different
> kinds of NaNs.
> 
> Patches 1 and 2 fix those issues, patch 3 adds a vfmin/vfmax test.
> 
> Best regards,
> Ilya
> 
> v1: https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg01915.html
> v1 -> v2: Drop mmap() in the test (Richard).
> 
> Ilya Leoshkevich (3):
>    target/s390x: fix handling of zeroes in vfmin/vfmax
>    target/s390x: fix NaN propagation rules
>    tests/tcg/s390x: test signed vfmin/vfmax
> 
>   fpu/softfloat-specialize.c.inc    |   3 +-
>   target/s390x/tcg/vec_fpu_helper.c |   4 +-
>   tests/tcg/s390x/Makefile.target   |   7 +
>   tests/tcg/s390x/vfminmax.c        | 411 ++++++++++++++++++++++++++++++
>   4 files changed, 422 insertions(+), 3 deletions(-)
>   create mode 100644 tests/tcg/s390x/vfminmax.c
> 

Thanks, queued to my s390x-next branch now:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas


