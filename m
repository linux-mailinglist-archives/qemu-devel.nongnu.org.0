Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 017DA246DAC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 19:10:07 +0200 (CEST)
Received: from localhost ([::1]:49052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7ie5-000843-Oh
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 13:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k7idO-0007bX-Cj
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 13:09:22 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:31312
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k7idL-0003FM-Ny
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 13:09:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597684158;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=sExKCT/G7lbR28UTKp2hOrc4vh/phk4m0oEB22MLqwc=;
 b=gixsfYFn7cuAa7lSgQHYZ1xV3S1ygqPtBL03sqZWovScPeBL+DFXKHoVObj5MVXlmAV3yc
 pYowhfmrHGaWfkIJwFiGkX0VWEOe0D5ToINuUag4YKPOAFHEoWWq5izgJIdHN8AsFkbeu9
 9pQpzO4Un2CnTCQ6g69CjVV0HWE1oSk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-STz-dmANMrKCQb6Yg2hccg-1; Mon, 17 Aug 2020 13:09:16 -0400
X-MC-Unique: STz-dmANMrKCQb6Yg2hccg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B82641015DC3;
 Mon, 17 Aug 2020 17:09:15 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD8B5784BF;
 Mon, 17 Aug 2020 17:09:14 +0000 (UTC)
Date: Mon, 17 Aug 2020 18:09:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 00/17] crypto/cipher: Class hierarchy cleanups
Message-ID: <20200817170911.GX4775@redhat.com>
References: <20200813032537.2888593-1-richard.henderson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200813032537.2888593-1-richard.henderson@linaro.org>
User-Agent: Mutt/1.14.5 (2020-06-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/17 05:03:47
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 12, 2020 at 08:25:20PM -0700, Richard Henderson wrote:
> Mostly this is intended to cleanup the class hierarchy
> used for the ciphers.  We currently have multiple levels
> of dispatch, and multiple separate allocations.  The final
> patches rearrange this to one level of indirect call, and
> all memory allocated contiguously.
> 
> But on the way there are a number of other misc cleanups.
> 
> I know those final patches are somewhat big, but I don't
> immediately see how to split them apart.

Yeah, I can't see a better way off hand.

> I noticed this while profiling patches to make ARM PAUTH
> use the crypto subsystem.  The qcrypto_cipher_* dispatch
> routines were consuming a noticeable portion of the runtime,
> and with these changes they were down below 1% where they
> ought to be.
> 
> While I did not continue with PAUTH using AES, I still think
> these are good cleanups.

They'll probably improve the LUKS block driver performance too.

What were you measuring performance with ?  Did you use the
benchmark-crypto-cipher  program or something else ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


