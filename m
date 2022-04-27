Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD78A511CB4
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 19:46:11 +0200 (CEST)
Received: from localhost ([::1]:54194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njljv-0005xI-1e
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 13:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=/bUp=VF=zx2c4.com=Jason@kernel.org>)
 id 1njli8-00055s-SV
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 13:44:22 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:50870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=/bUp=VF=zx2c4.com=Jason@kernel.org>)
 id 1njli3-0004LF-Uu
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 13:44:17 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0A55361E39;
 Wed, 27 Apr 2022 17:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED54C385A7;
 Wed, 27 Apr 2022 17:44:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="GjW1JWis"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651081445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3sCbwkCD6bnTFvErMggyKNiQtI/gtgftKGOV3ZZRiRQ=;
 b=GjW1JWisn3cjOlHYFvb9zLr2YUurC8J69Z3IkxIkNYPBFv7LAtJziaGXAl/m3ecXTXBtrE
 l+YX9byPsXEHQ4RUtC/JrV05xtwQMqQH+u3nimhWuzGWx1GlR/EXz4P+bMgx6QuxZXf+7M
 tuXQV9v/dlOlsDO4QC4u/uylCxXmqy4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 40aafe74
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 27 Apr 2022 17:44:05 +0000 (UTC)
Date: Wed, 27 Apr 2022 19:44:02 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Stafford Horne <shorne@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 2/7] target/openrisc: add shutdown logic
Message-ID: <YmmA4li384azQ2i9@zx2c4.com>
References: <cover.1492384862.git.shorne@gmail.com>
 <fb69c137317a365dcb549dfef1ecd2fbff48e92c.1492384862.git.shorne@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fb69c137317a365dcb549dfef1ecd2fbff48e92c.1492384862.git.shorne@gmail.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=/bUp=VF=zx2c4.com=Jason@kernel.org;
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
Cc: openrisc@lists.librecores.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey Stafford,

On Mon, Apr 17, 2017 at 08:23:51AM +0900, Stafford Horne wrote:
> In openrisc simulators we use hooks like 'l.nop 1' to cause the
> simulator to exit.  Implement that for qemu too.
> 
> Reported-by: Waldemar Brodkorb <wbx@openadk.org>
> Signed-off-by: Stafford Horne <shorne@gmail.com>

I'm curious as to why this never got merged. I noticed I'm entirely able
to shutdown or to reboot (which is mostly what I care about) Linux from
OpenRISC. It just hangs.

Thanks,
Jason

