Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984D7338D83
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 13:50:56 +0100 (CET)
Received: from localhost ([::1]:57352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKhFn-00023P-LJ
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 07:50:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKhD3-00009G-Mu
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 07:48:05 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:34782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKhD1-00065d-NH
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 07:48:05 -0500
Received: by mail-ed1-x532.google.com with SMTP id y6so7753470eds.1
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 04:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rkuq+qbQ+xQQUmcf97+8M3mc/Oami6+rdxnQxUjRSco=;
 b=Y74vs+gS2W3hkJdNo0wjqrYLUPw+cGzV0xEjn+16mG6q8yMMUWWjTKA7jcO6OEm4hd
 snQrWRdexHyTKi6dwzqegWvCAE0ieIaUtW9b4gfDgGPFDXWdnUqJKCM/jKmnUYPB984v
 AcRLjm7nTgjcO57Jr3FU0OAvfjGytAPrb04RWT8f5+XFKs1ljvlerJnx2iLj4DPwtSrv
 cOm4OsYGh4JUyb/GAKgc0II3a1Jw5sGmzlYuxGSItL8LbEFXExL5lmnBdGJnymghpqez
 oWLmBHJgVCkFuqwbpI5izL50OHQhDz5pgqT8/md3RgPsTUmv3FHDJ0/d/AFxVCaco7ao
 YU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rkuq+qbQ+xQQUmcf97+8M3mc/Oami6+rdxnQxUjRSco=;
 b=IFKVQWojrycs2K54SDUnrAHl3LfTMaBefogaTYtylcBo1ZncfoJs7EcBAenVgvH6NS
 1wwVUOs1kU7ovMpe+utljSgeBpHQoQyLPK4tJEiRHHLdAZ07EYHDV+FhyXtbt3U73bnV
 hJkJf+9YsX9or0Dgbdne7NFxkmaoCOlmxNL8v00z5sIuB/lBvp1dkvmsQjjzDeBnS7zb
 TR7cipHay+6PXDGq2GQGYLDyuFc/2OkYSSSUcP32qx/vGqCIZ8TXcbdr18E0vNMfUWKi
 rm7G4He/kqwujC82W1CU3HUsctf2/ZJ7M6ZUKtGcijHGVIy1wU2OYZRrgMpyAsv5dmdD
 PX6g==
X-Gm-Message-State: AOAM533LBU5JnzCEHeqGR0bnheHIOEbwompTMWQGBKUvXWFi4Lz30VKC
 17c9n28lsjpWte0jVtQisUScYiO+PZMiSRw5XhiVuA==
X-Google-Smtp-Source: ABdhPJwipEMVDwxtJWPiVWoYvjSg0dXiBP7vK9OWWIA0TpwkgpMHNTDwJyaJYnW6734A9bx3aHvwgAJtp+pdHkHbtgA=
X-Received: by 2002:aa7:d686:: with SMTP id d6mr14259970edr.146.1615553282084; 
 Fri, 12 Mar 2021 04:48:02 -0800 (PST)
MIME-Version: 1.0
References: <20210310135218.255205-1-drjones@redhat.com>
In-Reply-To: <20210310135218.255205-1-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Mar 2021 12:47:43 +0000
Message-ID: <CAFEAcA__Lm7D8SWKMB8bkUggeoyNFpUZ8-jfYFJa_yjOWmMY3w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/arm/virt: KVM: Set IPA limit when possible
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marc Zyngier <maz@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Mar 2021 at 13:52, Andrew Jones <drjones@redhat.com> wrote:
>
> This series fixes IPA limit setting for mach-virt KVM guests. The
> first patch restores the setting of IPA limits for values greater
> than 40 (the default) when necessary. The second patch ensures values
> less than 40 may also be used. The default KVM type=0 (which means
> an IPA limit of 40) is still used for legacy KVM, since it must be.
>
> I tested this with a KVM that supports KVM_CAP_ARM_VM_IPA_SIZE and
> with a KVM that does not. mach-virt's memory map didn't allow me
> to test with less than 40 on the KVM_CAP_ARM_VM_IPA_SIZE supporting
> host, but a quick VM fd opening test seemed to prove KVM would be
> happy with that. Testing was done with a typical Linux guest and also
> with kvm-unit-tests.
>
> I caught the bug that the first patch fixes by instrumenting QEMU
> to observe which IPA limit was getting selected, and then seeing
> that QEMU wasn't actually running mach-virt's kvm_type method at
> all!



Applied to target-arm.next, thanks.

-- PMM

