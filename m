Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E2557DC8B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 10:36:56 +0200 (CEST)
Received: from localhost ([::1]:41358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEo9W-0004Di-Sy
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 04:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEo37-0000RT-0W
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 04:30:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEo2z-0007lf-7t
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 04:30:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658478608;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=AvWO1sCNT/zhIxqHtNDiqYhLV4XpMJbrSEwCA5NBPrk=;
 b=Zf7ZGde58YCTUDmsWquUaehj3ja7oC55aFPQs7+3SqA8sI3SIIELwPEaAux410oxL9HATo
 b/fXBswGHzG6KwINrBEjhOV02bCZdTgJHo8out8G8XSAnyTE/w7s1YB6oJUKKVws4esCBf
 er19syOzSeed1/MdO57q1vg+8RVLHH4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-E0A-gGScMjSKrn0amf1PJA-1; Fri, 22 Jul 2022 04:30:04 -0400
X-MC-Unique: E0A-gGScMjSKrn0amf1PJA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71D782812C22;
 Fri, 22 Jul 2022 08:30:04 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57E261410F3C;
 Fri, 22 Jul 2022 08:30:03 +0000 (UTC)
Date: Fri, 22 Jul 2022 09:29:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Zhao, Zhou" <zhou.zhao@intel.com>
Cc: "Xu, Ling1" <ling1.xu@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "Jin, Jun I" <jun.i.jin@intel.com>
Subject: Re: [PATCH 1/1] Add AVX512 support for xbzrle_encode_buffer function
Message-ID: <YtpgBiHPLKZfendO@redhat.com>
References: <20220721103147.96608-1-ling1.xu@intel.com>
 <20220721103147.96608-2-ling1.xu@intel.com>
 <YtlshIteVijWePbd@redhat.com>
 <DM6PR11MB28126DAC62A921E5551C1400F5919@DM6PR11MB2812.namprd11.prod.outlook.com>
 <YtmBzCuMnY2kHr4f@redhat.com>
 <DM6PR11MB2812DBD3B12D3D3768CB46A4F5909@DM6PR11MB2812.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DM6PR11MB2812DBD3B12D3D3768CB46A4F5909@DM6PR11MB2812.namprd11.prod.outlook.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, Jul 22, 2022 at 02:23:13AM +0000, Zhao, Zhou wrote:
> 1 we need gcc machined options to tirgger gcc enable SIMD
> instructions(https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html).
> Or it will trigger a compile error. This is the reason why we
> change the config file.

Take a look at util/bufferiszero.c   - that uses '#pragma GCC target'
to selectively change the compule target of individual functions.

This is what is njeeded here, because most distros are going to
compile QEMU with a very old x86_64 baseline, never turn on avx512
for the whole QEMU build. It needs to be very selective to make
it usable for typical deployments.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


