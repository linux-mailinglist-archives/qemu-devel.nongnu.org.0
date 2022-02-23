Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9331E4C104D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:29:54 +0100 (CET)
Received: from localhost ([::1]:41100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMou9-0005tJ-Lr
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:29:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nMoEq-0000A5-Hc; Wed, 23 Feb 2022 04:47:14 -0500
Received: from [2a00:1450:4864:20::62d] (port=34722
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nMoEo-0008NP-4z; Wed, 23 Feb 2022 04:47:12 -0500
Received: by mail-ej1-x62d.google.com with SMTP id gb39so51283338ejc.1;
 Wed, 23 Feb 2022 01:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qQRE/0cs6IXwI7PHRGZffKNPBRqbCR89em/BJcXIF/0=;
 b=YSEozZmZmwCWYohy9gxfWoRlurS+M4xsuVbRm8ZITKfQvAZmYlC1iu84I6HeTypz5v
 E2juAZZ4OkRuk+PRsR3O3P5/BYRp3Y7i5ei90O5+lcGlwspLfGrzN2GRd1XVjviT/x7V
 C+ht5HRW7bR9DStOCbIyfUvKm9o1DvrlNG6mp+/illSIuqbIhmX9oXdhknhYvf5ksueP
 g5f9x2qAAbHJpMHq5ajn8dBZid9VgXUN0Wnluk8ShXS+L63uYuKsg+JAJM4yF5YaqcUI
 bY14w2M+BCPfUwJTBHo/vBbAcUj8ZpOypf4KW8KP/0T4wDV5ix2AvOWHNBmpx1ZUL6R9
 /QLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qQRE/0cs6IXwI7PHRGZffKNPBRqbCR89em/BJcXIF/0=;
 b=TH0sIqFb8UDWfWTeTCBS1BgqgdoeiRY4ThXP5ib9EWRIl5kYDSeu4P+dqWLrQZ52eZ
 F4Gz2wtl/UJSpVNQRfHwX+BNyt30pltNBVM1469ssQqPbnnmZ2fcp+ZoWc/vkbV7VzBd
 Jk1uuFQIOgEQlSMSVxGs2f5Wr+Xt4QsyXg3fn4vXKCL5LVo2rMuhqYtQRGIF3I8jtJte
 7yCVdMz2yE0TNBALTqvJYstEr2gSilvuiS7MkD6fONgO7dGEArIG5I+9v6Yei1PQ9LnZ
 5+xWF/bMVphW7YtZv9/wH2TJ68o4VXGtu5sBXtQ62lh/ceDtOMGTjloCK0wMoPCIgrKl
 eJJQ==
X-Gm-Message-State: AOAM533LScztKVkhVYMO5G7vn7RUBfNMydKo/wnhKnF+FrUAmPwyzLtd
 cQLBNytA1kkooaCgm7xBj/4=
X-Google-Smtp-Source: ABdhPJwZIkO5+XKrDVN45Mhep7oZ4GWbzxVQATMPckUatHwjT/CEqkOT5BuY4EO/dLIcqiWXOIy5eA==
X-Received: by 2002:a17:906:4c46:b0:6cf:5489:da5b with SMTP id
 d6-20020a1709064c4600b006cf5489da5bmr22291457ejw.203.1645609628023; 
 Wed, 23 Feb 2022 01:47:08 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id p18sm7252923ejm.63.2022.02.23.01.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 01:47:07 -0800 (PST)
Message-ID: <1988379c-9adb-ec6a-64f6-3fd22df74a82@redhat.com>
Date: Wed, 23 Feb 2022 10:47:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 1/4] tls: add macros for coroutine-safe TLS variables
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220221142907.346035-1-stefanha@redhat.com>
 <20220221142907.346035-2-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220221142907.346035-2-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Florian Weimer <fweimer@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Fam Zheng <fam@euphon.net>,
 Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/22 15:29, Stefan Hajnoczi wrote:
> +#define QEMU_DEFINE_CO_TLS(type, var)                                        \
> +    static __thread type co_tls_##var;                                       \
> +    type get_##var(void) { asm volatile(""); return co_tls_##var; }          \
> +    void set_##var(type v) { asm volatile(""); co_tls_##var = v; }           \
> +    type *get_ptr_##var(void)                                                \
> +    { type *ptr = &co_tls_##var; asm volatile("" : "+rm" (ptr)); return ptr; }
> +

Is noinline needed here too in case LTO is used?

Paolo

