Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086B5516BD2
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 10:14:48 +0200 (CEST)
Received: from localhost ([::1]:45198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlRCg-0003WQ-By
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 04:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nlRAC-0001l0-IQ
 for qemu-devel@nongnu.org; Mon, 02 May 2022 04:12:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nlRA9-0002w3-Cc
 for qemu-devel@nongnu.org; Mon, 02 May 2022 04:12:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651479128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=juSowGah1KdmZpHi0ZIxGhaEixZiUho3SL0D4VdvZyU=;
 b=RpFVfA+WkrOv7LwOSFxxn4Vd5IKMU37eOxJ5loSu0zxK7UuA8droBvb4o4hdKfBGcf041v
 uUOLVSLRlOik6yPG8QJkomVbflRZs5xloGWuFQlMOsV3XaiQcJZdfKJ5qb3plpj5MH/0ab
 Tcip83+JoYko1a7dELAhmYPhi1Io1iU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-nscaaShZODm3acYzghIhmQ-1; Mon, 02 May 2022 04:12:06 -0400
X-MC-Unique: nscaaShZODm3acYzghIhmQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 g3-20020a7bc4c3000000b0039409519611so4242301wmk.9
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 01:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=juSowGah1KdmZpHi0ZIxGhaEixZiUho3SL0D4VdvZyU=;
 b=iDesJK9CM08UhN/iJXGJNI2eujq7pew5cGd/9geh+8H5qbtia8v1ps7eabUZjcaWsG
 12v3PqIn398PXxpsZUTS+LG41GbT2o/8LZaK3DZzOaVyy57J69/CzoAULnmu/qGtDlnQ
 chyHhBwk9Gq9YBV5+sWl0DZ698qCCM19mCftSFtSVZ732k08jD56tLisvQK4zyKIE47S
 CGhyDmxjaGB0FrLRC3M9n7N/kFCxtFrg7Pjt6CAB0dLCXItAuUhTE14DlM/R9x5gYg52
 tiJ2wKx1UyfmETLrDR8XLVh8dCOb9JLSkHxzljEeXu51e1Bge4/asZ5XsK2WsL1Nz9QJ
 AvOg==
X-Gm-Message-State: AOAM531mkws6H6ilWudwFFEMm7SL1eXK5hd5gic70NE+vNTuIvhwP3zE
 N+a3xqg1M64i4G1TU+CR64AHQUJgy8DrDW/yp9Q+qSlq/WVSfMTf9vdZwCPAIx4RBI08S8Lubb4
 cdGTiLtj9Aq2oirU=
X-Received: by 2002:a05:6000:2c4:b0:20c:6c76:14f4 with SMTP id
 o4-20020a05600002c400b0020c6c7614f4mr914652wry.56.1651479125276; 
 Mon, 02 May 2022 01:12:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw97jGCm2L1+oDLQ3IPDzXTJodHc5dGbWby/3oS/8SvhQp4q9k//x4M5jqrliDzN5i/fBJyYw==
X-Received: by 2002:a05:6000:2c4:b0:20c:6c76:14f4 with SMTP id
 o4-20020a05600002c400b0020c6c7614f4mr914635wry.56.1651479125074; 
 Mon, 02 May 2022 01:12:05 -0700 (PDT)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 c10-20020adfa70a000000b0020c5253d91esm6428255wrd.106.2022.05.02.01.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 01:12:04 -0700 (PDT)
Message-ID: <8c399ab0-5128-1aca-0e25-8b60e2a442fd@redhat.com>
Date: Mon, 2 May 2022 10:12:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 13/13] tests/tcg/s390x: Tests for Vector Enhancements
 Facility 2
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 David Miller <dmiller423@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220428094708.84835-1-david@redhat.com>
 <20220428094708.84835-14-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220428094708.84835-14-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
Cc: Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/04/2022 11.47, David Hildenbrand wrote:
> From: David Miller <dmiller423@gmail.com>
> 
> Signed-off-by: David Miller <dmiller423@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Tested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   tests/tcg/s390x/Makefile.target |   8 ++
>   tests/tcg/s390x/vx.h            |  19 +++++
>   tests/tcg/s390x/vxeh2_vcvt.c    |  88 ++++++++++++++++++++
>   tests/tcg/s390x/vxeh2_vlstr.c   | 139 ++++++++++++++++++++++++++++++++
>   tests/tcg/s390x/vxeh2_vs.c      |  93 +++++++++++++++++++++
>   5 files changed, 347 insertions(+)
>   create mode 100644 tests/tcg/s390x/vx.h
>   create mode 100644 tests/tcg/s390x/vxeh2_vcvt.c
>   create mode 100644 tests/tcg/s390x/vxeh2_vlstr.c
>   create mode 100644 tests/tcg/s390x/vxeh2_vs.c
> 
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> index f0d474a245..e50d617f21 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -17,6 +17,14 @@ TESTS+=trap
>   TESTS+=signals-s390x
>   TESTS+=branch-relative-long
>   
> +VECTOR_TESTS=vxeh2_vs
> +VECTOR_TESTS+=vxeh2_vcvt
> +VECTOR_TESTS+=vxeh2_vlstr
> +
> +TESTS+=$(VECTOR_TESTS)
> +
> +$(VECTOR_TESTS): CFLAGS+=-march=z15 -O2

I'm sorry, but this still fails in the QEMU CI:

https://gitlab.com/thuth/qemu/-/jobs/2401500348

s390x-linux-gnu-gcc: error: unrecognized argument in option '-march=z15'

I think we either have to switch to manually encoded instructions again, or 
add a check to the Makefile and only add the tests if the compiler supports 
-march=z15 ...? Opinions? Preferences?

  Thomas


