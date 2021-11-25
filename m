Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 748AC45E0BD
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 19:52:41 +0100 (CET)
Received: from localhost ([::1]:44524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqJrM-0005Yj-0v
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 13:52:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mqJq1-00043p-Cd
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 13:51:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mqJpx-0000Ud-H9
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 13:51:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637866271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xT3FCGTBbVylmCPEQieLfirE9GwWXCGigOti7eMSZfM=;
 b=ipvI2HQF+MdNeLXDWsqOqodkGk9JE2Yhn9yq1/5hVgVDSUiLO4Nmvoy5nxxyxMAyuY7m3Q
 o3qxtWR3IfmyJ2yyAg+Tu87oHJSmb+KE8HAqR4f5SYu7mHTiT+HIzFK/YNsEfqJ9/5+KBq
 DhD651a+BeYrHHnc7lBFn61AyvF0mA8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-sfDGA9XlM-eDyNbr5djuYw-1; Thu, 25 Nov 2021 13:51:10 -0500
X-MC-Unique: sfDGA9XlM-eDyNbr5djuYw-1
Received: by mail-wm1-f69.google.com with SMTP id
 a85-20020a1c7f58000000b0033ddc0eacc8so3528529wmd.9
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 10:51:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xT3FCGTBbVylmCPEQieLfirE9GwWXCGigOti7eMSZfM=;
 b=8Av5yJN47SM+1F5bk41ubgmYG2ktHBszm9yO9Knwmij6Uue/9rYuceDAU8RQZsSVdW
 OaF5XQBe404oEZbCm4UIaSQ8VvkWJHvKdWJsD0plJ6Yav9tJBIGD1VnOUrHbcHXVXAa0
 aoAEww+bBgFUDIGtrpvADnzfOKMjQl3FIvCaa9g7Npr//Dp7n9UHUDLF89t4B+6aEX/L
 uA6f747r07ucY0rxi3AR7qBebhEPnugGqMrUciH/ga/UW/pzv+NVfGKgqe9Oj9puSXLW
 fIVMi/14kgQOONsY8PGN2BMnBMDMYO8i2r9QgzrlFrESzpiC3SP2ZAil9HU4iU5qs9LW
 x3jQ==
X-Gm-Message-State: AOAM533JCcl7+Rvn6dLUgAmSUtu40gUT9nAcpfinceAkh4+hmqDWVIgl
 RJFxkU3c5DoQlRtcDgIMg8wV68cgI29UoVJpX+xX4ZH5cSA34vBwIeZc3+2Hv9fkKg+s2sH2UDM
 TCIkSRshnUeIRfhE=
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr9920805wmh.104.1637866269407; 
 Thu, 25 Nov 2021 10:51:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw72hdaT5Gsk7iqB4g43BWXzVlE4N7xs8eln0a2UB3wR/Qok025yfWYAElX9sD4txnLhlsTAQ==
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr9920773wmh.104.1637866269129; 
 Thu, 25 Nov 2021 10:51:09 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id p19sm4653061wmq.4.2021.11.25.10.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 10:51:08 -0800 (PST)
Date: Thu, 25 Nov 2021 18:51:06 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 06/23] multifd: remove used parameter from
 send_prepare() method
Message-ID: <YZ/bGrZfHKvYwvND@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-7-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124100617.19786-7-quintela@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> It is already there as p->pages->num.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/multifd.h      | 2 +-
>  migration/multifd-zlib.c | 7 +++----
>  migration/multifd-zstd.c | 7 +++----
>  migration/multifd.c      | 9 +++------
>  4 files changed, 10 insertions(+), 15 deletions(-)
> 
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 86820dd028..7968cc5c20 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -159,7 +159,7 @@ typedef struct {
>      /* Cleanup for sending side */
>      void (*send_cleanup)(MultiFDSendParams *p, Error **errp);
>      /* Prepare the send packet */
> -    int (*send_prepare)(MultiFDSendParams *p, uint32_t used, Error **errp);
> +    int (*send_prepare)(MultiFDSendParams *p, Error **errp);
>      /* Write the send packet */
>      int (*send_write)(MultiFDSendParams *p, uint32_t used, Error **errp);
>      /* Setup for receiving side */
> diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
> index d0437cce2a..28f0ed933b 100644
> --- a/migration/multifd-zlib.c
> +++ b/migration/multifd-zlib.c
> @@ -94,10 +94,9 @@ static void zlib_send_cleanup(MultiFDSendParams *p, Error **errp)
>   * Returns 0 for success or -1 for error
>   *
>   * @p: Params for the channel that we are using
> - * @used: number of pages used
>   * @errp: pointer to an error
>   */
> -static int zlib_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
> +static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
>  {
>      struct iovec *iov = p->pages->iov;
>      struct zlib_data *z = p->data;
> @@ -106,11 +105,11 @@ static int zlib_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
>      int ret;
>      uint32_t i;
>  
> -    for (i = 0; i < used; i++) {
> +    for (i = 0; i < p->pages->num; i++) {
>          uint32_t available = z->zbuff_len - out_size;
>          int flush = Z_NO_FLUSH;
>  
> -        if (i == used - 1) {
> +        if (i == p->pages->num - 1) {
>              flush = Z_SYNC_FLUSH;
>          }
>  
> diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
> index 09ae1cf91a..4a71e96e06 100644
> --- a/migration/multifd-zstd.c
> +++ b/migration/multifd-zstd.c
> @@ -107,10 +107,9 @@ static void zstd_send_cleanup(MultiFDSendParams *p, Error **errp)
>   * Returns 0 for success or -1 for error
>   *
>   * @p: Params for the channel that we are using
> - * @used: number of pages used
>   * @errp: pointer to an error
>   */
> -static int zstd_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
> +static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
>  {
>      struct iovec *iov = p->pages->iov;
>      struct zstd_data *z = p->data;
> @@ -121,10 +120,10 @@ static int zstd_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
>      z->out.size = z->zbuff_len;
>      z->out.pos = 0;
>  
> -    for (i = 0; i < used; i++) {
> +    for (i = 0; i < p->pages->num; i++) {
>          ZSTD_EndDirective flush = ZSTD_e_continue;
>  
> -        if (i == used - 1) {
> +        if (i == p->pages->num - 1) {
>              flush = ZSTD_e_flush;
>          }
>          z->in.src = iov[i].iov_base;
> diff --git a/migration/multifd.c b/migration/multifd.c
> index ce7101cf9d..098ef8842c 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -82,13 +82,11 @@ static void nocomp_send_cleanup(MultiFDSendParams *p, Error **errp)
>   * Returns 0 for success or -1 for error
>   *
>   * @p: Params for the channel that we are using
> - * @used: number of pages used
>   * @errp: pointer to an error
>   */
> -static int nocomp_send_prepare(MultiFDSendParams *p, uint32_t used,
> -                               Error **errp)
> +static int nocomp_send_prepare(MultiFDSendParams *p, Error **errp)
>  {
> -    p->next_packet_size = used * qemu_target_page_size();
> +    p->next_packet_size = p->pages->num * qemu_target_page_size();
>      p->flags |= MULTIFD_FLAG_NOCOMP;
>      return 0;
>  }
> @@ -654,8 +652,7 @@ static void *multifd_send_thread(void *opaque)
>              uint32_t flags = p->flags;
>  
>              if (used) {
> -                ret = multifd_send_state->ops->send_prepare(p, used,
> -                                                            &local_err);
> +                ret = multifd_send_state->ops->send_prepare(p, &local_err);
>                  if (ret != 0) {
>                      qemu_mutex_unlock(&p->mutex);
>                      break;
> -- 
> 2.33.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


