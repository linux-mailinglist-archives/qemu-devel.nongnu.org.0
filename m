Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A276FF814
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 19:07:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px9kC-0005Yk-CN; Thu, 11 May 2023 13:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px9kA-0005YT-HG
 for qemu-devel@nongnu.org; Thu, 11 May 2023 13:06:18 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px9k8-0003l6-U0
 for qemu-devel@nongnu.org; Thu, 11 May 2023 13:06:18 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-30771c68a9eso8143566f8f.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 10:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683824775; x=1686416775;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=20mL6ahqZNIiZWHzDkwRRqSTrSHs5qvtBtXea5jtm1c=;
 b=vdYXYg/2+4YzLjpKiU1SckXnNIIhJLemPbbBlaqrpDe8b0kvnwaTS4Mbmk5Bc9D7LR
 5/jO11TeT7PyGMDl9RXDVIZg+mGk4YJS4zmXVfyidHbKMY0W0Aa2rgj/QjnfdHfYATBz
 CYtj3lGmXr1fBr4PH8+rl4Ehrz3GwRUYcHu61ClwtYUKuS8jedl3z7Zuu0FJ6Vm+fNNs
 g8m3JISpHiT+2qYXdVHraC/krrPC8DpvC0K1zKg7tYxt8O73nhn/V33sNMHdRp68PAaW
 Avr6RYscDy/OJxZLHVZuLtgX7RmtvzOSzekC6+r9zrHlHAY6crlmSpL3B0JV7t+ZaEpO
 II0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683824775; x=1686416775;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=20mL6ahqZNIiZWHzDkwRRqSTrSHs5qvtBtXea5jtm1c=;
 b=XerDnhB1uHihUtISQS4cP68lLERMIJhjX5rW6ZAZNthNBmnKOCfSQpub23qFxgQ8wZ
 vz7VtGDqpQd5t+mkHONRRNIye4craocLXZJl7D7DYqPvGsQdZAj2wova9w5+Sxydxa5z
 GQc6rMk1gaew0KnhIzbeSZRnKWoTgytZogyC2G/o0cI98suCymMdX6YbPX8VIOm1C8qo
 08eE/KYxlgLD2IWglS0OKqMBba3FYIfwi9dRdcBZ5EdaNRo8aYhxafzUsBgJeTzsHp5J
 Z5mCMvQ3yN0D9+QJMwpE4bCG42oTq2+kla/8/fLFaoNpVRHQ5tNqLtAq66tceuxId24i
 n5Sw==
X-Gm-Message-State: AC+VfDzy9ieibSeUTGl4tIvzKb23Pp3NiKfo3LNozXEzRNWaByhVyXdF
 Ho0B6MMk/4rwEI0Xx721uyAzDQ==
X-Google-Smtp-Source: ACHHUZ6+OXZ5NojlaaUSwu9JBbhYy/+1SFS3sC/hcuEufj5laSe3llA74D899gF1s1iqe7B1lxfcAg==
X-Received: by 2002:adf:e6c8:0:b0:306:27db:16c3 with SMTP id
 y8-20020adfe6c8000000b0030627db16c3mr16593818wrm.50.1683824774890; 
 Thu, 11 May 2023 10:06:14 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j10-20020adff54a000000b00304b5b2f5ffsm20976781wrp.53.2023.05.11.10.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 10:06:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0A0831FFBB;
 Thu, 11 May 2023 18:06:14 +0100 (BST)
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-25-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, qemu-devel@nongnu.org
Subject: Re: [PATCH 24/84] tcg/mips: Remove TARGET_LONG_BITS, TCG_TYPE_TL
Date: Thu, 11 May 2023 18:06:09 +0100
In-reply-to: <20230503072331.1747057-25-richard.henderson@linaro.org>
Message-ID: <87y1luyf0a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

> All uses replaced with TCGContext.addr_type.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

