Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7668A54848E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 12:34:47 +0200 (CEST)
Received: from localhost ([::1]:57080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0hPC-0001Sd-0x
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 06:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o0hML-0000H3-Fd
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 06:31:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o0hMH-0008Vk-EA
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 06:31:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655116303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vtbSgQG7jHDB7Rvi96vTtjLkqeEwBt9Bc85UrfXgqxA=;
 b=d+wtJ20mEYlDwneSxj40/CyjxFgicXUvASJU05M8hWyNgROKCXAlhym40mfXYRx2GTru9I
 wDUNqdSGnW1OgYKB6bxlBEeN1mOSbg49TES+WbdxEgKeTPnh0RnK0+Tl9QRJvPeovxcMVm
 E3Gq/0tXhaf4q8gJS7qWspwN8WTXFIA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-zS-Qrjf6MgexCtmeQUWhDw-1; Mon, 13 Jun 2022 06:31:20 -0400
X-MC-Unique: zS-Qrjf6MgexCtmeQUWhDw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 334B91C1CB84;
 Mon, 13 Jun 2022 10:31:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0158618EA3;
 Mon, 13 Jun 2022 10:31:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6279118007A6; Mon, 13 Jun 2022 12:31:18 +0200 (CEST)
Date: Mon, 13 Jun 2022 12:31:18 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Hongren (Zenithal) Zheng" <i@zenithal.me>
Cc: qemu-devel@nongnu.org, contact@canokeys.org,
 MkfsSion <myychina28759@gmail.com>
Subject: Re: [PATCH 2/3] hw/usb/canokey: fix compatibility of qemu-xhci
Message-ID: <20220613103118.3m5wgis6sov4avdt@sirius.home.kraxel.org>
References: <YqYrIpNQHCBaOca5@Sun>
 <YqYsBRT9CuqqJyOG@Sun>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqYsBRT9CuqqJyOG@Sun>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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

  Hi,

>          case CANOKEY_EP_IN_WAIT:
>              /* NAK for early INTR IN */
>              p->status = USB_RET_NAK;
> +            /* store pointer here for later emu_transmit wakeup */
> +            key->ep_in_pointer[ep_in] = p->ep;

There is no need to fish the ep pointer out of usb packets.
You can just use usb_ep_get() instead.

take care,
  Gerd


