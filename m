Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1332D36F9D5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:16:14 +0200 (CEST)
Received: from localhost ([::1]:48584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcS44-0003SC-Dr
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lcRDz-00045U-Ik
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:22:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lcRDw-0002K1-GY
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:22:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619781738;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ii8nIOMP7A/qXnSDg2d18vxoPMnaig4Jt9j1kWwpPDs=;
 b=Q+TbbMFkCb1a9GH8B+j4OjwLII2BwxoYp0FsqKmmxPlxgcEbhTigRLVCf3c4RPjEVireTV
 vZhwvEy86klqRpZdL+s3NgfMNwshuQudBiQArL+9bB/Y0e9qbFk49+yefHuLZK2ujYrEBm
 zTkcJ1xdRlORTsTCz36i/Cvp7C7DehE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-a-I01mhqMCqjorxx9KbQ7g-1; Fri, 30 Apr 2021 07:22:14 -0400
X-MC-Unique: a-I01mhqMCqjorxx9KbQ7g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 450146D246
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 11:22:13 +0000 (UTC)
Received: from redhat.com (ovpn-113-103.ams2.redhat.com [10.36.113.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 955BD51150;
 Fri, 30 Apr 2021 11:22:01 +0000 (UTC)
Date: Fri, 30 Apr 2021 12:21:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] ui: Fix memory leak in qemu_xkeymap_mapping_table()
Message-ID: <YIvoVmIdDWO9VgLa@redhat.com>
References: <20210430101707.245126-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210430101707.245126-1-philmd@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 30, 2021 at 12:17:06PM +0200, Philippe Mathieu-Daudé wrote:
> Refactor qemu_xkeymap_mapping_table() to have a single exit point,
> so we can easily free the memory allocated by XGetAtomName(),
> 
> This fixes when running a binary configured with --enable-sanitizers:
> 
>   Direct leak of 22 byte(s) in 1 object(s) allocated from:
>       #0 0x561344a7473f in malloc (qemu-system-x86_64+0x1dab73f)
>       #1 0x7fa4d9dc08aa in XGetAtomName (/lib64/libX11.so.6+0x2a8aa)
> 
> Fixes: 2ec78706d18 ("ui: convert GTK and SDL1 frontends to keycodemapdb")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  ui/x_keymap.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


