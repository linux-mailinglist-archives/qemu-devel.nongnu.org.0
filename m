Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AA063A610
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 11:27:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozbLT-00038C-KQ; Mon, 28 Nov 2022 05:26:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ozbLO-00036X-Ex
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:26:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ozbLN-0006iX-2U
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:26:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669631191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JsO6Ki4/K+Nz2KHJEaKtdOQJe4MvLPTcpd0jJEinVtg=;
 b=d4FuZ8v4fDz/XQWwD+In7L/NMY/1dUnEVCM3tUax3q98rwSA/NBvWyNw9fVyeUScnL6UYU
 Q65nVoV1ri548XRCzt6RqM0UFusPae7s3tE/k4CFb7NMP4TboDomxO8L8Zlau9Z1c+7Ba6
 QaUXz0CEKtxP3CiRTsqdxHNIUkEnFTw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-257-xTVJgCWiOD-0huLlQTbsSg-1; Mon, 28 Nov 2022 05:26:30 -0500
X-MC-Unique: xTVJgCWiOD-0huLlQTbsSg-1
Received: by mail-wm1-f70.google.com with SMTP id
 az40-20020a05600c602800b003cfa26c40easo5614305wmb.1
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 02:26:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JsO6Ki4/K+Nz2KHJEaKtdOQJe4MvLPTcpd0jJEinVtg=;
 b=RnXP1S/7h4VmtOFO0s6I1AR3tbegByWkC0N7aPYTiW1S9Uq4FCnYgf7k+QuGFr+rS8
 I70Igf6ulnjamdZZhbUGfYZlEeeIg4OLV9ZcUAdnSy3BUeCmDqJ7sNEvoeEvQe9nswyH
 SM5b5M6mBvj1K0g9E+EYGcAckmIzJttqUisnxr1mnzL0zwf86b2p9AYEHk7XjrsMRKsQ
 l/jqwusfLZb/Ptj9CxsZef+uD0es/6DjtlextEND57YN5sBJvvbL6kAjibKUMD0cPeeQ
 yIVRRYZpjV30wVL3lBiGB+ezO0htT3oI5XS2KoOz82lIFp2RVROYErN4tUQWCynXim0R
 cNNg==
X-Gm-Message-State: ANoB5plqScI4gmAPcLe+T+sj/cCN93LvyUV2ej4wiQzsz0RJ/a2O6kJq
 04sowaNZYAoUG5yIP+4PUGPrC+/o/1xSJLL8PU/KlI9DK+j1VfksAMP9aFm+1osIX5qzXn31GCe
 6oDgow/1txy+vV2Q=
X-Received: by 2002:a7b:c454:0:b0:3b4:be28:d800 with SMTP id
 l20-20020a7bc454000000b003b4be28d800mr23578890wmi.170.1669631188902; 
 Mon, 28 Nov 2022 02:26:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7lU5ecNzQ8q8ZVLFJc8BE0ibI3GHM8jkPYg8LHvcjeU2gfKYpSUVDSxGQy1XfBDfwLBPdMAw==
X-Received: by 2002:a7b:c454:0:b0:3b4:be28:d800 with SMTP id
 l20-20020a7bc454000000b003b4be28d800mr23578872wmi.170.1669631188693; 
 Mon, 28 Nov 2022 02:26:28 -0800 (PST)
Received: from redhat.com ([2.52.149.178]) by smtp.gmail.com with ESMTPSA id
 u1-20020a5d5141000000b002365cd93d05sm10262591wrt.102.2022.11.28.02.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 02:26:27 -0800 (PST)
Date: Mon, 28 Nov 2022 05:26:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, dgilbert@redhat.com
Subject: Re: [PATCH 05/12] pci: Build hw/pci/pci-hmp-cmds.c only when
 CONFIG_PCI
Message-ID: <20221128052613-mutt-send-email-mst@kernel.org>
References: <20221128080202.2570543-1-armbru@redhat.com>
 <20221128080202.2570543-6-armbru@redhat.com>
 <5d7f3bb7-cac0-1537-0ba2-e1214be0458a@linaro.org>
 <875yezv0pb.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875yezv0pb.fsf@pond.sub.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Nov 28, 2022 at 11:21:36AM +0100, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
> > On 28/11/22 09:01, Markus Armbruster wrote:
> >> We compile pci-hmp-cmds.c always, but pci-qmp-cmds.c only when
> >> CONFIG_PCI.  hw/pci/pci-stub.c keeps the linker happy when
> >> !CONFIG_PCI.  Build pci-hmp-cmds.c that way, too.
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >> ---
> >>   hw/pci/pci-stub.c  | 5 +++++
> >>   hw/pci/meson.build | 2 +-
> >>   2 files changed, 6 insertions(+), 1 deletion(-)
> >
> > Squash with patch #3?
> 
> Could do, but the combined patch isn't pure code motion anymore, and I
> get to explain that in the commit message.

Yes I like it the way it is.

-- 
MST


