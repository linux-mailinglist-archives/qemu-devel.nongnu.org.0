Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 534202B9111
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 12:33:37 +0100 (CET)
Received: from localhost ([::1]:43788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfiC0-0006Pj-E1
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 06:33:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kfi9w-0005Et-G5
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:31:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kfi9t-0002Pv-NP
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:31:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605785484;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PWaC+PutLh8A3Zmjk1M1atHrXW3LvQ6wqNKnfnkPW9Q=;
 b=LSITIiY3KJFJainOG5x5+AcrzsuTIlyGszE+QYc/5S7cDIi4GWxccWE/WgGA6oLS1sfV3h
 XrzZBAv78L8C11mKDHsl/FL1TI6RMINvh0qS+1UDO995FQgf1Yo2F9F3sCvK6Eg35Mpl7w
 KDxxTuWki/tVqBMh1rh/uN1db9ikLyk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-C_r8mQxYO2Cs08GKT5YL5A-1; Thu, 19 Nov 2020 06:31:22 -0500
X-MC-Unique: C_r8mQxYO2Cs08GKT5YL5A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AA00801B15;
 Thu, 19 Nov 2020 11:31:21 +0000 (UTC)
Received: from redhat.com (ovpn-114-191.ams2.redhat.com [10.36.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3743D5C1A1;
 Thu, 19 Nov 2020 11:31:13 +0000 (UTC)
Date: Thu, 19 Nov 2020 11:31:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2] trace: use STAP_SDT_V2 to work around symbol visibility
Message-ID: <20201119113109.GF579364@redhat.com>
References: <20201119112704.837423-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201119112704.837423-1-stefanha@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:44:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 rjones@redhat.com, fche@redhat.com, kraxel@redhat.com, wcohen@redhat.com,
 mrezanin@redhat.com, ddepaula@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 11:27:04AM +0000, Stefan Hajnoczi wrote:
> QEMU binaries no longer launch successfully with recent SystemTap
> releases. This is because modular QEMU builds link the sdt semaphores
> into the main binary instead of into the shared objects where they are
> used. The symbol visibility of semaphores is 'hidden' and the dynamic
> linker prints an error during module loading:
> 
>   $ ./configure --enable-trace-backends=dtrace --enable-modules ...
>   ...
>   Failed to open module: /builddir/build/BUILD/qemu-4.2.0/s390x-softmmu/../block-curl.so: undefined symbol: qemu_curl_close_semaphore
> 
> The long-term solution is to generate per-module dtrace .o files and
> link them into the module instead of the main binary.
> 
> In the short term we can define STAP_SDT_V2 so dtrace(1) produces a .o
> file with 'default' symbol visibility instead of 'hidden'. This
> workaround is small and easier to merge for QEMU 5.2.

And nice for distros to backport too.

> 
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: wcohen@redhat.com
> Cc: fche@redhat.com
> Cc: kraxel@redhat.com
> Cc: rjones@redhat.com
> Cc: mrezanin@redhat.com
> Cc: ddepaula@redhat.com
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> v2:
>  * Define STAP_SDT_V2 everywhere [danpb]
> ---
>  configure         | 1 +
>  trace/meson.build | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


