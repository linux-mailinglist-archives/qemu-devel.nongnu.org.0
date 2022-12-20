Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EEB651764
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 01:54:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7QtQ-0007ik-Uh; Mon, 19 Dec 2022 19:54:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7QtO-0007i7-Nz
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 19:54:02 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7QtM-00044b-IV
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 19:54:02 -0500
Received: by mail-pj1-x1031.google.com with SMTP id u5so10792853pjy.5
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 16:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gRlj05b/EI/xUcUcP+R63Xt7w5BjbHIdL1zVJ36GA4Q=;
 b=jQht+OVUr5tLFF/EgRRfmoWCPxRDCnOw9sKHtozx6q9TeBocCJs9pVWnoY3tGnSy89
 tln11NBq6U97hIBdZ3Bv8lhS7McXBsGGuMzhWDcIrK75gSqr0kDsQIu72cChbpxdJ8IY
 u2Bjw8R6pvBq9AnZS7porSdZx6IcLwYwiDGtTyScgRXE2qll0jfmWuzJ59zANQuka2Zj
 aMSfxAwP3Oph8346RgTJFIL5ihwzGeYq2oJNsyScTuXq0ZvK7DvVSTRhi5XEq+sBWZfN
 pPELkzBRSgnCxENKpX3D1qnpieuZDtbp1cW7apxv+vSrxPws4BvaP8UbejoBFJj173a0
 6NUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gRlj05b/EI/xUcUcP+R63Xt7w5BjbHIdL1zVJ36GA4Q=;
 b=Zb85elKs6ZWSpQzFICjQnoVFXDjdLwL8xEuFn166xfA4BQgVn6NoJjXzi5jvSjEZZM
 GEmJD8sQGxjurbPXKul7Syg4HcPnJztNtXLkxO8jP3YIDFuTVYzWhtNKJzBcu478vm7v
 uxeyZi6zV/N0Y+T8kv01fJBB82WgQXopy/RjoFpyiU0x0zEn8iD7mZiuyXrnVmOdpopb
 x5x+bgjsJmnsih51Y3QwWtxx6tbu+0mECFv8CHTQJVvbbeDQtSxPrIdh+I83II+haLuP
 sVcjbevqX8mBfgc9SvyqfdSuDM3ctKUIXV7Y6iQFGVCEsTt49dFlR2z9QEIoKzF5/Ntl
 aK7g==
X-Gm-Message-State: AFqh2kp5tcbOpn2TbGT7dpxQ1om1h0n0nwI/l68kAGZlch1v+28rw3p1
 k+UhxOWCHuEOqK0kmzrTprKRzw==
X-Google-Smtp-Source: AMrXdXsm1MP6H5uLi5LbsrmfcNhZUpa1XBihh1cdDmn25QGLFMEdlOdCvD4MaQox73pgyQwQiis0Eg==
X-Received: by 2002:a17:902:c252:b0:191:191f:e7a7 with SMTP id
 18-20020a170902c25200b00191191fe7a7mr8145568plg.69.1671497638986; 
 Mon, 19 Dec 2022 16:53:58 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:b343:d344:137b:e318?
 ([2602:47:d48c:8101:b343:d344:137b:e318])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a170902d34600b00189393ab02csm7815921plk.99.2022.12.19.16.53.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 16:53:58 -0800 (PST)
Message-ID: <b049297b-d2a9-0dca-7287-bad681d1e3fa@linaro.org>
Date: Mon, 19 Dec 2022 16:53:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 6/7] hw/mips/meson: Make gt64xxx_pci.c
 endian-agnostic
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20221209151533.69516-1-philmd@linaro.org>
 <20221209151533.69516-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221209151533.69516-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/9/22 07:15, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> The single machine using this device explicitly sets its
> endianness. We don't need to set a default. This allow us
> to remove the target specificity from the build system.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   hw/mips/gt64xxx_pci.c | 2 +-
>   hw/mips/meson.build   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

