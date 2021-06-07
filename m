Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D906F39DE86
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 16:18:45 +0200 (CEST)
Received: from localhost ([::1]:49008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqG5U-00008v-VF
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 10:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqG4k-0007uE-F7
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:17:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqG4f-0007Tw-I7
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:17:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623075471;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WZfJ9V5b5PgnpaKaXXRDh9thwyGXjcBbWdULGB3aGUg=;
 b=HDSBI7WYrLVdBuQheDKAfAtZK/981q+bVNkXpnwSXqVesVQxtmqRVYRRk/zDPHkcqLyCpn
 TktZ+fPTF8Bvt2vpLwPFzL8Td7mnjYFV7NS9Mcyr/1nL6mWasSVGv9ifx8FCiJyik0W0XA
 Lud5Au/TiBFHZGUmz8Ze0J2ocBMpr+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-aYYWAdmyNt-7zL6CimDt5w-1; Mon, 07 Jun 2021 10:17:50 -0400
X-MC-Unique: aYYWAdmyNt-7zL6CimDt5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E9F68EA12F;
 Mon,  7 Jun 2021 14:17:48 +0000 (UTC)
Received: from redhat.com (ovpn-114-203.ams2.redhat.com [10.36.114.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F16D620DE;
 Mon,  7 Jun 2021 14:17:46 +0000 (UTC)
Date: Mon, 7 Jun 2021 15:17:43 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: LIZHAOXIN1 =?utf-8?B?W+adjueFp+mRq10=?= <LIZHAOXIN1@kingsoft.com>
Subject: Re: [PATCH] migration/rdma: Use huge page register VM memory
Message-ID: <YL4qh35GquFrbSfq@redhat.com>
References: <51819991cecb42f6a619768bc61d0bfd@kingsoft.com>
MIME-Version: 1.0
In-Reply-To: <51819991cecb42f6a619768bc61d0bfd@kingsoft.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: sunhao2 =?utf-8?B?W+WtmeaYil0=?= <sunhao2@kingsoft.com>,
 YANGFENG1 =?utf-8?B?W+adqOWzsF0=?= <YANGFENG1@kingsoft.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 DENGLINWEN =?utf-8?B?W+mCk+ael+aWh10=?= <DENGLINWEN@kingsoft.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 07, 2021 at 01:57:02PM +0000, LIZHAOXIN1 [李照鑫] wrote:
> When using libvirt for RDMA live migration, if the VM memory is too large,
> it will take a lot of time to deregister the VM at the source side, resulting
> in a long downtime (VM 64G, deregister vm time is about 400ms).
>     
> Although the VM's memory uses 2M huge pages, the MLNX driver still uses 4K
> pages for pin memory, as well as for unpin. So we use huge pages to skip the
> process of pin memory and unpin memory to reduce downtime.
>    
> The test environment:
> kernel: linux-5.12
> MLNX: ConnectX-4 LX
> libvirt command:
> virsh migrate --live --p2p --persistent --copy-storage-inc --listen-address \
> 0.0.0.0 --rdma-pin-all --migrateuri rdma://192.168.0.2 [VM] qemu+tcp://192.168.0.2/system
>     
> Signed-off-by: lizhaoxin <lizhaoxin1@kingsoft.com>
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 1cdb4561f3..9823449297 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -1123,13 +1123,26 @@ static int qemu_rdma_reg_whole_ram_blocks(RDMAContext *rdma)
>      RDMALocalBlocks *local = &rdma->local_ram_blocks;
>  
>      for (i = 0; i < local->nb_blocks; i++) {
> -        local->block[i].mr =
> -            ibv_reg_mr(rdma->pd,
> -                    local->block[i].local_host_addr,
> -                    local->block[i].length,
> -                    IBV_ACCESS_LOCAL_WRITE |
> -                    IBV_ACCESS_REMOTE_WRITE
> -                    );
> +        if (strcmp(local->block[i].block_name,"pc.ram") == 0) {

'pc.ram' is an x86 architecture specific name, so this will still
leave a problem on other architectures I assume.

> +            local->block[i].mr =
> +                ibv_reg_mr(rdma->pd,
> +                        local->block[i].local_host_addr,
> +                        local->block[i].length,
> +                        IBV_ACCESS_LOCAL_WRITE |
> +                        IBV_ACCESS_REMOTE_WRITE |
> +                        IBV_ACCESS_ON_DEMAND |
> +                        IBV_ACCESS_HUGETLB
> +                        );
> +        } else {
> +            local->block[i].mr =
> +                ibv_reg_mr(rdma->pd,
> +                        local->block[i].local_host_addr,
> +                        local->block[i].length,
> +                        IBV_ACCESS_LOCAL_WRITE |
> +                        IBV_ACCESS_REMOTE_WRITE
> +                        );
> +        }
> +
>          if (!local->block[i].mr) {
>              perror("Failed to register local dest ram block!\n");
>              break;

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


