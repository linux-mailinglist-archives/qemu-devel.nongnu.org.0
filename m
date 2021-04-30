Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D37B636F73E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 10:39:51 +0200 (CEST)
Received: from localhost ([::1]:59940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcOgg-0002LV-VA
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 04:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lcOas-0005Ts-0Z
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:33:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lcOan-0006d7-7t
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:33:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619771624;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/yJ8wFAyrSdoCQrKo+Bu5pp5R9TQbyjO7vQpiyXupA8=;
 b=XGsLqRrBwyD4i4y2bnK3EVNEFbpRfNIA7G4n+l0/z/TGw9EzmEZ/YGJwDDOMhKTSbtw2nW
 23PJzzqQRn82FtWk0Rz43u9Vj13A7aqpoq2B+1O177rDNhjSSgpv+LdPzF7Im/KluWhRwI
 fPsjakWpDaW3DvQcylWnqzsDhgjg1tA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-csQRZ8sXNMuN1WOwh04Xyw-1; Fri, 30 Apr 2021 04:33:39 -0400
X-MC-Unique: csQRZ8sXNMuN1WOwh04Xyw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B08D8049C5;
 Fri, 30 Apr 2021 08:33:38 +0000 (UTC)
Received: from redhat.com (ovpn-113-103.ams2.redhat.com [10.36.113.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DD695D9C6;
 Fri, 30 Apr 2021 08:33:35 +0000 (UTC)
Date: Fri, 30 Apr 2021 09:33:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v1] tests/migration: introduce multifd into guestperf
Message-ID: <YIvA3bfScp8yQwjB@redhat.com>
References: <cover.1616171924.git.huangy81@chinatelecom.cn>
 <cfeeb04d17ad932c42a9871294058b77429ad1b7.1616171924.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <cfeeb04d17ad932c42a9871294058b77429ad1b7.1616171924.git.huangy81@chinatelecom.cn>
User-Agent: Mutt/2.0.6 (2021-03-06)
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Mar 20, 2021 at 01:04:56AM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman <huangy81@chinatelecom.cn>
> 
> Guestperf tool does not cover the multifd-enabled migration
> currently, it is worth supporting so that developers can
> analysis the migration performance with all kinds of
> migration.
> 
> To request that multifd is enabled, with 4 channels:
> $ ./tests/migration/guestperf.py \
>     --multifd --multifd-channels 4 --output output.json
> 
> To run the entire standardized set of multifd-enabled
> comparisons, with unix migration:
> $ ./tests/migration/guestperf-batch.py \
>     --dst-host localhost --transport unix \
>     --filter compr-multifd* --output outputdir
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>  tests/migration/guestperf/comparison.py | 14 ++++++++++++++
>  tests/migration/guestperf/engine.py     | 16 ++++++++++++++++
>  tests/migration/guestperf/scenario.py   | 12 ++++++++++--
>  tests/migration/guestperf/shell.py      | 10 +++++++++-
>  4 files changed, 49 insertions(+), 3 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

I'll queue it, sorry for the delay in responding to this.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


