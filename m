Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797696426F1
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 11:50:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p291z-00056S-9L; Mon, 05 Dec 2022 05:49:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p291w-00051u-Up
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 05:49:01 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p291v-0003Tf-3s
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 05:49:00 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 b13-20020a17090a5a0d00b0021906102d05so11039845pjd.5
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 02:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QWn3Rageux2GFolfj9dxS9GOExPw+EEyk9YGK7M08GI=;
 b=SqmrI0hlNEdsreMgMoDg3aWHv+iq/FLpgHeaTmo9aGLcwusvRZ14hNdmvrv9htmfYo
 lNIpoI3Dy9l/B2eVhBWeMkOw/0+YFlRVD4Yxzm/O/y38yMsUN+y/HxTyFfD5TxNlglFh
 s6EqkpNajBOYVRBNpQ8EOplnZmVnrDAdO0JxOxDR0UQl63N517+wFuJT7O0YmULAMWW8
 1TxCh80/fxArktqDAGKmQqBoUJADdyT3vkdNcsLdiacKQ7S70c7fO9BW+5Sx/EAg5ZVY
 obIsELEVZjN9xMQ4sa9vwCb1h/C3T2kSOB+dXLw0/Wu8YhWSS084af3TjhH7GVhWnT8J
 l5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QWn3Rageux2GFolfj9dxS9GOExPw+EEyk9YGK7M08GI=;
 b=0jlc51E/bdbTW7Iy3ZrE68pk4V8kJcCBg0HI4lCuUkfDg+cZ5zjRBX3fc0wRgoTgyb
 zLJZezfY8WxTf+PcRsQYA/wgOYUA8MnWGIBX5FysjPqCfRWT8SzUdmCOOxFZcDTT6uDh
 B2MpPWf3WcgIUBTU9AiT/8mdHikLw3Tnloq2hU5Xtgg2KL+LqEx9UjccZDootV1bn0/g
 8EFmmpMpJuBzPJiMWszHLTdKoak9wKcJW/YETvB2aLPyvYH9RHMvHGVnWsabN/q96+LO
 k/IKlOYhZirc/wtb7tE2ooxjuum7ZPavXtP540XmeQZhr9inV+zUnSGXsnD1UIzwuqZL
 o5xw==
X-Gm-Message-State: ANoB5pkdaWwtvjSCRBY1lpRepgtloQXGhukWEB+GCEZ5FrJoD74j42OV
 YlYtUnY2MrBTtDpT5w6mT6xsC1Pc6+l4MqPUnFrAnw==
X-Google-Smtp-Source: AA0mqf7N6ur40au/NrumQi5WUHY/krr2G6DHWZDcQZpji378JncRkllALd50kP+ggTL4cuAvrAy6f+FehsmQLh8gSIQ=
X-Received: by 2002:a17:90a:ac0b:b0:219:9874:c7d3 with SMTP id
 o11-20020a17090aac0b00b002199874c7d3mr13597900pjq.221.1670237337388; Mon, 05
 Dec 2022 02:48:57 -0800 (PST)
MIME-Version: 1.0
References: <20221202102550.4107344-1-gaosong@loongson.cn>
 <6fe3e752-a39d-38f9-e573-437547d19179@linaro.org>
 <72f22429-d51c-b2b8-49c6-59ba7df17ea7@loongson.cn>
In-Reply-To: <72f22429-d51c-b2b8-49c6-59ba7df17ea7@loongson.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Dec 2022 10:48:45 +0000
Message-ID: <CAFEAcA8Tep6GrSwoTSUi8Jjs2ntAqU_15nfe4DD=fZB2P-mp0g@mail.gmail.com>
Subject: Re: [PULL for 7.2-rc4 0/1] loongarch for 7.2-rc4 patch
To: "gaosong@loongson.cn" <gaosong@loongson.cn>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, richard.henderson@linaro.org, stefanha@gmail.com, 
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
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

On Mon, 5 Dec 2022 at 09:20, gaosong@loongson.cn <gaosong@loongson.cn> wrot=
e:
>
>
> =E5=9C=A8 2022/12/5 15:24, Philippe Mathieu-Daud=C3=A9 =E5=86=99=E9=81=93=
:
> > On 2/12/22 11:25, Song Gao wrote:
> >> The following changes since commit
> >> c4ffd91aba1c3d878e99a3e7ba8aad4826728ece:
> >>
> >>    Update VERSION for v7.2.0-rc3 (2022-11-29 18:15:26 -0500)
> >>
> >> are available in the Git repository at:
> >>
> >>    https://gitlab.com/gaosong/qemu.git tags/pull-loongarch-20221202
> >>
> >> for you to fetch changes up to 14dccc8ea6ece7ee63273144fb55e4770a05e0f=
d:
> >>
> >>    hw/loongarch/virt: Add cfi01 pflash device (2022-12-02 18:03:05
> >> +0800)
> >>
> >> ----------------------------------------------------------------
> >> pull for 7.2-rc4
> >>
> >> We need this patch.
> >
> > FTR this is not a security/regression fix, but a mere feature.
> >
> > Certainly not justified for a rc4 IMO.
> >
> We hope LoongArch 7.2 version support pflash,
> otherwise the subsequent BIOS support pflash may qemu 7.2 does not suppor=
t.

Regardless of how much it might be nice to have a new feature
supported, new features cannot go in after softfreeze, only
fixes for bugs. At rc4, changes should really be release
critical bugs and regression fixes only. Further, any pull
request  that should be going in for rc4 should have a clear
statement of what the changes do and why they are release
critical. "We need this patch" is much too vague.

QEMU's release schedule is regular, so there will always be
another release in 4 months time. There is generally no need
to be in a huge hurry to get a feature in.

I would favour reverting this change.

thanks
-- PMM

