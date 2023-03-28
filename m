Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7066CBCF5
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 13:01:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph73X-0001k4-Ju; Tue, 28 Mar 2023 06:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ph73U-0001jq-RI
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 06:59:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ph73T-000077-AJ
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 06:59:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680001193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E0htq9iyw1ud0O52AoqMYp/Ce6rznvrBpuWMyqdhPgA=;
 b=Hi6HABIwStT2sl6J+ChYf25d/ApHqkr1kAzbfXoJu3u6bJw24bXDRs+wS6BjtC+YudKROl
 dBq41KqcHPEXj3gpMO0KiEMbcD/+QFzTpP0Stmk5vpQa7QAozqtLXsl7EIYdYLesl3zq9Q
 IrhtOoB5skq9bDSq0oBPfC3suy9wMhU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-BlvOnCGNPialQTURbzutZQ-1; Tue, 28 Mar 2023 06:59:52 -0400
X-MC-Unique: BlvOnCGNPialQTURbzutZQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 l18-20020a05600c1d1200b003ef7b61e2fdso192713wms.4
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 03:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680001191;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E0htq9iyw1ud0O52AoqMYp/Ce6rznvrBpuWMyqdhPgA=;
 b=y/DndK6zZIQgArGF7jbt5qbtgkB/kNZ3x/FFYAgfiKik0kQ6oLmm+U8dn7FWH8rGi2
 BsTR4d6SZlHohcpIvZxFnvHWvUHMsHuS9aPpnmu0GW5DRSJ0ieknwCBkp3x0MakTY+z9
 KitOVcSamcpJeb5aPDCAQUiuVnmy8/TF3eRc2Lbh+uBh1MDwsHeZZCB7HZcZWC3ND/Zl
 s6H6RBpoRHmAzMOYScLcKnM86sO4BbVz5LbCCEYJIjaVgNWCmq3HtQwTP732GLzrfJAO
 c2baD27AGQRyt6bgQvTKZfojYwqo6s37GaIXuviZkhK2uEyMA36x7pR2YHvDQ3fAxnen
 V7xg==
X-Gm-Message-State: AO0yUKWrVPpwbcglmetQWwq/LmpEpPqae594gqK8YnPWCyjVoAjGJjSu
 aDKtz2z+SasKCXGc6aQuxVMt+rhS1HSNa0UEoGe6BAXSz4LJ9vMh/LxaBH8Kfe/+KvXSN6uOROI
 Q1YgFkdUCjTW+nKs=
X-Received: by 2002:a05:600c:3b98:b0:3ee:782b:2e31 with SMTP id
 n24-20020a05600c3b9800b003ee782b2e31mr14830506wms.9.1680001191273; 
 Tue, 28 Mar 2023 03:59:51 -0700 (PDT)
X-Google-Smtp-Source: AK7set+okHsqoDl2EkHrTt8nSXxPdMectOBghDr1fVo5cVItQSIY4MrEje2hByET/O65FAWD5fRa4w==
X-Received: by 2002:a05:600c:3b98:b0:3ee:782b:2e31 with SMTP id
 n24-20020a05600c3b9800b003ee782b2e31mr14830498wms.9.1680001191048; 
 Tue, 28 Mar 2023 03:59:51 -0700 (PDT)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 z21-20020a05600c221500b003ef5f77901dsm11723763wml.45.2023.03.28.03.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 03:59:50 -0700 (PDT)
Date: Tue, 28 Mar 2023 11:59:48 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v1 1/1] migration: Disable postcopy + multifd migration
Message-ID: <ZCLIpO3m4WelR6g1@work-vm>
References: <20230327161518.2385074-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327161518.2385074-1-leobras@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Leonardo Bras (leobras@redhat.com) wrote:
> Since the introduction of multifd, it's possible to perform a multifd
> migration and finish it using postcopy.
> 
> A bug introduced by yank (fixed on cfc3bcf373) was previously preventing
> a successful use of this migration scenario, and now it should be
> working on most cases.
> 
> But since there is not enough testing/support nor any reported users for
> this scenario, we should disable this combination before it may cause any
> problems for users.
> 
> Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index ae2025d9d8..c601964b0e 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1356,6 +1356,11 @@ static bool migrate_caps_check(bool *cap_list,
>              error_setg(errp, "Postcopy is not compatible with ignore-shared");
>              return false;
>          }
> +
> +        if (cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
> +            error_setg(errp, "Postcopy is not yet compatible with multifd");
> +            return false;
> +        }
>      }
>  
>      if (cap_list[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT]) {
> -- 
> 2.40.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


