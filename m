Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 065782D55E4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 09:58:17 +0100 (CET)
Received: from localhost ([::1]:58276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knHmC-0007qD-3c
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 03:58:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1knHg4-0004Ce-LU
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 03:51:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1knHg3-0005yc-5e
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 03:51:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607590314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vtuG8EjqLmlm3vtZdQjbO8BUhyUZ47yfBOdFKGXkm74=;
 b=dbXM9h6HUVMqfhzShGupXbA/hM1Y9kJfzASgNiN/V7LWLEriZaMlFY/1FyLlZKIlk4WRiv
 NHS1IYBx7aPlPpPiIUiOPk/kjP6K3YiCzQxf4Hg8VOvzI1J/Nb2c8DXeNNBc0ZhCX9HIY/
 8wz9GfmgLrOodgQj7C2ygIejO1X3+hc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-MuW5CSuDMBmVGylbL-AfAA-1; Thu, 10 Dec 2020 03:51:52 -0500
X-MC-Unique: MuW5CSuDMBmVGylbL-AfAA-1
Received: by mail-wr1-f71.google.com with SMTP id b5so1661403wrp.3
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 00:51:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vtuG8EjqLmlm3vtZdQjbO8BUhyUZ47yfBOdFKGXkm74=;
 b=ckZ1KuEeEK2jtbLTHtOc+Sef5W7hxP2vs7oT63TrpZ38UIvvAhidvXRtdEjVhH78l1
 xXCZ4yBnrab6oSj6hqrqsPAzHU1lqmdKRrc9C97dFUZSVsD+M2q9POFnOQQ3253O2vth
 C0JFa93iBCrZ7KDc3PFazXUKaieovAlZPtIT8resxcw3lyjlHmrqR052BHgYpLUnmZ3b
 NXUv/y9O8g8LMA7Z1K6m7FwaSwvzSbLSUvOC0qzKE3tu/kDALbrvqgWdbja0wLuE28fx
 70im8g/dqx7RWKYI4wdmEtzRXyDafvNHWtaRxDitxlRTYO52XlGlbQxVPScemYB6iJTV
 Q6QA==
X-Gm-Message-State: AOAM530ZNCVpbZ7auebDFwfIRfyazxNWhcKbb7OwUSOKyg8nrCKX6POJ
 /QXTdnTuXDVpZNY0/K/SKZ1qNC/PAUZ4ncofAY5KuKcwf01SHs96J5/BmjHjyz9RqYkqfpmbI6s
 6/0NBs2BNT/zgRW4=
X-Received: by 2002:a5d:5643:: with SMTP id j3mr6735632wrw.43.1607590311262;
 Thu, 10 Dec 2020 00:51:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwq+fpZzMhdrg1b3lKECckAYhZFmI6v93w9scTV6ZSxEUozFuH4ibJ44L4bYSvjCB9BsNjbLg==
X-Received: by 2002:a5d:5643:: with SMTP id j3mr6735616wrw.43.1607590311041;
 Thu, 10 Dec 2020 00:51:51 -0800 (PST)
Received: from steredhat (host-79-24-227-66.retail.telecomitalia.it.
 [79.24.227.66])
 by smtp.gmail.com with ESMTPSA id g11sm8331663wrq.7.2020.12.10.00.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 00:51:50 -0800 (PST)
Date: Thu, 10 Dec 2020 09:51:48 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: ruc_gongyuanjun@163.com
Subject: Re: [PATCH 1/1] net/socket.c: Fix memory leak
Message-ID: <20201210085148.yz65odiu6wdtdmiv@steredhat>
References: <20201209120013.13317-1-ruc_gongyuanjun@163.com>
MIME-Version: 1.0
In-Reply-To: <20201209120013.13317-1-ruc_gongyuanjun@163.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 09, 2020 at 08:00:13PM +0800, ruc_gongyuanjun@163.com wrote:
>From: yuanjungong <ruc_gongyuanjun@163.com>
>
>close fd opened by monitor_fd_param() before returning.
>
>Signed-off-by: yuanjungong <ruc_gongyuanjun@163.com>
>---
> net/socket.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/net/socket.c b/net/socket.c
>index 15b410e..2f720a7 100644
>--- a/net/socket.c
>+++ b/net/socket.c
>@@ -735,12 +735,15 @@ int net_init_socket(const Netdev *netdev, const char *name,
>         if (ret < 0) {
>             error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
>                              name, fd);
>+            close(fd);
>             return -1;
>         }
>         if (!net_socket_fd_init(peer, "socket", name, fd, 1, sock->mcast,
>                                 errp)) {
>+            close(fd);

net_socket_fd_init() closes the fd in the error path, so this close 
should be avoided.

>             return -1;
>         }
>+        close(fd);

I don't know the code, but is it right to close the file descriptor in 
the success path?

Thanks,
Stefano

>         return 0;
>     }
>
>-- 
>2.17.1
>
>


