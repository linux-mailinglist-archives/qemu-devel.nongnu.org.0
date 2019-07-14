Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 762F867EB9
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Jul 2019 13:04:32 +0200 (CEST)
Received: from localhost ([::1]:59710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hmcIw-0003ru-Ut
	for lists+qemu-devel@lfdr.de; Sun, 14 Jul 2019 07:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58454)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hmcIj-0003N8-PT
 for qemu-devel@nongnu.org; Sun, 14 Jul 2019 07:04:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hmcIh-0001m1-Q8
 for qemu-devel@nongnu.org; Sun, 14 Jul 2019 07:04:17 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:52914)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hmcIg-0001jp-5x
 for qemu-devel@nongnu.org; Sun, 14 Jul 2019 07:04:15 -0400
Received: by mail-wm1-x32f.google.com with SMTP id s3so12484771wms.2
 for <qemu-devel@nongnu.org>; Sun, 14 Jul 2019 04:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IJCgDVhxiseY7XWwBmZ27J/5fYQgLDVWtvomA/EQ0K0=;
 b=YeOtU6cA2y2JOd/+5MFMZ3OiSvWVSWFClQCuY60sLh5KeS7uiHiABJiNwFzKVJm27c
 eEtcINWdkx3KbFLwbLXeDsMQ54oPnCVlkZgNTOvMHuJ4ViA0/kJ7kmVMPZP5Fo98612c
 I6Z5UNmmobSJl2odHYx42hiuyBReYvb4nTzIYYzNRz2lu9qwLldinTcEX4QmzgZwqkPs
 eBGoS4IGgMK+tcncsi2/27X+fAnGlarcHazK8YOmH/idwp08ZcXOsgCv+425+chc8aT9
 5XuvuH2u+ItyeIzG2xEhA2tFD/tvHK9EBAdJr8asxPXC5o2qtIJcOfCkWyLVUufKXO6K
 yVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IJCgDVhxiseY7XWwBmZ27J/5fYQgLDVWtvomA/EQ0K0=;
 b=AnLhJ2sSUJoEoofLxOEIlBLts3wx8niQ0UpGcR1G9gyJy2lUcJB84wmxFCNfaI42Kv
 2/M5nQk6kuyrY4B6nQ41xmCkDyBN15yPf9WSx0ssHHp7Ukbi+kuXC7AIke0zbj20l/x0
 Lkek4gp92SiIS4WkUWVGUPpMVIkWWibXr1J86/NFf62zC0NbdjjEUZfKYKa+CkiEoFRw
 ggSDJkZ1PVAW9ts45Drk+jbn32Turss2i45XhW3mMebP8B3ctyfJXOXslmKuL3eXCbqh
 u/WF7eNuAh7s62ouJeh9Q5Ry+DMeI6KXJyd5eUvMQu08UrQH8up+htJ18j9QAoRL3Z/4
 KmjQ==
X-Gm-Message-State: APjAAAXpKmRY19QKCq0cJcM0YAbVYmIOMOWm5eAuCUoxEyslT8K8A2Hu
 E4UrRlgjRofgmobJl6Z6Ilyd+A==
X-Google-Smtp-Source: APXvYqx+27b2WPRjVNRO0zacC3OFgyYOiSh4CZy4jXfrOI7K8Vu4oS/JZc26yo2L/t8gg1DFGnEGNg==
X-Received: by 2002:a7b:cbcb:: with SMTP id n11mr18496347wmi.54.1563102251955; 
 Sun, 14 Jul 2019 04:04:11 -0700 (PDT)
Received: from [10.0.7.42] ([194.144.248.241])
 by smtp.gmail.com with ESMTPSA id z19sm9925584wmi.7.2019.07.14.04.04.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 14 Jul 2019 04:04:11 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190712133928.21394-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <65921981-c235-d8ca-ce26-27e7ef03585e@linaro.org>
Date: Sun, 14 Jul 2019 13:04:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190712133928.21394-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32f
Subject: Re: [Qemu-devel] [PATCH-for-4.1? 0/7] vl: Allow building with
 CONFIG_BLUETOOTH disabled
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/12/19 3:39 PM, Philippe Mathieu-Daudé wrote:
> A series of obvious patches to build without the deprecated
> bluetooth devices. Still worth for 4.1 or too late?
> It is clearly not a bugfix.
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (7):
>   hw/arm: Nokia N-series tablet requires Bluetooth
>   hw/usb: Bluetooth HCI USB depends on USB & BLUETOOTH
>   MAINTAINERS: Add a Bluetooth entry
>   vl: Fix 'braces' coding style issues
>   vl: Use qemu_strtoi() instead of strtol()
>   vl: Extract bt_parse() into its own file
>   hw/bt: Allow building with CONFIG_BLUETOOTH disabled

All of this looks plausible to me to go along with the 4.1 deprecation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

