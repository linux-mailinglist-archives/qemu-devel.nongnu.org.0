Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E4A3CD48C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 14:19:20 +0200 (CEST)
Received: from localhost ([::1]:55826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5SEx-0004pO-Bv
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 08:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5SDX-0003oo-Ed
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:17:51 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:44769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5SDV-0006Gs-8C
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:17:50 -0400
Received: by mail-ej1-x62b.google.com with SMTP id qb4so28300059ejc.11
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 05:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/NcnnQxtpdnxG5H7MMPn25DN8YqrJg5P78oobVbk6+k=;
 b=bRF4qSJJ2ErS7RTeIvk3bV4KPi1GAsVUvbJRIcKM6e47QAY7lfsOfSCK3CeP6uuiCo
 Hq5UkpbgDS3EAurQr4zz9cuL46vSI7arOLorBjKrf3oenUIRNxuRDoezL39amqxjp/iM
 yxYtinN6OZ0igjBks9TYimhm/ViXeZsUdx/VUpMl2mPfeXEowFA0COYFEYOzK8JzVzbV
 ZYys2mPFBhs9a7ISXlv93nEKuYKH4GwmvD41ZHQSPrb5v+xUdJ+nteNB5dJ9SCx5IE/w
 w1ufM2+T83mgVwO/UOL/pbOaxtP+/eTDoUvZpDYoOprCsVP52XrFPlMkfqq24YjtCiXK
 ue6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/NcnnQxtpdnxG5H7MMPn25DN8YqrJg5P78oobVbk6+k=;
 b=VWqbxGiakUyuBmZjLfuwLRWKmWNfUsWLHHvaG4Ve765CbDXRLyRMEUKPs2mSUqIFpa
 URT4FaGGQyfwH8sSc5EeMrCp7nAjfNQB4r0jrou0Ix+UPxAEYVTjDotRiNxVoxWVaqxi
 6LeCf+3FkgrLW1YFlPAQ2tTofOibSR8jhCyA2z1ZEKwh5c99RdOUMBI33qAuoGYc3VYq
 8AyOU3m/Kd22IZxycsGhVuwwWfOJQd3uEoxq6P+gFSpi38w3a68xw1MKJKl9f/ZrLizx
 AzGRlzga2zNaSlRzrRGGyBS1ByfiysTA5oK6PL/nnZZ4zN4AQxGGIRLD5o/dSuEKHxYG
 /pMA==
X-Gm-Message-State: AOAM5328Z056+0ZDY3pinXb4EtKzUkJHHiO5jetONejjgxKuzY8leUlu
 SRI1IFKsFSWNPPoOUU3NALybtDXjypPQ+0nDhsUbHA==
X-Google-Smtp-Source: ABdhPJzqvQUeU49I4WrI3YmUgCF0jYzlyzSxO/FdOtXdYRG40eQpbfX8XNwgad/b53/VGKLxyk9c5LSUP4kiNYeaowA=
X-Received: by 2002:a17:906:a2d7:: with SMTP id
 by23mr26509623ejb.382.1626697067653; 
 Mon, 19 Jul 2021 05:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210717192419.2066778-1-richard.henderson@linaro.org>
 <20210717192419.2066778-5-richard.henderson@linaro.org>
In-Reply-To: <20210717192419.2066778-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 13:17:07 +0100
Message-ID: <CAFEAcA8fdv-BM6pu4X=zOHmJHQ+D_Jb2fo7+j=gUssU9uHBYzA@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] tcg: Rename helper_atomic_*_mmu and provide for
 user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Jul 2021 at 20:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Always provide the atomic interface using TCGMemOpIdx oi
> and uintptr_t retaddr.  Rename from helper_* to cpu_* so
> as to (mostly) match the exec/cpu_ldst.h functions, and
> to emphasize that they are not callable from TCG directly.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

