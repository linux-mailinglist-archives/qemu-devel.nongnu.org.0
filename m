Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 981E755B8EC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 11:18:01 +0200 (CEST)
Received: from localhost ([::1]:53820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5ksa-0004OJ-Ne
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 05:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o5klF-0007hL-20
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 05:10:26 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:46664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o5klD-0000Mn-EQ
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 05:10:24 -0400
Received: by mail-ej1-x631.google.com with SMTP id q6so17653332eji.13
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 02:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=yiVl4wAnbITmFOHa1rcMqmBdJkzfdnN50+m9IfWI5hQ=;
 b=vmIqEDMGas71KMv6jQG2iAJg6u49WmOtBi46EPj48gbvMB1m5bZ0seck4ERgq16uCI
 AC/0NpkHAuAbW5dDWAX4A0i5qNsK46qsZo6Z0P6sXjCjm8wV61tJQ1jgy1lOVdK5ZXIp
 GwPIALw9ZaCtPJ/NwJWkE0uJzCeoKO10AmUhSOcU9H7uqT5+lh8k9XQ7czSATt7nZkBb
 uzA5N0OyRBSXOyyVFVi29gYaHPo9yvV1MbVijlFyWL8m41D1r7UXiAnIPzpLTabK5aAB
 9Crh+eUYPmj5VUopeypoTm3WGorLYOTptkOoq5sCCp1XvHMbzbN5ZcnhsTKxbYLQ1zQ+
 3LAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=yiVl4wAnbITmFOHa1rcMqmBdJkzfdnN50+m9IfWI5hQ=;
 b=ea5SRqFwaXyO+V8wN1E5hjKT6oxknHOU0qJ/lxaLAjou5ebw0LGJa5Fv5zOrUj/iBp
 BfPZk3jBVF5oMQmRApsNas/PldTio4UdrityGRmkIKmT0H2tB0MUduUnlsKt8LyJkHIs
 ZFLti+thwBmxqaKvSDJGQ51XmVf4XngCvt3sowaIm56A8UX05yStC1BkXsJQEV0WBepu
 jRnDWmQt+ANTdsBY0tDB0VMuxyT113Zy2KCuMMM4l1KR22E8QQ5GTnWSJzvCbA6CnwLr
 lLwm9doCdywf/clqXuiAeM5sEGXwt0OKKewUt5dr0jms50fuKxN2/FQaa7gSHWyO2MwL
 Sj9w==
X-Gm-Message-State: AJIora9OYNsJ967r2BR5GwYOnTw/lOvvQGUSAJdd/+d+kvX9ZGXhJNzZ
 pqxc4QpQ0Ya21BgRQnJ8WUaPuA==
X-Google-Smtp-Source: AGRyM1vEOSE4EzCNV/pxRz+suxATXcOMo03u9k/Q94WWgi6bpWYMYaYkrhyMmRZlM7GQjrwG/b4A9Q==
X-Received: by 2002:a17:906:147:b0:711:fd7e:7d6 with SMTP id
 7-20020a170906014700b00711fd7e07d6mr11766873ejh.389.1656321021389; 
 Mon, 27 Jun 2022 02:10:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 i24-20020a170906251800b007262a1c8d20sm4795587ejb.19.2022.06.27.02.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 02:10:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B2EC61FFB7;
 Mon, 27 Jun 2022 10:10:19 +0100 (BST)
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-53-richard.henderson@linaro.org>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 52/53] semihosting: Remove qemu_semihosting_console_outs
Date: Mon, 27 Jun 2022 10:10:14 +0100
In-reply-to: <20220607204557.658541-53-richard.henderson@linaro.org>
Message-ID: <877d52lbes.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> This function has been replaced by *_write.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

