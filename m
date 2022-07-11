Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B8F5708A3
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 19:07:29 +0200 (CEST)
Received: from localhost ([::1]:39190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAwsa-0006Lx-BD
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 13:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oAwmM-0002Ue-LH
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 13:01:05 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:35549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oAwmK-0006zq-RK
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 13:01:02 -0400
Received: by mail-ej1-x634.google.com with SMTP id j22so9898529ejs.2
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 10:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=AijNuFhleeZ+ShSP3y5L5ifu0DE5uB2ce+dGZsPrL3g=;
 b=FR9p95e1/u8u8Jb4ObZVzt/rPzhTCKbghHkhrnWG5cyWWf6+9qB1PwnN4bsXzo7Uww
 TfGcJN1LclYbPNivH39AJEi3ZGTsYPmpoXfL7wbDwAaFwi/AB7gHGmIngzOQF3EWKTrQ
 USjEMxneuEn3mK6LnZ39GPQ4oIKCWMQA0BzcvYhBPumuhc/hXIT0Anu0jo083MDRD03H
 qSjIu6Ja9VQQaBAptSTWCAWLHZ86WKEk/AQCkNNaUCPFx7zoEqi8BcuPGVaAx6Ma+DwI
 HcTvsqporKvuJnGjNfuYkBCM+xYSzyqYSkR6vuny25aBgdLZpz90xKGRJpi9F50gThmA
 +Kig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=AijNuFhleeZ+ShSP3y5L5ifu0DE5uB2ce+dGZsPrL3g=;
 b=194QmbyhYPBgIW4TSlvRyuxku0BNjaDD47B657XhrTAebb8p904WStKijY7vqvD+Ej
 cJBOsUQAansRIybASAwQvViabQKbmekrNntWlVlOKPMLUVj60TdkVgV/iACqKiKlX259
 VB06iUvz3FTrIPe0sRBa6bdnvhWyTGchN//EXN97gCpFGDUjyZG1BjX0ctq6fuHUhW0B
 BTDgBPNiJCJSjEovlZ9eUkQdwaNrCrYoWyl2LjhIZiLGUzURGLTnJ3hh1lkY0csyN/Ep
 EEtypmmnK7Uzf3IMUKYxprat23D4J24MMfvQSINCfUUPGMKPUZV8t+aG/o7gUDrURX2A
 hqtw==
X-Gm-Message-State: AJIora93bRD3hV3Tzch1g6wTcPsjsuMZWbYpu4KUxiTKaOhAAFyO1Y84
 G0APY92Sa3hvSKnWAEI3iiCmZZrxzK6EaA==
X-Google-Smtp-Source: AGRyM1tcXwN/I2X9SJSpNcuRGU57wZ3chAWHmwJtDVznpeYTsiq2f4krA+fFfN/bXs4qBFXKFlAYqg==
X-Received: by 2002:a17:907:7349:b0:72b:4f05:e17 with SMTP id
 dq9-20020a170907734900b0072b4f050e17mr7775596ejc.307.1657558859070; 
 Mon, 11 Jul 2022 10:00:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 g24-20020a170906539800b00727c6da69besm2849570ejo.38.2022.07.11.10.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 10:00:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 739C41FFB7;
 Mon, 11 Jul 2022 18:00:57 +0100 (BST)
References: <DS0PR14MB5592DD9ACC1CC45554386FE18E879@DS0PR14MB5592.namprd14.prod.outlook.com>
User-agent: mu4e 1.7.27; emacs 28.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Vaidehi Anant Deshpande (i)" <vaidehi.deshpande@nio.io>
Cc: qemu-devel@nongnu.org
Subject: Re: Information needed regarding gnu-arm-eclipse version:
Date: Mon, 11 Jul 2022 17:54:38 +0100
In-reply-to: <DS0PR14MB5592DD9ACC1CC45554386FE18E879@DS0PR14MB5592.namprd14.prod.outlook.com>
Message-ID: <87bktvshx2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
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


"Vaidehi Anant Deshpande (i)" <vaidehi.deshpande@nio.io> writes:

> Hello,
>
> I am Vaidehi and I am currently trying to run a code on QEMU emulator usi=
ng eclipse IDE. However, I came across some documentation
> regarding the deprecation of qemu-system-gnuarmeclipse and I need to know=
 if there is v7.0.0 available for
> qemu-syetem-gnuarmeclipse.

qemu-system-gnuarmeclipse is nothing to do with the upstream qemu
project. It's a fork of QEMU which was focused on M-profile and IDE
integration. You would have to ask xPack developers how to migrate to
upstream QEMU.

Do you know what board/processor you are trying to emulate?

> Please let me know the links for the same if available.
>
> Best regards,
> Vaidehi. D
>
> Email Signature
>
>=20=20=20=20
>  Banner=20=20=20
>  This email and any files transmitted with it are confidential and intend=
ed solely for the use of the individual or entity to whom they are=20=20
>  addressed. You may NOT use, disclose, copy or disseminate this informati=
on. If you have received this email in error, please notify the=20=20
>  sender and destroy all copies of the original message and all attachment=
s. Please note that any views or opinions presented in this=20=20
>  email are solely those of the author and do not necessarily represent th=
ose of the company. Finally, the recipient should check this=20=20
>  email and any attachments for the presence of viruses. The company accep=
ts no liability for any damage caused by any virus=20=20
>  transmitted by this email.

You may want to tweak your email client not to dump this banner on posts
to public mailing lists...

--=20
Alex Benn=C3=A9e

