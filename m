Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B77430F097
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 11:27:50 +0100 (CET)
Received: from localhost ([::1]:58662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7brZ-0001rS-04
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 05:27:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7baT-0000iV-My
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:10:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7baN-0005LX-DY
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:10:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612433402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lfTm/WU6jmypGqwVRuXNz8PX2HdYdcz3DMqX68x6yRc=;
 b=BBbGv8UvnblEhjAI74W9quI15mydBzSCyWX+vaTjSvHuA85VQejUxG6+yvkUX50Ge7bC4H
 mjf5dnBF3bgoK5zYrSwi2Lqn8JN0HpX9uSzxTpZuBL3t1DN5h5xlRCgNDIA3ipGKi+RCTD
 0ZY8ltfPDUYjeEVwvabb7jrvNbOzke8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-KE0Ftjo9M4yztVyeAUYeBA-1; Thu, 04 Feb 2021 05:10:01 -0500
X-MC-Unique: KE0Ftjo9M4yztVyeAUYeBA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 297EC107ACE4;
 Thu,  4 Feb 2021 10:09:59 +0000 (UTC)
Received: from work-vm (ovpn-114-21.ams2.redhat.com [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57EA01F464;
 Thu,  4 Feb 2021 10:09:56 +0000 (UTC)
Date: Thu, 4 Feb 2021 10:09:54 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH v4 15/18] migration/rdma: only register the memory for
 multifd channels
Message-ID: <20210204100954.GD3039@work-vm>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
 <1612339311-114805-16-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1612339311-114805-16-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

* Chuan Zheng (zhengchuan@huawei.com) wrote:
> All data is sent by multifd Channels, so we only register its for
> multifd channels and main channel don't register its.
> 
> Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>
> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> ---
>  migration/rdma.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index c906cc7..f5eb563 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -3939,6 +3939,12 @@ static int qemu_rdma_registration_stop(QEMUFile *f, void *opaque,
>  
>                  qemu_sem_post(&multifd_send_param->sem_sync);
>              }
> +
> +            /*
> +             * Use multifd to migrate, we only register memory for
> +             * multifd RDMA channel and main channel don't register it.
> +             */
> +            goto wait_reg_complete;

No! No goto's for control flow except for error exits.

>          }
>  
>          /*
> @@ -3999,6 +4005,8 @@ static int qemu_rdma_registration_stop(QEMUFile *f, void *opaque,
>                      rdma->dest_blocks[i].remote_host_addr;
>              local->block[i].remote_rkey = rdma->dest_blocks[i].remote_rkey;
>          }
> +
> +wait_reg_complete:
>          /* Wait for all multifd channels to complete registration */
>          if (migrate_use_multifd()) {
>              int i;
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


