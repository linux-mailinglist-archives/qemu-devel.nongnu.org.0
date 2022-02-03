Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8EF4A881E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 16:56:32 +0100 (CET)
Received: from localhost ([::1]:46380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFeTG-0005Aa-Nf
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 10:56:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFeR0-0004Ro-3O
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 10:54:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFeQw-0007Wr-5T
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 10:54:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643903644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p/Ccp5OgkdqJWOMv0DdGinosaNMWZKK1FU8nlEI+Lv0=;
 b=Mg4ikIL7dnSS2ALGTO1hmKDtuQkZfZz+2YELDLUxiJc56FUCr7DGKSEBsXar5o65/hquzO
 kUzHSRelVtn8uxoMPJfHnnA0z42I+6NlDBmD1Anq27Z25psLNjsWwm9P1TCjjRRhvtMVG7
 yX4SpDsZnY9asvsMAcdCRX83dhnAX8w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-P2dRqskFNAWEOITRkkQVdQ-1; Thu, 03 Feb 2022 10:54:03 -0500
X-MC-Unique: P2dRqskFNAWEOITRkkQVdQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 r27-20020adfb1db000000b001d7567e33baso822839wra.12
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 07:54:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=p/Ccp5OgkdqJWOMv0DdGinosaNMWZKK1FU8nlEI+Lv0=;
 b=ex6Ub58EamJxH6R7rodD6rILEbrKte/ZSekaNYvPeQOzXZMtsCKQ0f7y/o/DuoCFNc
 G4B4JoaduIRRPlyaexDA/1ElnTwbXc/CcbLMq9jOgopPiEQhXJeD+vfYSiAm7JkuNxH4
 OhN5esomeYevcJTWJt+J6Y/diA9Td+e4UuIre6EaB9MZY8O2XV2/inctXua0TQERf5Ly
 8PB6FhwxXnec1XdEFmpvA9wtTTgCALI/rkg9zNZ6+TDx3hRV/NdCUwKmcsOmY/e0mWyR
 HCEOKz/m5Z+2jQmHseocwmuN/BcLlWJgawsR/Uetn1zXBrUwoJ+WbypX2xZbRMXISVLo
 fX+w==
X-Gm-Message-State: AOAM530Rs1e3dZ12PL7+YUJZ+BoUZB4hNWejFAyYwRGuHmZD+zbq0qpK
 OfEVJt9C7oHNB8N7+RJ/5lUUVQyrruSYfs/e0EXjNtrcuh2xoD2nMM31kaoih7zTAtZv794u5nH
 Ynx2bS63G2cLYwcc=
X-Received: by 2002:a05:6000:170c:: with SMTP id
 n12mr30597533wrc.380.1643903642039; 
 Thu, 03 Feb 2022 07:54:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4SjtubNqSejzieNM/AudpAwxdm22k7tgN2r7xereb3Ca4tkvMy3XkF665Uu3soqa9FqweNQ==
X-Received: by 2002:a05:6000:170c:: with SMTP id
 n12mr30597521wrc.380.1643903641894; 
 Thu, 03 Feb 2022 07:54:01 -0800 (PST)
Received: from work-vm (82-132-239-190.dab.02.net. [82.132.239.190])
 by smtp.gmail.com with ESMTPSA id n10sm26387862wrf.96.2022.02.03.07.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 07:54:01 -0800 (PST)
Date: Thu, 3 Feb 2022 15:53:59 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 15/15] tests: Add postcopy preempt test
Message-ID: <Yfv6l7m+sECyMdqe@work-vm>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-16-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220119080929.39485-16-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tests/qtest/migration-test.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 7b42f6fd90..93ff43bb3f 100644
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
> @@ -719,6 +725,20 @@ static void test_postcopy(void)
>      migrate_postcopy_complete(from, to);
>  }
>  
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
>  static void test_postcopy_recovery(void)
>  {
>      MigrateStart *args = migrate_start_new();
> @@ -1458,6 +1478,7 @@ int main(int argc, char **argv)
>      module_call_init(MODULE_INIT_QOM);
>  
>      qtest_add_func("/migration/postcopy/unix", test_postcopy);
> +    qtest_add_func("/migration/postcopy/preempt", test_postcopy_preempt);
>      qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
>      qtest_add_func("/migration/bad_dest", test_baddest);
>      qtest_add_func("/migration/precopy/unix", test_precopy_unix);
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


