Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5CD4875F0
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 11:56:15 +0100 (CET)
Received: from localhost ([::1]:42394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5mus-0003lp-6d
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 05:56:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5msG-0001nz-0c
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 05:53:32 -0500
Received: from [2a00:1450:4864:20::429] (port=45740
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5msC-0008Fm-SP
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 05:53:31 -0500
Received: by mail-wr1-x429.google.com with SMTP id q8so10251591wra.12
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 02:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3wHCDLpJX80lu0igrRKl7oOqtzcMvQ2jvL5Brjbn3ps=;
 b=vNicO7Lbt9kw79/lGIAe+Ksab+HQMhFwwcHs4daOrRHy8B20XkRzGY+LXVIWFGQM/1
 k5zVTtcxSnFow/zRLr/E5U39TCM+kKLnt1StfB15L8XxXwgkbcc9qyK1Eux1N1+VcWkv
 EgI2Ey043cywGS3PPwF3pPKTToreppJ9PqNKVutGoaOhbfVteWj+dC9jiHm1rkYmuPvt
 vVQHfX38bU9bJlaFNxcTi60UHqNEuQB1jk/ZhkNJzkpe2ahXQYUskDQdnMrzbdbC9JAW
 Z4vke3EUcvJPz1Uq6dJnTfxT8UD1g6EyivxT0NRGwcaZs6ohwjxNcKnQoaw92oUsdofE
 Byxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3wHCDLpJX80lu0igrRKl7oOqtzcMvQ2jvL5Brjbn3ps=;
 b=CBb6URKjj+BcRC3g2W7Kl08kfEB1iNYJvn1CTBOCoCwwatFpa6m91J41HNT+XpVU0K
 qDzWCK/wSBOsHhaxHPcLGYvvW8UlhwrjVtoeoz67GcdCFO2d4+YLodp0OsCJa/vUd+8Z
 4mbabulVaznf8Bheq+Ot+EIPjVuwmVTd9eCBbJjxQEpIl3eZflD3x+Xmt2Kj5QNGKziu
 yFm0qfBjcZS3FYrAh+4OetoiN2jDHJnozEu1k/6lznxNn02nkH0Vx16sQ54XuPo7tin5
 wH8RIyr181QV+p6R8HAaIe4GnlMamg/DsmBtVtGcaxFqfjHUNl7vjl/WJCQG6sQC1wD4
 NhpA==
X-Gm-Message-State: AOAM531S2GbjN0yUI5JoV1t3JJM8GpNwGc5RQrktCCjgUcmrN9BcO7dz
 T3ZIh0UiZLD50447hzhXVjck9yyOszWo9zJkgxTSmw==
X-Google-Smtp-Source: ABdhPJw6nVGYhHD2A1tYPFv0YVJs9hAy3CjxSbElB0Z8L1YgWsdEJM726jNZLhNBeX1omFWsryXVlvi/HklbqBId4As=
X-Received: by 2002:a5d:6986:: with SMTP id g6mr3036068wru.172.1641552804205; 
 Fri, 07 Jan 2022 02:53:24 -0800 (PST)
MIME-Version: 1.0
References: <20211208231154.392029-1-richard.henderson@linaro.org>
 <20211208231154.392029-6-richard.henderson@linaro.org>
In-Reply-To: <20211208231154.392029-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jan 2022 10:53:13 +0000
Message-ID: <CAFEAcA_oxQTc3WTitfC2k46oOwhK-3iXeVGBMw=NSXboE-mbJw@mail.gmail.com>
Subject: Re: [PATCH 5/6] target/arm: Implement FEAT_LPA
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

On Wed, 8 Dec 2021 at 23:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Could you put some content in the commit message, please?
A brief description of what FEAT_LPA is would be helpful,
for instance.

While I was rereading the Arm ARM to review this I noticed
an related check that I think we're missing. In section
D5.2.7 the text describes which levels of translation
tables support Block descriptors. (This varies depending on
whether FEAT_LPA/FEAT_LPA2 are supported, which is why I
ran into it.) e.g for 64KB granule size Block descriptors
are OK in level 2, and if (FEAT_LPA && 52 bit PA size supported)
also in level 1. Finding a block descriptor at a level it
should not be is supposed to cause a level 1 Translation fault.
As far as I can tell we don't check for this, unless it
falls out in the wash in some super-subtle way...

That seems like an unrelated bug to be fixed in a
separate patch (though it does entangle with the LPA stuff
because that will change the conditions for the check).

Side note that might be worth mentioning in the
commit message: FEAT_LPA also extends the nominal field
size of addresses held in the fault registers HPFAR_EL2
and PAR_EL1. Our implementation doesn't explicitly mask
out the high bits of addresses when filling out those
fields, so it doesn't need changes to handle them
expanding to hold bits [51:48] of PAs and IPAs.

For the code:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

