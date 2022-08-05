Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328EF58AA5A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 13:52:18 +0200 (CEST)
Received: from localhost ([::1]:58540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJvsG-00064z-QP
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 07:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oJvlN-0000wf-3F
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 07:45:09 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:54904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oJvlL-0006js-A8
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 07:45:08 -0400
Received: by mail-wm1-x32e.google.com with SMTP id n185so1295160wmn.4
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 04:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=QuR4Wxk1hFuSVlv5doAEn2klc5IiwhfQaMPTahFopa4=;
 b=Z/ujZWzxXrgdXWt2+NmJ7MVAjGP/eqrGAMCgpylOCePtiBr7aoQo7KZI9i5d6TSZiW
 aOqFY9NsvJdcxsst/p4KL9pjaUA3P3U+QMRfut4jUc57kQbudImz0voBSQNp000Xv3Vi
 J+pxAXQH0uv7Y3coHsQZ12TCNsJxbLEvxiWlfXxon8gCtVJaCpytsRio0/lF+Ca0i/DR
 WvRRutm69Lnp9u+P7QWzW0VkqFeO0SXzRTjqnRgLI2lzXAsk+2q1iAO5ST3tAQgeFAsv
 KOn0MxWHrCd4nrKvipo3CfDZPbtE1D9ERZ+0QRySYDJv9MC9z2z7jQ9gZoNC2Ah2Ydf5
 g2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=QuR4Wxk1hFuSVlv5doAEn2klc5IiwhfQaMPTahFopa4=;
 b=MRgxW0rfx13pe0CinSaj//246nOahASYL5uLbY1RgA8zDc5aOjCALn4Rkhma1QAOd4
 VdTdi70u4sZZo0YTGxYUofToQfSABlwcnsTS2QVQ25r1ynKynCojTTUsPnTCVebzpxD/
 AKeTmTI1Qu0vi6hhB8jfeF9lVm3myn2jp9pgRMg90tjTt+c6kzrfas79yGnB+R+4ycL1
 v2iWkRN25hFaOJR/oTcPFNBRzaUY9H+k6N6+XSkyOrhX0UMFOJBesGfuNFVV5qZZ1mff
 410SNKrMAMe4d2cy684zNSbW+qevxdBzYNuk+8j53lsWgs3mHrxOeYatTM+tSKXwt4Aj
 gRHA==
X-Gm-Message-State: ACgBeo1MApyhmN41KqS3jubqQeDgm+SRR4kJZU0h807i4EZ56a3IsVlZ
 sS9la2Fd6MhCkMZuS+wOBS98QA==
X-Google-Smtp-Source: AA6agR4dBw/sw3TTMTponIu5X2cotBVZposDpVR5DGruyq+sjZPd/rkSonY3VDNNBCXysnoJlBH1vg==
X-Received: by 2002:a05:600c:4153:b0:3a5:1ea9:2824 with SMTP id
 h19-20020a05600c415300b003a51ea92824mr1676119wmm.80.1659699904658; 
 Fri, 05 Aug 2022 04:45:04 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r29-20020adfa15d000000b002206d5fded3sm3732406wrr.104.2022.08.05.04.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 04:45:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3F61C1FFB7;
 Fri,  5 Aug 2022 12:45:02 +0100 (BST)
References: <20220805033523.1416837-1-gaosong@loongson.cn>
User-agent: mu4e 1.7.27; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Song Gao <gaosong@loongson.cn>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org, f4bug@amsat.org, yangxiaojuan@loongson.cn
Subject: Re: [PATCH for-7.1 v2 0/5] Fix gdb bugs and update gdb-xml
Date: Fri, 05 Aug 2022 12:44:54 +0100
In-reply-to: <20220805033523.1416837-1-gaosong@loongson.cn>
Message-ID: <87zggincch.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Song Gao <gaosong@loongson.cn> writes:

> Hi,All
>
> This series fiex LoongArch GDB get the wrong pc, because the xml missing
> the register orig_a0, and update loongarch gdb-xml to match GDB[1]
>
> [1]:https://github.com/bminor/binutils-gdb/blob/master/gdb/features/loong=
arch
>
> Please review!

For the whole series:

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

