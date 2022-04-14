Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 265565013E9
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 17:23:28 +0200 (CEST)
Received: from localhost ([::1]:56410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf1Jb-0008H1-NU
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 11:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf1Hr-000788-1m
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:21:35 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:41606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf1Hp-0003bA-GZ
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:21:34 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 o20-20020a05600c511400b0038ebbbb2ad8so3459286wms.0
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 08:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=nzvuVuOd8APxT6xk12eSnDFoyK39+31OIy6NLLO4wrI=;
 b=pugmP2UhFzUCAdwNGeEZfUXD8E6peO2LeG5XEUTMECwwmbQ8/WUGinAyrQwSOO6+7P
 rNjzkkXqx1Tw6hgMV7pdtfVArbGt/7BekGvdyT4lc3sDHaDuFjH3rEPka30AqiyLmFVt
 j2w/8oTFfAiRUwGLd5pa16vUZdBsO6sWRaBm1OUpN3AmUEJJPnKGzf5ppYjWobEhrACe
 kwqcApOBPHPuyBidzSLn4U2dT9xGFW8w4ABnxIScuQt+3WEmVvF9vfGuUfCLtNxmoHnF
 UM27U3Mb1BNiEbBV4OZDwqh8KMRbw1Xxspo5oqpfecIA3MTEE28LR+jpAFZPwiXbx32s
 PTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=nzvuVuOd8APxT6xk12eSnDFoyK39+31OIy6NLLO4wrI=;
 b=TDYCzN6Tiu1ZJh8aV730JHkObqIJX/kEVv80I0yzPKJnLkOZcVAIJ9YVfTjvLesXWC
 iUvy8Twt5xr9vDbKrXfCQ5GCqD6togjZ6+XIh5mX5ihXeuuE6l7gd9cBewYn7OUWjcW7
 +97DVka3M4fTDZlqi+vHEc4Y1nOPFRrlI7rqhSPZfqN+T86KZRbDysCEuV6UHSlPVBdV
 PjUfW/0aC99zK5m7gz77KVrwKCpkUWvhZC2nhJ9p2C0aTUmuOkhgeMZwTkQh+/xp/gPK
 G2Bhc2Z/VL9K8Fj+N8VW/+ccm9dFEHSaTL1pXJmp+S5kP+eQIcbALNJzYlwIJN+QMhtO
 abLQ==
X-Gm-Message-State: AOAM531rZvBMD9dw4by2CzPJVhj0Pdztw28wlciwKncFH23OV2J6uJx3
 VQ36McGsQdmJRyqR2qAwEEiT2Q==
X-Google-Smtp-Source: ABdhPJxygiHXHGMX+FZBdMHd2d3UsN3iLxxdSMrBJ/rVEKgBp6mJFqRkQfdV2xE0X5myCJ0bGaIPCg==
X-Received: by 2002:a05:600c:a4b:b0:37b:ea2b:5583 with SMTP id
 c11-20020a05600c0a4b00b0037bea2b5583mr4133270wmq.139.1649949692043; 
 Thu, 14 Apr 2022 08:21:32 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 az30-20020a05600c601e00b0038ebd950caesm2339597wmb.30.2022.04.14.08.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 08:21:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7F3041FFB7;
 Thu, 14 Apr 2022 16:21:30 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-43-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 34/39] util/log: Rename qemu_logfile_mutex to
 global_mutex
Date: Thu, 14 Apr 2022 16:21:25 +0100
In-reply-to: <20220326132534.543738-43-richard.henderson@linaro.org>
Message-ID: <87k0bru1vp.fsf@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Rename to emphasize this covers the file-scope global variables.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

