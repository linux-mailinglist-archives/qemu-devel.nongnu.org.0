Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D63440C4E
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 01:15:45 +0200 (CEST)
Received: from localhost ([::1]:55140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgxZg-0006nh-0L
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 19:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgxXp-0005Wg-Jf
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 19:13:49 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:37771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgxXn-0006Or-FC
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 19:13:49 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 t5-20020a17090a4e4500b001a0a284fcc2so13431222pjl.2
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 16:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/JqYVSP5A/JyT3RDFy4+AU+ipw7nyvoGdcmJGp4x7wo=;
 b=TLjyzpvEaI18YXhfY5z8dD9VmnmdN/uTiIxbEMyzAMezUxtZVgs7Nq1sYBeFf4jicq
 6qhqFxU+uQjiVo0OmM7cOMl2ctothoFh1IV0eLlC06Bil6b+zBbLjdA02hMd14T/lsYn
 5N1VOnv4U7d80yh1E9n8v2F4N9ZdseCaIFJ0bGU6BDDh7XWl5Ut/KlScVnKISy/hsWhx
 ld+pEp/rXrtm7WFEh/u/1etVG25uV5azxtbccgnLMsphvqT+zfFYjNjFhK+SGCMTtsiN
 AVoGleD+8yu+Pfx2tfsWrewBSVtq/QetJ2EaFLtc1NLFr5/GsPcimcy78hKhULlxqvmH
 5L4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/JqYVSP5A/JyT3RDFy4+AU+ipw7nyvoGdcmJGp4x7wo=;
 b=iC9fkoZ944CJzK8tWBItNaViJMGN/oIJ8JiGFM8ZKflhlJDudf8izGhlvil5+4S5+w
 75Xmi8b/a+aGcMsLmEInmoCX2Kxxxij6IYI1j+LOwE1eSq/MiZGpqonrhpFeIg8UAl30
 lUTVLiubh+k+Z7LfTaoGyi9ZBOeeqRe2k5GYrfBSEcQjVvC4e21N0S8pZ0CnlPUKf+H1
 CLOiHlOApqQC2UescUNE3A/kCr6AXfhT0R209vTUurvEHTDUObmdIWoOKBbUaUVOSJeU
 rfDePo0rSktU766xlyV97TbTDegRXPfUIeSad78w7rn8jIjX4b97VSeAGfz8q2eClrKf
 d2Ow==
X-Gm-Message-State: AOAM53350eo7lwfoVQCHzHCeoO+V1GLyyF8At4XXu6ZYAHJdl8OzYXTI
 +eOHwV26taUAnJv5ZZaF8j0NGg==
X-Google-Smtp-Source: ABdhPJyW2KkF+g8tSnQOwwUqqljlINJ5XkIJvQ/dxBQLPY0TrmsmqyuUqLz1i4CZYI1tCWW/1fAmIQ==
X-Received: by 2002:a17:90b:1c09:: with SMTP id
 oc9mr28458895pjb.33.1635635625193; 
 Sat, 30 Oct 2021 16:13:45 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id l11sm6640055pfu.129.2021.10.30.16.13.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 16:13:44 -0700 (PDT)
Subject: Re: [PATCH v2 24/34] target/ppc: added the instructions LXVP and STXVP
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
 <20211029202424.175401-25-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2a244309-0f85-a4b7-4f56-0b152563099a@linaro.org>
Date: Sat, 30 Oct 2021 16:13:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029202424.175401-25-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.426,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 1:24 PM, matheus.ferst@eldorado.org.br wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.castro@eldorado.org.br>
> 
> Implemented the instructions lxvp and stxvp using decodetree
> 
> Signed-off-by: Luis Pires<luis.pires@eldorado.org.br>
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.castro@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
> v2:
> - Do not access EA+24 first in LE.
> ---
>   target/ppc/insn32.decode            |  5 +++
>   target/ppc/translate/vsx-impl.c.inc | 55 ++++++++++++++++++++++-------
>   2 files changed, 48 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

