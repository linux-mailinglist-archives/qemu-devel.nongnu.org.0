Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 150E04E52E9
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 14:19:59 +0100 (CET)
Received: from localhost ([::1]:56794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX0u6-0007gh-5d
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 09:19:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nX0Xx-0000ZY-7f
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 08:57:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nX0Xt-00042t-HX
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 08:57:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648040219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gf9L1w35oB60TfCeuE7FJpL9fUobXic+YMBjSp3QY/E=;
 b=a+I/rIMLAKh8Bkhps1jxCjCqqJCR1/kD7TtAuH//dOylm/hIWbRtaiW88d/m+E1LXKNSYV
 s3oUgPP1PQVEv3iW1Zi0uLqdMkBn2OqVApeoZZcYVEdveGwJhqxuLoi03M7491HquKmVKa
 irOEEDJTibeJww9L/HiXHkK1d21MoHo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-t13n1hjcNg61hgEGrBNQzQ-1; Wed, 23 Mar 2022 08:56:58 -0400
X-MC-Unique: t13n1hjcNg61hgEGrBNQzQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 r64-20020a1c2b43000000b0038b59eb1940so2223759wmr.0
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 05:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gf9L1w35oB60TfCeuE7FJpL9fUobXic+YMBjSp3QY/E=;
 b=yAFgCtF2AlP+VpKESCxA4Q22AfX+srqH/jGrAjW4YmFq1VLt7ObaadbusXmmS1s//e
 cVSguiHBb7ii2FLolmA7AAwp2Db9JvW5vdXgXVkWUzO4yvXX4PH/1SFpdWB/wUZUAmdQ
 m35vNG6EGk/r2L19cMoGq6AUXEabvH0jr9gogm4Y2s9S3b2fV+MKRC/kNe8AhU2rx27y
 uOe9Bfx1x2589v/KXQ4mmPkIF3rkfUyKNHpk/XXiL7u4595v453yW27hqh+9S0dQDilo
 bjVk6ICzX/3OnW5JwH0UcSpJdL9wPLQ8TWFhEcTdd/wgnegmYlHrjQcAfxPLGB+/vvUO
 7MTA==
X-Gm-Message-State: AOAM532fls/ogSK3xKPgYzSYqvHCYNHxsqOSwR1h4t1wCjH/hPTaQUXJ
 PVO0EulN86w5//kiva4xO8AHjk1ZnNNaIB3DhmqNqoUNvsTgtqvEgMmjjKnmzOTa2fXOQROwen1
 AK24xQz65rz1DZ7A=
X-Received: by 2002:a5d:6f1b:0:b0:205:7bad:43db with SMTP id
 ay27-20020a5d6f1b000000b002057bad43dbmr6600328wrb.178.1648040217373; 
 Wed, 23 Mar 2022 05:56:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuMrj/ITEUEzYqM3ppLIoyuwa9BbMjFjsP4namXanqFPlJlYc8YSKBNgCjdLb/WP1xk3YNig==
X-Received: by 2002:a5d:6f1b:0:b0:205:7bad:43db with SMTP id
 ay27-20020a5d6f1b000000b002057bad43dbmr6600306wrb.178.1648040217144; 
 Wed, 23 Mar 2022 05:56:57 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 l126-20020a1c2584000000b00387d4f35651sm4028779wml.10.2022.03.23.05.56.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 05:56:56 -0700 (PDT)
Message-ID: <c22fa07b-a060-ad20-a4e7-68710cb1236a@redhat.com>
Date: Wed, 23 Mar 2022 13:56:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] configure: remove dead int128 test
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220323115021.24763-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220323115021.24763-1-pbonzini@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/03/2022 12.50, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure | 18 ------------------
>   1 file changed, 18 deletions(-)
> 
> diff --git a/configure b/configure
> index 6d9cb23ac5..7c08c18358 100755
> --- a/configure
> +++ b/configure
> @@ -2463,24 +2463,6 @@ else # "$safe_stack" = ""
>   fi
>   fi
>   
> -########################################
> -# check if __[u]int128_t is usable.
> -
> -int128=no
> -cat > $TMPC << EOF
> -__int128_t a;
> -__uint128_t b;
> -int main (void) {
> -  a = a + b;
> -  b = a * b;
> -  a = a * a;
> -  return 0;
> -}
> -EOF
> -if compile_prog "" "" ; then
> -    int128=yes
> -fi
> -
>   ########################################
>   # check if ccache is interfering with
>   # semantic analysis of macros

Fixes: 848126d11e ("meson: move int128 checks from configure")

Reviewed-by: Thomas Huth <thuth@redhat.com>


