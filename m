Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 400FF50149E
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 17:32:38 +0200 (CEST)
Received: from localhost ([::1]:39966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf1SX-00081C-5P
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 11:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf1NB-00020w-Ew
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:27:06 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:44866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf1N8-0004Yp-Rg
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:27:05 -0400
Received: by mail-ed1-x529.google.com with SMTP id c64so6795288edf.11
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 08:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=VQas/t2u7rZhHo/u/0Q6+85b6C5G2dTCDoHtfvGcgxI=;
 b=pChUVXgg+KT5kPPVmP14aDbDls3QXCuAltvNlmLS5fc1QWchr4nTKohFQjNA4JDpcV
 EpODPCsy1T2kc0GAvRmzXaHozJHXYGgOY5WV6FdeXnBZAXfEn0I9KY333heLTuKRVLoM
 ygkIkdIcIR/ulXZYDlKiZOgfT4e1yVNpy5YwOo4icZS0kA+hPyoAbW6Tb/H3prMY6YJO
 XH9UvsKyIvzgaj+zwUZtBSxDR9TF/0s64kQcwslXK3CiaRRCpNVfOzaPpouJ5R9Qgzpv
 +5C17RjtX0MsgUWdVP8x4/kEJHl1NJaukEprTcf+dkU7NXY0R3nrppSvP/MjyDY3CUZu
 N+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=VQas/t2u7rZhHo/u/0Q6+85b6C5G2dTCDoHtfvGcgxI=;
 b=CyDZ3iE4USBbQa5XOA0xiKS/O/BxHQ9/yFPdNmplEjWX4D8CNlMLJ4PSWhgqznbp4m
 efVjzzXi9/EMyk3EJ1VWbav5O8r/VvjEQbrtGwxelfoHRxmrpC4jxHOsXQp+B2bqfF4V
 uOLQA0zjpGPsI5u7Dob6ULgFx9y2+0FeB3qujalSQ7cFuRgKyeATFPqo5HTcvwP3GGDK
 qbTQAPXm2pcV/YhZ9oqL4ihdZgMnlgmiAF+0FwZWPpSd2P8v/zlwKNTdgz+Aie84mdKz
 Qf5o++J+N3N+z3Un7CIEeOjMk0B3I14Lr6c++Zf1WggYK0sCmCqNm2ysqZhCdmuH1jl2
 wFPg==
X-Gm-Message-State: AOAM531DKT8B9P4FLWTVgRG+AS4VkrQyTwNtCruLJLLaOLErTSodPznK
 C63oeTRea6l4jfXb8m5/utkQsA==
X-Google-Smtp-Source: ABdhPJwGE4AZ8LGZdDH0P55PR4z14jRkjOVlp2L1DoMc8bbbhtmR4+un8MNm6mGk5lAk6RXktmmYzg==
X-Received: by 2002:aa7:dbd0:0:b0:416:633c:a0cc with SMTP id
 v16-20020aa7dbd0000000b00416633ca0ccmr3533172edt.349.1649950021395; 
 Thu, 14 Apr 2022 08:27:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a1709060f4700b006e8d0746969sm705804ejj.222.2022.04.14.08.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 08:27:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0669E1FFB7;
 Thu, 14 Apr 2022 16:27:00 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-45-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 36/39] util/log: Combine two logfile closes
Date: Thu, 14 Apr 2022 16:26:55 +0100
In-reply-to: <20220326132534.543738-45-richard.henderson@linaro.org>
Message-ID: <87bkx3u1mj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Merge the close from the changed_name block with the close
> from the !need_to_open_file block.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

