Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F221CF637
	for <lists+qemu-devel@lfdr.de>; Tue, 12 May 2020 15:55:18 +0200 (CEST)
Received: from localhost ([::1]:54068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYVNN-0008Kj-Qq
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 09:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYVKh-0004dB-Tl
 for qemu-devel@nongnu.org; Tue, 12 May 2020 09:52:31 -0400
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41]:33658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYVKf-0005UF-HI
 for qemu-devel@nongnu.org; Tue, 12 May 2020 09:52:31 -0400
Received: by mail-oo1-xc41.google.com with SMTP id b3so1025198oob.0
 for <qemu-devel@nongnu.org>; Tue, 12 May 2020 06:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p8dn1iXcWkPSv7fvGUaQuzirip7wY+d8CA4bLUsNgxo=;
 b=TdsDHFuba5pDBPaCsP0Wp5vSBQTTpXhpIUSHdmwCmhjU/pSny1nErKgZVo+xNLuZwN
 GyIdB6PtQvkkSUClDcgyZR/oQvLNZJ+w0bwnDwQQ1KdF81zkSKLeVyvrmHN4muF3PTxz
 Ytbvnmq46qcV5DWunhcrahYfoqYJqqxc66hb4JnR/vjxGRG1LRLdNDLJuMphg9Z2EHIf
 aklIpg+19PGjcIyFiejAKwOxfM7HwUGttetlEoerxrXYrp5lsx/bDOzy8nvLFKrfncwO
 Bb5e8LDx/TmVowwg+XZt+PGBMAH6fRlrS/XzE4YZCFX6xsh2G/3M+PK2r5IgHQrqW+ln
 nfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p8dn1iXcWkPSv7fvGUaQuzirip7wY+d8CA4bLUsNgxo=;
 b=RllBbErSRTzNWlx3qvSTjRqLLKZq/DLTUKYS+vsp/yVGBe2npx7maDkC3551K22aU6
 OGVg0ITY9/403UZPgDva2fPXHxHI15kUPJ4XuYESBRsOW3ljpRmz97HU9y6PmPC7URZ4
 o7cDtToOKUVeAtiiNIw81XiQEzkE1M/Uk3OMBLolq2f2o14opDWJICsb2LeRI2bYB6Te
 pOydT587oMji46n18WQ89+3OVeLQS7f6CBxyL5O0INuilyyttrYLtOPRNcbnL23a43JJ
 P968A8dzeKmFo1/BEjbNBjlldPA3QnsPAb5ZBRvaFBHYwjRoRBSZbaR6kZSTXrn4HEIf
 4wzQ==
X-Gm-Message-State: AGi0PuawmbO6Ir5VEEdWa/SntOFuVAtZEn2RhyLFG3cHeG6g12hFiTiS
 5tVTFPGMJN4SvFTbogLPbbTP/mmDeJqf7an4Jw1sY6SBix4=
X-Google-Smtp-Source: APiQypJ0+yHDRCD8r0xeNTAQT/b1ntTnu0pFYP5HYyJ9g4HgMFcTV5JKGjwlWyjqBFNlnqOVSpvQ9WNS1ZrzDRIC3ng=
X-Received: by 2002:a4a:3556:: with SMTP id w22mr12224500oog.20.1589291548169; 
 Tue, 12 May 2020 06:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200508152200.6547-1-richard.henderson@linaro.org>
 <20200508152200.6547-4-richard.henderson@linaro.org>
In-Reply-To: <20200508152200.6547-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 May 2020 14:52:16 +0100
Message-ID: <CAFEAcA-W+1MqU4bBOd0K78GwTOC2=BofGchnqzioCVr9kFFd0g@mail.gmail.com>
Subject: Re: [PATCH v3 03/16] target/arm: Create gen_gvec_{sri,sli}
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c41;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 May 2020 at 16:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The functions eliminate duplication of the special cases for
> this operation.  They match up with the GVecGen2iFn typedef.
>
> Add out-of-line helpers.  We got away with only having inline
> expanders because the neon vector size is only 16 bytes, and
> we know that the inline expansion will always succeed.
> When we reuse this for SVE, tcg-gvec-op may decide to use an
> out-of-line helper due to longer vector lengths.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

