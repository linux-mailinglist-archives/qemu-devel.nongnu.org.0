Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFF74C34BB
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 19:26:53 +0100 (CET)
Received: from localhost ([::1]:41410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNIpI-0002qL-H6
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 13:26:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nNInx-000203-Hs
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:25:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nNInq-0001F8-KL
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:25:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645727121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CKTylu+r9+7DPQYppfeq/wQ7KQRNwX3ZdF4ulIGzKdM=;
 b=etrdoUwBxoezsKqnp7puBsMJyAdryn3ppH1L7K+DtywcbESybE0ieQTKrnET1rOE/5rLVo
 Dvf3IvGMa1EVoZ7keMCe8vEaqct0Ysncxj5GA+BOSL8bEQak0E8Lbp+8UlhR6OOanNnTDG
 4IQhUT/TOzZqfc2XrOdHuRO8w9UB6po=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-QKbIY7GtOKyga1dq_ostlg-1; Thu, 24 Feb 2022 13:25:19 -0500
X-MC-Unique: QKbIY7GtOKyga1dq_ostlg-1
Received: by mail-wm1-f70.google.com with SMTP id
 f189-20020a1c38c6000000b0037d1bee4847so209101wma.9
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 10:25:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CKTylu+r9+7DPQYppfeq/wQ7KQRNwX3ZdF4ulIGzKdM=;
 b=GhmJUoLSJjKmET8Zhgv37qbZWugo75cROTRlO5hym4NfFOXuWrPzePa8sGOCHVBVux
 0CZiz76EkkXfS13WiYz+ZCsSrDZpdBaMGYMy0Wx72BwBP+WZKVgGCsyHIkEAOl7err0I
 ZdcFaAx1ucDZD+vfAPkUz0YrEVDSFccN0olQmgCQcwuUbnSsyl4h2j53a0fAXE45KiB9
 5s0RTzI/OnCuzFShYj3iPpeuPSdRNsRXTvZsALg6K7KinPSjzbWFb4cZxFTzxZaESIhU
 3aqOwhJfZkHDEHZpYaO3iPQt+1UKQB3RYxgzQnn6Fx0XT9x0YONmEDyjFzELWW7JsMza
 MczQ==
X-Gm-Message-State: AOAM531ze6iuHy/IUQgW9ZVQ3mCerIpSSjp62k8JawFCWU6yiUg5IEGX
 hmtt2ipSAtculcpzMR0pPcEczZWRZxtMoAYlZBYcb4OVW00nwywDU1Q2+daJYPTM3KTh5xRjzAY
 FP+TFjm7nfTkwHU8=
X-Received: by 2002:a05:600c:1c1a:b0:37b:ead2:8e6d with SMTP id
 j26-20020a05600c1c1a00b0037bead28e6dmr13002444wms.94.1645727118586; 
 Thu, 24 Feb 2022 10:25:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykzKQVjYZZlLymzKps6JXLMZDeF396ZqYoPK7uHUK+awn/vtkMOi2N8VHGTU+Iz5eAx+hW6Q==
X-Received: by 2002:a05:600c:1c1a:b0:37b:ead2:8e6d with SMTP id
 j26-20020a05600c1c1a00b0037bead28e6dmr13002420wms.94.1645727118375; 
 Thu, 24 Feb 2022 10:25:18 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 e22-20020adf9bd6000000b001eda1017861sm82992wrc.64.2022.02.24.10.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 10:25:17 -0800 (PST)
Date: Thu, 24 Feb 2022 18:25:15 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V7 04/29] migration: simplify savevm
Message-ID: <YhfNi9gPdmDcdTLK@work-vm>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-5-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1640199934-455149-5-git-send-email-steven.sistare@oracle.com>
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Steve Sistare (steven.sistare@oracle.com) wrote:
> Use qemu_file_open to simplify a few functions in savevm.c.
> No functional change.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>

So I think this is mostly OK, but a couple of minor tidyups below;
so with the tidies and the renames from the previous patch:

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/savevm.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 0bef031..c71d525 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2910,8 +2910,9 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
>  void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
>                                  Error **errp)
>  {
> +    const char *ioc_name = "migration-xen-save-state";
> +    int flags = O_WRONLY | O_CREAT | O_TRUNC;

I don't see why to take these (or the matching ones in load) as separate
variables; just keep them as is, and be parameters.

>      QEMUFile *f;
> -    QIOChannelFile *ioc;
>      int saved_vm_running;
>      int ret;
>  
> @@ -2925,14 +2926,10 @@ void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
>      vm_stop(RUN_STATE_SAVE_VM);
>      global_state_store_running();
>  
> -    ioc = qio_channel_file_new_path(filename, O_WRONLY | O_CREAT | O_TRUNC,
> -                                    0660, errp);
> -    if (!ioc) {
> +    f = qemu_file_open(filename, flags, 0660, ioc_name, errp);
> +    if (!f) {
>          goto the_end;
>      }
> -    qio_channel_set_name(QIO_CHANNEL(ioc), "migration-xen-save-state");
> -    f = qemu_fopen_channel_output(QIO_CHANNEL(ioc));
> -    object_unref(OBJECT(ioc));
>      ret = qemu_save_device_state(f);
>      if (ret < 0 || qemu_fclose(f) < 0) {
>          error_setg(errp, QERR_IO_ERROR);
> @@ -2960,8 +2957,8 @@ void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
>  
>  void qmp_xen_load_devices_state(const char *filename, Error **errp)
>  {
> +    const char *ioc_name = "migration-xen-load-state";
>      QEMUFile *f;
> -    QIOChannelFile *ioc;
>      int ret;
>  
>      /* Guest must be paused before loading the device state; the RAM state
> @@ -2973,14 +2970,10 @@ void qmp_xen_load_devices_state(const char *filename, Error **errp)
>      }
>      vm_stop(RUN_STATE_RESTORE_VM);
>  
> -    ioc = qio_channel_file_new_path(filename, O_RDONLY | O_BINARY, 0, errp);
> -    if (!ioc) {
> +    f = qemu_file_open(filename, O_RDONLY | O_BINARY, 0, ioc_name, errp);
> +    if (!f) {
>          return;
>      }
> -    qio_channel_set_name(QIO_CHANNEL(ioc), "migration-xen-load-state");
> -    f = qemu_fopen_channel_input(QIO_CHANNEL(ioc));
> -    object_unref(OBJECT(ioc));
> -
>      ret = qemu_loadvm_state(f);
>      qemu_fclose(f);
>      if (ret < 0) {
> -- 
> 1.8.3.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


