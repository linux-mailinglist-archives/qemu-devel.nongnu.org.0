Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF923692EC
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 15:19:23 +0200 (CEST)
Received: from localhost ([::1]:52600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZviM-000396-QL
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 09:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZvgx-0002Go-Oy
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:17:55 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZvgu-0001gt-Ja
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:17:55 -0400
Received: by mail-wr1-x42b.google.com with SMTP id r7so36391532wrm.1
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 06:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ildtr0qor3UKfG3kLBWxfKp9tP41ZaGB8GYGa+rYeKA=;
 b=B+SBdTJS9glgTVuQb+uKvH1Y0T3Ei4NdCqLKjCzTsJ/kL2yFxEYntS1dH/67/WkwMJ
 ZMhw3Mka9NTdebrmqmvvBv5gRmMHE4HiQLWXRIiLt1q67i68z9hZjHH5VJXjAvNKR7RZ
 Vy6HXR3fSlxNjJU733keRAVC6yWVHIQuFJ7sj2ObIpPWuRN1iDYzde6vslpZRR9MODkx
 zP+excV3TW4T/7D09FlgLDghYJXKZK/+DERcUYoywm7Usb7ysbQvsI/fLMucMa1c5Q7F
 P9dC/uqUwrJO/w3x2oZslJOIKBMA2tuk+yQChmszFAmuLJ8yJZgbl/ut8aDmsZIGPIIv
 qTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ildtr0qor3UKfG3kLBWxfKp9tP41ZaGB8GYGa+rYeKA=;
 b=fT3ZDv30YFElMTP6w6Y7o6gOiPo8VKSZmKJij09XSgbu/fyQrjk0TKvJ2Q6G79HEsg
 SNqvz0c/F2sZ7jJQJwOVE0c/xPlLYTbFb/3LNWVZBDQx0uRquKZiPXZ4vyuuISFDZNAB
 gQHWjlDFdjFMI6B2pSnuhrY6+Azagn7IxpmpUqkZjGiUeN3Wk5YUklpg+QTDQFSKe8C1
 K5wEJ8ccSHGOqYweY4De44galogTTtvym3jvrKMp8+9dP56Xj5JLXmDjyxuuA0RsmQbk
 CjblVmhhdGEgzXCWF353zIWrEP/R931pQW0G19STfXA82SDlKw80559A7veIhL8/oPgZ
 IHRw==
X-Gm-Message-State: AOAM530LN0696LyH38XfnfnRX/x5bqgvchbNbm6SWliNx1YuAbhIALiC
 JuhYLBt2h0GmTg+wS8l4JNXHDg==
X-Google-Smtp-Source: ABdhPJzB6jv2eAfhjUJSvGM9qCLtj6q6lRzafXotfSExGwqDE/JBiv+d32jFsbnWpTZ6wT1Hl5QMrw==
X-Received: by 2002:adf:eb92:: with SMTP id t18mr4843054wrn.409.1619183871067; 
 Fri, 23 Apr 2021 06:17:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x25sm10861543wmj.34.2021.04.23.06.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 06:17:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E84E41FF7E;
 Fri, 23 Apr 2021 14:17:48 +0100 (BST)
References: <20210422230227.314751-1-richard.henderson@linaro.org>
 <20210422230227.314751-6-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 5/7] linux-user/alpha: Define
 TARGET_ARCH_HAS_KA_RESTORER
Date: Fri, 23 Apr 2021 14:17:39 +0100
In-reply-to: <20210422230227.314751-6-richard.henderson@linaro.org>
Message-ID: <87o8e56sxv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This means that we can share the TARGET_NR_rt_sigaction code,
> and the target_rt_sigaction structure is unused.  Untangling
> the ifdefs so that target_sigaction can be shared will wait
> until the next patch.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

