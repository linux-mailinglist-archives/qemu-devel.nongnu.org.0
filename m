Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D52402793
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 13:07:36 +0200 (CEST)
Received: from localhost ([::1]:36450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNYwx-0007mX-4Q
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 07:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNYvS-000698-91
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 07:06:02 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:51903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNYvQ-0006k6-LS
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 07:06:01 -0400
Received: by mail-wm1-x332.google.com with SMTP id y132so883833wmc.1
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 04:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ylWG1/0AUbcnMg2SYx6BsHGyOga9O8hIMxHpEe6IW2Q=;
 b=NFgWXbFnGDu/P1PhIC/sq0O+4kvOqFOak93X5sQmRgo1ZSIcwH7Ch3LrwMVyAlDX4h
 L3Z8XMF9QFS4m1gjj9KcADM+DJQ7PUbWLuhxv+QQHJsceRF4+CDwCcA3zxh28F1G2p1b
 FfLIzLxvZv7v5sIQGI5lpSzFs6mkzz5/zrIdatYtbFbF+I38aSsHLiC5/DJptyRdWjvP
 RPP+9ifOaRAdinH8WAb5QjO3QV2seDnBt+dvPeMjnqZTxUMTtsV6Z0ymJ/PnU5WdUd1j
 DkbHF0Etn5+zzdn/r+1zq9j57aWEXGxcN4blClDCMwl6om75Y3e5ZidC422ujsHKzz3F
 Vaug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ylWG1/0AUbcnMg2SYx6BsHGyOga9O8hIMxHpEe6IW2Q=;
 b=SLaSoafbGEsX54PhH8ai64inxrzHwSnZmpvD+J4kYo0B8RiYCqRxukUz406Zznw7QQ
 nBckuscAZv9kDxS31wtucgCdBQ6H0nhGzh6kO3QC3vDHNmEHW/L9sr55krMsOXia9dqT
 enVFoACzs2/IP0eA6I0ZNGdroohpiOy/62njbnhCWVH73681LuZ6MHtKZh01sbyXQqR+
 547daZbJt9iDdw4rlq0UjfX9H7BtbA2z/b3JEtC8jprFpRtRDgKOsqNurUFVNZ0FpxKq
 Xrdt9QEP6Ut2QJBgqUUqUC8r6PRScGvXwSpJvzsNHUdEYYrCRKndl8zBIEvY8ncFVxUc
 6sFQ==
X-Gm-Message-State: AOAM530ZTTm3kqxQJ0xEUAcGkMBI4PUP6mmlBBQ7eFp/jFSgvqa+YFuk
 r1w7N6rUZfBVS/0CgFxWbzw1qbCxBCTfFIzfPP9pdg==
X-Google-Smtp-Source: ABdhPJzQNIaV6ufoIOYnCgMt3mM43x4G71aUzZ69IZO1yqVpc7XWyGZc4vTrkiUlYcyz1W08Cu297dJL/vf93r76k3g=
X-Received: by 2002:a7b:c246:: with SMTP id b6mr3342111wmj.37.1631012759317;
 Tue, 07 Sep 2021 04:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210907104512.129103-1-pbonzini@redhat.com>
In-Reply-To: <20210907104512.129103-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 12:05:10 +0100
Message-ID: <CAFEAcA_ET=7VWP0rqWLEXYa=Gx-ZAQLMCgDWJ5-z1WSxXf_-4Q@mail.gmail.com>
Subject: Re: [PATCH] ebpf: only include in system emulators
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>,
 Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Melnychenko <andrew@daynix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Sept 2021 at 11:47, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> eBPF files are being included in system emulators, which is useless and

do you mean "in user-mode emulators" here ?


> also breaks compilation because ebpf/trace-events is only processed
> if a system emulator is included in the build.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/566
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

-- PMM

