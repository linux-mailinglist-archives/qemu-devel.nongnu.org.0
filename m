Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CACAD30E221
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 19:13:18 +0100 (CET)
Received: from localhost ([::1]:45524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7MeT-0001Oo-QX
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 13:13:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7Mbw-0007yk-MG
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 13:10:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7Mbq-00044A-Hh
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 13:10:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612375831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LIgzx68BdRxfMWKmNh9sNxtgBg4K0FRgqSmfhyOkOks=;
 b=IWQCyLYki9e+1WZNb3ecyGwpnQh1sru2rTuEuefHci90SQYmgGLEAOc1o+a8ebnEmuBzgp
 pdoq6W+VxRJb6lXg2EEBCLkqQqRE4hmBJp1eh66ItbJjDHhvIEs+zvH4jLQHFCGpzKr7Pv
 o7qECBpTwx2jgxnIaKqVpgPmaM+v/7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-OYxjCq4SPXme6F7Dj-QGxw-1; Wed, 03 Feb 2021 13:10:27 -0500
X-MC-Unique: OYxjCq4SPXme6F7Dj-QGxw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D2C2100F341;
 Wed,  3 Feb 2021 18:10:26 +0000 (UTC)
Received: from work-vm (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E454560C13;
 Wed,  3 Feb 2021 18:10:23 +0000 (UTC)
Date: Wed, 3 Feb 2021 18:10:15 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH v4 05/18] migration/rdma: do not need sync main for rdma
Message-ID: <20210203181015.GP2950@work-vm>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
 <1612339311-114805-6-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1612339311-114805-6-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: yubihong@huawei.com, berrange@redhat.com, zhang.zhanghailiang@huawei.com,
 quintela@redhat.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch needs to explain why the sync isn't needed for RDMA.

Dave

* Chuan Zheng (zhengchuan@huawei.com) wrote:
> Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>
> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> ---
>  migration/multifd.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 4820702..5d34950 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -583,6 +583,10 @@ void multifd_send_sync_main(QEMUFile *f)
>      if (!migrate_use_multifd()) {
>          return;
>      }
> +     /* Do not need sync for rdma */
> +    if (migrate_use_rdma()) {
> +        return;
> +    }
>      if (multifd_send_state->pages->used) {
>          if (multifd_send_pages(f) < 0) {
>              error_report("%s: multifd_send_pages fail", __func__);
> @@ -1024,6 +1028,10 @@ void multifd_recv_sync_main(void)
>      if (!migrate_use_multifd()) {
>          return;
>      }
> +    /* Do not need sync for rdma */
> +    if (migrate_use_rdma()) {
> +        return;
> +    }
>      for (i = 0; i < migrate_multifd_channels(); i++) {
>          MultiFDRecvParams *p = &multifd_recv_state->params[i];
>  
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


