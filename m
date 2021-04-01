Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3275351264
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 11:36:50 +0200 (CEST)
Received: from localhost ([::1]:41534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRtkw-00035V-2e
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 05:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRtiW-0001tP-I5
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 05:34:20 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRtiU-0004uI-G3
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 05:34:20 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 m20-20020a7bcb940000b029010cab7e5a9fso2495813wmi.3
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 02:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nmWcVeVz/+cZQKYVX7uQfoa79Mgaz6FN/LVOZqYVpwY=;
 b=s0Ganqa2T3TxPyBwCTt8Z/7uO/Yyuak/mTl8pT6qFKupukh9fLcGBO5T7lzZ7SWc1S
 eYMVUV7urzfk07Hb8MR8dw//hDXU9CkxgxPxS6piBj7pY5zyclKczCMWGWETc+hqX4M3
 ZC3WwJEaFOrSRlv1MPGt5aB1ggj3uHwN4P7kUQeMylpZrWC2zv6U31Dc7rzZFwQQ2aQy
 HyMBcBReJTsxUmVwSNvPJproNhmfHlUNL+sYR02oXWF8PQHu2sDeqdJdAIUTDZ1QpBz4
 9gL3iTBEtKW1mVehpjfGV71m1RFz3pHLieAff9kB/rXD7X1kzBjM54mRBFtjYprdu7Oe
 pW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nmWcVeVz/+cZQKYVX7uQfoa79Mgaz6FN/LVOZqYVpwY=;
 b=fMFdb7+JDP9mO4I/eq1U4vvVmJN+FJotDB8dRxflJ6McYph3I1/YGk7ZR350kS2gVn
 ygQ/2dJzJfbddMKMymTQcY5ovx2YOVDmplirVjGLPt17PKWzK/qKimvdQ56ldHGFCtO+
 cHBHMTcZfB3H70WRctWuLDsQaiLCoCEE+bqcVLnVZQlIAcCSe/sBrBPIWjYpVHznRYk1
 DLzTCbDWmPK+yJqkGX/KKdmzqo3dj8AcbpMyBQ23H2WqNY/T6U/d6bctW5VdqeBt9VOV
 QwUDqczcYQdxUrXttcKfttewOdbsMq8l5DbXdBtF2mqamk/IxLXPtBRqd3zcUWyFFPIx
 08rw==
X-Gm-Message-State: AOAM533Q0xLHgk8YZD4FayQWfxyMb5Vvtd8hDm8Q/EbeyDg1yr4atV60
 tYhsi7bL3vMPIGn4GVhptsw=
X-Google-Smtp-Source: ABdhPJzpaxOk+y1kIjtzMx7KHKEb+Uu/leBN3tlCHUXlILGrRx0ry0JeIAXkJjbDzZJnhUdjfxoKLg==
X-Received: by 2002:a7b:cf16:: with SMTP id l22mr7014477wmg.26.1617269657030; 
 Thu, 01 Apr 2021 02:34:17 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id k13sm11443819wri.27.2021.04.01.02.34.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 02:34:16 -0700 (PDT)
Subject: Re: [PATCH v3 05/11] esp: introduce esp_fifo_pop_buf() and use it
 instead of fifo8_pop_buf()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 alxndr@bu.edu, laurent@vivier.eu, pbonzini@redhat.com
References: <20210401074933.9923-1-mark.cave-ayland@ilande.co.uk>
 <20210401074933.9923-6-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0c3900c2-fa72-47ea-d48c-625dd1b40734@amsat.org>
Date: Thu, 1 Apr 2021 11:34:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210401074933.9923-6-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/21 9:49 AM, Mark Cave-Ayland wrote:
> The const pointer returned by fifo8_pop_buf() lies directly within the array used
> to model the FIFO. Building with address sanitisers enabled shows that if the

Typo "sanitizers"

> caller expects a minimum number of bytes present then if the FIFO is nearly full,
> the caller may unexpectedly access past the end of the array.

Why isn't it a problem with the other models? Because the pointed
buffer is consumed directly?

> Introduce esp_fifo_pop_buf() which takes a destination buffer and performs a
> memcpy() in it to guarantee that the caller cannot overwrite the FIFO array and
> update all callers to use it. Similarly add underflow protection similar to
> esp_fifo_push() and esp_fifo_pop() so that instead of triggering an assert()
> the operation becomes a no-op.

This is OK for your ESP model.

Now thinking loudly about the Fifo8 API, shouldn't this be part of it?

Something prototype like:

  /**
   * fifo8_pop_buf:
   * @do_copy: If %true, also copy data to @bufptr.
   */
  size_t fifo8_pop_buf(Fifo8 *fifo,
                       void **bufptr,
                       size_t buflen,
                       bool do_copy);

> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1909247
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 41 +++++++++++++++++++++++++++++------------
>  1 file changed, 29 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index ce88866803..1aa2caf57d 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -107,6 +107,7 @@ static void esp_fifo_push(Fifo8 *fifo, uint8_t val)
>  
>      fifo8_push(fifo, val);
>  }
> +
>  static uint8_t esp_fifo_pop(Fifo8 *fifo)
>  {
>      if (fifo8_is_empty(fifo)) {
> @@ -116,6 +117,23 @@ static uint8_t esp_fifo_pop(Fifo8 *fifo)
>      return fifo8_pop(fifo);
>  }
>  
> +static uint32_t esp_fifo_pop_buf(Fifo8 *fifo, uint8_t *dest, int maxlen)
> +{
> +    const uint8_t *buf;
> +    uint32_t n;
> +
> +    if (maxlen == 0) {
> +        return 0;
> +    }
> +
> +    buf = fifo8_pop_buf(fifo, maxlen, &n);
> +    if (dest) {
> +        memcpy(dest, buf, n);
> +    }
> +
> +    return n;
> +}

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

