Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934EE6804DC
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 05:20:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMLe0-00026A-Hr; Sun, 29 Jan 2023 23:19:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMLdy-000260-84
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:19:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMLdw-00022c-U7
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:19:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675052384;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=qkT3n8tEjcNdQCywbNeSzrnLa56SPimSlJng5fFP5AI=;
 b=hIK3Sy8Sc7RF3XeVrDrzsDg96JG9NoGGLmHwVRl9yN5PNMLMkC9OI9HHhda4euQsrMAVDY
 NY5K8zYbngXC+2JbrIno6MSeBQSbq9mbBwPudusOTaxlxPFvNXRXkJJWXjGx2C1R9BG42V
 B4lqLutpDfYofEf3cQ+o5r+iUoFVNZU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-sGjdi8U-N-2zMCWtZzZSRQ-1; Sun, 29 Jan 2023 23:19:43 -0500
X-MC-Unique: sGjdi8U-N-2zMCWtZzZSRQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l23-20020a7bc457000000b003db0cb8e543so3772885wmi.3
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 20:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qkT3n8tEjcNdQCywbNeSzrnLa56SPimSlJng5fFP5AI=;
 b=ju/BHdi0MOWoGf0+NIYxAsN4oPcsIpe5vMo3lAULwGB7kKcjNGl8FIVNDIcmX+to7a
 jETZ0J4Vn8rqHe8UVACtVqoIUWd1ZxnbrrLdIRnMdHzIgHlbjEckt2lsjIf3qiuvBYQE
 8CuPAZdj2bbes9QuAfJNHgSiVF4F3v2d9bYZRpGEipC4SVd5D5ztEsYb0CGVoy92qqbH
 WBUZvdX25mks1C+KOT0SsF5yr82B1Fb5TAgxvsTn8r2iTpn1kxkhAqofeGYQPBISFT1E
 PegnEj0wT/8EBS+okHx8z2sgD1nE/jso8jOTb/iaKlFG4aeCzTxDgPEOQ6EcB1hf3xHL
 O3BQ==
X-Gm-Message-State: AO0yUKXRNh5YC2fvuf6FZlrtHqioqdgGiEUbEQQO3rwapIiwxYq64ol/
 +7tUPbFuCyoDL38JXcSZt6mVrQmdExVwPwZHio9gTXB7ZGR9KVbxDyPPlY6bU6ocj7tBbX2Yt6g
 ZzF1E+MEKf8klgXk=
X-Received: by 2002:adf:f907:0:b0:2bf:c31b:1922 with SMTP id
 b7-20020adff907000000b002bfc31b1922mr11009790wrr.3.1675052381920; 
 Sun, 29 Jan 2023 20:19:41 -0800 (PST)
X-Google-Smtp-Source: AK7set/nEzxSOLhWGW60nxveeW6CZsCdAuyaWYsdYkaGxGNBf8n1WJQ3kwRvShg26fKbZpVQFJXdCQ==
X-Received: by 2002:adf:f907:0:b0:2bf:c31b:1922 with SMTP id
 b7-20020adff907000000b002bfc31b1922mr11009786wrr.3.1675052381733; 
 Sun, 29 Jan 2023 20:19:41 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 v11-20020adff68b000000b002bfb8f829eesm10506566wrp.71.2023.01.29.20.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:19:40 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Jiang Jiacheng <jiangjiacheng@huawei.com>
Cc: <qemu-devel@nongnu.org>,  <berrange@redhat.com>,  <dgilbert@redhat.com>,
 <yubihong@huawei.com>,  <xiexiangyou@huawei.com>,
 <zhengchuan@huawei.com>,  <linyilu@huawei.com>
Subject: Re: [PATCH 1/3] migration: report migration thread name to libvirt
In-Reply-To: <20230120084735.825054-2-jiangjiacheng@huawei.com> (Jiang
 Jiacheng's message of "Fri, 20 Jan 2023 16:47:33 +0800")
References: <20230120084735.825054-1-jiangjiacheng@huawei.com>
 <20230120084735.825054-2-jiangjiacheng@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:19:40 +0100
Message-ID: <87tu08odr7.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Jiang Jiacheng <jiangjiacheng@huawei.com> wrote:
> Report migration thread name to libvirt in order to
> support query migration thread infomation by its name.
>
> Signed-off-by: Jiang Jiacheng <jiangjiacheng@huawei.com>
> ---
>  migration/migration.c |  3 +++
>  migration/multifd.c   |  5 ++++-
>  qapi/migration.json   | 12 ++++++++++++
>  3 files changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index 52b5d39244..b4ce458bb9 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3955,6 +3955,9 @@ static void *migration_thread(void *opaque)
>      MigThrError thr_error;
>      bool urgent = false;
>  
> +    /* report migration thread name to libvirt */
> +    qapi_event_send_migration_name("live_migration");
> +
>      rcu_register_thread();
>  
>      object_ref(OBJECT(s));

I am not sure about this.
This is not an event, in my point of view.

What is the problem adding it to info migrate or similar?
Looks more logical to me.

Later, Juan.


