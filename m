Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 811FF4745C8
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 16:01:46 +0100 (CET)
Received: from localhost ([::1]:43802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx9JJ-0008Hj-BO
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 10:01:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mx9E0-0000tg-Kc
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 09:56:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mx9Dz-0000oA-04
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 09:56:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639493774;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/k2XXXkD9eeK8vCkxzP+pe2vcQ9yVuR+zW4tZricmEg=;
 b=J94QD4F+17ioNHekspUWkA0fV7p+PXESgtVcXehJ50CuSpDMp04V+ZW7xasiEUrPx7IPic
 eupDq+KWGSTp366EgI+CmzRQB2Hf/Pg/b0LHKa0NWMvmb4HF4QPrQL4/V3oGMtvFWcacRe
 +1NhS3qk2Y9ER9mSEnX0T8ioYI+H6GA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-TVtk7PFJMdSLbZ1cDKmZXQ-1; Tue, 14 Dec 2021 09:56:11 -0500
X-MC-Unique: TVtk7PFJMdSLbZ1cDKmZXQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDE4064143;
 Tue, 14 Dec 2021 14:56:09 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.122])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 150F17B6C8;
 Tue, 14 Dec 2021 14:56:07 +0000 (UTC)
Date: Tue, 14 Dec 2021 14:56:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Mark Burton <mark.burton@greensocs.com>
Subject: Re: Redesign of QEMU startup & initial configuration
Message-ID: <Ybiwhfbs+j7RzNrj@redhat.com>
References: <87ilvszg52.fsf@dusky.pond.sub.org>
 <edbfff5c-65df-980c-acee-05055c254636@redhat.com>
 <YbeJ/zTV/n+l2CmH@redhat.com>
 <9AF99888-A4BF-4459-92C1-71E5B76A2C79@greensocs.com>
 <YbiWh8nQDWpMegER@redhat.com>
 <4AED38B2-E2DD-46F7-93AA-622D5F6BB570@greensocs.com>
 <YbiaYnPTUZ70hC1j@redhat.com>
 <E52F9A8B-A66C-4E54-8F74-F4F45E3FD7A8@greensocs.com>
 <Ybigt8LMt20L1AqS@redhat.com>
 <B3F81D50-DB24-40EE-BB36-F17FCC3394F0@greensocs.com>
MIME-Version: 1.0
In-Reply-To: <B3F81D50-DB24-40EE-BB36-F17FCC3394F0@greensocs.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 14, 2021 at 03:42:52PM +0100, Mark Burton wrote:
> I think we’re talking at cross purposes, and probably we agree (not sure). I’ll top quote to try and explain my point of view.
> 
> I think there are two discussions being mixed:
> 1/ A discussion about improving the CLI. (Having a new one, etc etc)
> 2/ A discussion about supporting a low level, and complete, API that can be used by “management layers” (QAPI).
> 
> I think this also gets mixed up with the discussion on migrating the CLI to use the low level API.
> 
> I want to focus on the low level API. 
> 
> I dont see why we’re discussing a ‘high level’ thing when, for now, we have to support the CLI, and we have work to do on QAPI.

We're discussing both because we're setting out what our end goal is
to be, and that end goal should be expected to cover both use cases.

> If somebody wants to build a new CLI, with a new ‘high level’
> interface, using QAPI - let them!

This is too weak of a statement, as it implies that a replacement
high level interface is optional and not important for the overall
project. I don't believe that to be the case, so I'm saying that
our design & impl plan has to demonstrate how we intend to cover
both deliverables or use cases. We can't simply ignore the high
level API saying it is someone else's problem to worry about.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


