Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BB141B479
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 18:53:29 +0200 (CEST)
Received: from localhost ([::1]:48120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVGMC-0000IW-Ko
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 12:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVGHI-0002uc-6k
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 12:48:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVGHG-0007z3-Mn
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 12:48:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632847701;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TcecuRLiuVeZmBGApm6ExWJ/Wg/CQHRJiYKNz/Fh+c8=;
 b=MmWKiAjRUUoCtKKki40HiKUkXOlmgMpxMQk/hAbofacpe736zIlpww8TXEe3uZZt7P8CZ8
 WHF4HyBttNXQgLHqCH1dmfSWaLh8yRV8aHdJ8I6XwNiSH4/C/41wxkjElhQTXlVMII2cDV
 C2fmS9PGsGjCCPv68Hmyhmvy4ENzOQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-5S_6Wls_NwKplC7bJhaUyg-1; Tue, 28 Sep 2021 12:48:20 -0400
X-MC-Unique: 5S_6Wls_NwKplC7bJhaUyg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C478835DE2;
 Tue, 28 Sep 2021 16:48:19 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D347818EF2;
 Tue, 28 Sep 2021 16:48:01 +0000 (UTC)
Date: Tue, 28 Sep 2021 17:47:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 4/7] util/oslib-posix: Don't create too many threads
 with small memory or little pages
Message-ID: <YVNHPv7aJcs5W0z4@redhat.com>
References: <20210816094739.21970-1-david@redhat.com>
 <20210816094739.21970-5-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210816094739.21970-5-david@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Pankaj Gupta <pankaj.gupta@ionos.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 16, 2021 at 11:47:36AM +0200, David Hildenbrand wrote:
> Let's limit the number of threads to something sane, especially that
> - We don't have more threads than the number of pages we have
> - We don't have threads that initialize small (< 64 MiB) memory
> 
> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  util/oslib-posix.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


