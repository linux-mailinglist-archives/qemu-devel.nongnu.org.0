Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C7F57D22A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 19:03:05 +0200 (CEST)
Received: from localhost ([::1]:53764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEZZo-0003Zu-GQ
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 13:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org>)
 id 1oEZHb-0002sW-GS
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:44:15 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:47260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org>)
 id 1oEZHY-0000b2-V5
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:44:14 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D418661E12
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 16:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1CCCC341C6
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 16:44:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="cBPSUioJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658421847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y4Mn2T+kz2DR3aFbdB7ruRYQGIVbKFxd8UWsxO4EdOs=;
 b=cBPSUioJAcURpA8v3CG+8jz5Zlmzr/by+N6dTUnrgpL73bFXg2IDU1QgXuEkUPCsAZpsiE
 RmqIx8rgDDNzqZjDJlcqq3+RDqs9IO9JhumKhYxb43uV3vub9bMewU22kpgVzF9HCtSE46
 AgFYS8KhpT3/Kc56pb8fFQkB179/YoA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4cf2f64e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Thu, 21 Jul 2022 16:44:06 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id u12so1708840qtk.0
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 09:44:06 -0700 (PDT)
X-Gm-Message-State: AJIora8xA2Hs+xc5JIqbnUgJzhp6U7kq1kDQQgV0RwX3jBXHqYvKOKW+
 x8h6dtUYTmP5RKNOD8STWoq682uwaiJKY6P7Evc=
X-Google-Smtp-Source: AGRyM1uaVBYbqcaaIYV7PCIeMg8CHSMqkg1i+BPaRuZYET9Yx1nTj7ICPMx17HOK7eXSdb3mRJeYXtwmynHE6vnAEGg=
X-Received: by 2002:a05:622a:86:b0:31e:9b00:68ba with SMTP id
 o6-20020a05622a008600b0031e9b0068bamr35262297qtw.390.1658421845648; Thu, 21
 Jul 2022 09:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220719122334.136290-1-Jason@zx2c4.com>
 <CAJy5ezq7_F6uDrY6RuXe5ru0mAbmx-pBTQoFCtZj4DhEM7EZpw@mail.gmail.com>
In-Reply-To: <CAJy5ezq7_F6uDrY6RuXe5ru0mAbmx-pBTQoFCtZj4DhEM7EZpw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 21 Jul 2022 18:43:54 +0200
X-Gmail-Original-Message-ID: <CAHmME9opYzwtK4oJo1bZo+9FDbXt6TfgybtFTfQpxqx6pOoGWA@mail.gmail.com>
Message-ID: <CAHmME9opYzwtK4oJo1bZo+9FDbXt6TfgybtFTfQpxqx6pOoGWA@mail.gmail.com>
Subject: Re: [PATCH] hw/microblaze: pass random seed to fdt
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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

Hey Edgar,

On Wed, Jul 20, 2022 at 9:13 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
>
> On Tue, Jul 19, 2022 at 2:23 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>>
>> If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
>> initialize early. Set this using the usual guest random number
>> generation function. This FDT node is part of the DT specification.
>
>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Thanks for looking at this. Paolo (CC'd) just sent a few similar
changes for different archs in a pull, but not this one, on the
supposition that you'd roll this into your next pull. If this isn't
the case, please pipe up so Paolo can take it instead later.

Jason

