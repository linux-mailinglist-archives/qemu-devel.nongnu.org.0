Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC724636D1
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 15:35:12 +0100 (CET)
Received: from localhost ([::1]:42234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms4Dv-00015j-5l
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 09:35:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ms4Bs-0008Bd-0V
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 09:33:04 -0500
Received: from [2a00:1450:4864:20::42f] (port=36805
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ms4Bq-0002yv-J9
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 09:33:03 -0500
Received: by mail-wr1-x42f.google.com with SMTP id s13so44933844wrb.3
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 06:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=V6Gf+qT0tjJ3Ej94H47FEmAmgR9MXVQtNynUfameEr8=;
 b=JpstAXZfeBngJrwQf3Acaz7Nutz+9C0/RKojvhP2FwnF+gluPpN6I5vqfMQmSJDtw5
 OOWXMqGY1sFQmkccQKh/aQFlRgZuXDWHDYZBchnK96Ju3q/KsFW7IzVH6rw96AxLysKA
 +u2zA6OZsaLBjOTqdgtiCr5TcZSMcSZNEl315lIrOaQD4jxZ7QXbbNYn8FirWCd4Gn1m
 VR6XQXvHuNM8mEgX75tRkXmMHxhHlVeyIa8UdaRIZGmVa7l4LQZEIPTFabZsyHSUIobw
 xqcOQ8lBpX4QBu82QQkvBHbf6L/NkR3MGBSW9Wp5+87qj6SBtu80vxusXXRHDmedhdFs
 103A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=V6Gf+qT0tjJ3Ej94H47FEmAmgR9MXVQtNynUfameEr8=;
 b=IcfM+mvtRWsd+zW6XVktZrFZs79Xi6rUBMItrOfsobqmmADd+0a9oujdWEhizwh9xf
 +aGDfVi3Vz+ExhjMyu1F/DP3nfbxWgh84P2xaKul3t8Nc+25X3OpmrB9zZtPWo4HmDny
 tzkw0/pu9szdPJVLjVTQo2LwTAkNL970T+Sx+ridfJRnE1s71NspT/XoIVuEA78LVEUo
 /oFKn5TC3j3vQ5A8higW1D+HnpqzYrRJG3kGySAg5uCou2RcN0ew1aoCbPugZu20Ftt2
 +oKXTAXZIjRDNLorafIEGwY6GK7vKB3AgJHjfmuYDEZei34YS445/ai7mZ4cZcijBcwb
 DB+Q==
X-Gm-Message-State: AOAM530wv7j/6QQdj16DOYn3Oq4mHteIvsH+zRVB6WtzgUuMFbEh9VJj
 nCCAsoU3et9MPJI/jCXn/shCq4xtteLR7IpA6ZA5dMT9X6Q=
X-Google-Smtp-Source: ABdhPJx9yF+/Ue64lTnTR9KmWWYKwzElssvzEgm5qs3ZRnpCC4paMcQ9l2tx/mOPEDGDnmBsYBb5zvn1B+rU2eW3Wqk=
X-Received: by 2002:adf:f0c5:: with SMTP id x5mr39024870wro.484.1638282780425; 
 Tue, 30 Nov 2021 06:33:00 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Nov 2021 14:32:49 +0000
Message-ID: <CAFEAcA-Fb15x7hAe-g8hP8HL1xB14iGnYi5=ZJM=0G0_hbBjTw@mail.gmail.com>
Subject: why is iommu_platform set to off by default?
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eric Auger <eric.auger@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've just spent a day or so trying to track down why PCI passthrough
of a virtio-blk-pci device wasn't working. The problem turns out to be
that by default virtio pci devices don't use the IOMMU, even when the
machine model has created an IOMMU and arranged for the PCI bus to
be underneath it. So when the L2 guest tries to program the virtio device,
the virtio device treats the IPAs it writes as if they were PAs and
of course the data structures it's looking for aren't there.

Why do we default this to 'off'? It seems pretty unhelpful not to
honour the existence of the IOMMU, and the failure mode is pretty
opaque (L2 guest just hangs)...

thanks
-- PMM

