Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F96866E58B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 19:02:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHqGy-0004HG-MM; Tue, 17 Jan 2023 13:01:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqGu-0004EC-Vv
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:01:22 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqGt-00082R-AV
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:01:20 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso5234249wms.3
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 10:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rc7xrqQs7wfENls8fYj81BLfw6c6jPGCIPEAn0i5l70=;
 b=enz68Uf5rvcPXQEILxlNvOg3ewGoymIYd4oGdHHnAVhS14XnlnK5X2+3eELJZrqIws
 QPusGP3ceo+SNZc5dxJpG3EnsiDByoxHOkJe59Ui3OC8uTBv5qgHuitujmJknssnhYaG
 5RtMD7R12K3vjxLVNBv6Y6Rf9ao9OfO49zOzBHe01WT8Gi8uP40tbPr2rXzlQDnj3Ekt
 WctDFahPIKAtOVxFjiluBzIOP/Vef1+uXAVqVjRy4oVjo8ncjxjbs1HHyP0JLon9ZjJW
 C2oH7yFFH6g/+nZdeelwcchfj9DnU8KuUDqjoyoNjrrEOU9yBJQaziAUuW8EMxQKSbrg
 fWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Rc7xrqQs7wfENls8fYj81BLfw6c6jPGCIPEAn0i5l70=;
 b=mx3NbQbkJlzpDuHkKdjZSGDH2AaP1s8/nMXuo35UHH/1heo6WJ5U6sbPloEtRsDN+1
 qdFvzKMflbSJz1u/oMiyfACI2eS0E4FXVucbyIBAaDkhtIfl28yZIYsvxNJKnsf2LOcI
 NYNWK174XYymQo6185aB1d25r0j59k7QyDr+NirZ36nw0YFE8sFs6VpQtV2NZv2XuGZ8
 zoLqRj80kuIL+cQiVcBuzTjnlwKV2cGqOe9RqnaFd/bnsQesMSJced9NQTmzrMXvRw6j
 SxAZZxGiDDRVimPyHY1mZnaLfaW+3gS2u74JSepzyOrbws/PQ4KaHNLER6d5bMjLzLt1
 vSuA==
X-Gm-Message-State: AFqh2ko3RS8gzvpTuBJQI1LGoWxl6wm8KmZi8Tpe664bfiL45+Di/m+d
 1OcW6U1Wwtt1kU7GQz7svhTFLA==
X-Google-Smtp-Source: AMrXdXtmLIOGkWtlbYQC5G42ubuoqNjvYsZH59/xE0Bxti1E17nuYmIT4alqkL9HugSdqNLiSodIVQ==
X-Received: by 2002:a05:600c:3d16:b0:3d0:6a57:66a5 with SMTP id
 bh22-20020a05600c3d1600b003d06a5766a5mr3995301wmb.0.1673978477601; 
 Tue, 17 Jan 2023 10:01:17 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bi6-20020a05600c3d8600b003d9df9e59c4sm34469593wmb.37.2023.01.17.10.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 10:01:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 91A491FFB7;
 Tue, 17 Jan 2023 18:01:16 +0000 (GMT)
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
 <20230109014248.2894281-12-richard.henderson@linaro.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 11/22] tcg: Add TranslationBlock.jmp_insn_offset
Date: Tue, 17 Jan 2023 18:01:06 +0000
In-reply-to: <20230109014248.2894281-12-richard.henderson@linaro.org>
Message-ID: <87fsc92g7n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> Stop overloading jmp_target_arg for both offset and address,
> depending on TCG_TARGET_HAS_direct_jump.  Instead, add a new
> field to hold the jump insn offset and always set the target
> address in jmp_target_addr[].  This will allow a tcg backend
> to use either direct or indirect depending on displacement.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

