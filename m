Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FB72C3F92
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 13:08:16 +0100 (CET)
Received: from localhost ([::1]:51012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khtap-0000KH-Vi
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 07:08:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1khtZM-0008Ez-Af
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 07:06:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1khtZK-0005PR-RV
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 07:06:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606306001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JXvN1fwdi+Ln79fFgeuToNBOdonqS7+Hi66ZgrajwEc=;
 b=BFZ7AT7rpPSLx2G46FEdcmITrTVJT2W1nik0Qxctwykty9useaIbVpH4aIwcODxPr9SAhj
 1ZP3G4tsRyT7hKBuM1uPFtktIkSdMMhMW5QmKmZ5EkYvVT/DD0SD3DsasvoWJqUOtpyy5R
 TWuvmVUy0Dhsk66ZzSfdGvDsw7CFVXo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-PWV_gvTdN42IrottsTVwRg-1; Wed, 25 Nov 2020 07:06:38 -0500
X-MC-Unique: PWV_gvTdN42IrottsTVwRg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 358A6108088C;
 Wed, 25 Nov 2020 12:06:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91E4760854;
 Wed, 25 Nov 2020 12:06:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A470917535; Wed, 25 Nov 2020 13:06:30 +0100 (CET)
Date: Wed, 25 Nov 2020 13:06:30 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [PATCH v2] Fix build with 64 bits time_t
Message-ID: <20201125120630.oey76zk2kfyr5epa@sirius.home.kraxel.org>
References: <20201118203824.1624924-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201118203824.1624924-1-fontaine.fabrice@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Wed, Nov 18, 2020 at 09:38:24PM +0100, Fabrice Fontaine wrote:
> time element is deprecated on new input_event structure in kernel's
> input.h [1]
> 
> This will avoid the following build failure:
> 
> hw/input/virtio-input-host.c: In function 'virtio_input_host_handle_status':
> hw/input/virtio-input-host.c:198:28: error: 'struct input_event' has no member named 'time'
>   198 |     if (gettimeofday(&evdev.time, NULL)) {
>       |                            ^

Fails to build (rhel-7).

>  - Drop define of input_event_{sec,usec} as it is already done in 
>    include/standard-headers/linux/input.h

Maybe these are not used?  So it breaks with old system headers?

take care,
  Gerd


