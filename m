Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1522639450F
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 17:27:54 +0200 (CEST)
Received: from localhost ([::1]:39146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmeOv-0004OC-5o
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 11:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmeNu-0003Vu-QS
 for qemu-devel@nongnu.org; Fri, 28 May 2021 11:26:50 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:39739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmeNt-0001nb-9g
 for qemu-devel@nongnu.org; Fri, 28 May 2021 11:26:50 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso4796392wmh.4
 for <qemu-devel@nongnu.org>; Fri, 28 May 2021 08:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=frDgBilktP25kJ7FuXSxJvLJfVTSGeZxG1g8uus7cBA=;
 b=sfcxSjBvJ1ubLF2Xxsobr26yvwAW4jiaF4WPH/a/LYhHy/RENnXMgv0IzR4yHT+eLd
 7FKqWMb9W7ylWsfzGms+5F0GHkPbJOFTqn9fWnRcabAiCLDIrvc6vVDkjaqc6vUmDU4g
 jmZkxyZuq6o1RRUw3QKeBu4bOhUFiz0ibGWn5tykw+4d1A1a5wjHI7XIdU8Lp18ghoXJ
 6h+NHWxU7CUP4oPQbIrjGPo2egKiLB4gV+UKWks5Q09CvRea/R7FO4VzhZVxG/nIZWF6
 QZG1soRwi28aMoAhrGjslsYc7YQiGXyO1GZL2ertqg7D8anNpywg/FJDvy4fj/DXNO+1
 rKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=frDgBilktP25kJ7FuXSxJvLJfVTSGeZxG1g8uus7cBA=;
 b=iOvTbPliJlHlNjb47XOkqqL0kxZ91SGgsCe9KKpJDaxI+8f571HF/4IEbLaoOPEMyF
 LpexV9OxFopl7OevCOcLFkojqUKtmQDdbIbUgdhKsoO22LLpOjLk5sJIy29BOjRj8U3C
 fSwVHDWfARt4jZYRFR1S7jr88oj6FOFy3k23Ey86JNe0BDaICBVaZitD51qKECW4xMla
 J9RIkTtGuNI9ceR4W/OUugGumhZvhuyhWwArhfht/Xy6VBQVMLrh2aJH30iujA64t7LL
 uxoVegTgSTpF0/fFEa/Fr5du+h0Pti7pg4zvewb6QtGosycYI6VYhXJvd2sUP7l5qeFG
 Vwrg==
X-Gm-Message-State: AOAM533k7K3SpynOk6apmRhkiDl0leDK/vYbgiNFOA+bBppHvvnayXKJ
 GF2urA7GCbikfuX2XKW1yGd7CA==
X-Google-Smtp-Source: ABdhPJyVOlrAP2N104Ta/rG8f8DriTEYUSLelk8iiw+dgUYx654QT2Rw5Z7QWGWVFHaFmLhk2GjcKA==
X-Received: by 2002:a1c:4602:: with SMTP id t2mr13747253wma.173.1622215607673; 
 Fri, 28 May 2021 08:26:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g70sm7398894wme.9.2021.05.28.08.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 08:26:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ECE981FF7E;
 Fri, 28 May 2021 16:26:45 +0100 (BST)
References: <20210527095152.10968-1-peter.maydell@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] arm: Consistently use "Cortex-Axx", not "Cortex Axx"
Date: Fri, 28 May 2021 16:26:37 +0100
In-reply-to: <20210527095152.10968-1-peter.maydell@linaro.org>
Message-ID: <87h7im2822.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> The official punctuation for Arm CPU names uses a hyphen, like
> "Cortex-A9". We mostly follow this, but in a few places usage
> without the hyphen has crept in. Fix those so we consistently
> use the same way of writing the CPU name.
>
> This commit was created with:
>   git grep -z -l 'Cortex ' | xargs -0 sed -i 's/Cortex /Cortex-/'
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

