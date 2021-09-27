Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 057A341925E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 12:42:31 +0200 (CEST)
Received: from localhost ([::1]:48852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUo5e-000284-2t
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 06:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mUnym-0005XQ-9z
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 06:35:24 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:47799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mUnyk-0005EU-1U
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 06:35:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=3GLfo6cSO29wRlldGuTlQa/9vp0agoaFVPc0nqKfh2g=; b=Ddc2H1seCjm9PlW/NCjWYkO2Ud
 pslK0FL1Lzz3bmlFFJVikh7E25u6wt9QBwLAzqWA1S4Y8oB//hJsehZQD0TiaLPyI5XXEeRki1DFf
 /oQqP7iC/b4ybVXkqMPhEgBU3Eq7saHvPjAAL0cia9WQ59AgdAPllu+fYWmnW1TVHmdAWcpo25eQn
 hAWNRsEzZ/8MnUeaHACn/Fy0YmBhxy/o0kqMscXtH4dYFOyDqjQGtAD38QM6XDoi/764+Tb+UXsRo
 1SsUIp4TE11B9xsdJJLY7X7HfhHuFNsooC9yPApH2wBUKyl2yAYM0ii71w/PcAL0SiyPdaYiTkiYl
 TaUCV9OT2Gr70xdDdGi1ORSyRk0GOi8jCNgpNtOUpWpANiuKCLlLQS4RBx02w1wPSQpcRHCdwBGo1
 MhA33rqnLfSnRZRzyFO4gc/vYhoTTVmYICLnrptX2RAqy9k9fXCMkaZ1cd6sw3YP9AidnkjgpCbxk
 cXjzmba/M8p8MqORcuZMR9lCetUVNzzBXgqIUqYneaj5Dbz9YgnHlnRwYyZCESZsIkZXHCp1Xj7eJ
 eko4my1JIpC06lSdI1rrjXfQfTUvfssjyFWELinvxPYu6KWSyzcWGHA8/Vx/cp/JKfdOtV9bw7SX/
 DPmVdd2gbytGhN0iQTqukQUO+WGGAEwQH+gbiDGVQ=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 0/5] introduce QArray
Date: Mon, 27 Sep 2021 12:35:16 +0200
Message-ID: <2431106.PTX978RE0L@silver>
In-Reply-To: <1697912.9TVREAEhXh@silver>
References: <cover.1629982046.git.qemu_oss@crudebyte.com>
 <20210831135802.349fb447@bahia.lan> <1697912.9TVREAEhXh@silver>
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

On Dienstag, 31. August 2021 14:25:04 CEST Christian Schoenebeck wrote:
> On Dienstag, 31. August 2021 13:58:02 CEST Greg Kurz wrote:
> > On Thu, 26 Aug 2021 14:47:26 +0200
> > 
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > Patches 1 and 2 introduce include/qemu/qarray.h which implements a deep
> > > auto free mechanism for arrays. See commit log of patch 1 for a detailed
> > > explanation and motivation for introducing QArray.
> > > 
> > > Patches 3..5 are provided (e.g. as example) for 9p being the first user
> > > of
> > > this new QArray API. These particular patches 3..5 are rebased on my
> > > current 9p queue: https://github.com/cschoenebeck/qemu/commits/9p.next
> > 
> > > which are basically just the following two queued patches:
> > This looks nice indeed but I have the impression the same could be
> > achieved using glib's g_autoptr framework with less code being added
> > to QEMU (at the cost of being less generic maybe).
> 
> I haven't seen a way doing this with glib, except of GArray which has some
> disadvantages. But who knows, maybe I was missing something.

Ping

Let's do this?

> > Anyway, we should likely sort out the SEGV issue you're hitting
> > before going forward with supplementary changes in v9fs_walk().
> 
> Yeah, let's postpone this series here. I'll look into the Twalk crash issue
> more closely today and will get back on that issue first.
> 
> Best regards,
> Christian Schoenebeck



