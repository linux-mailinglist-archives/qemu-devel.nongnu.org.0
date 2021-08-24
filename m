Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8783F62A3
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:25:22 +0200 (CEST)
Received: from localhost ([::1]:33864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZEn-0004a8-7U
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZDA-0002l2-JP
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:23:40 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:35602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZD9-0003PE-4e
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:23:40 -0400
Received: by mail-ed1-x536.google.com with SMTP id q17so10671129edv.2
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 09:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HnvST3rWvBzIQT320VfXVgrdo6HcwTsGb5wAOAoBRcs=;
 b=e69BFQwE4E0HujP/XIHMynGmr5BH4DFih26xL3im7NolN+eS+Usk8H6Rr5kFhtgl8n
 BH73o95MnF+ptFm8bDNyVpRMRpvEeL6jJFOVajpzNwkgFCG22Yar9diMSVouZhPe/fCH
 VOxJejnOpH7AqB+0g2X54zSHklMQvp1XBuX79uhLd1XF5MqFe1KIMSf/KbTJwujNrLLo
 Q+sOBTbQ7S8MfgN7P/VEJ0y4ccjDs2QJEH4VALC5jSBkfZK2rR+aSVNBDVzD9P51B96w
 BagdxtMzHauvVy3eOXmMXAGVZQQP9OtCaq2rFrHy0Mt4dm2L5nIbVJGNLak+vIIn4YwV
 dK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HnvST3rWvBzIQT320VfXVgrdo6HcwTsGb5wAOAoBRcs=;
 b=La/SZppeetYnxDf1iG9Ob+yuRGZrsFoh4j4XpaO1eeErQpBBKmH73lC/+f5/BAMCC3
 FJErz+KHNboaBLOr+0YkHW4nGw3iE5r2G2PrUPdqq1QFuhM9c1oOtGTtl2CxDoWPmxEF
 UFo0sibNtiPYj0wLzFXiedJPfUMYu3aFmkOUut/EWVVXPgfspTuan6IfBw+fNFCN2xzD
 jAiSkALjwYz9V+F624y1b/Yi0jTsxHHCMUon8SesGgMAvCPNMJKluNInGI7lM9l1o9MV
 wBi7YiHMpsTvSGZey+UDdsdsECkgR5szW4M2cqQJLCMLvhCI/ZLHW/YFX3mY3m4l1lDO
 c+yw==
X-Gm-Message-State: AOAM533PFSHaM8SzX4EFvOQXQsyrPCz39gdPcDDcMTc//tIqSx54KB6g
 95ZowB+oYNcfG5X8eQhVe6KivWZhoyNy+0BOh9jhXw==
X-Google-Smtp-Source: ABdhPJw0KH4umEvlXbUCw4P6Ehys2MDwE1XDA0pzPXxeEhsANWTHnoHtnTaBOA4VFlgjlDT+cTkksGQlM5vOsp0OPRs=
X-Received: by 2002:aa7:c0c6:: with SMTP id j6mr33024190edp.146.1629822217744; 
 Tue, 24 Aug 2021 09:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-11-richard.henderson@linaro.org>
In-Reply-To: <20210822035537.283193-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 17:22:50 +0100
Message-ID: <CAFEAcA_A88XzWcpM+dzWOBSxn91jQQ0Lssp3rXyXrs7NoFuYxA@mail.gmail.com>
Subject: Re: [PATCH v2 10/30] linux-user/alpha: Set FPE_FLTUNK for gentrap
 ROPRAND
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 22 Aug 2021 at 04:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This si_code was changed in 4cc13e4f6d441, for linux 4.17.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

