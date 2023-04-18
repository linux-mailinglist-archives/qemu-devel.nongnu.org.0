Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C6E6E5C76
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 10:49:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poh0M-0000AT-3b; Tue, 18 Apr 2023 04:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1poh0K-0000AK-0M
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 04:48:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1poh0I-0002hB-FC
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 04:47:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681807677;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ydONqnXwtyxE7/1AMYJ1Z/uR1qQ9gyrYjwT35sqCwjg=;
 b=Nsud8mG5wrVRIUzHXxD6rkPys+2HyWagDaRisx4SixfxEcdxvVsfFdEn9wx51ED4pI0Fa3
 Cv8y2YdHnM0wq2X4jA+mo/iq7RZXkG7HYg5HPPSzCuaLH6qFO9cAQwNLbGscbSlW9KXpHx
 iw1w0v2UD72tiM13Gw50nBcktnF47HM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-G4QZJ1OSMQqJUf1Y2Umx7A-1; Tue, 18 Apr 2023 04:47:54 -0400
X-MC-Unique: G4QZJ1OSMQqJUf1Y2Umx7A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06DA33815F73;
 Tue, 18 Apr 2023 08:47:54 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 697F0492B0D;
 Tue, 18 Apr 2023 08:47:53 +0000 (UTC)
Date: Tue, 18 Apr 2023 09:47:51 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Turner <digit@google.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/3] Fix libvhost-user.c compilation.
Message-ID: <ZD5ZN4qKxMEcJ3Z6@redhat.com>
References: <20230405172109.3081788-1-digit@google.com>
 <20230405172109.3081788-2-digit@google.com>
 <20230407035709-mutt-send-email-mst@kernel.org>
 <CACnJMqpF9FPwtZz3Uj_amCbrRtQo7WWPm0bY_qy=80+ihb8Uhw@mail.gmail.com>
 <CACnJMqoS3L6=zTCL4__EwOk8pR0kR4P2Kbrv5U_xB8Lm2e=vXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACnJMqoS3L6=zTCL4__EwOk8pR0kR4P2Kbrv5U_xB8Lm2e=vXQ@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Apr 07, 2023 at 11:25:14AM +0200, David Turner wrote:
> I meant glibc-2.17, I am using a sysroot to ensure the generated binaries
> run on older Linux distributions.

I think that would be considered an unsupported buld configuration
from QEMU's POV. Our platform policy is declared here:

  https://www.qemu.org/docs/master/about/build-platforms.html

and from this policy we decide the minimum versions of libraries
we intend to build against.

Our two oldest build targets are Debian 10 / RHEL 8, both of
which ship with GLibC 2.28.

IOW, trying to build with a sysroot contanining ancient glibc
2.17 is well outside what QEMU intends to support. 2.17 is
from circa 2012.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


