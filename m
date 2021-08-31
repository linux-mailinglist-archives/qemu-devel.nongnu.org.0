Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF603FC7D2
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:04:52 +0200 (CEST)
Received: from localhost ([::1]:51982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3Rb-0008TA-68
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mL2pC-0008UK-GA
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:25:10 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:54221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mL2pA-0001BI-8w
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:25:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=F9sI3zFpz3Ejkystq7ebI2Ix+PdiYFFarK4x0OkXkjQ=; b=HLGS/zU4JyntdDulaerX9dqNQz
 D+1Vta5sbljgAhUyQS5wgBBdxei2Yp47UHNXX6DcXxigCInYC/tOdutLYcSgCmoD2zyeH2nC7qQv0
 hPVrUr9AQvpA0a3MxFESyE5ISqohwtcqDn9wkQ6DFTdIU1V/2N0ov4FxbFv5BYw2bs+q3kZDCSN/T
 LcZArs0fDeL6w0ikbUmBPCppNPnDseqwxGDXwv+DLUeRW37dbS0Chcp8sLw89KwmBPTWYZdREzLKW
 +1ZiER1hjl7EVJTAwInu/o8VX2gU1Gfd+RMpPhBCqEAXsEoYnpHR2GxizpE+hzp2jrc68+jVaW5ZA
 +hLTF0hGJH5yB8p0p/Xjk9p4CpULNjrSW2gr2MrFWL2C7KsDBUxmYDnoncBRc/5oRHGpQ37pFsezF
 R2WR/dLcWFhaRTkxO9NSeF72iuyAKsm2ZeAbgUvhde+zCYbNkvQIxgFMyCzEOd9RIFp4+glvzkIyp
 PmRV3AJWesDsgovL/kUV3mV6il1y4uKWiZ3KMVBgG/TJCPUuyGXPWHRO6aC3K/1zKdAYS2LPABsXC
 +lv4Ryy6K1MDMNr6SRsh94V5RgpAtDuLLo7mY+zV3uSQViwtx5ah66ofk8gzFJ22qEOVrcRGxFDEW
 /RmHwIVJdwB7oWWjvClYShuVkjU8nN1vSxcUql1GI=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 0/5] introduce QArray
Date: Tue, 31 Aug 2021 14:25:04 +0200
Message-ID: <1697912.9TVREAEhXh@silver>
In-Reply-To: <20210831135802.349fb447@bahia.lan>
References: <cover.1629982046.git.qemu_oss@crudebyte.com>
 <20210831135802.349fb447@bahia.lan>
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

On Dienstag, 31. August 2021 13:58:02 CEST Greg Kurz wrote:
> On Thu, 26 Aug 2021 14:47:26 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > Patches 1 and 2 introduce include/qemu/qarray.h which implements a deep
> > auto free mechanism for arrays. See commit log of patch 1 for a detailed
> > explanation and motivation for introducing QArray.
> > 
> > Patches 3..5 are provided (e.g. as example) for 9p being the first user of
> > this new QArray API. These particular patches 3..5 are rebased on my
> > current 9p queue: https://github.com/cschoenebeck/qemu/commits/9p.next
> 
> > which are basically just the following two queued patches:
> This looks nice indeed but I have the impression the same could be
> achieved using glib's g_autoptr framework with less code being added
> to QEMU (at the cost of being less generic maybe).

I haven't seen a way doing this with glib, except of GArray which has some 
disadvantages. But who knows, maybe I was missing something.

> Anyway, we should likely sort out the SEGV issue you're hitting
> before going forward with supplementary changes in v9fs_walk().

Yeah, let's postpone this series here. I'll look into the Twalk crash issue 
more closely today and will get back on that issue first.

Best regards,
Christian Schoenebeck



