Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DBA502B2C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:42:51 +0200 (CEST)
Received: from localhost ([::1]:54724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfMDq-0007cF-CK
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLsD-0007G2-KS; Fri, 15 Apr 2022 09:20:31 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:33537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLs8-0008Ir-HH; Fri, 15 Apr 2022 09:20:29 -0400
Received: by mail-ej1-x633.google.com with SMTP id s18so15440600ejr.0;
 Fri, 15 Apr 2022 06:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uQh22lnufKAWgD5CqwEj3x+kz0+ZoWkWusiZbQ7A4AM=;
 b=lv6P6olkgWSZadYPGtN+SHgR4ERLXdHne+/PBaFEA2mu2Q67256HOqfv5QmEjnuztf
 iUcs2RkRx2HXvcr7qGugdpxxw+pheicaApR+wHnGqzOcAyB6ZlR4/7VDqxgX5zxeWJ4Y
 ZorgIp78qDkMw2EylXl3CI4QMHjTQE7u6xrlbK3w3VIq44bKS9W4rIxdNFDedWgORl/0
 VkSeNUfCSMx9SaplEPdAxAku1GNdbBa9ZmEyFqgFzBAYPAExQZFdXldenDS3kwfespkF
 Gr4BsHqjG3ho0yuweO4cYhuxtSjCZf84UR1uaSCZrIQjGJ5W+b4Bq7u0Alj+Hmske7JJ
 Gwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uQh22lnufKAWgD5CqwEj3x+kz0+ZoWkWusiZbQ7A4AM=;
 b=uRaH8rd2P1N9uGchzP333RjZG2ULxJmbemOsM0KvNgSxdLHijuRLp7f4+7pV1QxEdc
 BlrjzLiDvaFLyup3gRnq4Abqv1lxFFp6z75HpM2Imdv53gPNFZGCvDnRlg/39egCl5PE
 r+W1Q17Acy8cADB4l5ian+XxEW5WeoW2LZjmt+suRzY2C5DRQaVr0q4AqykDcuBX1mz4
 DTxQ/OiW7YGUyelgc2Z82FBTp2PbJ0QvKRVLEVPqPSTXYtI7HWNC6HbCvQXdmGF7kGOu
 wR70fbFIQ5CMSSoWRsSg9wQZO0e/Oz2QXA5GbDSBGkskuxPmcCCMabunldwv4JOnK5cl
 +btA==
X-Gm-Message-State: AOAM532Drn6nWkgvAyyEyzbtXAisGw5khd94V2aYDPgqNl3uWEvVdmZ3
 vcKCoEWpvLMsiaWaX0zMHHX46Ns97uneKw==
X-Google-Smtp-Source: ABdhPJzBuPzAZyG0Llqov/owBzanUTWDZwjS6XADfh1d7wpulwr4tvgzZBW0Jz1zPTh9KyifhuA0SA==
X-Received: by 2002:a17:907:6e0d:b0:6e0:59ae:21f1 with SMTP id
 sd13-20020a1709076e0d00b006e059ae21f1mr6384387ejc.362.1650028821499; 
 Fri, 15 Apr 2022 06:20:21 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:20:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/26] curl: add missing coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:18:50 +0200
Message-Id: <20220415131900.793161-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415131900.793161-1-pbonzini@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: malureau@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 stefanha@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/curl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/curl.c b/block/curl.c
index 1e0f609579..cba4c4cac7 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -855,7 +855,7 @@ out_noclean:
     return -EINVAL;
 }
 
-static void curl_setup_preadv(BlockDriverState *bs, CURLAIOCB *acb)
+static void coroutine_fn curl_setup_preadv(BlockDriverState *bs, CURLAIOCB *acb)
 {
     CURLState *state;
     int running;
-- 
2.35.1



