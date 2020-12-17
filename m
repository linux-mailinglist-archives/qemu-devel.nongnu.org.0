Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E002DD49A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:52:24 +0100 (CET)
Received: from localhost ([::1]:41218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpvZn-0002Xu-K0
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kpvMD-0003k9-Nr
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:38:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kpvMC-00078w-4n
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:38:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608219499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vU7csvr9Ti/jkL8FHIqekZe6NlaHON7sxoWSznnM5ec=;
 b=BWbx5gLddUfnyVD3XuFgoqSX2v/UqXV4fwnc8QRNimig4UgkH9Q8ZK9kKxYp3Tb8Cxl1ff
 EJoO3GMRu6IpOqcXIqAayVFUQi2AUt/AoKRrRn1f0YNlWdHet/HSMFOPOMpg0wfnvCAeV9
 U+L89rfmrQVoNavDPlQk+yCTMfoWPqg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-7QQr8fH1N3SkEqTgXQA6gQ-1; Thu, 17 Dec 2020 10:38:15 -0500
X-MC-Unique: 7QQr8fH1N3SkEqTgXQA6gQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5926AFA81;
 Thu, 17 Dec 2020 15:38:14 +0000 (UTC)
Received: from work-vm (ovpn-112-208.ams2.redhat.com [10.36.112.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CADF5D9D2;
 Thu, 17 Dec 2020 15:38:13 +0000 (UTC)
Date: Thu, 17 Dec 2020 15:38:10 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Tuguoyi <tu.guoyi@h3c.com>, berrange@redhat.com
Subject: Re: [PATCH 2/2] savevm: Delete snapshots just created in case of error
Message-ID: <20201217153810.GJ4117@work-vm>
References: <1607410416-13563-1-git-send-email-tu.guoyi@h3c.com>
 <1607410416-13563-3-git-send-email-tu.guoyi@h3c.com>
MIME-Version: 1.0
In-Reply-To: <1607410416-13563-3-git-send-email-tu.guoyi@h3c.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: tuguoyi@outlook.com, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Tuguoyi (tu.guoyi@h3c.com) wrote:
> bdrv_all_create_snapshot() can fails with some snapshots created,
> so it's better to delete those snapshots before returns to the caller
> 
> Signed-off-by: Tuguoyi <tu.guoyi@h3c.com>

This makes sense to me,


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/savevm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 601b514..4a18c9d 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2833,6 +2833,7 @@ int save_snapshot(const char *name, Error **errp)
>      if (ret < 0) {
>          error_setg(errp, "Error while creating snapshot on '%s'",
>                     bdrv_get_device_or_node_name(bs));
> +        bdrv_all_delete_snapshot(sn->name, &bs, NULL);
>          goto the_end;
>      }
>  
> -- 
> 2.7.4
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


