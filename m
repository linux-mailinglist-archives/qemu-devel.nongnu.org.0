Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D09D73B1A7C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 14:49:22 +0200 (CEST)
Received: from localhost ([::1]:34220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw2Jl-0000OK-OS
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 08:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lw2Hz-0007RC-Fb
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:47:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lw2Hw-0004ze-Oj
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:47:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624452448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0LzEaJJIE7JNKOToLqbB0Nl7G8Zxzu/A3c5BfA/Lv24=;
 b=KunMxWpG5dolHgEepguowf2XqablqGN0uLe4LZUe+2C6WKVR07B0Agwyrwre4y9mdrWFVR
 WwcgtuVX42C6Xa7QlkdIqy6nppo4mJYaLLYbJbFFXV+f4y3s08Th7LyXhjlWix0O2DziHv
 FHuJKYLBNn81eve0i0tcfTAyeXLw+AM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-ydMyd-ZLNieuOKkPA48Z8w-1; Wed, 23 Jun 2021 08:47:26 -0400
X-MC-Unique: ydMyd-ZLNieuOKkPA48Z8w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7F8410C1ADC;
 Wed, 23 Jun 2021 12:47:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 322B65D9C6;
 Wed, 23 Jun 2021 12:47:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 885B5180060E; Wed, 23 Jun 2021 14:47:20 +0200 (CEST)
Date: Wed, 23 Jun 2021 14:47:20 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] virtio-gpu: Call Virgl only in the main thread
Message-ID: <20210623124720.5aokonbqniyf6qj5@sirius.home.kraxel.org>
References: <20210617113520.25973-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210617113520.25973-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 17, 2021 at 08:35:20PM +0900, Akihiko Odaki wrote:
> Virgl relies on callbacks provided by the OpenGL display, and such a
> display may rely on eglMakeCurrent. eglMakeCurrent will fail if the
> given context is current to some other thread. The easiest way to avoid
> such a failure is to call the OpenGL display in a single thread. As all
> operations except virtio_gpu_virgl_reset happens in the main thread,
> this change makes virtio_gpu_virgl_reset happen only in the main thread.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>

Added to vga patch queue.

thanks,
  Gerd


