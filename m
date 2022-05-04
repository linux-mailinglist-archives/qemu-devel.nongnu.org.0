Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A4551AF35
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 22:33:02 +0200 (CEST)
Received: from localhost ([::1]:32856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmLgD-000437-G3
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 16:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmLet-0002fp-FA
 for qemu-devel@nongnu.org; Wed, 04 May 2022 16:31:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmLeq-0005lM-7C
 for qemu-devel@nongnu.org; Wed, 04 May 2022 16:31:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651696294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DIYlM1zcjs7uBiWVUcbszpOWdRDGMPFDgJLi8zN0CmU=;
 b=e7MLPsBB1S1uYcoqaQy+W7h2XshY3/n4HcEg2Y5sGsIhATqnS0SKX4dYEFfL2gpxPgagMn
 GNB3n6ehd+vqGSA+tZQFOx6AqWFUk38Jmvk1iyyL+d8NiJz4mol9CrTt23zMwYVmFvBU+x
 d2UfgvxIBHbCgaoMEqf2zGtGCqynZPk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-corjapowNly73C4HXBLTdQ-1; Wed, 04 May 2022 16:31:33 -0400
X-MC-Unique: corjapowNly73C4HXBLTdQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 dk9-20020a0564021d8900b00425a9c3d40cso1377381edb.7
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 13:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DIYlM1zcjs7uBiWVUcbszpOWdRDGMPFDgJLi8zN0CmU=;
 b=rGCjW16DcIg9IUxPlkrPd/8LvXryUDcnziNcMtqt84GHLtVyGOgriCZta3D0sPI6ui
 ukXpaetcBUnQLT/0BY6f4hKFB6wY0QCyCAeF1p7StJdO4uHN/uI7Yz0e9uK/VE3dvhYi
 8bt5xr5lEbXa8f036bdMEzwPRyd8PtFf+F731YDIFcERW0fLtS706pNgSNRYDPuGBHlu
 rqLyhLpLG6YNTtFW4Nomzqg8I5L2yd+ADEtMD/YottMXSvRiUqPb5BAlT7IuFi/IcIAS
 VntSrwOIdaWjvnPM+Lf+7x7H10W506p/8x5WBTve56IZ9q88MsSrjpx+vzkS1oMgtxAx
 y0sQ==
X-Gm-Message-State: AOAM533KviYcPELOc0AW0QlWJc1zkIlMt88GWkW5BA4dmT9XLdG2WVUK
 osgIxpQ/eE2zvlLfbjOpH/DrAfnBPa4XWrE89u+fwY3TY4n41FkZM4PF+BRPe5BknnZWDyMRHPC
 gifEYLOOvgPqAVkg8WGMrHAhWNdjKjaifqEEh0lu6L/swbPpAiDhFvya8B1FVqmEwguA=
X-Received: by 2002:a05:6402:518c:b0:426:32d4:87 with SMTP id
 q12-20020a056402518c00b0042632d40087mr25223475edd.394.1651696291859; 
 Wed, 04 May 2022 13:31:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/GVkx9TZE/IPs7Z5Sv81IkVbHs/8KM9oG1d0f+u9xV4SVza0VOsy7J/eBP0yLEaizpVPDuw==
X-Received: by 2002:a05:6402:518c:b0:426:32d4:87 with SMTP id
 q12-20020a056402518c00b0042632d40087mr25223448edd.394.1651696291465; 
 Wed, 04 May 2022 13:31:31 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a1709070b0e00b006f3ef214db9sm6033938ejl.31.2022.05.04.13.31.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 13:31:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] checkpatch: fix g_malloc check
Date: Wed,  4 May 2022 22:31:29 +0200
Message-Id: <20220504203129.672944-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the string equality operator "eq", and ensure that $1 is defined by
using "(try|)" instead of "(try)?".  The alternative "((?:try)?)" is
longer and less readable.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/checkpatch.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 4763d02ae7..d900d18048 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2831,8 +2831,8 @@ sub process {
 		}
 
 # check for pointless casting of g_malloc return
-		if ($line =~ /\*\s*\)\s*g_(try)?(m|re)alloc(0?)(_n)?\b/) {
-			if ($2 == 'm') {
+		if ($line =~ /\*\s*\)\s*g_(try|)(m|re)alloc(0?)(_n)?\b/) {
+			if ($2 eq 'm') {
 				ERROR("unnecessary cast may hide bugs, use g_$1new$3 instead\n" . $herecurr);
 			} else {
 				ERROR("unnecessary cast may hide bugs, use g_$1renew$3 instead\n" . $herecurr);
-- 
2.35.1


