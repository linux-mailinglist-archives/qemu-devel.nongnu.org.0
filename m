Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF45040D884
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 13:28:22 +0200 (CEST)
Received: from localhost ([::1]:40684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQpYz-0002J4-De
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 07:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQpXX-0001bB-HH
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 07:26:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQpXS-0004By-5D
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 07:26:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631791604;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TJIYNHPBKEEX1gGiT7Ba710sQDYKequHEkix9oAg9VQ=;
 b=TN9HQS9tyYtUQzGIFnxBtV7Y5QdnzVukwEm5BJTM+6Gbsgt5OBJjF5ZR83MIe5zwgOOhdz
 ON4zdyq+sStAmbf/AwvrNrHpTG/VTBWY3De0ZbcsHN9BbZgpSwfj+tmDmUWqy5eXzuOT1M
 Gut9Ci4UYUekXVizG1rm1biTQrDJIIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-YiB-wxOJNLKJE3K6PirKRg-1; Thu, 16 Sep 2021 07:26:38 -0400
X-MC-Unique: YiB-wxOJNLKJE3K6PirKRg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BECE1802C91;
 Thu, 16 Sep 2021 11:26:37 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 380097A5C5;
 Thu, 16 Sep 2021 11:26:36 +0000 (UTC)
Date: Thu, 16 Sep 2021 12:26:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] monitor: Tidy up find_device_state()
Message-ID: <YUMp6c7Wt1W1QAfJ@redhat.com>
References: <20210916111707.84999-1-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210916111707.84999-1-armbru@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, imammedo@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 16, 2021 at 01:17:07PM +0200, Markus Armbruster wrote:
> Commit 6287d827d4 "monitor: allow device_del to accept QOM paths"
> extended find_device_state() to accept QOM paths in addition to qdev
> IDs.  This added a checked conversion to TYPE_DEVICE at the end, which
> duplicates the check done for the qdev ID case earlier, except it sets
> a *different* error: GenericError "ID is not a hotpluggable device"
> when passed a QOM path, and DeviceNotFound "Device 'ID' not found"
> when passed a qdev ID.  Fortunately, the latter won't happen as long
> as we add only devices to /machine/peripheral/.
> 
> Earlier, commit b6cc36abb2 "qdev: device_del: Search for to be
> unplugged device in 'peripheral' container" rewrote the lookup by qdev
> ID to use QOM instead of qdev_find_recursive(), so it can handle
> buss-less devices.  It does so by constructing an absolute QOM path.
> Works, but object_resolve_path_component() is easier.  Switching to it
> also gets rid of the unclean duplication described above.
> 
> While there, avoid converting to TYPE_DEVICE twice, first to check
> whether it's possible, and then for real.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  softmmu/qdev-monitor.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


