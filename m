Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB6B686102
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 08:54:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN7wz-0006UV-L7; Wed, 01 Feb 2023 02:54:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pN7wx-0006U6-DQ
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:54:35 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pN7wu-0000u3-5X
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:54:35 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso679080wmq.5
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 23:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tF6b+FZ/vwEGQ06h3xdBxOjcTdoCvjB2eFH4X/PWMV4=;
 b=Zbid6yH79dOqTUGKoJSIoLLd2f6TRIAjljirZ81diqB8MS7s7mlxRLkroDfxceGSdl
 bXyXP9+QrRy3Q+k8RZzahbPnaGmVWtJQPPlvliRPAdS+Ygu6ZXBr7OWuTerjNKgWAoo+
 4JXUGRVPtwVxD71yAQFIrfGDtERb5og505GUm/0fItQ/KzQYqxDgviYHEWG5xJHPTTYK
 MVIQyErxK/kfaYA5EXEY31LbrULJy0XNYjHdk2kaWeFVqBvouHwTxa1czRsBXFu1ExZb
 AKQspaREGPTMp3SKBdso7g9xn9nBkwanoJ+2Xck11QIU+cFzFddXHc09yHjmTTH+TPI+
 EsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tF6b+FZ/vwEGQ06h3xdBxOjcTdoCvjB2eFH4X/PWMV4=;
 b=IF3Uh+XQj9mgLnBOhfo74fM6y5pnnxWfHFyB35RdW2gm8bmxkOtw3jOkuMp5vDOkHF
 eD4PeDfVBev/urPMQcWUJ5A18hrrgSUroiC4Gb+IeIMkL+iV16vg6Z+aRuyzHTFmxI2y
 O6YBVSZ7YTBQxNQ1wJyO9TAMTlreRiyhd4BmhUPMQRAsUbmPbSAijvcNuuzNQAkbL1u6
 R+IRLwLeRTWjJBJHgZzulrFTyL1h2koNVZWlXdELimKn9R4lSXpaGB6hZnvUYyJ8eh/J
 CIrxiQLE7c2Km9kOy0wUhrRs+mP+vWoo7+F7BOa+y9hAiY46D5sFn+8ENPtTBcORCs4M
 z+Ow==
X-Gm-Message-State: AO0yUKXcW33KbiJWwEtSD/JdClKruaESmkBRG8UEBrb7ZrS2F+jNoXDk
 cEyaUOxuG926YMrut2Nt2K8=
X-Google-Smtp-Source: AK7set8UFjNEV3CqydT78jA5XvU/Hwp9p7Lzv1PCa3cZdV7qvdbW/Vp4fBbafqW4ng7hwbxQO7e/5g==
X-Received: by 2002:a05:600c:b88:b0:3d3:5a4a:9103 with SMTP id
 fl8-20020a05600c0b8800b003d35a4a9103mr1022429wmb.31.1675238070338; 
 Tue, 31 Jan 2023 23:54:30 -0800 (PST)
Received: from [192.168.9.204] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a05600c150900b003daf672a616sm859085wmg.22.2023.01.31.23.54.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 23:54:29 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <8b43c153-8c7c-1834-11d6-b3d9c73e2893@xen.org>
Date: Wed, 1 Feb 2023 07:54:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [QEMU][PATCH v5 01/10] hw/i386/xen/: move xen-mapcache.c to
 hw/xen/
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 alex.bennee@linaro.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20230131225149.14764-1-vikram.garhwal@amd.com>
 <20230131225149.14764-2-vikram.garhwal@amd.com>
Organization: Xen Project
In-Reply-To: <20230131225149.14764-2-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 31/01/2023 22:51, Vikram Garhwal wrote:
> xen-mapcache.c contains common functions which can be used for enabling Xen on
> aarch64 with IOREQ handling. Moving it out from hw/i386/xen to hw/xen to make it
> accessible for both aarch64 and x86.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>   hw/i386/meson.build              | 1 +
>   hw/i386/xen/meson.build          | 1 -
>   hw/i386/xen/trace-events         | 5 -----
>   hw/xen/meson.build               | 4 ++++
>   hw/xen/trace-events              | 5 +++++
>   hw/{i386 => }/xen/xen-mapcache.c | 0
>   6 files changed, 10 insertions(+), 6 deletions(-)
>   rename hw/{i386 => }/xen/xen-mapcache.c (100%)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


