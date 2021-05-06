Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E920374D5B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 04:17:38 +0200 (CEST)
Received: from localhost ([::1]:59242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leTa5-0005BN-Hl
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 22:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1leTYl-0004VV-A0; Wed, 05 May 2021 22:16:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:57800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1leTYc-0003Vu-6d; Wed, 05 May 2021 22:16:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0077D610E9;
 Thu,  6 May 2021 02:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620267359;
 bh=315VFlN7UhGnpl8Dka216XYzpI6LooC7ZeTJOkHSpK8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lH84yrgNqRjbLj4rwRumfnEIo4POzye0l9dV8ctMKGvHcXI42RfbvIDR+fWv78WN6
 txZ1IuArSMomv1Po9Nhk8hfpbVV2RNuaqE5R+UCvljH/h+ZRczlXYkIBVaHHmCmo4v
 Ng961Bp7MJsV/1312Rg2ehKA4kp3mMk5DOT3/uhiRN/WbjoDpa6rHcA2lBhDCaW4D6
 OVenVp78BW1xTNu1ERB9sGB9ZHkgWoOrYbpITXfrg9rbF+WOG5Egk4e3k9CNvf6mg2
 aYWVz3gNjUGLkq2MmPE0WUmm1b+yBr+zchlhIhoNzCTBXbDfxVJlRY0C907Zm3JwM0
 K7vaw9v7t6FxQ==
Date: Wed, 5 May 2021 19:15:56 -0700
From: Keith Busch <kbusch@kernel.org>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 07/23] hw/block/nvme: Use definition to avoid dynamic
 stack allocation
Message-ID: <20210506021556.GA1187168@dhcp-10-100-145-180.wdc.com>
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-8-philmd@redhat.com>
 <20210505212238.GA1186879@dhcp-10-100-145-180.wdc.com>
 <285e17d3-93fb-7317-8aba-689fda772f84@redhat.com>
 <c72ab9cd-e958-ee21-ef18-bd84c9dfd39c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c72ab9cd-e958-ee21-ef18-bd84c9dfd39c@redhat.com>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 05, 2021 at 06:09:10PM -0500, Eric Blake wrote:
> On 5/5/21 5:07 PM, Philippe Mathieu-Daudé wrote:
> > +Eric
> > 
> > On 5/5/21 11:22 PM, Keith Busch wrote:
> >> On Wed, May 05, 2021 at 11:10:31PM +0200, Philippe Mathieu-Daudé wrote:
> >>> The compiler isn't clever enough to figure 'SEG_CHUNK_SIZE' is
> >>> a constant! Help it by using a definitions instead.
> >>
> >> I don't understand.
> > 
> > Neither do I TBH...
> > 
> >> It's labeled 'const', so any reasonable compiler
> >> will place it in the 'text' segment of the executable rather than on the
> >> stack. While that's compiler specific, is there really a compiler doing
> >> something bad with this? If not, I do prefer the 'const' here if only
> >> because it limits the symbol scope ('static const' is also preferred if
> >> that helps).
> > 
> > Using: gcc version 10.2.1 20201125 (Red Hat 10.2.1-9) (GCC)
> > 
> > Both static+const / const trigger:
> > 
> > hw/block/nvme.c: In function ‘nvme_map_sgl’:
> > hw/block/nvme.c:818:5: error: ISO C90 forbids variable length array
> > ‘segment’ [-Werror=vla]
> >   818 |     NvmeSglDescriptor segment[SEG_CHUNK_SIZE], *sgld, *last_sgld;
> >       |     ^~~~~~~~~~~~~~~~~
> > cc1: all warnings being treated as errors
> 
> C99 6.7.5.2 paragraph 4:
> "If the size is an integer constant expression and the element type has
> a known constant size, the array type is not a variable length array
> type; otherwise, the array type is a variable length array type."
> 
> 6.6 paragraph 6:
> "An integer constant expression shall have integer type and shall only
> have operands that are integer constants, enumeration constants,
> character constants, sizeof expressions whose results are integer
> constants, and floating constants that are the immediate operands of
> casts. Cast operators in an integer constant expression shall only
> convert arithmetic types to integer types, except as part of an operand
> to the sizeof operator."
> 
> Notably absent from that list are 'const int' variables, which even
> though they act as constants (in that the name always represents the
> same value), do not actually qualify as such under C99 rules.  Yes, it's
> a pain.  What's more, 6.6 paragraph 10:
> 
> "An implementation may accept other forms of constant expressions."
> 
> which means it _should_ be possible for the compiler to do what we want.
>  But just because it is permitted does not make it actually work. :(

Thank you, that makes sense. In this case, we are talking about an
integer constant expression for the value of a 'const' symbol. That
seems like perfect fodder for a compiler to optimize. I understand it's
not obligated to do that, but I assumed it would.

Anyway, Philippe, I have no objection if you want to push forward with
this series.

