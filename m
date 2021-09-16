Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A56840D820
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 13:07:35 +0200 (CEST)
Received: from localhost ([::1]:54988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQpEr-0008C4-9q
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 07:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQpDA-0006tC-Nt
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 07:05:48 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQpD8-0002Py-C1
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 07:05:48 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso7058088wme.4
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 04:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H2PsU82MMlyW78SaWN79PjADHJVEchsxP5tnC3pZR3E=;
 b=PDotSiZGBHTOzxjPQZsN7GITegUiQ0CTkp/LQwyCHz7cpYtEBdh6U7YYUXUnEv/nQP
 Z/R0qh7/o2PKXFl23mfW3iVth7mVYYKv4iqYLN2fBrhwY4vnlPnFySJwlm13k2mJzvSt
 TzCScp9OZg/vBF8BbW59RNr/pbdSKSAjKRwpR+Vo4X6lYl9PbErPQ0Z1QEFx4P+Kolzb
 P7oJkOPfnMy68JmodStFd82ehXP/byFNW1+nRPn5SA7NVfI7DyY/GG0PjncOLU/9l091
 eKWWgbH6D4DEERti7b3u3elowmPKf9ASVVpTWVUcgBq6ZKVgOsabF4Qfw28MmsDSPfQE
 x6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:from:cc:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H2PsU82MMlyW78SaWN79PjADHJVEchsxP5tnC3pZR3E=;
 b=gaVRAXpU9Ca7suxqzixuFXplKahAGTuQ/Mzcn6cHAQVF5GRLsseDzg9SXIBr0EX3r5
 WYR32a3A/NZFZFshTT1Mv8jZ+PJ/4Yr9CZ6qsxTZjAYGuc7Y+IGkl2AsOBWUt8r3HKOW
 zlAQWOJd2zreYT5kdQq3fwpWUQNnZu9z/Nc+18vqHGRHTkpbfrXyqQEj6qmwm14mQnqf
 oFaaQBaqy5AjeFjVNg4kSrJPGVzqz1o+E/c5FHTAaZMruyIbdOFjW7qCHYeDNRMZiEXy
 ZzsS7xuzx51QufwnQSY5cOr5/aCyvr+0HH+aYiGRVLL5dDzvAsN7q09cX7yeTVVKxF31
 AK6A==
X-Gm-Message-State: AOAM532504SVsCwaDBp17jmOwCcEWrfVnQtqkTVGtxIOH3S9qDdVWKfS
 yRK9tdn6Vpk/kbveVlz2hsc=
X-Google-Smtp-Source: ABdhPJwAoX+wrkntSmitZHgz1SW7ISjn/2qii9uCsTLRYZUMIMgj/eYt8luXMsN+qrPbbFWiUa0mmA==
X-Received: by 2002:a05:600c:1c11:: with SMTP id
 j17mr9560747wms.138.1631790342866; 
 Thu, 16 Sep 2021 04:05:42 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id k22sm3319722wrd.59.2021.09.16.04.05.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 04:05:42 -0700 (PDT)
Subject: Re: [PATCH v3 11/20] nubus-device: add romfile property for loading
 declaration ROMs
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210916100554.10963-1-mark.cave-ayland@ilande.co.uk>
 <20210916100554.10963-12-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a6857eaa-a0d3-c098-3cda-057ee9fa15a4@amsat.org>
Date: Thu, 16 Sep 2021 13:05:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916100554.10963-12-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.488,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/21 12:05 PM, Mark Cave-Ayland wrote:
> The declaration ROM is located at the top-most address of the standard slot
> space.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/nubus-device.c  | 43 +++++++++++++++++++++++++++++++++++++++-
>  include/hw/nubus/nubus.h |  6 ++++++
>  2 files changed, 48 insertions(+), 1 deletion(-)

> @@ -38,10 +43,46 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
>      memory_region_add_subregion(&nubus->slot_io, slot_offset,
>                                  &nd->slot_mem);
>      g_free(name);
> +
> +    /* Declaration ROM */
> +    if (nd->romfile != NULL) {
> +        path = qemu_find_file(QEMU_FILE_TYPE_BIOS, nd->romfile);
> +        if (path == NULL) {
> +            path = g_strdup(nd->romfile);
> +        }
> +
> +        size = get_image_size(path);
> +        if (size < 0) {
> +            error_setg(errp, "failed to find romfile \"%s\"", nd->romfile);
> +            g_free(path);
> +            return;
> +        } else if (size == 0) {
> +            error_setg(errp, "romfile \"%s\" is empty", nd->romfile);
> +            g_free(path);
> +            return;
> +        } else if (size > NUBUS_DECL_ROM_MAX_SIZE) {
> +            error_setg(errp, "romfile \"%s\" too large (maximum size 128K)",
> +                       nd->romfile);
> +            g_free(path);
> +            return;
> +        }
> +
> +        name = g_strdup_printf("nubus-slot-%x-declaration-rom", nd->slot);
> +        memory_region_init_rom(&nd->decl_rom, OBJECT(dev), name, size,
> +                               &error_fatal);
> +        ret = load_image_mr(path, &nd->decl_rom);

load_image_mr() already calls get_image_size(), rom_add_file() and
qemu_find_file(). *But* it doesn't takes and Error handle, and report
error using fprintf()... So unfortunately rom_add*() functions are
kinda outdated and you are doing the right thing to propagate detailled
errors. Therefore:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +        g_free(path);
> +        if (ret < 0) {
> +            warn_report("nubus-device: could not load prom '%s'", nd->romfile);
> +        }
> +        memory_region_add_subregion(&nd->slot_mem, NUBUS_SLOT_SIZE - size,
> +                                    &nd->decl_rom);
> +    }
>  }

