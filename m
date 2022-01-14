Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADF548EFDA
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 19:27:09 +0100 (CET)
Received: from localhost ([::1]:38910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8RI4-000433-Fy
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 13:27:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1n8RCm-0006pt-KT
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 13:21:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1n8RCj-0002bk-Ex
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 13:21:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642184496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6Zu+fMRwXRoyrRJy4lai0btcktKxQhsNLLqim/+3OdU=;
 b=fcBfLI9tZQ+HrUVfo7t9gOyNZ1ZhaWr1yZvnVB66PTpuCPeORMI1I80SpdNZw+Gx5gplmj
 RoPUK5ncH4ybZ0f1B28pKaceShS5VYE2VTZEqt8x+G9wDmP/aML0HlA5GhscHWh7J6+6zo
 MSDwPOnFDxMIYASG8EETR7Tf7HhwttM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-wKcDXQ67M1ao1AOCqNWQ4Q-1; Fri, 14 Jan 2022 13:20:30 -0500
X-MC-Unique: wKcDXQ67M1ao1AOCqNWQ4Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0C241853020;
 Fri, 14 Jan 2022 18:20:29 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.17.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44C1A2B4B9;
 Fri, 14 Jan 2022 18:20:18 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id B966A220370; Fri, 14 Jan 2022 13:20:17 -0500 (EST)
Date: Fri, 14 Jan 2022 13:20:17 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Sebastian Hasler <sebastian.hasler@stuvus.uni-stuttgart.de>
Subject: Re: [Virtio-fs] [PATCH v2] virtiofsd: Do not support blocking flock
Message-ID: <YeG+4Uqeoj4hUpa4@redhat.com>
References: <20220113153249.710216-1-sebastian.hasler@stuvus.uni-stuttgart.de>
MIME-Version: 1.0
In-Reply-To: <20220113153249.710216-1-sebastian.hasler@stuvus.uni-stuttgart.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 13, 2022 at 04:32:49PM +0100, Sebastian Hasler wrote:
> With the current implementation, blocking flock can lead to
> deadlock. Thus, it's better to return EOPNOTSUPP if a user attempts
> to perform a blocking flock request.
> 
> Signed-off-by: Sebastian Hasler <sebastian.hasler@stuvus.uni-stuttgart.de>

Reviewed-by: Vivek Goyal <vgoyal@redhat.com>

Thanks Sebastian. Good fix. I can easily reproduce the deadlock.

shell1> flock foo.txt -c "sleep 10"
shell2> flock foo.txt -c echo

First commands take flock on foo.txt. Second command blocks on lock. And
only virtiofsd thread serving the virt messages blocks on flock(). Now
first command never exits. I think it will try to free lock once sleep
is over and that will deadlock. virtiofsd thread is blocked and it will
never wake up because lock release operation will never make progress.

This will be little painful for people as they will start seeing
errors. But I guess erroring out early is better than a potential
deadlock later.

Vivek

> ---
>  tools/virtiofsd/passthrough_ll.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 64b5b4fbb1..faa62278c5 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -2442,6 +2442,15 @@ static void lo_flock(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi,
>      int res;
>      (void)ino;
>  
> +    if (!(op & LOCK_NB)) {
> +        /*
> +         * Blocking flock can deadlock as there is only one thread
> +         * serving the queue.
> +         */
> +        fuse_reply_err(req, EOPNOTSUPP);
> +        return;
> +    }
> +
>      res = flock(lo_fi_fd(req, fi), op);
>  
>      fuse_reply_err(req, res == -1 ? errno : 0);
> -- 
> 2.33.1
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://listman.redhat.com/mailman/listinfo/virtio-fs
> 


