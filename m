Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A413E204D00
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 10:52:25 +0200 (CEST)
Received: from localhost ([::1]:38842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnefD-00042l-NK
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 04:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jneds-000366-IP
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 04:50:56 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:22600
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jnedq-0001Ts-O8
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 04:50:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592902253;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x3Msg3bGzhtYhIbPEVjox/TBTNZDAKxitZxU1iOCddM=;
 b=PyXoilo9hfD66RBqTlVq0y4B841x5i9As604q2j723SM/4/Gw3xPYUlEL9oH+X/NCWKFfu
 zfiod6Y3Qm71WxmrdvKkV3KgQ4imY0/F/LLfOmOmpN57lV2VxJi5zCvZnNfY4awyaNExOt
 inoOgU3N2oj4T63P7pBVpMcjXCbpDhY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-8v08k-NTPPi3tWVpo4gtDw-1; Tue, 23 Jun 2020 04:50:51 -0400
X-MC-Unique: 8v08k-NTPPi3tWVpo4gtDw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C29318031CB;
 Tue, 23 Jun 2020 08:50:50 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63A6A5BAEC;
 Tue, 23 Jun 2020 08:50:47 +0000 (UTC)
Date: Tue, 23 Jun 2020 09:50:43 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3 2/2] qga: Use qemu_get_host_name() instead of
 g_get_host_name()
Message-ID: <20200623085043.GD751477@redhat.com>
References: <cover.1592849834.git.mprivozn@redhat.com>
 <873fc5052847ee5df75a75e30960d6d4ab44473b.1592849834.git.mprivozn@redhat.com>
MIME-Version: 1.0
In-Reply-To: <873fc5052847ee5df75a75e30960d6d4ab44473b.1592849834.git.mprivozn@redhat.com>
User-Agent: Mutt/1.14.0 (2020-05-02)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 01:55:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: vfeenstr@redhat.com, sw@weilnetz.de, mdroth@linux.vnet.ibm.com,
 qemu-devel@nongnu.org, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 22, 2020 at 08:19:36PM +0200, Michal Privoznik wrote:
> Problem with g_get_host_name() is that on the first call it saves
> the hostname into a global variable and from then on, every
> subsequent call returns the saved hostname. Even if the hostname
> changes. This doesn't play nicely with guest agent, because if
> the hostname is acquired before the guest is set up (e.g. on the
> first boot, or before DHCP) we will report old, invalid hostname.
> 
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1845127
> 
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> ---
>  qga/commands.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


