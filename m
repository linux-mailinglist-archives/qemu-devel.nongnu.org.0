Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AABF666E611
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 19:33:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHqlq-0002Bz-Og; Tue, 17 Jan 2023 13:33:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqln-00023w-65
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:33:16 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqll-0007bD-Mg
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:33:14 -0500
Received: by mail-wr1-x42e.google.com with SMTP id r30so7131564wrr.10
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 10:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7QBm1v9hxSrl/d32860bpCXsXOQ048x+gyZ+W38wko8=;
 b=w7kMnZk2FJpr6OQ01mXSMCE9mQ+qf3XLxPnxh6dXXoHRBpwyRQOam9sYhbtdBM4ksH
 gsESynT1f9QgEESFRb9DgXCCSLImyR4K84lZgofyXBHHT4C9QjdyhZIGkheN8ypalAZV
 jS6rGfgwfjlloj/Y3G8aGF3MrCXyl7mFw7zd+aY93t6eYwLbYr2SiaxGh3X7ZT5yZy1L
 FLQq5nrrx/HlsSmxPd3wqdSmDoC7s1m7KJi+InKleTjSEtY+eij9hHM1yY5CLcwvmYl4
 ESURT8g8gOJ6ZNqG8wcSP596XvhEY4xRsfZYioXypatYWtiAlmYzMmEPNI/lLZZ5WZoK
 K5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7QBm1v9hxSrl/d32860bpCXsXOQ048x+gyZ+W38wko8=;
 b=CK4amuxKev4hXzuX7GrBhhBa0vyMd6hcV82FiKRIJZc2QDvEnxpiKJEvgYTCiJBOo9
 5h35zCDhdoTImfBH+nfJkBbejMNzTUCTBkafib82EDmvCthDTKXb8rivImZs+fj0KBkl
 W+xXBCc3etQNmpRpQSM6pyUMcbmPXM1JOxUSQIV4DvAHtBz7mlrywkRTM0MHSgmXQusy
 B0JZi6ruLGTScCVRTGMoiqSLQqswoU/6uJQ1OKhSQjNQtQ+w4G5wCTpd4x5SAm3Lkj34
 n/XYpAf+L7yqEiJyuKnFHC+N1ifwYJiZVXEVC7xwilsjj87OY7HwFmY45HtMMLG2ZWBh
 ByLg==
X-Gm-Message-State: AFqh2kr9wH8woplS5naFXtqV9GP4jPiXEugIx1hxTbH9YKzh3rcpA6+H
 T73zk2BQKhDUoODkAQbm09IdP+72xecpYlZJ
X-Google-Smtp-Source: AMrXdXsP0mCwQK2NOpRBg+37+s3I6VL3HmQgYeF4YdkRx5xV3sM3kBYKK0JQLp3/+sdkbOE2HlckFw==
X-Received: by 2002:adf:f68e:0:b0:2bd:d966:8002 with SMTP id
 v14-20020adff68e000000b002bdd9668002mr3598721wrp.8.1673980392187; 
 Tue, 17 Jan 2023 10:33:12 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e20-20020a5d5954000000b002be099f78c0sm5124681wri.69.2023.01.17.10.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 10:33:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6494C1FFB7;
 Tue, 17 Jan 2023 18:33:11 +0000 (GMT)
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
 <20230109014248.2894281-20-richard.henderson@linaro.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 19/22] tcg/sparc64: Reorg goto_tb implementation
Date: Tue, 17 Jan 2023 18:33:03 +0000
In-reply-to: <20230109014248.2894281-20-richard.henderson@linaro.org>
Message-ID: <87h6wp1060.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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

> The old sparc64 implementation may replace two insns, which leaves
> a race condition in which a thread could be stopped at a PC in the
> middle of the sequence, and when restarted does not see the complete
> address computation and branches to nowhere.
>
> The new implemetation replaces only one insn, swapping between a
> direct branch and a direct call.  The TCG_REG_TB register is loaded
> from tb->jmp_target_addr[] in the delay slot.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

