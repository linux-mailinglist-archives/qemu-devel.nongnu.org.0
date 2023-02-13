Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CBD693C53
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:31:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRObH-0001es-UO; Sun, 12 Feb 2023 21:29:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRObG-0001d8-HX
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRObF-00037V-3t
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676255388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tSe+Gdu1AJDo4dQjmBB0UPRFbXEKMEpLnQVbJ+wkYp0=;
 b=jKXKO6meLxNJtFsUScFu2LmmQmbrP4JS94q1TP+bnlQOxg17ZwJS2K/GOJ2g101vl/DjVZ
 adIcomAp1nkcQ1R5wWK7bdE4XwD5kMLfRVWmGal1ZH52pp1zRe3vnLFbOgoQE/VR5s0iuR
 GFsAUVMfMp/lU3b1V2h2AsTkixcR8TE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-537-xt6JjolzOhGCo1i8iU144g-1; Sun, 12 Feb 2023 21:29:47 -0500
X-MC-Unique: xt6JjolzOhGCo1i8iU144g-1
Received: by mail-wm1-f72.google.com with SMTP id
 l38-20020a05600c1d2600b003ddff4b9a40so6033349wms.9
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:29:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tSe+Gdu1AJDo4dQjmBB0UPRFbXEKMEpLnQVbJ+wkYp0=;
 b=20QXfmY4YTcQIVc268Po2Vhd5PQiCE1Iai+Zt5gfevFveDRjUJPHv1o0Wpl3JlNChR
 rUSCHU2vKbseTdLb2bUp84+DTqRM07C+WumUzf3AVuBv7F1IjKIdJXmIuIMWinOLnnVN
 VuIbOHLLWVOyMqY84Fnyn3YxZoCND9Cy/xwTRr8mUfm0HwDixLVG5h3U2Brf7GQQld9H
 4SmRrorlw/r+kI+KHVz/pbeqaUmEPgP54nK929WeUh97LUVAClsPVAW0dE++IpC5tdOB
 oqFv1H8mFcwJ9QALHl/9wYGPPnb4pnvt852YwQ68pfEBSshC345kEtNcfbWs8GAZTFyx
 au3Q==
X-Gm-Message-State: AO0yUKVNGvqQP4PdvM/Ex/cwl2Eul55+qvoTIhBkkqBgE/79a6ZWjcPS
 atVEPEd7QI+98b6dkVBr8H2Qzz5o3aH7A7dsx2/eIfh0T+2Owu9FDN6naeIzGy6oxjMnVrTdSHK
 8xinQ44B8lppD1AIgQxu30Fy1fdXp2lS0v4KCzc+uE+5aWiLl/+xxINsuwb0WcqGGM8kAv40k
X-Received: by 2002:adf:e608:0:b0:2c3:e0a0:93f with SMTP id
 p8-20020adfe608000000b002c3e0a0093fmr18298435wrm.8.1676255385554; 
 Sun, 12 Feb 2023 18:29:45 -0800 (PST)
X-Google-Smtp-Source: AK7set+WKuAYOVOi5T8g/gwIH4YXlwRtin+i6T7IHgekqnQDqwh6cmXscxDcqMGyyd1yN/d6+Bf2LQ==
X-Received: by 2002:adf:e608:0:b0:2c3:e0a0:93f with SMTP id
 p8-20020adfe608000000b002c3e0a0093fmr18298417wrm.8.1676255385331; 
 Sun, 12 Feb 2023 18:29:45 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 h16-20020a5d6890000000b002c553509db7sm2979924wru.52.2023.02.12.18.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:29:44 -0800 (PST)
From: Xxx Xx <quintela@redhat.com>
X-Google-Original-From: Xxx Xx <xxx.xx@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PULL 19/22] migration/multifd: Remove unnecessary assignment on
 multifd_load_cleanup()
Date: Mon, 13 Feb 2023 03:29:08 +0100
Message-Id: <20230213022911.68490-20-xxx.xx@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213022911.68490-1-xxx.xx@gmail.com>
References: <20230213022911.68490-1-xxx.xx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

From: Leonardo Bras <leobras@redhat.com>

Before assigning "p->quit = true" for every multifd channel,
multifd_load_cleanup() will call multifd_recv_terminate_threads() which
already does the same assignment, while protected by a mutex.

So there is no point doing the same assignment again.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index cac8496edc..3dd569d0c9 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1025,7 +1025,6 @@ void multifd_load_cleanup(void)
         MultiFDRecvParams *p = &multifd_recv_state->params[i];
 
         if (p->running) {
-            p->quit = true;
             /*
              * multifd_recv_thread may hung at MULTIFD_FLAG_SYNC handle code,
              * however try to wakeup it without harm in cleanup phase.
-- 
2.39.1


