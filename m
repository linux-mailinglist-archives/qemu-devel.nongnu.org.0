Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5096A0EDB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 18:43:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVFcV-0004gF-Fv; Thu, 23 Feb 2023 12:43:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVFcU-0004fr-1d
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 12:43:02 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVFcS-0005Hp-Lv
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 12:43:01 -0500
Received: by mail-pf1-x42e.google.com with SMTP id fd25so5495275pfb.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 09:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OM0y7fVjL4hP3O9C6+F7sbuLZW9L6r5Uh6FcAYT40I0=;
 b=IOJXMyKZsMoB1qnYZHAzhzmUCh7XgY+0ZRq3ftjxMh9rxprLUv8gdyJxvXtq4fpiKb
 2D/4gfSMZLWoUezqJ47Wi03PGMI+IhER8c8a/X0sfYnClAlPC/bpn2Su8+nuN8n0bxuY
 JO7fW9iP+Edh2pVw//yWTnRh/HguLhOSDAp0+4eeFPuP0vNbkCbcWTWww8kGIS6I3VZt
 vX8paWbig3ed9Hdb41q+KfLzRiVWgQN/kqx6q/0Q1TvZxnQbpHDLBY4KiMzTxZRxQWEo
 9HpbQRbMPBonKcDmWXJiICtaVsIjy6sn8dwYViUwgXwTHwZlxUu8x756lr/nvh+sUml/
 Y6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OM0y7fVjL4hP3O9C6+F7sbuLZW9L6r5Uh6FcAYT40I0=;
 b=pCLN7QZi4A/ZCD7aAVW618s2Tpz7n+RmsHWEEc1N70c+lV3UnRw4QFpD4ynbP4dLVw
 sGMpdnO4OwfnRAjYxBAy7Uu6BzKG7cnQUNy317FMFTQTRYz3bpEGVesVO8yGpS+uyVNt
 0iGZKgS7APZW8aJvyqL7/0J1q40WKN7hf/NAtmVlBK81rQL9zWQE+jlTFS5AXOcIjl9d
 FuXkWVjDq3CxVQV7wqwmdcpd1W9ZH1M0HED447NWvF0ovV489l9fJPZ0+hTO5/BA3Egp
 f9PPWl5p9Szs4TomT+oeYo11eqjjq5D2GEHXw8dCTXdGyqElg1CmClop6PBzn8sFTXHz
 J/9A==
X-Gm-Message-State: AO0yUKXhrawmWcI6MT8rWqwqyWRqZpjtz7YFtNO2IzvV89en5TsiOHmT
 hWFvze4/zvYFUovo5lePKESH7NRt2YpJVQBqLjyFcok4A3ug3Q==
X-Google-Smtp-Source: AK7set9JJOOyMO+qF3lTkZXZ3vnqhx+AAdR/fXc6hsrrp7oIaZuz1ZFL8hg+0DazlrtkMEqcA5PdnP3XmJxgxfVsbZ4=
X-Received: by 2002:a62:1b56:0:b0:5a8:c2e8:e08e with SMTP id
 b83-20020a621b56000000b005a8c2e8e08emr1875154pfb.5.1677174179174; Thu, 23 Feb
 2023 09:42:59 -0800 (PST)
MIME-Version: 1.0
References: <20230222232715.15034-1-richard.henderson@linaro.org>
 <20230222232715.15034-29-richard.henderson@linaro.org>
In-Reply-To: <20230222232715.15034-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 17:42:48 +0000
Message-ID: <CAFEAcA_Q-eFujdR0Hs+13XGTZto5MqwiCrQfhRn88ETh2CDriQ@mail.gmail.com>
Subject: Re: [PATCH v2 28/28] tcg: Use noinline for major
 tcg_gen_code_subroutines
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 22 Feb 2023 at 23:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This makes it easier to assign blame with perf.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

