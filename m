Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F333348ACD4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 12:42:12 +0100 (CET)
Received: from localhost ([::1]:59856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7FXY-0004gy-2y
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 06:42:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7FTY-0001hE-Kf
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 06:38:05 -0500
Received: from [2a00:1450:4864:20::433] (port=45998
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7FTM-00079t-2G
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 06:37:53 -0500
Received: by mail-wr1-x433.google.com with SMTP id q8so32291396wra.12
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 03:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kfAlg0BmOdO8PmtpeYdJODosWlHTEx0eTaEkw8HbZIk=;
 b=FyYXMcBaSg1ec6x16vXZa+jv2zF2wBlsiYCP7hJXB6v7a45IjA0PQafALoapCunyjR
 u77G91ySNsfAF4TgtP5r5iGvxzxvM3avZJYzVbirTR6J6wC+1KKQgC/ey3fzHOUSf4sC
 FeQY0PaRPNIFfQhqOcgKo3BKscIq0j7t2gAjvFkXuTW1G2PT5EwCrwQN4HpbgLcgg+bn
 sHYp2mYCFjBh0QsCALn7mvkgHX0D4z0riM97qdTbn1JOFeKNMJkCigmGw3Ze1inQe1VD
 IudHFLQuEY+U8A0j+7tysKLaKbtac7XfOpjN2DcPLBky7m1Z/hrWXjz76PzmHyyOljVV
 7CUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kfAlg0BmOdO8PmtpeYdJODosWlHTEx0eTaEkw8HbZIk=;
 b=t6Io9qpR88DIO5p6xUMIvDvCl/gpCBkwdaGCElc88kF8vbDJ9x29LNcyCCLDqeAw68
 +bvyrinIz/YRKI/WQaZh0gn33hJ6je7HumlOg+MMTI5VSn2Rzxfn4Sov504wN43sQ/mk
 DFJXRwZAOs0brioESvr2uadlbUXZ5h0yrjH3HoVvFOxDFSUqw1GVAtX+lXU5PYep0449
 hzPs8UG97RO3SsyaRtskKv8hNKi6NRuJkgt/lLsPfRKZDPDU8/FxgJBmBIZDkTDnQ9X0
 rsg2Ktg60ZFQxPsJMd15DMYnPZeeE/qTaUipiDvbwxQX8cFEY9ZBMI+AnGqZJeCVrZv3
 KMbA==
X-Gm-Message-State: AOAM532KSeekKE7CVvnnnyo67j+NUBbwKIclHVpY98eDgdcTHC+E4ABg
 YqGTuzMwnCpguaZWhVwXAIHfDsjxGLhGaBQ4GGYCkg==
X-Google-Smtp-Source: ABdhPJzfF9uAd1BbiWbDN1OoSG1qeF7LLTRZ8fhtugPaJXcbfy+u7guUpePxOtjdDFNnPV8/Gfmb/QYl/NAn9m68LCo=
X-Received: by 2002:adf:e907:: with SMTP id f7mr2746085wrm.319.1641901070143; 
 Tue, 11 Jan 2022 03:37:50 -0800 (PST)
MIME-Version: 1.0
References: <20220110210416.18779-1-mst@redhat.com>
In-Reply-To: <20220110210416.18779-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jan 2022 11:37:39 +0000
Message-ID: <CAFEAcA8Uk9eu2eW2RfwUqd22BOyrCidEdmX-OHfAnnLVheHNmw@mail.gmail.com>
Subject: Re: [PULL v2 00/10] virtio: revert config interrupt changes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 Jan 2022 at 21:04, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> Changes from v1:
> added tags to commit logs.
>
> The following changes since commit ca745d2277496464b54fd832c15c45d0227325bb:
>
>   tests: acpi: Add updated TPM related tables (2022-01-07 19:30:13 -0500)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to a882b5712373171d3bd53cd82ddab4453ddef468:
>
>   Revert "virtio: introduce macro IRTIO_CONFIG_IRQ_IDX" (2022-01-10 16:02:54 -0500)
>
> ----------------------------------------------------------------
> virtio: revert config interrupt changes
>
> Lots of fallout from config interrupt changes. Author wants to rework
> the patches. Let's revert quickly so others don't suffer meanwhile.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

