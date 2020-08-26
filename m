Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D91252B4C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 12:21:08 +0200 (CEST)
Received: from localhost ([::1]:56742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAsYF-0001q3-Om
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 06:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kAsW7-00075Z-Jf
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 06:18:55 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:51021
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kAsW5-0005KD-3l
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 06:18:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598437131;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=O+4LqKJp4YGqyq20Gc6eOMwe4M2AWRd11Xghp0hKT6M=;
 b=J6OeLhCZeRBjdp+qHv4ef/IYt42jvKrr9HJ1LGuI6iA0Qt0BJE4fhbATY89Ed8SnQAiEtE
 tdo8ShKwqdK6R8WtvwxLBRAyVAWltqmKHGnH+b4mCYy0dVp9BKUlZoukaa29sgsmRmP5uy
 vjv90IGqZQUUFLumw9P/MGK2E0QfkiA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-3_HvZx_6N_acQ90tmdTHog-1; Wed, 26 Aug 2020 06:18:40 -0400
X-MC-Unique: 3_HvZx_6N_acQ90tmdTHog-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A11FC81F01D;
 Wed, 26 Aug 2020 10:18:39 +0000 (UTC)
Received: from redhat.com (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B9725D9E4;
 Wed, 26 Aug 2020 10:18:38 +0000 (UTC)
Date: Wed, 26 Aug 2020 11:18:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: AlexChen <alex.chen@huawei.com>
Subject: Re: =?utf-8?Q?oslib-posix=EF=BC=9AFi?= =?utf-8?Q?x?= handle fd leak
 in qemu_write_pidfile()
Message-ID: <20200826101835.GM168515@redhat.com>
References: <5F463618.10000@huawei.com>
MIME-Version: 1.0
In-Reply-To: <5F463618.10000@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 03:16:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
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
Cc: zhengchuan@huawei.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 26, 2020 at 06:14:48PM +0800, AlexChen wrote:
> From: alexchen <alex.chen@huawei.com>
> 
> The fd will leak when (a.st_ino == b.st_ino) is true, fix it.

That is *INTENTIONAL*.  We're holding a lock on the file and the
lock exists only while the FD is open.  When QEMU exists, the FD
is closed and the lock is released. There is no leak.

> Signed-off-by: AlexChen <alex.chen@huawei.com>
> ---
>  util/oslib-posix.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index ad8001a4ad..74cf5e9c73 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -176,6 +176,7 @@ bool qemu_write_pidfile(const char *path, Error **errp)
>          goto fail_unlink;
>      }
> 
> +    close(fd);
>      return true;
> 
>  fail_unlink:
> -- 
> 2.19.1
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


