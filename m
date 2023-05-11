Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD996FF615
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 17:35:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px8KA-00035m-VU; Thu, 11 May 2023 11:35:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px8K9-00035V-Br
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:35:21 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px8K7-00008N-Nf
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:35:21 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f4249b7badso50991605e9.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 08:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683819317; x=1686411317;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o8A+BpyiZJJyBpZ32DOiei5RYdX48guYh6MS6RRkmAw=;
 b=oHK+efym8prfBfqPapQbLNv+P1ik1qbLpUO40J6M6qVZLU3NahkCz9i1+VeGBKhnWD
 D8WB7wse4m6Jld9Iw0wozS/FP0ks2kQPR8u1i4RgS+4cQ1zBbW0uIEGCRBCpqf0EUNgM
 GF5e64LW8JCztulmV5jUhnFivp3SKoFBCurS93lmpkFhGfydUJ2/8MpkfuJbWTVZuiqn
 N82e4Tq1cCZHeWxVyMIfW4E6GCeKselStON+f+LC0wE6+jQXeJwFjvXcKATJw5PUlz9k
 9WDh6f4mi6xOEZHxsFnOihMKoR8McqU6oIO1soqqiRANXR1bIB3lm47OPgv4xLMTJtla
 4TPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683819317; x=1686411317;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=o8A+BpyiZJJyBpZ32DOiei5RYdX48guYh6MS6RRkmAw=;
 b=VgqU1vfW/XgZiGfjbYYa7zmNunjpPgWFolLd6C9zhWzDxbVWLVSL2uo49qQJL6jvJz
 ceMZyfRBjTVb+UxUhuRkuNoGce3aiuSgvkh45cPqD4/ySRuoEdrZ/QAq/8bebN4XTy03
 6h6BwVjCNhMrR5h5PYuOmAm4dUgDZy2dvPsLqBUIZmZj3wwzbn/KXPevSfhc0SpGka9h
 0YWFsCRcXJFaj5wAN+dw9W42Apqe8ULDWHqO3nvwThnzc7rOy7LKaJYnhdf1lwKcz9lu
 9S4qph3yVXBpAWAyN29+gAr4gkfjBpMP4t9uCw+UHYFOYynxLOkXYlgaEEI5v4NPZXQP
 g47g==
X-Gm-Message-State: AC+VfDx+Ww44S6WIKM7o/w4NCudgYT2SihwYLLuOpoKi91YhnUiH0GCj
 k+aobj0jcKxtrS7ayo6pLeqYPw==
X-Google-Smtp-Source: ACHHUZ7iS0LUY9XiSi5pFb5IVDUfdnpgNoUaVPz+jRQy+gkODOHzlhKortd4Bv0CDy1EuVt1u3ztqQ==
X-Received: by 2002:a1c:4b08:0:b0:3f4:2452:9667 with SMTP id
 y8-20020a1c4b08000000b003f424529667mr9491006wma.30.1683819317082; 
 Thu, 11 May 2023 08:35:17 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 x14-20020adfec0e000000b002ca864b807csm20972879wrn.0.2023.05.11.08.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 08:35:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 48C5A1FFBB;
 Thu, 11 May 2023 16:35:16 +0100 (BST)
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-8-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, qemu-devel@nongnu.org
Subject: Re: [PATCH 07/84] accel/tcg: Merge gen_mem_wrapped with
 plugin_gen_empty_mem_callback
Date: Thu, 11 May 2023 16:35:11 +0100
In-reply-to: <20230503072331.1747057-8-richard.henderson@linaro.org>
Message-ID: <874joi3mq3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> As gen_mem_wrapped is only used in plugin_gen_empty_mem_callback,
> we can avoid the curiosity of union mem_gen_fn by inlining it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

