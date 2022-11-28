Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9644D63AE14
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 17:47:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozhHz-0003FJ-AG; Mon, 28 Nov 2022 11:47:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ozhHv-0003Es-KC
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:47:23 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ozhHt-0005s6-RW
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:47:23 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 t25-20020a1c7719000000b003cfa34ea516so9758600wmi.1
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 08:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xzNHtumjRQi0cLT7hGCcW1tQO34EBSn9EXLD+Q9AK7M=;
 b=A9ACpkBOtk5OwixXT3pNgJuedlGkdj2+xHph0/Qd9BACr8C9QNcsp7n8nKudEWrHvs
 KOL2vPUGU7IORAyki76kTS/CzWYDR9eHom4fpf6673aKDpgHOoKQiV3s94w0Iw4VYZTH
 NEzaD1f50WE6Knxt5ohz1fFcBVs13wPDUdQ3AkbEWZDLTtZc4JR2gqKczd2La6w/CdL+
 B7axQzelQAmAfYxt1Bksr+6Mfo9ZoVKXtQcn26HB9Kj0g4dM9PU42iqTODGZJaia9/Qk
 KFEmm4bpkn2Dh7VEGmsweNuEWFfe6es5z8wTDjUDNN+JNVzNMye7TYMrkX3XX0J6TsRd
 Kcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xzNHtumjRQi0cLT7hGCcW1tQO34EBSn9EXLD+Q9AK7M=;
 b=E+OhrMbP+w0qwxLnJde+mL8DVM+3cyDxXlHBiOZ84m3ozYPOhADgIwkTxTfvh8M7xz
 uFJGhIADyTPlU2/k6BnJtQEO+XLDZsTuLkz57xVqthI7nIy0tEFIUPl4tAsRJLWorZkZ
 93lTiVuSH9JS+bYtXgC3nMeE3bRa0HzdCJL+kiSi8gktwFv9Q5QQMoVdB01jyEfziHPJ
 0Y6c5IkK12rQngisT+nXxgaFUDygeC9IWmbGCsak4rOcLYlBBn9AU6kJ7WA3Y44Y9c+i
 xu41uCwfDQImLET0eqTQUcO1KskeOr3bE0hF0HEAB/C5DPhMOsiUjShiHZTMRGKjrcXj
 XBxg==
X-Gm-Message-State: ANoB5pl9FjzQBm5hSgxxNSHEOrHsYRM2HwNUjveOkdPHsTHhcd40BEkK
 nuedkqHeohdpT3gW3HwbSlfsCw==
X-Google-Smtp-Source: AA0mqf4c8ffvGoMhOLtxkc+TMY+iAP0CoAAMJy7itZ+Phm10ZGi3NVJASmMrBytV2cYb6XEgpdfFXg==
X-Received: by 2002:a05:600c:3b09:b0:3cf:987a:2bf with SMTP id
 m9-20020a05600c3b0900b003cf987a02bfmr26215354wms.157.1669654040170; 
 Mon, 28 Nov 2022 08:47:20 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a5-20020a5d5705000000b002421b045fa9sm2190164wrv.43.2022.11.28.08.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 08:47:19 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4B44A1FFB7;
 Mon, 28 Nov 2022 16:47:19 +0000 (GMT)
References: <20221128092555.37102-1-thuth@redhat.com>
 <20221128092555.37102-2-thuth@redhat.com>
User-agent: mu4e 1.9.3; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Gerd Hoffmann <kraxel@redhat.com>, =?utf-8?Q?Dani?=
 =?utf-8?Q?el_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 for-8.0 1/5] scripts/make-release: Add a simple help
 text for the script
Date: Mon, 28 Nov 2022 16:47:13 +0000
In-reply-to: <20221128092555.37102-2-thuth@redhat.com>
Message-ID: <87o7srxbzd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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


Thomas Huth <thuth@redhat.com> writes:

> Print a simple help text if the script has been called with the
> wrong amount of parameters.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

