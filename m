Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 882365FB3F2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 15:55:14 +0200 (CEST)
Received: from localhost ([::1]:33480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiFiz-00073P-AG
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 09:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oiFKq-0007ff-7E
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 09:30:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oiFKn-000761-9q
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 09:30:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665495011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dYTrghk8Td9LIdsqf13jzqHC9hyJSMVG2CpHb2ZEnZc=;
 b=Up+rF+ZVJONz1szDhgtzE984DR9gQ0XjzYYSLWpQJ4YnfdCOyBWHklqYeSMu4twvOf6hjg
 LhBn+o/HnywwkD3PrTmIuISflaF2KeOkldX+zvAgbHZm2m5E/4sCa14L9PTD0xCtDPxA49
 90jeXMi/hKC9yHpSZ7SBBun6wxe8qVw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-DXM0YrYiP-i2T5_PzcwRkw-1; Tue, 11 Oct 2022 09:30:10 -0400
X-MC-Unique: DXM0YrYiP-i2T5_PzcwRkw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCF2885704A;
 Tue, 11 Oct 2022 13:30:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D5F62144B24;
 Tue, 11 Oct 2022 13:30:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2958A180093B; Tue, 11 Oct 2022 15:30:08 +0200 (CEST)
Date: Tue, 11 Oct 2022 15:30:08 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Helge Konetzka <hk@zapateado.de>
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH 1/2] audio: fix in.voices test
Message-ID: <20221011133008.xyqxua4vmwxijppv@sirius.home.kraxel.org>
References: <40de48d2-6acc-6525-34d4-cb2eec9977e8@zapateado.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40de48d2-6acc-6525-34d4-cb2eec9977e8@zapateado.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 25, 2022 at 10:56:56AM +0200, Helge Konetzka wrote:
> 
> Calling qemu with valid -audiodev ...,in.voices=0 results in an obsolete
> warning:
>   audio: Bogus number of capture voices 0, setting to 0
> This patch fixes the in.voices test.
> 
> Signed-off-by: Helge Konetzka <hk@zapateado.de>
> ---
>  audio/audio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/audio/audio.c b/audio/audio.c
> index cfa4119c05..8a0ade4052 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -1756,7 +1756,7 @@ static AudioState *audio_init(Audiodev *dev, const
> char *name)

Patch is mangled (line-wrapped) here, 'git am' refuses to accept it.
Please use 'git send-email' to post patches,

thanks & take care,
  Gerd


