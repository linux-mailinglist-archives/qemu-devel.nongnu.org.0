Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C6D39F864
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 16:02:57 +0200 (CEST)
Received: from localhost ([::1]:49274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqcJk-0005vJ-6T
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 10:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lqcHo-0004TG-Tv
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:00:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lqcHk-0004qM-5A
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:00:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623160849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2LKZQu1D7TTv+WMM7fVnrP/xRlIJ76tIzC5ZP/OynKU=;
 b=Qp/W9Nv8HrmpmTlViEG5VssBGMHNRlP2ktSOKm5Wt5qbrXE13WZ0irJdUkX0Tv2k48d93q
 NzgJTosoUbOLNiIGFJVb8FC6eWS42UANviGvLoWROz9XFLfJXGIvyb9uBTD+MCi6ca8nUe
 u8sHM+qg7CZNU/xnZjdiz3XuCCaIbGc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-PP7OmBQUPgmIXkRuCk2Eyw-1; Tue, 08 Jun 2021 10:00:45 -0400
X-MC-Unique: PP7OmBQUPgmIXkRuCk2Eyw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84292801B15;
 Tue,  8 Jun 2021 14:00:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 50AA25D6A1;
 Tue,  8 Jun 2021 14:00:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D87AE18003B6; Tue,  8 Jun 2021 16:00:42 +0200 (CEST)
Date: Tue, 8 Jun 2021 16:00:42 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v1 3/5] ui/egl: Add egl helpers to help with
 synchronization
Message-ID: <20210608140042.kl26xpevsswiq7ty@sirius.home.kraxel.org>
References: <20210607232530.454435-1-vivek.kasireddy@intel.com>
 <20210607232530.454435-4-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210607232530.454435-4-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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

  Hi,

> +        epoxy_has_egl_extension(qemu_egl_display,
> +                                "EGL_ANDROID_native_fence_sync")) {

What about non-android?  Is the name there just for historical reasons?
Or do we actually need something else for desktop systems?

> +void egl_dmabuf_wait_sync(QemuDmaBuf *dmabuf)

See other mail on blocking wait.  Otherwise looks sane.

> +static void gd_gl_wait_dmabuf(DisplayChangeListener *dcl,
> +                              QemuDmaBuf *dmabuf)

separate patch for the gtk bits please.

thanks,
  Gerd


