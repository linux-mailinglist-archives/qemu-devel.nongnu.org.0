Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BB05A01A7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 20:58:43 +0200 (CEST)
Received: from localhost ([::1]:49376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQvaM-0003X6-IL
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 14:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oQvYO-0001gE-2l
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 14:56:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oQvYL-0008TO-FE
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 14:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661367396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=da/eeBPBkMeiRJbrm1MfB2AdwBZu3+0jOdDBGYyYzuk=;
 b=Cx1u8VYm4gRAdDU+LpZmhKyUBPDui9mMbJRD5Hsz3sJmZXW4kllYxoISXDdpMo7NpK6ZSx
 Kkuu9oAZqST3C7AXKZ3ONGVPvo+5fgcPmIl+arOIufHEmqpbYUcSr47d4YRuQUWHmIv+5d
 Z0awqquKtB4EvdCDGnvDD0E3u9RE6Fw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-633-yGVbk8OqMyGBjIjUOE1iWg-1; Wed, 24 Aug 2022 14:56:35 -0400
X-MC-Unique: yGVbk8OqMyGBjIjUOE1iWg-1
Received: by mail-wm1-f69.google.com with SMTP id
 az42-20020a05600c602a00b003a552086ba9so1199845wmb.6
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 11:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=da/eeBPBkMeiRJbrm1MfB2AdwBZu3+0jOdDBGYyYzuk=;
 b=QEGLLH/Gh1nEYg4n5cWbYL9omoktjadesz5kQVzORCS+Tv3i4/KU42CwGsjN7pP3U5
 PgiSM3GBR19otloys1EO8STCjAh8jOXwMInnksLyS6Wy1wDNahtyZpHfLCEzOHsAY9Va
 Ls/ijSEKOMQY383t/yn1mIOCSB6ZhSeYAQcipdwHEbe1NMb3Qu1ETDxFQoQrsEexFyCL
 pmOTO19HZEuc1UqnVdUlJKIu89kAlAa35kBW3EEzbMNfc5tc5r+DfZ97VKP3ja06jOKS
 YC0IIWXNMIEcJFryqQtQHgS3YnnOgTqOntWqacSLYl+JnJJgtGNY7RLH897FwuYD+NPk
 C0HA==
X-Gm-Message-State: ACgBeo0YsHhTQr7etvOReYJOeam0yki9nWE/4kNMhhjcamr8JQqaOA7W
 KM02KOauvI+SHSKG2MmnJi3MZySWyPmc7QPwRFWBToN0HJWHmHc6JEzoMrMvJ4fZIxKCn/tnBTY
 Wq8ZtE4qd0re8tzM=
X-Received: by 2002:adf:eb02:0:b0:225:2b94:d14c with SMTP id
 s2-20020adfeb02000000b002252b94d14cmr296063wrn.291.1661367394034; 
 Wed, 24 Aug 2022 11:56:34 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6ghnHrm3+R4J9JuaMTv/V9R2KkHQXaGdCZMa/qLYJwnXC9xNZLSxph2xtLgr6fhXguajLJdg==
X-Received: by 2002:adf:eb02:0:b0:225:2b94:d14c with SMTP id
 s2-20020adfeb02000000b002252b94d14cmr296050wrn.291.1661367393803; 
 Wed, 24 Aug 2022 11:56:33 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 o13-20020a05600c510d00b003a4efb794d7sm3361383wms.36.2022.08.24.11.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 11:56:33 -0700 (PDT)
Date: Wed, 24 Aug 2022 19:56:31 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, Juan Quintela <quintela@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 41/51] tests/qtest: migration-test: Kill "to" after
 migration is canceled
Message-ID: <YwZ0X6cGmK/4N1yk@work-vm>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-42-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220824094029.1634519-42-bmeng.cn@gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Bin Meng (bmeng.cn@gmail.com) wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> Make sure QEMU process "to" is killed before launching another target
> for migration in the test_multifd_tcp_cancel case.
> 
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  tests/qtest/migration-test.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 125d48d855..18ec079abf 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -2132,6 +2132,10 @@ static void test_multifd_tcp_cancel(void)
>      wait_for_migration_pass(from);
>  
>      migrate_cancel(from);
> +    /* Make sure QEMU process "to" is killed */
> +    if (qtest_probe_child(to)) {
> +        qtest_kill_qemu(to);
> +    }

I'm not sure that's safe - what happens if the qemu exits between the
probe and kill?

Dave

>      args = (MigrateStart){
>          .only_target = true,
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


