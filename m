Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 063823AF4D4
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 20:20:36 +0200 (CEST)
Received: from localhost ([::1]:33308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvOXD-0007Zn-3w
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 14:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvOVw-0006s2-Du
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 14:19:16 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvOVu-0000Xf-Jg
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 14:19:16 -0400
Received: by mail-wm1-x32c.google.com with SMTP id j10so4359129wms.1
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 11:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cqfZG6K5IM8F0mmNt3ujfxRzxpB3fvMQoe1uGVGCaCQ=;
 b=newHNv9qkjVFnGiL2XDy6niF2HH7XUPAdlpGRfE2j0vsQRayxNAHbI59qMk7JXfCq7
 iC5zFZeNohL2nWrq0zAEPBamaPzetJKmP897bvLHdZVi9umDP9hE8I00Wq8SEagqpCzW
 KOtk58tjaUCM8IKjmLfVUs9Q7nNfYacK6X/1vlDBl4brphhF8+TSO/Ga/Ri0aK1gR5Q3
 VnGlz1XM3BX/T5fRfhBiH9CrAc07XPqXecp9qe7eg/TiEVY7yldgg6UsmIuSL6UL7v8e
 ht2Od1RUTxVq/Ck6gAC+dLYVwC38+x6OEZZ8o6Jbh0a2oLqKOVkvVNpbXzNO4wuEM7vy
 j/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cqfZG6K5IM8F0mmNt3ujfxRzxpB3fvMQoe1uGVGCaCQ=;
 b=Q+bIS8lRTUI+sSPB2oa7RVYG/7sQsvlGe3TqaxnIyvHpW5UihPOpUkcYazJsL7MtFp
 MkrH2XCEjIXwz+swvS3+U0f5HcgY8sZOFH8DtfAnbIf7IihJuFkE1iyoNC5hOhEItptb
 pYLV7gvADw22vHArSxKLMpba1rH9Y0S3ONgq4TsDF7u/acwoKYFWj3J578tWaZk4fqD8
 epGLBCxGEdRDeSFSpyu3FLCRcdd8ANEkfu0mhajKgGgWEFSEV22XoA7o4m4tPiCA+G+z
 vyhYQsWdGyKAGREWnLCz0hFxI6qoKy1rTo4itENuXfwkrUKH/7fcauV5gQICAlod3qBt
 kl+A==
X-Gm-Message-State: AOAM530WE71QCsoZ0UTRDM7U/XDBfSJ5a5lACigaou5QzM+zzTfdZLaX
 0QB+MqWwJ6smhGxcXNoHAp8=
X-Google-Smtp-Source: ABdhPJzmPQhZS7F/SxDygp1VCbrQhynU7BLfjzG/elc4iuYONyYdkZbpjKbwWCXF7XLkAqVEoyJHJw==
X-Received: by 2002:a05:600c:4f8f:: with SMTP id
 n15mr29074194wmq.116.1624299552040; 
 Mon, 21 Jun 2021 11:19:12 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id t11sm18944799wrz.7.2021.06.21.11.19.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 11:19:11 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] target/avr: Change ctx to DisasContext* in
 gen_intermediate_code
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210620215022.1510617-1-richard.henderson@linaro.org>
 <20210620215022.1510617-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bcc507d0-9be2-82e2-9ea4-026f8d8f690b@amsat.org>
Date: Mon, 21 Jun 2021 20:19:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210620215022.1510617-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: mrolnik@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/20/21 11:50 PM, Richard Henderson wrote:
> Prepare for receiving it as a pointer input.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/avr/translate.c | 84 +++++++++++++++++++++---------------------
>  1 file changed, 43 insertions(+), 41 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

