Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF84573C09
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 19:33:41 +0200 (CEST)
Received: from localhost ([::1]:33254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBgF2-0008WN-Jh
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 13:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=yVRI=XS=zx2c4.com=Jason@kernel.org>)
 id 1oBgC1-0004zH-NV; Wed, 13 Jul 2022 13:30:34 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:54596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=yVRI=XS=zx2c4.com=Jason@kernel.org>)
 id 1oBgC0-0007QZ-79; Wed, 13 Jul 2022 13:30:33 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CDAC961B3C;
 Wed, 13 Jul 2022 17:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B76C34114;
 Wed, 13 Jul 2022 17:30:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="S+rAcsxT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1657733428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bxce0zYmrF1KxAyuCn/faCPow645a6XD5bUAmgXlV7Q=;
 b=S+rAcsxTdYJMasg1Vf8P6aOKNsOAePqQp3T1oAw5+Kwe3sFRCD3CwW6Tt63wtacEri3VEU
 b0WKXJnKxC0/V2FBikXORXHjcwCIvawCbMnL1peNiPIAQCN0Pqc4uqivQPn71IUEBGLR9h
 vd6bx8rxEV72XGdr+GvHV8T9Oxx5vWc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c8e10873
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 13 Jul 2022 17:30:28 +0000 (UTC)
Date: Wed, 13 Jul 2022 19:30:25 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Cedric Le Goater <clg@kaod.org>
Subject: Re: [PATCH] hw/ppc: pass random seed to fdt
Message-ID: <Ys8BMbBPrKYq6S1e@zx2c4.com>
References: <20220712135114.289855-1-Jason@zx2c4.com>
 <7310087f-443e-ebdb-f345-a18358a874e4@gmail.com>
 <af9db769-ad98-9dc4-ebd7-fc792a1c5e82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af9db769-ad98-9dc4-ebd7-fc792a1c5e82@gmail.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=yVRI=XS=zx2c4.com=Jason@kernel.org;
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

Hi Daniel,

On Tue, Jul 12, 2022 at 05:31:27PM -0300, Daniel Henrique Barboza wrote:
> CCing qemu-ppc and Cedric for awareness since I forgot to do so in
> my reply (⌒_⌒;)
> > Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Thanks for the review and for forwarding this to qemu-ppc. What's the
route this patch needs to take in order to make it into some tree
somewhere? Can somebody queue it up?

Regards,
Jason

