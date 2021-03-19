Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C14E341D05
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 13:37:42 +0100 (CET)
Received: from localhost ([::1]:37872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNENp-0004nX-Cw
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 08:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNEMC-0004Ad-1g
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 08:36:00 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:33586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNEMA-0007am-CM
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 08:35:59 -0400
Received: by mail-ej1-x642.google.com with SMTP id k10so9457296ejg.0
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 05:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=KfuyKxWe9P9ezrEsS2BHH7PlP3MAwLIxKY1IZ3xUGFM=;
 b=lhxWZaqO4mdl7bI935SnUMGETBxqH2wpYKCZK+JIaamct+JOTussE+9fKYNrjpOU1p
 Jcr8T9FJrLxhKw7rHpTnWhsMfM/XdV0jhGAh9cFUzwNkbN5Y2GllD4WpN5xQkarq6gfW
 fUMidtNRQooRZP07bvl2jpPTa1bvc8o/afZUGyPEKzVYa94mw6EMF3h570voq3Z8LWDi
 PhXDOFZvj55dfn4J2XH4kIHCFiyvjsxdE7WPG/D2eLfCh9Xogjl+7nkvjQol1Q0d+Spd
 iTXdN7np4ytJRkPpehRzg0KaZYpq+QvbexTE5TpfzBaf4hvkbqH5K5Qx21Y0YMBOsLzo
 Ckow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=KfuyKxWe9P9ezrEsS2BHH7PlP3MAwLIxKY1IZ3xUGFM=;
 b=c14z0ho+abIX6RsSyNfLcQ/KMUIA6iLRwhcukTWgMkhfHZbt8YTZhreblTde/1tg8p
 o6p2QNZGgKq2Ll9rSTrhvOPcdQSSozKNbdl+xzga8u90hsNZiOFAHHH05Upbk47mvI07
 HNTldYdPjRDHXhR/QmRkJIsJ6Z1RofPl3Y0teTYM8gqD9KyaHJvgA3AvZ4nTJ2az1sv+
 ZaL1CFepJzY8Gn2ZuPYCSMu9KQbrhDtLwRNeBORoBIUvy5qqvKzpxTm995H6V0p1f1MJ
 3RkPSJIWShHaoT6xNO0ahipiJ/8ZuIhQlpsAjYYLjcWz4YQ2ybM1U88+eO9GS5+I2Ohi
 b/dQ==
X-Gm-Message-State: AOAM531o/Yx7me88BTD/xOtKrnwaXUyfrA7u3K4LJPdygvUJYmNywHG3
 J2mv6mAQTa6areG17zpM9h4/dk8y7EGPpkfAy89uvwBNQdKoUl8v
X-Google-Smtp-Source: ABdhPJw0YdkWYzzFfWmsdOe9E1AxdY0EZ+LiEbhIO3hh0A/DgZKzBzL2A9ijdJyl5wvswAGCOAhiMA7I1fWHHJxadzQ=
X-Received: by 2002:a17:906:1ecc:: with SMTP id
 m12mr4070876ejj.4.1616157356241; 
 Fri, 19 Mar 2021 05:35:56 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Mar 2021 12:35:31 +0000
Message-ID: <CAFEAcA_M4zK1aLdO2QdOUgNROTLdHUwLHnCKoUT1BpTcF-cTMw@mail.gmail.com>
Subject: QEMU PCI subsystem: what code is responsible for making accesses to
 non-mapped addresses read as -1?
To: QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm looking at a bug reported against the QEMU arm virt board's pci-gpex
PCI controller: https://bugs.launchpad.net/qemu/+bug/1918917
where an attempt to write to an address within the PCI IO window
where the guest hasn't mapped a BAR causes a CPU exception rather than
(what I believe is) the PCI-required behaviour of writes-ignored, reads
return -1.

What in the QEMU PCI code is responsible for giving the PCI-spec
behaviour for accesses to the PCI IO and memory windows where there
is no BAR? I was expecting the generic PCI code to map a background
memory region over the whole window to do this, but it looks like it
doesn't...

thanks
-- PMM

