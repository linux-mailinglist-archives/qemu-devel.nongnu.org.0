Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C0E694F5D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 19:28:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRdXa-0000ro-F4; Mon, 13 Feb 2023 13:27:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdXX-0000re-3S
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:26:59 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdXU-0005S3-C1
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:26:58 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 m20-20020a05600c3b1400b003e1e754657aso3486631wms.2
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 10:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HmXLULjmK5+8zhKIDcYkQobOvuWWjA1SvS4JKomkdIc=;
 b=d1OD0UZB+eUO5LDoPChIjuhAmroJ76ax3RY+z3wAsIhzfZ2xGkiFc8It13861esey9
 dPvmMmFqUg8AIHKm+tPvPgcUEIoDChdR9IG5U11cAcrZzltgNvRA/lpvVPQDz0MfkKbt
 FXgQVarZvG7qL+MrvBXPLUBmrPIQ2eU4TBIF2HfeXQKJ3xZ1Eszcuqef8XrXBM1jxf1i
 sa1cBq+Ou2Axgw6EublJRN9WUPVk3OEMl3TQyI3Ep5kiaxvvC+w11fUINa4DfES/2C+e
 VRPXsGofcGiE1Ac2MtpSbxckNBoJ4jEFkKUpbuwqNZrTN9Nffq8IYiRpMf1v7zj28DoE
 Zxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HmXLULjmK5+8zhKIDcYkQobOvuWWjA1SvS4JKomkdIc=;
 b=NMlB+1FY5w1V/cqe7fdBntGTeTKcDvNoLpVv/EcZPC4U9hxWAFWaRQIS3CbviiJH3d
 PMKqnYxJuQ7+hoFoIcL3FT7jouX8oIjDDCGVxdAqWGr36je/ra34xpLXh5Pb+YV9e57u
 ITcSJdZ4mGFdd4kJ7nsKaOOsVsaRZRonqOQgIAls6KPZ8RSSuViPaZR4reFwZeKHOxZM
 qKVAzl5q40VVIOygBrpzruzfvl4CzBXqzsn8bCJbD5yUwIJpyreRxcGnAiLJ3jz3keZu
 +LMB6v/tnIm8ENTMiWtJlTvGNtJvApK+Ch4GtVq5DXgukTEpKe1n1nzrz9Od/LFBrace
 LOWA==
X-Gm-Message-State: AO0yUKUYzqishmemNzweZRNOMFLRcAy3eEx8sPLQm9qxj4i/Gad/+KDA
 t56TvCbIk2/QID6ZBz+0Tj2CXA==
X-Google-Smtp-Source: AK7set97f9luSPuvpAkfzhR/SBnjNVJf8OaV2UXow0/Fthq1vlKOOh9Q0K2rAMAOdQlIuxKLvt4Lpg==
X-Received: by 2002:a05:600c:3c9c:b0:3dc:d5b:5f6a with SMTP id
 bg28-20020a05600c3c9c00b003dc0d5b5f6amr19883228wmb.30.1676312813014; 
 Mon, 13 Feb 2023 10:26:53 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j23-20020a05600c1c1700b003daf681d05dsm15736124wms.26.2023.02.13.10.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 10:26:52 -0800 (PST)
Message-ID: <b04ebfac-c434-8045-1b6f-6201686130b9@linaro.org>
Date: Mon, 13 Feb 2023 19:26:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] usb/dev-wacom: fix OOB write in usb_mouse_poll()
Content-Language: en-US
To: Mauro Matteo Cascella <mcascell@redhat.com>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com
References: <20230213174113.591632-1-mcascell@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213174113.591632-1-mcascell@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
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

Hi Mauro,

On 13/2/23 18:41, Mauro Matteo Cascella wrote:
> The guest can control the size of buf; an OOB write occurs when buf is 1 or 2
> bytes long. Only fill in the buffer as long as there is enough space, throw
> away any data which doesn't fit.

Any reproducer?

> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> ---
>   hw/usb/dev-wacom.c | 20 +++++++++++++-------
>   1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
> index 7177c17f03..ca9e6aa82f 100644
> --- a/hw/usb/dev-wacom.c
> +++ b/hw/usb/dev-wacom.c
> @@ -252,14 +252,20 @@ static int usb_mouse_poll(USBWacomState *s, uint8_t *buf, int len)
>       if (s->buttons_state & MOUSE_EVENT_MBUTTON)
>           b |= 0x04;
>   
> -    buf[0] = b;
> -    buf[1] = dx;
> -    buf[2] = dy;
> -    l = 3;
> -    if (len >= 4) {
> -        buf[3] = dz;
> -        l = 4;
> +    l = 0;
> +    if (len > l) {
> +        buf[l++] = b;
>       }
> +    if (len > l) {
> +        buf[l++] = dx;
> +    }

        else { // the packet is now corrupted... }

> +    if (len > l) {
> +        buf[l++] = dy;
> +    }
> +    if (len > l) {
> +        buf[l++] = dz;
> +    }
> +
>       return l;
>   }

Better is to wait for enough data to process:

-- >8 --
diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
index 7177c17f03..2fe2a9220e 100644
--- a/hw/usb/dev-wacom.c
+++ b/hw/usb/dev-wacom.c
@@ -244,6 +244,9 @@ static int usb_mouse_poll(USBWacomState *s, uint8_t 
*buf, int len)
      s->dy -= dy;
      s->dz -= dz;

+    if (len < 3)
+        return 0;
+
      b = 0;
      if (s->buttons_state & MOUSE_EVENT_LBUTTON)
          b |= 0x01;
@@ -274,6 +277,9 @@ static int usb_wacom_poll(USBWacomState *s, uint8_t 
*buf, int len)
          s->mouse_grabbed = 1;
      }

+    if (len < 7)
+        return 0;
+
      b = 0;
      if (s->buttons_state & MOUSE_EVENT_LBUTTON)
          b |= 0x01;
@@ -282,9 +288,6 @@ static int usb_wacom_poll(USBWacomState *s, uint8_t 
*buf, int len)
      if (s->buttons_state & MOUSE_EVENT_MBUTTON)
          b |= 0x20; /* eraser */

-    if (len < 7)
-        return 0;
-
      buf[0] = s->mode;
      buf[5] = 0x00 | (b & 0xf0);
      buf[1] = s->x & 0xff;
---


