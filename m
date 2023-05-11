Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013AC6FF5F9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 17:29:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px8EE-0005Qj-Ia; Thu, 11 May 2023 11:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px8EA-0005PD-Kq
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:29:10 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px8E7-0006vx-JN
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:29:09 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f42769a0c1so46658165e9.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 08:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683818945; x=1686410945;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hx5NSzlGXgL6QvtCvpDgW3h0lqn85tWuTEdXzL8I5eY=;
 b=wilFUOYl9gKSfNf/0rur2ny3zSFyuEdqqGHKJLePgYzrmG1t14brbrhM6S7cw1ZgoN
 zM9yqoALtXkK7cAg9PitdEnPhSz36K+vdLOZTLizCA6c+FqP+bVanf4SnriSPKU1Tb7z
 VSYw1WOeqNsf5be93ZUEHasdhCgCt5XNYHtfUMsJ1u+UIgkyNhUgwAWg9uVYhWlJc6ht
 jAp8mnAJeRFbi/mU3A+6ePTILUcQHWG5ARWYxQvOQg7Z/zTJZs8Mo6OL8NH+X5aDLTbG
 2AhHel6Mvop7SRl5OjVwWCnUYOt6Mb5/GF3RMe0Te3q/rMItArbUyBkSggy3wSbFk4P4
 IHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683818945; x=1686410945;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hx5NSzlGXgL6QvtCvpDgW3h0lqn85tWuTEdXzL8I5eY=;
 b=YldH4S/yeX5YIjDVmEFMfuMUGmVoYctQH4U7Jx5bblG/moAaPUT69ErMOerBR2bumI
 s6c80HIZds+IIyXg7jwKtUbAq/nbsZ+/2WXNk7tqz8tNOFuwJfE/FF9lxy3CCrNyA0If
 l/YNfLzMibalZIOiM3AQFjR8N+/Bn6vpTxXd79SCr2j1ppfNrbgLF9EKAzmE2vhk6Clz
 ZubBQhABcUSFqkv/zcY5UCks06lJpi6BHuS1ELVl+J9ydN7nDPprLwLHfcIUmkqq1J3Z
 2RDTBnwYkcuXvGBFXGfBoPjhpVFEOjrQv/BO1bsV0gHb7/Us52KaYfsJoPOq8/5f5M6N
 +WKQ==
X-Gm-Message-State: AC+VfDw/qPlI/qRWEATtYIF1dOmOnU8nDM0Mhv615kY1k8/n7EWzalNb
 PCnU0sNeY5NMtIdc93GoVxlWZQ==
X-Google-Smtp-Source: ACHHUZ7fMUEprw+le+Ds00XmIYhLLIhQpe3SxCEf9fmuCXRW65CerOUMt3e+F86rf1y7HmxmJ09Byw==
X-Received: by 2002:a1c:f202:0:b0:3f1:75b0:dc47 with SMTP id
 s2-20020a1cf202000000b003f175b0dc47mr15230115wmc.15.1683818945460; 
 Thu, 11 May 2023 08:29:05 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a05600c214d00b003f42461ac75sm13005568wml.12.2023.05.11.08.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 08:29:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8DD111FFBB;
 Thu, 11 May 2023 16:29:04 +0100 (BST)
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-5-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, qemu-devel@nongnu.org
Subject: Re: [PATCH 04/84] tcg: Widen helper_{ld,
 st}_i128 addresses to uint64_t
Date: Thu, 11 May 2023 16:28:58 +0100
In-reply-to: <20230503072331.1747057-5-richard.henderson@linaro.org>
Message-ID: <87h6si3n0f.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

> Always pass the target address as uint64_t.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

