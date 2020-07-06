Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D515215815
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 15:12:44 +0200 (CEST)
Received: from localhost ([::1]:50532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsQvL-00068a-0I
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 09:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jsQuZ-0005ZN-J2
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 09:11:55 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:38026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jsQuX-0008H4-Ti
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 09:11:55 -0400
Received: by mail-ot1-x343.google.com with SMTP id t18so18774506otq.5
 for <qemu-devel@nongnu.org>; Mon, 06 Jul 2020 06:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HJZIVMbh85zgg52/dXzLSk9awQ2Rxw7e9TOEaFxQrWY=;
 b=OUO8+X50b1mtJ322j/BHoRQm/GBGdEN/GDdaeN3LvH5ZMm6dEbTRCZdCE3lq1SnYfM
 D9slxNF1DnJN72rwOpMjufmFI/5dLPU93/o3E8r/MfjvCzJIoIwHNyoOAUTBzEIDQNpO
 dFx3JZWDooRVnFAkUy7wSVTCa1JaRLq9nO9EVnWP6oSr0+Tef5bGc51OjnocKzeTcOwg
 ViW76joAMWl2yIabdnOxBW7EECux5H3SumdL4M8b+cOdsJrY+1thqb1/OYXS5hZ/U2s/
 aqHKemXn4OELDolnPRTTAGJJ3mdp64MAjL2xKtiBBHyw9QkkIAcUo8+5AszF49kAgeMl
 0IVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HJZIVMbh85zgg52/dXzLSk9awQ2Rxw7e9TOEaFxQrWY=;
 b=YD7q0h+3WeRYINhsYRtqMmiWiJc895XhmKyeoqfwTjpss+1ZaP6zpP5Pr3yAVNFmBW
 S4+FcQ9KSGVtB03Bcdx/Rf2HrXc3wwDIV2zb6ZK64kjP10Nkf7oMNeGq+YTSEDG3bHqS
 to1BuCZekuuweFurQRyr0AzKNTIXQBN6Pxm27BCLAyy/aMx2g503OPR3FbkFytLhngaM
 +h7s6nj5q0LfHnPO8/6+7rUfBMLbuEY2s9OVRPmEY3uZ3x3E+eSwhqwPt3MfrzWgiwR3
 W5+r7lNGQq916hc6HnnlMiPFNko0Rn8MtBS/25d9XkDny0S3yxI74L9nnM/bELMPe3mY
 0PNA==
X-Gm-Message-State: AOAM5323l4UERO/4eI49Hw7x3D/7R5Md7S+SdTB3pVvz6WC7sY7XKj+F
 54o7apOXuTTF/wFHZjsRkpoyl1s+JcafxLjlnlaywA==
X-Google-Smtp-Source: ABdhPJx2g1zEZ24WYC4Bn9zOErerNXkbcOfrMc5owligAdP9nRWRXmsWi17mgCS+MdM+yf3sw2KU8oyB07zZGx3yeXY=
X-Received: by 2002:a05:6830:10ce:: with SMTP id
 z14mr33885658oto.135.1594041112393; 
 Mon, 06 Jul 2020 06:11:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200702152659.8522-1-eric.auger@redhat.com>
 <20200702152659.8522-2-eric.auger@redhat.com>
In-Reply-To: <20200702152659.8522-2-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jul 2020 14:11:41 +0100
Message-ID: <CAFEAcA9JA5xe4o_7C71K=hVDeCyno20WPi9mc-Nc+m6jvXzhfw@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] hw/arm/smmu-common: Factorize some code in
 smmu_ptw_64()
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 zhangfei.gao@foxmail.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Jul 2020 at 16:27, Eric Auger <eric.auger@redhat.com> wrote:
>
> Page and block PTE decoding can share some code. Let's
> first handle table PTE and factorize some code shared by
> page and block PTEs.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> v1 -> v2:
> - restore goto error in case get_pte() fails
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

