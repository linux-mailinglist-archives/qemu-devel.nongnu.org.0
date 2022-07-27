Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77707581D3A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 03:37:27 +0200 (CEST)
Received: from localhost ([::1]:33786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGVzK-0007uu-2b
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 21:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Hqxn=YA=zx2c4.com=Jason@kernel.org>)
 id 1oGVxA-0006LR-PA; Tue, 26 Jul 2022 21:35:13 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:51210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Hqxn=YA=zx2c4.com=Jason@kernel.org>)
 id 1oGVx7-0001rT-Ek; Tue, 26 Jul 2022 21:35:11 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 557C261759;
 Wed, 27 Jul 2022 01:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC061C433D6;
 Wed, 27 Jul 2022 01:35:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="aFymDaH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658885703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1jiHmrM7ziP8almN2pa/Ip4UaWDmPGXvk0cjF/0Fc78=;
 b=aFymDaH5oaXbLytLJ5SGaoJHlXcz++ucvsKbtYyQx/nPN8MvZDO0BTFDzgkvqtrESlds2i
 9FZEiNPDOhqETkLsehQBBxa054k3O8vSFnTnIza+0QnXLCe4x79/zVY97assgFsQ8SZTjB
 H+RiB0Wm1NPrNp8pk+bEaaILAEr8uok=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id be32b451
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 27 Jul 2022 01:35:03 +0000 (UTC)
Date: Wed, 27 Jul 2022 03:35:01 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
Subject: Re: [PATCH v3] target/s390x: support PRNO_TRNG instruction
Message-ID: <YuCWRaEqrF2XwlsQ@zx2c4.com>
References: <Ytft08S2eGaYVwC3@zx2c4.com>
 <20220720120859.339788-1-Jason@zx2c4.com>
 <c61e0119-24e8-c1a3-d1c1-cd57b3feca02@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c61e0119-24e8-c1a3-d1c1-cd57b3feca02@redhat.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=Hqxn=YA=zx2c4.com=Jason@kernel.org;
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

Hey David,

On Wed, Jul 20, 2022 at 08:41:48PM +0200, David Hildenbrand wrote:
> I did not review the doc in detail once again, maybe I get to that later
> this week.

Did you ever get around to merging this patch? Is it in some tree
somewhere?

Jason

