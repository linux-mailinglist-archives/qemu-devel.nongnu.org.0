Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8962637A5D5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 13:35:25 +0200 (CEST)
Received: from localhost ([::1]:47520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgQfc-0000iJ-AV
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 07:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgQcW-0006qq-Ox
 for qemu-devel@nongnu.org; Tue, 11 May 2021 07:32:12 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgQcU-0006sU-1J
 for qemu-devel@nongnu.org; Tue, 11 May 2021 07:32:12 -0400
Received: by mail-wr1-x42d.google.com with SMTP id s8so19783503wrw.10
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 04:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=uVEx0pAI4NuyF5I8x9dRkCUdwU/xlGn0s5NNJhE26l8=;
 b=jx5PXSigy/SrDB/C+bPksnaCh1IxzX2CaS8dvPp/Tv2rQ9J8eFm8WDwuV6k39QM1FI
 W/m/s0i4Ffg5EjLb8Drl/gRaElG7Zlavx+o/qH8FNAjot8y+MfbMpHF309Jp89WgAL4C
 dxsveQ4J06MEgjnfZ63EjuOy0rr08mIyGxMivqvnzS71g2VtU8KoR1qEC/mmCwedPZZR
 KU1TC2p8Ls4npLpft8PwuKuMCdk1JBydlkESmK+uIW2NXyk6YbN0MQVqKIhQ2qQy8+ct
 5pxNLd/LgNtkjFtsvZ3laZObCSZuEG3EU7USliozA/dPRDlzqlK8J+YnokBWwU0+OEu/
 hX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=uVEx0pAI4NuyF5I8x9dRkCUdwU/xlGn0s5NNJhE26l8=;
 b=KvzI/m3fcWOmXjQR3pS6qMvP27M+qee2MdkRQ6ARjtaPxY1OTspXVgYNwGxWS3RHOz
 h87L/AuZBm4ko9fNXZo4L6TzWud6bTlufNXNc8L4/OHhdf2MGbwypp2XC7g/34Kni0kV
 Uza5BHmJJky1ssfFxzoTiSm1sND1ouPQ+TjtdL6uXoyiZkTOidc8EmHJ+rx3oRcQxQFP
 qWo62lfCcgfugMt2x3ttPqcaSF5K2syOT4V1k0xJu973aoL1F6VDxdzcEO+0UNo83nkd
 J31GetdOzT/kje8PmLjwqaNHskew3JzlpHDUVc7WdyogktaGaMkBcwNmZaH2fu5u+gxD
 YxWg==
X-Gm-Message-State: AOAM532mAdLtEYWyxBsB/5ejcGRJLLHne2hBVC6bPN7e3tpEbcGKE7q1
 O0iy7Ll4+OFX4ynwfev56/Gv5g==
X-Google-Smtp-Source: ABdhPJymPL3M2f9CwtsW63OpUaI3onLPHasdo5TzTy3AlW12Sm9FU4TQ9NV3LigPR5X0o4KiWxLX1A==
X-Received: by 2002:a5d:6551:: with SMTP id z17mr36447322wrv.372.1620732728617; 
 Tue, 11 May 2021 04:32:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g129sm3615731wmg.27.2021.05.11.04.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 04:32:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BFD251FF7E;
 Tue, 11 May 2021 12:32:06 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-21-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 20/72] softfloat: Use pointers with pack_raw
Date: Tue, 11 May 2021 12:32:01 +0100
In-reply-to: <20210508014802.892561-21-richard.henderson@linaro.org>
Message-ID: <87k0o5jykp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> At the same time, rename to pack_raw64.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

