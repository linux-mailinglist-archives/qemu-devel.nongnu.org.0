Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEE766492C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:18:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFII7-00035s-0S; Tue, 10 Jan 2023 12:20:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pFIHX-00032h-Dl
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:19:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pFIHV-0005Jy-Dg
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:19:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673371163;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gTWFW0M1wSYvRMT9BNdko2bn9RXgPv0x0jWBhNPXVPk=;
 b=XH1RHoxB0ym9EVnNkBM8RSmDSuT8tONlwoD4oCgg1f4jqPRytbZuZlrxaykqDaASG2TLyI
 wAEWaXCQtR+F+X+I8hxoje9MK5/oPDsigkNBU8EVwEj/cCjLrX6Z8SZF4cV21fz8eZ46EB
 MsdmcxavIE3WNMLf8Xfoa5bXi+EkYZ4=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-426-ob3zrsD_Oiyrr_gP5cOBuw-1; Tue, 10 Jan 2023 12:19:22 -0500
X-MC-Unique: ob3zrsD_Oiyrr_gP5cOBuw-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-487b0bf1117so133649167b3.5
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 09:19:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gTWFW0M1wSYvRMT9BNdko2bn9RXgPv0x0jWBhNPXVPk=;
 b=yeSQGIqFlPNrz9/yR/pE8krHC5ZmmxFmOin940Vv1rCwggY8ZoMakeoJ8+SLVAkure
 3Yh6KTgyTRs6bqwydwgdDvWyymWsKhr0CemiWsqaszbEqShTdhtV2j3uk99nONa6N9uv
 G4ISaUn3xMk/sfVyczyzuYYjcM3Vhh8qtdv8sY3Rg3lHGTnZ1CKumkMGAWCH6sUZyZ/2
 UTezMtbJTm5enQrdii9xvfSOJXxVcwYh+Bt2XwLtTYp1xI4PxtoYppZFenNg5BiGR1km
 8H3mwa7HQD4+/LHenhWxJU3Nod04akGbe3gqWK79FAYeQaXFyNaQrKerWSCShMzerVTP
 hKpw==
X-Gm-Message-State: AFqh2krqqLyPFd+eHSJPhhWE/UMBr/lJy7Xvl36t+HqgEQugnggW2AfG
 mt27LxiTadA+wJmftJbpvKHZHIHlJadRXJN6P6r9wyb9Y+e2nvWQgCL7bM6T2fuq0OxwvYvWI9j
 yDcyL4tzAkdTVajc=
X-Received: by 2002:a25:b5cc:0:b0:701:9eac:2720 with SMTP id
 d12-20020a25b5cc000000b007019eac2720mr67335528ybg.62.1673371161223; 
 Tue, 10 Jan 2023 09:19:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsjtO1CjEsH0MeCyy6QFKUsCQ4ocHfQqL8+VHPfwyCH8tB9TL7DA2swNrbkLyQse02PI90Xww==
X-Received: by 2002:a25:b5cc:0:b0:701:9eac:2720 with SMTP id
 d12-20020a25b5cc000000b007019eac2720mr67335509ybg.62.1673371160942; 
 Tue, 10 Jan 2023 09:19:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 y19-20020a05620a44d300b006fba44843a5sm7489752qkp.52.2023.01.10.09.19.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 09:19:20 -0800 (PST)
Message-ID: <47e506b7-d364-284a-fc11-69ee64045d6b@redhat.com>
Date: Tue, 10 Jan 2023 18:19:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PULL 06/29] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>
References: <20230110160233.339771-1-pbonzini@redhat.com>
 <20230110160233.339771-7-pbonzini@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230110160233.339771-7-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Paolo,

On 1/10/23 17:02, Paolo Bonzini wrote:
> From: Eric Auger <eric.auger@redhat.com>
>
> To avoid compilation errors when -Werror=maybe-uninitialized is used,
> replace 'case 3' by 'default'.
>
> Otherwise we get:
>
> ../target/i386/ops_sse.h: In function â€˜helper_vpermdq_ymmâ€™:
> ../target/i386/ops_sse.h:2495:13: error: â€˜r3â€™ may be used
> uninitialized in this function [-Werror=maybe-uninitialized]
>    2495 |     d->Q(3) = r3;
>         |     ~~~~~~~~^~~~
> ../target/i386/ops_sse.h:2494:13: error: â€˜r2â€™ may be used
> uninitialized in this function [-Werror=maybe-uninitialized]
>    2494 |     d->Q(2) = r2;
>         |     ~~~~~~~~^~~~
> ../target/i386/ops_sse.h:2493:13: error: â€˜r1â€™ may be used
> uninitialized in this function [-Werror=maybe-uninitialized]
>    2493 |     d->Q(1) = r1;
>         |     ~~~~~~~~^~~~
> ../target/i386/ops_sse.h:2492:13: error: â€˜r0â€™ may be used
> uninitialized in this function [-Werror=maybe-uninitialized]
>    2492 |     d->Q(0) = r0;
>         |     ~~~~~~~~^~~~
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Stefan Weil <sw@weilnetz.de>
> Fixes: 790684776861 ("target/i386: reimplement 0x0f 0x3a, add AVX")
> Message-Id: <20221221163652.1239362-1-eric.auger@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

you pulled v1 but there were additional comments afterwards and last
iteration was:
https://lore.kernel.org/all/20221222140158.1260748-1-eric.auger@redhat.com/

Thanks

Eric
> ---
>  target/i386/ops_sse.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
> index 3cbc36a59d1a..c442c8c10cdc 100644
> --- a/target/i386/ops_sse.h
> +++ b/target/i386/ops_sse.h
> @@ -2466,7 +2466,7 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s, uint32_t order)
>          r0 = s->Q(0);
>          r1 = s->Q(1);
>          break;
> -    case 3:
> +    default:
>          r0 = s->Q(2);
>          r1 = s->Q(3);
>          break;
> @@ -2484,7 +2484,7 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s, uint32_t order)
>          r2 = s->Q(0);
>          r3 = s->Q(1);
>          break;
> -    case 3:
> +    default:
>          r2 = s->Q(2);
>          r3 = s->Q(3);
>          break;


