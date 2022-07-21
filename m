Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A32C57C98A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 13:06:55 +0200 (CEST)
Received: from localhost ([::1]:59168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEU18-0004bx-On
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 07:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org>)
 id 1oETvq-0001Lo-Qb
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 07:01:26 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:56826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org>)
 id 1oETvl-0005J8-2r
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 07:01:26 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1D7E761AAD
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 11:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2E4C341CE
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 11:01:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="kWOaGxSd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658401272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=laPQTkXZlR8EzTYmXr7lyplvIRad4XLL2VmNcT9QlYk=;
 b=kWOaGxSdgYOhPDyFPLGmfz/LZegQVuCoujOuIZ+3JLCMgG4Q6xrGP5+jxRgzecyLFpjBXB
 JhutfDvXxdoPm9W8aWHQhpMkbo7yOFyG3/nhjANNg++s2YIFx68yofaO5Wzh7YFgDJqL9r
 3qLI/9ZKWkNE6HrWbDjVj6JTGEvJZj4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 80d9ecd3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Thu, 21 Jul 2022 11:01:12 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id i13so881387qvo.3
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 04:01:11 -0700 (PDT)
X-Gm-Message-State: AJIora/XCf3GYo+aQk5+1eLew9gZWBfA9UF2kkQUhcXF8KqXOI+crlp7
 IZ5k/vrXILrOVlvOIGykzfzzJg5MfE2lOqDRqQs=
X-Google-Smtp-Source: AGRyM1vdbrHsCw5Hrf8IpOjf/8qhYykyN9KNbur1nc38cO0O6kalRvay8sjov+5jVcABJGmKOUYrnBlxMv+xI3IxLTM=
X-Received: by 2002:a0c:dc85:0:b0:474:c7f:5e79 with SMTP id
 n5-20020a0cdc85000000b004740c7f5e79mr3108779qvk.84.1658401271134; Thu, 21 Jul
 2022 04:01:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220721104730.434017-1-Jason@zx2c4.com>
 <20220721104950.434544-1-Jason@zx2c4.com>
 <20220721065744-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220721065744-mutt-send-email-mst@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 21 Jul 2022 13:00:59 +0200
X-Gmail-Original-Message-ID: <CAHmME9qTByMDNM-MYcjCPN18eqjAmkT+NJBpPN4SrdVzzQJs7A@mail.gmail.com>
Message-ID: <CAHmME9qTByMDNM-MYcjCPN18eqjAmkT+NJBpPN4SrdVzzQJs7A@mail.gmail.com>
Subject: Re: [PATCH v6] hw/i386: pass RNG seed via setup_data entry
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=139.178.84.217;
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

On Thu, Jul 21, 2022 at 1:00 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Jul 21, 2022 at 12:49:50PM +0200, Jason A. Donenfeld wrote:
> > Tiny machines optimized for fast boot time generally don't use EFI,
> > which means a random seed has to be supplied some other way. For this
> > purpose, Linux (=E2=89=A55.20) supports passing a seed in the setup_dat=
a table
> > with SETUP_RNG_SEED, specially intended for hypervisors, kexec, and
> > specialized bootloaders. The linked commit shows the upstream kernel
> > implementation.
> >
> > Link: https://git.kernel.org/tip/tip/c/68b8e9713c8
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Richard Henderson <richard.henderson@linaro.org>
> > Cc: Eduardo Habkost <eduardo@habkost.net>
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > Cc: Laurent Vivier <laurent@vivier.eu>
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>
> Well why not.
>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>
> who's merging this? Paolo me or you?

How about you go ahead and merge it.

Thanks,
Jason

