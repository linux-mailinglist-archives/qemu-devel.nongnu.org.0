Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC693FCE98
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 22:34:58 +0200 (CEST)
Received: from localhost ([::1]:35666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLATB-0006xJ-M8
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 16:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLAQ2-0004K3-LQ
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 16:31:42 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:46049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLAPz-0001vM-Vf
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 16:31:41 -0400
Received: by mail-ej1-x62e.google.com with SMTP id e21so1532840ejz.12
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 13:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=e5ljDCKhy59uB8trbeEyv+Y+2yItWw06yiAxXbZrekc=;
 b=UHLeV2+8fVstXowiOiOhGIrOj6Pk8kNy8a4GlOlfHnjCmMcHdypKrBSK2Q8HDIdsVD
 LSIxTSPMHgMcOsgqA3ddDUnTRZ82ysclI+yqpgBFNaTAJprujcyVVk/fhMiFwiUbemko
 AXmsy21i4honNi/z9BMdoSTg6gD6G3ZUdaGvIL8o2VLatFvezNHNkJG09UHzgasSiMF6
 dVv0v0cVTp/BUvfYMqE/ZlV94L+v4+n3fEnlLAbhQZHBz+5UXl84WszCM6hdAXs5+DNB
 R2JPNp0Fpb8/5EQvkLCoulkiu8sTDEcVgTTPMnZDzmJGaPQVMFoTND9UdvbR6n31lBmL
 eFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=e5ljDCKhy59uB8trbeEyv+Y+2yItWw06yiAxXbZrekc=;
 b=XDUUpnlX1e+5SjzwGJsghIQx2UoRill5rF4KxNKylcIktRH2NYchWEk00KJ3rDDIRT
 ov6UBrYngITRkFF4uusU/d6IEYY3YXucklEBFHMJShQ2EG6/toMqwGRtMVRvnMPGVZKj
 Yfds11+VCTerQ0I6rU9ralQdiqjUT+sF7zPl/N3XeYoogllaui9c6Eu2J90G7nbdTnnc
 kDy1kTVkmVifWwwxQJ80SmPlN7EBl0f/FNk3HMcftPzR+1pV8uh9/oil5GbQh6/aytg+
 MebNYwZ0UrwAY1tvCtVKFLsP9JNz4IO2/rHDKSYbWauLZX9Gtnb0xSwI0A59/cxssA1T
 3Lzw==
X-Gm-Message-State: AOAM531L49RtW50Q35FoKgxhasgBSGOJt1VFoTo0epBKFeAQeCnG6DM0
 FfeQx2X3efHjx6vITMhgU7JbrZKDlkD0es8VWiH/ug==
X-Google-Smtp-Source: ABdhPJw2qqjWquULU8Zd4FDuCmlcRLSsTqWKEVXwamTTF00gr7PLzIX5hy8X5WiYZiE+Jmq+rzW5KN/NCv65uyAA/no=
X-Received: by 2002:a17:906:584:: with SMTP id 4mr33414020ejn.56.1630441897584; 
 Tue, 31 Aug 2021 13:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210826180704.2131949-1-philmd@redhat.com>
In-Reply-To: <20210826180704.2131949-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Aug 2021 21:30:49 +0100
Message-ID: <CAFEAcA-mLpJZed+oV_TnZP894OgACiSFiEDPgG4g8O=fx8oQXQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/intc/arm_gicv3: Replace mis-used MEMTX_* constants
 by booleans
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Aug 2021 at 19:07, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Minor cleanups on the GICv3 distributor common accessors to
> have the overall codebase better use the MEMTX_* constants.
>
> No logical code change intended.
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   hw/intc/arm_gicv3_dist: Rename 64-bit accessors with 'q' suffix
>   hw/intc/arm_gicv3: Replace mis-used MEMTX_* constants by booleans


Applied to target-arm.next, thanks.

Shashi, would you mind updating your ITS patches to match this
cleanup for the next version of them, please ?

thanks
-- PMM

