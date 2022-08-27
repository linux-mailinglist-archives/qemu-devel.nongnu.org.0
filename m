Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A735A360B
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 10:39:47 +0200 (CEST)
Received: from localhost ([::1]:40826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRrM1-0003Vd-QI
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 04:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRrGa-0000Pf-QM
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 04:34:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRrGY-0002AH-5C
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 04:34:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661589245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uwdOyUrnPpnwJP+d8ErY0rYTHGotKjqq9eS1LSbVZ10=;
 b=hxjOkSA4ah0zQC2YVyM13KA1b5DUPgOdq4banDy414eSNTvtC5V7YkO44YukC53KqCvjdR
 DvyzjPc5+TF1Ay8ZLXdJp0v924Tx3BEuauq4rviokfJJGrAz2bIdm3I2jVNtgeVwY30Lf8
 wbqGKqxutPOAJqUNzZa4EIVdDhbZPpk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-442-3VmEzvA9Ns2i0R97g-lY8w-1; Sat, 27 Aug 2022 04:34:03 -0400
X-MC-Unique: 3VmEzvA9Ns2i0R97g-lY8w-1
Received: by mail-wm1-f69.google.com with SMTP id
 i132-20020a1c3b8a000000b003a537064611so1979564wma.4
 for <qemu-devel@nongnu.org>; Sat, 27 Aug 2022 01:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=uwdOyUrnPpnwJP+d8ErY0rYTHGotKjqq9eS1LSbVZ10=;
 b=QXihu3QHpb9fW6ELtXm74rxOmyZJewYTol88te/Wl3AavBjkj8EBpSfACaI5u6O9ik
 221emwf1CdpmN/8Psl4/DUNw07HDM1Mn3lIFhQRk82SveMWSX2VqazSM/JrUZr3fiEjN
 /++ogkw8cG8//J+Zh3SN7C6Chv1bAiP7hG2nqICj64yP6iCHk1+YXGtOkO3UNh8R/Kv/
 xBYf/p1WJCD+8pV8kHc9WCVwyxtOOuP0ke6k0vqKQRILcjZ7qcIX502CGCi+gN6LX+Ub
 ATqk4cCYypJ44QXEs92XG1bAJ8qKeTP+DowRJ7yv3ZGJKnhTF4vl81BnqLW6OankVfyd
 OUOQ==
X-Gm-Message-State: ACgBeo1Mwqev032rRYHh0JxnPf1Otxv+yua3QUA2vxfnN56DL/LwYyLs
 YXBvBw8Hur2Ok7PI8Rudv4jV7hSdM9XAqednzDSwO6F+NNSHIYngNkZAQig0TQX2EiQx18Cf9qJ
 hDtCT0YUYud6ObLg=
X-Received: by 2002:a05:6000:60c:b0:220:757a:54a8 with SMTP id
 bn12-20020a056000060c00b00220757a54a8mr1679762wrb.685.1661589242725; 
 Sat, 27 Aug 2022 01:34:02 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4TFCAEXXzVPhWDCM7w7kSZYLvYAO3g82a9iBL7KIJEEWhidlEzyuWzzwrzhoa6QOZhJyJPyQ==
X-Received: by 2002:a05:6000:60c:b0:220:757a:54a8 with SMTP id
 bn12-20020a056000060c00b00220757a54a8mr1679744wrb.685.1661589242509; 
 Sat, 27 Aug 2022 01:34:02 -0700 (PDT)
Received: from [192.168.8.101] (tmo-097-69.customers.d1-online.com.
 [80.187.97.69]) by smtp.gmail.com with ESMTPSA id
 p18-20020a056000019200b00226d13a25c7sm1511552wrx.17.2022.08.27.01.34.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Aug 2022 01:34:02 -0700 (PDT)
Message-ID: <55469e83-9790-7d47-932e-df574846c42d@redhat.com>
Date: Sat, 27 Aug 2022 10:34:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 15/20] disas/nanomips: Replace exception handling
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-16-milica.lazarevic@syrmia.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220815072629.12865-16-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 15/08/2022 09.26, Milica Lazarevic wrote:
> Since there's no support for exception handling in C, the try-catch
> blocks have been deleted, and throw clauses are replaced. When a runtime
> error happens, we're printing out the error message. Disassembling of
> the current instruction interrupts. This behavior is achieved by adding
> sigsetjmp() to discard further disassembling after the error message
> prints and by adding the siglongjmp() function to imitate throwing an
> error.The goal was to maintain the same output as it was.
> 
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 135 +++++++++++++++++++++++----------------------
>   1 file changed, 69 insertions(+), 66 deletions(-)
> 
> diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
> index 769368a984..a8cd878809 100644
> --- a/disas/nanomips.cpp
> +++ b/disas/nanomips.cpp
> @@ -31,7 +31,6 @@
>   #include "disas/dis-asm.h"
>   
>   #include <string.h>
> -#include <stdexcept>
>   #include <stdio.h>
>   #include <stdarg.h>
>   
> @@ -90,6 +89,8 @@ struct Pool {
>   
>   static img_address           m_pc;
>   static TABLE_ATTRIBUTE_TYPE   m_requested_instruction_categories;
> +static struct disassemble_info *disassm_info;
> +static jmp_buf j_buf;

I guess this is also not thread-safe? (see also Richard's answer to patch 03/20)

  Thomas


