Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB5863AE31
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 17:58:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozhSR-0000S2-1I; Mon, 28 Nov 2022 11:58:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ozhSO-0000NK-2j
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:58:12 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ozhSL-000859-JO
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:58:11 -0500
Received: by mail-wr1-x430.google.com with SMTP id x5so17906705wrt.7
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 08:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pHYAXzG5iLMUNBWXVHyNvYR+kDrrm3MU2BrSo6YdYnQ=;
 b=SfEM7CCc4f3jmZt4cGXO6W4b5WEGWddCBKfrAd3pAmsrHGu0x1VRRKU67sN6DSh4dE
 3APUyW3kT3jgXeMzX8ZR8BV+RNiDbcKHpUnAdKkwycRk4JbOio4D9MtL2Kdy/wkAVy8+
 l+/8gDSsJAMyfzgm/n/f50eo1F7b0jKgQdkWGgSfIfg3FuETdKuNxm8AxHMv1VOdhYG6
 Ph3gs/B7N0lclIHF2IOv/xahp/C3ZwTlBmWe4fDipBD3UOh09HGb8YagxacU2VCDVFF9
 EG8/RVQTYl1nRkadZxo7at/3JTzsucWcmCTP6gMKJz4e22tK4A4FMSZMlgFRvUVgcVYA
 wqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pHYAXzG5iLMUNBWXVHyNvYR+kDrrm3MU2BrSo6YdYnQ=;
 b=ja5hHZTbifv3A/6UxDSRxNV3NVxl6iaXGS8v4J1x0jBc40SUU2pfyRUJ44d2J2Y5co
 PetkWBddKInFUq+TvS8LnfPwWcbwtfr7JcAjNvpFp5a0rD3W0febBRhSnAR8FoLgHkkl
 BrDuRb74Xct6q6iD8dYROFbJcgEi6KI7tmOMumCkFL4TszwvdebYX7tIV6QJnzHZHKyd
 JyyOaO8lGf+jxeW8mnTvJcz4Z6UN1x1Q2+vpy2NKck22UYOSDt6qw7W7AjmK4jDKeHdN
 x3b7s7O0x2RiemFxahZanjPehTETQHyY0DDGrvOrL2PRjXE7Cgxy0B8UVENxy1fhnsEu
 z9YQ==
X-Gm-Message-State: ANoB5pkMmEYjkIGyQfXyh4N4sMU5Sfxuyk8X93upwbt65I6bBzUIbuuT
 smx+rXRTmdQvScIiddYsD7gF/7TaKxHYtw==
X-Google-Smtp-Source: AA0mqf6glRyzCwU0XPKU+0x4Spn8W2kNbJm8Fpkkm1fuyAG90uxh+xhXjXF1G0pK+IWP+Ool4cmN+Q==
X-Received: by 2002:a05:6000:1c1a:b0:241:d8d8:91fd with SMTP id
 ba26-20020a0560001c1a00b00241d8d891fdmr23612840wrb.452.1669654687883; 
 Mon, 28 Nov 2022 08:58:07 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y3-20020adff6c3000000b00241c712916fsm13564376wrp.0.2022.11.28.08.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 08:58:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2DA291FFB7;
 Mon, 28 Nov 2022 16:58:07 +0000 (GMT)
References: <20221128092555.37102-1-thuth@redhat.com>
 <20221128092555.37102-5-thuth@redhat.com>
User-agent: mu4e 1.9.3; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Gerd Hoffmann <kraxel@redhat.com>, =?utf-8?Q?Dani?=
 =?utf-8?Q?el_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 for-8.0 4/5] roms: Add a README file with some basic
 information
Date: Mon, 28 Nov 2022 16:58:02 +0000
In-reply-to: <20221128092555.37102-5-thuth@redhat.com>
Message-ID: <87bkorxbhc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

> We're going to ship the contents of the "roms" folder as a separate
> tarball, so we should have at least a short README in this folder
> for this.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

