Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B80D63AB0F0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:07:07 +0200 (CEST)
Received: from localhost ([::1]:58264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltovS-0000Kl-Nl
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltodK-0007AN-9X
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:48:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltodH-0001U1-Qn
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:48:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623923299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F4MOxOkxZbEbEr1UIoGh7rzE7hDEShXz8OdWVW7vWrM=;
 b=EorByOyxju6salWGoHu9Xg+PIdaeXzy4VqK1BmW5if+0TUg6QcjISsC5hlgSy4npJ6SKMZ
 kGiEF4DuW3/WzWZ0yPq8KHyDyrM9Keyn5PceHGjrOP8qNIiGpxKnUeBwPbmqVRaSvbxsZ+
 6uHoCxnXnZ8MYurtJXGzDvxONM777ZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-jl5iPvDzPVGGAyitLgarNg-1; Thu, 17 Jun 2021 05:48:17 -0400
X-MC-Unique: jl5iPvDzPVGGAyitLgarNg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2DB414EE;
 Thu, 17 Jun 2021 09:48:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70B9C5D9D7;
 Thu, 17 Jun 2021 09:48:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DDC3D18000B2; Thu, 17 Jun 2021 11:48:11 +0200 (CEST)
Date: Thu, 17 Jun 2021 11:48:11 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH 0/4] modules: add support for target-specific modules.
Message-ID: <20210617094811.gatatv7vla2rxqgc@sirius.home.kraxel.org>
References: <20210610101553.943689-1-kraxel@redhat.com>
 <5953598.eXybCX72BP@pizza>
 <20210615050930.bmgup2axfr7sqvoa@sirius.home.kraxel.org>
 <2963309.4TrVdrBa0x@pizza>
 <20210616092815.rjznyjnvgrrfojq6@sirius.home.kraxel.org>
 <bdf9b356-87ee-0749-c977-f48989fa8e26@suse.de>
 <20210617053759.uibvdpu2wtq3fqwv@sirius.home.kraxel.org>
 <2be72be7-5c3f-e25d-fb84-cf58b573bf27@suse.de>
MIME-Version: 1.0
In-Reply-To: <2be72be7-5c3f-e25d-fb84-cf58b573bf27@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?utf-8?B?Sm9zw6k=?= Ricardo Ziviani <jose.ziviani@suse.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Do we need to be able to unload modules that we previously loaded? Or is this not a realistic requirement?

Surely doable, but it's work and needs infrastructure we don't have
right now.  We must be able to unregister everything modules can
register, which is only partly the case today.  We need usage counters
so we can figure whenever a module is in use or not.  Maybe more.

I don't see a use case justifying that work.

The linux kernel can unload modules (when enabled at build time), and
pretty much the only reason I've ever used that is device driver
development: test new driver version without reboot (as long as you
don't make a mistake which Oopses the kernel ...).

take care,
  Gerd


