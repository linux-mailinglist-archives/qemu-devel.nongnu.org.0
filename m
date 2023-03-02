Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E42A6A8174
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:45:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhMj-0006q8-EW; Thu, 02 Mar 2023 06:44:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXhMh-0006hs-Ij
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:44:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXhMf-0007OH-Ou
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:44:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677757488;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=1gonYYi6CRfagDfvlY6RaQmIY4s43Tf77j4YoBKfhBI=;
 b=RgMFcCuMMJqEQdP4ImVMa84IOBnFR7QOhZWSgBsnWlhygkwKCZTiH6XAcyayvkDLGW5D1N
 QyBXxbMQ7ext+OXTr3m+C5AuyRLfYdSw35gYeWNGTaIAz8GxI1wd7eIYcDyO7/nb6iPa6K
 wV7H+t7UFtvzLVs+S7jTws/6TPAzN8s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-odCc8IRVP8y3XsFp2McCDQ-1; Thu, 02 Mar 2023 06:44:45 -0500
X-MC-Unique: odCc8IRVP8y3XsFp2McCDQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39FD5800050;
 Thu,  2 Mar 2023 11:44:45 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C84262026D4B;
 Thu,  2 Mar 2023 11:44:42 +0000 (UTC)
Date: Thu, 2 Mar 2023 11:44:40 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Fam Zheng <fam.zheng@bytedance.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 fam@euphon.net, Igor Mammedov <imammedo@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 stefanha@redhat.com
Subject: Re: [PATCH] hostmem: Add clear option to file backend
Message-ID: <ZACMKL5MOeD59OLl@redhat.com>
References: <20230302110925.4680-1-fam.zheng@bytedance.com>
 <377c3521-ffe1-074b-48ac-71fd445b3bb4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <377c3521-ffe1-074b-48ac-71fd445b3bb4@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

On Thu, Mar 02, 2023 at 12:31:46PM +0100, David Hildenbrand wrote:
> On 02.03.23 12:09, Fam Zheng wrote:
> > This adds a memset to clear the backing memory. This is useful in the
> > case of PMEM DAX to drop dirty data, if the backing memory is handed
> > over from a previous application or firmware which didn't clean up
> > before exiting.
> > 
> 
> Why can't the VM manager do that instead? If you have a file that's
> certainly easily possible.

This feels conceptually similar to the case where you expose a host
block device to the guest. If that block device was previously given
to a different guest it might still have data in it. Someone needs
to take responsibility for scrubbing that data. Since that may take
a non-trivial amount of time, it is typically todo that scrubbing in
the background after the old VM is gone rather than put it into the
startup path for a new VM which would delay boot.

PMEM is blurring the boundary between memory and disk, but the tradeoff
is not so different. We know that in general merely faulting in guest
memory is quite time consuming and delays VM startup significantly as
RAM size increases. Doing the full memset can only be slower still.

For prealloc we've create complex code to fault in memory across many
threads and even that's too slow, so we're considering doing it in the
background as the VM starts up.

IIUC, this patch just puts the memset in the critical serialized path.
This will inevitably lead to a demand for improving performance by
parallelizing across threads, but we know that's too slow already,
and we cant play the background async game with memset as that's
actually changunig guest visible contents.

IOW, for large PMEM sizes, it does look compelling to do the clearing
of old data in the background outside context of QEMU VM startup to
avoid delayed startup.

I can still understand the appeal of a simple flag to set on QEMU from
a usability POV, but not sure its a good idea to encourage this usage
by mgmt apps.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


