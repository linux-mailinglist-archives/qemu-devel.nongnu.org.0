Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FE957CEB0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 17:12:57 +0200 (CEST)
Received: from localhost ([::1]:57440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEXrE-0002pd-Dr
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 11:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEXpV-0008Vu-6j
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 11:11:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEXpT-0007Ww-4G
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 11:11:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658416266;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=CGjmTEXLBMyjewS0FPw5idmTmxKWC6oeaOpfXcIwoxI=;
 b=X1cJu3zGIry61o0z79II1pl6VFoJYenbtAysI2JsMCQM87uSvRKhTJG6DLn/lEr9j7xBDP
 qVsti3bNhM2aPTWqYxtay6BV8wTeY7DyCiAA0a3I+BMyHJhXU9knAQc2MPna3f70+ShQgc
 h251gUUQOkvU6co6qxbgu4yXzmdUZe0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-toLvYxBXPLq5V8fNQQVXGg-1; Thu, 21 Jul 2022 11:11:04 -0400
X-MC-Unique: toLvYxBXPLq5V8fNQQVXGg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99B9A811E80;
 Thu, 21 Jul 2022 15:11:03 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B44DF2026D64;
 Thu, 21 Jul 2022 15:11:02 +0000 (UTC)
Date: Thu, 21 Jul 2022 16:11:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: ling xu <ling1.xu@intel.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 Zhou Zhao <zhou.zhao@intel.com>, Jun Jin <jun.i.jin@intel.com>
Subject: Re: [PATCH 1/1] Add AVX512 support for xbzrle_encode_buffer function
Message-ID: <YtlshIteVijWePbd@redhat.com>
References: <20220721103147.96608-1-ling1.xu@intel.com>
 <20220721103147.96608-2-ling1.xu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220721103147.96608-2-ling1.xu@intel.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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

On Thu, Jul 21, 2022 at 06:31:47PM +0800, ling xu wrote:
> This commit adds AVX512 implementation of xbzrle_encode_buffer function to
> accelerate xbzrle encoding speed. Compared with C version of xbzrle_encode_buffer function,
> AVX512 version can achieve almost 60%-70% performance improvement on unit test provided by qemu.
> In addition, we provide one more unit test called "test_encode_decode_random", in which
> dirty data are randomly located in 4K page, and this case can achieve almost 140% performance gain.
> 
> Signed-off-by: ling xu <ling1.xu@intel.com>
> Co-authored-by: Zhou Zhao <zhou.zhao@intel.com>
> Co-authored-by: Jun Jin <jun.i.jin@intel.com>
> ---
>  configure                | 434 ++++++++++++++++++++++++++++++++++++++-
>  migration/ram.c          |   6 +
>  migration/xbzrle.c       | 177 ++++++++++++++++
>  migration/xbzrle.h       |   4 +
>  tests/unit/test-xbzrle.c | 307 +++++++++++++++++++++++++--
>  5 files changed, 908 insertions(+), 20 deletions(-)

> diff --git a/migration/ram.c b/migration/ram.c
> index 01f9cc1d72..3b931c325f 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -747,9 +747,15 @@ static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
>      memcpy(XBZRLE.current_buf, *current_data, TARGET_PAGE_SIZE);
>  
>      /* XBZRLE encoding (if there is no overflow) */
> +    #if defined(__x86_64__) && defined(__AVX512BW__)
> +    encoded_len = xbzrle_encode_buffer_512(prev_cached_page, XBZRLE.current_buf,
> +                                       TARGET_PAGE_SIZE, XBZRLE.encoded_buf,
> +                                       TARGET_PAGE_SIZE);
> +    #else
>      encoded_len = xbzrle_encode_buffer(prev_cached_page, XBZRLE.current_buf,
>                                         TARGET_PAGE_SIZE, XBZRLE.encoded_buf,
>                                         TARGET_PAGE_SIZE);
> +    #endif

Shouldn't we be deciding which impl using a runtime check of
the current CPUID, rather than a compile time check ? I'm
thinking along the lines of what util/bufferiszero.c does to
select different optimized versions based on CPUID. The build
host CPU features can't be expected to match the runtime host
CPU features.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


