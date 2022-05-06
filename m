Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD2851D9FB
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 16:09:07 +0200 (CEST)
Received: from localhost ([::1]:35582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmydm-0004v3-GU
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 10:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <svens@stackframe.org>)
 id 1nmtqc-0005Cf-Dx
 for qemu-devel@nongnu.org; Fri, 06 May 2022 05:02:02 -0400
Received: from outbound3.eu.mailhop.org ([52.29.21.168]:43071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <svens@stackframe.org>)
 id 1nmtqW-0006Ir-NT
 for qemu-devel@nongnu.org; Fri, 06 May 2022 05:02:02 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1651826747; cv=none;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 b=DyrM7zwzopeFlvIzOdc8yLZAQSiWmFNYTC/2GxPaQGU8ZoO2jokwu+4PmBhS9afF7SPtK3hV2oWix
 zwRWuRALOMTFJT9oSZABN2vOJEx3mUAtHdKB+nZRxkR6hIY6QcHKXncs5KmWx5VFKgCb/3ZQCuhXV8
 j80dfmySBs6ZtOkWrZ3yg7455z48abHhg3SzKRC2mDqHgaOZqSNPo2WZjvCTpO50bZPTaL7q5dic42
 t0Vp9oTx7cVs0jkdliOs2bTFe+OqvfMc9HUnqcqRfrubPznIOsMa2kmJ6iKZgz07n/6cAeQCj0hki8
 5afKJe2pZvNOCUEBquEZkXZFlZQ9kzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:dkim-signature:dkim-signature:from;
 bh=3OfKiKCW9mFg7rktq6MOYeLIGN4tBC6CZy8zgkwgdkg=;
 b=W2jzRMdcLVcPBpzViZiIDLb627XIRDRPi7ZwIv0Fz/pwpTHaGGloEq/eS4ek1vKTYBguDQpP2/+rZ
 FMKA+6wi8oF7Rfx+la7GGdO82KmNi7W9qyKdVjOQtjhB34jYLKuafSdXNTGOEEFgac8Mrek2KCg5h1
 MNP6f/z9jrNqIc1dhXZDXudJwHEUj5q/UHv1MWsQS/tlx92wFDWAHb8bwNhA+DYvWqzqcg+MAkYkQw
 BRkzzjWQqGl8Mn1dcl+W7J2OCYDVAN27FKS0JIEzpAAeFovig9Xg5w4TXI1BsWar8C0Hduu4+nQOn4
 iF0Yz6oZjdECRp/q1/834TDDNYubezw==
ARC-Authentication-Results: i=1; outbound3.eu.mailhop.org;
 spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=130.180.31.158;
 dmarc=none header.from=stackframe.org;
 arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stackframe.org; s=duo-1634547266507-560c42ae;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:from; bh=3OfKiKCW9mFg7rktq6MOYeLIGN4tBC6CZy8zgkwgdkg=;
 b=cYoqLLJrqNlxmghA8k3w214b0Eu/TIIHMr9KimU5kljWZgAQPIGr8bXiEP9ASfR7tFqezJuU6c9Bi
 QBxCMx/1YMHc9YBfta+gdKtqI7GZjkuLbU4gEsmPxcNskj8p98wl9ZJXrTQQit5QqZJX7fENwxocSn
 SrQTtV/KPrUYbRGM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=dkim-high;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:from; bh=3OfKiKCW9mFg7rktq6MOYeLIGN4tBC6CZy8zgkwgdkg=;
 b=Jvh3+pwjgwFXd4lH2dLn60jEur+bX3l4VQedpVdA8VBbr7ikSoFkTykFdmFvmj9zdpz0lpI75DuuS
 XBLDam0l+gI5rTUoXevT0T+zvgdr3Qg9oroiQ2uydfz6vkc0VtHEN++blLZ1rwb5AvXWMObePoxUaW
 9f/3SBgeNutSV8Sxe94JGkzh0F2BCYfUZ1OO1FjWEKc7zfp19dbqi7P3829MpTUiCljhSW7ZChsmZV
 K1raqgYL8l5k/qXjKT0WmrO/Ki0b+ejmAkoAzy8J1LAMmtM0cTMLFQAT1NMlXMJ61EeCKaF+i3Umpw
 J49sf/jT+gwi2QGP8m7QX24SW27T7eQ==
X-Originating-IP: 130.180.31.158
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: e9b6f847-cd18-11ec-be1c-8777f00826c1
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net
 (ip-130-180-031-158.um40.pools.vodafone-ip.de [130.180.31.158])
 by outbound3.eu.mailhop.org (Halon) with ESMTPSA
 id e9b6f847-cd18-11ec-be1c-8777f00826c1;
 Fri, 06 May 2022 08:45:44 +0000 (UTC)
Received: from ip-046-005-169-013.um12.pools.vodafone-ip.de ([46.5.169.13]
 helo=x1.stackframe.org.stackframe.org)
 by mail.duncanthrax.net with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <svens@stackframe.org>)
 id 1nmtao-0001Ni-1c; Fri, 06 May 2022 10:45:42 +0200
From: Sven Schnelle <svens@stackframe.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: deller@gmx.de,  qemu-devel@nongnu.org
Subject: Re: [PATCH 0/3] artist: minor fixes and performance improvement
References: <20220504153708.10352-1-mark.cave-ayland@ilande.co.uk>
Date: Fri, 06 May 2022 10:45:41 +0200
In-Reply-To: <20220504153708.10352-1-mark.cave-ayland@ilande.co.uk> (Mark
 Cave-Ayland's message of "Wed, 4 May 2022 16:37:05 +0100")
Message-ID: <87wnez9hhm.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=52.29.21.168; envelope-from=svens@stackframe.org;
 helo=outbound3.eu.mailhop.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 06 May 2022 10:06:16 -0400
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

Hi Mark,

Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:

> Patch 1 updates artist.c to fix some style issues and ensure that artist.c passes
> checkpatch for the remainder of the patchset, whilst patch 2 removes the ROP8OFF()
> macro which is currently unused.
>
> Finally patch 3 is the main reason for this patchset and improves the performance
> of the artist framebuffer by only rendering the dirty scanlines to the display
> surface, which noticeably improves boot times and makes the GTK UI usable on my
> fairly modest laptop.
>
> [Helge/Sven: if you can provide a Tested-by or Reviewed-by tag for this patchset
> before the weekend, I can include it in my PR containing all the other HPPA
> updates]
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>
>
> Mark Cave-Ayland (3):
>   artist: checkpatch and newline style fixes
>   artist: remove unused ROP8OFF() macro
>   artist: only render dirty scanlines on the display surface
>
>  hw/display/artist.c | 33 ++++++++++++++-------------------
>  1 file changed, 14 insertions(+), 19 deletions(-)

I reviewed and tested the patches with HP-UX 10.20 and HP-UX 11.11. Feel
free to add my

Reviewed-by: Sven Schnelle <svens@stackframe.org>

