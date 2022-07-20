Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF1357BA8C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 17:38:12 +0200 (CEST)
Received: from localhost ([::1]:53132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEBm7-0001t0-3w
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 11:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEBk9-0006m5-O1
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:36:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEBk7-0007Sf-Ab
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:36:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658331366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eYCR/9M1xG503C1/xt1WYG1AyZvttLnFTZ8Mmwl+Qt8=;
 b=N2iCY50Au3BiA2mJuDv70nFKQWbYZS+NM3GyZyHkF7ZbkXszVB/Sb+j108OREEgTTjErQa
 7l2Uns4bfoJM62RKmsskngQf2o6wKr9iijqHk9RNhyWpUZKJBJvhaO9GuEoIigPgrmL+uh
 Maj/dykKf/S4Szv2VuJ7CC4xAR0Za2w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-OfG6GzMTPMuNnW97Myi4ng-1; Wed, 20 Jul 2022 11:36:05 -0400
X-MC-Unique: OfG6GzMTPMuNnW97Myi4ng-1
Received: by mail-wr1-f72.google.com with SMTP id
 q17-20020adfab11000000b0021e4c9ca970so343999wrc.20
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 08:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eYCR/9M1xG503C1/xt1WYG1AyZvttLnFTZ8Mmwl+Qt8=;
 b=CZtz3MONUphiop9xzLRu0aF4hP1vVFAHYFMCS5qJFvPx1EDkQW+meFaTgSvNY+5/SD
 k12h+771ejN54fBOyPBTnof+KAde6hNUdYE5edsAdA//C4rX0oYa1q16XD6bXgozhB87
 5guzhxoVIjpH5UFnuVX0AjPR7xwDPUM/Khb+gI+GZfZUZs7p/5VZjKrTR6382WRmMz2n
 01THQDmuk4dE3eCkKcR+b5OstmurgACXAGewqHA4o0NroLbSsAMyQDtIbrqeJKvEeWRa
 bX87F7HJ7L9Hb0n9RqFEX7BWzSFJXwE8UylrgqExiFEx130BGisLakbJ16+WvpdXmjlD
 vgUw==
X-Gm-Message-State: AJIora8KeNe8cqmUW1k0X7Tb1as1mt9gBiWJVhKV08Ya1n0ixO0lZlxm
 F4jFNocALdQRrxkn0Nrs4HhqCVqIy9PjCXLo3Mkq4KCvR8AIjX4jpL5BMVnCG2EvV7IItW2fTKt
 9CSNu1DBWsDkHa28=
X-Received: by 2002:a05:600c:798:b0:3a3:f03:f80e with SMTP id
 z24-20020a05600c079800b003a30f03f80emr4414935wmo.33.1658331363194; 
 Wed, 20 Jul 2022 08:36:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uV4fG/H3YfOeJ2bHScPZr+H0FXovLdgjFj2fZhCpqsgQnlNPPg8mdPuifLlAed5EqwDl4doA==
X-Received: by 2002:a05:600c:798:b0:3a3:f03:f80e with SMTP id
 z24-20020a05600c079800b003a30f03f80emr4414913wmo.33.1658331362974; 
 Wed, 20 Jul 2022 08:36:02 -0700 (PDT)
Received: from [192.168.8.104] (tmo-096-80.customers.d1-online.com.
 [80.187.96.80]) by smtp.gmail.com with ESMTPSA id
 l2-20020adff482000000b0021b9585276dsm16208078wro.101.2022.07.20.08.36.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 08:36:02 -0700 (PDT)
Message-ID: <24dd0a58-ead5-4752-d626-4964c8f97ade@redhat.com>
Date: Wed, 20 Jul 2022 17:36:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/5] configure: Add braces to clarify intent of
 $emu[[:space:]]
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220720152631.450903-1-peter.maydell@linaro.org>
 <20220720152631.450903-3-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220720152631.450903-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/07/2022 17.26, Peter Maydell wrote:
> In shell script syntax, $var[something] is not special for variable
> expansion: $emu is expanded.  However, as it can look as if it were
> intended to be an array element access (the correct syntax for which
> is ${var[something]}), shellcheck recommends using explicit braces
> around ${var} to clarify the intended expansion.
> 
> This fixes the warning:
> 
> In ./configure line 2346:
>          if "$target_ld" -verbose 2>&1 | grep -q "^[[:space:]]*$emu[[:space:]]*$"; then
>                                                                ^-- SC1087: Use braces when expanding arrays, e.g. ${array[idx]} (or ${var}[.. to quiet).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is our only 'error' level shellcheck warning, so it seems
> worth suppressing even though it's not wrong as written.
> ---
>   configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index dec6f030346..a56c3d921be 100755
> --- a/configure
> +++ b/configure
> @@ -2343,7 +2343,7 @@ if test -n "$target_cc" &&
>       # emulation. Linux and OpenBSD/amd64 use 'elf_i386'; FreeBSD uses the _fbsd
>       # variant; OpenBSD/i386 uses the _obsd variant; and Windows uses i386pe.
>       for emu in elf_i386 elf_i386_fbsd elf_i386_obsd i386pe; do
> -        if "$target_ld" -verbose 2>&1 | grep -q "^[[:space:]]*$emu[[:space:]]*$"; then
> +        if "$target_ld" -verbose 2>&1 | grep -q "^[[:space:]]*${emu}[[:space:]]*$"; then
>               ld_i386_emulation="$emu"
>               break
>           fi

Reviewed-by: Thomas Huth <thuth@redhat.com>


