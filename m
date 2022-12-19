Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B3D65112B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 18:21:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Jny-0000tw-Ko; Mon, 19 Dec 2022 12:19:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7Jnw-0000tQ-He
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:19:56 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7Jnu-0002VF-OS
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:19:56 -0500
Received: by mail-wm1-x331.google.com with SMTP id bg10so6951831wmb.1
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 09:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rdjPnb42sZHgjusx6tljdA/j+KJS1kS8mUHND5On3xc=;
 b=IU8+OBJyNOppJDnJA1nQACcilw+cJVuT4eCxAwpulKnZttkPRyGp0KNlHeqRxiLBic
 r8RbGGhZcWBuTW/UR/2RaJflMg7a27XSDOjMHbYSYmtfdy0VD7z4q72oNFlZ1ZuSyzkv
 65kZx15EextsX/4ptWcWrwTAiB/eOiG0lr5uz0pt30l6K+vn31UbX8VMgUUqAFKQkCZw
 v3GbtqHDjODIVjI0rmy3KvlKieUx2L/Cr90csQ5/omfVKMLdZWI04BoUWqAmVg9OHM2e
 u6sVtIySt+4q/CEh0tSV6cziCIeUNNJzOYrXXL/fVB+/Nvx5nh+slZsIn0YoQ6HkO+nd
 J0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rdjPnb42sZHgjusx6tljdA/j+KJS1kS8mUHND5On3xc=;
 b=j6K3l12RSuXWOj8bkRY8iYShFjso1Jp5Go8JVv021Hy5HSsapfSEArxobxJmsJ3J9m
 KZ46UapVMnaz7Mi1HEkkDpp/9Ckft+7opNukoi3kIHhzJdULPjvtZm3TC/XTATkFfhjY
 nXB4vMWSUQJu5R4RFpAMImHHlnf0xK+rYX01AaILMN9Om73+T7jl9KpMyC/ao8MCMmd9
 8lCpDjCZXbd6vmiEST5Enz30MwAC1Yp6Xu4TRVD7NYHLwKr+0K/iJFtvmOnHCKxBgLL6
 /qOLf/uIPupStIjJUude4iKi+zl2yC7Pp1wqExmKXX6A4sK06crKs/Dvl5jEg3AncUIY
 D36g==
X-Gm-Message-State: ANoB5pkeAe11/tirrkUuKUplaHv+l5kfpWGbclUwahTrIY7Qi4oCAmKk
 FDmF4I/INDYbs6TohA7AwDS++g==
X-Google-Smtp-Source: AA0mqf7logIahgQStEIUHVPvuUAvxgqQ3FEfIHW+F88ds6uYaCC6JhVmtJrHcZZkeseQoqdzA6fxTw==
X-Received: by 2002:a05:600c:1c90:b0:3d2:274d:be7c with SMTP id
 k16-20020a05600c1c9000b003d2274dbe7cmr22437651wms.19.1671470393145; 
 Mon, 19 Dec 2022 09:19:53 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c1d1300b003cf75213bb9sm22925843wms.8.2022.12.19.09.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 09:19:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5E8B31FFB7;
 Mon, 19 Dec 2022 17:19:52 +0000 (GMT)
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
 <20221213212541.1820840-6-richard.henderson@linaro.org>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 05/27] accel/tcg: Set cflags_next_tb in
 cpu_common_initfn
Date: Mon, 19 Dec 2022 17:19:47 +0000
In-reply-to: <20221213212541.1820840-6-richard.henderson@linaro.org>
Message-ID: <87len3jop3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

> While we initialize this value in cpu_common_reset, that
> isn't called during startup, so set it as well in init.
> This fixes -singlestep versus the very first TB.
>
> Fixes: 04f5b647ed07 ("accel/tcg: Handle -singlestep in curr_cflags")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

