Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9CB58A803
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 10:24:15 +0200 (CEST)
Received: from localhost ([::1]:48318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJscw-0007PX-Kf
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 04:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oJsPI-0003dg-QM
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:10:10 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:41761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oJsPH-0003kk-32
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:10:08 -0400
Received: by mail-ej1-x62f.google.com with SMTP id gk3so3657096ejb.8
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 01:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LWJToMjFmw81IbzVmJKhwsxxb0xLJlyCLYVHMyjJqJQ=;
 b=FlR4Wbmjl/ogXp05/6PEnr0lprKVkw93+QTxFlVaWPjWD6T/o3CZ4VZEIumNSJCQIY
 5pSh1g2AHpMrBe08O4qMAO4G+VPPR+4ixSi6HgHJvau/hNzVq0Mn01JaDaNPylj4Tecg
 FEqgjm6OCiCTo9oS3UvPlatr1DNBqOnmuvrMOmmyxlrMEiG+T+KnwRl6sJZpkDQe2KXj
 Pp73na2T2w3vHLK+1MXQ0zrxtB7RsVKWllkPoJTbpTygYwzjrB2Psk1hN24Ren83A/8E
 I0r5lo64hrtTGBGARBG/UTApjRyPWk+ugrXeBQ7BZsKBMJeLfRx0BLzBY4EYV1iQvJnI
 1voA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LWJToMjFmw81IbzVmJKhwsxxb0xLJlyCLYVHMyjJqJQ=;
 b=TeAopG2HVOciluScDoZjHKVL76ruD57Uxu0rQyddDBhFCAICHM3vJy/cy5KLjAIJZI
 lDPQDfaQTTP2TTLEUAX+IMHbIdWLpRP4Gay5ye7vkbzM6mktc+XtitldDvUZlWvGRZn4
 7ZsBm+yqFw7o4q/xujyRSwcEDawVUXAOi2A+Ke64jlNT5ZQ1MIiwSknjA3TmNjnA8PwK
 Ic8TbUWBE/uu2U2rPVLimsQvMgwllXzKvaBvRKC9XZgtj47kA83I94k2U/yyw+1PmTSZ
 oGsF//MElJlZ4SV/0lSPdiQ7neD2q3gUu6MCKpsw84p8iglUmQFO2msBvip8z8MgYCzY
 Hz5A==
X-Gm-Message-State: ACgBeo2T9rR9U496hf8wFyNkvBxLLYh2jGX5RIY4G5JIHnQtJU50XQQg
 KXhOPK9L1oMbkIuwe7XHzuE=
X-Google-Smtp-Source: AA6agR7oz5nrSgJXAX/jFXXH6x2D7nwmO0ZLbZWfsV/OXUtZlIAq8CjgEGd9f0SJnN/EgLQwOHT5yQ==
X-Received: by 2002:a17:907:1dd3:b0:730:9340:a0a with SMTP id
 og19-20020a1709071dd300b0073093400a0amr4391666ejc.316.1659687004740; 
 Fri, 05 Aug 2022 01:10:04 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 t18-20020aa7d4d2000000b0043a2b8ab377sm1662793edr.88.2022.08.05.01.10.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 01:10:03 -0700 (PDT)
Message-ID: <40fdfb11-1e40-a36a-d3a4-fcbef546a78a@redhat.com>
Date: Fri, 5 Aug 2022 10:10:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] hw/i386: place setup_data at fixed place in memory
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-devel@nongnu.org
Cc: Xiaoyao Li <xiaoyao.li@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
 Laszlo Ersek <lersek@redhat.com>, linux-efi@vger.kernel.org
References: <YuxOgtykRQb1HU3e@zx2c4.com>
 <20220804230411.17720-1-Jason@zx2c4.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220804230411.17720-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/5/22 01:04, Jason A. Donenfeld wrote:
> +    /* Nothing else uses this part of the hardware mapped region */
> +    setup_data_base = 0xfffff - 0x1000;

Isn't this where the BIOS lives?  I don't think this works.

Does it work to place setup_data at the end of the cmdline file instead 
of having it at the end of the kernel file?  This way the first item 
will be at 0x20000 + cmdline_size.

Paolo

