Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B87856167F
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 11:38:10 +0200 (CEST)
Received: from localhost ([::1]:46418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6qcj-0003pX-2t
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 05:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6qa3-0002Hp-Sm
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 05:35:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6qa1-0001vZ-5X
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 05:35:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656581719;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NbCKlDHYIw2HeeKgoLrEkKgciegz6A0V5DGX5fRqfHw=;
 b=i1EsbLlMlpjnvjbAUAMHP7sNkZgRmXNk2wWA8INymh3VN85W8ZgRYBVfRyusPMyp2YvQwW
 6Zv4+kC4r2GZNijskukfUoRisAA5H108EuanPdklk/MZ207JJK6QVrgxVnL0rGJS2xdbaH
 ko2G7b9H0lMifEqNCcVlYMayaspcA3w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-l9YwEzp2MLmhLptoMEmh8w-1; Thu, 30 Jun 2022 05:35:16 -0400
X-MC-Unique: l9YwEzp2MLmhLptoMEmh8w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D307E811E75;
 Thu, 30 Jun 2022 09:35:15 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CC302166B26;
 Thu, 30 Jun 2022 09:35:13 +0000 (UTC)
Date: Thu, 30 Jun 2022 10:35:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Lei He <helei.sig11@bytedance.com>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mst@redhat.com,
 pizhenwei@bytedance.com, jasowang@redhat.com
Subject: Re: [PATCH v2 4/7] crypto: Add ECDSA key parser
Message-ID: <Yr1uTwpFw9LVTG73@redhat.com>
References: <20220622091549.31115-1-helei.sig11@bytedance.com>
 <20220622091549.31115-5-helei.sig11@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220622091549.31115-5-helei.sig11@bytedance.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 22, 2022 at 05:15:46PM +0800, Lei He wrote:
> Add ECDSA key parser and ECDSA signature parser.
> 
> Signed-off-by: lei he <helei.sig11@bytedance.com>
> ---
>  crypto/ecdsakey-builtin.c.inc | 248 ++++++++++++++++++++++++++++++++++++++++++
>  crypto/ecdsakey.c             | 118 ++++++++++++++++++++
>  crypto/ecdsakey.h             |  66 +++++++++++
>  crypto/meson.build            |   1 +
>  4 files changed, 433 insertions(+)
>  create mode 100644 crypto/ecdsakey-builtin.c.inc
>  create mode 100644 crypto/ecdsakey.c
>  create mode 100644 crypto/ecdsakey.h

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


