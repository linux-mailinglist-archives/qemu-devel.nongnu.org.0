Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0846657CA93
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 14:22:28 +0200 (CEST)
Received: from localhost ([::1]:54992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEVCE-0005lL-QP
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 08:22:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org>)
 id 1oEV75-0007uR-Pn
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:17:10 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:51146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org>)
 id 1oEV73-0002i6-Lm
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:17:07 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B4B2EB82296;
 Thu, 21 Jul 2022 12:17:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EFDCC3411E;
 Thu, 21 Jul 2022 12:16:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="KYB+yh0V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658405817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MOmr6KWSnCZySIuDvw3CF//8OIX8CYKJBKT8/oE9wCU=;
 b=KYB+yh0VOWv+rHbnWWtdr1521EWXgQXmKmC8V+Gxpn4zqiUoe7dHwZbpE7yKTP6ig9CKLt
 3hh0C+OFWQcq+meWx2VRF3b3OhEh3hLqmXQCE6JU7lEMuIAKUpQ1VO89w6Kt7agy/wmp5G
 53sbErfRs+P7uKpJP1tGYy+ZqXGBF1Y=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9344b3a3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 21 Jul 2022 12:16:57 +0000 (UTC)
Date: Thu, 21 Jul 2022 14:16:53 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v6] hw/i386: pass RNG seed via setup_data entry
Message-ID: <YtlDtSlRel1UUd71@zx2c4.com>
References: <20220721104730.434017-1-Jason@zx2c4.com>
 <20220721104950.434544-1-Jason@zx2c4.com>
 <20220721065744-mutt-send-email-mst@kernel.org>
 <1ee57e75-94a1-cf75-7d49-0d399607fee9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1ee57e75-94a1-cf75-7d49-0d399607fee9@redhat.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
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

Hi Paolo,

On Thu, Jul 21, 2022 at 01:47:02PM +0200, Paolo Bonzini wrote:
> On 7/21/22 13:00, Michael S. Tsirkin wrote:
> > Well why not.
> > 
> > Reviewed-by: Michael S. Tsirkin<mst@redhat.com>
> > 
> > who's merging this? Paolo me or you?
> 
> I don't think this should be merged as is.
> 
> The linuxboot ROM takes the data from fw_cfg, and (with the exception of 
> ACPI tables) that data is not migrated.  Because reading it into the 
> guest is not atomic, both sides must match.  This version of the patches 
> at least doesn't move the preexisting DTB entry of the setup_data, but 
> it still has a mismatching size and that can be a problem when migrating 
> backwards.

As discussed online, this seems absolutely preposterous and will never
happen anywhere real ever at all. Trying to account for it is adding
needless complexity for no real world benefit; it's the type of thinking
that results in a mess. Further, conditionalizing the RNG seed on
something else means fewer users receive the increased security of
having an early boottime seed. This seems like a silly direction go go
in.

But to assess things in the open here:
- On upgrades, there's no problem because the old bytes don't move.
- On downgrades, there's mostly no problem because next will point to 0.
- On downgrade there could be some ridiculous theoretical problem if the
  reader has already read a non-zero next. But this will never actually
  happen in practice.

So we really should just stick with the simple and straight forward path
that this v6 accomplishes, and not muck things up with stupidity.

Jason

