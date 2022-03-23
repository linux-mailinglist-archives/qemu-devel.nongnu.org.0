Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ED44E56DF
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:48:21 +0100 (CET)
Received: from localhost ([::1]:44230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX49k-0001vA-4a
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:48:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nX45J-0004re-1U
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:43:45 -0400
Received: from [2a00:1450:4864:20::42f] (port=39445
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nX45H-0003BK-Bl
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:43:44 -0400
Received: by mail-wr1-x42f.google.com with SMTP id j18so2951601wrd.6
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 09:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=pk1J+McWKI7S+0+v5jJDVxd48C6/O6QAAZDe8U7m/1A=;
 b=sXsbcyJN9LkIsk3VsWnpIfDrQ6bOs0IvlyB88xIg/1oPjzqJYqiM5f5jA2s++yvx+k
 jPmRNrxiU2jP2w7RHMNt/5rY49jYnG4TWoFgvS9GP1v6+FZ9RMAjGryH42NhR7KFIjWW
 UAAGZrMR6bjeKdt1lZQBevq8mE1QvApayAhGzNH7XLAvZkQT/FEFZuy3UBEL8Z2OT4vm
 V/j4uv9rfI/pTzoSOJgfuaf3bEUV0+sMBAGkhgryE/+mW19pkUE4RsqeYNfX37fCY3+a
 2K0TH9jle1eS+4fN7BXLFehNH9uXqUzGmhiGMemlnmF2Rp41pZoCInVFAJxzM00xa/r6
 9LoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=pk1J+McWKI7S+0+v5jJDVxd48C6/O6QAAZDe8U7m/1A=;
 b=7k+4xER4Vi/FZ4+Xi45zuFycxVOJAXJvMtLJOpVUVB/iwKVwxSvK+XMGVJnEEPSySL
 uN9lH7ztb7d/C4w0J7osrBYHJqvZuXyh3V32y4ikjg5uhx+nJbIIvdjmOw6bE6JoVsHB
 keaQMrA5jSpEGkl2nypJqGxrmUkIpE8mUUhOJmUq4i81PDBxkNfBOifhChLZq1eoXpLT
 AWZNiX5IjNEa6O3XFXsMYTaqlsCGlFc74KtPvJx+2IzuJaJGC7W5SnR3i3+4vlYZAF9a
 IPzu8CSgPD11gdkIfpHiX4OQsoh9zF/iq0dpR97uWIrzkfYvD4vOQuHc0F4XsN8Tbe/n
 Ev7A==
X-Gm-Message-State: AOAM533PXLXRLFbhbjJJ6tTzyVL7TbepVhw6iGxQ+HSsyoOCKM+sB8cZ
 gUwCrSx21IdV4//W46rIzwaN1Aw+BzPzwA==
X-Google-Smtp-Source: ABdhPJwzQvkepl06Jo50K9LD4v723O1qEyTPJ50OlNUQ0LG+tBcVAKcnQNKNbYF7TQPFmCu79CFWNA==
X-Received: by 2002:adf:914f:0:b0:1ed:bb92:d0cc with SMTP id
 j73-20020adf914f000000b001edbb92d0ccmr662676wrj.297.1648053821903; 
 Wed, 23 Mar 2022 09:43:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a056000144a00b00203df06cf9bsm309991wrx.106.2022.03.23.09.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 09:43:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 284A61FFB7;
 Wed, 23 Mar 2022 16:43:40 +0000 (GMT)
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
 <20220320171135.2704502-7-richard.henderson@linaro.org>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL for-7.1 06/36] util/log: Treat qemu_log_lock like trylock
Date: Wed, 23 Mar 2022 16:43:36 +0000
In-reply-to: <20220320171135.2704502-7-richard.henderson@linaro.org>
Message-ID: <87ils44o1v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

> Do not require qemu_log_unlock to be called when
> qemu_log_lock returns NULL.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

