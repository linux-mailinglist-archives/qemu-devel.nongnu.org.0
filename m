Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D4E5EABED
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 18:03:35 +0200 (CEST)
Received: from localhost ([::1]:50802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocqZy-0007H8-RS
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 12:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ocq4V-0007EE-Ow
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:31:07 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:36364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ocq4T-0005yc-TY
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:31:03 -0400
Received: by mail-ed1-x533.google.com with SMTP id e18so9573749edj.3
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 08:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=i1w+NHuQMhjljZjgndrbvMVA/Y+/4lKXcc//Vrj9AcU=;
 b=evAOoLqxDHUyK8vBDOt65xJhE65aIo5TZekdWhRuq8gFzsi3krxQnUCzpMlXVCWXXe
 hlDo3RVNDBzliaofuwZb93fwFQXZ0m9IYafKaS/LuRzfqd/TUddyIsi80RFCVbucSQQs
 PloweiewpKaBxgd3OipUSynr3G9rSJKmVN59WgBhkQxxY1uSsSlmhuzHPek0LSJehOzA
 Z410hxgaGBvHhIUPpsYUVVeDcMyV4A0CW1IcuvrFztrThuo5InUPmY3EFnG8oGjOOaxv
 riPJxhPvcSDT2pfqdUl9WM2J1Zo0Nf4xJEtR+OliLllDUjYaMbISVGDAgeftgegppNTp
 Z8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=i1w+NHuQMhjljZjgndrbvMVA/Y+/4lKXcc//Vrj9AcU=;
 b=b+XB717lERYZdN9+7wa8HAo3H4Zlhw0nc175XbZN0B9nYHmce2RrRJYEi8BIP6VUud
 l0oTkYJI0aNS8YUwSOKg90QiY86h+LRhrG/v9fZBLwjBeow5IhpY4C/a3BiMIXl4Mhfb
 +enfxa2Cg1ynVziCxGjiqg6lgDDUxnutUKwt/F8Tn/GKxtVl/HU5boT83DcrZEQgtk0T
 q8M5jd38zTCPKwYYLbwuyHBsc8E1WdqMjBNRhiyPa3cxUf6L8Z7FENCWfGYEBEcuwglS
 NJ5WuOTt+NNG3WAY7TcmWh0DEBdNlR6lOqmHKVsgJCcgmu0TFSXU/hGqqc28sTA8sN6Y
 oEDw==
X-Gm-Message-State: ACrzQf27tbIwYD/QKYP0UHKrVHcql5BQ/8S0cgwKJ+R+ZXFmDHXv9T7H
 oGHNn7Y3U6Bz3eUyDTJmCMuTLIyUM0XuHvLFprATSw==
X-Google-Smtp-Source: AMsMyM6zr0hi5quIaxXHxVo7TLMAeH2Yq0Iwplm2f7iGpNq0bxzqBeaDhFn20t1fe1uriOj8m1vht1F9pGzcXWcMsBs=
X-Received: by 2002:a05:6402:350b:b0:452:2b68:90db with SMTP id
 b11-20020a056402350b00b004522b6890dbmr23150939edd.255.1664206260225; Mon, 26
 Sep 2022 08:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-2-alex.bennee@linaro.org>
 <CAFEAcA_QS8ODmQqHY=rFEMom_PoGL3eTdaLUyki4_0D5jFKaQw@mail.gmail.com>
 <87h70u40ql.fsf@linaro.org>
In-Reply-To: <87h70u40ql.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Sep 2022 16:30:48 +0100
Message-ID: <CAFEAcA9NeO2MZpybhA8voH-3o5k9Cqa4EOg-0nk91gzQ9JJrPQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] hw: encode accessing CPU index in MemTxAttrs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk, 
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Sept 2022 at 16:24, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > I still don't see anything in this patchset that updates
> > the code which currently assumes requester_id to be a PCI
> > index to check that it hasn't been handed a MemTxAttrs
> > that uses requester_id as a CPU number.
>
> OK I'll update so all the existing cases setting requester_id also set
> the type to MEMTXATTRS_MSI.

The problem is not the places that set requester_id (you can
arrange for the default to be MSI for back-compat if you don't
want to explicitly set it), but the places that *read* it.

-- PMM

