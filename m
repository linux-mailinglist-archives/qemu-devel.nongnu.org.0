Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 597AB4DAF56
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 13:06:16 +0100 (CET)
Received: from localhost ([::1]:52606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUSPu-0008NY-UM
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 08:06:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nUSN7-0006rh-Nt
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:03:21 -0400
Received: from [2a00:1450:4864:20::535] (port=39641
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nUSN6-0004qV-4u
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:03:21 -0400
Received: by mail-ed1-x535.google.com with SMTP id g20so2416873edw.6
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 05:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=AHh+kZMOs0Aib0GrytWYGsLoVb6ZfYH9MpTRI5IYw2M=;
 b=VGOftxGU65hIykt34MecuzlH2jtu+aT0F+hny+nHJs75tf2R5nbTT4Xi+72aXeI67B
 ia5IB7F88Vz/e2qbnkjC6/AX/KTR3mncj3CHPJLLi3ne67S/27jCfvnbNdgzwVNYqcy+
 WpWHoWsqzsNfCk2fBqccM1/wCaojoMLBpRhL8/rA/aMDwPs1Kc30oFZqctHi+rRiI9CK
 xCVkbCzTQymNvZtUhguBksSzOjnWhEDq27LI9DpzvzVLiqMjdR1Q+EgZGUJOZ6CmHrBu
 I9pjmtKMnTplVjxOyFSpJV7uATzRCuzE8UfBcEOOgp1pWdJyhogHczJkmmFmQZG1OrOH
 0PcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=AHh+kZMOs0Aib0GrytWYGsLoVb6ZfYH9MpTRI5IYw2M=;
 b=Qy5G8hRVjvs4DIBANxKUd8KEj85WXhyhEhPXrA7KecdB2G/qDtJTFVpmXUXwqyBGSK
 U9g7E7LCKDkK42D5Jks0etF8bgE2KS2p9pD8wo8l5IjJn+snOIcu4RVYTYpYBkLch5o9
 F4oyPIuLSN0SiNLIEK3+q5z/6uKlV7GM7MsKhP1jTTBzcYz+OeedVzaFB4P4miJ0d9XM
 cB+Q2U7KKJeUav86GUpdeNCXSRzIFLJk//s+E/+ng4Ywy0JOaCMEpVngT4XCMSW9LVde
 2E4boSGDa56lg7nHZQA6kMFVNRBcmTa5DurrCobWz/InvlW1NCyl9xuWO0jicPTVhf47
 ANBg==
X-Gm-Message-State: AOAM5302vZGW74TV6581qcHLd/a5qw3yJ4EzYgIIljA1PFh7LucdcCgx
 /rAWBVYVsr0Iipzf8bYTrrfyMQ==
X-Google-Smtp-Source: ABdhPJyAxC5ydWwK1GVhhpZnwFSTYyzqLb7AM+rU436wmJvgIFxx5UIsRN6WiHLiurF56n77QB4fxQ==
X-Received: by 2002:a05:6402:424f:b0:418:5886:4fba with SMTP id
 g15-20020a056402424f00b0041858864fbamr19943816edb.295.1647432197933; 
 Wed, 16 Mar 2022 05:03:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a056402000400b00412d60fee38sm884877edu.11.2022.03.16.05.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 05:03:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1942C1FFB7;
 Wed, 16 Mar 2022 12:03:16 +0000 (GMT)
References: <20220315204306.2797684-1-peter.maydell@linaro.org>
 <20220315204306.2797684-3-peter.maydell@linaro.org>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 2/2] target/arm: Log fault address for M-profile faults
Date: Wed, 16 Mar 2022 12:03:10 +0000
In-reply-to: <20220315204306.2797684-3-peter.maydell@linaro.org>
Message-ID: <87wngu2jgb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> For M-profile, the fault address is not always exposed to the guest
> in a fault register (for instance the BFAR bus fault address register
> is only updated for bus faults on data accesses, not instruction
> accesses).  Currently we log the address only if we're putting it
> into a particular guest-visible register.  Since we always have it,
> log it generically, to make logs of i-side faults a bit clearer.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

