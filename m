Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C2560C7A3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:13:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFk6-0005st-Ki; Tue, 25 Oct 2022 04:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onFbF-0007au-PI
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:47:54 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onFbD-0007FL-F4
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:47:53 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so8023490wmb.0
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 01:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=eoE6UN1mW0hB6t9f9zhT4iAOH2gRle5hYgYacdDWNOryZIKXW4/DbMHgWlpy+HFw+R
 4WRatfgD0HtQXa88GhuPSxciQuwUtPIlOm1Z5Kl5fTTi2HBtklc0YDURwAD/dHnuvMXo
 T3VG8by6B22qP+uOi+bv7MIazjk7s54Ut7In+7dqVh3Uv3quXBOqocC+IoF7TaQdLIpC
 vYD/vrXhwbSvUaxjzvl/Erjs2OlCCpp93PT4XNeqqDZBlbEbZs+4zRq/UEqyL0xX+woO
 qANVfpldN/0hV1FHv8AG39N8vO5Ykj3KDh8U1qO3SlIk7WY8mTg+6CFpWm9+aKbPvWQz
 mriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=thGTU1D/BS/ofAH+SwL+4N9kJKkbsflYGFCRRi9XK+iR6grrKbwX8FVboXY+Oz3QoY
 2Yh7jSMslZ1pTyIUoWC0oFK7Tt/p0me1hBgwVXMiNb/uKts+olBSHtjRZPoxq89Ci9+d
 3mrV0PdjIudzmKoGalpl1VFt9uaUEmwpRV7b+YHCFtuwqPNHx5OqiZyx6/UGPltBZnGT
 rjGvYEEmQPVi4lmzFilBOwj7LDZmFc9KmaXT3nSNF3bmt3/BkHk3kZP+r/HVGY3hZKAk
 1ZYoTaTa544YYvUPCoxcy78/z2CCbjv7mI09g2a2gxhePGBeItlsK5jA1UkD7Dj+V54d
 5pyw==
X-Gm-Message-State: ACrzQf3C8isIe0z88KGOIZn3RJe4sFhAIwBFPeZycMD7JXdAQhTzzOqX
 i286fkvyeCTEe5fBXYFW9HPzvQ==
X-Google-Smtp-Source: AMsMyM4eIAhnHUCsrMNb4wpUmdTM4YTGYb5+DcMSLh/ZQmuTDJEHh+8PSuJzMmA3NjU/tsPmXmbl7w==
X-Received: by 2002:a05:600c:3501:b0:3c6:fd36:ef58 with SMTP id
 h1-20020a05600c350100b003c6fd36ef58mr26386432wmq.164.1666687669848; 
 Tue, 25 Oct 2022 01:47:49 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c314a00b003b47b80cec3sm10660174wmo.42.2022.10.25.01.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 01:47:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C83F31FFB7;
 Tue, 25 Oct 2022 09:47:48 +0100 (BST)
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-5-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: Re: [PATCH 04/24] accel/tcg: Split out PageDesc to internal.h
Date: Tue, 25 Oct 2022 09:47:42 +0100
In-reply-to: <20221006031113.1139454-5-richard.henderson@linaro.org>
Message-ID: <87h6zs8f2j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

