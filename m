Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3703D527AF2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 01:51:35 +0200 (CEST)
Received: from localhost ([::1]:56588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqO1N-0002qv-Sj
	for lists+qemu-devel@lfdr.de; Sun, 15 May 2022 19:51:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nqNzz-0001yi-AK
 for qemu-devel@nongnu.org; Sun, 15 May 2022 19:50:07 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:45593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nqNzx-0003oW-Kx
 for qemu-devel@nongnu.org; Sun, 15 May 2022 19:50:07 -0400
Received: by mail-pf1-x42a.google.com with SMTP id y41so12559402pfw.12
 for <qemu-devel@nongnu.org>; Sun, 15 May 2022 16:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NGFo2ruGeuIS0xCiaiAwaCSdYI+I5oeZTVL+Ez+rSZI=;
 b=UazO7mpf+4YkywLffaZmTGPYLLNhJERO3WTnIMbKOn5P6IVQ9bLkyZkxB9w+ICWhMS
 kGEOc+4GZ7Sk2pQAcDpUMMAiGVeO1BGGXNsSnVOC3pZW9BK8zi/fZHFtzCLgMpv15eZQ
 2mqxJETYnafgn4XRD+vSoK8uxAhPzeooKQPxTkfN/jhaFLcmg4p/000X0QJDqqUrkurK
 0VdPnfdmfAMz4PuRm75/4uEVysM7IJ5D8qv4IhnV7rugfXIbbVVgXkhlevAS7/8wKb7k
 wwUZxbaH60h27R0af3N4A0VNmc0nwwwFsUObx7M6ngjkf/enyMvnVaJPu+JrpM4wPL9s
 Zq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NGFo2ruGeuIS0xCiaiAwaCSdYI+I5oeZTVL+Ez+rSZI=;
 b=BXVS/qUtYTj3GD/PBFJ+vqYUt6gKtMzQ42rFHJT5C3OZxMCPz3xz5EtnaWh6lj9MiX
 r6Yn7T5DqOee/xV5o23ue36rsflkWcTebvCQNavjH+iNXDEElcklZ/O5J6SnLr+Fcd4q
 w1WtYplhGJ4cv7iNFR5kVvEjB6TMkNTDe0v4CfzBHnAz/PPTmqFejWYMnAqrUIYiajq+
 6IzmQxFa+vncw0QiMgLiwaIUQi/Zw66gde0j+zxG4hqJEwd3xHzY3nySw3iXlKZHCi2M
 YuhLG6C844fnfp5lCXQKU/qU+PPq1KZSjBTctdwjiBUmLlk7OsT6bitMRfrE7ZEz07sA
 bJcg==
X-Gm-Message-State: AOAM530N3m+Zd9ac36qpJXqPwU4VHBGBeq7e19n/ZxsOoY3XVdHH+AtJ
 E7j1LO5Papt1/ZX0sf43oUE=
X-Google-Smtp-Source: ABdhPJwEqAe98nmmWD34JvRK7x454hdiPsE/0AYB4cZBhKfxapMzgN39zZpxxMvS6FjkL1pkbLzXXg==
X-Received: by 2002:a63:181c:0:b0:3da:fe5d:90f3 with SMTP id
 y28-20020a63181c000000b003dafe5d90f3mr13139940pgl.350.1652658604223; 
 Sun, 15 May 2022 16:50:04 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 io17-20020a17090312d100b0015f4b7a012bsm5568978plb.251.2022.05.15.16.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 May 2022 16:50:03 -0700 (PDT)
Date: Mon, 16 May 2022 08:50:02 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Development <qemu-devel@nongnu.org>,
 Openrisc <openrisc@lists.librecores.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PULL 0/4] OpenRISC fixes for QEMU 2022-05-15
Message-ID: <YoGRqvZp/nb0RyZt@antec>
References: <20220515013948.2993495-1-shorne@gmail.com>
 <41d45d1e-8f2e-9201-fca4-f2f9c68af5b1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41d45d1e-8f2e-9201-fca4-f2f9c68af5b1@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=shorne@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sun, May 15, 2022 at 04:12:50PM -0700, Richard Henderson wrote:
> On 5/14/22 18:39, Stafford Horne wrote:
> > The following changes since commit 2e3408b3cc7de4e87a9adafc8c19bfce3abec947:
> > 
> >    Merge tag 'misc-pull-request' of gitlab.com:marcandre.lureau/qemu into staging (2022-05-03 09:13:17 -0700)
> > 
> > are available in the Git repository at:
> > 
> >    https://github.com/stffrdhrn/qemu.git tags/or1k-pull-request-20220515
> > 
> > for you to fetch changes up to e8f0ab0cd674241cbab7231ce05ac1bfa0b4f5ed:
> > 
> >    target/openrisc: Do not reset delay slot flag on early tb exit (2022-05-15 10:33:01 +0900)
> > 
> > ----------------------------------------------------------------
> > OpenRISC Fixes for 7.0
> > 
> >   - A few or1ksim fixes and enhancements
> >   - A fix for OpenRISC tcg backend around delay slot handling
> 
> Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.
> 
> The gpg key I have for you is expired.  Have you refreshed the expiration
> date and pushed the new copy somewhere?

Hello Richard,

I updated my PGP key (C3B31C2D5E6627E4) last year or so to extend the expiry
day.  It should be uploaded to pgp.mit.edu, but for some reason that server is
not responding to searches for me right now.

I have also just uploaded it to keyserver.ubuntu.com if that helps.

 - https://keyserver.ubuntu.com/pks/lookup?search=stafford+horne&fingerprint=on&op=index

    sec  rsa4096/C3B31C2D5E6627E4
	 created: 2016-09-14  expires: never       usage: SC

If you still have any issue I can try to work it out.

-Stafford

