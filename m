Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5397757CEB1
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 17:14:20 +0200 (CEST)
Received: from localhost ([::1]:59664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEXsZ-0004QO-Da
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 11:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org>)
 id 1oEXq6-00019W-U1
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 11:11:46 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:50076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org>)
 id 1oEXq0-0007Y9-J6
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 11:11:46 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0356DB82552;
 Thu, 21 Jul 2022 15:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5AA5C3411E;
 Thu, 21 Jul 2022 15:11:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="gGwHMedw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658416293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Abg5zqWOWYb/D9uUK2LR9X7IAEDZEuYZ/kfKk/0IKzc=;
 b=gGwHMedw996W66MWJ3rRaD9kTmWja6VwhXBtlimJnAzbNGWZ4/pVHsqLj7eW2B1iTn42Ue
 dhC74tfx39Q4EBm0PgP5FvxuC4zxGWDFSbg1B9P7hPLuluMCs1nMc0tQS317DKEu1nwQvE
 s2nzhXBHVBxRhqizqpy3sugouWfVVEg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 78928df6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 21 Jul 2022 15:11:33 +0000 (UTC)
Date: Thu, 21 Jul 2022 17:11:31 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 0/4] Refactor x86_load_linux and pass RNG seed via
 setup_data entry
Message-ID: <Ytlso2QIe5oU8toG@zx2c4.com>
References: <20220721122937.729959-1-pbonzini@redhat.com>
 <20220721105005-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220721105005-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Hi Michael,

On Thu, Jul 21, 2022 at 10:52:32AM -0400, Michael S. Tsirkin wrote:
> On Thu, Jul 21, 2022 at 02:29:33PM +0200, Paolo Bonzini wrote:
> > As mentioned in the reviews of Jason's patches, the fw_cfg data, or at
> > least its structure including the size, is part of the guest ABI and
> > must match across two sides of migration.
> > 
> > It would be possible to handle this with some duplicated code between
> > the rng seed and DTB handling, but the conditionals to handle the linked
> > list would be ugly.  Unfortunately the code of x86_load_linux has no
> > data structures available, it's all of a jumble of local variables.
> > Hence the first two and largest patches in this series, which remove all
> > non-Linux code from the function and move the local variables to a struct
> > as necessary.  The function was long overdue for some cleanup anyway.
> > 
> > With this in place, adding the seed setup_data entry is just a
> > couple lines of code, plus the scaffolding for a new machine property
> > "linuxboot-seed".  The property supports on/off/auto values, where "auto"
> > disables/enables depending on the kernel support for setup data (which was
> > added in 2.6.26); "on" currently fails when starting with an old kernel,
> > and probably it should also fail when starting a PVH or multiboot kernel.
> > 
> > Paolo
> 
> I like the refactoring
> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> 
> To avoid creating extra work for Jason and confusing
> attribution, maybe apply Jason's patch then your refactoring
> on top?

Yes, I think it'd make sense to apply:
https://lore.kernel.org/qemu-devel/20220721125636.446842-1-Jason@zx2c4.com/
as-is, without any changes, since that handles your migration concerns.

And then after, if you want to refactor things in general, apply that on
top.

As I mentioned before, we really don't need nor want a user-facing
option for this. What I do in that v7 there is sufficient and fine.

Michael - do you want to take that v7 into your tree?

Jason


