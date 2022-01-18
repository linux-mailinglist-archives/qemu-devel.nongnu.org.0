Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 851F0492CD3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 18:56:24 +0100 (CET)
Received: from localhost ([::1]:48506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9siV-0005hb-Kg
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 12:56:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n9sQ8-0003Gt-6l
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 12:37:24 -0500
Received: from [2a00:1450:4864:20::534] (port=41940
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n9sQ6-0007nq-Mz
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 12:37:23 -0500
Received: by mail-ed1-x534.google.com with SMTP id j2so1278442edj.8
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 09:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=nHfFeCXl2gRlXVIw4hykWmu2DNxPRlMDaYaNvKyi9n4=;
 b=tVidj/NKPxr9eKdlcP1nqF5i+4booOwuFiNKxaJg3lcSB0L7Sv4Nm6BjJtClVXi+m5
 NVG2w5YloDxONE4qe9VgYDGDDJ+pSvT9OzdunFIQaPiK/0wMCiYF+LzRXAOyd5RGwqrl
 cbjuMZ2QLt95o27k27ik0BoF35RPA7v6LEnQek0rWb32ls5cgEll98ILx66aGgJkxfk0
 N5Namt7qgF7UiTE8ZM5kD9S5kOFrC7RDm2dp6JB+QDUhwqW/PSSvMRqmByUDcc/9tqGf
 W76PBz7Nkq+TSMPtj4tyvceKlUoOy/pTMji+0d9J5sWP9ZQpXfKKS4vRLqPAJjroEUSD
 V6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=nHfFeCXl2gRlXVIw4hykWmu2DNxPRlMDaYaNvKyi9n4=;
 b=jVu4YzBLD4EeDQ57zRiMSMuJULbnc5XZ1JZ5jR9zLnkgytyuy+My7b4qQupSxbu1Vo
 4Q6tPseYPU4KcLSiCLsHd+txFjcaXERpUU5WQaqS/+02w13uMwoL7ItRUesji5vvgovb
 zr15NqQoEoy8QQu1P19jc7upKGHleueX7374rIRL1AYnrDy4rQn0+LwrSeakbaenfN3C
 kxns6hvuzbPZ8N995vk2uJXlnGcTzGBkZILe+3NpTRpy2aXOpxr0+ynTNcgiQddGmtrT
 +pAxgg4EN+VM2LpqMixjzXF51E93bG3y0kMKpzYUc4+sV7Th7OuULY0Nc7ok5fEiGKug
 GDtA==
X-Gm-Message-State: AOAM533Ab9jn+UvFFv9S5R4t/fFYLUKfhYWtXamN2fEdGDr5/YBSB0yY
 95Ynei4Li3HsZ4sIjFyK7+7YOw==
X-Google-Smtp-Source: ABdhPJykOp4gcGyvD+GaCa0ji7DIkxHvco8CUpqIp2ZhK17lRMufjnEeqe9a3hiYdFiFR/rJnspQdQ==
X-Received: by 2002:a17:907:728e:: with SMTP id
 dt14mr16426923ejc.723.1642527440685; 
 Tue, 18 Jan 2022 09:37:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d1sm5641303ejo.176.2022.01.18.09.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 09:37:19 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 161F51FFB7;
 Tue, 18 Jan 2022 17:37:19 +0000 (GMT)
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
 <20220111171048.3545974-14-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 13/13] hw/intc/arm_gicv3_its: Range-check ICID before
 indexing into collection table
Date: Tue, 18 Jan 2022 17:37:13 +0000
In-reply-to: <20220111171048.3545974-14-peter.maydell@linaro.org>
Message-ID: <87tue17xo0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> In process_its_cmd(), we read an ICID out of the interrupt table
> entry, and then use it as an index into the collection table.  Add a
> check that it is within range for the collection table first.
>
> This check is not strictly necessary, because:
>  * we range check the ICID from the guest before writing it into
>    the interrupt table entry, so the the only way to get an
>    out of range ICID in process_its_cmd() is if a badly-behaved
>    guest is writing directly to the interrupt table memory
>  * the collection table is in guest memory, so QEMU won't fall
>    over if we read off the end of it
>
> However, it seems clearer to include the check.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

