Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB20B364618
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 16:28:46 +0200 (CEST)
Received: from localhost ([::1]:41932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYUtJ-0003tm-Ta
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 10:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYUs2-00036R-PP
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:27:26 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:34714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYUs1-0007Us-5m
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:27:26 -0400
Received: by mail-ej1-x62c.google.com with SMTP id x12so32468087ejc.1
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 07:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ScAKAxXcqIZhFqJx1nhpQxcyKpY4WaPRVOj2tlhdtLE=;
 b=QEr/zkeM7ydHXMeKUQoaK3j++rxwvu9Qkf2rHVXg3rI+Q3XAdKStGrZnCIRRQpc6PT
 M5NH+bEeTL+E/kAbkiSbgFP9qrJTYBjNyqWzAd8n41DE5suPrlZBpwhsI3plhcY8ha0m
 evFHGqgn8cbVA81axeACbxffd3Yq7eL/rfHYZI1mzxA20QLId37XW0qYaZcEpMBGZtHJ
 GmFKMqIvVCJ4NdDvxltoFJ5610aT/kgrEeoMDZSxiHF2dFyjccImi5w40SD3UgaU61Pb
 sXmHFyeZjs50HrUOKTZ26KZutc4WyjG3nfq2njBRzgDNnPAJxHLTxlokdsBqQHKTe0ok
 Rnew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ScAKAxXcqIZhFqJx1nhpQxcyKpY4WaPRVOj2tlhdtLE=;
 b=hJPQnsmBqnNVtizWO8jI1EdM0ykn4+Anc5O+uNR7kHMg4dJkUaUQAQA4XV3wOPnimO
 hw4bMNsgyCvV3XTRyPH8msm4latmyGrzUa45aYfodwlWyHb88BdDdHcYNgGIa7+o76BJ
 ollvOkCOQIUrMr1co2PC5jhkfrOKR278fpyAoOLvVb2tUoIPTKNI1QveO+GapM2Gy+LG
 iHIrMgz/7FHRlFmKo6MI7TAddbnhkH06jz76B8WbnbTyWlJGP2NZ7lS0qigM/gX2n9AM
 vNBUcN04BJGdNybhJ4Sst3A1gchA22nJlL6ZPwmmalfcKSVM+24rJWY4YqG1dXJ9dmnE
 LTjw==
X-Gm-Message-State: AOAM5330DNMhrun2X5yzB8eTsX1nQ4ijNfc8NWLKNKV8O1gWaIYOH5Wu
 FuZCmhWMZxoVGnRK5Mco9PGltN+fAwEssErEIGHnVw==
X-Google-Smtp-Source: ABdhPJz4OQd4pfmHmOQI5OtL9bRPMjJMyGE7PPheqc2EJ7RlpnUNOehWr5n1wMCc9qbLgRObl4+c/tEOlE6kK8KKAYE=
X-Received: by 2002:a17:906:953:: with SMTP id
 j19mr22690736ejd.56.1618842443763; 
 Mon, 19 Apr 2021 07:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210409062401.2350436-1-f4bug@amsat.org>
 <20210409062401.2350436-9-f4bug@amsat.org>
In-Reply-To: <20210409062401.2350436-9-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 15:26:32 +0100
Message-ID: <CAFEAcA9s2hJdRrpa6-qBTaWs6v2AmhyjhOSs7kFrtE28+oFmWA@mail.gmail.com>
Subject: Re: [RFC PATCH-for-6.1 8/9] hw/clock: Declare clock_new() internally
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 9 Apr 2021 at 07:24, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> To enforce correct API usage, restrict the clock creation to
> hw/core/. The only possible ways to create a clock are:
>
> - Constant clock at the board level
>   Using machine_create_constant_clock() in machine_init()
>
> - Propagated clock in QDev
>   Using qdev_init_clock_in() or qdev_init_clock_out() in
>   TYPE_DEVICE instance_init().

Why isn't it OK to have a constant clock inside a device ?

thanks
-- PMM

