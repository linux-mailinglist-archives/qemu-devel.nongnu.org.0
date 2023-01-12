Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C41966793A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 16:29:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyzU-00009I-Uu; Thu, 12 Jan 2023 09:55:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFyzT-00008j-8c
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:55:39 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFyzR-0006F8-L5
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:55:38 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 z9-20020a17090a468900b00226b6e7aeeaso21164658pjf.1
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 06:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kEg0KppAwxiIFoRbTcUg5+Zyn2+GJ2GySC9oC/qN6UI=;
 b=hlwuIqhU72d2pk0i3LH0bGcHWA7kzjBM+B1WwHV2V9rAMa4UaipYRBEsiGSbCsQKtV
 3AYhX9oWrSSFyEk0D94O7pLwVm/tR08uLWgKLsbCzi4yOznGwClBwBUT/vhIO33VJYEu
 X5TmoGQN29fiyuKFSPFUe2mBPsozoSJJDB+sD9RtosjD5yeW0XinP2naGeaZqgp6ZVey
 nffgk6sQQ9nKY8B5LCYZQLUylxutbTDXGAT6t60deXcpKpi2QsXiTYM4i87Y6m6lEvC2
 yq0UVTamEBWYujIXHxHl/UzhSpqVzZ2x6QRQhsCTlMvQEohQ0XD3ZV5tuHF7D2uNYh96
 ZBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kEg0KppAwxiIFoRbTcUg5+Zyn2+GJ2GySC9oC/qN6UI=;
 b=2aemUwgqUnbMPK4GlSd8qNLx0onaRLdBb7sTNrybmljV37m+ZmN9i4K3taFmI4DSik
 MHhF/qMElwHF/jKGaI1l22zKq7uGr+oYS/FmNIpvNZVQf+secHaeVt51n+NhNLNRlgs1
 guWlinXFkjpy1ZAksDlehdKiEGBsHDZ2h/PsQPBiKLQZKTnO3M/P4FyKEbYUzbYMnCCt
 EWQTE6QqdfX1z+9/59tnZuzeTWwTZmuTECKxlSAOULilz3JlpKZDt6QzG2FbLK/nkFa1
 GVRXUD09fAU9rZNKhBoJYfM4ZjtHfYO6xrE9zHttf3cF5LMYjH1TrizkWiZItsMykjIm
 B9jg==
X-Gm-Message-State: AFqh2ko5LNJfa1MEJqCkoh2vVXi1kdyaTU39bFoBbZTB+wxNlnrmGzfq
 tL0j3poi/6o2dwhGaB8y+Jq76nVPDJWnjbxN65HvxQ==
X-Google-Smtp-Source: AMrXdXssqlTohfMIJ9D0LJz86dCBiRjMM5K41MpAluJco/xWkrBF+do6m8GX5z3tz7mWUtNNkh63Iy/3Y3lw0DqUV08=
X-Received: by 2002:a17:90a:77c7:b0:219:e2f1:81ad with SMTP id
 e7-20020a17090a77c700b00219e2f181admr6278659pjs.19.1673535336216; Thu, 12 Jan
 2023 06:55:36 -0800 (PST)
MIME-Version: 1.0
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-14-farosas@suse.de>
 <35870ab3-1da6-c222-b708-06ac71a5883c@redhat.com> <87zgaqa6jk.fsf@suse.de>
 <CAFEAcA_x_kTdNt8+5YAjo518Wj_Ej4jZ=0OrCQmutNOjJx=3Gw@mail.gmail.com>
 <87sfgia4uj.fsf@suse.de>
 <CAFEAcA_AaWfwAbCLOC3ELf3c20Cv5jQhWc71Py4ww4kLo2nYeg@mail.gmail.com>
 <9fb63a5d-d839-016d-b0a8-4151b6d6946c@suse.de> <87fschcko4.fsf@suse.de>
In-Reply-To: <87fschcko4.fsf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jan 2023 14:55:24 +0000
Message-ID: <CAFEAcA_4m=+2OaiYSR4pVTr9StWR5UNFm1A7aAaoAAtFbOmf7g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 13/19] tests: do not run test-hmp on all machines
 for ARM KVM-only
To: Fabiano Rosas <farosas@suse.de>
Cc: Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, 
 Alexander Graf <agraf@csgraf.de>, Laurent Vivier <lvivier@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
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

On Wed, 11 Jan 2023 at 12:36, Fabiano Rosas <farosas@suse.de> wrote:
> What remains is changing the Kconfig to not bring all the
> machines. Nowadays for KVM is the 'virt' machine the only one we use?

I think perhaps also xlnx-versal-virt -- at any rate, the source
files include some KVM related headers...

Alistair, Edgar -- does xlnx-versal-virt work with KVM ?

thanks
-- PMM

