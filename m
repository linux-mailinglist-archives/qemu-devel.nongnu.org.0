Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0135443E045
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 13:53:23 +0200 (CEST)
Received: from localhost ([::1]:46862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg3yC-0002Xj-DB
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 07:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mg3qd-0000Is-JB
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 07:45:31 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:38509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mg3qb-00012y-9Y
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 07:45:30 -0400
Received: by mail-ot1-f49.google.com with SMTP id
 l10-20020a056830154a00b00552b74d629aso8170405otp.5
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 04:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WPyp4BYGXDHKOf/8E+OgW/GEKVkGYPGpqOnsKNJlVCc=;
 b=OFfhmxd0iH1GET+dguuLD6pz36AAid23RUaAYhh/kOvZeZDBctc45nkqtBocr+tnMq
 aS2MW0+Z8a4gz89oagYd9hm97yfqu1qeLJKOdSst5P3KVqqksSjL9YgdLiLRquap9URD
 S4wxK/gag0CJ3wnuJufOgLFcpT3dVte28eSRSskL/9A3NGfD6KwyLjC3oTxFEdzbIWUZ
 Na5p9un5jaoxAESKO1dDuayRc8qU/LVVfUKwKiNEGvPffcjfRZHhvSo3feQfdE5zJK3M
 +tIh+FNNLZtT+nQDVftqeZ+4j1xp8MhF1rL5H74MsZPKJez50Nc56hrcVEopmzHfoHkv
 z0sw==
X-Gm-Message-State: AOAM5311CWIUMG/MgdJ6fW8p/bzB1/1PivBn+iQ3pVNjlo3n6py2Zmog
 6oG/yb69gC0Ipe4BDlWOvSkjxpF7T2+h1N3n0RE=
X-Google-Smtp-Source: ABdhPJym7QW2cq/HeZ4FAvk0lDo1PhFkw6wegcf/M+Ev5hoIQcpgIcNAY/G0AYyReF7yeYUpiolYaZ9Y/4WspuI4cJE=
X-Received: by 2002:a9d:470d:: with SMTP id a13mr2094554otf.75.1635421527982; 
 Thu, 28 Oct 2021 04:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211027180730.1551932-1-f4bug@amsat.org>
 <20211027180730.1551932-12-f4bug@amsat.org>
 <3237d86f-fdf6-dd18-4a41-f45160d7646b@linaro.org>
In-Reply-To: <3237d86f-fdf6-dd18-4a41-f45160d7646b@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 28 Oct 2021 13:45:16 +0200
Message-ID: <CAAdtpL5YdXc_oVQv4bKkjJyDskJBVTzu72+kN6xtH84zmq49MA@mail.gmail.com>
Subject: Re: [PATCH v2 11/32] target/mips: Convert MSA SHF opcode to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.49;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f49.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 27, 2021 at 11:21 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 10/27/21 11:07 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > +static bool trans_SHF(DisasContext *ctx, arg_msa_i8 *a)
> > +{
> > +    if (a->df =3D=3D DF_DOUBLE) {
> > +        gen_reserved_instruction(ctx);
> > +        return true;
> > +    }
>
> Here you have the option to return false, as you choose.

Yes, I prefer to return false. Thanks for re-reviewing patches where I
included your R-b tag :)

