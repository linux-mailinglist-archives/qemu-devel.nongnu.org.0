Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 248B46FF781
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 18:36:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px9HL-0007ap-HR; Thu, 11 May 2023 12:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px9HJ-0007YQ-7J
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:36:29 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px9HH-0006c6-Nf
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:36:28 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f417ea5252so44710415e9.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 09:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683822986; x=1686414986;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rJWdaFdRV43AuMoSQmCPDkSZYefg11c8F7k4gLWR+Cc=;
 b=zvsmLMkKj97h7gVcU94b/yiZhTio3qtploW7KfQAhb5rAAE7yGCSaSDoF3JItyHshX
 yQEoW3IIqEZLVi4i9gFc2gsLpxyQkdeQJZjLwR0SR+ajls6cWUbTsQ8cfECAbZcLkX+4
 D9t48csE35EZWDvXGs6/dZqnnLxGZlLOMG5WJW3GGlgSv7kPXj0TTF+slO0/r9EMIomR
 JfkK0qmPky2MWh9yZCFqn5fu4CzxErlDbugufdcdXtXJ8KDlHLgo3dj6VYLjkabu6tbw
 9uQcrAFozVuor4pWEwjszKb+kZtAa082m5nF6N94Z+/iEbIvGgxU++ECE8Kp2qnD3p3+
 xjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683822986; x=1686414986;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rJWdaFdRV43AuMoSQmCPDkSZYefg11c8F7k4gLWR+Cc=;
 b=XoM2rZJsn1mpr1m3N5256odJIcrAC7tJBbR8e7m8C98df73QK5DKFM07E3sIVgAPPs
 3zFw2ZQquYo97kBdoVfzlDBaf7gSKSPKQIYAw3AyO2x/s8OPoejJaMjI3zE0BPGxJR0L
 55+6hzBBEBUGpkv0kdxWCLFzJskZUA8Mo2OsjGsNUf1NK4/O8lWx2+VP+ejfYqKBVqjQ
 cbC8UN+NPMJpwgeajiPsRY93l2+VZ4Z1wxK7Nligdf9/BYjQKs6U5OEg/e08PeITzJEn
 q1PBg214T0WnywfxX6XoN4ToreSlFnV3L9TTi3E9CMLM70iRTTv/x2DLN/dWBZCehq6m
 XN5g==
X-Gm-Message-State: AC+VfDzKvU16ri1iC09RBuYzXepGG4rhJv+a1BqvbcEoisSNKe+/GOaS
 8xyP7aW+ZbPSnwkA6uRZ/cg3cg==
X-Google-Smtp-Source: ACHHUZ4nlEFdjEQhp8XBveAitJwqxJqKVSBmD2rf8M3OoF0Hv1K3AFPwr/uxK/8Tul23yu1rBivbaQ==
X-Received: by 2002:a7b:c7d7:0:b0:3f4:286f:1d99 with SMTP id
 z23-20020a7bc7d7000000b003f4286f1d99mr8245993wmk.32.1683822986203; 
 Thu, 11 May 2023 09:36:26 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a05600c205a00b003f4f1b884b3sm578443wmg.20.2023.05.11.09.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 09:36:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9EF7D1FFBB;
 Thu, 11 May 2023 17:36:25 +0100 (BST)
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-18-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, qemu-devel@nongnu.org
Subject: Re: [PATCH 17/84] tcg/i386: Conditionalize tcg_out_extu_i32_i64
Date: Thu, 11 May 2023 17:36:08 +0100
In-reply-to: <20230503072331.1747057-18-richard.henderson@linaro.org>
Message-ID: <87wn1ezuye.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

> Since TCG_TYPE_I32 values are kept zero-extended in registers, via
> omission of the REXW bit, we need not extend if the register matches.
> This is already relied upon by qemu_{ld,st}.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

