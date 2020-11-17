Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A522B5FFE
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 14:02:17 +0100 (CET)
Received: from localhost ([::1]:50936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf0ci-00089y-Ho
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 08:02:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf0bW-0007XX-22
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:01:02 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:40605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf0bS-00010t-C0
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:01:01 -0500
Received: by mail-ed1-x544.google.com with SMTP id d18so9427885edt.7
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 05:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+X51H+JR2YtV3L/TnwbSz2/CMGKds9rP2sOT7FXmHgs=;
 b=svyZ+uNrlPPK8kCPlLj0lpzSCsCBl4VWslePcRmD1I+B+OcIzsE11ol16U0CP0Xk7D
 nCQXeotQdw9aPa16NMJu6kUdCrcBsUKuXJsvwPgEpRmVDeiiufbiRxMdqAlxoaFtOEol
 Cdpf12uQa1EXq3vOymVfJ8R/WW1+5IrCsjn+hnSznYK84MLwTvh8xQZEH/x8vSNho3qf
 UV7/HkY4C0CLEdkPlzZbzf8eY0H5XzDtNx0M5/07ZADS6D3HB/lJ8HObR0YzjhihiZzV
 cvpOjlJ0hFbJwjyGcQ1RRp0EKukR2BXce0+pBzgAixZrWxZ3rxY10gXpt9RKxJfe6Qh1
 PdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+X51H+JR2YtV3L/TnwbSz2/CMGKds9rP2sOT7FXmHgs=;
 b=hg74p2+GM1zBwGa2LoTrvBNmYDh4UfFZGCOW32tHMC3jn5xdQHotBfYMgydwFYSzIF
 o3B2rHc8kmaZTjxms2UQohh3egGVMeR+DEGPfqcEGhk4sszJKx5MlnX5RkD7D3Kcn7SG
 LyZnovc0tLuO+os97HKlXtaCBsVrGcUPUaVPQ+5wUiva/F0OZ8ZOhjNhWZEhNllTsHyl
 ciM7vkK64YWwIksF6ntxDFjG1whZHqLOCXtEzYiopd8VOJ+nlIF82zTSuSIpINiM5rn5
 h00MUZvPMmE2HFYEmA844pYpvPKBeI1lBWfQ+A9wvR3XMy3B+4IOmsTfljSKaSL0QTrW
 gWKQ==
X-Gm-Message-State: AOAM531JcaVpIiRCGXvGt6rpfywfxS0+tStqmEPgBnLBSFlzL8xOqf3H
 bSNqD8G1NwJahEGaamEnS2Xbdod4psYGzUyteuExOg==
X-Google-Smtp-Source: ABdhPJxYJ9DASzHcHMG4+jgeSggaEUAyrbdl7y+VfAiS2vAXxyhpYeO1tJSexzEer0rqVm4mP5NT+12vgfdRtefYOlc=
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr21164247edb.100.1605618056554; 
 Tue, 17 Nov 2020 05:00:56 -0800 (PST)
MIME-Version: 1.0
References: <20201117120115.1234994-1-philmd@redhat.com>
In-Reply-To: <20201117120115.1234994-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2020 13:00:45 +0000
Message-ID: <CAFEAcA-c3hw2w23OR0moKDYuvyD3O=Bqjp3fiid0byH7K+nr-Q@mail.gmail.com>
Subject: Re: [RFC PATCH-for-5.2] hw/s390x/pci: Fix endianness issue
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Nov 2020 at 12:03, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Fix an endianness issue reported by Cornelia:
>
> > s390x tcg guest on x86, virtio-pci devices are not detected. The
> > relevant feature bits are visible to the guest. Same breakage with
> > different guest kernels.
> > KVM guests and s390x tcg guests on s390x are fine.
>
> Fixes: 28dc86a0729 ("s390x/pci: use a PCI Group structure")
> Reported-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> RFC because review-only patch, untested
> ---
>  hw/s390x/s390-pci-inst.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index 58cd041d17f..cfb54b4d8ec 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -305,7 +305,7 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintpt=
r_t ra)
>          ClpReqQueryPciGrp *reqgrp =3D (ClpReqQueryPciGrp *)reqh;
>          S390PCIGroup *group;
>
> -        group =3D s390_group_find(reqgrp->g);
> +        group =3D s390_group_find(ldl_p(&reqgrp->g));

'g' in the ClpReqQueryPciGrp struct is a uint32_t, so
adding the ldl_p() will have no effect unless (a) the
structure is not 4-aligned and (b) the host will fault on
unaligned accesses, which isn't the case for x86 hosts.

Q: is this struct really in host order, or should we
be using ldl_le_p() or ldl_be_p() and friends here and
elsewhere?

thanks
-- PMM

