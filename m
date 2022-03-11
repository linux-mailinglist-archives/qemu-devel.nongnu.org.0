Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 793B94D62D4
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 15:06:38 +0100 (CET)
Received: from localhost ([::1]:46850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSfuf-0007p9-3Z
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 09:06:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nSftH-0006cv-28
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 09:05:11 -0500
Received: from [2a00:1450:4864:20::429] (port=39460
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nSftD-0001am-M8
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 09:05:10 -0500
Received: by mail-wr1-x429.google.com with SMTP id h15so13100640wrc.6
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 06:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Jt75aQHHM+fJPVgM/IAZG2xFHy1kUJjKdQTVgGZzI+g=;
 b=tAFL14JcLBnqTum99R+O4a1I3d+oiRtvdgMhLPec9BxgDs7xSUjm8cLq6Y7XJl7HGe
 dqBIZaOn9CIqN6f+06iMyN9JXhk66hPMuPtwhcCJfg77da0M0DhWQf6qkXFrWG7G1EM7
 18+ozxAxsSubpKEpVxJ2T1H0Uy/xYaui/gr8uOUhp6ssuZrArwl++1aO/mGMvSv7qh81
 TG0dRS8GfFPdnDEeHGi21UQAmSKw3tbNZoWZROWUkDu27ybGC7iOjMGgq8TPdLgUSEqm
 Am7lBZlZd9LTcORxl8SoohHCY8rwwRIpNJZ5CaKPsVoE32uZMseNjOsAWeLt/08bPWqw
 tRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Jt75aQHHM+fJPVgM/IAZG2xFHy1kUJjKdQTVgGZzI+g=;
 b=FnT/9TwFZyo9e4OJN4atPgO2cm7b0VACr8lGtbvQdwCd9TwjFocBu1V608UeFMLnB/
 uN/G/I+9Ld8ZGavPDnGZfNyfu0B4oflq5LiBCm22oZBOJ48VFlzVoewaiz+KOt1OEi3h
 7XuEX48oU7OzNQoNJCLSemmluKeGHOCJoBrh4FeYYfiZIu9Uwd0XIHEoqmh8AvsMmKhX
 FKAN/bn1X6L/hv0JbMM3CUKtA2dP7i4tWOnzRotj8tubr13hsq5Cs61D7rFA0RDn9taW
 49NZYEn7bYcm1+3zcnYawCvbDZRvVhMGsuMkGTH3XlDkLXP59FCvRYjCVZNgdChx3d5O
 bxTQ==
X-Gm-Message-State: AOAM5339vScqeMdjRTHTm54UaBybfJF3GKkB2gcmyDTdOXN3w3MWFyaE
 V5R9pfeiOQWKPE2wsOmbDe0gJw==
X-Google-Smtp-Source: ABdhPJwDZ/lHyw7zLSH864l/8GdbcpdDXU+IeCphj4KvJfyGREjIqk+BwKXkkizjy2qLeSDqvgu2IA==
X-Received: by 2002:a05:6000:16c2:b0:203:7bb6:38e8 with SMTP id
 h2-20020a05600016c200b002037bb638e8mr7603414wrf.140.1647007506025; 
 Fri, 11 Mar 2022 06:05:06 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a056000128100b001f04a47762dsm6741356wrx.109.2022.03.11.06.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 06:04:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 577FC1FFB7;
 Fri, 11 Mar 2022 14:04:47 +0000 (GMT)
References: <20220311075300.609094-1-richard.henderson@linaro.org>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] tcg/arm: Don't emit UNPREDICTABLE LDRD with Rm == Rt or
 Rt+1
Date: Fri, 11 Mar 2022 14:02:24 +0000
In-reply-to: <20220311075300.609094-1-richard.henderson@linaro.org>
Message-ID: <87mthw4mbk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The LDRD (register) instruction is UNPREDICTABLE if the Rm register
> is the same as either Rt or Rt+1 (the two registers being loaded to).
> We weren't making sure we avoided this, with the result that on some
> host CPUs like the Cortex-A7 we would get a SIGILL because the CPU
> chooses to UNDEF for this particular UNPREDICTABLE case.
>
> Since we've already checked that datalo is aligned, we can simplify
> the test vs the Rm operand by aligning it before comparison.  Check
> for the two orderings before falling back to two ldr instructions.
>
> We don't bother to do anything similar for tcg_out_ldrd_rwb(),
> because it is only used in tcg_out_tlb_read() with a fixed set of
> registers which don't overlap.
>
> There is no equivalent UNPREDICTABLE case for STRD.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/896
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

The fix looks sane to me (although I can't test because it seems my
aarch32 on the SynQuacer does try it's best). So:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

A wider question. Is this something that can be handled the constraints
done by the register allocator? I assume that avoid direct aliasing if
needed?

--=20
Alex Benn=C3=A9e

