Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E313705CB
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 07:56:58 +0200 (CEST)
Received: from localhost ([::1]:33130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcicb-00046B-D3
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 01:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcibX-000384-Bd
 for qemu-devel@nongnu.org; Sat, 01 May 2021 01:55:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcibU-0004DX-Ep
 for qemu-devel@nongnu.org; Sat, 01 May 2021 01:55:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619848547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lp3SzxNIIur6BIgqLkWqgccUuxu8B6TpWwGS5c9rLo0=;
 b=IiaQgKZjeONh/3YtCkM0flNc38UpfrIrgiugNBZ7J08iqP1ZnZ31fRdR/GOSGrgzjNcpGF
 MDIhWew62ozgEOoErKLLLe4cdT8Yh5pTRmbLFTm/rOtCmfvtcmxMIVGcLDDmogtms7lDIx
 g8golBuU1YprqKx+r7efhdnx0IX+OP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-ZeNXWcMSO02muxjF-XVf8w-1; Sat, 01 May 2021 01:55:43 -0400
X-MC-Unique: ZeNXWcMSO02muxjF-XVf8w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDBED801B13;
 Sat,  1 May 2021 05:55:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 794745D9CC;
 Sat,  1 May 2021 05:55:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E53B4113525D; Sat,  1 May 2021 07:55:39 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/sd/omap_mmc: Use device_cold_reset() instead of
 device_legacy_reset()
References: <20210430222348.8514-1-peter.maydell@linaro.org>
Date: Sat, 01 May 2021 07:55:39 +0200
In-Reply-To: <20210430222348.8514-1-peter.maydell@linaro.org> (Peter Maydell's
 message of "Fri, 30 Apr 2021 23:23:48 +0100")
Message-ID: <87o8dvknfo.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> The omap_mmc_reset() function resets its SD card via
> device_legacy_reset().  We know that the SD card does not have a qbus
> of its own, so the new device_cold_reset() function (which resets
> both the device and its child buses) is equivalent here to
> device_legacy_reset() and we can just switch to the new API.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> cc'ing Markus who was interested in conversions away from
> the legacy API. As warned, the conversion patch itself is
> not very interesting as the difficulty is all in confirming
> that the device being reset has no qbuses...

The commit messsage makes this helpful.  Thanks!

I wonder whether we should add a hint to device_legacy_reset()'s
comment.


