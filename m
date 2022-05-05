Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2820D51BE8D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 13:55:04 +0200 (CEST)
Received: from localhost ([::1]:58434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nma4V-0003l6-9e
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 07:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nma2T-0001c7-5v
 for qemu-devel@nongnu.org; Thu, 05 May 2022 07:52:57 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:30844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nma2R-0001tO-IA
 for qemu-devel@nongnu.org; Thu, 05 May 2022 07:52:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651751574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GOewFIR/AyhFTSTNUniSTH4HDi0aAiO1qU8V2oBzj+w=;
 b=AvPoOKl/5x0TkAST+D2MYsgxH5HykLrexIqll4ad1bUkzvAX/xq7A3UMAMe859bBRSj3me
 +CcVBBI2/Klm//Yx6f4ab6iOtPwR133bZecq6kMrQVQj3pGgCTmClaaR5Mmfe5654sKlbB
 XOpK/vM/NQ5GLH7XDwLjl2EFxo6L3/E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-ekTcBkXsPZaqLFO8Pn8YdA-1; Thu, 05 May 2022 07:52:51 -0400
X-MC-Unique: ekTcBkXsPZaqLFO8Pn8YdA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CEE7185A79C;
 Thu,  5 May 2022 11:52:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 139B0463E1F;
 Thu,  5 May 2022 11:52:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0C88321E6880; Thu,  5 May 2022 13:52:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,  Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>,  John Snow
 <jsnow@redhat.com>,  =?utf-8?Q?Herv=C3=A9?= Poussineau
 <hpoussin@reactos.org>,  Aleksandar
 Rikalo <aleksandar.rikalo@syrmia.com>,  qemu-block@nongnu.org
Subject: Re: [PATCH v2] hw/block/fdc-sysbus: Always mark sysbus floppy
 controllers as not having DMA
References: <20220505101842.2757905-1-peter.maydell@linaro.org>
Date: Thu, 05 May 2022 13:52:50 +0200
In-Reply-To: <20220505101842.2757905-1-peter.maydell@linaro.org> (Peter
 Maydell's message of "Thu, 5 May 2022 11:18:42 +0100")
Message-ID: <87ee18urfx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.74; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Peter Maydell <peter.maydell@linaro.org> writes:

> The sysbus floppy controllers (devices sysbus-fdc and sun-fdtwo)
> don't support DMA.  The core floppy controller code expects this to
> be indicated by setting FDCtrl::dma_chann to -1.  This used to be
> done in the device instance_init functions sysbus_fdc_initfn() and
> sun4m_fdc_initfn(), but in commit 1430759ec3e we refactored this code
> and accidentally lost the setting of dma_chann.

Worth a

  Fixes: 1430759ec3e4cb92da224d739c914a0e8d78d786

tag?

>
> For sysbus-fdc this has no ill effects because we were redundantly
> also setting dma_chann in fdctrl_init_sysbus(), but for sun-fdtwo
> this means that guests which try to enable DMA on the floppy
> controller will cause QEMU to crash because FDCtrl::dma is NULL.
>
> Set dma_chann to -1 in the common instance init, and remove the
> redundant code in fdctrl_init_sysbus() that is also setting it.
>
> There is a six-year-old FIXME comment in the jazz board code to the
> effect that in theory it should support doing DMA via a custom DMA
> controller.  If anybody ever chooses to fix that they can do it by
> adding support for setting both FDCtrl::dma_chann and FDCtrl::dma.
> (A QOM link property 'dma-controller' on the sysbus device which can
> be set to an instance of IsaDmaClass is probably the way to go.)
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/958
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


