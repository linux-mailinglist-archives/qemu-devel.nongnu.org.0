Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA273AEA21
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 15:36:26 +0200 (CEST)
Received: from localhost ([::1]:52636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvK6D-0003HI-JA
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 09:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvK3Z-0000It-8d
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 09:33:41 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvK3X-0001VQ-L0
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 09:33:41 -0400
Received: by mail-ed1-x535.google.com with SMTP id c7so18033344edn.6
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 06:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lvyk6/OvMdMzX/dCIN6cuAmxkeSBYWPI1p+xprsBrPg=;
 b=gI6KIz4PFVVGLS/iAaOEycwwMRbFi9wAO8KtYTJTvBZw7mtur39A8zpFukXRZG+6bx
 3wdrF4J6RvOthjt2AxrntaSsxJDyH4htni3W8lhp/Xeu+tzZwQITpr+w4PLIwpnNwjTZ
 SuMr8ap+xUBQy4tPu55zKJLJ/GEh+duf2Jo+3zZU6BQZlAt53Ew9zoxAVvrvWZd+L0uP
 K0nwfs0P8zWpyN+h5OkBcAtUBSClqDXyW4BZBGKNT7Sxzc5WtplNA4pK83bxQ7vfkaoo
 F6k8z7rA9lCaYAAX/J/7XC7cHUUOHDUb1uc1uOFlmVYZrBp2+sIOuwoHuueFIJUJy2z9
 cuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lvyk6/OvMdMzX/dCIN6cuAmxkeSBYWPI1p+xprsBrPg=;
 b=aA75QLsoIeG0X1djqnqDUiSvlZt5M4x70C/QOsahNI29a7SWTv/Vq5WEazr8TO8nj7
 Ln0Q7lJVEWaJBmU9wJ8xhOg0BE+O3E9XKiZ5UkcYpusK8EdNm9mJXF+LxJnPxYEV9Db1
 R+eHpKJWGWtqLVVTYlT62/Rgx2O5GNcm1QW9Vsquh1rbe1ktxCvppJUCeKcEzSKMjLL6
 nDGsFC41VC0bbX8WtzjIQvr/aesQVa5JLFy1mZEA6kxJ+DTy5DYfrqXnKiWzAMQx5iig
 MxGgez+OwW0im9un5PDlFBETzrwrtMNus0YaDRbiJBrQfqx075oclUDGjqvw0I+O+SSF
 OtaQ==
X-Gm-Message-State: AOAM532BJcsqVHK1D4uwTqIo+jeSQWEvU79dH9E23Bo3LPruSKOPzo1l
 a7dEcdV6XBbXhK3naH4wry82IIwFLh/5NxDAyGiCiQ==
X-Google-Smtp-Source: ABdhPJxCctLxZp/8NUINfIOXNQaN5RPfnmrZMEkscgvgtyt5Dpw47K87c5utPT3Cpw8ZPJa6XVvcMvUWdU40bJDgDxA=
X-Received: by 2002:aa7:da14:: with SMTP id r20mr20361115eds.36.1624282417048; 
 Mon, 21 Jun 2021 06:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210616195614.11785-1-pcc@google.com>
In-Reply-To: <20210616195614.11785-1-pcc@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 14:33:01 +0100
Message-ID: <CAFEAcA-w7w=VN+izON4SKwcOzcpc9C3cemMGf7prNXzCd=CkYA@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Implement MTE3
To: Peter Collingbourne <pcc@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Evgenii Stepanov <eugenis@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Jun 2021 at 20:57, Peter Collingbourne <pcc@google.com> wrote:
>
> MTE3 introduces an asymmetric tag checking mode, in which loads are
> checked synchronously and stores are checked asynchronously. Add
> support for it.
>
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2:
> - remove unused argument
>
>  target/arm/cpu64.c      |  2 +-
>  target/arm/mte_helper.c | 82 +++++++++++++++++++++++++----------------
>  2 files changed, 52 insertions(+), 32 deletions(-)



Applied to target-arm.next, thanks.

-- PMM

