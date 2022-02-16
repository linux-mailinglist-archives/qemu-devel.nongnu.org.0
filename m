Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 878A84B90E3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 20:03:59 +0100 (CET)
Received: from localhost ([::1]:46222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKPao-0004Re-BQ
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 14:03:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKPZ3-0002zS-Vr
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 14:02:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKPYz-0006fU-Fs
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 14:02:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645038124;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RGXbtbqkzZwG2Su+iNNn5QouLd2U4JdBFZDmW1FJKj8=;
 b=XDrRg3r5NS6JFwsdeUoCBwpaLFzO68fDWxYOz8J6VnBjzx+AjEdwfGwZagQIezv+cN8C2p
 n3rjsnqz1yvFvokgPdkGzFd4OrXG+Cs/uXkW9+k9hAYHQcsv4wuWiLwBvbutPG1xR57bvx
 Y79l7MGdXw39c5aKkqcYnUlHKmlVLyU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-FHeWwGEiPmm6ZBuEQLBL8Q-1; Wed, 16 Feb 2022 14:02:01 -0500
X-MC-Unique: FHeWwGEiPmm6ZBuEQLBL8Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4141F189DF42;
 Wed, 16 Feb 2022 19:02:00 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3114C5D9D5;
 Wed, 16 Feb 2022 19:01:52 +0000 (UTC)
Date: Wed, 16 Feb 2022 19:01:50 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH v2] docs: Add measurement calculation details to
 amd-memory-encryption.txt
Message-ID: <Yg1KHmZ2PgUqNmIh@redhat.com>
References: <20211220104224.143961-1-dovmurik@linux.ibm.com>
 <YdSLJG3GRSf88G11@redhat.com>
 <96450f57-c01e-55a9-2700-8e4e8e36b14b@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <96450f57-c01e-55a9-2700-8e4e8e36b14b@linux.ibm.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Brijesh Singh <brijesh.singh@amd.com>, James Bottomley <jejb@linux.ibm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 08:52:21AM +0200, Dov Murik wrote:
> 
> 
> On 04/01/2022 20:00, Daniel P. Berrangé wrote:
> > On Mon, Dec 20, 2021 at 10:42:24AM +0000, Dov Murik wrote:
> >> Add a section explaining how the Guest Owner should calculate the
> >> expected guest launch measurement for SEV and SEV-ES.
> >>
> >> Also update the name and link to the SEV API Spec document.
> >>
> >> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> >> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> >>
> >> ---
> >>
> >> v2:
> >> - Explain that firmware must be built without NVRAM store.
> >> ---
> >>  docs/amd-memory-encryption.txt | 52 +++++++++++++++++++++++++++++++---
> >>  1 file changed, 48 insertions(+), 4 deletions(-)
> > 
> > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> > 
> 
> Paolo,
> 
> Can you please add this to your queue?
> 
> Original patch v2:
> https://lore.kernel.org/qemu-devel/20211220104224.143961-1-dovmurik@linux.ibm.com/

Could you re-send this patch. The file has been moved, which git
tracked fine, but its also converted to rst format, and so needs
some content tweaks for linking to the external URLs properly.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


