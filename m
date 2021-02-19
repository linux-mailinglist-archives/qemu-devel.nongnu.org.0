Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8C031F74D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 11:29:12 +0100 (CET)
Received: from localhost ([::1]:54902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD327-00020C-NN
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 05:29:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD30j-0001Nz-PB
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:27:45 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:38040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD30f-0001LN-Hq
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:27:45 -0500
Received: by mail-ed1-x529.google.com with SMTP id s11so8954221edd.5
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 02:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xxf1QKe3ut3tzPuvp0w26lLXcC+ptqKFYk/h6SOZdDo=;
 b=drX/Zw0+77ap47Flp2MEITk30s4+U4OhVo4/c2rhRbjJMoG9eYQjLj4kaRrAdQStWW
 eDVP0pSkRul8ijnFsBu5PaFFd18CZWTTXAAZ2wrXAz9WL2wGB8nNycc4s0C6Z0vNal+P
 T1Yl6deXA+HC4O9KPg6iJBB5WxwV+3dPNcW5dtqPQcPQqDdyHdjFqymcr1Atv7vQWH9M
 JzyHRO3N8INIH4iGXl92/lLuN/2SFsO87fhSW6VOY2sWq/v4yQMTKn2NnnyzeEYPVgC3
 n6HLj3un5/fY7j9CpSh5SOl4aLpfUJA6jFoQgeFBoyq9tv1NR4oXKfVINOyxW24iKr59
 dTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xxf1QKe3ut3tzPuvp0w26lLXcC+ptqKFYk/h6SOZdDo=;
 b=H183lyLPz4WPAEyI+caGa3f/E4GyMWDlycKh0v9zyJubHK8XK9CufxP8vfZkls3o0E
 q6tpXqCVtkOZ/sdCKrElV8i7h/9vuHmtwP4pW3S0xHSEr8XgxDKZwO/MJK2QfZf9v7og
 nsr1Ssvxt4VhSMDG+JZ/kgi5YmO2qqxHO6SyTNreBch1HoigPOQ2MRlt1BWjp5Z0zxgH
 1NH63FRdW2b8FvAaDFXnqcfAmtKYs3GvqWJNk8ZlN207XWDzzO68dNoFC6ahFzCQM94g
 IDUcxaZAamgfz277lbieJRaGlXtbMmIjWtdwcK43bMl1g8qGO6jl/AhwC2Cyf6/qup6h
 /2/g==
X-Gm-Message-State: AOAM530GROBvXRSuhLZo5pCw3o+qouD5VFFmqdQi3YTuXDTlZC9ohsJ6
 tCx2gQki/acOBbt2jvXmfJ4nsWltUW/UAhdEnmn/cA==
X-Google-Smtp-Source: ABdhPJxJPygLE6ErtkJyHGajf6INP5JyYMde8x1F1PM3o2EXWjnhHcyK+xBWVoHLrls0UC4XkOf55D4ooQiYOFej0/0=
X-Received: by 2002:a05:6402:545:: with SMTP id
 i5mr4984618edx.44.1613730459992; 
 Fri, 19 Feb 2021 02:27:39 -0800 (PST)
MIME-Version: 1.0
References: <20210210145258.143131-1-ppandit@redhat.com>
 <20210219030449.x25yxp4x6myblm2y@mozz.bu.edu>
In-Reply-To: <20210219030449.x25yxp4x6myblm2y@mozz.bu.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Feb 2021 10:27:29 +0000
Message-ID: <CAFEAcA91BGArmMQcgS4rbhWgPBkU5K=K7bfxYL35AY+bjTKNUQ@mail.gmail.com>
Subject: Re: [PATCH] net: e1000: check transmit descriptor field values
To: Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>, Cheolwoo Myung <cwmyung@snu.ac.kr>,
 QEMU Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>,
 Ruhr-University Bochum <bugs-syssec@rub.de>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Feb 2021 at 03:06, Alexander Bulekov <alxndr@bu.edu> wrote:
>
> On 210210 2022, P J P wrote:
> > From: Prasad J Pandit <pjp@fedoraproject.org>
> >
> > While processing transmit (tx) descriptors in process_tx_desc()
> > various descriptor fields are not checked properly. This may lead
> > to infinite loop like issue. Add checks to avoid them.
> >
>
> +CC Peter Maydell
>
> Is this a DMA re-entracy/stack-overflow issue? IIRC the plan was to have
> some sort of wider fix for these issues. There are bunch of these
> reports floating around at this point, I believe.

I have no idea, because the commit message for this patch does
not describe the failure in any detail at all and has no
links to any bug report or test case for the failures it
claims to be fixing...

-- PMM

