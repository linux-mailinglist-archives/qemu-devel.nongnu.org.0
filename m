Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7368333DE5
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 14:33:43 +0100 (CET)
Received: from localhost ([::1]:51074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJyy6-0003q4-Om
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 08:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJyu7-00018I-Uv
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 08:29:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJyu6-0007B0-0F
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 08:29:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615382970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8ScCgNxIqd6sDHI2X3m9zVzuFaT/EbwN3SJtZcuNZOs=;
 b=TF5vT4upci6BY2Sp3UPFeGJDM4TgU2vU6s/VeiXwnsQazLbYXo9Ksv5kXOzBVvt8P3DUim
 ipeMGqE4oZbPyw9asiG3zGwkkID+H/y693iJccpWzJzmHkJeoI+JrazoMlqb6sRbjsfQz4
 rzZJ9DFIWoFTUw/fxaL0rlf+d7MThmw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-Dot55fPuPren7dHkeTzhxQ-1; Wed, 10 Mar 2021 08:29:27 -0500
X-MC-Unique: Dot55fPuPren7dHkeTzhxQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA0FB57;
 Wed, 10 Mar 2021 13:29:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FE565C648;
 Wed, 10 Mar 2021 13:29:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8741F18000AC; Wed, 10 Mar 2021 14:29:20 +0100 (CET)
Date: Wed, 10 Mar 2021 14:29:20 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2 2/2] virtio-gpu: Respect UI refresh rate for EDID
Message-ID: <20210310132920.6rv5f62ineowzscq@sirius.home.kraxel.org>
References: <20210303152948.59943-1-akihiko.odaki@gmail.com>
 <20210303152948.59943-2-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210303152948.59943-2-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 qemu Developers <qemu-devel@nongnu.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> -static void xenfb_update_interval(void *opaque, uint64_t interval)
> +static void xenfb_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)

> -    .update_interval = xenfb_update_interval,
> +    .ui_info     = xenfb_ui_info,

Hmm, I suspect xenfb really wants the actual refresh rate, even in case
vnc/sdl change it dynamically.  Anthony?  Stefano?

I guess we should just leave the update_interval callback as-is, for
those who want know, and use ui_info->refresh_rate for the virtual edid
refresh rate (which may not match the actual update interval in case of
dynamic changes).  Adding a comment explaining the difference to
console.h is a good idea too.

Otherwise looks good to me overall.  Splitting the ui/gtk update to a
separate patch is probably a good idea.

take care,
  Gerd


