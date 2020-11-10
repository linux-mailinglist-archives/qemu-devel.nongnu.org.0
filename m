Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD722AD5A4
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:53:38 +0100 (CET)
Received: from localhost ([::1]:55132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcSDR-00070O-BE
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:53:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kcSCD-00067S-MA
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:52:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kcSCA-00010M-DD
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605009135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=im7yWaMEwYOkM4VbXVn76PKjbQ3ksW6weQL/vgpmSFc=;
 b=NhVjsbF+84G0ubFMrT1XFu7iVSezfPzw8GuTwTGBrG3fNfpDyv/9UCYegv4m5Khe5R7vH5
 4v0G/hKn+OLPvdzQ3tj8HMykbtW6uuC3juoqNvOYXOWpV/t9UvEFwZlho2shveaFYm+89L
 4iETZtwqFNAZ7oVjPz8MqpF6v6319Pk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-wvMVnjP2N1uCMyJvJFtzHg-1; Tue, 10 Nov 2020 06:52:12 -0500
X-MC-Unique: wvMVnjP2N1uCMyJvJFtzHg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 789D35720B;
 Tue, 10 Nov 2020 11:52:10 +0000 (UTC)
Received: from work-vm (ovpn-115-49.ams2.redhat.com [10.36.115.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83E5310027AA;
 Tue, 10 Nov 2020 11:52:08 +0000 (UTC)
Date: Tue, 10 Nov 2020 11:52:05 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH v3 01/18] migration/rdma: add the
 'migrate_use_rdma_pin_all' function
Message-ID: <20201110115205.GC3108@work-vm>
References: <1602908748-43335-1-git-send-email-zhengchuan@huawei.com>
 <1602908748-43335-2-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1602908748-43335-2-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yubihong@huawei.com, zhang.zhanghailiang@huawei.com, quintela@redhat.com,
 fengzhimin1@huawei.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Chuan Zheng (zhengchuan@huawei.com) wrote:
> Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>
> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> ---
>  migration/migration.c | 9 +++++++++
>  migration/migration.h | 1 +
>  2 files changed, 10 insertions(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 0575ecb..64ae417 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2329,6 +2329,15 @@ bool migrate_use_events(void)
>      return s->enabled_capabilities[MIGRATION_CAPABILITY_EVENTS];
>  }
>  
> +bool migrate_use_rdma_pin_all(void)
> +{
> +    MigrationState *s;
> +
> +    s = migrate_get_current();
> +
> +    return s->enabled_capabilities[MIGRATION_CAPABILITY_RDMA_PIN_ALL];
> +}
> +

I'd omit the 'use_' if you need to respin; but that's fine:


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>  bool migrate_use_multifd(void)
>  {
>      MigrationState *s;
> diff --git a/migration/migration.h b/migration/migration.h
> index deb411a..74fd790 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -300,6 +300,7 @@ bool migrate_ignore_shared(void);
>  bool migrate_validate_uuid(void);
>  
>  bool migrate_auto_converge(void);
> +bool migrate_use_rdma_pin_all(void);
>  bool migrate_use_multifd(void);
>  bool migrate_pause_before_switchover(void);
>  int migrate_multifd_channels(void);
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


