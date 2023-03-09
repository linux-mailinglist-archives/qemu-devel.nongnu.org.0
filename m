Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7896B1E90
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 09:47:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paBto-0000NU-Dr; Thu, 09 Mar 2023 03:45:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBtk-0000Ll-PA
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:45:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBtj-0000Fs-BQ
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:45:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678351514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9BNYsD2O42o1OGGl2m4moWLqOlHFxw13TgG0AXas3Mw=;
 b=LhKNMjFb0IjqMuhTqy8d4dCIudvTnzCJPXEaE4oyFY/YwWotHYElmjiNquLygtBA97dVr7
 1Bb9DwrZN69KWBsgXKFVx6mzjIM7vhB7GAV1gZnA1HnchEtAbVmDsLqMDsFhkyYux+OjvO
 mU96chedXAuci5v+JFysj22fLOFQH1A=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-1oQ4G6cwMP6QRjJntdLQbw-1; Thu, 09 Mar 2023 03:45:13 -0500
X-MC-Unique: 1oQ4G6cwMP6QRjJntdLQbw-1
Received: by mail-ed1-f72.google.com with SMTP id
 fi8-20020a056402550800b004a26cc7f6cbso1925019edb.4
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 00:45:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678351511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9BNYsD2O42o1OGGl2m4moWLqOlHFxw13TgG0AXas3Mw=;
 b=iCgxWjBqVpsLPVoG9La8t7kuWYhZCteP4KeHcW6FuGP69AbHotFJ1jIqBX8hT1Kub6
 3pF9Or/LBbNRI6GAVIzdBprPOb9W1gBvyHJVNSnXu0vpCZPjaTLG58ZSwCpHjzmcdhGW
 4i3VRdTbQ+R95Z64wiBn7JXrF1USwFAb+LUi8zFgbiS6GBesqE8kvHo9ATmJevl6Fyu2
 mAUuzUdjypRPNS1PjmA9u5+SfXwmUEs8GgoqWtmNL4SMZdzjuOQ2Q4J0/Z/BfJFoPVAg
 NBpxmPzWAaoCY/vs/rNRXtNlJ1YcAE6Fifr/XsnFzRKw/xtiqQ8SbK24yZeItYbCodTx
 KeKw==
X-Gm-Message-State: AO0yUKW4vxgba3SdOHEd/nDl2LscuETtGkkDH1otoWKQpCkETcCTyXQa
 Omg5i3Vc0p0rqldaytYPLHcO1l1lxfrb4RincSXRgRnFWtPAyNYi5JdgIEIfoDIQ1dXR0PJuRkq
 9NuQFs5RfGF3OL3YkvjPqO1BicMhhA58eua7xNTK6VmXh5x/500+M41I//4VkU7G2KYj7EaVxgQ
 o=
X-Received: by 2002:a17:906:5daa:b0:8f4:5bda:b755 with SMTP id
 n10-20020a1709065daa00b008f45bdab755mr15751759ejv.4.1678351511796; 
 Thu, 09 Mar 2023 00:45:11 -0800 (PST)
X-Google-Smtp-Source: AK7set+oOK9Zpkj0eryVe1FtfTnj41I8txV+Z6d5RmgJXZalLf0dQ/8AFhWIdquQylTVgoSBXbjwrA==
X-Received: by 2002:a17:906:5daa:b0:8f4:5bda:b755 with SMTP id
 n10-20020a1709065daa00b008f45bdab755mr15751747ejv.4.1678351511529; 
 Thu, 09 Mar 2023 00:45:11 -0800 (PST)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a170906068900b008d02b6f3f41sm8560683ejb.211.2023.03.09.00.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 00:45:10 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Subject: [PATCH 9/9] vmdk: make vmdk_is_cid_valid a coroutine_fn
Date: Thu,  9 Mar 2023 09:44:56 +0100
Message-Id: <20230309084456.304669-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309084456.304669-1-pbonzini@redhat.com>
References: <20230309084456.304669-1-pbonzini@redhat.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Functions that can do I/O are prime candidates for being coroutine_fns.  Make the
change for the one that is itself called only from coroutine_fns.  Unfortunately
vmdk does not use a coroutine_fn for the bulk of the open (like qcow2 does) so
vmdk_read_cid cannot have the same treatment.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/vmdk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index f5f49018fe4a..3f8c731e32e8 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -376,7 +376,7 @@ out:
     return ret;
 }
 
-static int vmdk_is_cid_valid(BlockDriverState *bs)
+static int coroutine_fn vmdk_is_cid_valid(BlockDriverState *bs)
 {
     BDRVVmdkState *s = bs->opaque;
     uint32_t cur_pcid;
-- 
2.39.2


