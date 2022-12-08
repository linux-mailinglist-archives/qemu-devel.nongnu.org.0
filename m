Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC486474EA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 18:17:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3KUy-0001tH-FS; Thu, 08 Dec 2022 12:15:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p3KUw-0001t0-SF
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 12:15:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p3KUv-0001Zu-91
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 12:15:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670519748;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uvTYebSdvyxmUp3MqVcgWyTuc8Rh26NCBhPBb0j9OFI=;
 b=cDPIPuCPwLZg/QlD7O4Br6DyrWa7lIjSGZwVyUeohrhrKdXvMfYHATWLs/KlLP4Z50Ptow
 N2S5gXfkLz20HA7Jr3k/xybbBMXnIP2oyK7pRfss2Y7PC7o1CeXP4m5U1bCwwdsi6kZj2c
 dCNqHtXTapMhO0+mJMSn7bzImghQUkk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-z-QPNAO2NZaUoFR0ZEJRhw-1; Thu, 08 Dec 2022 12:15:43 -0500
X-MC-Unique: z-QPNAO2NZaUoFR0ZEJRhw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D4771C05122;
 Thu,  8 Dec 2022 17:15:43 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A27A8492B04;
 Thu,  8 Dec 2022 17:15:41 +0000 (UTC)
Date: Thu, 8 Dec 2022 17:15:37 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] scripts/archive-source: Use more portable argument with
 tar command
Message-ID: <Y5IbuSk3Pnf4cdHy@redhat.com>
References: <20221208162051.29509-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221208162051.29509-1-philmd@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Dec 08, 2022 at 05:20:51PM +0100, Philippe Mathieu-Daudé wrote:
> When using the archive-source.sh script on Darwin we get:
> 
>   tar: Option --concatenate is not supported
>   Usage:
>     List:    tar -tf <archive-filename>
>     Extract: tar -xf <archive-filename>
>     Create:  tar -cf <archive-filename> [filenames...]
>     Help:    tar --help
> 
> Replace the long argument added by commit 8fc76176f6 ("scripts: use
> git-archive in archive-source") by their short form to keep this
> script functional.

Or install a better tar implementation from brew ?

  https://formulae.brew.sh/formula/gnu-tar


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


