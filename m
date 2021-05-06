Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0DB3758C1
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 18:53:49 +0200 (CEST)
Received: from localhost ([::1]:52068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lehG0-0006cv-Oy
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 12:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1legqk-0001ij-Vz
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:27:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1legqc-0004yt-G8
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:27:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620318452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y9kwae0xdlVLMmdLB6RH3Bp+x8W8EkZVHUT9eIQIDUI=;
 b=LK2aMs4EtlO6jF20kygvKL1SSABnwsGI8nQNPRWCjfMsh57cUSrgc3/MelLTCZMGq4m64E
 3p/sks0f+XRALo13ajFXGGFRHQmB8YFUxW650rPdSqeNRgf3ksCH2kYnJ5HMCl0ClUXxhL
 SoSt0yeGps7F8lWR/+HxP5s5l6/rRHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-klcqnLHFM8CdSbDfdskT1Q-1; Thu, 06 May 2021 12:27:29 -0400
X-MC-Unique: klcqnLHFM8CdSbDfdskT1Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1ADD801817;
 Thu,  6 May 2021 16:27:28 +0000 (UTC)
Received: from work-vm (ovpn-115-37.ams2.redhat.com [10.36.115.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D39A19CBA;
 Thu,  6 May 2021 16:27:28 +0000 (UTC)
Date: Thu, 6 May 2021 17:27:25 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH v2 0/7] virtiofsd: Changed various allocations to GLib
 functions
Message-ID: <YJQY7Z0iQ6Vcza5S@work-vm>
References: <20210420154643.58439-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210420154643.58439-1-ma.mandourr@gmail.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Mahmoud Mandour (ma.mandourr@gmail.com) wrote:
> Replaced allocations done using malloc(), calloc(), and realloc()
> to their equivalent functions in GLib.
> 
> Memory that is allocated locally and freed when the function exits
> are annotated g_autofree so that the deallocation is automatically
> handled. Subsequently, I could remove a bunch of free() calls.
> 
> Also, tried to keep the semantics of the code as is, but when the
> allocation is a small one, or a crucial one, I replaced the
> NULL-checking mechanisms with glib's functions that crash on error.
> 
> This is related to a patch that I had submitted as a part of a
> previous series. The previous patch had some errors. Also, I thought
> that it's better to split the patch into smaller pieces.

Queued (with the v3)

> Mahmoud Mandour (7):
>   virtiofsd: Changed allocations of fuse_req to GLib functions
>   virtiofds: Changed allocations of iovec to GLib's functions
>   virtiofsd: Changed allocations of fuse_session to GLib's functions
>   virtiofsd: Changed allocation of lo_map_elems to GLib's functions
>   virtiofsd: Changed allocations of fv_VuDev & its internals to GLib
>     functions
>   virtiofsd/passthrough_ll.c: Changed local allocations to GLib
>     functions
>   virtiofsd/fuse_virtio.c: Changed allocations of locals to GLib
> 
>  tools/virtiofsd/fuse_lowlevel.c  | 31 ++++++++++++-----------------
>  tools/virtiofsd/fuse_virtio.c    | 34 +++++++++++---------------------
>  tools/virtiofsd/passthrough_ll.c | 21 ++++++++------------
>  3 files changed, 32 insertions(+), 54 deletions(-)
> 
> -- 
> 2.25.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


