Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ADF4DB161
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:26:04 +0100 (CET)
Received: from localhost ([::1]:47204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUTf9-00059d-Us
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:26:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUTZP-0006HB-Tv
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:20:07 -0400
Received: from [2607:f8b0:4864:20::b34] (port=40502
 helo=mail-yb1-xb34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUTZO-0003Pb-59
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:20:07 -0400
Received: by mail-yb1-xb34.google.com with SMTP id z8so4354017ybh.7
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 06:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dEujopwKsKsyBm6RHaECVr+cUpsVqiiVUVVDGBbV9jc=;
 b=jP/nkbprAEXSf0uArfKNNsJMbnJpqtKIJ11dlDcEY0i0lK7/v4jk5HZ2Pm/6DBihIi
 JCno07HjW2gCpGTLJBPuotUzPf0Cr0J70sS8pHB7kupY/qOCCAJUbLs1aB+qEqaIwFV3
 SOfX4WnH83AilrCCL7ypFyqQYyEsh5eSZpkLJOU/lo8CW3NLC4h8EaJ6FYA871el8CRP
 WGbMK7WQzLDcIAOOqWNdqDhxkpKvpdAwTCPLAsEQ8f1pCXbpPP/Ts9xGwDG/3WARZ+k6
 IceWDTdbOh5Wf0PZ17mUqZbC5NAQCm8yz/G7WK/EvSZM/zR7zBOmyutwiqhWSsZCpW3H
 +ReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dEujopwKsKsyBm6RHaECVr+cUpsVqiiVUVVDGBbV9jc=;
 b=H/i3wc/VpbfeijPHO/BjgMDkl8djq9rnfUm7pnjl0VkTzwlXV6na3Xw1yFr+n3qyiJ
 g+L9BMdsePyFdHbbIaHCxx6/M+Vm/k1pKgQNjj2Z7X/sHsA3VGPixyy0RrftrZglvE67
 b75mkkQTgRWpEyQVl+Ht9tX7uvU62013Zokt1QlkVWKEbVO5NPJ7RbfVM2gcK1VKJzCh
 dSvt6HxDN2ZDmjYtjueT4sPEXr9vVkO07yxI2Qx45JJ6l847BphzpIQg6lrDif4x1Mx1
 Uf72QfLI/AsLDgNWdqarWMcNGV6dKLUJ/WKd5CEv8+4y/IS/VSJyfFSZyqVa9C2SfqgR
 P3vg==
X-Gm-Message-State: AOAM532hf44EJJvVMWMyw+l3VPW29P0pwL6WMulGw9I8MyR8tzit82U4
 H0jDdTlEzuVDCeU8pqJWGAfPWa/58Ea0A+DEhvzM4Q==
X-Google-Smtp-Source: ABdhPJyzx1hfY0F9ZasAgekC+3ltRtc/lEzpHsKowcPttzh8v0t6dhhgg99Xeh+dNJNumy3Er5gO9fF9cHDfVfs0nwc=
X-Received: by 2002:a25:bf8b:0:b0:633:8a66:c4cd with SMTP id
 l11-20020a25bf8b000000b006338a66c4cdmr3806519ybk.85.1647436804957; Wed, 16
 Mar 2022 06:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220315112052.515467-1-thuth@redhat.com>
 <CAFEAcA8u8G3=V=OVM6v_BaOwfeDu1RJmnwrW+4PXqbnPrAAr_w@mail.gmail.com>
 <de2b3a0b-5c1e-1cb3-ca97-c67f7272036c@redhat.com>
In-Reply-To: <de2b3a0b-5c1e-1cb3-ca97-c67f7272036c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2022 13:19:53 +0000
Message-ID: <CAFEAcA-yACeWzRVSZYbOrxWK8g7mss4YjU=mzsX16k5VoF3=rA@mail.gmail.com>
Subject: Re: [PULL 0/8] s390x and misc fixes
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Mar 2022 at 12:18, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 3/15/22 19:58, Peter Maydell wrote:
> > On Tue, 15 Mar 2022 at 11:20, Thomas Huth <thuth@redhat.com> wrote:
> > This results in every "Linking" step on my macos box producing the
> > warning:
> >
> > ld: warning: directory not found for option
> > '-Lns/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/12.0.0'
> >
> > Obvious suspect here is the new meson version.
> >
>
> Can you send the meson-logs/meson-log.txt and build.ninja files?

https://people.linaro.org/~peter.maydell/meson-log.txt
https://people.linaro.org/~peter.maydell/build.ninja

Something seems to have truncated a path somewhere. You can see
in meson-log.txt that it uses --print-search-dirs and gets

 programs: =/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
libraries: =/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/12.0.0

but in build.ninja the LINK_ARGS start
-Lns/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/12.0.0

with the "/Applicatio" part removed somehow.

I'm not sure why we're passing this explicitly to the linker anyway,
though.

-- PMM

