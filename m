Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 948EA246D21
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 18:46:59 +0200 (CEST)
Received: from localhost ([::1]:57688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7iHi-00032z-Dx
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 12:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k7iGZ-00026H-Nj
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 12:45:48 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:48765
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k7iGX-0000IO-2a
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 12:45:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597682741;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=yUMQDixSHDnHqd3ncY03zS0mESA8wjmJRG1fFZxm8tI=;
 b=UMAjEoKTcIdvwlACX0uw0RRT2zmOVPYAvwHLzYjl9337d2ac8wSGPqQGS3W1NHaKT31W/C
 sq3lvZVnQNgFJNBVpR83tbFmfoaKTFyqv0K47JhiY6AvOFkbNANFyj4LaQbfnc955GznIR
 rM+MReptNirGEEFlGhQJcR51RdLVY0s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-9x2ezaseNZKHQD5BEhLqHg-1; Mon, 17 Aug 2020 12:45:37 -0400
X-MC-Unique: 9x2ezaseNZKHQD5BEhLqHg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C9A91005E5F;
 Mon, 17 Aug 2020 16:45:36 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8C9B1002391;
 Mon, 17 Aug 2020 16:45:35 +0000 (UTC)
Date: Mon, 17 Aug 2020 17:45:32 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 00/17] crypto/cipher: Class hierarchy cleanups
Message-ID: <20200817164532.GJ4775@redhat.com>
References: <20200813032537.2888593-1-richard.henderson@linaro.org>
 <159731709934.15736.9334531658741182763@66eaa9a8a123>
MIME-Version: 1.0
In-Reply-To: <159731709934.15736.9334531658741182763@66eaa9a8a123>
User-Agent: Mutt/1.14.5 (2020-06-23)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/17 03:34:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 13, 2020 at 04:11:40AM -0700, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20200813032537.2888593-1-richard.henderson@linaro.org/
> 
> 
> 
> Hi,
> 
> This series failed the docker-quick@centos7 build test. Please find the testing commands and
> their output below. If you have Docker installed, you can probably reproduce it
> locally.
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> make docker-image-centos7 V=1 NETWORK=1
> time make docker-test-quick@centos7 SHOW_ENV=1 J=14 NETWORK=1
> === TEST SCRIPT END ===
> 
>   CC      crypto/pbkdf-nettle.o
> In file included from /tmp/qemu-test/src/crypto/cipher.c:156:0:
> /tmp/qemu-test/src/crypto/cipher-nettle.inc.c: In function 'qcrypto_nettle_aes128_xts_wrape':
> /tmp/qemu-test/src/crypto/cipher-nettle.inc.c:185:21: error: passing argument 1 of 'aes128_encrypt_native' discards 'const' qualifier from pointer target type [-Werror]
>  static const struct QCryptoCipherDriver NAME##_driver_ctr = {           \
>                      ^
> /tmp/qemu-test/src/crypto/cipher-nettle.inc.c:270:5: note: in expansion of macro 'DEFINE_CTR'

Older versions of nettle had a different API declaration for various
functions. This failure suggests the code changes in this series only
work for the modern nettle.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


