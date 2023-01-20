Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2A06758C9
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 16:37:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pItQc-0005uE-2t; Fri, 20 Jan 2023 10:35:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pItQa-0005u5-R4
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 10:35:40 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pItQZ-0002OF-9O
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 10:35:40 -0500
Received: by mail-wr1-x42f.google.com with SMTP id y1so694548wru.2
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 07:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/Bp91F76p8yDAlB6xjIessVN87qm5ZP706CxYxBHeTo=;
 b=eej6SzOpTulHCsS3g6yVLiSA57a1NARfSGOVl2sFW3EiWstINzoi0j6bkqp6bNwivn
 ptVd535l34U+OUE0QexJxpF57dir/wSzYNO/9ADWKPJOFWxqZyg7etXY4hZl3UqvSnKK
 +Q5LfGgaKvUb51+37GUuglfvK3UKZaTkMnrmFAHljvxMh+V8+lWLoLavW0GXTbTHyQmJ
 qZIJNDIOE3Z0Dxib5w2fflkbTTC4FkH6QyHeGiYpxNeq+P/nFOhkBwWwBA8K4VaBXaHO
 zLenKelllAMNqtEXB6XshaF/J/05c2AY9xEvsIa3xjectcR/hAjPN5VZZBhRFtFlcSuW
 kurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Bp91F76p8yDAlB6xjIessVN87qm5ZP706CxYxBHeTo=;
 b=LNLRXeBDSOGxT0Qla+0XPvZarlOIm8pcCLMnplK40Bi2HkHeoJKC7Y4+Dz+RuUU+pb
 gvSsydXRowqloQHIO8s/dg30LEvFl0ix/ysL7DfhFkbftOD2Fp4z1vsgspcA8zaIh/nD
 dhh8kmC5Q7WhVYxmbU6Bt9djWJmEiWetcb6otY0MTLRzQD4qP1xc1CmpvsXNmTjII7Ph
 LBUHh3lCb5WFp/gH67uH1ryrsHq44jI69oemq551dMsLZn2YCHKZbXr8ZGyldIbP2TYg
 1jBtdmcPYa3wzbH1aFCF0lPL9YUVL8NASXL80XoUzvcpqH/45bA3YZqC20AdmD/TawGQ
 KaMg==
X-Gm-Message-State: AFqh2kpZ7U/jmaeOVM38gHXaUHSoBkKYL1wWm69oFVPHetDt1h3Hz2oU
 KfML+bhbTgm0cvQXzXMEi/MfjA==
X-Google-Smtp-Source: AMrXdXvQql7Bts8x9mVTbXe/m+3dbEcp4q3F6hYhyWIFAzcGZKl/z6TGwokxROrAlsICxpRLxUH6+A==
X-Received: by 2002:adf:e7ca:0:b0:2bd:d26e:d916 with SMTP id
 e10-20020adfe7ca000000b002bdd26ed916mr21787957wrn.36.1674228937108; 
 Fri, 20 Jan 2023 07:35:37 -0800 (PST)
Received: from myrica (054592b0.skybroadband.com. [5.69.146.176])
 by smtp.gmail.com with ESMTPSA id
 u5-20020adfdb85000000b002ba2646fd30sm42964190wri.36.2023.01.20.07.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:35:36 -0800 (PST)
Date: Fri, 20 Jan 2023 15:35:32 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Eric Auger <eauger@redhat.com>, qemu list <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Subject: Re: virtio-iommu issue with VFIO device downstream to a PCIe-to-PCI
 bridge: VFIO devices are not assigned any iommu group
Message-ID: <Y8q0xB6m7zCd4TEt@myrica>
References: <0bc2f2e5-630e-e721-254d-f224d1a3bdcd@redhat.com>
 <0eb96eb5-703d-dacd-49ff-f61e02d98eb9@redhat.com>
 <Y8FQ9li7gQ+bPiRe@myrica>
 <20230113105700.2d860fbe.alex.williamson@redhat.com>
 <Y8g0YQ4NylOUzeUW@myrica>
 <20230118112832.261d6bea.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118112832.261d6bea.alex.williamson@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42f.google.com
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

On Wed, Jan 18, 2023 at 11:28:32AM -0700, Alex Williamson wrote:
> The VT-d spec[2](8.3.1) has a more elegant solution using a path
> described in a device scope, based on a root bus number (not
> susceptible to OS renumbering) and a sequence of devfns to uniquely
> describe a hierarchy or endpoint, invariant of OS bus renumbering.

That's a good idea, we could describe the hierarchy using only devfns.
I think I based VIOT mostly on IORT and device-tree which don't provide
that as far as I know, but could have studied DMAR better. One problem is
that for virtio-iommu we'd need to update both device-tree and VIOT (and
neither are easy to change).

But it's worth thinking about because it would solve a problem we
currently have, that a virtio-iommu using the virtio-pci transport cannot
be placed behind a bridge, including a root port, because the firmware
tables cannot refer to it.

Thanks,
Jean

