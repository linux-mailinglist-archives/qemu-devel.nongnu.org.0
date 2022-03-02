Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC084CA602
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:30:14 +0100 (CET)
Received: from localhost ([::1]:37824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPP3S-0005EF-Ef
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:30:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPNpw-0000nh-Ve
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:12:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPNpq-00009S-Ag
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:12:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646223121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kshf8OR5vTSFRWNfOVeszpWf0Vu0+BHzhCzmmz2pbA8=;
 b=Wtnhcu4Tp35JfsLqokoyLIcVFmuGR/6/y4gUjmMcAhV9MIzMsBuNCs0LPcJXwrvEJzuh68
 uM/lJc7Jwb35WFjZcPLOECLdH0YX9v6cZaPKmZ6SOSqV98mU44kQat+2VWpl7B8IYa3HRX
 im7E8vOZpv9uoCDGsKKS1N7Nhewz3Z8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-vkAneFI8PfCUD3hz2QQXwQ-1; Wed, 02 Mar 2022 07:12:00 -0500
X-MC-Unique: vkAneFI8PfCUD3hz2QQXwQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 p35-20020a05600c1da300b0038151176781so762896wms.7
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 04:12:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Kshf8OR5vTSFRWNfOVeszpWf0Vu0+BHzhCzmmz2pbA8=;
 b=14lNwJawzhhTTOaQfUjlSxXS6e1GJQybFqxoJ91M78YtuZxsI2WvNvcWqAx/WonSGg
 IlDq2QvvOo24TuG5D/cgVQpobyVC/9zPxKPbSjAmnclZTG9CwKf0eFmEismfPtKgbVfG
 zzw9NlTeOHDNxgclfpq3azhtv9qDKJEy8g7xWhikdUbC/EpqG0JQnboIBYa2AY6h0+3i
 ME4qFpQO3E0K8paHXS/yOwRAND8uXocu7YBOlknQc4z0EWFgKh7U9bpbnkPGmovgoB73
 zT6QhutxdmU1o5FIJq/OHMrET7gj76Tq1R5nvDwsxcz4n7QV0+5MrjAvwFGjD/5j9dPN
 m0Kw==
X-Gm-Message-State: AOAM532MleqnYp22VkCF2vxn2So3PjdZY6HPxpVwHsuHoZsXfF3udPHd
 PPeye2tMVrHqbF4eneIvZrFEKPrVOAnj9+UTptvACIr8I3ODkw8XfAs6hpUAdTbS+VwRnc0rRda
 KnISJDu/4+BIR1Ak=
X-Received: by 2002:a5d:6d4e:0:b0:1e3:3636:b104 with SMTP id
 k14-20020a5d6d4e000000b001e33636b104mr23075300wri.605.1646223119043; 
 Wed, 02 Mar 2022 04:11:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzucvUR2ivMxULEc46Dfo/7XjgQT3qvz/nxxO2Y73Cj/sB6qgdikUHDbybexUVbmWD2FDZ0Q==
X-Received: by 2002:a5d:6d4e:0:b0:1e3:3636:b104 with SMTP id
 k14-20020a5d6d4e000000b001e33636b104mr23075286wri.605.1646223118773; 
 Wed, 02 Mar 2022 04:11:58 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 11-20020a05600c22cb00b00382a960b17csm3664842wmg.7.2022.03.02.04.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 04:11:58 -0800 (PST)
Date: Wed, 2 Mar 2022 12:11:56 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 25/25] tests: Pass in MigrateStart** into
 test_migrate_start()
Message-ID: <Yh9fDPV20SFNW5eU@work-vm>
References: <20220301083925.33483-1-peterx@redhat.com>
 <20220301083925.33483-26-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220301083925.33483-26-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> test_migrate_start() will release the MigrateStart structure that passed
> in, however that's not super clear to the caller because after the call
> returned the pointer can still be referenced by the callers.  It can easily
> be a source of use-after-free.
> 
> Let's pass in a double pointer of that, then we can safely clear the
> pointer for the caller after the struct is released.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tests/qtest/migration-test.c | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 09a9ce4401..67f0601988 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -496,7 +496,7 @@ static void migrate_start_destroy(MigrateStart *args)
>  }
>  
>  static int test_migrate_start(QTestState **from, QTestState **to,
> -                              const char *uri, MigrateStart *args)
> +                              const char *uri, MigrateStart **pargs)
>  {
>      g_autofree gchar *arch_source = NULL;
>      g_autofree gchar *arch_target = NULL;
> @@ -508,6 +508,7 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>      g_autofree char *shmem_path = NULL;
>      const char *arch = qtest_get_arch();
>      const char *machine_opts = NULL;
> +    MigrateStart *args = *pargs;
>      const char *memory_size;
>      int ret = 0;
>  
> @@ -622,6 +623,8 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>  
>  out:
>      migrate_start_destroy(args);
> +    /* This tells the caller that this structure is gone */
> +    *pargs = NULL;
>      return ret;
>  }
>  
> @@ -668,7 +671,7 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
>      bool postcopy_preempt = args->postcopy_preempt;
>      QTestState *from, *to;
>  
> -    if (test_migrate_start(&from, &to, uri, args)) {
> +    if (test_migrate_start(&from, &to, uri, &args)) {
>          return -1;
>      }
>  
> @@ -822,7 +825,7 @@ static void test_baddest(void)
>  
>      args->hide_stderr = true;
>  
> -    if (test_migrate_start(&from, &to, "tcp:127.0.0.1:0", args)) {
> +    if (test_migrate_start(&from, &to, "tcp:127.0.0.1:0", &args)) {
>          return;
>      }
>      migrate_qmp(from, "tcp:127.0.0.1:0", "{}");
> @@ -838,7 +841,7 @@ static void test_precopy_unix_common(bool dirty_ring)
>  
>      args->use_dirty_ring = dirty_ring;
>  
> -    if (test_migrate_start(&from, &to, uri, args)) {
> +    if (test_migrate_start(&from, &to, uri, &args)) {
>          return;
>      }
>  
> @@ -926,7 +929,7 @@ static void test_xbzrle(const char *uri)
>      MigrateStart *args = migrate_start_new();
>      QTestState *from, *to;
>  
> -    if (test_migrate_start(&from, &to, uri, args)) {
> +    if (test_migrate_start(&from, &to, uri, &args)) {
>          return;
>      }
>  
> @@ -980,7 +983,7 @@ static void test_precopy_tcp(void)
>      g_autofree char *uri = NULL;
>      QTestState *from, *to;
>  
> -    if (test_migrate_start(&from, &to, "tcp:127.0.0.1:0", args)) {
> +    if (test_migrate_start(&from, &to, "tcp:127.0.0.1:0", &args)) {
>          return;
>      }
>  
> @@ -1025,7 +1028,7 @@ static void test_migrate_fd_proto(void)
>      QDict *rsp;
>      const char *error_desc;
>  
> -    if (test_migrate_start(&from, &to, "defer", args)) {
> +    if (test_migrate_start(&from, &to, "defer", &args)) {
>          return;
>      }
>  
> @@ -1105,7 +1108,7 @@ static void do_test_validate_uuid(MigrateStart *args, bool should_fail)
>      g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
>      QTestState *from, *to;
>  
> -    if (test_migrate_start(&from, &to, uri, args)) {
> +    if (test_migrate_start(&from, &to, uri, &args)) {
>          return;
>      }
>  
> @@ -1197,7 +1200,7 @@ static void test_migrate_auto_converge(void)
>       */
>      const int64_t expected_threshold = max_bandwidth * downtime_limit / 1000;
>  
> -    if (test_migrate_start(&from, &to, uri, args)) {
> +    if (test_migrate_start(&from, &to, uri, &args)) {
>          return;
>      }
>  
> @@ -1266,7 +1269,7 @@ static void test_multifd_tcp(const char *method)
>      QDict *rsp;
>      g_autofree char *uri = NULL;
>  
> -    if (test_migrate_start(&from, &to, "defer", args)) {
> +    if (test_migrate_start(&from, &to, "defer", &args)) {
>          return;
>      }
>  
> @@ -1352,7 +1355,7 @@ static void test_multifd_tcp_cancel(void)
>  
>      args->hide_stderr = true;
>  
> -    if (test_migrate_start(&from, &to, "defer", args)) {
> +    if (test_migrate_start(&from, &to, "defer", &args)) {
>          return;
>      }
>  
> @@ -1391,7 +1394,7 @@ static void test_multifd_tcp_cancel(void)
>      args = migrate_start_new();
>      args->only_target = true;
>  
> -    if (test_migrate_start(&from, &to2, "defer", args)) {
> +    if (test_migrate_start(&from, &to2, "defer", &args)) {
>          return;
>      }
>  
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


