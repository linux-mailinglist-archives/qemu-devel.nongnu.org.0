Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 104EA3C5D90
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:44:29 +0200 (CEST)
Received: from localhost ([::1]:46334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2wEV-0008Va-Rb
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2wAn-0002YP-DW
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:40:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2wAk-0000w9-6F
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:40:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626097233;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dzVPpW7/Sq5oq7+fJCs7zlQ9S0AN++IVKWx0dWdN5Ns=;
 b=GYXJU3bScq8eIMHavi4zAyL7oerFmfO7c1jzx4jLy9APM5SyaHeRW+kqrtc8xS0zxRctHj
 xKTvRIHp89cw3zHkJ61kWOQT3vIYSAqyJJfyJ06276amoTjGvEf+c6fYPhP5Npoq6Zon8u
 RE7OPbw7RsnSMmVzXKuOtKwZZ+bYsTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-UzJ8kHK5ML-Yj3QkzD9xFg-1; Mon, 12 Jul 2021 09:40:29 -0400
X-MC-Unique: UzJ8kHK5ML-Yj3QkzD9xFg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60D0F1922961;
 Mon, 12 Jul 2021 13:40:28 +0000 (UTC)
Received: from redhat.com (ovpn-114-105.ams2.redhat.com [10.36.114.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5453F1971B;
 Mon, 12 Jul 2021 13:40:27 +0000 (UTC)
Date: Mon, 12 Jul 2021 14:40:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] meson: fix condition for io_uring stubs
Message-ID: <YOxGSM/6RfaYEYDW@redhat.com>
References: <20210712123917.463123-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210712123917.463123-1-pbonzini@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 12, 2021 at 02:39:17PM +0200, Paolo Bonzini wrote:
> CONFIG_LINUX_IO_URING is not included in config-host.mak and therefore is
> not usable in "when" clauses.  Just include it unconditionally, it will
> be quietly elided by the linker if liburing is not available (including
> on non-Linux).
> 
> At this point, the difference between libraries that have config-host.mak
> entries and those that do not is quite confusing.  The remaining ~dozen
> should be converted in 6.2.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  stubs/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Tested-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


