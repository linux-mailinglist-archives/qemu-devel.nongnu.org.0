Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F0020F1B3
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 11:34:45 +0200 (CEST)
Received: from localhost ([::1]:40874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqCf6-0006AP-EB
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 05:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jqCeF-0005d3-LP
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 05:33:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36084
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jqCeD-00080z-5o
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 05:33:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593509628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8y8FFc5kam2f780GQOdJnSdbn9F7Vnisp+IyerUb1G8=;
 b=aJz3SbT0l5MIyK+72H5li/7T1qZbm6BnHixMvU2F6FU0NXhXnfydmbM/Fq9qrYgHQbM+Ma
 gCmNbozqUe5yv3CfbG8M1R7IeOdwRcVxc5PIzBDwYYQqmpao2Q0zurvmVMhjyaEachhhbO
 s6EyHMPX/4o/A+8nrEO+23PUI0zRqgs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-o_aajuIcMQyQ4Fbu0RdOmg-1; Tue, 30 Jun 2020 05:33:44 -0400
X-MC-Unique: o_aajuIcMQyQ4Fbu0RdOmg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6675480B70C
 for <qemu-devel@nongnu.org>; Tue, 30 Jun 2020 09:33:43 +0000 (UTC)
Received: from work-vm (ovpn-113-225.ams2.redhat.com [10.36.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F3AA741A9;
 Tue, 30 Jun 2020 09:33:42 +0000 (UTC)
Date: Tue, 30 Jun 2020 10:33:40 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 26/26] migration/rdma: Plug memory leaks in
 qemu_rdma_registration_stop()
Message-ID: <20200630093340.GB2673@work-vm>
References: <20200630090351.1247703-1-armbru@redhat.com>
 <20200630090351.1247703-27-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200630090351.1247703-27-armbru@redhat.com>
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 03:55:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> qemu_rdma_registration_stop() uses the ERROR() macro to create, report
> to stderr, and store an Error object.  The stored Error object is
> never used, and its memory is leaked.
> 
> Even where ERROR() doesn't leak, it is ill-advised.  The whole point
> of passing an Error to the caller is letting the caller handle the
> error.  Error handling may report to stderr, to somewhere else, or not
> at all.  Also reporting in the callee mixes up concerns that should be
> kept separate.  Since I don't know what reporting to stderr is
> supposed to accomplish, I'm not touching it.
> 
> Commit 2a1bc8bde7 "migration/rdma: rdma_accept_incoming_migration fix
> error handling" plugged the same leak in
> rdma_accept_incoming_migration().
> 
> Plug the memory leak the same way: keep the report part, delete the
> store part.
> 
> The report part uses fprintf().  If it's truly an error, it should use
> error_report() instead.  But I don't know, so I leave it alone, just
> like commit 2a1bc8bde7 did.
> 
> Fixes: 2da776db4846eadcb808598a5d3484d149773c05
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Thanks,


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/rdma.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index ec45d33ba3..3b18823268 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -3787,7 +3787,6 @@ static int qemu_rdma_registration_start(QEMUFile *f, void *opaque,
>  static int qemu_rdma_registration_stop(QEMUFile *f, void *opaque,
>                                         uint64_t flags, void *data)
>  {
> -    Error *local_err = NULL, **errp = &local_err;
>      QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(opaque);
>      RDMAContext *rdma;
>      RDMAControlHeader head = { .len = 0, .repeat = 1 };
> @@ -3832,7 +3831,7 @@ static int qemu_rdma_registration_stop(QEMUFile *f, void *opaque,
>                      &reg_result_idx, rdma->pin_all ?
>                      qemu_rdma_reg_whole_ram_blocks : NULL);
>          if (ret < 0) {
> -            ERROR(errp, "receiving remote info!");
> +            fprintf(stderr, "receiving remote info!");
>              return ret;
>          }
>  
> @@ -3851,10 +3850,10 @@ static int qemu_rdma_registration_stop(QEMUFile *f, void *opaque,
>           */
>  
>          if (local->nb_blocks != nb_dest_blocks) {
> -            ERROR(errp, "ram blocks mismatch (Number of blocks %d vs %d) "
> -                        "Your QEMU command line parameters are probably "
> -                        "not identical on both the source and destination.",
> -                        local->nb_blocks, nb_dest_blocks);
> +            fprintf(stderr, "ram blocks mismatch (Number of blocks %d vs %d) "
> +                    "Your QEMU command line parameters are probably "
> +                    "not identical on both the source and destination.",
> +                    local->nb_blocks, nb_dest_blocks);
>              rdma->error_state = -EINVAL;
>              return -EINVAL;
>          }
> @@ -3867,10 +3866,10 @@ static int qemu_rdma_registration_stop(QEMUFile *f, void *opaque,
>  
>              /* We require that the blocks are in the same order */
>              if (rdma->dest_blocks[i].length != local->block[i].length) {
> -                ERROR(errp, "Block %s/%d has a different length %" PRIu64
> -                            "vs %" PRIu64, local->block[i].block_name, i,
> -                            local->block[i].length,
> -                            rdma->dest_blocks[i].length);
> +                fprintf(stderr, "Block %s/%d has a different length %" PRIu64
> +                        "vs %" PRIu64, local->block[i].block_name, i,
> +                        local->block[i].length,
> +                        rdma->dest_blocks[i].length);
>                  rdma->error_state = -EINVAL;
>                  return -EINVAL;
>              }
> -- 
> 2.26.2
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


