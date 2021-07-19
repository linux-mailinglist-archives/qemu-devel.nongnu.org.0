Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C95403CD092
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 11:22:59 +0200 (CEST)
Received: from localhost ([::1]:48450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5PUI-0005f6-Sb
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 05:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5PSs-00046t-O2
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:21:30 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:39725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5PSr-0004Fp-83
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:21:30 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso12361766wmh.4
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 02:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=rPG9vUHku0q/DKAQ8g3l/YQnukDZiHoOPxveT/2eAJE=;
 b=MnT+fx9l0TbaBCcIyltoWMh8kwSREPseOiGfu7AMhB5OKNNh9jiVNwdxjQSmQO540u
 toov54iedyD+LBHA3pVpePmmc3eSv6RVu89NCz2AXaOyZwlk+X1PLa5r2w3O8PbD8OUz
 Ee0/1Cz32UySImR+emaZStlBgs0X9ajdSFZrlQDRUYo029CZtNBiADIDetYZSYQ9HaCk
 e2nFDjCkhI7tCKhYf6tKFB4Ui/rsI0isoztN7ppLx0yY3tDaYXNtwuAbsc8lQ5OlY87+
 7EaCa+Sgox6Jw4Wu5p7N5RF/V41o1yW8xBdVfzeV1pCVcHsz6PJF5i37UpHX0WNJBpId
 nNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=rPG9vUHku0q/DKAQ8g3l/YQnukDZiHoOPxveT/2eAJE=;
 b=XgY5gFVsLcYlaOQLhSJ+fXiFMFdn5nDheqhMRfCkfSp4DL5Z/aNXABV6rqmgLoc8rZ
 q2Eis2FLlDWol/PwLFAnHK1bJvOZAFcFKXBuGk9+3H1bphWdJV/YtGpL4o5vP7bKOJ9S
 ck8OpCiTSKKk8SR5QZ+LTqQMaXeD96hrTPRjlGeopWOi8Xyh1LLHT9eSqLmnavprl4tV
 wxo1Wk3xdEOtDtkiwbIQicz1rkMazC6o+Fq/rChPzPwsG4h6IAmOWD5qTAVBbRGvmT+w
 uu5NB4DLui2OGXQqnkATwrdLvtjHVzdZywxtSlc/y98Aij9+CJJvLf1MAV7WgXiIj/Hv
 tBKw==
X-Gm-Message-State: AOAM532sHejcmCPGdewbWb59MyuTgGrAQ6I6QLAmXLh2dLkndQK3MSYr
 XnnKG4dW0gZAuMOL2MeEddCIJQ==
X-Google-Smtp-Source: ABdhPJzQKcLiXXA6NjlL/w7dg61kg9JdhpN7ifNKh9zwVJyhJYUfA7HwC0vr7JwVoPBiOIaNQUD/Pg==
X-Received: by 2002:a7b:cd90:: with SMTP id y16mr25209962wmj.87.1626686487603; 
 Mon, 19 Jul 2021 02:21:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j12sm19964472wrq.83.2021.07.19.02.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 02:21:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C62161FF7E;
 Mon, 19 Jul 2021 10:21:25 +0100 (BST)
References: <20210714172151.8494-1-ma.mandourr@gmail.com>
 <20210714172151.8494-2-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 1/6] plugins/cache: Fixed a bug with destroying FIFO
 metadata
Date: Mon, 19 Jul 2021 10:21:21 +0100
In-reply-to: <20210714172151.8494-2-ma.mandourr@gmail.com>
Message-ID: <875yx6r756.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: cota@braap.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> This manifests itself when associativity degree is greater than the
> number of sets and FIFO is used, otherwise it's also a memory leak
> whenever FIFO was used.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  contrib/plugins/cache.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
> index bf0d2f6097..4a71602639 100644
> --- a/contrib/plugins/cache.c
> +++ b/contrib/plugins/cache.c
> @@ -200,7 +200,7 @@ static void fifo_destroy(Cache *cache)
>  {
>      int i;
>=20=20
> -    for (i =3D 0; i < cache->assoc; i++) {
> +    for (i =3D 0; i < cache->num_sets; i++) {
>          g_queue_free(cache->sets[i].fifo_queue);
>      }
>  }


--=20
Alex Benn=C3=A9e

