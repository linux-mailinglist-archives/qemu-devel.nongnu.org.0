Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BF62ED5CF
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 18:40:43 +0100 (CET)
Received: from localhost ([::1]:58050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxZH8-00046y-60
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 12:40:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZ7f-0004km-0x
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:30:55 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:41399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZ7c-0008CK-R4
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:30:54 -0500
Received: by mail-ej1-x62f.google.com with SMTP id ce23so10771689ejb.8
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 09:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XPChYwI2dOSROoKMEYFCOyPjg7Jz24QfoucKZSkYR58=;
 b=zXk+IbqQym10C69em1Men+EwdhaFXg9CcRB9ZDedUJpkKS20XYRatjdskcXWeM3Mg2
 CI24LFm6xxM3OqaJsotud3MWeRVhGn/kYH68fIZp5LOIdN+t2F5jVryBn9OPZIIFGz2p
 6xdZgxuUVy2jwwNoR/ROUiGWpoSWUmgsx1rM/VQkUnPTrUHHfmdZi0kAxv7Gm1yst5SE
 +rUbxlEpNYGAr7EcHgNJDj9Wrdj7lJMZh7+mYTXXd3bYaTmJLWsxDkimLRc4f/NgPAbj
 rvYhc6y7AzcTw64ztcRQh7wXzKxQnl5S/BboFSGM5b3jn2lPilCvkfmQZgsAoeXK3OML
 QGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XPChYwI2dOSROoKMEYFCOyPjg7Jz24QfoucKZSkYR58=;
 b=gUg8RRfT8znWBYmL//6eFRxZOjJyUKVwo+Qhyo5Sq70wpc+OLShG2i5OKae8boASmR
 I+KTr3WckLfgNcnvTiX2dxI+cpQiaQWGPIk95VIpijv6SPsoRNtMSqg0MtRJQUv9tI3R
 pHGyu8sICCPImtAb3O8dFH7iornWuKirTdfLm1oANVk6crqmvnIhEmZ1FoAxSpFH9UWe
 R2ppuMen/WAWsnM/bhxebVqWSJv96x90o1vSxGgCY4mzoiTtEwFBBCiYm8ZyXoxJ0H/2
 Ex2q07Z70kM+edv+oTHHKvs07GDfCPRIV2F63F/uiOgFcffLENEMrN+R8vNK8NRkWme9
 b63g==
X-Gm-Message-State: AOAM533Ocrsu90u+Jnm9mvL0uYOvui6yrTHQQcU7N4SKpkzvtsuq/+FE
 exKLZq3BlcMt8f7q0eYc28MffjQCvJso2Xr/TAj7uA==
X-Google-Smtp-Source: ABdhPJxlFilaGJIq7/hJNRDWFuUH/Ou7MuZ2ixntWlRvIjbP1h6Ort0Ur0qUPgJWzGNr1+PMmv5EBiDFrRo61WczJSc=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr6978905ejf.407.1610040649107; 
 Thu, 07 Jan 2021 09:30:49 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-19-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 17:30:37 +0000
Message-ID: <CAFEAcA_YZRZXjfH-dY9x7zJkkeDOfpdTbqwH1QZxb1EhOzA7Ew@mail.gmail.com>
Subject: Re: [PATCH v2 18/24] target/arm: Use finalize_memop for aa64 fpr
 load/store
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For 128-bit load/store, use 16-byte alignment.  This
> requires that we perform the two operations in the
> correct order so that we generate the alignment fault
> before modifying memory.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

