Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D165F3704A4
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 03:13:23 +0200 (CEST)
Received: from localhost ([::1]:38944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lceCA-0007W0-Ui
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 21:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lceAu-0006yE-8a
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 21:12:05 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:34647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lceAn-0002ll-Di
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 21:12:04 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 t2-20020a17090a0242b0290155433387beso7537772pje.1
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 18:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zFDg4jBrQ2aYW4TSYjlQgl7fZspfnlz8JMcKtHh2R3w=;
 b=mbk7htlyxVRbDd8dsLhHjCstISj050ZNupDe5ASaq7+zfhQ4zLXawWPGnHL2CQqRVd
 h2+l+ILNGxJlkqgL0MzGDpiu6lUYi1gk0wPbKq7dg5NmZqxwiXlKm6o1nRUb6MD0oob0
 CLGEK3oNa7w0t2jomQdUcZArjbzubKiJP5yHom8VndfPiH6USbF6GQ5JBhdBoL6U0EJ2
 sZ/4VCR/LQacv0C+vnAnA84fiRJJmB+W8SAQ/l03dUGUd0F5HYwlQ6tWPx+F4j2oI5/e
 J+oXNHzjW1Uxg/E8faPvY+Vb8eKGeQ4Ico11UwV8F8gTDB/JHwiX8nMv9khtlzEmeDXv
 6Fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zFDg4jBrQ2aYW4TSYjlQgl7fZspfnlz8JMcKtHh2R3w=;
 b=Vh02y3Bl99MHA/bJDux/WqbE14PBBTMGbDW17CeilrN1Pl1SKN2GJTPIIuMNpww/EK
 CoulMomcOc91xA+ZqSuh9iHkPVT5ImP9VlmvK1ureIpXwD5I+6JIZs+ByVLl9OSKAG64
 SeKQmZuZHuAZ2FW0FlOsWIYLc+xNB0LJ5xDBp46lQuU7CmcXFXEyi16Lld1RHUzggcye
 Amya9KLCsPv2ITBHI2/QlURzIoFsIjouzqUl0UFxxEM+uUjvNy81e5IEmgI6zaS9pgP5
 LZv2zjiWz99iGPDZPZdzHXpDWk5mdxgc4rtHvhY+GWPbjiDWXBgKVfQiuDfMP1yuJyHl
 ZQsw==
X-Gm-Message-State: AOAM531XdfJL5HVHZjq7qDWunOOfxcyugPPYEpPdi9Hy8EkeaLok5Cl3
 VoUfm8T87JFYJRALDb+wKrFuwQ==
X-Google-Smtp-Source: ABdhPJxnedHNAHy4l9933uF/SeV4dqiQC2P1qFyI4su/z72y2OQYyDX8Dne1FKH09OR2Ao+J+xq7Jw==
X-Received: by 2002:a17:90b:3684:: with SMTP id
 mj4mr18472372pjb.50.1619831515074; 
 Fri, 30 Apr 2021 18:11:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w9sm3129110pfn.213.2021.04.30.18.11.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 18:11:54 -0700 (PDT)
Subject: Re: [PATCH v3 7/7] target/ppc: isolated cpu init from translation
 logic
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210430193533.82136-1-bruno.larsen@eldorado.org.br>
 <20210430193533.82136-8-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1dfe7536-8dc9-ef5e-188b-d8e985be0816@linaro.org>
Date: Fri, 30 Apr 2021 18:11:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210430193533.82136-8-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 12:35 PM, Bruno Larsen (billionai) wrote:
> +++ b/target/ppc/cpu_init.c
> @@ -18,6 +18,7 @@
>    * License along with this library; if not, see<http://www.gnu.org/licenses/>.
>    */
>   
> +#include "qemu/osdep.h"
>   #include "disas/dis-asm.h"
>   #include "exec/gdbstub.h"
>   #include "kvm_ppc.h"
> @@ -42,7 +43,10 @@
>   #include "fpu/softfloat.h"
>   #include "qapi/qapi-commands-machine-target.h"
>   
> +#include "helper_regs.h"
> +#include "internal.h"
>   #include "spr_tcg.h"

You need "exec/helper-proto.h" until you deal with helper_mtvscr().

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

