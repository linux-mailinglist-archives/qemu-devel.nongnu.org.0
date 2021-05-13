Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D8937F505
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 11:48:09 +0200 (CEST)
Received: from localhost ([::1]:57818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh7wu-0004vF-RE
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 05:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh7vT-0003OR-Cw
 for qemu-devel@nongnu.org; Thu, 13 May 2021 05:46:39 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh7vM-0000rJ-PC
 for qemu-devel@nongnu.org; Thu, 13 May 2021 05:46:39 -0400
Received: by mail-wr1-x433.google.com with SMTP id x8so4016932wrq.9
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 02:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=CGJc2Y1DXxDzQyE4Qfq27xT8ZD0m4X1zh1YtinudN2c=;
 b=pz1fEVPEvxcJaCAhuV7dGIzcM4wzSxn5Vtd94+ueJ3kJrIIg8PipI1CJTmbOsNu71N
 JOsJ/kaGQbdsGQ0JoAzRKeKyslNPUfayQMNJm85Q9x1X50oSua+Jn38EE0x39nvQcq2X
 2xLKYx7m+pBpz/NLS8rcdw9ewuJTKRpG2uswTrZxDUTb0JoBeBwoXiBIZwDdUM8ov5Eo
 0+DGGIiro6Au8Mk5zEvFGJ4vtR4UUVtr04RGslhxHCa/3kK1KHT+bxc/K3IFE9GyBejt
 cMWSDHESTuZPJsNQ8lQJ052FrNp0I0cgFzKaLa+km6b3tfSs090kXDQi7qOwzZm9AvXC
 DDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=CGJc2Y1DXxDzQyE4Qfq27xT8ZD0m4X1zh1YtinudN2c=;
 b=WUcPILrFmBMbdMr5u0+O1NqjYzZn2iXkuqsqNwLIKIQHHp2o9vj+NP2jl7Icw7cRmH
 pm62GSyt+2QO9eb8YAc/hcWyvYchV45wwj6hvhLo/TSTDdmbog5BhoFkDarLRFu2KUET
 zyo0yOEH0pC6NQggB9xThSBznL6inRpw+wGqZJdVZXmfBq3BXSfJXIMi6t5N8DLb9NNu
 ki9SO91jylLMMePnvxmnwNY/3loCYTAdsKKkbaM9UmUPOQOb5mdiwRIpiICDr7Y0NvkN
 nipvM9lybLVCjM/C2WBfg4uC8Nb4qcoiyJQ/vqPFqLYlNOuBvefv9vq6BqD9ZVxJq8Ky
 Ltmw==
X-Gm-Message-State: AOAM533ym2bz/Zp+49l0UocV+9u02wgUE3ho27bzBQqsmeFHRrFer+ma
 1g7Snt0gVi5KmGMsx9fwXbtN8Q==
X-Google-Smtp-Source: ABdhPJyQZZwvnOXH8iGcTvvm17syi9zUdzfty3PadojeOWcZv8h2Eo+gg0GwNCSWKZwb05v69jcb/g==
X-Received: by 2002:a05:6000:18a9:: with SMTP id
 b9mr5656479wri.416.1620899190802; 
 Thu, 13 May 2021 02:46:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l18sm2292901wrx.96.2021.05.13.02.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 02:46:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 27A901FF7E;
 Thu, 13 May 2021 10:46:29 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-32-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 31/72] softfloat: Move sf_canonicalize to
 softfloat-parts.c.inc
Date: Thu, 13 May 2021 10:45:52 +0100
In-reply-to: <20210508014802.892561-32-richard.henderson@linaro.org>
Message-ID: <87wns3dkzu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

> At the same time, convert to pointers, rename to parts$N_canonicalize
> and define a macro for parts_canonicalize using QEMU_GENERIC.

You also changed the ordering of checks and the likely/unlikey
conditions which would be worth mentioning why in the commit. Otherwise
looks good to me:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

