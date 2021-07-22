Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4F43D273A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 18:04:47 +0200 (CEST)
Received: from localhost ([::1]:44310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6bBS-0003Ip-3f
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 12:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matz@suse.de>) id 1m6b8M-0007WE-T7
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 12:01:20 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:56840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <matz@suse.de>) id 1m6b8L-0002g9-FU
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 12:01:14 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 84A5D1FF1F;
 Thu, 22 Jul 2021 16:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626969670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1xPy0TNPfyl/3V1vS+JTOUVaboI57/4pFaoCPhONimo=;
 b=Zdd246pLHgme5nbE7/r088JGYZwyCEUBtVyto3jNMdTEneL8iQr26bXIx0orXb0qHIkOzc
 sLmmsCikjHbcigUZhcqE7muBm4v+56vzmqvQNYv6QE1RCB2lBUUDEXk7OQkbLjqpTHnidI
 JuNor3a9FPDgcbU3WI/BIm0r0xhG4hU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626969670;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1xPy0TNPfyl/3V1vS+JTOUVaboI57/4pFaoCPhONimo=;
 b=TmKkSnbCtp+BbYDvOGsWmfhTgLP5lBhMOtRNM8exkbUiNt9RpD7wwN/nUQ0Poju20qYyO9
 afj/YOzuh96CKrAw==
Received: from wotan.suse.de (wotan.suse.de [10.160.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 66B58A7C41;
 Thu, 22 Jul 2021 16:01:10 +0000 (UTC)
Received: by wotan.suse.de (Postfix, from userid 10510)
 id 5CEF665E3; Thu, 22 Jul 2021 16:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by wotan.suse.de (Postfix) with ESMTP id 5BA0E6562;
 Thu, 22 Jul 2021 16:01:10 +0000 (UTC)
Date: Thu, 22 Jul 2021 16:01:10 +0000 (UTC)
From: Michael Matz <matz@suse.de>
To: Richard Biener <richard.guenther@gmail.com>
Subject: Re: Disabling TLS address caching to help QEMU on GNU/Linux
In-Reply-To: <CAFiYyc2UuO8qXhwzVQ63DhPPiBjecm7rzY2t4Z-UMiserEfKKQ@mail.gmail.com>
Message-ID: <alpine.LSU.2.20.2107221554460.10537@wotan.suse.de>
References: <87im15qbp3.fsf@oldenburg.str.redhat.com>
 <CAFiYyc2UuO8qXhwzVQ63DhPPiBjecm7rzY2t4Z-UMiserEfKKQ@mail.gmail.com>
User-Agent: Alpine 2.20 (LSU 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=195.135.220.29; envelope-from=matz@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Florian Weimer <fweimer@redhat.com>, GCC Development <gcc@gcc.gnu.org>,
 GNU C Library <libc-alpha@sourceware.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On Thu, 22 Jul 2021, Richard Biener via Gcc wrote:

> But how does TLS usage transfer between threads?  On the gimple level 
> the TLS pointer is not visible and thus we'd happily CSE its address:

Yes.  All take-address operations then need to be encoded explicitely with 
a non-CSE-able internal function (or so):

  &x --> __ifn_get_tls_addr(&x);

(&x in the argument just so that it's clear that it doesn't access the 
value at x and to get the current effects of address-taken marking of 
ADDR_EXPR).

(Or of course, ADDR_EXPR could be taken as unstable when applied to TLS 
decls).

Quite a big hammer IMHO.


Ciao,
Michael.

