Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 880896FF727
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 18:27:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px965-00036N-Qo; Thu, 11 May 2023 12:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px963-00034d-35
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:24:52 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px961-0003QH-KX
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:24:50 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f415a90215so66477765e9.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 09:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683822288; x=1686414288;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h0tuP+M0Yu0iHWme8q76lcsBfVpPWRMzW6H9DwpT9IM=;
 b=CVSzPljW1HsGm5AZcHPXugq3aLpnMaihI4ERU3YPfC1wwSmfd4S96DZmpFf/JqfAfS
 OpMUaHDsc5NSecBLO1ZOAZqHNP2Zecxkk/qs0HAuH4bxc2lEUn70r28XgptYQbzDkI+Z
 TwTtuTepzrSKZzwqpCUiH8FfkuXR9X+wWs3aDeSMSt23oc+59ZjhUDMtSsm1QGFg4l/n
 02vprZFRkio32dHjwguhamlcwy11YzuqY0Ftzl8eQd2YXnKTUl9QlZ71iSKA8aJX7nSV
 1pr95AwPrw8OGlKQXj76OLKUshL798LPD948Nb8i8SZDekc8hifyoCUhVDAH7Yz32yYF
 j0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683822288; x=1686414288;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=h0tuP+M0Yu0iHWme8q76lcsBfVpPWRMzW6H9DwpT9IM=;
 b=UJad5C6ZzAYh4R2Me0VLO6y1cfbuungRJVNBUHzP+Kzgr2Sr8DEG7uCrsP+7QQliHn
 7r8fs0ZMcZ2YHuroiRZjGEY/s+3M0SK7djjLJ0Csbn++wtfWvwQgRNQT2MGmUb7/znY3
 fGLQKJmPYqaMU58qryxuDlzjgUJZLE8fyyiw+okFoya25S5Pq2++Wy96SdftSjKC/25r
 Jhz0uWEu31EwRYR8uzAUzs0zyp5glHn6U4ikvSEKa5moCFX878Up+DAfjEBmfTzOExgr
 vseLYQYTB1927377c/UOnoKV/XPNl3yT01rlzK5HRn67XPlnCaVy+YOMlOLYNEyk2oVV
 5rvg==
X-Gm-Message-State: AC+VfDwgJNw6ucoC6EB5sU6FWyi3jqmZ27HFGteYKXDlmJ34oh+9VFWN
 6g4WCYrEllq0ij6ZLVgMbRv38w==
X-Google-Smtp-Source: ACHHUZ40ZG4vP2mOO7AX2hnPBUsf4sVu5IDDkXhyDrS2mUCXB5gzjearDLiX0wf9Ah5EPBY49WBHeg==
X-Received: by 2002:a05:600c:22ca:b0:3f4:2158:2895 with SMTP id
 10-20020a05600c22ca00b003f421582895mr10856888wmg.3.1683822287800; 
 Thu, 11 May 2023 09:24:47 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003f42bb3a5adsm8325748wmc.4.2023.05.11.09.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 09:24:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1B7ED1FFBB;
 Thu, 11 May 2023 17:24:47 +0100 (BST)
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-15-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, qemu-devel@nongnu.org
Subject: Re: [PATCH 14/84] tcg: Split INDEX_op_qemu_{ld, st}* for guest
 address size
Date: Thu, 11 May 2023 17:24:42 +0100
In-reply-to: <20230503072331.1747057-15-richard.henderson@linaro.org>
Message-ID: <87a5ya25v4.fsf@linaro.org>
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

> For 32-bit hosts, we cannot simply rely on TCGContext.addr_bits,
> as we need one or two host registers to represent the guest address.
>
> Create the new opcodes and update all users.  Since we have not
> yet eliminated TARGET_LONG_BITS, only one of the two opcodes will
> ever be used, so we can get away with treating them the same in
> the backends.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

