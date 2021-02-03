Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8358430DE9B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 16:49:37 +0100 (CET)
Received: from localhost ([::1]:49096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7KPQ-0001wL-Jz
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 10:49:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7KON-0000pt-Tk
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 10:48:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7KOM-0005us-6X
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 10:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612367309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kLAhJ98wIIGoQ6rOfR/EARHnNQa+mIV+miu9AcmfMHs=;
 b=Jg/XZDkld4+/4vb/x5EDRP/h5PCKOalQ0epS4v82GKrp3P/G+0BU19NqcFhCtSPJyeclfm
 OBRNQ3RI5iBXgIHvewhOzc05qEquSR1pY5p0RBmYYRotG1fJOh8GkCnIV9WmcuzQ0jchdU
 0TEEHMW0eGtMA1GDxvmY55P+KJgVWRA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-4cSw0LsFOuqNingnltgUDA-1; Wed, 03 Feb 2021 10:48:27 -0500
X-MC-Unique: 4cSw0LsFOuqNingnltgUDA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 123578749BE
 for <qemu-devel@nongnu.org>; Wed,  3 Feb 2021 15:48:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD1E25C23A;
 Wed,  3 Feb 2021 15:48:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BBF611800856; Wed,  3 Feb 2021 16:48:20 +0100 (CET)
Date: Wed, 3 Feb 2021 16:48:20 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 11/20] ui: add an optional get_flags callback to
 GraphicHwOps
Message-ID: <20210203154820.wolx57xxegwdw7q2@sirius.home.kraxel.org>
References: <20210202142625.609070-1-marcandre.lureau@redhat.com>
 <20210202142625.609070-12-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210202142625.609070-12-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> +static int
> +virtio_gpu_get_flags(void *opaque)
> +{
> +    VirtIOGPUBase *g = opaque;
> +    int flags = GRAPHIC_FLAGS_NONE;
> +
> +    if (virtio_gpu_virgl_enabled(g->conf))
> +        flags |= GRAPHIC_FLAGS_GL;
> +
> +    if (virtio_gpu_dmabuf_enabled(g->conf))
> +        flags |= GRAPHIC_FLAGS_DMABUF;

fbe6ba76ac01 ui: add an optional get_flags callback to GraphicHwOps
ERROR: braces {} are necessary for all arms of this statement
#50: FILE: hw/display/virtio-gpu-base.c:123:
+    if (virtio_gpu_virgl_enabled(g->conf))
[...]

ERROR: braces {} are necessary for all arms of this statement
#53: FILE: hw/display/virtio-gpu-base.c:126:
+    if (virtio_gpu_dmabuf_enabled(g->conf))
[...]

total: 2 errors, 0 warnings, 68 lines checked


