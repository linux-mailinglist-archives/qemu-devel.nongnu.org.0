Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 618DA3A6DD2
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 19:56:42 +0200 (CEST)
Received: from localhost ([::1]:57016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsqpE-0006J2-VH
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 13:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lsqoK-0005aq-Va
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 13:55:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lsqoH-0002Mh-SP
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 13:55:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623693340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8Qk2opYScdjO0lTnUs4UU39JRstDhigfnYjig18nPHM=;
 b=Q+y//Th6D2PX+Bfv5Nokq631ekToqwNZxNKt+46rRA3Waqn6pZQh5wsG8eZID9enliFn35
 opFxulkYfgg/6wKhMCFTejPA28akTTuWJhiqahb7HxiAuu6O6l0D8LPbfNWKfcOAk6So9k
 UA2CXSh3CIcuR0ZhS6d1wseoaaARIQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-hDQ-W0T7NiufamPb2Azr_w-1; Mon, 14 Jun 2021 13:55:38 -0400
X-MC-Unique: hDQ-W0T7NiufamPb2Azr_w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62FE11019996
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 17:55:37 +0000 (UTC)
Received: from work-vm (ovpn-114-158.ams2.redhat.com [10.36.114.158])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D367610074EF;
 Mon, 14 Jun 2021 17:55:29 +0000 (UTC)
Date: Mon, 14 Jun 2021 18:55:27 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 2/2] tests: migration-test: Add dirty ring test
Message-ID: <YMeYDzWaQdLoGFJY@work-vm>
References: <20210610005239.265588-1-peterx@redhat.com>
 <20210610005239.265588-3-peterx@redhat.com>
 <YMJhmOXglbMlX5P6@work-vm> <YMJoy7rPDNNJpyVr@t490s>
MIME-Version: 1.0
In-Reply-To: <YMJoy7rPDNNJpyVr@t490s>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> On Thu, Jun 10, 2021 at 08:01:44PM +0100, Dr. David Alan Gilbert wrote:
> > > +#include <linux/kvm.h>
> > 
> > Does that get you the system headers, which may or may not have
> > KVM_CAP_DIRTY_LOG_RING if you're on an old host, or does it get you
> > qemu's linux-headers which definitely does?
> 
> I tested it and it's using the linux-headers/ file even if I also got the other
> /usr/include one.  So I think the qemu one just has higher priority in the "-I"
> paths.
> 
> Btw, IIUC quotting with <> or "" should be the same here for headers, so I'm
> thinking maybe I should switch to "" like the rest headers.

Oh in that case,

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> 
> > 
> > What happens on a BSD or the like?
> 
> Ah, good point..
> 
> How about I squash this into the patch?

I'm not sure;  I was only really worried about the build failing, I was
assuming that nothing else would have /dev/kvm so your open would fail.
Although I guess that might mean something entirely different on some
other OS, so perhaps it's worth it.

Dave

> ---8<---
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index cc6e396d1a2..9ef6b471353 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -12,7 +12,6 @@
>  
>  #include "qemu/osdep.h"
>  
> -#include <linux/kvm.h>
>  #include "libqos/libqtest.h"
>  #include "qapi/error.h"
>  #include "qapi/qmp/qdict.h"
> @@ -28,6 +27,10 @@
>  #include "migration-helpers.h"
>  #include "tests/migration/migration-test.h"
>  
> +#if defined(__linux__)
> +#include "linux/kvm.h"
> +#endif
> +
>  /* TODO actually test the results and get rid of this */
>  #define qtest_qmp_discard_response(...) qobject_unref(qtest_qmp(__VA_ARGS__))
>  
> @@ -1392,6 +1395,7 @@ static void test_multifd_tcp_cancel(void)
>  
>  static bool kvm_dirty_ring_supported(void)
>  {
> +#if defined(__linux__)
>      int ret, kvm_fd = open("/dev/kvm", O_RDONLY);
>  
>      if (kvm_fd < 0) {
> @@ -1407,6 +1411,9 @@ static bool kvm_dirty_ring_supported(void)
>      }
>  
>      return true;
> +#else
> +    return false;
> +#endif
>  }
>  
>  int main(int argc, char **argv)
> ---8<---
> 
> Thanks!
> 
> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


