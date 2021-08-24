Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7553F61BD
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 17:34:48 +0200 (CEST)
Received: from localhost ([::1]:43926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIYRr-0004xv-6q
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 11:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mIYLh-0004Z9-HO
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:28:26 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:38737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mIYLg-0007FN-65
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:28:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=nPvkmQHaQu3LFUvF7wRKlZbpHDMDDExWqEgHiSSjsp0=; b=BJ3mBz1t/KVsCGBubkFwCzMJQh
 kF2J/WIjLMmhb14VvbLT6ME0LF6X+yRUTt2Mrgt64qqfo0YibaKbKmNEZWtQcX7VuXFv/nqefw5UZ
 xt0H9o0tLEV1UcGkiFU9QMq+g6VOcaQOiPVItyiop9bZiMU9Igq2DExj55p5i1KCAUGYFle8WMZPD
 XUtqRNWChggALVlm57N7u/NdCjhmYFWPJX8nmHhfFnvuO0w1jR0eyuMthXH/nlD8j+PSQqZJas8CY
 RwXiBZxkuOrmiIYnm3kbKtM9QpNwRCIpPaTXesGn2rlFeb6mGSl+ff+qAe1khMFcln8JXXc5LEFZn
 nKnakKsY9C7fMMw6mzmPNXpnkFA0M2UvRFKYnXE+SaBktjonNsnik2FR4Pdue0z8xM1GWjKpFUcpn
 sHtgf7i1ONZ0aYAAJ0qPrJrGktbHvwHRaGipnxnEJ1hFsGYuQR+CxyzVtslb51lHSEgwHkSwvBcuM
 R7o2cQV0MDCHIKwKM5Z8JPdG+XWDbTY3bgNh6JuhRN4OvvjMy9oBn9mhNiJGhXkxd6J8RWnWJodsw
 AopDODnU0cIiPlR62q88gpsg8o80UYR+j6jVXJAc1HE4+g5nWCyn1FlvWf/PRoA61xeU/prCVUGyR
 GDOUbXbxAzh8NN98bk8B3BfWA8PBU+3mOm5O72xsE=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 1/5] qemu/qarray.h: introduce QArray
Date: Tue, 24 Aug 2021 17:28:21 +0200
Message-ID: <30752721.RNLqSdXVJZ@silver>
In-Reply-To: <3111762.5NimiMBNql@silver>
References: <cover.1629638507.git.qemu_oss@crudebyte.com>
 <8735qydhqf.fsf@dusky.pond.sub.org> <3111762.5NimiMBNql@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
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

On Dienstag, 24. August 2021 17:24:50 CEST Christian Schoenebeck wrote:
> On Dienstag, 24. August 2021 16:45:12 CEST Markus Armbruster wrote:
> > Christian Schoenebeck <qemu_oss@crudebyte.com> writes:
> > > On Dienstag, 24. August 2021 10:22:52 CEST Markus Armbruster wrote:
> > [...]
> > 
> > >> Please use GPLv2+ unless you have a compelling reason not to.
> > >> 
> > >> [...]
> > > 
> > > Is that a requirement?
> > > 
> > > It is just my personal license preference. AFAICS there are numerous
> > > sources in QEMU released under MIT license as well.
> > 
> > The licensing situation is a mess.
> > 
> > The only hard requirement is "compatible with GPLv2+".  We prefer GPLv2+
> > for new code, except as detailed in ./LICENSE.  We're stuck with a
> > sizable body of existing code that is GPLv2 (no +), but decided to put
> > limits to that madness.  Again, see ./LICENSE for details.
> > 
> > I'm asking you to help with limiting the madness by sticking to GPLv2+
> > whenever possible.
> 
> Okay, I see that there is quite a homogenous license structure in Qemu.
> However the MIT license is a very permissive license, so I don't see any
> conflicts.

s/homogenous/heterogeneous/

> What if I release this file under public domain? That's not even copyleft at
> all. What that be OK for you?

"Would" that be OK for you?

> My idea was that people might simply take this header file and use it in
> other C projects as well. Putting it under GPL might cause conflicts for
> other projects.

Best regards,
Christian Schoenebeck



