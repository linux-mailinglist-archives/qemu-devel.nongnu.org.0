Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EE5486B11
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 21:26:38 +0100 (CET)
Received: from localhost ([::1]:54198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5ZLJ-0003zw-Lf
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 15:26:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5ZIl-00020k-5y
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 15:24:00 -0500
Received: from [2a00:1450:4864:20::431] (port=41787
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5ZIj-0000rA-LG
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 15:23:58 -0500
Received: by mail-wr1-x431.google.com with SMTP id v6so7034902wra.8
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 12:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oejBT+vNW3NZWAbVVtIBhj28INdZS4tzSdMdtBnxE5Q=;
 b=b7jMywOtTzrXAE4ljZkiB073rmXhV1t6AP3Kd2sM9wGDuee+3LhXYOQqOJqvKaVwaC
 HGRY0GtEGsTtUjpQGZJ8+XloTNpcTEV3i+++INLwutKDgjmoDGUVszRb2Ha5lGJcf7xt
 AAdfX4tuthUrpZ6iWCqx4o9/5xcz996qjPKFbxneILqy/Tn2qWXiXr1Zbo+6jo9URQ64
 Covrg118mZhdYdQZwFCnIzV0rc0aSYXnAMxnb5tB/KbCczc71mc0KEEE/lKC29tvX8ei
 tIo+o++lsIOcnhcqfvKuryBNp+cBx0uyEChKkyHfmd/Z8CnpuQtp071i8R4xLmg0bBuz
 Dr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oejBT+vNW3NZWAbVVtIBhj28INdZS4tzSdMdtBnxE5Q=;
 b=fPjGMqC3xmZriWx4stsBYtZyxMgJhJt8hpulXxBLCMnIQy6IYWptoLT1+7MO/Lu/Vy
 1h+O6bfKhcMhpwGOErvQ5kFAXUMgA7z1IJ69HhAvRcxUnEtTyGvedEgzv8w10EkexjW1
 BkeUfpBI9wSW0qgUGdWXXDzFFGZ0tvrI/+4Xilp2KmvfInU3T9SFo0RMuZVerVYw9JwX
 XwOo9LoOgDaP0LmEQOvi+ayVP93SL8QsZunK1ermROD2qJfnNKAO8Cf2rDZE2KfzOJfs
 sODqdfTWZodqRZ0+Deh6XhI3AeKx0EUf4o0v+ZBzpITCSM1ih+73EeY08pORQXNN/XM0
 GFBQ==
X-Gm-Message-State: AOAM533V4ovtvJw9eQG7tqK7az9ScdaUQMSF7ULU8ahMx/mVRbdvZnal
 cU5QBeiqy1DwxNo2LHj7DqRiCo8PxaVokhJzb0Qsug==
X-Google-Smtp-Source: ABdhPJyaE8drf3FajfZqWFkEOJgnfDl3vfkvyy6iuznOA/51tpkFK/eLjzB8xwqt3stBejUoVHRgUVCwcOnz6AGqjsU=
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr50905577wri.295.1641500635765; 
 Thu, 06 Jan 2022 12:23:55 -0800 (PST)
MIME-Version: 1.0
References: <20211208231154.392029-1-richard.henderson@linaro.org>
 <20211208231154.392029-5-richard.henderson@linaro.org>
In-Reply-To: <20211208231154.392029-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jan 2022 20:23:44 +0000
Message-ID: <CAFEAcA8u3cnEzoXGk5upgTg1L+gzuERo-mbKrK5sjY22gp40cg@mail.gmail.com>
Subject: Re: [PATCH 4/6] target/arm: Implement FEAT_LVA
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Wed, 8 Dec 2021 at 23:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This feature is relatively small, as it applies only to
> 64k pages and thus requires no additional changes to the
> table descriptor walking algorithm, only a change to the
> minimum TSZ (which is the inverse of the maximum virtual
> address space size).
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

FEAT_LVA also expands the size of the VA field in
DBGBVR<n>_EL1. We currently hardcode the size of that
in hw_breakpoint_update() where we do:
        addr = sextract64(bvr, 0, 49) & ~3ULL;

This is also true of DBGWVR<n>_EL1, except that there
we seem to have chosen to take advantage of the spec
defining the high bits of the register as RESS (ie
sign-extended) and we always use all of the address bits
regardless. Maybe we could do something similar with DBGBVR.

(Similarly we use all the bits in the VBAR_ELx so that
code needs no changes.)

Otherwise looks good.

-- PMM

