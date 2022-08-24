Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA845A019B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 20:51:36 +0200 (CEST)
Received: from localhost ([::1]:35116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQvTS-0006Ml-Dq
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 14:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oQvKU-0005wC-DF
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 14:42:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oQvKE-0006IL-IM
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 14:42:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661366516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vj6Soq+EpWf4MvW19JpVnu+cXC7APm36RydA3rsMh94=;
 b=Wf2vjlWypTCvYpV11DgfxA6fS2oJZNoC5rzwLajSOwRl5f3QSG/+GQOM9jsRT6JBgRA3HJ
 J3m2WSP8FAZL+GtAGFuC35PUjEIGFZPUs9TD9hptNaqylgPSe4HbWFTfkPpvdiwrRCIuMm
 Ie36D9lD7ASVw1M6oF5Mh5hA9UqRIyw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-421-sfDkyNjnNEevyVkXrD5b1w-1; Wed, 24 Aug 2022 14:41:54 -0400
X-MC-Unique: sfDkyNjnNEevyVkXrD5b1w-1
Received: by mail-wm1-f72.google.com with SMTP id
 b16-20020a05600c4e1000b003a5a47762c3so9725631wmq.9
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 11:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=Vj6Soq+EpWf4MvW19JpVnu+cXC7APm36RydA3rsMh94=;
 b=sAvDe6kTbhGaNr/dOtdU3Jm0loQK/ZD2+2Ww7REYdhlG2uW3ElIftLslMNk0gE9hrd
 qI693gHgNsVD46Rc88cnovhiIPIynL6v3LHzX0F9TYrxa5OMf/v6E0lFWQXGID/zEJG0
 eFIGe/uKeVYd5OLl6Fvc21eH1JsyASmuCFvFwcWrCk++NgdqWlFMxXZQVNe7Iz0OkTAw
 s7y4IpshIGhTUB2ZvFxyzoR9BJpG/Nvg+ekPcla4bh9xasGFc5uLu+XtovMA8lR2gfnF
 lBCR6SXg4h+sPrzAgFLyspwsA+1OfJuKPHo6P/xbOURGmN2KBzU9uzk9wgWpl+wquoxM
 cgyw==
X-Gm-Message-State: ACgBeo35qoIURMW5Nd6+RXcppiiuw2DEhznPcGeXbSAX0LF7pW/qcKrc
 PykOOWW2Ck5A65yoVip6sZx/pvlHvZ4ZfMERJ8cwEgXvzjW4mgGEVw5MV8y8EYQxj3zbnylQUAp
 aUgV/6CoOHK6rQBo=
X-Received: by 2002:a05:600c:89a:b0:3a5:4ea9:d5ee with SMTP id
 l26-20020a05600c089a00b003a54ea9d5eemr6097187wmp.8.1661366513753; 
 Wed, 24 Aug 2022 11:41:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6/lY5BGJYrnstbu9nPl9daaxmWc5gXzya2WXIYprqAspkeYsTpARjUvO5S9IM22b8bp1WcHw==
X-Received: by 2002:a05:600c:89a:b0:3a5:4ea9:d5ee with SMTP id
 l26-20020a05600c089a00b003a54ea9d5eemr6097173wmp.8.1661366513543; 
 Wed, 24 Aug 2022 11:41:53 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 o13-20020a05600c510d00b003a4efb794d7sm3327937wms.36.2022.08.24.11.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 11:41:52 -0700 (PDT)
Date: Wed, 24 Aug 2022 19:41:50 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 13/51] tests/qtest: migration-test: Handle link() for win32
Message-ID: <YwZw7rEWBexZoJ9v@work-vm>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-14-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220824094029.1634519-14-bmeng.cn@gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Bin Meng (bmeng.cn@gmail.com) wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Windows does not provide a link() API like POSIX. Instead it provides
> a similar API CreateHardLink() that does the same thing, but with
> different argument order and return value.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
> 
>  tests/qtest/migration-test.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 38356d4aba..af9250750b 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -876,9 +876,17 @@ test_migrate_tls_x509_start_common(QTestState *from,
>      g_mkdir_with_parents(data->workdir, 0700);
>  
>      test_tls_init(data->keyfile);
> +#ifndef _WIN32
>      g_assert(link(data->keyfile, data->serverkey) == 0);
> +#else
> +    g_assert(CreateHardLink(data->serverkey, data->keyfile, NULL) != 0);
> +#endif
>      if (args->clientcert) {
> +#ifndef _WIN32
>          g_assert(link(data->keyfile, data->clientkey) == 0);
> +#else
> +        g_assert(CreateHardLink(data->clientkey, data->keyfile, NULL) != 0);
> +#endif
>      }
>  
>      TLS_ROOT_REQ_SIMPLE(cacertreq, data->cacert);
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


