Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8474841A3
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 13:26:16 +0100 (CET)
Received: from localhost ([::1]:45370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4itL-0004II-2q
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 07:26:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n4ir9-0002ej-Sz
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 07:23:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n4ir6-0001N1-10
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 07:23:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641299034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5XoS3J1i+TmaZcEd1FD21XD8kABRNBqg8LAxRI+1Hno=;
 b=K7yJY/CmO2CqyxKckgI5qmkG7Zf1SL9HwVOHp/hexSi1zm8A33Xl+5DRQnMMARfZHZeRSj
 t4q/3m979aKLA9gYhDIw3exzdsQLc04Cn3Ic10ls5/c28iljGmQgve2fE4bCnqYYIr2mik
 vn+8ozeg7n/BKeqES2ZnaOMQRkQgMeU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-ubnHuZWEPUaiYqLdGAey_w-1; Tue, 04 Jan 2022 07:23:53 -0500
X-MC-Unique: ubnHuZWEPUaiYqLdGAey_w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 145FD100CCC0;
 Tue,  4 Jan 2022 12:23:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF9187E641;
 Tue,  4 Jan 2022 12:23:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 25BBB1800091; Tue,  4 Jan 2022 13:23:50 +0100 (CET)
Date: Tue, 4 Jan 2022 13:23:50 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Carwyn Ellis <carwynellis@gmail.com>
Subject: Re: [PATCH 2/2] hw/display/vmware_vga: do not discard screen updates
Message-ID: <20220104122350.ktsnpqfmtrmwcxrk@sirius.home.kraxel.org>
References: <20220104091135.61226-1-carwynellis@gmail.com>
 <20220104091135.61226-3-carwynellis@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220104091135.61226-3-carwynellis@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> This change firstly increases the screen update FIFO size to ensure it's
> large enough to accomodate all updates deferred in a given screen
> refresh cycle.

How do you know it's large enough?

> @@ -385,7 +385,14 @@ static inline void vmsvga_update_rect_delayed(struct vmsvga_state_s *s,
>  {
>      struct vmsvga_rect_s *rect = &s->redraw_fifo[s->redraw_fifo_last++];
>  
> -    s->redraw_fifo_last &= REDRAW_FIFO_LEN - 1;
> +    if (s->redraw_fifo_last >= REDRAW_FIFO_LEN) {
> +        VMWARE_VGA_DEBUG("%s: Discarding updates - FIFO length %d exceeded\n",
> +            "vmsvga_update_rect_delayed",
> +            REDRAW_FIFO_LEN

Hmm, apparently you don't know ;)

How about just calling vmsvga_update_rect_flush()
when the fifo is (almost) full?

Which guest do you use btw?  I'm kind-of surprised this is still being
used even though it hasn't seen any development (beside fixing a bug now
and then) for a decade or so and the feature gap to recent vmware is
huge ...

take care,
  Gerd


