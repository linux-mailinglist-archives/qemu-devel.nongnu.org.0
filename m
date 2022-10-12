Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E611C5FCB76
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 21:26:30 +0200 (CEST)
Received: from localhost ([::1]:39160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oihN7-0004Qg-IG
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 15:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oihKD-0008UI-VQ
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 15:23:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oihKB-0002Nv-2X
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 15:23:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665602606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pcX9gtjnWe/gtt/k1zW1BcHUUgmbhTXz04U5cc9GZ44=;
 b=cSszwnho/FnDgbL5jrisY5dqiNAhc7vb5YKNo3+6ibAv6vjuH+4j3MWm6oY7yue6BvZoVF
 YCSAkKXFJHGW+2jM1ZKBFyhY6OND1OdUDTxP89q8tti9YDbJZLzdPN5sYVgElTMuSwOceJ
 aPZJfa+YzC2t9vylU/jneWfQ5T6Vttg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-85-16n5JTOLMoGxAjiukTjlaw-1; Wed, 12 Oct 2022 15:23:20 -0400
X-MC-Unique: 16n5JTOLMoGxAjiukTjlaw-1
Received: by mail-wr1-f70.google.com with SMTP id
 l16-20020adfc790000000b00230c2505f96so3075229wrg.4
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 12:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pcX9gtjnWe/gtt/k1zW1BcHUUgmbhTXz04U5cc9GZ44=;
 b=KAUhGPzL31SOS6+FMgLKNHFRrNMolQeylG2irz1zNyVWLR/3aTClkFDM4uU6tK9/O0
 aTRhMyJFttGWS/JFrk10YbYBlZuUGp9klzG0iBah1Oa606Wa6/TCWiUuRJaGauSTg6zb
 t+hpnyCXo8ZF/8CrUHc/C5vRg0/B9tmm21pDLzLsngpq4fFzLQotcPsNjEOiwp/rT9fq
 t9GQ/GLTmJhlitwycGhxYZ2GC+YFPsNflVlNdyEycI+XSRH00B34gk5U1aYcMuzV+hYm
 ifH+0G5W7sMxwmF5yngotQrSWVQ+yUshkeza/bRU0fdlafeheRpCr0QssOt5ssLQXNCI
 iUkA==
X-Gm-Message-State: ACrzQf3j3hcieuvucnnO1qmr4zKXDCnPXcEf9EAsoLm4nNH4wdVY7jTh
 Cv3WFvHLSNsgVXLD4l8AqJbr7bJ9efnyWeKq0fiY9/keULgqHZWwyA+COICl26I5MVipmVhuyj7
 GoT2u49Wqo/ko1kU=
X-Received: by 2002:a05:600c:3b98:b0:3c6:c36e:a637 with SMTP id
 n24-20020a05600c3b9800b003c6c36ea637mr3815765wms.148.1665602599120; 
 Wed, 12 Oct 2022 12:23:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7bJirtj2WQSNPnPaJDH2/nAXAw8tDPAdmQkfveJ4fVALHtIeoMst/Pe7SjCqVYOqAJavA0nQ==
X-Received: by 2002:a05:600c:3b98:b0:3c6:c36e:a637 with SMTP id
 n24-20020a05600c3b9800b003c6c36ea637mr3815750wms.148.1665602598774; 
 Wed, 12 Oct 2022 12:23:18 -0700 (PDT)
Received: from ?IPV6:2003:cb:c713:fd00:9f9b:c2f8:47fc:4836?
 (p200300cbc713fd009f9bc2f847fc4836.dip0.t-ipconnect.de.
 [2003:cb:c713:fd00:9f9b:c2f8:47fc:4836])
 by smtp.gmail.com with ESMTPSA id
 t21-20020a1c7715000000b003b4de550e34sm2441986wmi.40.2022.10.12.12.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Oct 2022 12:23:18 -0700 (PDT)
Message-ID: <a76e8464-907c-7cc3-c5d1-590296e93128@redhat.com>
Date: Wed, 12 Oct 2022 21:23:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/3] tests/tcg/s390x: Test compiler flags only once, not
 every time
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20221012182755.1014853-1-thuth@redhat.com>
 <20221012182755.1014853-2-thuth@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221012182755.1014853-2-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.528, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12.10.22 20:27, Thomas Huth wrote:
> This is common practice, see the Makefile.target in the aarch64
> folder for example.
> 
> Suggested-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/tcg/s390x/Makefile.target | 27 +++++++++++++++++----------
>   1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> index c830313e67..29c8af8207 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -1,6 +1,13 @@
>   S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
>   VPATH+=$(S390X_SRC)
>   CFLAGS+=-march=zEC12 -m64
> +
> +config-cc.mak: Makefile
> +	$(quiet-@)( \
> +	    $(call cc-option,-march=z14, CROSS_CC_HAS_Z14); \
> +	    $(call cc-option,-march=z15, CROSS_CC_HAS_Z15)) 3> config-cc.mak
> +-include config-cc.mak
> +
>   TESTS+=hello-s390x
>   TESTS+=csst
>   TESTS+=ipm
> @@ -18,20 +25,20 @@ TESTS+=signals-s390x
>   TESTS+=branch-relative-long
>   TESTS+=noexec
>   
> +ifneq ($(CROSS_CC_HAS_Z14),)
>   Z14_TESTS=vfminmax
>   vfminmax: LDFLAGS+=-lm
>   $(Z14_TESTS): CFLAGS+=-march=z14 -O2
> +TESTS+=$(Z14_TESTS)
> +endif
>   
> -TESTS+=$(if $(shell $(CC) -march=z14 -S -o /dev/null -xc /dev/null \
> -			 >/dev/null 2>&1 && echo OK),$(Z14_TESTS))
> -
> -VECTOR_TESTS=vxeh2_vs
> -VECTOR_TESTS+=vxeh2_vcvt
> -VECTOR_TESTS+=vxeh2_vlstr
> -$(VECTOR_TESTS): CFLAGS+=-march=z15 -O2
> -
> -TESTS+=$(if $(shell $(CC) -march=z15 -S -o /dev/null -xc /dev/null \
> -			 >/dev/null 2>&1 && echo OK),$(VECTOR_TESTS))
> +ifneq ($(CROSS_CC_HAS_Z15),)
> +Z15_TESTS=vxeh2_vs
> +Z15_TESTS+=vxeh2_vcvt
> +Z15_TESTS+=vxeh2_vlstr
> +$(Z15_TESTS): CFLAGS+=-march=z15 -O2
> +TESTS+=$(Z15_TESTS)
> +endif
>   
>   ifneq ($(HAVE_GDB_BIN),)
>   GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


