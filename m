Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D184AD6C7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 12:29:58 +0100 (CET)
Received: from localhost ([::1]:59218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHOh3-0004Tj-EA
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 06:29:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHNvr-0008CV-V1
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:41:11 -0500
Received: from [2a00:1450:4864:20::432] (port=44753
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHNva-000062-0U
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:40:58 -0500
Received: by mail-wr1-x432.google.com with SMTP id k18so29868348wrg.11
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 02:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rm3U0k2yW6Wsk0kS2UEXv+eoYFq0fN89zlTpFGOKmD0=;
 b=S4yyHOuH/P7n4bMWlwQYUc/L47E/+nkcMe5SbCOFZ4cbR6obibTI/EGC3ZMs6BzIFr
 jzhzqx9a5NZ4GhuQv/yQmYeBu4PJXt/8Q16t9SxnWHkkoAx5T+w2fZGBvx7xyrA2WUsC
 kIbyE5nR9RxmEzDxW4f5Bh/gtvgW0eMwHKd0VyZFHv7WZqnkb1pw9rebVanIB7UDvaMz
 /ZqKPSRE6EO/jNVAHDjYp0FDc78BYNhuDm4SmGKiEBAI1lY9+z9i46+0pRlXj3g18li8
 mFq/1m2I71zA/QfNzrv9rV1EWAtCiYCRjALOM6JuZ4Fj7GO4dTMRZIMl69wmM3Hav774
 2Nbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rm3U0k2yW6Wsk0kS2UEXv+eoYFq0fN89zlTpFGOKmD0=;
 b=bbdRtOcsrYX9v/zACA6nOY4zaMmjJoYW5xVWfGrVEDppxuS19hhTTvtz2ZbAryJRa8
 e0K/Rn/Wq9SEA9qRJDU8m9jORdvVpwcmUdtbqNyDYHYynSOnbsRKqELxfOxt1c+kTOc/
 j+7sauMi6B4fwXfNwPUJL2qDXj9hqXDTpLuHo/ZB/TGXzNOaf0zFO9vNrIoBM2oZZKrV
 D7aHwaLM4wRTPa05maD5z28sq60UxX3WOEXp5delmtmjmt9DEwzaDluMo/KXyDoFYcB6
 elIgzFfMAKIo3VCuApc6dgbQeFZx82b6AhXcKppR9jPnLbCSw0nh4vO+Zmfr6Bnkgfam
 9GLw==
X-Gm-Message-State: AOAM531I9UsoVNS53ToHJPP1op/gb7ahch/1cekQzw52IKO6u4SMPBCh
 MHmwjEhKdFh1akBwhpMKf61z+e96Ao99PRieCvZMBw==
X-Google-Smtp-Source: ABdhPJwbb1xaLb46dzGwRG73POaF+m0JUqjs23PoZEWpaveET8WP+dA9EHKeeqWQUV6v5HJsOiIG4ppyzR211N9NfeU=
X-Received: by 2002:adf:e18d:: with SMTP id az13mr3109013wrb.521.1644316844829; 
 Tue, 08 Feb 2022 02:40:44 -0800 (PST)
MIME-Version: 1.0
References: <20220208071710.320122-1-richard.henderson@linaro.org>
 <20220208071710.320122-2-richard.henderson@linaro.org>
In-Reply-To: <20220208071710.320122-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 10:40:34 +0000
Message-ID: <CAFEAcA8guxNuHUhF38GT3rX15K_fTHEUBaRPooTxUFaVHx1wmw@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] tcg/sparc: Use tcg_out_movi_imm13 in
 tcg_out_addsub2_i64
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On Tue, 8 Feb 2022 at 07:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> When BH is constant, it is constrained to 10 bits for use in MOVCC.

Where does this happen? I assumed it was going to be done
by the constraint encodings, but tcg_out_addsub2_i64()
is called for the add2_i64 and sub2_i64 ops, which get

        return C_O2_I4(r, r, rZ, rZ, rJ, rJ);
and constraint J is
CONST('J', TCG_CT_CONST_S13).
(and indeed there is no "constrain to 10 bits" letter).

thanks
-- PMM

