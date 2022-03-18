Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671704DDFD3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 18:27:28 +0100 (CET)
Received: from localhost ([::1]:59742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVGNr-0007dv-0l
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 13:27:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nVGMI-0006nK-5c
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 13:25:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nVGMF-000164-AK
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 13:25:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647624346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=asH6X9HWMOkBVqKKgg7llwQ5TC5dw9HIPQJ1qI0bvEI=;
 b=OziqiXl7uPtsvP3H990SJzM9VyMihGbFZzw9elj7U4PCUNEeoY4jKscUuwpEoFHT7Yzfmi
 wW+1WXzVQu/8+r4hLHqCK30FFFIm2PTarBeUuNRBc5cc7rw4VtkuF/hXiCgYzmwRg+lvUu
 mbXrodC0siYE3JBdiK0hxOfVMUXe1Y8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-cBV1IcJiO1mJzvhP4RqjRQ-1; Fri, 18 Mar 2022 13:25:44 -0400
X-MC-Unique: cBV1IcJiO1mJzvhP4RqjRQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 i65-20020a1c3b44000000b00385c3f3defaso1671427wma.3
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 10:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=asH6X9HWMOkBVqKKgg7llwQ5TC5dw9HIPQJ1qI0bvEI=;
 b=eYqCjvdaGZfaQAcxDnOcqQXgKsFphpXjG33c1ymBx8JfMyDzQy40v4bbj7jUgR3x6L
 o37ukPneZ52kF2iu+vDIM7Z/1FURv0c8y+WbFCMmB5GAgkD5UnhcFqgI0IfXJSo5HRXf
 eT8r2XmiJJhaLzwJtQ/xgGFKJ8kTje2ZrR96K9+mBUDx7/i7ff7lnyWHjcW0v9cIx/83
 Dkl+XJunffcK8Jy6bKMp/pSWTuLacU0h5fFuK3nNkjo/SO1nL+IU9qGl+XUYb4GAokhd
 YZVz4fshn77SgmYvSusd88+pkIQJNi6sBbp2r8TfwJOMLCY35V109CqqIro93NZ3w88J
 S8gQ==
X-Gm-Message-State: AOAM530YA7IhttWJyf1YUDGmBswKLdjee++OPS4TajQfDgIODArirjnT
 DsNZF/rxIwtTF+KUrExB5YjyA5jRv0uCbcK6FP+KcnZ8E77TKhBC1giNTpOFaVtAH4+dcbqJhbi
 HVfYt9dsjO8qmQhw=
X-Received: by 2002:adf:f28c:0:b0:1f1:e5e5:28c0 with SMTP id
 k12-20020adff28c000000b001f1e5e528c0mr8882457wro.417.1647624343360; 
 Fri, 18 Mar 2022 10:25:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+qYQg6vjC9mhMlL2XBKxQZG/VxBIed3TGhHC+7CePQsP4WdMBOuJdWzPOt8QbZ9stuxKRmg==
X-Received: by 2002:adf:f28c:0:b0:1f1:e5e5:28c0 with SMTP id
 k12-20020adff28c000000b001f1e5e528c0mr8882449wro.417.1647624343115; 
 Fri, 18 Mar 2022 10:25:43 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 x6-20020adfdcc6000000b00203fc6ba079sm697814wrm.2.2022.03.18.10.25.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 10:25:42 -0700 (PDT)
Message-ID: <d9a8f15d-d582-5fc9-5ddd-206185f459c4@redhat.com>
Date: Fri, 18 Mar 2022 18:25:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] sh4: Replace TAB indentations with spaces
To: Ahmed Abouzied <email@aabouzied.com>, qemu-devel@nongnu.org
References: <20210620175452.10076-1-email@aabouzied.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20210620175452.10076-1-email@aabouzied.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/06/2021 19.54, Ahmed Abouzied wrote:
> Replaces TABs with spaces, making sure to have a consistent coding style
> of 4 space indentations in the SH4 subsystem.
> 
> Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/376
> ---
...
> @@ -1705,101 +1705,101 @@ static void _decode_opc(DisasContext * ctx)
>           }
>           return;
>       case 0xf00d: /* fsts FPUL,FRn - FPSCR: Nothing */
> -	CHECK_FPU_ENABLED
> +    CHECK_FPU_ENABLED
>           tcg_gen_mov_i32(FREG(B11_8), cpu_fpul);
> -	return;
> +    return;
>       case 0xf01d: /* flds FRm,FPUL - FPSCR: Nothing */
> -	CHECK_FPU_ENABLED
> +    CHECK_FPU_ENABLED
>           tcg_gen_mov_i32(cpu_fpul, FREG(B11_8));
> -	return;
> +    return;

Sorry, it's a very late reply ... but in case you're still interested in 
fixing this: It seems like at least some of these files used TABs as 8 
spaces, not as 4 spaces, so after applying your patch, the indentation seems 
to be wrong in all places. Please double-check the look of the files before 
sending! Thanks!

  Thomas


