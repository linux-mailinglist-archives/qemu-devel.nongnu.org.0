Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C957263F2C1
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 15:25:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0kTV-0002sl-Oy; Thu, 01 Dec 2022 09:23:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0kTU-0002sb-HR
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 09:23:40 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0kTS-0005jk-T1
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 09:23:40 -0500
Received: by mail-wr1-x432.google.com with SMTP id u12so1981977wrr.11
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 06:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=au/BF2GPnbOYeLAeYUPDwmmbwAm1qlDdKCnJYpN9vi4=;
 b=Thk4kPbfjNZmwjMV8E2iF/zWQlHDXZ3Jq0tyq/ZClfZCf23Q3qA0dN3Z2D6X6PkVAv
 jnFoYUhzkka+tLJvJNonXQSiWWQdBYKwqMIcOd/hT17pKooEPm77T9zAISP7cFCrWF0W
 WCmzS4cguYeAR/MBhoMS3/8ivEqTlWNOEraPV0iX8ICMM6I9pWm+x+QmQrF+/MCe+5I7
 z2NQ4d1Ny57T7z88aZtOYK2IQojck+Fcud5XVadThnce6cWDrBCJWHvRjOiMGI0IE5WR
 0+F0PiWrn8mI71aaxW3WvkD+MRXqzMoWsa24nAt3ZgV9RCRSjkSpm88dhDaOFQf/wzYf
 xbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=au/BF2GPnbOYeLAeYUPDwmmbwAm1qlDdKCnJYpN9vi4=;
 b=KXqKPiKx+qHXNthc0c77wy5AoYS1ymuwjel/eABeZ/NRHQumfYmxwXhMk+cyOZlgSv
 /4YqQ8qWSS8bVRLWkIZYbmkPXRiJt9Rx1tPVht2dIZNXIwz5a6CUWorJvA33FuSqNWIq
 NxOEobMpN3AtNxgmofUonNll3WVv/0v/IPRbg5g3HPRlSj+KQbJF+e4s6rTpQNc2GeNI
 wRaGlFnqX9F7rb4rKICg41+jgct052lxtZFO25X+LTpBoULoFsLiCikeveH4Aq/7aooL
 zCEWdGWRy8vTfvHg8hB7WiABm+Aj3Xb4JhiObdqfjfMYL2jlldzfKTWh6DomIGLfrSwU
 WToA==
X-Gm-Message-State: ANoB5plZ5/fde6CaNnCuuqYvRWHW8eUUwei/nODLERndg7tTiJCTl/1A
 HAHTYTxFRsySCoxBM1TFCSJ6OA==
X-Google-Smtp-Source: AA0mqf6Bkx7SeUeOm051Jg6a2FfEm0rxVw4479xa21WNsTiacxyUQ2Hmcw6eW+4NvTfT8xgv6zweTw==
X-Received: by 2002:adf:ebc6:0:b0:241:c6d8:be83 with SMTP id
 v6-20020adfebc6000000b00241c6d8be83mr33598158wrn.454.1669904617240; 
 Thu, 01 Dec 2022 06:23:37 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v7-20020adfe287000000b00241fea203b6sm4605806wri.87.2022.12.01.06.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 06:23:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1203E1FFB7;
 Thu,  1 Dec 2022 14:23:36 +0000 (GMT)
References: <20221027111258.348196-1-richard.henderson@linaro.org>
 <20221027111258.348196-8-richard.henderson@linaro.org>
User-agent: mu4e 1.9.3; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Subject: Re: [PATCH v2 7/7] accel/tcg: Move remainder of page locking to
 tb-maint.c
Date: Thu, 01 Dec 2022 14:22:56 +0000
In-reply-to: <20221027111258.348196-8-richard.henderson@linaro.org>
Message-ID: <87zgc7b3tk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> The only thing that still touches PageDesc in translate-all.c
> are some locking routines related to tb-maint.c which have not
> yet been moved.  Do so now.
>
> Move some code up in tb-maint.c as well, to untangle the maze
> of ifdefs, and allow a sensible final ordering.
>
> Move some declarations from exec/translate-all.h to internal.h,
> as they are only used within accel/tcg/.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
<snip>
>  #ifdef CONFIG_USER_ONLY
> +
> +/*
> + * In user-mode page locks aren't used; mmap_lock is enough.
> + */
> +#define assert_page_locked(pd) tcg_debug_assert(have_mmap_lock())
> +
> +static inline void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys=
1,
> +                                  PageDesc **ret_p2, tb_page_addr_t phys=
2,
> +                                  bool alloc)
> +{
> +    *ret_p1 =3D NULL;
> +    *ret_p2 =3D NULL;
> +}
> +
> +static inline void page_lock(PageDesc *pd) { }
> +static inline void page_unlock(PageDesc *pd) { }
> +static inline void page_lock_tb(const TranslationBlock *tb) { }
> +static inline void page_unlock_tb(const TranslationBlock *tb) { }
> +
<snip>

clang picks up that page_lock is unused in this branch of the code.

--=20
Alex Benn=C3=A9e

