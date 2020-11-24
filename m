Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1152C256E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 13:13:13 +0100 (CET)
Received: from localhost ([::1]:50736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khXC4-00058g-NT
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 07:13:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <coiby.xu@gmail.com>)
 id 1khX8L-0002wI-JW; Tue, 24 Nov 2020 07:09:23 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:46798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <coiby.xu@gmail.com>)
 id 1khX8J-0006VO-Ir; Tue, 24 Nov 2020 07:09:21 -0500
Received: by mail-pf1-x441.google.com with SMTP id v12so18283254pfm.13;
 Tue, 24 Nov 2020 04:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pLQ/N14uWC4ljGnYElZpnh0tY1lcBTi1Jh3CMjHmaRc=;
 b=N+97RA4V5x4qCwflRT8YTLOwlBrY9ytRO6CsFUMplfVTyNepVT/l1Nn+KSGAnYsorz
 O+gZRKtaNwbB05UidaBYOoAJTsLfEAcc4ra601bfyKtilrRRyFBYtqPUK6/iwnGxv/dL
 +RsJFAFrGenaxqTBgPHEdv4AY9O9aRZrv6nZXW6H0vOKX6iRyDaV60C4R7du4lF4zgXB
 Ti8G8JZB8z59cUYmeWRBR3K9RqEAsrF69EYFONuKg9Bcl5XZLdZCoagl7D6Vy3mzv+4u
 Oq50j5eFkd7ZlX6usp0MV1Mbsmm0YdG514Zqv/4+YJbs3ZyKNzw0Mm0fsQPSKuDuCscT
 rlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pLQ/N14uWC4ljGnYElZpnh0tY1lcBTi1Jh3CMjHmaRc=;
 b=t/v6ouFzKKPZrVIm3xbFhNtqNMWVseih/9OGIitaA2LNx4dw6vA3+xuwxpozuBEE9G
 BSitLytcs9Oyx68mp7LKTnfjOzBupc1YanMHz6X3QUiYtQnj6A/OaFzHba5mUhixvkYQ
 n4R8UgFtFGZ/DuH30hG75vJVIlGwiCLJj0lsw4mQ5sXmE9H/FPk29S+gjhn7KRjwUdD4
 4qKuDTUs6Leu6k+UPL/UXcqukyBzDKLzkhZXziRJ+MJaXjUp5YtWbdEaSl1LVy7fv8wo
 FlS1DkX5Jy3b35dfGz+VIDerfIupewS4ZqofBwkzO1bKDGV5Yil+sdmgUknWTgvcz815
 Lm4g==
X-Gm-Message-State: AOAM532dMcOCbOSFb63o/FZF8oSnuVHWXmSwzBdTuHMv8S8GYbrNxgEx
 aaOpP0rCPNdgnbL2o0mGnHA=
X-Google-Smtp-Source: ABdhPJyksZzGNbIk5fyqWiD9P7vcDtwJ+E4nEY7XsgwmwQfMenY6VBxz4KNK3NXRP/qFZCOQWfSQRw==
X-Received: by 2002:aa7:8c47:0:b029:197:de59:cfec with SMTP id
 e7-20020aa78c470000b0290197de59cfecmr3971664pfd.0.1606219757256; 
 Tue, 24 Nov 2020 04:09:17 -0800 (PST)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id 17sm15501243pfu.180.2020.11.24.04.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 04:09:16 -0800 (PST)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Tue, 24 Nov 2020 20:08:26 +0800
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH for-5.2 05/10] vhost-user-blk-test: close fork child file
 descriptors
Message-ID: <20201124120826.cgz2oiexopucatbt@Rk>
References: <20201111124331.1393747-1-stefanha@redhat.com>
 <20201111124331.1393747-6-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20201111124331.1393747-6-stefanha@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=coiby.xu@gmail.com; helo=mail-pf1-x441.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

On Wed, Nov 11, 2020 at 12:43:26PM +0000, Stefan Hajnoczi wrote:
>Do not leave stdin and stdout open after fork. stdout is the
>tap-driver.pl pipe. If we keep the pipe open then tap-driver.pl will not
>detect that qos-test has terminated and it will hang.

I wonder under which situation this would happen. I couldn't re-produce
this issue locally.

>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>---
> tests/qtest/vhost-user-blk-test.c | 9 +++++++++
> 1 file changed, 9 insertions(+)
>
>diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
>index f05f14c192..4019a72ac0 100644
>--- a/tests/qtest/vhost-user-blk-test.c
>+++ b/tests/qtest/vhost-user-blk-test.c
>@@ -749,6 +749,15 @@ static char *start_vhost_user_blk(GString *cmd_line, int vus_instances,
>                    storage_daemon_command->str);
>     pid_t pid = fork();
>     if (pid == 0) {
>+        /*
>+         * Close standard file descriptors so tap-driver.pl pipe detects when
>+         * our parent terminates.
>+         */
>+        close(0);
>+        close(1);
>+        open("/dev/null", O_RDONLY);
>+        open("/dev/null", O_WRONLY);
>+
>         execlp("/bin/sh", "sh", "-c", storage_daemon_command->str, NULL);
>         exit(1);
>     }
>--
>2.28.0
>

--
Best regards,
Coiby

