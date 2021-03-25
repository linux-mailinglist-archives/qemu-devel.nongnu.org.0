Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D453497CE
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 18:22:52 +0100 (CET)
Received: from localhost ([::1]:37128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPTh5-0000WF-6x
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 13:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lPTdW-0007kF-Ok
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:19:10 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lPTdU-0004wS-MF
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:19:10 -0400
Received: by mail-wr1-x42e.google.com with SMTP id j18so3094476wra.2
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 10:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=W52S0OUIDGdkQDhMeHjzQoTRIQAxi4WZ8WheG8pmmeQ=;
 b=CGs7tFa8VSvDesEgqbolJeAG8JAhdKItI5m3sxrCbkNvtUkOqP0NIxxcWjMzpP/pm3
 7Psv46/C3hi30fEj0qDsb+/rTFKJ8YjoH/OUvFVyqEtZk6ateawg5kwyRIl2t4CXa3ip
 nVBoF2bDzQ5KAEEpdiPsbQfkPHCj20izHn8Ovg8J0C+W5ha4hT3hOqXFYOS2iPCpScf3
 +zr/ZZdwrpHZH1cCOK6LokqXkMb+wIVXP3FroJMFSbq74BDd2nV3fpL9yn+v/jooQQsA
 HjLIT5VTHcN+LMgRK4yXJnjtIHGluL9H3tIb1jUgLYk64AL1v1VNK41oeAipAQ6CTsOg
 eHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=W52S0OUIDGdkQDhMeHjzQoTRIQAxi4WZ8WheG8pmmeQ=;
 b=aCdbuEO4anCtjhFCFEcd9PiLZ0VhWgKq3h3lKRzgyuV56r/HDOsQIRlj5N2yEl0TPV
 900TC7oSGnioHZSNBtDD1wXZJ2RAXuPgzneWN82CAZQ2whdwOQW/3mgQ89uexzUpbv2F
 7LyONRhOh7dBxTFL0ftsfw74mD6rvhpbHWTQ85pFyetmllgBm/RWJuyiHCDGzWWMr8+J
 zf0S6ayzgejSTn9JZkZjTxUcuroRzLIpFwCZt044Vx9eO6RyHhDguKkaP/jzK2mCm7+I
 VsRoLCYc0obpxEphK1EIm4YC/Eutvw7RiakKr5GgTJYuLLgB7uWGDQFVbmpo28gjK2Do
 TjDg==
X-Gm-Message-State: AOAM532uzL/KKLsVjX648pEZXQK846pljqkSc0EMV7JWEPLVDx/4QefK
 V6BgWTX5AKNpRnOiwUelk0DLZQ==
X-Google-Smtp-Source: ABdhPJyJOKUHd8h4j07EO6LSWwStI4j8b8iEzUUt0w6nAqx0Hg7HaMbKGiF/NlSWegolVjXo7l6P0Q==
X-Received: by 2002:adf:e74a:: with SMTP id c10mr10540061wrn.409.1616692747097; 
 Thu, 25 Mar 2021 10:19:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h12sm1788863wrv.58.2021.03.25.10.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 10:19:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D46E1FF7E;
 Thu, 25 Mar 2021 17:19:05 +0000 (GMT)
References: <20210323041238.133835-1-shashi.mallela@linaro.org>
 <20210323041238.133835-2-shashi.mallela@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Shashi Mallela <shashi.mallela@linaro.org>
Subject: Re: [PATCH v1 1/8] hw/intc: GICv3 ITS initial framework
Date: Thu, 25 Mar 2021 17:18:20 +0000
In-reply-to: <20210323041238.133835-2-shashi.mallela@linaro.org>
Message-ID: <87o8f7gnhy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: peter.maydell@linaro.org, leif@nuviainc.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, rad@semihalf.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Shashi Mallela <shashi.mallela@linaro.org> writes:

> Added register definitions relevant to ITS,implemented overall
> ITS device framework with stubs for ITS control and translater
> regions read/write,extended ITS common to handle mmio init between
> existing kvm device and newer qemu device.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
<snip>
>=20=20
>  typedef struct GICv3ITSState GICv3ITSState;
>

Also could we kernel-doc this function and explain when and why tops
would be NULL.

> -void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops);
> +void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops,
> +                   const MemoryRegionOps *tops);
>=20=20
>  #define TYPE_ARM_GICV3_ITS_COMMON "arm-gicv3-its-common"
>  typedef struct GICv3ITSCommonClass GICv3ITSCommonClass;


--=20
Alex Benn=C3=A9e

