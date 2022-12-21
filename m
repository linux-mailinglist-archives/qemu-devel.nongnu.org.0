Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9F36535E6
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:10:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83Ve-0007cQ-T7; Wed, 21 Dec 2022 13:08:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p83Vd-0007am-G4
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:08:05 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p83Vb-0005Pv-SI
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:08:05 -0500
Received: by mail-pg1-x535.google.com with SMTP id f3so10921542pgc.2
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KbeiX2bv6GyuB7fLpuy81IYAd72dAC2S/4gK1XBZDqI=;
 b=NvmuGmT6YyCzg9ix0dg95HGv5Cubt6n83qj+mJjF/sIMdvFfdqv130mwPMPeuy/VWR
 wIAkdbvTLQDzE+Z6jpJ9wLv5u34BwJTqvpZJ6v0MIGBsWtlN5XoyHLjvtxcNiU8HivWE
 AJVyxWuMmuC9KrnvT0uZtKmQcZuu7s9vzkaAbKLDn5Lm4rPn3wVsM1qtk7TuqChOzBcl
 0H6sQcAahF92cfbl5QgvPfw54EXjNT6VXbg44MSYRh+0g1W8+WAhKX+7phjkcaRSjwnq
 1jAGyoGAy0dX+aoYlPWaXGCwcX6uSpaYUH0WTso1wXgike1DYOsPg6taRIArg7HQKnuG
 trTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KbeiX2bv6GyuB7fLpuy81IYAd72dAC2S/4gK1XBZDqI=;
 b=wVvmepn6WzsvDLxiZC9tHTxJrCu6O7eBIMyNhlEIOkXKeTnsWZ4+/6xuGMlVEKngZg
 iBjmCIuwPllFSdhIwnqmoI3JRAgaHtXuak1OlfiHv1FtqqlNBDDQsa7kTYUZF5JLDqom
 rzNoOIt279seESOyankwx8Tze3Z6V1c8VNGjnnqtnQmiTxiewdGrEwEJxAKyUQd91rIL
 Otx7KjE6K3e1/OYRF/mherOK3P0eWweuTc459RDqcWjYQNU+Eln1n3HvnqhsyNXgo09S
 E58rXDOuxHWnJstIUqFJJBhVVu6jqOQPQirD0FxMoJNPL7Q7QPDEo0u3xjOC+eqh2S4K
 sFKQ==
X-Gm-Message-State: AFqh2ko8yzpv25Uu+6Zi5cxCBAQRKPOUGU23x+LMB8oHdxJTu8sxwubN
 +gJrdz34amlEtgFVkCsqcEEls2SKnigd9E+e6dRqkA==
X-Google-Smtp-Source: AMrXdXtStMQL7Y9kdhQhpfc7a+0OyVD+Q5Ap1HPw9iHx6ovEoJTyPmMgLeon4eTBZcvn1Midq1cpplWRYmhFM793LWY=
X-Received: by 2002:a63:e20b:0:b0:479:18a:8359 with SMTP id
 q11-20020a63e20b000000b00479018a8359mr158512pgh.105.1671646082299; Wed, 21
 Dec 2022 10:08:02 -0800 (PST)
MIME-Version: 1.0
References: <20221221130339.1234592-1-mst@redhat.com>
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Dec 2022 18:07:50 +0000
Message-ID: <CAFEAcA_C+JCisCQivezG49WncamqLVOEqQ3OD5ycqAGsCXCjng@mail.gmail.com>
Subject: Re: [PULL 00/41] virtio,pc,pci: features, cleanups, fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x535.google.com
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

On Wed, 21 Dec 2022 at 13:04, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit c15dc499cc22f4a71639e42e36051e118761c25f:
>
>   Merge tag 'pull-misc-20221218' of https://gitlab.com/rth7680/qemu into staging (2022-12-19 10:28:57 +0000)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to 87d67ffe4f7e4faad9fa5bc7129ca91d314677ed:
>
>   contrib/vhost-user-blk: Replace lseek64 with lseek (2022-12-21 07:32:24 -0500)
>
> ----------------------------------------------------------------
> virtio,pc,pci: features, cleanups, fixes
>
> make TCO watchdog work by default
> part of generic vdpa support
> asid interrupt for vhost-vdpa
> added flex bus port DVSEC for cxl
>
> misc fixes, cleanups, documentation
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

