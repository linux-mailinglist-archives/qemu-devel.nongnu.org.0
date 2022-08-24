Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9653759FAB6
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 15:01:38 +0200 (CEST)
Received: from localhost ([::1]:56642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQq0m-0008Uv-7n
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 09:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oQpsk-000777-OJ
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 08:53:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oQpsh-0003cE-P5
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 08:53:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661345593;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R2bzCtBz/abzMHIS/4BNpFroik1zlUCIBwL3gv0mIpg=;
 b=KElOrSVmbLCdtcMYeZ3oou7FmNfaAqs/S2HIeeYjfDdhCT5bDuIewv9tjdhFb1DeOwCXvq
 sWb9D7OZ7iZ2za8IkXtvgljD6Ja4IfGn7jufkxrcdDz+7KPDpzIA5wHBcrYTzwPoMKVYdh
 1C+aGkpN/nJu0z9kh7QVLkhmSXVuSgE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-slb16nMlOwa87zWqjBjhRg-1; Wed, 24 Aug 2022 08:53:10 -0400
X-MC-Unique: slb16nMlOwa87zWqjBjhRg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2102281F46A;
 Wed, 24 Aug 2022 12:53:10 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D0214010D2A;
 Wed, 24 Aug 2022 12:53:09 +0000 (UTC)
Date: Wed, 24 Aug 2022 13:53:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jungmin Park <pjm0616@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] crypto/luks: Support creating LUKS image on Darwin
Message-ID: <YwYfM41JIb1VW457@redhat.com>
References: <20220824123705.2084720-1-pjm0616@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220824123705.2084720-1-pjm0616@gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Wed, Aug 24, 2022 at 09:37:06PM +0900, Jungmin Park wrote:
> When the user creates a LUKS-encrypted qcow2 image using the qemu-img
> program, the passphrase is hashed using PBKDF2 with a dynamic
> number of iterations. The number of iterations is determined by
> measuring thread cpu time usage, such that it takes approximately
> 2 seconds to compute the hash.
> 
> Because Darwin doesn't implement getrusage(RUSAGE_THREAD), we get an
> error message:
> > qemu-img: test.qcow2: Unable to calculate thread CPU usage on this platform
> for this command:
> > qemu-img create --object secret,id=key,data=1234 -f qcow2 -o 'encrypt.format=luks,encrypt.key-secret=key' test.qcow2 100M
> 
> This patch implements qcrypto_pbkdf2_get_thread_cpu() for Darwin so that
> the above command works.
> 
> Signed-off-by: Jungmin Park <pjm0616@gmail.com>
> ---
>  crypto/pbkdf.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Afraid this is too late to get into 7.1 release, but I'll queue it for
the next dev cycle.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


