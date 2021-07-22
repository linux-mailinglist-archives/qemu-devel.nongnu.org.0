Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DE83D231A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 14:12:46 +0200 (CEST)
Received: from localhost ([::1]:58680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6XZE-0001SH-UZ
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 08:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6XYH-0000mJ-Kr
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:11:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6XYD-0007rm-Qm
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:11:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626955899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bSIJDKvjwpCMRGbd226LYqEB6cMEm5T7xBDQAkboqIs=;
 b=DEGMwFheJtiWrhpKdYyF/ZQnpwwAo53Lzv90/q77Kly6kH0oDXMSxdk6Lp45O6QIo+SL29
 athLH5fUqD3E3M7B+oKmXIpIt/rDz2/OyuHwWsDtoxRns9i4R1TgewAvEXtJMXSjkVmYDx
 ycoXDZLgJyLJbAgqKj+9gHa+MHOeIL0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-spd1WSfwM9S35Ofvv22Prg-1; Thu, 22 Jul 2021 08:11:36 -0400
X-MC-Unique: spd1WSfwM9S35Ofvv22Prg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9728C10086C4
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 12:11:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8C93190EA;
 Thu, 22 Jul 2021 12:11:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 76C3A18000B2; Thu, 22 Jul 2021 14:11:20 +0200 (CEST)
Date: Thu, 22 Jul 2021 14:11:20 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH] hw/display: fix virgl reset regression
Message-ID: <20210722121120.epu7cciuvefks64c@sirius.home.kraxel.org>
References: <20210702123221.942432-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210702123221.942432-1-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 02, 2021 at 04:32:21PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Before commit 49afbca3b00e8e517d54964229a794b51768deaf ("virtio-gpu: drop
> use_virgl_renderer"), use_virgl_renderer was preventing calling GL
> functions from non-GL context threads. The innocuously looking
> 
>   g->parent_obj.use_virgl_renderer = false;
> 
> was set the first time virtio_gpu_gl_reset() was called, during
> pc_machine_reset() in the main thread. Further virtio_gpu_gl_reset()
> calls in IO threads, without associated GL context, were thus skipping
> GL calls and avoided warnings or crashes (see also
> https://gitlab.freedesktop.org/virgl/virglrenderer/-/issues/226).

Conflicts with patch by Akihiko Odaki fixing the same thing or a
related issue:

virtio-gpu: Call Virgl only in the main thread

https://patchwork.ozlabs.org/project/qemu-devel/patch/20210617113520.25973-1-akihiko.odaki@gmail.com/

Can you have a look please and suggest how to handle this?

thanks,
  Gerd


