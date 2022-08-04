Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C85589BE7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 14:49:45 +0200 (CEST)
Received: from localhost ([::1]:34628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJaIK-0002yB-TH
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 08:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJZf8-0001Jg-PQ; Thu, 04 Aug 2022 08:09:14 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:55376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJZf6-0006dI-VB; Thu, 04 Aug 2022 08:09:14 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D86B461779;
 Thu,  4 Aug 2022 12:09:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E4DC433D7;
 Thu,  4 Aug 2022 12:09:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="QMF+7xZX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659614946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/XayVa82ze56fmTCv4NLEEA6wogm2LVRrl/yXmFM8oY=;
 b=QMF+7xZXMpd7mMDjwXNWUWQjtLl3Cv+TlI3rdnlfW0yIFSc0izUCjOIV4QFcXsO0M7lkOD
 ra5z4OYzLc1cEFFstRLcAZIK+qZ99mADf3p02jnAn/pf9pRnUAzNC9JalgHll0remTndsj
 JyCN5oWucjA+RIzqJzg/Q1fzDW3GPIM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fda442c3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 4 Aug 2022 12:09:06 +0000 (UTC)
Date: Thu, 4 Aug 2022 14:09:04 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: freude@linux.ibm.com, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Holger Dengler <dengler@linux.ibm.com>
Subject: Re: [PATCH v4 2/2] target/s390x: support SHA-512 extensions
Message-ID: <Yuu24KW7ulhn/1wn@zx2c4.com>
References: <Yul0G2YCKLXiypvv@zx2c4.com>
 <20220802190011.458871-1-Jason@zx2c4.com>
 <20220802190011.458871-3-Jason@zx2c4.com>
 <5758f0a3-ee4e-97d4-3e32-469b56029208@redhat.com>
 <YupmwgYFShLfP8Xd@zx2c4.com>
 <0ff11adb819138cfed16dfb489b66f6f@linux.ibm.com>
 <bbd57148-6d6d-f1c3-73f8-73e2512a8012@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bbd57148-6d6d-f1c3-73f8-73e2512a8012@linux.ibm.com>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi,

On Thu, Aug 04, 2022 at 08:56:19AM +0200, Christian Borntraeger wrote:
> We do not support the esa390 mode, but the 24/31 bit _addressing_ modes are
> totally valid to be used in zarch mode (with sam31 for example). The kernel
> does that for example for some diagnoses under z/VM.
> Nobody in problem state should probably do that, but its possible.

v6 of this series handles 24/31:

https://lore.kernel.org/qemu-devel/20220803171536.1314717-1-Jason@zx2c4.com/ [unchanged for a while now]
https://lore.kernel.org/qemu-devel/20220803171536.1314717-2-Jason@zx2c4.com/ [the new sha512 thing]

Jason

