Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA525446E3
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 11:08:42 +0200 (CEST)
Received: from localhost ([::1]:51284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzE9h-0000bs-7g
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 05:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nzDzD-0005EN-NJ
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 04:57:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nzDz9-0004OP-UQ
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 04:57:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654765066;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Amsd0AoymkbUWequQY81Msti8gG+grDOfS9h8imk2s=;
 b=fUaAwJpm0bdMl70BSWbHni0TLuORu742k4sM5C+Cp0B08CQPF4XO4++2Q+WfbvQniGEHKx
 /8tWoGWs0afWVV3CtaS/TD5Yjp04gcoqKRCSimynHgE+ezq1/64u/AjG4hzEE42SsamEXL
 NA/7JWPku3F0rNwNHBpaPuDlAn2MATM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-CuLvEevZOsChvm-uSgJC4g-1; Thu, 09 Jun 2022 04:57:45 -0400
X-MC-Unique: CuLvEevZOsChvm-uSgJC4g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEBEC100BABC;
 Thu,  9 Jun 2022 08:57:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EF1A1415100;
 Thu,  9 Jun 2022 08:57:42 +0000 (UTC)
Date: Thu, 9 Jun 2022 09:57:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH] disas: Remove libvixl disassembler
Message-ID: <YqG2Anwtba+MfxfH@redhat.com>
References: <20220603164249.112459-1-thuth@redhat.com>
 <07f021e7-1346-c6b3-3bd1-ef0d0f0e2ff5@suse.de>
 <52c51ac4-5598-faf2-d5e5-638cab0dc1fd@redhat.com>
 <7ae17984-89c4-2247-57a7-fde6206e41e0@redhat.com>
 <03a1e04e-45c7-5002-6920-d04e29fd48fd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03a1e04e-45c7-5002-6920-d04e29fd48fd@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jun 09, 2022 at 10:47:24AM +0200, Thomas Huth wrote:
> On 08/06/2022 17.51, Paolo Bonzini wrote:
> > On 6/3/22 19:35, Thomas Huth wrote:
> > > On 03/06/2022 19.26, Claudio Fontana wrote:
> > > > On 6/3/22 18:42, Thomas Huth wrote:
> > > > > The disassembly via capstone should be superiour to our old vixl
> > > > > sources nowadays, so let's finally cut this old disassembler out
> > > > > of the QEMU source tree.
> > > > > 
> > > > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > > 
> > > > agreed, one thought: at the time I added this thing, I had to
> > > > add C++ compilation support,
> > > > maybe something we can now drop if there are no more C++ users?
> > > 
> > > I thought about that, too, but we still have disas/nanomips.cpp left
> > > and the Windows-related files in qga/vss-win32/* .
> > 
> > That is pure C++ so it does not need the extra complication of "detect
> > whether the C and C++ compiler are ABI-compatible" (typically due to
> > different libasan/libtsan implementation between gcc and clang).  So
> > it's really just nanoMIPS that's left.
> 
> Ok, so the next theoretical question is: If we get rid of the nanomips.cpp
> file or convert it to plain C, would we then simplify the code in configure
> again (and forbid C++ for the main QEMU code), or would we rather keep the
> current settings in case we want to re-introduce more C++ code again in the
> future?

It doesn't feel very compelling to have just 1 source file that's
C++ in QEMU. I'm curious how we ended up with this nanomips.cpp
file - perhaps it originated from another project that was C++
based ?

The code itself doesn't look like it especially needs to be using
C++. There's just 1 class there and every method is associated
with that class, and external entry point from the rest of QEMU
is just one boring method. Feels like it could easily have been
done in C.

Personally I'd prefer it to be converted to C, and if we want to
add any C++ in future it should be justified & debated on its
merits, rather than as an artifact of any historical artifacts
such as the code in configure happening to still exist.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


