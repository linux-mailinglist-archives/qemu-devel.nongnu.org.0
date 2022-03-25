Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 264A84E75AF
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 16:05:12 +0100 (CET)
Received: from localhost ([::1]:56788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXlV0-0005cB-Uv
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 11:05:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXlQm-0008M1-My
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 11:00:49 -0400
Received: from [2607:f8b0:4864:20::b2f] (port=39627
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXlQj-0004qN-HG
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 11:00:48 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id t11so14516920ybi.6
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 08:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ai9I8keYy/A4At0Op3q/8F24bK4ZmjaCZuevio8SeL8=;
 b=yeoB3EDNY60o6uf+FkMzMfhYUb73F5pOpU6jkTzlHPFkcZ0RoEMmZjJUBSb4af6+NH
 ssJCKxTnU5y4EmMWekFC6O+zz+PY4GPxDixkek426vK6hpCPjRhvt47X9JOQIdYEHS2m
 rFm40LWM/780iDQQp/LE6DOhCyhszTtBQEBESI7IHl6wtXioP3lGSBSqJI2KRmk/AKx2
 1E+KEGGGhQQ4bIMCsnAGueCZ5/96cIDXpyojzPpYr+k3sEt8o4VIfQ8Jtp6XkFRp6EKn
 Bjnh1WDoENfnkuDZ8u6BfHw4/Oo1cjeMmEesfAF12wpfZ2MXmG/hs9aOYt53ycOHeecW
 RKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ai9I8keYy/A4At0Op3q/8F24bK4ZmjaCZuevio8SeL8=;
 b=41o09qg4HFu+0G03mHSH+4tKLoByq1qWewWXQBx0Y3pGjkzF00p1pe4fAsQ5BRfHX2
 YS0HNVNNSLedGickGc46Hqm4Hmuxj43GPvwGff23xzkhHfBvjPY+WMYMxLbtQuik8hc9
 zuuFAZyKTiLVBeAFqkIUm8P+PVu1MC+ZedSwF+xkPY2v/LShgwrYbq6SIQVhDhwkwZ4f
 ZoxNgXroIUSBc7ERSpY21mbx2WBgrSAG4Ptngbp4mKZ5P2Pqux+Bmc/HkXgl/YL98aTD
 ci2SH1OFxF81Sc0m4DbHNBIdrIm5bX+6t4dlrzcWLwKTD8oHO4hvgN2rYzsitj5anV4+
 gD3w==
X-Gm-Message-State: AOAM531kA2oE1DElzlrR8NxOgW1zeV5+uyyYZaYC94toWjJhuqXgapxx
 zKQloVGjqsGNDrbdvyStd4Z/Ft2K3A/uyqIaWy5MiQ==
X-Google-Smtp-Source: ABdhPJynVxbhNMzeokBfdlFbxRoEgJ/Se1CUq6k3nOYu/HcSPFDF5J3ci+Th+mlFwDb4Ev+waanCkph46BcbjPkBPxg=
X-Received: by 2002:a25:d8c3:0:b0:633:c81f:737d with SMTP id
 p186-20020a25d8c3000000b00633c81f737dmr9846734ybg.193.1648220441833; Fri, 25
 Mar 2022 08:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <mw2ty4ijin-mw2ty4ijio@nsmail6.0>
In-Reply-To: <mw2ty4ijin-mw2ty4ijio@nsmail6.0>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Mar 2022 15:00:28 +0000
Message-ID: <CAFEAcA_xpi2kCdHK-K=T3-pbHjWS47xyCzG47wg3HBSKFo4z8w@mail.gmail.com>
Subject: Re: Re: [PATCH] kvm/arm64: Fix memory section did not set to kvm
To: liucong2@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Mar 2022 at 14:42, <liucong2@kylinos.cn> wrote:
> I found this issue on qmeu 4.2 with host linux 4.19, I want to
> use qxl on arm64. on arm64, default page size is 64k, and the
> qxl_rom_size is fixed 8192.

OK, so the fix to this is "use a newer QEMU".

> but when I read qxl_rom region in guest, guest os stopped and
> I can see error message "load/store instruction decodeing not
> implemented" in host side. it is because qxl rom bar memory
> region didn't commit to kvm.

> I only try qemu 6.0 rather than the latest version because
>
> I meet some compile issue. commit ce7015d9e8669e
>
> start v6.1.0-rc0, it will change the default qxl rom bar size
> to 64k on my platform. then my problem disappear. but when
> others create a memory region with the size less than one
> page. when it run into kvm_align_section, it return 0
> again.

This is correct behaviour. If the memory region is less than
a complete host page then it is not possible for KVM to
map it into the guest as directly accessible memory,
because that can only be done in host-page sized chunks,
and if the MR is a RAM region smaller than the page then
there simply is not enough backing RAM there to map without
incorrectly exposing to the guest whatever comes after the
contents of the MR.

For memory regions smaller than a page, KVM and QEMU will
fall back to "treat like MMIO device access". As long as the
guest is using simple load/store instructions to access the
memory region (ie loading or storing a single general
purpose register with no writeback, no acquire/release
semantics, no load-store exclusives) this will work fine.
KVM will drop out to QEMU, which will do the load or store
and return the data to KVM, which will simulate the instruction
execution and resume the guest.

If you see the message about "load/store instruction
decoding not implemented", that means the guest was trying
to access the region with something other than a simple
load/store. In this case you need to either:
 (1) change the device model to use a page-sized memory region
 (2) change the guest to use a simple load/store instruction
     to access it

Which of these is the right thing will depend on exactly
what the device and memory region is.

thanks
-- PMM

