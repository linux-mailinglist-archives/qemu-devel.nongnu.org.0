Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B899560CB97
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 14:14:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onIkj-0001nL-FG; Tue, 25 Oct 2022 08:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1onIkh-0001aI-4C
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:09:51 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1onIke-0004Lz-9W
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:09:50 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 25F63618E8;
 Tue, 25 Oct 2022 12:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF563C433D6;
 Tue, 25 Oct 2022 12:09:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="PG79I2VW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1666699777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uIN2p/rP6GpVIOmmnRUyOfdhaPPAGFXG2rvetmtdFl0=;
 b=PG79I2VWya5Kh3mJxE5FCf6Y/MHQS4rHSRWSuoy57ai5pU2F+YnztHfCT1mNElKrcmvU9l
 3gjjDd7V40OFlTfNXS58fNMupya5lS+qo+pWm1dzhzk/7HQzq9eqKPQAG00HxKZZwi/fEW
 aKUv1iv/ImnAm7V5+ZEJrfPmsz7MIa0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4feb09ba
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 25 Oct 2022 12:09:36 +0000 (UTC)
Date: Tue, 25 Oct 2022 14:09:33 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, qemu-devel@nongnu.org,
 richard.henderson@linaro.org
Subject: Re: [PATCH v4 01/11] reset: allow registering handlers that aren't
 called by snapshot loading
Message-ID: <Y1fR/bMo/HcDvo7A@zx2c4.com>
References: <20221025004327.568476-1-Jason@zx2c4.com>
 <20221025004327.568476-2-Jason@zx2c4.com>
 <874jvs5t5k.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <874jvs5t5k.fsf@pond.sub.org>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=a4uw=22=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Markus,

On Tue, Oct 25, 2022 at 08:11:51AM +0200, Markus Armbruster wrote:
> > diff --git a/qapi/run-state.json b/qapi/run-state.json
> > index 49989d30e6..e44c0de914 100644
> > --- a/qapi/run-state.json
> > +++ b/qapi/run-state.json
> > @@ -86,12 +86,15 @@
> >  #                   ignores --no-reboot. This is useful for sanitizing
> >  #                   hypercalls on s390 that are used during kexec/kdump/boot
> >  #
> > +# @snapshot-load: A snapshot is being loaded by the record & replay
> > +#                 subsystem; internal value (since 7.2)
> > +#
> 
> If "internal value" was an established way to mark parts that aren't
> visible externally, this would do.  Since it isn't, it's too terse.
> Suggest something like "This value is used only within QEMU.  It doesn't
> occur in QMP."

Thanks for the precise text. I can do that for a v5, or, Peter - do you
want to just fold that in upon committing these patches?

Jason

