Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7B43F2BE5
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 14:20:41 +0200 (CEST)
Received: from localhost ([::1]:60958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH3Vo-0007QY-TX
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 08:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mH3Ue-0006Z7-If
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 08:19:28 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:60801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mH3Uc-0000JQ-Kh
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 08:19:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=4VwW6/94IpLgIrPy0K3GzmQMfhOK1XuhFhZdE7qkkKQ=; b=VQSBDJnlLkwT6GPKaLzeT7ZUN0
 iWEX6CItZNrqTAN5hXtdARet8gl1KY7PCUuML0BKgGGPN7RR9vF4tdHhBv2r/WskCRnRiZX+KHOgr
 tbEsQNID73Dk8LW46E+uPsu60PjOMfMOMH2O2yQPIXF5Ag8ksxq/qdIbPKaFLX9xriUM3kzcjK+Ly
 6xxFP0WT4kbYE8DtEC4Hump3AOUFkCHwHXG31Wv4gNIU5YTq1k9vDdoF5mnMgCWf+vjanTeWU6kdP
 m/sP66mYVan8jPy1hwBm6yu6sxhsEqWp+gkAk0r5Q/ob8RqQkStt3tcS1FKTlOYn4eredNFy0oMH1
 V+wfn0wEcPZFbMhlh5u7HSyESY9cN2c95AYJi8ErCtwWQ206UvgZ8oyOgJuIj1oWsZu6/ibPkiByE
 T7f2UHibbOtTpkSjZfU3V6X6+eJFp3a1OcCOjoSOqyQKD023Cvr3lAauwZmpmh4ym03OwbWtB4l6q
 GiB5o+xxzS2N0MXsvy0OI3xRqMz40bApZpVktuYQRsLl8v63rORbE6jwNDOsiae9K+XGsyc785o6B
 3bSLUJaNRviIAgGZTKiizUUZ2/snwfF2lcC7jIqPh0v5PxR6To8f+1HEFMlof59F3fik44W9nlD0p
 GUuCmTTLKWKRdNlogHjh6pXSKK8DT1eFV40YUYgWw=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 1/2] hw/9pfs: avoid 'path' copy in v9fs_walk()
Date: Fri, 20 Aug 2021 14:19:21 +0200
Message-ID: <11476815.tdmo6TZaKc@silver>
In-Reply-To: <20210820123549.4d5b353f@bahia.lan>
References: <cover.1629208359.git.qemu_oss@crudebyte.com>
 <7dacbecf25b2c9b4a0ce12d689a8a535f09a31e3.1629208359.git.qemu_oss@crudebyte.com>
 <20210820123549.4d5b353f@bahia.lan>
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

On Freitag, 20. August 2021 12:35:49 CEST Greg Kurz wrote:
> On Tue, 17 Aug 2021 14:38:24 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > The v9fs_walk() function resolves all client submitted path nodes to the
> > local 'pathes' array. Using a separate string scalar variable 'path'
> > inside the background worker thread loop and copying that local 'path'
> > string scalar variable subsequently to the 'pathes' array (at the end of
> > each loop iteration) is not necessary.
> > 
> > Instead simply resolve each path directly to the 'pathes' array and
> > don't use the string scalar variable 'path' inside the fs worker thread
> > loop at all.
> > 
> > The only advantage of the 'path' scalar was that in case of an error
> > the respective 'pathes' element would not be filled. Right now this is
> > not an issue as the v9fs_walk() function returns as soon as any error
> > occurs.
> > 
> > Suggested-by: Greg Kurz <groug@kaod.org>
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>
> 
> With this change, the path variable is no longer used at all in the
> first loop. 

Correct.

> I see at least an extra possible cleanup : don't set
> path before the first loop since it gets reset before the second
> one. 

Also correct.

> Maybe we can even get rid of path all the way ? I'll have
> a look.

Yes, that's the plan.

There is still quite a bunch that can be cleaned up in that function. I just 
didn't want to start with a two-digit patch set right after the long summer 
break. ;-)

If you want to send some cleanup patches, always appreciated.

Best regards,
Christian Schoenebeck



