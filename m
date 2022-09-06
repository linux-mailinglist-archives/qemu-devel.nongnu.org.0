Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203DF5AE107
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 09:26:51 +0200 (CEST)
Received: from localhost ([::1]:52382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVSyw-0002YA-7P
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 03:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oVSst-0004Ub-1w
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 03:20:35 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:40474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oVSsn-0001D2-Qh
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 03:20:34 -0400
Received: by mail-ej1-x62b.google.com with SMTP id qh18so21119136ejb.7
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 00:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=4/xCAW5qhxfsWscShFUZM+n3IhErKzK8ctVT2wYzpPo=;
 b=Y9O0JFchG56VAmiyoyreYkBOwI1dgwZFKLQWQ0YQ8E10ZCPVbQ4RBjtvtjfUkxFV+E
 Ryaz146Vr8Mc4Y/HQqXLx1GBpFaOjF5osmJuv0DLiz443zNdmY2jJdfYXsshGMeBooIe
 GhD1UZaELQhA8MOVDXQnb46hQcyxGXVQrorevf3qAXm/OmUd3xxUOHkPquDB9+PFpIWV
 xP+IEsYzpKKRZM1I5SPPcUrn4AznO7pGC5q1KJI/wQ0nol+5yzyQuZFJVFA+Zou1P7Oj
 EiigQAsHeRfEei/D8aK/2zS9t9vz4CMwMJfj4cgk/2j8kAr2waqCo9IJM/6AS2vITo0S
 OkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=4/xCAW5qhxfsWscShFUZM+n3IhErKzK8ctVT2wYzpPo=;
 b=LHcOTES5+QbvuwmY+tvnpTzXk5FOK9qQGJrxPFQXdKa/5Tn+R6eR8HoLkNMQZArqM8
 GuzXW58SBS9m64yS+Q41w5UtdsTqh/+TvKYnEg8nhmP+wJ54jXA7loSqMQYp2DJQkglF
 ouW0E3hryRtYzaaCXd/OQmtrUD91kyM6Qo9kbfOZvndoIyjOaq8etHLQ4W+BnRtYnNjd
 2aOtWzdt9GVy+Ig9o6hiXd7QWxweM6cby0SwI0WuCFr9oTL+UYweBgIibUKpTenzfRxi
 iwbvI+gqqHBucrwT4jXHnIf4tbl1+PUFe9TLnRgwT5mrqKB3UX0fPdDojF/XiqZcdx6T
 mfXg==
X-Gm-Message-State: ACgBeo0DofyzF3PI6XVps9WFEJ2xq4Eml2i0vREHk/y3uAgCWuNAllqS
 4cfnHRYvUV3Oknf3YXT7+v2xrg==
X-Google-Smtp-Source: AA6agR5h0KCfY64GRU1YdS4ZUEvfyoxaIqApFK3B6GomleU1pDIEiyjmdTdb7ejHojNK5XD395ZjHw==
X-Received: by 2002:a17:906:5a5a:b0:741:559f:f539 with SMTP id
 my26-20020a1709065a5a00b00741559ff539mr31133000ejc.3.1662448828342; 
 Tue, 06 Sep 2022 00:20:28 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a056402348e00b004464c3de6dasm7891373edc.65.2022.09.06.00.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 00:20:27 -0700 (PDT)
Date: Tue, 6 Sep 2022 09:20:27 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Song Gao <gaosong@loongson.cn>, Gerd Hoffmann <kraxel@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH V3 1/3] hw/arm,loongarch: Move load_image_to_fw_cfg() to
 common location
Message-ID: <20220906072027.fbffz6ztdukwvsvs@kamzik>
References: <20220906042451.379611-1-sunilvl@ventanamicro.com>
 <20220906042451.379611-2-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906042451.379611-2-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Sep 06, 2022 at 09:54:49AM +0530, Sunil V L wrote:
> load_image_to_fw_cfg() is duplicated by both arm and loongarch. The same
> function will be required by riscv too. So, it's time to refactor and
> move this function to a common path.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/arm/boot.c             | 49 ---------------------------------------
>  hw/loongarch/virt.c       | 33 --------------------------
>  hw/nvram/fw_cfg.c         | 32 +++++++++++++++++++++++++
>  include/hw/nvram/fw_cfg.h | 21 +++++++++++++++++
>  4 files changed, 53 insertions(+), 82 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

