Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 969083CFCA7
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 16:51:42 +0200 (CEST)
Received: from localhost ([::1]:49724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5r5x-00037p-Jg
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 10:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5r0G-0007ue-Ui
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:45:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5r0D-0000EB-Hx
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:45:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626792344;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=cB1H+EzoY5XhR6toHgDhxUcQksYJMODauCOg6ChWGHs=;
 b=Yr3XHGaSfcUYIxVqWDiM3iT+wox6Jm1SVflVBJC6kqAT1CDIbFaaKzpkOgsSyp+7Ke88Hz
 fpsa87sGUWlOm3yfJETOXRbZf/xdUDutiysqhuXCXPUdhiHsaO4PtKFw3u0axBtxL/gPX2
 KDYAzlUJD+v9SJEncxMgfQ+nT/hBRuE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-N3AoILlMN4OF3NM-RWgtDA-1; Tue, 20 Jul 2021 10:45:40 -0400
X-MC-Unique: N3AoILlMN4OF3NM-RWgtDA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FF4380430C;
 Tue, 20 Jul 2021 14:45:39 +0000 (UTC)
Received: from redhat.com (ovpn-113-31.ams2.redhat.com [10.36.113.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 287865D6A1;
 Tue, 20 Jul 2021 14:45:29 +0000 (UTC)
Date: Tue, 20 Jul 2021 15:45:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 0/3] util/oslib-posix: Support MADV_POPULATE_WRITE for
 os_mem_prealloc()
Message-ID: <YPbhhj1mbwFtdc4z@redhat.com>
References: <20210714112306.67793-1-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210714112306.67793-1-david@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.474, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 14, 2021 at 01:23:03PM +0200, David Hildenbrand wrote:
> #1 adds support for MADV_POPULATE_WRITE, #2 cleans up the code to avoid
> global variables and prepare for concurrency and #3 makes os_mem_prealloc()
> safe to be called from multiple threads concurrently.
> 
> Details regarding MADV_POPULATE_WRITE can be found in introducing upstream
> Linux commit 4ca9b3859dac ("mm/madvise: introduce
> MADV_POPULATE_(READ|WRITE) to prefault page tables") and in the latest man
> page patch [1].

Looking at that commit message, I see your caveat about POPULATE_WRITE
used together with shared file mappings, causing an undesirable glut
of dirty pages that needs to be flushed back to the underlying storage.

Is this something we need to be concerned with for the hostmem-file.c
implementation ? While it is mostly used to point to files on tmpfs
or hugetlbfs, I think users do something point it to a plain file
on a normal filesystem.  So will we need to optimize to use the
fallocate+POPULATE_READ combination at some point ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


