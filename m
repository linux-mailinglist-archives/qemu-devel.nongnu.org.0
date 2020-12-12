Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 126FA2D891C
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 19:16:59 +0100 (CET)
Received: from localhost ([::1]:56252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ko9Rx-0005zj-W1
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 13:16:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ko9Og-00046r-Bw
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:13:34 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:37341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ko9Od-00009S-UU
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:13:34 -0500
Received: by mail-ed1-x543.google.com with SMTP id cm17so12878336edb.4
 for <qemu-devel@nongnu.org>; Sat, 12 Dec 2020 10:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j14/HijySEjz31lBk3ft3cOE17P1pqzXTz5j1Dp1Nr4=;
 b=KT+TKyvkF0MnNJxekldlTpoJWPs9Pz8HrVoYwZRACcXMa/3/D2oFM4v/YLtt0fD2Zr
 CiEAJxT+xhK5tN2g2KtmBgSDLnpq2tG9mwg3N3Ac2l6g2/nbRyi4h9VdLIitVbEVvevi
 5LxuYLLl04j30QPW2PSDD+fvJAKjmPSHghVTheQW4c1+jK/DvtIxvrUkfS8HAWMSRhLC
 rbWc+G4kIvTLepzNFkP99DEQzzB2iGkegHccJwHG/TujOA4V8oNz+HAmCYbpzMSSOU/3
 88gF/rd3Ev46juSvIHXdrIUUvqnBceYzuQPx7iuKcCW0tWdB0nGfVEXC8Y0H6LGJP4zD
 pfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j14/HijySEjz31lBk3ft3cOE17P1pqzXTz5j1Dp1Nr4=;
 b=U5D0erynGO/e6xyCpa4H2ZyrltzY4/WDn+SXej65fIDXTsW70e5Uo+a6S4g2/1e2sI
 OWf6peBl1U7llslRhuBWPSWaRA84ppfSVLrzyW8a3O7X8nvFn0xh58p3+xAkA+HniRH1
 b2RBBI7LOuH0BPKLnVGNSCUM4bh6YIffnr17iizMBgv+0oGvCwIsVxRLow9Fho/Q5Jv7
 EbKDjw1KZJbfjUFV6rs15RPcTLGaaHMRw3qSxtrqglysYNvfY70amR92GEzAdiXHUhQW
 UN43WiLEat05UKxgJpeXsmke53xoS7hWcpf7XofWMPLlXczdQn11mKVTOprnko9diAeV
 V9vg==
X-Gm-Message-State: AOAM531hdELgKnEWJ82ZbZKUfjMfhN/C9P3C5G2+z96bhc33Pt2o+rVl
 eizw5ywCb9V4SHwG5/DIStYEs+6gxEZuIttiJ7T/UA==
X-Google-Smtp-Source: ABdhPJwWWjRIUluMf9d6npP9zlLt2MMTqPCwI3jxupFbTGynlJfS7y15Rbp2KCec6UnFNT+s2CGBIogCzfOvBU4NrM8=
X-Received: by 2002:aa7:c388:: with SMTP id k8mr17409685edq.36.1607796810428; 
 Sat, 12 Dec 2020 10:13:30 -0800 (PST)
MIME-Version: 1.0
References: <20201212001537.24520-1-peter.maydell@linaro.org>
 <ce63518c-7389-b6f0-c615-886d461fe99@eik.bme.hu>
In-Reply-To: <ce63518c-7389-b6f0-c615-886d461fe99@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 12 Dec 2020 18:13:19 +0000
Message-ID: <CAFEAcA9kBcin_4+Rhb+q2bthBgX7x=1H3KXuv5qez+uWDP3edQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] hw/ppc: Convert UIC device to QOM
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 12 Dec 2020 at 17:43, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> Interestingly the firmware does not use irqs at all, it just polls for
> them it seems. AROS and AmigaOS does seem to break though. With AROS I get
> this exception after your series but it's not very helpful:

> AmigaOS also fails to boot but could not get useful logs from it yet so
> not sure what could be broken.

Thanks for testing this. Do you have pointers to images
and command lines that I can use to reproduce the failure so
I can debug ?

-- PMM

