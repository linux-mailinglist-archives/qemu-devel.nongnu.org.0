Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBB750E9A6
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 21:41:43 +0200 (CEST)
Received: from localhost ([::1]:56970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj4ab-0005o6-A4
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 15:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nj4Yp-0004LR-Ac
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 15:39:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nj4Yn-0004k2-EH
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 15:39:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650915588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iqjF/qNtw2y13PDoSjlLIuRZlO+ZXykovfdJ2K/lr00=;
 b=A1zl0TjpjZuWui8/nLGESftUibDoFo7+UTbXgKd5n3fnQABmzZpZpKR21dr+p+BHJi31GV
 PB0pDOH+VlA0X/k6g/0ertWH1P2ySli/HqlmVGQ4l0HGL1ZDXPiDJEHtptGJPKLcMiCZNQ
 OlpNNvq/+LfRl8z6Rm83RABiB+3ajhI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-J1FNT_oVNBi-2cYI-4XEfA-1; Mon, 25 Apr 2022 15:39:47 -0400
X-MC-Unique: J1FNT_oVNBi-2cYI-4XEfA-1
Received: by mail-wm1-f70.google.com with SMTP id
 125-20020a1c0283000000b003928cd3853aso33431wmc.9
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 12:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iqjF/qNtw2y13PDoSjlLIuRZlO+ZXykovfdJ2K/lr00=;
 b=NBZw9yduFtMsHhBdP0mLieb0bfrJ24gukBsz4LF7UcZD4l+4+6vsBT41KK5EMZSNPq
 vT7KMrTtB07HD+aibjeJ1ArmokPhtP3veENk0nWjY+H1xFYLdDadq85pVCooYlPBFan4
 xRdfQOktGwKNWUU506M1bFMEn5594EqrS/KoRNeNoDmt4K0ZjqpM+ubqTAyeUmCXElKu
 KkpeMT0vKTrlAwFeKuW56SDM3dcWJ6NN+gtuX96nebz/k3nNUGgQ44bAN6DWRALjLZW1
 jAML10eqQaXIZ/EAFjvtOU+DCP5z5Gbpul5Dp7uxIjnennBbPs5v6Cm2f0D80DDbPaHj
 PLOg==
X-Gm-Message-State: AOAM533XXiCQso08NPhCxOtbkLg1NHnnyl7wsCsU1oiwU48l0OdmJ1bq
 bSHrOZfsKvtc1lF6GBazgDKaDn7MrGkB9EtWgdre8PUOjhEqWRMvDw2D2ljq3LZncg0MXdk0C8M
 F2t7Emr6+N8uPJ9A=
X-Received: by 2002:a05:600c:4e46:b0:393:f5fb:b3df with SMTP id
 e6-20020a05600c4e4600b00393f5fbb3dfmr99413wmq.80.1650915585689; 
 Mon, 25 Apr 2022 12:39:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyf7OxipgVVIfdh3+qTH0n+KNs1s4Bf7MhK1FoKrpbh/W+3T2NwSTpCfEZ42OFV/A7rrd9NyQ==
X-Received: by 2002:a05:600c:4e46:b0:393:f5fb:b3df with SMTP id
 e6-20020a05600c4e4600b00393f5fbb3dfmr99398wmq.80.1650915585500; 
 Mon, 25 Apr 2022 12:39:45 -0700 (PDT)
Received: from [192.168.8.104] (tmo-069-126.customers.d1-online.com.
 [80.187.69.126]) by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c4f8900b00393e7cc06casm5884365wmq.3.2022.04.25.12.39.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 12:39:44 -0700 (PDT)
Message-ID: <a50d9a5f-1c84-e6a9-819b-965818318719@redhat.com>
Date: Mon, 25 Apr 2022 21:39:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 05/10] libqtest: split QMP part in libqmp
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220422083639.3156978-1-marcandre.lureau@redhat.com>
 <20220422083639.3156978-6-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220422083639.3156978-6-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/04/2022 10.36, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> This will help moving QAPI/QMP in a common subproject.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   tests/qtest/libqmp.h           |  50 +++++++
>   tests/qtest/libqtest.h         |  29 +---
>   tests/qtest/libqmp.c           | 233 +++++++++++++++++++++++++++++++++
>   tests/qtest/libqtest.c         | 205 +----------------------------
>   tests/qtest/libqos/meson.build |   5 +-
>   tests/unit/meson.build         |   2 +-
>   6 files changed, 290 insertions(+), 234 deletions(-)
>   create mode 100644 tests/qtest/libqmp.h
>   create mode 100644 tests/qtest/libqmp.c
[...]
> diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
> index e988d1579172..9f292339f9cf 100644
> --- a/tests/qtest/libqos/meson.build
> +++ b/tests/qtest/libqos/meson.build
> @@ -1,4 +1,7 @@
> -libqos_srcs = files('../libqtest.c',
> +libqos_srcs = files(
> +        '../libqtest.c',
> +        '../libqmp.c',

I just realized that we link libqos to each and every qtest, though we 
should only link it against the qos-test :-/

Anyway, that's not related to your patch and we can fix that later, so for 
this patch here:

Acked-by: Thomas Huth <thuth@redhat.com>


