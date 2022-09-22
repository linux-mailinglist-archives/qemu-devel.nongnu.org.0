Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB14B5E6790
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:51:19 +0200 (CEST)
Received: from localhost ([::1]:51622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obOTu-000326-Rq
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=dGS3=ZZ=zx2c4.com=Jason@kernel.org>)
 id 1obNJD-00045x-9d; Thu, 22 Sep 2022 10:36:18 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:44452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=dGS3=ZZ=zx2c4.com=Jason@kernel.org>)
 id 1obNJ8-0000eD-0r; Thu, 22 Sep 2022 10:36:10 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 74A20B8231D;
 Thu, 22 Sep 2022 14:35:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39CB4C433D6;
 Thu, 22 Sep 2022 14:35:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="OsmLJQAx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1663857352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hvyomB6566Uv4Ym3LQ/XBV23wDrmT/EVwcymKdAg4gw=;
 b=OsmLJQAxLqzc+z2FKkh1QxO9XAInHquNzpdVqvBFCD+OcLb1/Jxm04awqhpKWdIonmoy2s
 Jez61dhoTFA7Y6Yzr0426hupGaPiFNZqrguo9oZlyF2acBq+7egwVsWNdmtSO31QoK915y
 mfXUqoLJFIkIo8Zr2Wk5MCpL/JvdY+s=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 253e67f6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 22 Sep 2022 14:35:52 +0000 (UTC)
Date: Thu, 22 Sep 2022 16:35:48 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
Subject: Re: [PATCH v8 1/2] target/s390x: support SHA-512 extensions
Message-ID: <YyxyxCZH4X5n7Rdy@zx2c4.com>
References: <20220921100729.2942008-1-Jason@zx2c4.com>
 <793e6018-da21-2247-1348-ad0e62030e25@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <793e6018-da21-2247-1348-ad0e62030e25@redhat.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=dGS3=ZZ=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
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

On Thu, Sep 22, 2022 at 03:07:13PM +0200, David Hildenbrand wrote:
> +        if (processed >= MAX_BLOCKS_PER_RUN * 128) {
> +            break;

If you make this a `goto out` or similar instead of a break, then you
can

> +    if (type == S390_FEAT_TYPE_KLMD && len < 128) {

change that to `if (len)`.

> +        /*
> +         * Pad the remainder with zero and place magic value 128 after the
> +         * message.
> +         */
> +        memset(x + len, 0, 128 - len);
> +        x[len] = 128;

"magic value 128" ==> "set the top bit"

Aside from these nits, this refactoring looks fine. I haven't tested
this or checked the crypto carefully, but if it passes all the Linux
test vectors, hopefully things are still fine.

Jason

