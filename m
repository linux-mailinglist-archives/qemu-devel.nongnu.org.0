Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B248037F580
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:20:32 +0200 (CEST)
Received: from localhost ([::1]:40636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh8SF-00019e-Ir
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh8Dy-0006Ab-5I
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:05:47 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:41752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh8Du-0003Xg-4T
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:05:45 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 o6-20020a05600c4fc6b029015ec06d5269so4403050wmq.0
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=c+jhpmkLq/nMVmrGPFmqj+T6xljFiOCIPQ6O2dgJ4+s=;
 b=nytHOn0xeW3K3wRHARvvVVOpKYnCArXK+4pJ/uwGwdSN03ZXmHoPVl/RhWbR45V8x0
 cNWCEdMS2/oDGrMvX6Zb0Wm7dZSpiFlfoPqMhHl2Q72xM4Jcrt95JLgbB4p641jHOjlz
 6rqbKrzqfkaXbuxYfcTaS9Aw9S7dRPrGjuH+qIJgcWvyJefYvYMeeOwx88tZ9Ce3sKvS
 GpWRyl4NpqZKscSGCQEC/3+3CzIp5yfy+QFVdpZJfyP6HdrckZrA3nOwSECWCHQIIo6+
 Lw3zU4ejYWokDI7N+vlqZVEtj92tr9XFghnmu/UqJLcdz/gK01QZq5srwLK4pIuqeNnM
 uq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=c+jhpmkLq/nMVmrGPFmqj+T6xljFiOCIPQ6O2dgJ4+s=;
 b=OVXCY6yDgqbVhGN5dg4CZsK+UY/adOZlsVj+pnmARtAsHces5fVO3fMCH2HZ6Si/mk
 ZGzUcIPcmisQpZuxqQf/ZTTE6evMSbSqb8gwHT0HQUeN677I9O3iGcMPkSBkdqKn42je
 9HJzoTvvNoa/AzSthNb2R4LKi3R39A7pzLCn2RmuSJ/BLjTWAV6NBaJZyyLTUsBIZk5E
 aBp7ES9jfU/jR8JompeTEWVkbfNugESN+n+wxbqOAzRyC+YF1WFeNZdjujur4vTVGvfG
 Rm4tnh5Aj+aIPmGQqlomJUMgO/QUpau/9T2ISzI35Qm01zU9d0+U5bgInZNQPgEPALqo
 XYLw==
X-Gm-Message-State: AOAM5334mRXa/bg5eE6o3I+vG2mnXMeTeG+sOF/+FniiTsZ/5ArHywus
 uSFA9XUqvjE+LErViTGyDzGwLg==
X-Google-Smtp-Source: ABdhPJzq+xt/igwjQ6wp28mvW6xlYbw8kdvUAq/Yg+eW1143cciif2gLqICmQhS0uwoS+Vq/aRktVA==
X-Received: by 2002:a1c:bb0a:: with SMTP id l10mr13081054wmf.96.1620900339664; 
 Thu, 13 May 2021 03:05:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v18sm2754459wro.18.2021.05.13.03.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 03:05:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2265E1FF7E;
 Thu, 13 May 2021 11:05:38 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-35-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 34/72] softfloat: Move addsub_floats to
 softfloat-parts.c.inc
Date: Thu, 13 May 2021 11:05:26 +0100
In-reply-to: <20210508014802.892561-35-richard.henderson@linaro.org>
Message-ID: <87lf8jdk3x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

> In preparation for implementing multiple sizes.  Rename to parts_addsub,
> split out parts_add/sub_normal for future reuse with muladd.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

