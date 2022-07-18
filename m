Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA455786FD
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 18:08:53 +0200 (CEST)
Received: from localhost ([::1]:39660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDTIi-0001EK-93
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 12:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oDTGv-0006Ex-A3
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 12:07:01 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:34620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oDTGt-0006ng-MQ
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 12:07:01 -0400
Received: by mail-ed1-x529.google.com with SMTP id x91so15988878ede.1
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 09:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CNqMN0EgY20DJjVm1KSfPukXO+GPF13NJx0rSUS1nvQ=;
 b=ImazfRfT3UUlLa6GhB6AFT5ZEun9J02BR2mS0/a0dDXX3w1/GYx4oVwxAx6iGGU10X
 WBTI3f0WZwh/v3h0b7+PNGgNoZuiofUZBzjVA1P9CGNKbUqzF47Mg80HhbxXvXHT9bp/
 5r7dnBdBUGuVrMxzHSkpS1H2JXD4Py32DxcMYGDapn9Ie7xah8ecOm8kVNYJmofsCRgh
 o19/TBZv4bMqderrJAosw3rG3AzMAnpdD/cKrOc21qx6lzxroPa4uhG5trUpEPde++iT
 FXYO8ZyHmj2h+Ruu/Yvo6DDCenMedBO1Yx/EdG+RU0AgaYpu2ZcBPx2crn6YDvcl+QkB
 MFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CNqMN0EgY20DJjVm1KSfPukXO+GPF13NJx0rSUS1nvQ=;
 b=KwD6nHOVnzA7j5SiUfzx+nfcXus65i71zirr1993+4QxtZLJYSu4KIvp4pyzOaTral
 4mcqFpTfeF6CEHzPfZ33FrOyJVBlK7qmZTPIbOsGh1yBO4XUmFBfdoMbKh2RlMbr7/W3
 Kgp62bzzCKgiJ6LEFcZXkcKEzLoWI2YicTu4hu3FYEyr/kBRQE7TUOL0Y0GC+2UellcF
 eN9Oq0+LBBYXJy8cJXuoKX/gWU5kchD3/R7urNLemEf6T7FapNd4RED3d6bYtTFC8Yrs
 Rh9utykCUwqYHuL8ZNqzI96mdeKVjjfwJVYgbFci3XhVxzOFzXIp0uFPU49vF85tXb3M
 mRdg==
X-Gm-Message-State: AJIora8O9QnNYzo/LcAnYhOZOsDyl/c91TAiAZohhXtYmWLdu31BdJo+
 uKJnQAFhTLZCfjtMFQSXzmU=
X-Google-Smtp-Source: AGRyM1vdBbSINwzWmjEpCweNGJoQYDkwofivSF9Eiup62KZQcvpTgWuIXAG7NoKdFxPTQzdCQp3npg==
X-Received: by 2002:a05:6402:3553:b0:43a:dba8:9f65 with SMTP id
 f19-20020a056402355300b0043adba89f65mr37557406edd.323.1658160417892; 
 Mon, 18 Jul 2022 09:06:57 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 e2-20020a50fb82000000b0042bdb6a3602sm8643844edq.69.2022.07.18.09.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 09:06:56 -0700 (PDT)
Message-ID: <005dcc0e-e942-9afb-ad36-fe53a6a45b85@redhat.com>
Date: Mon, 18 Jul 2022 18:06:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/2] coverity COMPONENTS.md: Update for loongarch, slirp
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220718142310.16013-1-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220718142310.16013-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
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

On 7/18/22 16:23, Peter Maydell wrote:
> This patchseries updates the Coverity Scan component regexs
> to add a new component for the new loongarch architecture,
> and to tweak the slirp component and mark it as "ignore when
> doing scans" (since it's now a separate upstream project).
> 
> Unfortunately there's no automated way to upload new component
> definitions to Coverity Scan; when these are reviewed I'll
> update the components with the GUI :-/
> 
> thanks
> -- PMM
> 
> Peter Maydell (2):
>    scripts/coverity-scan/COMPONENTS.md: Add loongarch component
>    scripts/coverity-scan/COMPONENTS.md: Update slirp component info
> 
>   scripts/coverity-scan/COMPONENTS.md | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

