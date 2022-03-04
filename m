Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94E94CD313
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 12:09:20 +0100 (CET)
Received: from localhost ([::1]:49692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5oF-0007r3-Ul
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 06:09:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ5dl-0002RB-Ht
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:58:32 -0500
Received: from [2607:f8b0:4864:20::b32] (port=34455
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ5dj-0004eu-Vp
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:58:29 -0500
Received: by mail-yb1-xb32.google.com with SMTP id h126so16135036ybc.1
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 02:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IEqTOW2/vNEoIbUN4mIXeb3VepIcIS7VW9ppKPqlqQs=;
 b=NWnb4qaEqBBNSKW3mY0KLARhuJxYGIiEzQSPM+Dlj5bE59kbMsZi9h6hDRsohe8DJX
 Ns7LdFzBm+4yDIPBo/Iw0CsuUxUKpAjo4yDBe/fGsFBJFw09hh9fwo0m1bLnRrPvwErg
 WaWdUyoFxX/BHO3Js40DrN7KMQ5Iz3fJFRyr0y8JzK+HyqlT0K+MKEetSWe9EmYqQHWF
 x8OT1sXdD1Zv/LXCFa2UxcSXvzS1ajKO3Sd0eQTsSEBlKBZUYYvMzTSQ+g1uoXCBGI8q
 aI+aoUXMpYBk3Mv3Y+O5tO/DFind3BpkjBJAv5aInQwb+7HGYn5T/0kvvqieo5wqASBj
 vNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IEqTOW2/vNEoIbUN4mIXeb3VepIcIS7VW9ppKPqlqQs=;
 b=gGRYgqLBj8rzFpD2Xax6ua5P9aVhmskvksXxIDOd4OxTsyhqWkb2i0o2exJZi9ZDBs
 qrM1RB9UYr5DsjOgV/iaFvmXCtTB9lOvgpVwKzKpjPqDdWpfJNh4VOwF/NuahuZnt/25
 nsLedvagtZz6l1iD8+nN2pJHTca4mxJTk3zeOHdg6/QKjQVhmNcRJB7Fp2apPLCa5bEU
 67n2b6B8ZK+yggm5SGha5UAaFv7A2ODerFPyjRJppRiSua4cyE14L6hM/8iyMwEQRInw
 fPucztPF9EfSxMWviGvmKmlO2YbNwUzcoPZnjMBlsjY9qc9xUIgkePERC0B71TJjP7iB
 aQ8Q==
X-Gm-Message-State: AOAM533cvHPRitKmQHe3s0deOVmuvzCuyiqBAeW79mZbW4K5Oun3giV6
 oD5HvREA4wGmDJkShMZu3iyjXKjBf9HQBq/NRhm2kg==
X-Google-Smtp-Source: ABdhPJzaw/NfHTvWH5hg1bYKIl+KS8k1bPFXhceFtAdwHS57EXUFBqxeio6Fa8GF3iWqNhqEhToFBx7SJmAIiEJbdYY=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr15015319ybp.39.1646391507006; Fri, 04
 Mar 2022 02:58:27 -0800 (PST)
MIME-Version: 1.0
References: <20220228075203.60064-1-gshan@redhat.com>
 <20220228100820.477e2311@redhat.com>
 <41eb791c-a74a-7ed6-df05-cd1867ecbb5f@redhat.com>
 <20220301114257.2bppjnjqj7dgxztc@sirius.home.kraxel.org>
 <ee76dcac-8914-2f24-9920-9d93aa29c22d@redhat.com>
 <20220304115240.71d241ad@redhat.com>
In-Reply-To: <20220304115240.71d241ad@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Mar 2022 10:58:15 +0000
Message-ID: <CAFEAcA8BwRnziYaO2ZP7e_hNuAPBV7UOViX-nDu=ae2_7CemKw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Validate memory size on the first NUMA node
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: drjones@redhat.com, Gavin Shan <gshan@redhat.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Shan Gavin <shan.gavin@gmail.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Mar 2022 at 10:52, Igor Mammedov <imammedo@redhat.com> wrote:
> if firmware is not an option, I wouldn't opposed to printing warning
> message from QEMU if you can detect that you are running broken edk2
> and under condition that no new infa/hooks are invented for this.
> (assuming it's worth all the effort at all)

I am definitely not in favour of that. QEMU should provide the
emulated hardware and let the firmware deal with detecting if
it's missing important stuff. It should as far as is possible
not have special-case detection-of-broken-guests handling.

thanks
-- PMM

