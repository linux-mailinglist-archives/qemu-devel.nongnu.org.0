Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EA7551F07
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 16:38:11 +0200 (CEST)
Received: from localhost ([::1]:35238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3IXa-0007E8-Vy
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 10:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o3IVk-0004pv-75
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:36:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o3IVd-0003Dw-6s
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:36:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655735768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jdJvBY8bkfGlQVUnwV99yj6SHm2DSvgGWnxhAu2qZTM=;
 b=Cfl0s3mtUT9Pg5qKYwgDLYWTOhSKsZdIIcJc0q9Gu1T0NXEeSCcnlO2LCKkNYLf/0M2smt
 XZsg+I0LczDEO7y/vWkm0usnZ7TPn08jpD0vOGXz3J/YI3Kk39ohLGzSCQ1kTKXGEWHKC6
 GXID8jtn3xVK9B4hrcet0oTEpkUF7n8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-nlVH28rtPuuGm1IVEO8-kw-1; Mon, 20 Jun 2022 10:36:06 -0400
X-MC-Unique: nlVH28rtPuuGm1IVEO8-kw-1
Received: by mail-wr1-f69.google.com with SMTP id
 e21-20020adfa455000000b0021b80b12356so2027460wra.5
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 07:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=jdJvBY8bkfGlQVUnwV99yj6SHm2DSvgGWnxhAu2qZTM=;
 b=VJnZ5e8TvcHKsOW5tu/5CdLJvlmvaCXJVeh7va66+FQEY5MnHzzQwk+ehY8fsKCeME
 rPPVC4KAg+VIiRZIQQa4xodb38RWgLw71kQwqwjOXl6EcNVS+Iw+roh5+nuQBqfZVmit
 zqVdPfb38lxfJ0jwC+c7z2nHJvwMHqguOzi51JXmVU6i0UCPUdrHziY7EQCUVCdUR7te
 ewfsVmrBoqmkXcg2A0fqzhKL7A+yp2b7/pbGmLlkfQiBOW2hPEzYBHoz2W7XOyDBCUFr
 t6dY2lVWK5952yJtrwO+hh1rwh/7pc2EAuoXGvhHLf5q/9OQZ2/HN5hmikOgZB3CaQ7K
 hQBg==
X-Gm-Message-State: AJIora+Z8TxjU8iTErH5E0ApNXV1SJGx3mhPYs75UEUWQv034WDDlFZh
 UC2hpb39jHPcgOB95zqrhv5t02UwYLvqqlEm4KNwvPYt7aOFz0FsBnC6NAzdwK7aFe//hHyxVgz
 syyLMLR/lK1s3e4U=
X-Received: by 2002:a5d:6192:0:b0:219:aa98:897b with SMTP id
 j18-20020a5d6192000000b00219aa98897bmr22873572wru.341.1655735765589; 
 Mon, 20 Jun 2022 07:36:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sVEFhNFqol4//gzs3/DZagZYNchpa8LTww2gfbTONgyr/2Zh6/JbGeyOK6JdMdLT3S7/8JBg==
X-Received: by 2002:a5d:6192:0:b0:219:aa98:897b with SMTP id
 j18-20020a5d6192000000b00219aa98897bmr22873552wru.341.1655735765380; 
 Mon, 20 Jun 2022 07:36:05 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 n10-20020adffe0a000000b0021b5861eaf7sm10799869wrr.3.2022.06.20.07.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 07:36:04 -0700 (PDT)
Date: Mon, 20 Jun 2022 15:36:02 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Fam Zheng <fam@euphon.net>, Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: Re: [PATCH v2 08/21] migration: rename qemu_file_update_transfer to
 qemu_file_acct_rate_limit
Message-ID: <YrCF0kccOjpH+f9g@work-vm>
References: <20220620110205.1357829-1-berrange@redhat.com>
 <20220620110205.1357829-9-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220620110205.1357829-9-berrange@redhat.com>
User-Agent: Mutt/2.2.5 (2022-05-16)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> The qemu_file_update_transfer name doesn't give a clear guide on what
> its purpose is, and how it differs from the qemu_file_credit_transfer
> method. The latter is specifically for accumulating for total migration
> traffic, while the former is specifically for accounting in thue rate
> limit calculations. The new name give better guidance on its usage.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/multifd.c   | 4 ++--
>  migration/qemu-file.c | 2 +-
>  migration/qemu-file.h | 9 ++++++++-
>  3 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 9282ab6aa4..684c014c86 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -435,7 +435,7 @@ static int multifd_send_pages(QEMUFile *f)
>      p->pages = pages;
>      transferred = ((uint64_t) pages->num) * qemu_target_page_size()
>                  + p->packet_len;
> -    qemu_file_update_transfer(f, transferred);
> +    qemu_file_acct_rate_limit(f, transferred);
>      ram_counters.multifd_bytes += transferred;
>      ram_counters.transferred += transferred;
>      qemu_mutex_unlock(&p->mutex);
> @@ -610,7 +610,7 @@ int multifd_send_sync_main(QEMUFile *f)
>          p->packet_num = multifd_send_state->packet_num++;
>          p->flags |= MULTIFD_FLAG_SYNC;
>          p->pending_job++;
> -        qemu_file_update_transfer(f, p->packet_len);
> +        qemu_file_acct_rate_limit(f, p->packet_len);
>          ram_counters.multifd_bytes += p->packet_len;
>          ram_counters.transferred += p->packet_len;
>          qemu_mutex_unlock(&p->mutex);
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 9a7f715e17..6bbdb60d4d 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -704,7 +704,7 @@ void qemu_file_reset_rate_limit(QEMUFile *f)
>      f->rate_limit_used = 0;
>  }
>  
> -void qemu_file_update_transfer(QEMUFile *f, int64_t len)
> +void qemu_file_acct_rate_limit(QEMUFile *f, int64_t len)
>  {
>      f->rate_limit_used += len;
>  }
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index d96f5f7118..901f2cf697 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -188,7 +188,14 @@ void qemu_file_skip(QEMUFile *f, int size);
>   */
>  void qemu_file_credit_transfer(QEMUFile *f, size_t size);
>  void qemu_file_reset_rate_limit(QEMUFile *f);
> -void qemu_file_update_transfer(QEMUFile *f, int64_t len);
> +/*
> + * qemu_file_acct_rate_limit:
> + *
> + * Report on a number of bytes the have been transferred
> + * out of band from the main file object I/O methods, and
> + * need to be applied to the rate limiting calcuations
> + */
> +void qemu_file_acct_rate_limit(QEMUFile *f, int64_t len);
>  void qemu_file_set_rate_limit(QEMUFile *f, int64_t new_rate);
>  int64_t qemu_file_get_rate_limit(QEMUFile *f);
>  int qemu_file_get_error_obj(QEMUFile *f, Error **errp);
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


