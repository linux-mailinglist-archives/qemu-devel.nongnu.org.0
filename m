Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683A84BF87A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 13:57:25 +0100 (CET)
Received: from localhost ([::1]:36132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMUjL-00024G-LY
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 07:57:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMUeL-0000uf-T6
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 07:52:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMUeH-0008Pt-PG
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 07:52:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645534327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W7ElI3grEr0PYWSxl9Yx4xe8lFimWrLAXdDDXGXsodc=;
 b=HR3Izmx0DNJXC3aALlSuFZv/jZ6uoVXZUMaOHBAKoHwLm7eIvGAywInFssGK5qVn9WByQD
 YVT408oxzIdTOR+NKB9ajaF6HGAWinuYiti3DGntnWjg5lppfulyjmZhNhdWiziyadFyKJ
 X0BLHWVD7+KUde1ZhAfIyxAtnB2Wdeo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-Nh5nuqiaOOia36-_d1Se5g-1; Tue, 22 Feb 2022 07:52:06 -0500
X-MC-Unique: Nh5nuqiaOOia36-_d1Se5g-1
Received: by mail-wr1-f71.google.com with SMTP id
 h24-20020adfaa98000000b001e33eb81e71so8923824wrc.9
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 04:52:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=W7ElI3grEr0PYWSxl9Yx4xe8lFimWrLAXdDDXGXsodc=;
 b=AFIUWqqpIbMpQTQt1Cn4ZRdbyatj/Fx35e9vWfRsI8I4gIRgcq1KR7piTkJQSYr5E7
 rMNHRtHbprqEVRmOZCYHkk8A8ABwenyfVUMH+l+ewRfbH0UQezSQFsLj+LqAbe3yshaz
 +n+lbY8yZmAbcGE1VzWkProwi9NQciORJz/U6cVBcyfP6kmyI1I8FSPbO8ReeFMEitSB
 Vh4C8hvs0aWmU5RA1qoZcu2cpqLhWlMj8rOoFaFh1m4+JOgPL7osF0t5cqlAdYkUA1xL
 7rDsoxmZpSAGSd/RXpfI8tcMJdyEOpwENNNblYsa1sfCJuCnkkrVpgauv4C6xZuAs3ZG
 37qg==
X-Gm-Message-State: AOAM531B+HmcZH5vuBkdAcUEkNllZRRJUQfpyLW+Pb2deZwrnImHDiMC
 6HaYexaH5N9BDTcmvHO4vNpVId0QlzyDSA5Wq/sbd47LvMWp6AKmjBOnW37C/A8+/BYvxy27L43
 mJUFXdPT6Fl+cdcM=
X-Received: by 2002:a5d:59ab:0:b0:1e3:2576:215 with SMTP id
 p11-20020a5d59ab000000b001e325760215mr19848826wrr.496.1645534325337; 
 Tue, 22 Feb 2022 04:52:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+Vr3qChVOZecl/TQUfRpNVdbyNTSjVzira9SJKV4GfbOBUZys8SnXAp0SgDfRS2LR113uYQ==
X-Received: by 2002:a5d:59ab:0:b0:1e3:2576:215 with SMTP id
 p11-20020a5d59ab000000b001e325760215mr19848805wrr.496.1645534325063; 
 Tue, 22 Feb 2022 04:52:05 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id c17sm2237848wmh.31.2022.02.22.04.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 04:52:01 -0800 (PST)
Date: Tue, 22 Feb 2022 12:51:59 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 20/20] tests: Add postcopy preempt test
Message-ID: <YhTcb9o1d1gCQ3rm@work-vm>
References: <20220216062809.57179-1-peterx@redhat.com>
 <20220216062809.57179-21-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220216062809.57179-21-peterx@redhat.com>
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> Two tests are added: a normal postcopy preempt test, and a recovery test.

Yes, this is difficult; without hugepages the tests are limited; did you
see if this test actually causes pages to go down the fast path?



Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  tests/qtest/migration-test.c | 39 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 7b42f6fd90..5053b40589 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -470,6 +470,7 @@ typedef struct {
>       */
>      bool hide_stderr;
>      bool use_shmem;
> +    bool postcopy_preempt;
>      /* only launch the target process */
>      bool only_target;
>      /* Use dirty ring if true; dirty logging otherwise */
> @@ -673,6 +674,11 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
>      migrate_set_capability(to, "postcopy-ram", true);
>      migrate_set_capability(to, "postcopy-blocktime", true);
>  
> +    if (args->postcopy_preempt) {
> +        migrate_set_capability(from, "postcopy-preempt", true);
> +        migrate_set_capability(to, "postcopy-preempt", true);
> +    }
> +
>      /* We want to pick a speed slow enough that the test completes
>       * quickly, but that it doesn't complete precopy even on a slow
>       * machine, so also set the downtime.
> @@ -719,13 +725,29 @@ static void test_postcopy(void)
>      migrate_postcopy_complete(from, to);
>  }
>  
> -static void test_postcopy_recovery(void)
> +static void test_postcopy_preempt(void)
> +{
> +    MigrateStart *args = migrate_start_new();
> +    QTestState *from, *to;
> +
> +    args->postcopy_preempt = true;
> +
> +    if (migrate_postcopy_prepare(&from, &to, args)) {
> +        return;
> +    }
> +    migrate_postcopy_start(from, to);
> +    migrate_postcopy_complete(from, to);
> +}
> +
> +/* @preempt: whether to use postcopy-preempt */
> +static void test_postcopy_recovery(bool preempt)
>  {
>      MigrateStart *args = migrate_start_new();
>      QTestState *from, *to;
>      g_autofree char *uri = NULL;
>  
>      args->hide_stderr = true;
> +    args->postcopy_preempt = preempt;
>  
>      if (migrate_postcopy_prepare(&from, &to, args)) {
>          return;
> @@ -781,6 +803,16 @@ static void test_postcopy_recovery(void)
>      migrate_postcopy_complete(from, to);
>  }
>  
> +static void test_postcopy_recovery_normal(void)
> +{
> +    test_postcopy_recovery(false);
> +}
> +
> +static void test_postcopy_recovery_preempt(void)
> +{
> +    test_postcopy_recovery(true);
> +}
> +
>  static void test_baddest(void)
>  {
>      MigrateStart *args = migrate_start_new();
> @@ -1458,7 +1490,10 @@ int main(int argc, char **argv)
>      module_call_init(MODULE_INIT_QOM);
>  
>      qtest_add_func("/migration/postcopy/unix", test_postcopy);
> -    qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
> +    qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery_normal);
> +    qtest_add_func("/migration/postcopy/preempt/unix", test_postcopy_preempt);
> +    qtest_add_func("/migration/postcopy/preempt/recovery",
> +                   test_postcopy_recovery_preempt);
>      qtest_add_func("/migration/bad_dest", test_baddest);
>      qtest_add_func("/migration/precopy/unix", test_precopy_unix);
>      qtest_add_func("/migration/precopy/tcp", test_precopy_tcp);
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


