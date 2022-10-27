Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B581060F5C5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 12:53:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo0U0-0002rP-J0; Thu, 27 Oct 2022 06:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo0TQ-0001Qx-RX
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:51:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo0TF-0003gP-5I
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:50:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666867843;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RiwFZIxcp4n8FIaBW5NfY39n7DjfHpcdFfKdAQ3ZGdg=;
 b=HepUg0CAc7w5FvH1G5GYPNNNBbi1w1moC6gMPttRn/Ot7kWeGDaIprWrEB1FgCKHhohszT
 JaJ+RSLembYZAkQ8e2/f5n2CWVYXWOqdjJx2wvyiMFQ0r2pcqGXyZWq56WMJOxXV1CCGPE
 6w0nz56v4f6KsomG0WeVX5i7Kh+07Gw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-rzZtZUYGOBezmO-9p_N_nQ-1; Thu, 27 Oct 2022 06:50:39 -0400
X-MC-Unique: rzZtZUYGOBezmO-9p_N_nQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8380429DD9B6;
 Thu, 27 Oct 2022 10:50:28 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.167])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06F60492B07;
 Thu, 27 Oct 2022 10:50:17 +0000 (UTC)
Date: Thu, 27 Oct 2022 11:50:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 3/4] meson: enforce a minimum Linux kernel headers
 version >= 4.18
Message-ID: <Y1piYEhi4/GOs8q9@redhat.com>
References: <20221004093206.652431-1-berrange@redhat.com>
 <20221004093206.652431-4-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221004093206.652431-4-berrange@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Oct 04, 2022 at 10:32:05AM +0100, Daniel P. Berrangé wrote:
> Various areas of QEMU have a dependency on Linux kernel header
> definitions. This falls under the scope of our supported platforms
> matrix, but historically we've not checked for a minimum kernel
> headers version. This has made it unclear when we can drop support
> for older kernel headers.
> 
>   * Alpine 3.14: 5.10
>   * CentOS 8: 4.18
>   * CentOS 9: 5.14
>   * Debian 10: 4.19
>   * Debian 11: 5.10
>   * Fedora 35: 5.19
>   * Fedora 36: 5.19
>   * OpenSUSE 15.3: 5.3.0
>   * Ubuntu 20.04: 5.4
>   * Ubuntu 22.04: 5.15
> 
> The above ignores the 3rd version digit since distros update their
> packages periodically and such updates don't generally affect public
> APIs to the extent that it matters for our build time check.
> 
> Overall, we can set the baseline to 4.18 currently.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  meson.build | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Since there's no agreement, I'll just consider this patch discarded,
along with the next one. I won't repost since Laurent has already
queued the first two patches.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


