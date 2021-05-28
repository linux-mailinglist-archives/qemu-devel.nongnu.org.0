Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DDC393D76
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 09:08:20 +0200 (CEST)
Received: from localhost ([::1]:47402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmWbT-0003mv-JH
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 03:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmWa7-000352-3o
 for qemu-devel@nongnu.org; Fri, 28 May 2021 03:06:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmWa3-0002lN-VN
 for qemu-devel@nongnu.org; Fri, 28 May 2021 03:06:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622185610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=//7mY5oHhF7YdjxmIlnnU1jTle/tPQY3msuhRy8wAMY=;
 b=HR3FJlEcKG6GZ47ciOtWv+yKrScccCvPJ2I/P19OU9zFhxUSgUwLQVHVevmFYkwBWVgoMB
 MG29OHhUMnU/O2xnErxK6+L0n6ZCJ8MDYs0YmTvbi+Ya672Edc5G2vus1Rim+A4MrgKKNE
 VCMnqeV69Cxn/TJ44JtqLgT5LqJ6y7Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281--u0x8TfcOOasxrEsSJfUNA-1; Fri, 28 May 2021 03:06:48 -0400
X-MC-Unique: -u0x8TfcOOasxrEsSJfUNA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 800B8107ACC7;
 Fri, 28 May 2021 07:06:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CA945B4A7;
 Fri, 28 May 2021 07:06:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D5E8E18003AF; Fri, 28 May 2021 09:06:41 +0200 (CEST)
Date: Fri, 28 May 2021 09:06:41 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 3/3] ui/vdagent: fix clipboard info memory leak in error
 path
Message-ID: <20210528070641.4ysnvhbvvcd4glti@sirius.home.kraxel.org>
References: <20210526091248.434459-1-stefanha@redhat.com>
 <20210526091248.434459-4-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210526091248.434459-4-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Coiby Xu <Coiby.Xu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 26, 2021 at 10:12:48AM +0100, Stefan Hajnoczi wrote:
> If the size of a VD_AGENT_CLIPBOARD_GRAB message is invalid we leak info
> when returning early.
> 
> Thanks to Coverity for spotting this:
> 
> *** CID 1453266:  Resource leaks  (RESOURCE_LEAK)
> /qemu/ui/vdagent.c: 465 in vdagent_chr_recv_clipboard()
> 459             info = qemu_clipboard_info_new(&vd->cbpeer, s);
> 460             if (size > sizeof(uint32_t) * 10) {
> 461                 /*
> 462                  * spice has 6 types as of 2021. Limiting to 10 entries
> 463                  * so we we have some wiggle room.
> 464                  */
> >>>     CID 1453266:  Resource leaks  (RESOURCE_LEAK)
> >>>     Variable "info" going out of scope leaks the storage it points to.
> 465                 return;
> 466             }
> 467             while (size >= sizeof(uint32_t)) {
> 468                 trace_vdagent_cb_grab_type(GET_NAME(type_name, *(uint32_t *)data));
> 469                 switch (*(uint32_t *)data) {
> 470                 case VD_AGENT_CLIPBOARD_UTF8_TEXT:
> 
> Fixes: f0349f4d8947ad32d0fa4678cbf5dbb356fcbda1 ("ui/vdagent: add clipboard support")
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


