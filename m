Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0476B1EDA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 09:52:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paBzP-0007lE-N5; Thu, 09 Mar 2023 03:51:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBzH-0007k3-Us
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:51:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBzG-00021G-4m
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:50:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678351857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3jY37BUfW1TKZ4UmYf+KE+hvIbchKyfg8OkPz1QdnU4=;
 b=BOgH2xBF/zuQ6hqUUAwSzxs0RHCQ26xLiMcan7Xi/gW1uzjcVbodzO8eCxz0KkxX7Ct4pW
 PuYxLpr1K11lsvg258nrw5h42bQA+AuaGkRyd3tguOdrezw4t9u7h0mkl1VYSdaaI6lTAt
 zwRV3FFeokK7OrNBe+nzArzICP8QjKs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-jnTncEc6PWmuwoe38rM9Hw-1; Thu, 09 Mar 2023 03:50:56 -0500
X-MC-Unique: jnTncEc6PWmuwoe38rM9Hw-1
Received: by mail-ed1-f72.google.com with SMTP id
 c1-20020a0564021f8100b004acbe232c03so1893335edc.9
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 00:50:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678351854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3jY37BUfW1TKZ4UmYf+KE+hvIbchKyfg8OkPz1QdnU4=;
 b=oLQIqzfJ50C7NGkF9p+lIukh61RMWZXyBuGh6+XSpjaDHWE6UGJ7LbQmXzh9jE2xHC
 XTCRthUxythNAtk+vQvIa+aph+FLNJ5+m9Mfh1PCekEv83r6ZlAjB/lPc0yTEHaFbj2F
 u1UwbjHHzRy8nH0PyobFC3HodxLTXKTmtsdr+XJotgGLXGP47ztQ1lDoPn4d41TvuDuW
 I3pbTZdJZo1e7M4EvRpZ+Ez+wbREfTtQqfo6Fh5oUxbLnaAIDG9P2fXl53/zplDZeqJ3
 51tob4Ce+xGC8VWjFTJlP0VnPfOFiQ2EkMVohypz1rXwu9hvjDxbs5cy9FcKDSt5zaSe
 7yVQ==
X-Gm-Message-State: AO0yUKWyLQCphcaihxyQaJhxpBJZAJT2zmy2ydRaX259hgwns0mgS05T
 nlBcD636Jcb34ZNZMcstwG3IN24rIc0lvi3GG4/Qlw8sMdriMA271zu7dk9PRoLxnrWs2Aiv5tq
 /MvFldL3UPI1l182lXfvV601Y1BHH0lx1PvxC4xUzsOQooADUsDUpWSKc7eH19mJqtZAtddQQYd
 A=
X-Received: by 2002:a17:907:7f0b:b0:888:7ac8:c0f4 with SMTP id
 qf11-20020a1709077f0b00b008887ac8c0f4mr20938571ejc.25.1678351854253; 
 Thu, 09 Mar 2023 00:50:54 -0800 (PST)
X-Google-Smtp-Source: AK7set/U23DODGF/V1BpwEST21vnP9NuK4AOgwh7mkrEQbpHrxWfHUsaaQYALhDtLcPvFqwFcFlmJQ==
X-Received: by 2002:a17:907:7f0b:b0:888:7ac8:c0f4 with SMTP id
 qf11-20020a1709077f0b00b008887ac8c0f4mr20938556ejc.25.1678351853946; 
 Thu, 09 Mar 2023 00:50:53 -0800 (PST)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 jy24-20020a170907763800b008d7a8083dffsm8536640ejc.222.2023.03.09.00.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 00:50:53 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Subject: [PATCH 1/3] block: make assertion more generic
Date: Thu,  9 Mar 2023 09:50:49 +0100
Message-Id: <20230309085051.308664-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309085051.308664-1-pbonzini@redhat.com>
References: <20230309085051.308664-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

.bdrv_needs_filename is only set for drivers that also set bdrv_file_open,
i.e. protocol drivers.

So we can make the assertion always, it will always pass for those drivers
that use bdrv_open.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 0dd604d0f6a8..075da6517b7f 100644
--- a/block.c
+++ b/block.c
@@ -1627,8 +1627,8 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
     bs->drv = drv;
     bs->opaque = g_malloc0(drv->instance_size);
 
+    assert(!drv->bdrv_needs_filename || bs->filename[0]);
     if (drv->bdrv_file_open) {
-        assert(!drv->bdrv_needs_filename || bs->filename[0]);
         ret = drv->bdrv_file_open(bs, options, open_flags, &local_err);
     } else if (drv->bdrv_open) {
         ret = drv->bdrv_open(bs, options, open_flags, &local_err);
-- 
2.39.2


