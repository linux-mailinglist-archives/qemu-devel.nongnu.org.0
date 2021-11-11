Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A06CA44D41D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 10:32:39 +0100 (CET)
Received: from localhost ([::1]:60970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml6Ri-0000IU-7w
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 04:32:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ml6O3-0003Gv-C4
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:28:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ml6O1-0004tl-7L
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:28:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636622928;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hP/0heKW44iIV6GtQyLatgJwro1aVyW0suWu9IBqe0Y=;
 b=KlsSf4M8aQHai+WBs1bPHTKP0ol97LHrHRBePWhjgfZkiCitzjaSwSjO8sTQyzzfDioI5q
 EzYmyPQhOcG01LK9kLqsWRiUepMOP8I82KDfxDZqeacQyeGburjnTj3u6WU5C8qjFhzeUy
 di64w0fDy0ccpLsZqfdbVTxPdEq54fM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-P-Rijl4mNkamD2Oj9Gedig-1; Thu, 11 Nov 2021 04:28:45 -0500
X-MC-Unique: P-Rijl4mNkamD2Oj9Gedig-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FCA015721;
 Thu, 11 Nov 2021 09:28:43 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCCAB60854;
 Thu, 11 Nov 2021 09:28:40 +0000 (UTC)
Date: Thu, 11 Nov 2021 09:28:38 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH v2 2/6] target/i386/sev: Add kernel hashes only if
 sev-guest.kernel-hashes=on
Message-ID: <YYziRjsZMt1qPmJG@redhat.com>
References: <20211108134840.2757206-1-dovmurik@linux.ibm.com>
 <20211108134840.2757206-3-dovmurik@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20211108134840.2757206-3-dovmurik@linux.ibm.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Eric Blake <eblake@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 08, 2021 at 01:48:36PM +0000, Dov Murik wrote:
> Commit cff03145ed3c ("sev/i386: Introduce sev_add_kernel_loader_hashes
> for measured linux boot", 2021-09-30) introduced measured direct boot
> with -kernel, using an OVMF-designated hashes table which QEMU fills.
> 
> However, if OVMF doesn't designate such an area, QEMU would completely
> abort the VM launch.  This breaks launching with -kernel using older
> OVMF images which don't publish the SEV_HASH_TABLE_RV_GUID.
> 
> Fix that so QEMU will only look for the hashes table if the sev-guest
> kernel-hashes option is set to on.  Otherwise, QEMU won't look for the
> designated area in OVMF and won't fill that area.
> 
> To enable addition of kernel hashes, launch the guest with:
> 
>     -object sev-guest,...,kernel-hashes=on
> 
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>  target/i386/sev.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


