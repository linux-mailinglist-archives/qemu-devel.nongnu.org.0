Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B534336AED5
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 09:52:14 +0200 (CEST)
Received: from localhost ([::1]:34784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1law2N-0004pR-IY
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 03:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1law0W-0003j0-RG
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 03:50:16 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1law0M-0006al-UT
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 03:50:16 -0400
Received: by mail-wr1-x42f.google.com with SMTP id h4so45672088wrt.12
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 00:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fJy3fb8xMMUq7o8n4LIIz1JxACtjeeuertyNW5LUwGo=;
 b=CmyNdPGgMzCB5PQlLtLUU2smr4tan4x9O1j64p/ZLP9UFHNgezgvCreiQXonqibbE8
 3TyFXyjUItWZsIba+5fRe+3tcF/CJZrT3cH1PiJVRw+Xvr5c4quj+GRPbFN3CRuaYtZA
 4Cra+DaWnv74Dpjkep+pL2IOYHwvEcsVpmM/y+K/krUa93HlaK1akukYhKxgIf9OYTdA
 0cNb0x2Iubh4gIzS04JM2luhq16L5oArT7kiLr25mguB/eM26k6KMrgc3ed6ZD7tqbdn
 KU8by8Zx81xgOK+UwDl6wSBBdhhfrGEle3TraUeflbgIsyFFNJmyW5R9UFDSj5dGsMCV
 f0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fJy3fb8xMMUq7o8n4LIIz1JxACtjeeuertyNW5LUwGo=;
 b=naA9pm0SY/a2W/LYumA+JA/1qlombUdx5rMvfi4iDaMrX+yBzoRb8LWn1b52b11QXa
 z1CetJRqdflmqwrzweT9PVDiGw6V+0UGojj/gKvl5Kc2nqWXvSBLOtT+qpi50q2PEYOx
 ZTooRMSE1YsM94tY+bHlObZrVnCS854r50+EyhfliM/r6Egt4pYtrkoTWmY32si97nbZ
 1/BgFNSpMMA889O+sdE5J5rWww9GOPXRq2FVlHioWiUB6yfW62L41vjUH6QtIPdGa1xj
 tkUX5bPrw6ph7C0T+ZgELiIOctLIRD2jZ4qRI84QkdRd3TIcJXrrNdftL+9HZGYnMKJN
 WfFQ==
X-Gm-Message-State: AOAM531ZCI4unVghOS37msUmYMS1YQuN8yP6S2bvLeJkgWeEc7BByWY/
 AlO4GMlklhXZf0ivGMpt+my0zQ==
X-Google-Smtp-Source: ABdhPJydm7E77OBju5EecXX+4wJQzhZyjQXln9n3WSYGImNfRVhp4hQyM9wi5tjcVF9PuPds3x7hlw==
X-Received: by 2002:a5d:4e81:: with SMTP id e1mr21375010wru.305.1619423402232; 
 Mon, 26 Apr 2021 00:50:02 -0700 (PDT)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id f7sm19585971wrp.48.2021.04.26.00.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 00:50:01 -0700 (PDT)
Date: Mon, 26 Apr 2021 09:49:44 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 1/2] amd_iommu: Fix pte_override_page_mask()
Message-ID: <YIZwmNrcYu7pzj9z@myrica>
References: <20210422222429.183108-1-mst@redhat.com>
 <20210422222429.183108-2-mst@redhat.com>
 <CAFEAcA9LLh7kkqujLpiXjRgRkua77kLAv=MbeG8yq3NP-w8uyg@mail.gmail.com>
 <YILNH1DDTTV6TcFO@myrica>
 <CAFEAcA8ijMSO=fEtn3GUGaumMjncz0hDv4e2O7XFSmMXDSiTjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8ijMSO=fEtn3GUGaumMjncz0hDv4e2O7XFSmMXDSiTjQ@mail.gmail.com>
X-TUID: gHv083ZxxocX
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 23, 2021 at 05:11:33PM +0100, Peter Maydell wrote:
> > > Jean-Philippe, do you know if this is a regression since 5.2?
> >
> > I don't think so, I can reproduce it with v5.2.0.
> 
> OK, thanks; I think I favour not putting this into rc5, then.

No problem, please let me know if I should resend after the next release

Thanks,
Jean

