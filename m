Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFCE545151
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:54:29 +0200 (CEST)
Received: from localhost ([::1]:57120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKUO-0001qq-Oz
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzJdv-0004tb-Tj
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:00:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzJdt-0003SJ-Ka
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:00:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654786812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=udIdzfOpyAAmvYcOTpioYE/yhfH3wi+c6KDJJMoNDiw=;
 b=hkvDHreNW7I3CD0TGRDz5Xn2zaXkzwbJZkmzqFubmV74JjxvUdo4Orb7vb5yoM4dpY7kcW
 Fl//ECUCyAcd2tGBoMhZOLJocSCVa467upfWGWeb2XWrqeT7Gz4vDtHVuDnKb9rT+fjOIx
 DgQH7oCNxDHU5rjgACItZMVAoLb07L8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-to81PyvkOu6FC3LpAaFArQ-1; Thu, 09 Jun 2022 11:00:10 -0400
X-MC-Unique: to81PyvkOu6FC3LpAaFArQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 bw25-20020a0560001f9900b002175d64fd29so3770165wrb.9
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:00:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=udIdzfOpyAAmvYcOTpioYE/yhfH3wi+c6KDJJMoNDiw=;
 b=3HV1J38xi5/LbUjD9SlIsaBwAnCRG9anknWGujlTuJREq1APo2Csj8ukF0/vTvCINd
 fFMo8p4wExwytMBg9AY/vlKn8OEerTggOUZYolSA3PpvqrFECcWeuf4d0vek5FoDvu+n
 BxsbniNy3w+WW++Rj2UXhA79uujek89ItX/AWNeidtnk6y64DiVMxILyP2DN4dFVJWEY
 9b3V4KJ6DrK8W/xOdYxM8QIdK7U3PIcfLn0vYj6lM2+ChGw6iOVrs/bAmQNBSEmStxrK
 i+mwoZXhWEoSjjooUBpPrkgeF6D1mmWCnLbzXe6aHAQtez8Ipf4/NznniWtTSLLtHat+
 V9qg==
X-Gm-Message-State: AOAM531/yk8UUJfUKk8gFTq9p8uWhaFgHmefJc0VGV7FJx7xcxrFv409
 vkhX1FmQztrhRNcy/pzNiTvSUTRbdNZDQGdKLF4Hd/4ddeBxIavES/9kf8igJeeNql/30L683m+
 GFZ8VPcUbqvcWm8Y=
X-Received: by 2002:a5d:6da8:0:b0:218:510a:be9f with SMTP id
 u8-20020a5d6da8000000b00218510abe9fmr13913148wrs.352.1654786808572; 
 Thu, 09 Jun 2022 08:00:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwX5OC7SDzXA/ipuruYS1cW6TLedzaUs/atF0hhfW8HNIzx8HWcvjaukiMlosFZwoF5/Bgcug==
X-Received: by 2002:a5d:6da8:0:b0:218:510a:be9f with SMTP id
 u8-20020a5d6da8000000b00218510abe9fmr13913122wrs.352.1654786808348; 
 Thu, 09 Jun 2022 08:00:08 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 bi11-20020a05600c3d8b00b0039c3ecdca66sm19895229wmb.23.2022.06.09.08.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 08:00:07 -0700 (PDT)
Date: Thu, 9 Jun 2022 16:00:05 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 10/20] migration: stop passing 'opaque' parameter to
 QEMUFile hooks
Message-ID: <YqIK9Y2tW+PnBR7p@work-vm>
References: <20220524110235.145079-1-berrange@redhat.com>
 <20220524110235.145079-11-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220524110235.145079-11-berrange@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
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

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> The only user of the hooks is RDMA which provides a QIOChannel backed
> impl of QEMUFile. It can thus use the qemu_file_get_ioc() method.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/qemu-file.c |  8 ++++----
>  migration/qemu-file.h | 14 ++++++--------
>  migration/rdma.c      | 19 ++++++++++---------
>  3 files changed, 20 insertions(+), 21 deletions(-)
> 
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 9a7f715e17..6badc8b0ec 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -266,7 +266,7 @@ void ram_control_before_iterate(QEMUFile *f, uint64_t flags)
>      int ret = 0;
>  
>      if (f->hooks && f->hooks->before_ram_iterate) {
> -        ret = f->hooks->before_ram_iterate(f, f->opaque, flags, NULL);
> +        ret = f->hooks->before_ram_iterate(f, flags, NULL);
>          if (ret < 0) {
>              qemu_file_set_error(f, ret);
>          }
> @@ -278,7 +278,7 @@ void ram_control_after_iterate(QEMUFile *f, uint64_t flags)
>      int ret = 0;
>  
>      if (f->hooks && f->hooks->after_ram_iterate) {
> -        ret = f->hooks->after_ram_iterate(f, f->opaque, flags, NULL);
> +        ret = f->hooks->after_ram_iterate(f, flags, NULL);
>          if (ret < 0) {
>              qemu_file_set_error(f, ret);
>          }
> @@ -290,7 +290,7 @@ void ram_control_load_hook(QEMUFile *f, uint64_t flags, void *data)
>      int ret = -EINVAL;
>  
>      if (f->hooks && f->hooks->hook_ram_load) {
> -        ret = f->hooks->hook_ram_load(f, f->opaque, flags, data);
> +        ret = f->hooks->hook_ram_load(f, flags, data);
>          if (ret < 0) {
>              qemu_file_set_error(f, ret);
>          }
> @@ -310,7 +310,7 @@ size_t ram_control_save_page(QEMUFile *f, ram_addr_t block_offset,
>                               uint64_t *bytes_sent)
>  {
>      if (f->hooks && f->hooks->save_page) {
> -        int ret = f->hooks->save_page(f, f->opaque, block_offset,
> +        int ret = f->hooks->save_page(f, block_offset,
>                                        offset, size, bytes_sent);
>          if (ret != RAM_SAVE_CONTROL_NOT_SUPP) {
>              f->rate_limit_used += size;
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index 81f6fd7db8..6310071f90 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -65,11 +65,9 @@ typedef ssize_t (QEMUFileWritevBufferFunc)(void *opaque, struct iovec *iov,
>  /*
>   * This function provides hooks around different
>   * stages of RAM migration.
> - * 'opaque' is the backend specific data in QEMUFile
>   * 'data' is call specific data associated with the 'flags' value
>   */
> -typedef int (QEMURamHookFunc)(QEMUFile *f, void *opaque, uint64_t flags,
> -                              void *data);
> +typedef int (QEMURamHookFunc)(QEMUFile *f, uint64_t flags, void *data);
>  
>  /*
>   * Constants used by ram_control_* hooks
> @@ -84,11 +82,11 @@ typedef int (QEMURamHookFunc)(QEMUFile *f, void *opaque, uint64_t flags,
>   * This function allows override of where the RAM page
>   * is saved (such as RDMA, for example.)
>   */
> -typedef size_t (QEMURamSaveFunc)(QEMUFile *f, void *opaque,
> -                               ram_addr_t block_offset,
> -                               ram_addr_t offset,
> -                               size_t size,
> -                               uint64_t *bytes_sent);
> +typedef size_t (QEMURamSaveFunc)(QEMUFile *f,
> +                                 ram_addr_t block_offset,
> +                                 ram_addr_t offset,
> +                                 size_t size,
> +                                 uint64_t *bytes_sent);
>  
>  /*
>   * Return a QEMUFile for comms in the opposite direction
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 6e7756bee7..83265513d9 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -3256,11 +3256,11 @@ qio_channel_rdma_shutdown(QIOChannel *ioc,
>   *                  sent. Usually, this will not be more than a few bytes of
>   *                  the protocol because most transfers are sent asynchronously.
>   */
> -static size_t qemu_rdma_save_page(QEMUFile *f, void *opaque,
> +static size_t qemu_rdma_save_page(QEMUFile *f,
>                                    ram_addr_t block_offset, ram_addr_t offset,
>                                    size_t size, uint64_t *bytes_sent)
>  {
> -    QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(opaque);
> +    QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(qemu_file_get_ioc(f));
>      RDMAContext *rdma;
>      int ret;
>  
> @@ -3872,14 +3872,15 @@ rdma_block_notification_handle(QIOChannelRDMA *rioc, const char *name)
>      return 0;
>  }
>  
> -static int rdma_load_hook(QEMUFile *f, void *opaque, uint64_t flags, void *data)
> +static int rdma_load_hook(QEMUFile *f, uint64_t flags, void *data)
>  {
> +    QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(qemu_file_get_ioc(f));
>      switch (flags) {
>      case RAM_CONTROL_BLOCK_REG:
> -        return rdma_block_notification_handle(opaque, data);
> +        return rdma_block_notification_handle(rioc, data);
>  
>      case RAM_CONTROL_HOOK:
> -        return qemu_rdma_registration_handle(f, opaque);
> +        return qemu_rdma_registration_handle(f, rioc);
>  
>      default:
>          /* Shouldn't be called with any other values */
> @@ -3887,10 +3888,10 @@ static int rdma_load_hook(QEMUFile *f, void *opaque, uint64_t flags, void *data)
>      }
>  }
>  
> -static int qemu_rdma_registration_start(QEMUFile *f, void *opaque,
> +static int qemu_rdma_registration_start(QEMUFile *f,
>                                          uint64_t flags, void *data)
>  {
> -    QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(opaque);
> +    QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(qemu_file_get_ioc(f));
>      RDMAContext *rdma;
>  
>      RCU_READ_LOCK_GUARD();
> @@ -3916,10 +3917,10 @@ static int qemu_rdma_registration_start(QEMUFile *f, void *opaque,
>   * Inform dest that dynamic registrations are done for now.
>   * First, flush writes, if any.
>   */
> -static int qemu_rdma_registration_stop(QEMUFile *f, void *opaque,
> +static int qemu_rdma_registration_stop(QEMUFile *f,
>                                         uint64_t flags, void *data)
>  {
> -    QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(opaque);
> +    QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(qemu_file_get_ioc(f));
>      RDMAContext *rdma;
>      RDMAControlHeader head = { .len = 0, .repeat = 1 };
>      int ret = 0;
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


