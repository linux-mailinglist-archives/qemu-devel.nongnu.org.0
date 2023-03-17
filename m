Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA006BE75A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 11:56:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd7jh-0007GL-KE; Fri, 17 Mar 2023 06:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd7jg-0007G3-1s
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 06:55:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd7je-0006Lt-A8
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 06:54:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679050496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9utPEo+T98Q/GqWF6myYlDcTDptkawe2tNUWJ4zHG0E=;
 b=BFjkvAkU+F+FCZTh9UIOdaPnK2QFQLBfL6f+wJrS4A9U4WDuYDwV4BzkXarBZ6nV7fZ+1x
 gXlOXjy+r4Cv5Q8QYy8apJ+L1663GNRGP+KIen8DHR8RWk0YYhok73lTqps6dXE9o+faPT
 hRVndzOTiwZj6ThenPkZ99+I0sjpb+A=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-wmKEJypRNQ-WE25WOZznUw-1; Fri, 17 Mar 2023 06:54:55 -0400
X-MC-Unique: wmKEJypRNQ-WE25WOZznUw-1
Received: by mail-qk1-f199.google.com with SMTP id
 x18-20020a05620a099200b00745c25b2fa3so2428897qkx.16
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 03:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679050489;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9utPEo+T98Q/GqWF6myYlDcTDptkawe2tNUWJ4zHG0E=;
 b=LB4bZFqkAP5HpO3XvbAme6uEBkTIqhTqZvAvtbt4yv4QZEsZN28OJscqnxkoxHkAV+
 Yq7/juxypmk2UWNthPzsKWlOfeJLK895OO9qe+tLa+v/sVqsJhiykcvDCbHAvnzrwYE2
 o+VpiCRyFt7n9P9Q4RF0E6QCoOFRQqqD1l4ebFzbAoVBxNc75JeXxot7fw/UmJYcRVqv
 AbwRYJxLWsJhtnBHWKHDVWmpZrYu4a6n5h8aDERgIuszs4gusH1OxYqR0WvymTAzn5Ee
 ECjxIUkz7meCqjZOIzZWBbz1nivvx8S0TACPr2irMSmY+bQfi/9Sh28A95OPDm1pVZRs
 N++g==
X-Gm-Message-State: AO0yUKUCQaw25IcNYeiiEaR6ZerqI2UBogYAvSTtTDNVUfE2sVzCllvM
 sQFAMSNF2BQjNHb22Q5JsPBut7V3yLb+te1jy4lDMx8TNA/P7WO2XuCROygDCuJ62YxL3WF5B4Y
 aHQn4KHTrI32ryIE=
X-Received: by 2002:ac8:7f02:0:b0:3db:c27c:e08e with SMTP id
 f2-20020ac87f02000000b003dbc27ce08emr399243qtk.68.1679050488871; 
 Fri, 17 Mar 2023 03:54:48 -0700 (PDT)
X-Google-Smtp-Source: AK7set+lFKGKJ58UP5Zz5QuBsxyTRZRoQ29BT0f5+dpDiaI5t7ox8Ra98UNf4epuh7WxmLn9EDaGQw==
X-Received: by 2002:ac8:7f02:0:b0:3db:c27c:e08e with SMTP id
 f2-20020ac87f02000000b003dbc27ce08emr399227qtk.68.1679050488622; 
 Fri, 17 Mar 2023 03:54:48 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-33.web.vodafone.de.
 [109.43.176.33]) by smtp.gmail.com with ESMTPSA id
 t72-20020a37464b000000b00725d8d6983asm1431062qka.61.2023.03.17.03.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 03:54:47 -0700 (PDT)
Message-ID: <41989f42-bca7-759f-8942-8b295d9f48eb@redhat.com>
Date: Fri, 17 Mar 2023 11:54:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 12/12] tests/tcg/s390x: Test unaligned accesses
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20230316164428.275147-1-iii@linux.ibm.com>
 <20230316164428.275147-13-iii@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230316164428.275147-13-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 16/03/2023 17.44, Ilya Leoshkevich wrote:
> Add a number of small test that check whether accessing unaligned
> addresses in various ways leads to a specification exception.
> 
> Run these test both in softmmu and user configurations; expect a PGM
> in one case and SIGILL in the other.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
...
> diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
> index 725b6c598db..6d8bf299b28 100644
> --- a/tests/tcg/s390x/Makefile.softmmu-target
> +++ b/tests/tcg/s390x/Makefile.softmmu-target
> @@ -1,11 +1,20 @@
>   S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
>   VPATH+=$(S390X_SRC)
>   QEMU_OPTS=-action panic=exit-failure -kernel
> +LINK_SCRIPT=$(S390X_SRC)/softmmu.ld
> +LDFLAGS=-nostdlib -static -Wl,-T$(LINK_SCRIPT)
>   
> -%: %.S
> -	$(CC) -march=z13 -m64 -nostdlib -static -Wl,-Ttext=0 \
> -		-Wl,--build-id=none $< -o $@
> +%.o: %.S
> +	$(CC) -march=z13 -m64 -c $< -o $@
> +
> +%: %.o $(LINK_SCRIPT)
> +	$(CC) $< -o $@ $(LDFLAGS)
>   
>   TESTS += unaligned-lowcore
>   TESTS += bal
>   TESTS += sam
> +
> +include $(S390X_SRC)/pgm-specification.mak
> +$(PGM_SPECIFICATION_TESTS): pgm-specification-softmmu.o
> +$(PGM_SPECIFICATION_TESTS): LDFLAGS+=pgm-specification-softmmu.o
> +TESTS += $(PGM_SPECIFICATION_TESTS)
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> index cf93b966862..1002ab79886 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -2,6 +2,9 @@ S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
>   VPATH+=$(S390X_SRC)
>   CFLAGS+=-march=zEC12 -m64
>   
> +%.o: %.c
> +	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -c $< -o $@
> +
>   config-cc.mak: Makefile
>   	$(quiet-@)( \
>   	    $(call cc-option,-march=z14, CROSS_CC_HAS_Z14); \
> @@ -33,6 +36,11 @@ TESTS+=chrl
>   cdsg: CFLAGS+=-pthread
>   cdsg: LDFLAGS+=-pthread
>   
> +include $(S390X_SRC)/pgm-specification.mak
> +$(PGM_SPECIFICATION_TESTS): pgm-specification-user.o
> +$(PGM_SPECIFICATION_TESTS): LDFLAGS+=pgm-specification-user.o
> +TESTS += $(PGM_SPECIFICATION_TESTS)
...
> diff --git a/tests/tcg/s390x/softmmu.ld b/tests/tcg/s390x/softmmu.ld
> new file mode 100644
> index 00000000000..ea944eaa3cb
> --- /dev/null
> +++ b/tests/tcg/s390x/softmmu.ld
> @@ -0,0 +1,20 @@
> +/*
> + * Linker script for the softmmu test kernels.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +ENTRY(_start)
> +
> +SECTIONS {
> +    . = 0;
> +
> +    .text : {
> +        *(.head)
> +        *(.text)
> +    }
> +
> +    /DISCARD/ : {
> +        *(*)
> +    }
> +}

I just gave it a try, and while it's basically working, I see a lot of these 
messages in the console:

/usr/bin/ld: warning: .note.gnu.build-id section discarded, --build-id ignored

I think you should either pass --build-id=none to the linker, or add a 
.note.gnu.build-id section to the linker script?

  Thomas


