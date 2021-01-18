Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EABF22FA5E1
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 17:18:32 +0100 (CET)
Received: from localhost ([::1]:57792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1XEe-00079e-0T
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 11:18:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1XCs-0006cp-9s
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:16:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1XCp-0004Vm-V6
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:16:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610986599;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=iULOiin4DUw0xul5jhHjuCP4Aj3Ua3qIeFQDhv2xmtI=;
 b=c+qAcinhcyBIrPQqHBm2ajZ01NAudseOajluMhdhdz+i8I+SwaFw3YS/hQI44plO+p9O/A
 elYAQN6VOoatglxNZyZR+QHXS2Z1lzY9dT8FgFMqjqABoz+s2+NFqoH1Cd3uYt5RC64chp
 CCq96A2FHTEahtnFyCgYxOb+Xcy6Ex8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-gLrtFWVQOnODoZdpTXZEEg-1; Mon, 18 Jan 2021 11:16:34 -0500
X-MC-Unique: gLrtFWVQOnODoZdpTXZEEg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D7EE10054FF;
 Mon, 18 Jan 2021 16:16:33 +0000 (UTC)
Received: from redhat.com (ovpn-116-34.ams2.redhat.com [10.36.116.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C54325D705;
 Mon, 18 Jan 2021 16:16:28 +0000 (UTC)
Date: Mon, 18 Jan 2021 16:16:25 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 2/2] vnc: add qmp to support reload vnc tls certificates
Message-ID: <20210118161625.GE1799018@redhat.com>
References: <20210107143032.752-1-changzihao1@huawei.com>
 <20210107143032.752-3-changzihao1@huawei.com>
 <87turil3s2.fsf@dusky.pond.sub.org>
 <20210115134710.GH1692978@redhat.com>
 <20210118161316.yptquytrr23yv4bs@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210118161316.yptquytrr23yv4bs@sirius.home.kraxel.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
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
Cc: oscar.zhangbo@huawei.com, Zihao Chang <changzihao1@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, xiexiangyou@huawei.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 18, 2021 at 05:13:16PM +0100, Gerd Hoffmann wrote:
>   Hi,
> 
> > Or we could have a more generic  "display-reload" command, which has
> > fields indicating what aspect to reload. eg a 'tls-certs: bool' field
> > to indicate reload of TLS certs in the display. This could be useful
> > if we wanted the ability to reload authz access control lists, though
> > we did actually wire them up to auto-reload using inotify.
> 
> Maybe we should just use inotify-based reload for the certs too?

The authz access control is easy because it is just one file.

When updating the certs though, we have 1-4 files that need loading, and
they can only be reloaded once all of them are updated on disk. This gives
a synchronization challenge for use of inotify, as when we see 1 updated,
we don't know if we need to wait for the others to be updated or not.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


