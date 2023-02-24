Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9C56A1CDC
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 14:17:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVXwN-0007p2-6S; Fri, 24 Feb 2023 08:16:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVXwL-0007ol-RX
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 08:16:45 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVXwK-0002US-CY
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 08:16:45 -0500
Received: by mail-pf1-x429.google.com with SMTP id y10so1142450pfi.8
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 05:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TymG5Qdxlj2e6/kLciKqFvOE7kSo5QeuxUG+AjSTkRg=;
 b=WeJgBX2111EZ/pq/nnHnGhfHgQjPQj8qrm1CpUL39CcuRJ/qluuX3j169UPX39x+UZ
 p3BSPry2nMHLLGAMfelfgqmz/fraKPVqla4+pFIAe4g4/krj2zkInGgiTvp1wOcN8nJH
 ANqu6vWKkwyZ1wFaX5WIkORP/xzYySNxQOdgqquzjIEJPFYhwrCIrwYKiy1EWKo4zaoR
 PZKMsG6xQWW9YZ5ekk18I+oAMztB6g9s5AeySgs7mYfFnaOfo6CK7XyWoGB630KDC94+
 WqUC5RbCR+Jr9IsQhwuEpPqI9q/hIcj0g3zipaSvTppcCrKe7vssHHAW7GRN4LiAje9w
 vqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TymG5Qdxlj2e6/kLciKqFvOE7kSo5QeuxUG+AjSTkRg=;
 b=JN8uzC2LOEkcvTNa0zCXO4JWqeDWP3KQlsbF4YwY/w5hF2ii471uE5JfzmMtANg0Uu
 p6s+S7m8O0i+MJTy72byPe2NegniN81O3WUkfdv8HlK85B260ZjNwf89R6N+Qusf98Qp
 rzxsjj2FHwbgiW3mYqCXB9F3tWYy3B4i28PVa/uY3eRkuumaYlR5owQl+EjQdlCPcSLk
 BAdv8ZI35v0L/T1KIXIJCc+s8iT0R8i+DzKtF9nGAhj4gXby5oSxsQS97RZz9IGFxlBo
 8953+UaLY4/3rtlM/rP2J0RD8yy9EJhkFrEisyRVmooRBPnl4039P6ajrRND21PO+st4
 G8Bw==
X-Gm-Message-State: AO0yUKXjGIz4ark24b7rxnpWdam3FHkoYXWIKZzISmXwVJw6WgKwTvv1
 0zdUan4xkeBlsx2hLvEF9QSMaZONSfpkJdyqsAsyLPcvh/H2gQ==
X-Google-Smtp-Source: AK7set9wyPwNQL++RD7DuAjLJ+DWvnUd7DGynquMLFXrbL9afZETKu+nzZ+OoF2zHyPuK3tzCpIp3UM0k1xPdo3zGNk=
X-Received: by 2002:aa7:858c:0:b0:593:c9dd:9069 with SMTP id
 w12-20020aa7858c000000b00593c9dd9069mr2935064pfn.5.1677244603083; Fri, 24 Feb
 2023 05:16:43 -0800 (PST)
MIME-Version: 1.0
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-4-richard.henderson@linaro.org>
In-Reply-To: <20230222023336.915045-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 13:16:31 +0000
Message-ID: <CAFEAcA8bcCp7jPKTSMTb7b-Sr4pcCDdXODoftXqk9AntnpXT0w@mail.gmail.com>
Subject: Re: [PATCH v3 03/25] target/arm: Diagnose incorrect usage of
 arm_is_secure subroutines
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 22 Feb 2023 at 02:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In several places we use arm_is_secure_below_el3 and
> arm_is_el3_or_mon separately from arm_is_secure.
> These functions make no sense for m-profile, and
> would indicate prior incorrect feature testing.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

