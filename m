Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 785E95EAAD8
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 17:25:36 +0200 (CEST)
Received: from localhost ([::1]:57850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocpzC-0007Lz-NB
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 11:25:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=WzR3=Z5=zx2c4.com=Jason@kernel.org>)
 id 1ocpuD-0001jm-Ne; Mon, 26 Sep 2022 11:20:25 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:44378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=WzR3=Z5=zx2c4.com=Jason@kernel.org>)
 id 1ocpu4-0004CU-9K; Mon, 26 Sep 2022 11:20:18 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E529360E84;
 Mon, 26 Sep 2022 15:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB816C433D7;
 Mon, 26 Sep 2022 15:20:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="NlpnAiPN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1664205609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dh8DSIdIOgSmP7moI8yhN+L1d6Frg38PahXDEEb87Ao=;
 b=NlpnAiPNmXT+o6V9KwL8F5PzhNXliqexV3XyAcinxYGSEGB00Sl8GYq6SqZpwGQQLhOwOD
 Jf2bg+jRVVBXmGyhQxLfToLxrnOZVIpZWXulwSKhYC7E1bgcLAoNf+853KgmvC2TnJE5vw
 BCIE47Bku8x/pGX4oujzbz3WDq0m3p4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7b61e4de
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 26 Sep 2022 15:20:09 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id q26so6890791vsr.7;
 Mon, 26 Sep 2022 08:20:09 -0700 (PDT)
X-Gm-Message-State: ACrzQf2L1u7mw2QK0ONmvUU+K979E4+yBvHSdnJY0ngFxo1aa3+mm+qR
 jSTKkIdmeeSYCaAnyOlmuXJY5gr6llXtpfieiVA=
X-Google-Smtp-Source: AMsMyM7I4mih1yjOwKIvvC3SpBgjnNwquNXkgfjn+t2WTl+pjI0jfYfRpyHaogEyJXSv1Ma8OA+Lnm2zX0ltjGULOQ8=
X-Received: by 2002:a67:c289:0:b0:398:cdc:c3ef with SMTP id
 k9-20020a67c289000000b003980cdcc3efmr9182373vsj.76.1664205608060; Mon, 26 Sep
 2022 08:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220921100729.2942008-1-Jason@zx2c4.com>
 <20220921100729.2942008-2-Jason@zx2c4.com>
 <1ab81fe3-07d6-28f6-0f34-61eda592e1d8@redhat.com>
In-Reply-To: <1ab81fe3-07d6-28f6-0f34-61eda592e1d8@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 26 Sep 2022 17:19:56 +0200
X-Gmail-Original-Message-ID: <CAHmME9pDy+9pL=Qdxda8WqX3ZEGud7RDd=3z6gop1B0EJpBWOw@mail.gmail.com>
Message-ID: <CAHmME9pDy+9pL=Qdxda8WqX3ZEGud7RDd=3z6gop1B0EJpBWOw@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] target/s390x: support PRNO_TRNG instruction
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org, 
 David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, 
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=WzR3=Z5=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 26, 2022 at 5:11 PM Thomas Huth <thuth@redhat.com> wrote:
> Seems like this is even working fine with older Linux kernels ...

Oh good!


 your patch accidentally broke test_s390x_devices in
tests/avocado/machine_s390_ccw_virtio.py: This test adds two
virtio-rng devices to the guest, then ejects them to see whether
/dev/hwrng will be gone ... which does not happen anymore with the
prno-trng feature enabled :-)
>
> I'm going to squash this one-liner to fix this issue:

Seems reasonable. Thanks.

Jason

