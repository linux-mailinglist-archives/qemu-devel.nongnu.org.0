Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE78A40D7AB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 12:43:57 +0200 (CEST)
Received: from localhost ([::1]:50642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQos0-0001zj-Ti
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 06:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQonU-0002py-R8
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 06:39:16 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:50763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQonS-00056p-6P
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 06:39:15 -0400
Received: by mail-wm1-x32a.google.com with SMTP id 140so4479115wma.0
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 03:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=18tov8lxig1W/4IbzowEAKpdg1k4hEvHZZQ8quLi2qg=;
 b=qn4+7Ac0PwLF/Q99q0G55mKJemAU02U4Ojl5WuYPJhCvXxAfeqCzwZfXsliYLFr2eV
 1vnAgAaoctEcJkQGSEW0d/8UbNHa9/RLC2F8ZyVj9O2N1thviTOKZ+jHT/VeFit9AQ42
 kQPZgLCTUwuUTVtHJmJ8Qetb2sNYIie3K8ViYOh7DEeqS6NvcKGPTVw2nccz+kVmYWG1
 7gyonOFFcPtWeaN+6Igpgtnw2TV6hy5ZHpyQBl1lcDYoV7ZU5g6TL9Z8mIar0hYelpwq
 8i9VD/J1gOfvDtpUimX4ptN8Q2lrgyMO5+en2FlrY6+mP6C0pVxT2mTGKrOuL4x/74Mo
 99oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=18tov8lxig1W/4IbzowEAKpdg1k4hEvHZZQ8quLi2qg=;
 b=qjyU9wK769Uc0ndvXOwcn/VMr00YzqD67U0o8d+IyVnwa3ZurN2OH5L++Z7lwMvTrN
 mAPF9PAPt7PoPMZSTpDQt346FFDBnotb1sfVFdDbRmBWo+J3ZoMZKN/w76VtLb5ZrHsW
 fczZdFNwQl4cvsdiqBzG47Qz0HIP2uSNDcW6716etmSFJt4jroD66IZzTer/GsC9L4s0
 o93uo9mF+RcDoyUMOKjizkjQ98NZwtFCpaEGgjHLEGnTfmKimZAhcZN1X8whvfii1n3n
 pDQgPwmDXazaUOOf4A/pGbzjLcdvq3Xf18UscQ/I5c5r55AdUZz1ZN96dtoGH7wg8ALp
 T0Ug==
X-Gm-Message-State: AOAM531KoUFGUKmitp3aqv5FDNIyVPlkAZabbJcz3kfWZRuGLpXGcROX
 k2y+d6wp4IykNbD9ENlUYz2ZHPZHgUU4cqk33oC8YA==
X-Google-Smtp-Source: ABdhPJxVvMzVjb2DuxcVao4WDPqGx0w+r5tIvj+9+d9G7bolm6KBNBKgL1rC1dMva4NE3NLjBI3f+dyatWDTre7NAXw=
X-Received: by 2002:a05:600c:4848:: with SMTP id
 j8mr9212102wmo.21.1631788752276; 
 Thu, 16 Sep 2021 03:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-2-agraf@csgraf.de>
In-Reply-To: <20210915181049.27597-2-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 11:38:21 +0100
Message-ID: <CAFEAcA_4N0xp=NVbGpHMSYpOrw9fm2NVZTBk4X+Ly8dc0xBKOA@mail.gmail.com>
Subject: Re: [PATCH v11 01/10] arm: Move PMC register definitions to cpu.h
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 15 Sept 2021 at 19:10, Alexander Graf <agraf@csgraf.de> wrote:
>
> We will need PMC register definitions in accel specific code later.
> Move all constant definitions to common arm headers so we can reuse
> them.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>

Subject should say internals.h.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

PS: your mail server has been sending me delivery failure
messages because it seems to be subscribed to a blocklist
that has blocked one of gmail's outgoing mail servers:

554 5.7.1 Service unavailable; Client host [209.85.128.51] blocked
using dnsbl.sorbs.net; Currently Sending Spam See:
http://www.sorbs.net/lookup.shtml?209.85.128.51

-- PMM

