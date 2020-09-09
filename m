Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB62262ECD
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 14:58:15 +0200 (CEST)
Received: from localhost ([::1]:35236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFzfy-0006Sj-7J
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 08:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kFzej-0004ud-1b
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 08:56:57 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:35603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kFzef-0001Du-9N
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 08:56:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:References:In-Reply-To:
 Content-ID:Content-Description;
 bh=kTe8m2mo+CCCon3VkucKxz9ddUVAthYW0XFGNd+PEWc=; b=avg7W7tEo/K9bi01v4TslxMaMq
 bk3LneQBXxV6DKxXDGSf2xPxYapdpDxLQq/YyS4PPF7YEpTEGbgWRHFBhTc4OU74nZAijJvNc9Vqr
 vl9nMchtlfZIJgseTBlnxZ8S//b6M5X10Uwiac3tD6T46IMhN32rydn1vxqgtppDfxAU3BxODL/pH
 Asz/aipPIyvzdx8kOeuZ0DDVim9crVo2Votjtx27it3VX1cjQdPzMU6ilcE6TYRKAsDCuHqxqr4KZ
 +rDvsK+NHMO7/UzRq6xjKe/XSh5QkKGfsDnaRKc+i+JFQV3uLuCcpX2NeRHBGCJ70bhA1uhRwXa7v
 /xfZ5Icw==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <rth@twiddle.net>, Paolo Bonzini <pbonzini@redhat.com>,
 programmingkidx@gmail.com, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [RFC] QEMU as Xcode project on macOS
Date: Wed, 09 Sep 2020 14:56:46 +0200
Message-ID: <2764135.D4k31Gy3CM@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 08:56:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

I've recently been thinking about how feasible a stripped down Xcode project 
for QEMU would be, i.e. you just get the QEMU sources, click on 
qemu.xcodeproj, Cmd + B, done. No extra installation, no configure, nothing.

I've done this before for gtk(mm), which you might know, depends on approx. 24 
individual libraries (glib, jpeg, png, pixman, atk, gdk, cairo, pixman, 
graphene, sigcpp, ... gtk, gtkmm) that you would usually all need to download 
and

	./configure && make & make install

each individually on macOS. Or right, you could alternatively "just install" 
them from Homebrew, MacPorts, Fink. But no matter which solution you choose, 
it easily ends up in a mess (conflicts, misbehaviours) on macOS to install 
libs and apps globally. And I think that's the problem why there are currently 
relatively little contribution for QEMU coming from devs on macOS. Because you 
don't want to install things globally on a macOS system, it's simply not 
working well there as it does with Linux distros.

And the other thing is: I've tested the waters with Apple and filed a QEMU 
related macOS bug with them. The response was like expected; they basically 
said 'if there's no Xcode project, then we don't investigate it'.

The question is, and I don't have the big picture of QEMU yet to judge that, 
how much is auto generated for QEMU i.e. with custom scripts that would 
probably destroy this plan? There are these trace calls that are auto 
generated, is there more like the TCG part for instance?

What I could imagine: a hand crafted Xcode project as a starting point, and if  
that works out, switching to auto generating that Xcode project from the Meson 
inftrastructure to avoid multiplication of maintenance effort.

Best regards,
Christian Schoenebeck




