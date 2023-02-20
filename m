Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31FD69C7F8
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:51:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2oC-0006CK-HE; Mon, 20 Feb 2023 04:50:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pU2oA-0006Bw-A8
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:50:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pU2o8-0004Yj-KC
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:50:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676886603;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=vPg5LR3AyjS0Faiu6uZMJhCV07Gocn52Ws++uwCHDaY=;
 b=JrXL3iOu2OvmBXRye04/nW/bnk0UUNwcXRBEO2+C/+d84oS7Gmf3QrJdVRcVuYggcpy72K
 YI50yAGBdjz1nQf+7qNX3cAqFLrqJXjk2aKrpqZvBJowg4zS8ogeklykkanGsZzBspGieg
 oYWdASOMsetL2UvQ2RLvEfUBjLpmzvk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-m-Ryaz0eOceTGHIUZpAY0Q-1; Mon, 20 Feb 2023 04:49:59 -0500
X-MC-Unique: m-Ryaz0eOceTGHIUZpAY0Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62122800B24;
 Mon, 20 Feb 2023 09:49:59 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DCBC440C83B6;
 Mon, 20 Feb 2023 09:49:56 +0000 (UTC)
Date: Mon, 20 Feb 2023 09:49:54 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrew Melnychenko <andrew@daynix.com>
Cc: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, thuth@redhat.com, philmd@linaro.org,
 armbru@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 toke@redhat.com, mprivozn@redhat.com, yuri.benditovich@daynix.com,
 yan@daynix.com
Subject: Re: [PATCH 3/5] qmp: Added the helper stamp check.
Message-ID: <Y/NCQhGmqIadlw0y@redhat.com>
References: <20230219162100.174318-1-andrew@daynix.com>
 <20230219162100.174318-4-andrew@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230219162100.174318-4-andrew@daynix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Sun, Feb 19, 2023 at 06:20:58PM +0200, Andrew Melnychenko wrote:
> Added a function to check the stamp in the helper.
> eBPF helper should have a special symbol that generates during the build.
> QEMU checks the helper and determines that it fits, so the helper
> will produce proper output.

I think this is quite limiting for in place upgrades.

Consider this scenario

 * Host has QEMU 8.1.0 installed
 * VM is running QEMU 8.1.0
 * QEMU 8.1.1 is released with a bug fix in the EBF program
 * Host is upgraded to QEMU 8.1.1
 * User attempts to hotplug a NIC to the running VM

IIUC this last step is going to fail because we'll be loading
the EBF program from 8.1.1 and so its hash is different from
that expected by the QEMU 8.1.0 that the pre-existing VM is
running.

If some changes to the EBF program are not going to be back
compatible from the POV of the QEMU process, should we instead
be versioning the EBF program. eg so new QEMU will ship both
the old and new versions of the EBF program. 


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


