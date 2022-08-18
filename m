Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FB55989A2
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 19:08:59 +0200 (CEST)
Received: from localhost ([::1]:43402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOj0r-0004Ho-Gu
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 13:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oOizR-00028W-Ek
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 13:07:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oOizM-0008Dg-OZ
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 13:07:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660842443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8W4rS9vGoU8b0ZCBx8WCU0KMqFLsoWqJSHBTdSo1l/Q=;
 b=Wxe7PnEbWLDdFPveSmdHhxEi5XCtlIViBk2p6pQ+7oFeW4Umxbc1QSQa1F7L7fI0uE1Ozi
 KM8TtUDkzvhRvtkej7o86DfihdJ/TF3AH9F7/IQf5arSCtLipoKf9wbhcV8jxp5s9CpFsG
 xgQ7kX3dG2KRue++eZhN9oh56q3/o58=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-280-RaS6kYxcMlWr8B7fZVDz9Q-1; Thu, 18 Aug 2022 13:07:22 -0400
X-MC-Unique: RaS6kYxcMlWr8B7fZVDz9Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 r5-20020a1c4405000000b003a5fa79008bso117032wma.5
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 10:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=8W4rS9vGoU8b0ZCBx8WCU0KMqFLsoWqJSHBTdSo1l/Q=;
 b=yvzCzTlCvBxIPgHh2ikJKZDXwuUkviUWxoYHS+c2oUgW8M742xFq4xnw8gCbOSRJYy
 hXtXA9NQQW7nVHSSz9sB/A6/R3a4ugcQA5rqothv+EZ7dA4gGWvWrym4/OLuLW7xYwv8
 afQinuPRV1CUZltvSKvyHtFeql211I/4RAVoqf0u4/tlSHIv+OSU6R8BBWKWm4a+Y6Uk
 kjUFFRJuudf7zXTcg+1lejpIqGlEIEMHYeNBQIgefAwDsqmf7Lud9lA5EZuCMAxyDPn/
 aeq7Hm8vKmLkAp34U8LUt0xfiYwSLNnVv8TkQYzZwiGOSeh5Vp/+eIi+Oj0uANtA3F6c
 VRIw==
X-Gm-Message-State: ACgBeo0czZGrOKUH09MlLokV6SdqyY4SZoh/oi8BKkCEVBVelCQ57ECi
 MH3rI0Nl5uTgLC94b/2dGkn1HlZv1geBWpTHoBsOzwQwWEDMihA4dD7D4q46rvHwE4YUvCIgPBh
 xHQMTyAa+mymDH/8=
X-Received: by 2002:a05:600c:19ce:b0:3a5:ffb3:d546 with SMTP id
 u14-20020a05600c19ce00b003a5ffb3d546mr2532095wmq.6.1660842440818; 
 Thu, 18 Aug 2022 10:07:20 -0700 (PDT)
X-Google-Smtp-Source: AA6agR65uP2xjKhTm8FgWQqTcIR+FNQT+oWdRggqM4H+GyTrjMQbW/gkEOLoH2GIR2dIzC6wK2GMcQ==
X-Received: by 2002:a05:600c:19ce:b0:3a5:ffb3:d546 with SMTP id
 u14-20020a05600c19ce00b003a5ffb3d546mr2532080wmq.6.1660842440554; 
 Thu, 18 Aug 2022 10:07:20 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 k40-20020a05600c1ca800b003a5f3de6fddsm6598708wms.25.2022.08.18.10.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 10:07:19 -0700 (PDT)
Date: Thu, 18 Aug 2022 18:07:18 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Only wait for serial output
 where migration succeeds
Message-ID: <Yv5xxvrpbd0tXUCi@work-vm>
References: <20220818162144.227542-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220818162144.227542-1-thuth@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Thomas Huth (thuth@redhat.com) wrote:
> Waiting for the serial output can take a couple of seconds - and since
> we're doing a lot of migration tests, this time easily sums up to
> multiple minutes. But if a test is supposed to fail, it does not make
> much sense to wait for the source to be in the right state first, so
> we can skip the waiting here. This way we can speed up all tests where
> the migration is supposed to fail. In the gitlab-CI gprov-gcov test,
> each of the migration-tests now run two minutes faster!
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/qtest/migration-test.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 520a5f917c..7be321b62d 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -1307,7 +1307,9 @@ static void test_precopy_common(MigrateCommon *args)
>      }
>  
>      /* Wait for the first serial output from the source */
> -    wait_for_serial("src_serial");
> +    if (args->result == MIG_TEST_SUCCEED) {
> +        wait_for_serial("src_serial");
> +    }

I think this is OK, albeit only because all of the current fail-tests
are ones where the connection fails; we're not relying on the behaviour
of the emulator at all.  I wonder if it's worth going further and
running the source qemu's with -S (which may or not fail in other ways).

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>  
>      if (!args->connect_uri) {
>          g_autofree char *local_connect_uri =
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


