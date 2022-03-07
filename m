Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC384CF32D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 09:07:56 +0100 (CET)
Received: from localhost ([::1]:47858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR8PK-0006au-Vz
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 03:07:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nR8JN-0002TI-Gx
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:01:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nR8JL-00017w-QE
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:01:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646640103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ij6L38iN0WAgIZmYyyiAINpWMXQSSt+HMxpB4VYzFcg=;
 b=aApeKc+GR4BfNzz74Pu3/HlBCXbbkN/TCb6y8JWGLN9xaYyUUDx59et82RdsTBgsPGfbaZ
 9jXw2QDya6zc/xpbesGuAq/5h/a4C0q7lIiY1kETVWRmY/GVG/cEwz3y4eAgC44K5VdbF9
 XYE6KOIAOHW1l7H0hUEXH6txsLVsss4=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-d5GzCtCqN5mIfTpdGMKhdA-1; Mon, 07 Mar 2022 03:01:42 -0500
X-MC-Unique: d5GzCtCqN5mIfTpdGMKhdA-1
Received: by mail-pf1-f199.google.com with SMTP id
 z194-20020a627ecb000000b004f6db380a59so3694605pfc.19
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 00:01:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ij6L38iN0WAgIZmYyyiAINpWMXQSSt+HMxpB4VYzFcg=;
 b=OTL9m7VCpeWJhQUW1kJogvbS0T80NQoltbwMeyFsKUITfx5R82jr6PBOYqJjYMMBs8
 yrIGxyyvSYSYV1/Uu2slRyTjQOSAYhdhRdiA9shnGyeALmClkKnWzSuF5eP6zOhUnZ+5
 pRo1OTHBiSgxZfR1Myv6mq/8yd/JysSlJMyHWEkHI6XrSDixynf1Mj/jR0iks5oEkjV1
 XOhcdDq9FDVwB37xMVIYg39+sqzuFUlHt/OiB/6lwa2L68Z0isuXcAmEmIEzDCOxgfmk
 gxovUvXjZzLw0kMcO+Zm7B6SUfH6VoYU0SfrsLKS84NQ4o3eoX8Zb+k5k9gfiOVq5CzI
 v9Ew==
X-Gm-Message-State: AOAM532OzeWc89yzslsogF3zP1q6cl024+GtopqX1c/nuwCMBdTvP8ro
 s68Ujs0Ps4K/mwXHPd/N4Ej3k/IbK6aR8/tdpCiHPtCL72b3KY9OHTa9+zDPTXBlkNTA1qGkNBW
 8f4ml0dv8yOKm4Bw=
X-Received: by 2002:a17:903:1210:b0:14f:973e:188d with SMTP id
 l16-20020a170903121000b0014f973e188dmr10914276plh.61.1646640100461; 
 Mon, 07 Mar 2022 00:01:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy67TLseImS1Ko2NjHi+s0TvghVNNx7yWnycvM5/DxsFZq1ezOTGWGQTPp2DvNsXLv1FC0nWw==
X-Received: by 2002:a17:903:1210:b0:14f:973e:188d with SMTP id
 l16-20020a170903121000b0014f973e188dmr10914252plh.61.1646640100118; 
 Mon, 07 Mar 2022 00:01:40 -0800 (PST)
Received: from xz-m1.local ([94.177.118.47]) by smtp.gmail.com with ESMTPSA id
 lk13-20020a17090b33cd00b001bf72ab711asm1581734pjb.35.2022.03.07.00.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 00:01:39 -0800 (PST)
Date: Mon, 7 Mar 2022 16:01:35 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 14/18] tests: convert XBZRLE migration test to use common
 helper
Message-ID: <YiW737sCTsUfu+D4@xz-m1.local>
References: <20220302174932.2692378-1-berrange@redhat.com>
 <20220302174932.2692378-15-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220302174932.2692378-15-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 02, 2022 at 05:49:28PM +0000, Daniel P. Berrangé wrote:
> @@ -1255,6 +1259,7 @@ static void test_precopy_unix_common(TestMigrateStartHook start_hook,
>                                       TestMigrateFinishHook finish_hook,
>                                       bool expect_fail,
>                                       bool dst_quit,
> +                                     unsigned int iterations,
>                                       bool dirty_ring)
>  {
>      g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
> @@ -1265,6 +1270,7 @@ static void test_precopy_unix_common(TestMigrateStartHook start_hook,
>                          finish_hook,
>                          expect_fail,
>                          dst_quit,
> +                        iterations,
>                          dirty_ring);
>  }
>  
> @@ -1274,6 +1280,7 @@ static void test_precopy_unix_plain(void)
>                               NULL, /* finish_hook */
>                               false, /* expect_fail */
>                               false, /* dst_quit */
> +                             1, /* iterations */
>                               false /* dirty_ring */);
>  }
>  
> @@ -1283,6 +1290,7 @@ static void test_precopy_unix_dirty_ring(void)
>                               NULL, /* finish_hook */
>                               false, /* clientReject */
>                               false, /* dst_quit */
> +                             1, /* iterations */
>                               true /* dirty_ring */);
>  }
>  
> @@ -1293,6 +1301,7 @@ static void test_precopy_unix_tls_psk(void)
>                               test_migrate_tls_psk_finish,
>                               false, /* expect_fail */
>                               false, /* dst_quit */
> +                             1, /* iterations */
>                               false /* dirty_ring */);
>  }
>  
> @@ -1303,6 +1312,7 @@ static void test_precopy_unix_tls_x509_default_host(void)
>                               test_migrate_tls_x509_finish,
>                               true, /* expect_fail */
>                               true, /* dst_quit */
> +                             1, /* iterations */
>                               false /* dirty_ring */);
>  }
>  
> @@ -1312,6 +1322,7 @@ static void test_precopy_unix_tls_x509_override_host(void)
>                               test_migrate_tls_x509_finish,
>                               false, /* expect_fail */
>                               false, /* dst_quit */
> +                             1, /* iterations */
>                               false /* dirty_ring */);

Another side benefit to merge parameters (e.g. the new "iterations") into
MigrateStart (which I mentioned in the other thread) is that we don't need
to touch the value in every test if there's a default, because we will set
the default in migrate_start_new() and we only need a tweak on tests that
want to overwrite the default values.

Thanks,

-- 
Peter Xu


