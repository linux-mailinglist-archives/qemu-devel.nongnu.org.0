Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE01057CEC3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 17:18:06 +0200 (CEST)
Received: from localhost ([::1]:36020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEXwD-00081j-Hi
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 11:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org>)
 id 1oEXtz-00066U-4B
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 11:15:48 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:54432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org>)
 id 1oEXtw-0008Eh-FT
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 11:15:46 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 56972611DC;
 Thu, 21 Jul 2022 15:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F342DC3411E;
 Thu, 21 Jul 2022 15:15:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="A2KJWV56"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658416538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qK/uaOkZFXYyAmv/1wji4OyhOqhbrr95Ycrzx7bH8LM=;
 b=A2KJWV56GsrxW8MVBobCV+qjpoPdfjtTBDQ+F60nJxiJDUkrDVOFqf6hmqw4wMVEIeV+xg
 kf1/z8HLikMx/ssQZdtS3pEt7e9Yoc633lur1Yr4U//KWsP9uMeChMmIhFfc/2hYR7qvXT
 tOJCaCteArUwaAlbt7wS3V+Fcrx4RaQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f74ff146
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 21 Jul 2022 15:15:38 +0000 (UTC)
Date: Thu, 21 Jul 2022 17:15:36 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 4/4] hw/i386: pass RNG seed via setup_data entry
Message-ID: <YtltmLcq3fiVrOgM@zx2c4.com>
References: <20220721122937.729959-1-pbonzini@redhat.com>
 <20220721122937.729959-5-pbonzini@redhat.com>
 <20220721104321-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220721104321-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org;
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

Hi Michael,

On Thu, Jul 21, 2022 at 10:47:57AM -0400, Michael S. Tsirkin wrote:
> On Thu, Jul 21, 2022 at 02:29:37PM +0200, Paolo Bonzini wrote:
> >  #define X86_MACHINE_OEM_TABLE_ID     "x-oem-table-id"
> >  #define X86_MACHINE_BUS_LOCK_RATELIMIT  "bus-lock-ratelimit"
> > +#define X86_MACHINE_LINUXBOOT_SEED      "linuxboot-seed"
> 
> I am guessing we should prefix this with "x-" so we don't commit
> to a user interface.

Actually there's no good reason to have any user interface at all. See
v7 which Paolo "LGTM"ed:
https://lore.kernel.org/qemu-devel/20220721125636.446842-1-Jason@zx2c4.com/

So just ignore this apocryphal patch here that Paolo sent.

Jason

