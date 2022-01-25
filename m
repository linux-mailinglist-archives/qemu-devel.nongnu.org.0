Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC3049AFC3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 10:24:05 +0100 (CET)
Received: from localhost ([::1]:34374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCI3Y-0005Gp-GE
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 04:24:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nCI0W-0003fj-3y; Tue, 25 Jan 2022 04:20:57 -0500
Received: from [2a00:1450:4864:20::52f] (port=36724
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nCI0N-0003Y2-4x; Tue, 25 Jan 2022 04:20:49 -0500
Received: by mail-ed1-x52f.google.com with SMTP id l5so44391424edv.3;
 Tue, 25 Jan 2022 01:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=efqh+HLVU3c/0LGTrq/0WrBEemrF+3u5AzvFghGtuWQ=;
 b=EX1ANxJ3AbnY27rz4T5+QyPAiho61vsvFhwAezBDh6uwBhzE/tDkszAvaDoY/ToC7f
 +7T9WZzKhsBoF5cFr0UzP2+/dBLdwsowP05dBdobqTF4ERNKEbFH0S05tVF6vZVCzVJj
 Rf1BQIEwWOvt12k+mC7Mqy5n1+0M/EybXv7UX0LtjjyvJLtJfd3w5IMe8OYasdJ93lvi
 FXbYYhTF9J5tiXex+wmW5jv9+jwAWGYz5ZSGxmeGFuS4vZEJHUPKiZFD5+Kouk7UrDDH
 7TxLMhdpRsl2MGJR6OX4aIs+bUV8vkQjH1UWc9Dr9vYaV5+mnak37O1RUEV98hXYi4ZK
 yS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=efqh+HLVU3c/0LGTrq/0WrBEemrF+3u5AzvFghGtuWQ=;
 b=N8MAvBYmCx3w2rdg3HnbtOSoSuhJlifsgfIW8fa68SZFEGfT8jqy44UpO0A3clvXL7
 MLaxOv5lSZ4PmuqWQksWvt2rwiFjkVq0zQ98vP6BD/Vbhn3Igxl/lIVx3wkhv2lY0OX3
 KbHoHUixd0Lxn32d5zH4qj7b0zrDPz0WrWRPPBShpKqINNlgihVdNs687yAodRz4i3vi
 vh4s7IrTbIfH1nqKFkYrkeTnoOy6PbEgmOLPRT6leQxpaEk/HMJ/+fFMwEVVRQIvOULV
 RZIvYFd7xwbr31pfgonrtryiKV3Q7A7OiUOApXNoIZHaWimIHmiy1QJBiBm/JQTbBeb4
 pLJA==
X-Gm-Message-State: AOAM532Ue+hI7DA7SRdul1C/yHZE0g4snfCYzZdq2It5kbVwZwWJz1G9
 zzc86UdT1mVtKSWOaVZM4ew=
X-Google-Smtp-Source: ABdhPJy7uzIyodVMoWqydg1J5BBOSi3qZDP2rRuT9tn1UIIGuZGwi9npGfOMGAnBkLh9RsLYUT6uOA==
X-Received: by 2002:a05:6402:354a:: with SMTP id
 f10mr19823855edd.379.1643102444763; 
 Tue, 25 Jan 2022 01:20:44 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id op20sm5944165ejb.68.2022.01.25.01.20.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 01:20:44 -0800 (PST)
Message-ID: <b043c11d-a007-6579-180f-4dd8f0bcae5d@redhat.com>
Date: Tue, 25 Jan 2022 10:20:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] hw/nvram: use at24 macro
Content-Language: en-US
To: Patrick Venture <venture@google.com>, philmd@redhat.com
References: <20220119214329.2557049-1-venture@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220119214329.2557049-1-venture@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/22 22:43, Patrick Venture wrote:
> Use the macro for going from I2CSlave to EEPROMState.
> 
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>   hw/nvram/eeprom_at24c.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> index af6f5dbb99..da435500ba 100644
> --- a/hw/nvram/eeprom_at24c.c
> +++ b/hw/nvram/eeprom_at24c.c
> @@ -54,7 +54,7 @@ struct EEPROMState {
>   static
>   int at24c_eeprom_event(I2CSlave *s, enum i2c_event event)
>   {
> -    EEPROMState *ee = container_of(s, EEPROMState, parent_obj);
> +    EEPROMState *ee = AT24C_EE(s);
>   
>       switch (event) {
>       case I2C_START_SEND:

Cc: qemu-trivial@nongnu.org

