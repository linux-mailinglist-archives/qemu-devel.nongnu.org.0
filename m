Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AE839F842
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 15:59:51 +0200 (CEST)
Received: from localhost ([::1]:41200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqcGj-0000R0-Lj
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 09:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lqcF6-0006nq-Ul
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 09:58:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lqcF4-0002y9-Ln
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 09:58:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623160685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hquJ6cysHCb/3MlKmSuSjcS7mrDELzf76czZOW5MUFA=;
 b=Wbt4cA3L/EpU0hHe9MnXkD49rgeaK9tLUHUuWkZADCc38F1sDJIRcSkbGxvq0uNODFkTPq
 LIS1gPH+Cdzb3xDrbEXAhy871JNAxbPdNLXLTIrmeLbI8Eh8UKPZyv8Dw+oOhI7r+aNUO3
 BLGXqAoDJmuswfWDCMNDPHBAD+1owd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-NHiYvHzNNPOSNEGddsYweA-1; Tue, 08 Jun 2021 09:58:02 -0400
X-MC-Unique: NHiYvHzNNPOSNEGddsYweA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E8431883522;
 Tue,  8 Jun 2021 13:58:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 28F9310016FB;
 Tue,  8 Jun 2021 13:58:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A2CB118003B6; Tue,  8 Jun 2021 15:57:59 +0200 (CEST)
Date: Tue, 8 Jun 2021 15:57:59 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v1 2/5] ui: Add a helper to wait on a dmabuf sync object
Message-ID: <20210608135759.v4t4qq2lqtqeuihc@sirius.home.kraxel.org>
References: <20210607232530.454435-1-vivek.kasireddy@intel.com>
 <20210607232530.454435-3-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210607232530.454435-3-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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

> +    /* optional */
> +    void (*dpy_gl_wait_dmabuf)(DisplayChangeListener *dcl,
> +                               QemuDmaBuf *dmabuf);

Hmm, a blocking wait isn't the best plan here,
it'll stall the iothread.

We already have a way to stop virtio-gpu command processing:
graphic_hw_gl_block() + graphic_hw_gl_flush()

graphic_hw_gl_block(true) will block virtio-gpu command processing.
graphic_hw_gl_block(false) will unblock virtio-gpu command processing.
graphic_hw_gl_flush() will kick virtio-gpu so it resumes command processing.

I saw in patch #5 that you just do a blocking wait for the fence, which
isn't fundamentally different from what graphic_hw_gl_block does, so it
should be possible to make the gtk ui use that instead.

You'll need an async notification for the fence then.  I think you can
simply poll the fence fd.  Failing that you can either use a timer to
check the fence or do the blocking wait in a new thread.

One little detail is different with graphic_hw_gl_block:  It'll send the
completion no matter what, then stop fetching the next command from the
queue.  So that logic needs an update to also allow delaying the command
completion.

take care,
  Gerd


