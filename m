Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0E4255DC4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 17:24:42 +0200 (CEST)
Received: from localhost ([::1]:52102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBgF6-0000py-Qf
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 11:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kBgEA-00009R-9Z
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 11:23:42 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:41393
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kBgE7-0006Qt-DW
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 11:23:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598628217;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4gSX2e/pHNUSDvIav7EAhuhKsr+ZKQ+sQhUcotIqSLU=;
 b=SKEihcft3MK9MKKCWFFQUyr16wKrkckWDkelR/cfrFrJ/0NULr9D8/wPWRSOZVcx9YvyKC
 phxU4ZIx+0bcC2pg5GUQqMerAbFaq0ZJljpn73Zi/SngX7UZnrMWwVY11IWzby0c8MsiDr
 TTP76Saxe6J168eeE534SZl+PwTbv1Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-OVtQjMxLNjqvfJdp0Diqvg-1; Fri, 28 Aug 2020 11:23:27 -0400
X-MC-Unique: OVtQjMxLNjqvfJdp0Diqvg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 633F4425D9;
 Fri, 28 Aug 2020 15:23:26 +0000 (UTC)
Received: from redhat.com (ovpn-112-47.ams2.redhat.com [10.36.112.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A50D119C59;
 Fri, 28 Aug 2020 15:23:21 +0000 (UTC)
Date: Fri, 28 Aug 2020 16:23:18 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/2] crypto: fix build without gcrypt and gnutls
Message-ID: <20200828152318.GO224144@redhat.com>
References: <20200828132716.279782-1-berrange@redhat.com>
 <20200828132716.279782-2-berrange@redhat.com>
 <0a1a8958-691f-d16d-2f6b-6392e6a20966@linaro.org>
MIME-Version: 1.0
In-Reply-To: <0a1a8958-691f-d16d-2f6b-6392e6a20966@linaro.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 07:07:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 28, 2020 at 08:13:26AM -0700, Richard Henderson wrote:
> On 8/28/20 6:27 AM, Daniel P. Berrangé wrote:
> > If nettle is disabled and gcrypt enabled, the compiler and linker flags
> > needed for gcrypt are not passed.
> > 
> > Gnutls was also not added as a dependancy wen gcrypt is enabled.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> This still needs something else.  I get
> 
> Linking target qemu-x86_64
> /usr/bin/ld: libqemuutil.a(crypto_init.c.o): in function `qcrypto_init':
> /home/rth/qemu/bld-g/../qemu/crypto/init.c:111: undefined reference to
> `gnutls_global_init'
> /usr/bin/ld: /home/rth/qemu/bld-g/../qemu/crypto/init.c:113: undefined
> reference to `gnutls_strerror'
> collect2: error: ld returned 1 exit status
> make: *** [Makefile.ninja:1570: qemu-x86_64] Error 1

Can you tell me what  configure args you're using and host OS distro

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


