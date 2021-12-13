Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF05472ABB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 11:58:30 +0100 (CET)
Received: from localhost ([::1]:40778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwj2L-00047p-8c
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 05:58:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mwj0U-0002AA-Ht
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:56:38 -0500
Received: from [2a00:1450:4864:20::334] (port=39801
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mwj0R-0002oq-JB
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:56:34 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso13695684wmr.4
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 02:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5z8i8oPl77F0qfGMJykN+D6j0nC3oyyBp5MOIUHSBU0=;
 b=G1/q/ldHLw+Qu8e4nQ8IpQQ+K0T7JQC1i4TwfhPnixYWkp4CeZlB566BIbavqq44At
 Tm020fE+GyaNU56uUrhAvBsrXm77STYXMS0rYNFU1vTknEleoRT2vgWUZAbCbdtxatjy
 MvY+KFStNQRDo1IBzXFvDb/T8c01VIBsXivJnMLDz4GNYhRY2IaU6V4ynDl+GEB5YSww
 dAVe+Wpu1qsOc/oJdntul2ayqqEoJQ5BCj5/GNX7QuNAKEheu+5k+YevT8aKVXzIcXpK
 /kc7RChHcoumsXHckJIDx8/AtG9yOtAGyawdmiv2/a/WNiCdVdcR0FAOh5PEMXevJtfJ
 VVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5z8i8oPl77F0qfGMJykN+D6j0nC3oyyBp5MOIUHSBU0=;
 b=WCA84n7kMsObpcWSwvIDFhJhbWryO+EiSSTMdZdAjZbrcHWGzcro9StSTq7faAXKRd
 SWIP9fqTKpzDtEhtMbJ38fb1DivNi1iTjiTR7oiuI6qO1+vnglu9JH9IxP3+CsQUfIEs
 Q8NMRHiLhX+uWW2Kl+WMY8rsGb1L7bxQFCJ2CYddg6TpEPiJ1JCfSo/+NnhztgTyIlly
 m9tZ99osliY6sIvgvlOQ+y091r0NfhBCbaDwz6qKOHhTvqKJEHagtchfrZiRXpW3E1V3
 HwdAO1Wf1f25Ip1koCBt+lsIUkYNpFxJEW81oL1ag+gqozz3Y/aWavsmGrFY6yYIAPTG
 CP8A==
X-Gm-Message-State: AOAM531QFUJlDmhnYDu8eKujb6kK0FwN/FjbkwpK4qtZrj/pSPOOzeVW
 8aUYi8zFBJ82AsguEoN21zMUww==
X-Google-Smtp-Source: ABdhPJxYAmbOrLDgejyiWzXwHuvpWUgJww7gRt9T9DwH9hPsKBbmRBH1wHUIPUcJ8fzYCgcIOt1K2Q==
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr36566942wmb.1.1639392989835;
 Mon, 13 Dec 2021 02:56:29 -0800 (PST)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id m17sm10220322wrz.22.2021.12.13.02.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 02:56:29 -0800 (PST)
Date: Mon, 13 Dec 2021 10:56:07 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v7 0/8] virtio-iommu: Add ACPI support (Arm part + tests)
Message-ID: <Ybcmx/TK8F7ayt+X@myrica>
References: <20211210170415.583179-1-jean-philippe@linaro.org>
 <CAARzgwxxRfOPbVU+QcYOkGL_pemLWH5x9z9pnhMgKoKOkAgSxw@mail.gmail.com>
 <YbcSOcEy//0DSMtL@myrica>
 <CAFEAcA9Cxi+mucFOv_=beJUkNtcCZRyURO16pB57-MrBeC2YNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9Cxi+mucFOv_=beJUkNtcCZRyURO16pB57-MrBeC2YNQ@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: eric.auger@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 13, 2021 at 10:04:57AM +0000, Peter Maydell wrote:
> On Mon, 13 Dec 2021 at 09:28, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > On Sun, Dec 12, 2021 at 10:19:47AM +0530, Ani Sinha wrote:
> > > On Fri, Dec 10, 2021 at 10:35 PM Jean-Philippe Brucker
> > > <jean-philippe@linaro.org> wrote:
> > > >
> > > > Add ACPI support for virtio-iommu on the virt machine, by instantiating
> > > > a VIOT table. Also add the tests for the ACPI table.
> > > >
> > > > Since last posting [1], I rebased onto v6.2.0-rc4. Note that v6 of this
> > > > series [2] only contained the table and x86 support, which have been
> > > > merged. Everything has now been reviewed and should be good to go.
> > > >
> > > > * Patches 1-2 add the VIOT table for the virt machine
> > > > * Patches 3-4 are minor fixes
> > > > * Patches 5-8 add tests for the VIOT table. They contain the tests for
> > > >   q35 as well, which didn't make it last time because they depended on
> > > >   another fix that has now been merged.
> > >
> > > I believe the entire patchset has been reviewed and you are re-sending
> > > it so that it gets pulled in after the release?
> >
> > Yes
> 
> To be clear, do you mean:
> (1) The patchset has been reviewed, and I plan to resend it (ie a v8)
> to be pulled in after 6.2 releases
> or
> (2) The patchset has been reviewed already as v6, and this (v7) was just
> a resend to be pulled in after 6.2 releases

I meant (2), v6 had already been reviewed and I'm resending v7 to be
pulled after 6.2 releases, sorry about the confusion.  Just for my
understanding, should I have resent this after the 6.2 release, or is this
OK and I should just state the intention for a patchset more clearly?

Thanks,
Jean

