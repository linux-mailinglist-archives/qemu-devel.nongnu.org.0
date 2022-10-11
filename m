Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8D15FAF9E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 11:48:34 +0200 (CEST)
Received: from localhost ([::1]:55312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiBsH-0006P1-1M
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 05:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oiBc1-0003m1-S9
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 05:31:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oiBbu-0000PC-1p
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 05:31:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665480693;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CNCB7KDSuUZQrVcFgSeMF8WnGI4rbjTEy65g1B4Bc3U=;
 b=hSoBaJX9reUkrMHgDBaO2zcWdARufSCLXxRtmIlpA01WJMC+JFfmFOsNjTHjThQkA2mLrE
 GesT11jyVz1dWSAx89PB/Zn7jAU9cNrrajCyDw5Bm+31jHgMklvwSv7yDrWQ1B1lAG4nPK
 gjqkk+od/JYpEzISQFBCOQ+j4MPiqHc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-NXklHd4RP3WCNDF_Nw-akw-1; Tue, 11 Oct 2022 05:31:29 -0400
X-MC-Unique: NXklHd4RP3WCNDF_Nw-akw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 385C03814942;
 Tue, 11 Oct 2022 09:31:29 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 366E3207B372;
 Tue, 11 Oct 2022 09:31:27 +0000 (UTC)
Date: Tue, 11 Oct 2022 10:31:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Lei He <helei.sig11@bytedance.com>
Cc: arei.gonglei@huawei.com, mst@redhat.com, pizhenwei@bytedance.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/4] crypto: Support DER encodings
Message-ID: <Y0U37bV0H4cFji2b@redhat.com>
References: <20221008085030.70212-1-helei.sig11@bytedance.com>
 <20221008085030.70212-3-helei.sig11@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221008085030.70212-3-helei.sig11@bytedance.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Oct 08, 2022 at 04:50:28PM +0800, Lei He wrote:
> Add encoding interfaces for DER encoding:
> 1. support decoding of 'bit string', 'octet string', 'object id'
> and 'context specific tag' for DER encoder.
> 2. implemented a simple DER encoder.
> 3. add more testsuits for DER encoder.
> 
> Signed-off-by: lei he <helei.sig11@bytedance.com>
> ---
>  crypto/der.c                 | 307 +++++++++++++++++++++++++++++++++++++++----
>  crypto/der.h                 | 211 ++++++++++++++++++++++++++++-
>  tests/unit/test-crypto-der.c | 126 ++++++++++++++----
>  3 files changed, 597 insertions(+), 47 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


