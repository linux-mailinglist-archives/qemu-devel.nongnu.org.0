Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5986F273FC3
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 12:41:01 +0200 (CEST)
Received: from localhost ([::1]:44338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKfjI-0006eY-9j
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 06:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kKfhD-0004xo-2F
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 06:38:54 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:36976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kKfhB-0007Co-AK
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 06:38:50 -0400
Received: by mail-wr1-x441.google.com with SMTP id z4so16488060wrr.4
 for <qemu-devel@nongnu.org>; Tue, 22 Sep 2020 03:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=ceUW7gKhLnnGKYwoTL4a8NRIaTAwn4wnKS/ZDJHYcPM=;
 b=GVV986WfrLTPP12Bh+ewleDsyYzw+GFRy1+bPFTd9UQR1c8RAhFPYpBydu5ZJrKYSN
 kaG99Qgmokrku8TrgY6RtJt+nLK77FvASJb5X3gwkYKwiUYS0BrsVRm175CR5l1BxrpF
 a9m+3+5lOG3FxAqsQWBCRyBFf4ep9ZQs9esEiew1uCdeVtXe0d/u7TjcxBkAW5f5XdJ6
 AzC8T+ljEwtQSVdFEqVMrpmhCrh0GkeLcFclZCzhxWatAXjQwOFLKHNCUdezuIWnNtSd
 rP0bXB1SuRfc63sIyLtpeL0UnYj1NQaFxeoiYlnSEW7fbiETY2fxu/QCfKzpfjxLzSJC
 m6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=ceUW7gKhLnnGKYwoTL4a8NRIaTAwn4wnKS/ZDJHYcPM=;
 b=RijECHljuhYGEfsx9qacEcmpwXwY7eajI/FlCUrTdvULcDch87KRwSK0zOhfH8PU7U
 nUur2KxvEX9zNLK3KSRHMcwh+5ipNDzh1+dgetHjb8Y1OIZcVD5b3zUHfENbeJgkroQ5
 xP+92bPnSyuf4VcS5fGS0L2BOAFdOYlLRl+8gVTiX0sAJqzNV2zED5Rx5mK2BQT/M5mS
 PHrUGS0V1TuKyLHrTJoIfMsodjvBd22kTGnn6PyBbIUvCwPm7gg+Wm3cZl4UH6a6RjwU
 y9kOJdfebPIpqHcPTdvQq58Jj7NvCIbgT5nwlK6Vz99bMPKLlPiw30X3I4JzX7//NCXa
 EiJw==
X-Gm-Message-State: AOAM532lILmD/yEronUKq1MdqfjdzQq5bPqYiJJBmmkjg6CphKu7sP4w
 m9niBQkN+NA53g1JM8dr2UOPnsRm5U+zQw==
X-Google-Smtp-Source: ABdhPJwPt4aIGvsfZty+SNdj/B40AuNaVSergWVEGvLe2LThDZiVNrXMiT7L0hjr36lt4NE4fIF69A==
X-Received: by 2002:adf:e289:: with SMTP id v9mr4646215wri.14.1600771127841;
 Tue, 22 Sep 2020 03:38:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t1sm3765793wmi.16.2020.09.22.03.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 03:38:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2236C1FF7E;
 Tue, 22 Sep 2020 11:38:46 +0100 (BST)
References: <20200921174118.39352-1-richard.henderson@linaro.org>
 <20200921174118.39352-8-richard.henderson@linaro.org>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 07/11] disas: Cleanup plugin_disas
In-reply-to: <20200921174118.39352-8-richard.henderson@linaro.org>
Date: Tue, 22 Sep 2020 11:38:46 +0100
Message-ID: <87y2l2m6yx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

> Do not retain a GString in thread-local storage.  Allocate a
> new one and free it on every invocation.  Do not g_strdup the
> result; return the buffer from the GString.  Do not use
> warn_report.
>
> Using cs_disasm allocated memory via the &insn parameter, but
> that was never freed.  Use cs_disasm_iter so that we use the
> memory that we've already allocated, and so that we only try
> to disassemble one insn, as desired.  Do not allocate 1k to
> hold the bytes for a single instruction.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

