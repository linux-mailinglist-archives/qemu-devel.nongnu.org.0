Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3C06AD59A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 04:21:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZNrp-0007Yf-UN; Mon, 06 Mar 2023 22:19:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pZNrn-0007Wt-Ah
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 22:19:55 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pZNrl-0000um-8L
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 22:19:54 -0500
Received: by mail-ed1-x534.google.com with SMTP id i34so47075707eda.7
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 19:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1678159191;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KHkEQfhDP2+6ap6if/zRr7Qe01YuxG6dIfzVLIdCRiA=;
 b=Ej7aHhTrG3duwMFfIFxneXo2wrZvB76bZ+U6RQTbDYbWqV//Fhy1+a9Mgl48NgTQe1
 +rJHMhqXte4u3xff/Zvz5W+Ik+G3RdHBccSSJasyIwlrzyB8Z01eqAwhIgfXhYJ4d9y5
 T3Qe7mqyGTspCzdJKjwJElqg8aIKdrtLhIkuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678159191;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KHkEQfhDP2+6ap6if/zRr7Qe01YuxG6dIfzVLIdCRiA=;
 b=6DGkyHKoIbovwa76hLWDXpvFPLD8kvdvc+/ZQJ6bWtlGHMsRv4kDvELjcV+45C55AJ
 VgmWfjSmSl+4TSOvWqxYiQQv9UqIXyhz+XJpukVIKU7xVj1y4Zl95RFG2yVULUigw0GF
 xlijiL3NS5oGiofIUVZkMoVABCLpwybh4akgKURtIu/L1TwfrVcM1gmNHXe8sGL422Xg
 2Td5VYA1efLq5//NznKnrP5XiJnFENRkXMuW0qhY/o/HlqjiltDQHrfc72xoMRdppfOo
 E3RSh0TMpox/NspkZWI+yQN39egagAXlnXnFClfFhqv4qD/77W5lEMtPpdbmYyDXMM+j
 8ReQ==
X-Gm-Message-State: AO0yUKU0DaPoyiudXavgU5ON/Y3NxZc6726i2wt1e1yq85+vJyg0CWcI
 hxrx7ldZR1pR4eFejtZ83dNUTfCpzMo/eclKZC8=
X-Google-Smtp-Source: AK7set8LraGBNFfXJycXs5pjq2jsl2eBIyU6x0XeEud3ksP9BoB//IqapIHSq+99NdN2A4Xs5FCRz8TTXmK9ahWB3BY=
X-Received: by 2002:a17:906:329b:b0:8f7:f3d4:942c with SMTP id
 27-20020a170906329b00b008f7f3d4942cmr6484392ejw.7.1678159190590; Mon, 06 Mar
 2023 19:19:50 -0800 (PST)
MIME-Version: 1.0
References: <20230306021307.1879483-1-richard.henderson@linaro.org>
In-Reply-To: <20230306021307.1879483-1-richard.henderson@linaro.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Mar 2023 03:19:37 +0000
Message-ID: <CACPK8XdHr4ws=0aZJvkgaF0U231MJRuyHx7i35gF4uHKCtOkbw@mail.gmail.com>
Subject: Re: [PATCH 0/9] accel/tcg: Fix page_set_flags and related [#1528]
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, ninad@linux.ibm.com, 
 Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=joel.stan@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_CSS=0.1 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 6 Mar 2023 at 02:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The primary issue is that of overflow, where "end" for the last
> page of the 32-bit address space overflows to 0.  The fix is to
> use "last" instead, which can always be represented.
>
> This requires that we adjust reserved_va as well, because of
>
> -/*
> - * There are a number of places where we assign reserved_va to a variable
> - * of type abi_ulong and expect it to fit.  Avoid the last page.
> - */
> -#   define MAX_RESERVED_VA  (0xfffffffful & TARGET_PAGE_MASK)
>
> and the related
>
> -        /*
> -         * reserved_va must be aligned with the host page size
> -         * as it is used with mmap()
> -         */
> -        reserved_va = local_max_va & qemu_host_page_mask;
>
> whereby we avoided the final (host | guest) page of the address space
> because of said overflow.  With the change in representation, we can
> always use UINT32_MAX as the end of the 32-bit address space.
>
> This was observable on ppc64le (or any other 64k page host) not being
> able to load any arm32 binary, because the COMMPAGE goes at 0xffff0000,
> which violated that last host page problem above.
>
> The issue is resolved in patch 4, but the rest clean up other interfaces
> with the same issue.  I'm not touching any interfaces that use start+len
> instead of start+end.

Thanks for looking at this Richard. I gave it a spin on a ppc64le host
and it resolved the assert.

Tested-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

