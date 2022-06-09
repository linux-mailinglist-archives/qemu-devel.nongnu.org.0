Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D88544CDD
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:02:02 +0200 (CEST)
Received: from localhost ([::1]:50068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHnR-00060o-D5
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzFOn-0000ni-MO
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:28:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzFOj-0001tX-Ty
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:28:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654770490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gTg5vlQmIJu4b20Pu0C1H0E0ALbjaRUIwY0jnF9uY2Q=;
 b=ISsgwOrVZ+zz2ODNNFtchATqJh9iS+bwfTZ6SnXlfO3YfRWl9bk0Rlx6qIDehTfjV/He7Y
 mjDH3uWs2NtNHHlOrjmIzdSsSze2GqDt2M89WxrALk4cYA25ga0ZJuI2WsJyJKDA9LoCyH
 HHodfZ+K12ZV2UmXU09X2G2ny2C2nXM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-mZyfLHhaM-GD1Jv_Xb-K4Q-1; Thu, 09 Jun 2022 06:28:07 -0400
X-MC-Unique: mZyfLHhaM-GD1Jv_Xb-K4Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8EC529AA2E7;
 Thu,  9 Jun 2022 10:28:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 935C3492C3B;
 Thu,  9 Jun 2022 10:28:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1B42E1800094; Thu,  9 Jun 2022 12:28:05 +0200 (CEST)
Date: Thu, 9 Jun 2022 12:28:05 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu Developers <qemu-devel@nongnu.org>, xen-devel@lists.xenproject.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v3 2/3] ui: Deliver refresh rate via QemuUIInfo
Message-ID: <20220609102805.qz2xrnd6ms6cigir@sirius.home.kraxel.org>
References: <20220226115516.59830-1-akihiko.odaki@gmail.com>
 <20220226115516.59830-3-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220226115516.59830-3-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

> --- a/include/ui/console.h
> +++ b/include/ui/console.h
> @@ -139,6 +139,7 @@ typedef struct QemuUIInfo {
>      int       yoff;
>      uint32_t  width;
>      uint32_t  height;
> +    uint32_t  refresh_rate;
>  } QemuUIInfo;
>  
>  /* cursor data format is 32bit RGBA */
> @@ -426,7 +427,6 @@ typedef struct GraphicHwOps {
>      void (*gfx_update)(void *opaque);
>      bool gfx_update_async; /* if true, calls graphic_hw_update_done() */
>      void (*text_update)(void *opaque, console_ch_t *text);
> -    void (*update_interval)(void *opaque, uint64_t interval);
>      void (*ui_info)(void *opaque, uint32_t head, QemuUIInfo *info);
>      void (*gl_block)(void *opaque, bool block);
>  } GraphicHwOps;

So you are dropping update_interval, which isn't mentioned in the commit
message at all.  Also this patch is rather big.  I'd suggest:

(1) add refresh_rate
(2) update users one by one
(3) finally drop update_interval when no user is left.

thanks,
  Gerd


