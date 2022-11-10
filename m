Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F51624C2E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 21:52:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otEVv-0007p5-O6; Thu, 10 Nov 2022 15:51:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1otEVu-0007lq-Bo
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 15:51:06 -0500
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1otEVs-0003UT-UC
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 15:51:06 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-333a4a5d495so26739097b3.10
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 12:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tPehdSCdLbP2/WnizRK4fDTWbg268LcHnDEfIRPYeBo=;
 b=I2Xvn6yJkPQvq0ebrWQGn4+svBEoTFrTN7K212D1eTZk5kP4XPgKKDUbFZ+2pK5AWV
 PtJYfmQwdRtc68hwdBYav/KM2CpwIY6Ynww6ZVuOBAyG6KNqC9aGMOc3Q5C8I1bwBS7l
 64WKZ/r9EPMovkB4Nrw/hVBCbpnUPfmR1zwjcwx6QU0YJCyODR2CsZVt2xAb/DBEizSj
 8Ivmwu2SHuBQ/cF27uMccgmaHrQxe7eZCppo8h02vwpH5mhrbF876urPZcmG6uCsi5dQ
 EoEDV5rwHwwGhV09YmblFBaImj//YAdp4BRdv4EJzPc+d6HUNbksPsfKjk0owqVEFwoy
 UlpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tPehdSCdLbP2/WnizRK4fDTWbg268LcHnDEfIRPYeBo=;
 b=VCzyZ6dm83rQkpAxihs8ClyB6o6+dBRIJ42R/dBrqVVSeUR7wH2TGsGld+dFgbhjmU
 XJfkOQpmckfq0Q6gz2lqKm3f58ss2YYJyFoDDfmTP0SQTMv4TSzrAzTqr65ZsrdlWWHw
 4b1TBR8A3QA8rnyoGtAGXKBoFn37/UMmZKV4RlZMd9h1pjmLB81JyPXKS90Ya90F4eOe
 zeFjFpmwcsl9f0onRAX2Le+6KCcLOW41OmzlKQlqO4SYabyhIcdjSA/AMiOdakfaJdze
 VWp/VQmyl+KtURlccXkM66BTXeoPqUIzeZdTX57Ce5FWkV3QlwNOx6PjR04/d+7iJxRP
 51IA==
X-Gm-Message-State: ACrzQf3S0XpHk/c4iP2TnmeizaprbCBYAQOBHjjHONKLn0v6Ztklxh8A
 XR85n0uZW67nsiRJsaFu9c7C/BdaPNmEnNYAx4g=
X-Google-Smtp-Source: AMsMyM4Q1e6+vZAicY3BQFxaXnmIX+mEyr/y7hCxsFzMUO+qp6B2BxBcBNGwnyiYD1lnOyetZ7ISGzqOiYPwVnOMMM8=
X-Received: by 2002:a81:6d06:0:b0:36f:ce83:4f91 with SMTP id
 i6-20020a816d06000000b0036fce834f91mr64701085ywc.156.1668113463626; Thu, 10
 Nov 2022 12:51:03 -0800 (PST)
MIME-Version: 1.0
References: <20221028191648.964076-1-alxndr@bu.edu>
In-Reply-To: <20221028191648.964076-1-alxndr@bu.edu>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 10 Nov 2022 15:50:51 -0500
Message-ID: <CAJSP0QXf3ZiNOQc7ok8Wq6C5np+Q7SDuXu6jmuMivxq6RkGFQA@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] memory: prevent dma-reentracy issues
To: Alexander Bulekov <alxndr@bu.edu>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Mauro Matteo Cascella <mcascell@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Preventing this class of bugs is important but QEMU is currently
frozen for the 7.2 release. I'm a little concerned about regressions
in a patch series that changes core device emulation code.

I'll review the series on Monday and if anyone has strong opinions on
whether to merge this into 7.2, please say so. My thoughts are that
this should be merged in the 7.3 release cycle so there's time to work
out any issues.

Stefan

