Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1707A35820E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 13:37:36 +0200 (CEST)
Received: from localhost ([::1]:39790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUSyc-0006l5-Lk
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 07:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUSwy-00066g-Le
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 07:35:52 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUSww-0007Nw-8a
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 07:35:52 -0400
Received: by mail-wr1-x42d.google.com with SMTP id x15so1780652wrq.3
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 04:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=AOgTsYk/lMZKs5bOg679Cerve24dG0Y88YnNn0nfUvM=;
 b=x8tLkCWxIb9aH/pk0IP2IPPOhzTkPK8QTbKLuxMw4mop+Se7fQCfsTOnoMAtDALbf+
 oXg6aUnoxHpL9aZ5HnTb0H8d7fvLdf1nfailHP3tzyYGx5TFxhH+bDS5BeNGR/xkU77m
 54VHAHyPK5uuRXmovkd5uLcve3tmqVdUyZGVEpl3XEm6mNJKIV+7h6VQRiDMcFbBEFxJ
 M2BwMMaGrx+sL0h1gr8BFS35M/0UbIqll1J0QFUBsVhHrJM6LoN1w0Uqt89VpqHMs46G
 iFXuB0P8Dhi5tJt2Rh7GK7FYzDqKdh0LuGeP75OicZx/oTLYLkQk30b5YYL7c3FdUbIz
 q6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=AOgTsYk/lMZKs5bOg679Cerve24dG0Y88YnNn0nfUvM=;
 b=CmF7yOellCyUV36alQg2DwofANhWDmBlWPx88CLo/Tk5v+MMIHwiQ4NcSFkCL7b9Z4
 bWby4gxblDk7qDaB/tkZRfYwkMB1y8Bbtbrhq63g9u9qZxFxx9ZaHAxT7MKPYhXZSo3q
 ckRdDFlC76gzZr5SmAYhY+0soFxQZOmIHPMzkWCeg6hya8hLCuKf3ueIhbFrf8oaZ2IV
 HaUnVCh+CgQnNUMIo4l0ADu8LAA4m5XS/10qwUsjxYhVbKuG69HY/aq30MxRyGL9PpKF
 rQeFnafn/34YF5TUxIJHVKzUUBL//O1Us5F5zIK+k/63PTZYyNOdyLO/1Z0szSdGkGyt
 Qsnw==
X-Gm-Message-State: AOAM532vrmljt2bZ7Iw2GjJ2RfBnVhIWedDEg0b4dI0FRVu/Rciekm55
 3sie2SL7i5mIKNYMm+vH+W1XuQ==
X-Google-Smtp-Source: ABdhPJxJpnoe//nSeKwLC2NsJMbVfqiU1mPyf1ttq1GDAsOXLAlwCiNXPVo+nGg0DBOtIUojbNdqFg==
X-Received: by 2002:adf:f3cf:: with SMTP id g15mr10624403wrp.414.1617881748805; 
 Thu, 08 Apr 2021 04:35:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d5sm25528330wrx.0.2021.04.08.04.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 04:35:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 372D51FF7E;
 Thu,  8 Apr 2021 12:35:47 +0100 (BST)
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-12-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 11/12] target/arm: Remove log2_esize parameter to
 gen_mte_checkN
Date: Thu, 08 Apr 2021 12:35:40 +0100
In-reply-to: <20210406174031.64299-12-richard.henderson@linaro.org>
Message-ID: <875z0xt3e4.fsf@linaro.org>
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The log2_esize parameter is not used except trivially.
> Drop the parameter and the deferral to gen_mte_check1.
>
> This fixes a bug in that the parameters as documented
> in the header file were the reverse from those in the
> implementation.  Which meant that translate-sve.c was
> passing the parameters in the wrong order.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

