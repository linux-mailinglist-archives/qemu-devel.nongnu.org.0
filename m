Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB14A5439EA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 19:08:23 +0200 (CEST)
Received: from localhost ([::1]:44032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyzAM-0005zG-8J
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 13:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nyz7u-0004fu-0O
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 13:05:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nyz7p-0002Gb-Mi
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 13:05:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654707944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RBPUMwmh0JKnBnb2yTEuUczXvGtgtx64GVa9F2GpfoU=;
 b=c++N+ZghrALqsUoCTNGaBW0Y4/5tB8u2AT8Qx4txpVmOpQE1jOJb06/P19KgyV1ALiCPG0
 LftGZfhKxUFeUtOGho6BUwc4kdRImgrtEaQcseTRvHzGmDGcZYmtKVfh7K00rwjailHtQ1
 g6SFL4/WzNFAr8XXLvOIeba1kHv1GBU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-ExOMJnjtNr6bALE2b2WjhA-1; Wed, 08 Jun 2022 13:05:33 -0400
X-MC-Unique: ExOMJnjtNr6bALE2b2WjhA-1
Received: by mail-wm1-f72.google.com with SMTP id
 o3-20020a05600c510300b0039743540ac7so7168173wms.5
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 10:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RBPUMwmh0JKnBnb2yTEuUczXvGtgtx64GVa9F2GpfoU=;
 b=bPB0bRshIVWVBe4OATppSAzBFD2o8T7M9u3Ag6viTqTrxphIT8OetjqzAcEYYoPieu
 hR40X1lk/vWF+6KWkL+ZWCkAnrcp+xlMuiaISBVbir8CSEaM8T1D32B+7a8n+DtHbs7m
 Gtuk2BtL9oXYtsS8zYR3mBen0pmMSft1CGmu3MUwR9N2cJrSXt+qpEbghZIGJ79fYupZ
 vu90GBr4SSdtWTlsgsbLOHVBZ739TdropZmHtYrub1MPkUHoCG9fC7jdz3Kbf31YqlEl
 l0zpHlihhOT9YK4yqgpQ3UtGHwAATwsDGVKE/TKKtAr6mlfM8yM53mdwFfuvwYt8B9yW
 3bqg==
X-Gm-Message-State: AOAM532kVWPLXoZrZ1HnE94O3AiyMqJF3kyI3GmVN8W4dS+epNqvZZ3K
 13ftCU1cqO0k+xaUQKcbXgFwkEc5iQF6Wy8jyUSJGx/0OXidItrgcs5bjqO/lJb90OV0qGhcSpU
 gglTXr4TY/r3BYNM=
X-Received: by 2002:a05:600c:42c9:b0:39c:3808:5479 with SMTP id
 j9-20020a05600c42c900b0039c38085479mr226161wme.4.1654707932034; 
 Wed, 08 Jun 2022 10:05:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+92eBxo59gUTPtkGwSamQ0frRPta2bgWTU5kyHIFOm6EO9xtM8l5ZvWWSITU2pnKwNvFEkg==
X-Received: by 2002:a05:600c:42c9:b0:39c:3808:5479 with SMTP id
 j9-20020a05600c42c900b0039c38085479mr226127wme.4.1654707931727; 
 Wed, 08 Jun 2022 10:05:31 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 c186-20020a1c35c3000000b0039bc95cf4b2sm24780569wma.11.2022.06.08.10.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 10:05:31 -0700 (PDT)
Date: Wed, 8 Jun 2022 18:05:28 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH RFC 4/5] cpu: Allow cpu_synchronize_all_post_init() to
 take an errp
Message-ID: <YqDW2AZDb3buF9YQ@work-vm>
References: <20220607230645.53950-1-peterx@redhat.com>
 <20220607230645.53950-5-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607230645.53950-5-peterx@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Peter Xu (peterx@redhat.com) wrote:
> Allow cpu_synchronize_all_post_init() to fail with an errp when it's set.
> Modify both precopy and postcopy to try to detect such error.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  hw/core/machine.c     |  2 +-
>  include/sysemu/cpus.h |  2 +-
>  migration/savevm.c    | 20 +++++++++++++++++---
>  softmmu/cpus.c        |  2 +-
>  4 files changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index c53548d0b1..b5daad82f8 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1447,7 +1447,7 @@ void qemu_remove_machine_init_done_notifier(Notifier *notify)
>  
>  void qdev_machine_creation_done(void)
>  {
> -    cpu_synchronize_all_post_init();
> +    cpu_synchronize_all_post_init(NULL);
>  
>      if (current_machine->boot_config.has_once) {
>          qemu_boot_set(current_machine->boot_config.once, &error_fatal);
> diff --git a/include/sysemu/cpus.h b/include/sysemu/cpus.h
> index b5c87d48b3..a51ee46441 100644
> --- a/include/sysemu/cpus.h
> +++ b/include/sysemu/cpus.h
> @@ -45,7 +45,7 @@ bool cpus_are_resettable(void);
>  
>  void cpu_synchronize_all_states(void);
>  void cpu_synchronize_all_post_reset(void);
> -void cpu_synchronize_all_post_init(void);
> +void cpu_synchronize_all_post_init(Error **errp);
>  void cpu_synchronize_all_pre_loadvm(void);
>  
>  #ifndef CONFIG_USER_ONLY
> diff --git a/migration/savevm.c b/migration/savevm.c
> index d9076897b8..1175ddefd4 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2005,7 +2005,17 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
>      /* TODO we should move all of this lot into postcopy_ram.c or a shared code
>       * in migration.c
>       */
> -    cpu_synchronize_all_post_init();
> +    cpu_synchronize_all_post_init(&local_err);
> +    if (local_err) {
> +        /*
> +         * TODO: a better way to do this is to tell the src that we cannot
> +         * run the VM here so hopefully we can keep the VM running on src
> +         * and immediately halt the switch-over.  But that needs work.

Yes, I think it is possible; unlike some of the later errors in the same
function, in this case we know no disks/network/etc have been touched,
so we should be able to recover.
I wonder if we can move the postcopy_state_set(POSTCOPY_INCOMING_RUNNING)
out of loadvm_postcopy_handle_run to after this point.

We've already got the return path, so we should be able to signal the
failure unless we're very unlucky.

Dave

> +         */
> +        error_report_err(local_err);
> +        local_err = NULL;
> +        autostart = false;
> +    }
>  
>      trace_loadvm_postcopy_handle_run_bh("after cpu sync");
>  
> @@ -2772,7 +2782,11 @@ int qemu_loadvm_state(QEMUFile *f)
>      }
>  
>      qemu_loadvm_state_cleanup();
> -    cpu_synchronize_all_post_init();
> +    cpu_synchronize_all_post_init(&local_err);
> +    if (local_err) {
> +        error_report_err(local_err);
> +        return -EINVAL;
> +    }
>  
>      return ret;
>  }
> @@ -2789,7 +2803,7 @@ int qemu_load_device_state(QEMUFile *f)
>          return ret;
>      }
>  
> -    cpu_synchronize_all_post_init();
> +    cpu_synchronize_all_post_init(NULL);
>      return 0;
>  }
>  
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index 464c06201c..59c70fd496 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -146,7 +146,7 @@ void cpu_synchronize_all_post_reset(void)
>      }
>  }
>  
> -void cpu_synchronize_all_post_init(void)
> +void cpu_synchronize_all_post_init(Error **errp)
>  {
>      CPUState *cpu;
>  
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


