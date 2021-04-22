Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC46368441
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 17:56:32 +0200 (CEST)
Received: from localhost ([::1]:37146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZbgt-0006bO-QQ
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 11:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lZbdy-0004Wo-0q
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 11:53:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lZbdw-0003eg-El
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 11:53:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619106807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y7IFrNEax6JwAtplbJWwpRJW4i+3NqSDNWX91m3gNIo=;
 b=eWc2oHepOOEDFNW/jvpmtsq+TWWGZW0wprAIGVMhoq8MIj0re3Oyh4wSQwv7tKtwb3Cb1C
 B1LX26iWZ20RidrhoTSES5OX9bQoF80FMlZkNrSYVn1hsfU8NLjOPtSo+wx7vmSerwTWuu
 Vrg2mhSDa6yFFhSRpmtcGTxXryyYc4k=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-ltIYWqQaNmOFnfttjAebLA-1; Thu, 22 Apr 2021 11:52:42 -0400
X-MC-Unique: ltIYWqQaNmOFnfttjAebLA-1
Received: by mail-ed1-f71.google.com with SMTP id
 c15-20020a056402100fb029038518e5afc5so9473916edu.18
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 08:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Y7IFrNEax6JwAtplbJWwpRJW4i+3NqSDNWX91m3gNIo=;
 b=bZHeO1/FctEEfF4PxUlk0Qb8y3OktuH2ivIaTC0tjdXYMeM0LxAw5b+g0TKkoYaLw0
 ccYbgpD6Sn1IzaCjlDeB7SWfUqkp86/BEbiZUGY+DaN/DPGGmp2jpM29HatcccU3/Wl/
 O0yfIi/nTYz7e5X5MK/3XW+Ryy6r30VQdD1foVKgSEE0BKiAAEq1uHV763qvWxcJuiBB
 e9u9+0p2rNI11X9ptUG93vQTMNueI2ALk+rmrwzu4Pd9xHtnabfXv+kvmjdCyAC9wXRo
 PI3cEIk2qfCAqXYMMk8vg3z+a/4ehB/5t1huP9ApoPDpD0n+woG65Vmpy5endi3FnRHn
 77xQ==
X-Gm-Message-State: AOAM533R5yCiaN0o95hY+CyJVy2vyOAxMRgMQWIYYtRztbfX/i500fnI
 YJGezQcJq9LZQu4V4YXxKypY+6S81nx5f85i9HRPZAjIp/7Tdpwr/wTA+ry+/Zk2tUXj1TWNS2i
 6xo8xxvbVl5zGmRI=
X-Received: by 2002:a17:907:9691:: with SMTP id
 hd17mr4180289ejc.205.1619106761550; 
 Thu, 22 Apr 2021 08:52:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIy0mEXcGLzLbFTbH2YFr1YVuf2JR0F/eYpdqhfcqJrNMQi5IheS3WPY9KYa4epADzQEvKBA==
X-Received: by 2002:a17:907:9691:: with SMTP id
 hd17mr4180254ejc.205.1619106761226; 
 Thu, 22 Apr 2021 08:52:41 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id u23sm2527552eds.8.2021.04.22.08.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 08:52:40 -0700 (PDT)
Date: Thu, 22 Apr 2021 17:52:38 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: s390-ccw: warning: writing 1 byte into a region of size 0
 [-Wstringop-overflow=]
Message-ID: <20210422155238.kak7tl3xnup5vod7@steredhat>
References: <4e327c80-8f5d-c848-b524-7f2c75255da4@redhat.com>
 <485773db-fca2-03ca-c6e8-90ef313fb8f1@redhat.com>
 <YIFMt+xg+xH+M4rd@redhat.com>
 <CAFEAcA8r2k9f=XG6T_hYk542-dDJnR7Lr8DZnyc=SFgnzNYxxQ@mail.gmail.com>
 <089df242-8788-a162-4a75-4c9c9e04a64e@redhat.com>
 <8afd0f34-7e75-2661-9ea5-3ebadff3b85d@redhat.com>
 <2ec6e995-6833-1ebd-03c8-a3fede7fddb8@de.ibm.com>
 <e4116908-7172-fd9c-1837-82c489b61620@redhat.com>
 <c95369e4-ffc9-d01d-45c1-4daad0ead6a5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c95369e4-ffc9-d01d-45c1-4daad0ead6a5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 22, 2021 at 05:38:26PM +0200, Thomas Huth wrote:
>On 22/04/2021 16.31, Philippe Mathieu-Daudé wrote:
>>On 4/22/21 2:41 PM, Christian Borntraeger wrote:
>>>On 22.04.21 13:47, Thomas Huth wrote:
>>>>On 22/04/2021 13.24, Philippe Mathieu-Daudé wrote:
>>>>>On 4/22/21 12:30 PM, Peter Maydell wrote:
>>>>>>On Thu, 22 Apr 2021 at 11:18, Daniel P. Berrangé
>>>>>><berrange@redhat.com> wrote:
>>
>>>>>This silents the warning however:
>>>>>
>>>>>-- >8 --
>>>>>diff --git a/pc-bios/s390-ccw/libc.h b/pc-bios/s390-ccw/libc.h
>>>>>index bcdc45732d..2dea399904 100644
>>>>>--- a/pc-bios/s390-ccw/libc.h
>>>>>+++ b/pc-bios/s390-ccw/libc.h
>>>>>@@ -19,6 +19,8 @@ typedef unsigned short     uint16_t;
>>>>>   typedef unsigned int       uint32_t;
>>>>>   typedef unsigned long long uint64_t;
>>>>>
>>>>>+#pragma GCC diagnostic push
>>>>>+#pragma GCC diagnostic ignored "-Wstringop-overflow"
>>>>>   static inline void *memset(void *s, int c, size_t n)
>>>>>   {
>>>>>       size_t i;
>>>>>@@ -30,6 +32,7 @@ static inline void *memset(void *s, int c, size_t n)
>>>>>
>>>>>       return s;
>>>>>   }
>>>>>+#pragma GCC diagnostic pop
>>>>
>>>>Honestly, that compiler "bug" sounds like it could trigger at any
>>>>other spot in the bios code, too, since we are doing lots of direct
>>>>accesses to low memory there. I think it's likely best if we shut it
>>>>off with -Wno-stringop-overflow in the pc-bios/s390-ccw/Makefile ...
>>>>could you please try to add it there?
>>>
>>
>>We are good with:
>>
>>-- >8 --
>>diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
>>index 29fd9019b8..dcec09b6f9 100644
>>--- a/pc-bios/s390-ccw/Makefile
>>+++ b/pc-bios/s390-ccw/Makefile
>>@@ -8,6 +8,9 @@ CFLAGS = -O2 -g
>>  quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 &&
>>$1, @$1))
>>  cc-option = $(if $(shell $(CC) $1 -S -o /dev/null -xc /dev/null >
>>/dev/null \
>>               2>&1 && echo OK), $1, $2)
>>+cc-c-option = $(if $(shell $(CC) $1 $2 -c -o /dev/null -xc /dev/null \
>>+                >/dev/null 2>&1 && echo OK), $2, $3)
>>
>>  VPATH_SUFFIXES = %.c %.h %.S %.m %.mak %.sh %.rc Kconfig% %.json.in
>>  set-vpath = $(if $1,$(foreach PATTERN,$(VPATH_SUFFIXES),$(eval vpath
>>$(PATTERN) $1)))
>>@@ -30,6 +33,7 @@ OBJECTS = start.o main.o bootmap.o jump2ipl.o sclp.o
>>menu.o \
>>           virtio.o virtio-scsi.o virtio-blkdev.o libc.o cio.o dasd-ipl.o
>>
>>  QEMU_CFLAGS := -Wall $(filter -W%, $(QEMU_CFLAGS))
>>+QEMU_CFLAGS += $(call cc-c-option, $(QEMU_CFLAGS), -Wno-stringop-overflow)
>>  QEMU_CFLAGS += -ffreestanding -fno-delete-null-pointer-checks
>
>I think you don't need the "cc-c-option" magic here. Just add the 
>-Wno-stringop-overflow. All supported versions of GCC and Clang simply 
>silently ignore unknown -Wno-something options (try e.g. "gcc 
>-Wno-yadayadayada" on the command line).

Clang seems not to like it. It's always a mess to do anything for gcc 
and clang :-(

Maybe we can set also `-Wno-unknown-warning-option`.

$ clang -Wno-stringop-overflow -Werror main.c
error: unknown warning option '-Wno-stringop-overflow'; did you mean '-Wno-shift-overflow'? [-Werror,-Wunknown-warning-option]

$ clang --version
clang version 11.0.0 (Fedora 11.0.0-2.fc33

Stefano


