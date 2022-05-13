Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 516855266E8
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 18:20:57 +0200 (CEST)
Received: from localhost ([::1]:39070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npY2C-0002Fd-Ck
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 12:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npXsq-0001Hr-Os
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:11:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npXsp-0004dy-7U
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652458274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UD1ktUjeIsHgoVdsvsoK6vrVzweAvHuK/QoZj+edBNI=;
 b=XiGEZRZGAxmJry/hS74w0BtwPGnWYXU05xHg5hDUfJJgagY7RgUGdwBynm6pa/jdcjrYLS
 uLwHZYRXUMWSkLGAAjieAZy5TUdFXDHNW9Y21eTCcQYYoC4EcA7xiwmetO6PDvuWSOwxAx
 /i5JV03qxiBq8+j95stuO1NDXCSQkfY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-jWRuv_bKOOCIRuR4kuYUgA-1; Fri, 13 May 2022 12:11:13 -0400
X-MC-Unique: jWRuv_bKOOCIRuR4kuYUgA-1
Received: by mail-ed1-f71.google.com with SMTP id
 k12-20020aa7d2cc000000b0042a2d586c56so3999214edr.17
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 09:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UD1ktUjeIsHgoVdsvsoK6vrVzweAvHuK/QoZj+edBNI=;
 b=eC/99jej2koYGurjJMivKUmqk8oruYWs9tDnjYusNE4Bq47LJFkxosGfMAnNuG447k
 km52Y1KSIYfjBZhc0cW7VRbIn14sDmv6rVdBmiPzcHWwXoBcXXQVlX6bAe3x8QyPGNfF
 14yQXCfGOi4e/FNM3BJU9YsXqXbnUkGqpiunHQkVvLYqviN/PMNe6tpkWAcaKAfsLxF+
 waGCnMYy7eXt3ISQl/GvaPPUyvDtZswDRP0wQZo3XfseeA7oDRLYOPHaNBA11KuWC70p
 Qxqwc7p3wN775JtrKqrtFTMpHKaPwgXLXRiHp0nwNuwnErosTjJro3jRvfS0V/oR5oQI
 rU8A==
X-Gm-Message-State: AOAM533yfkEXj0kS8fUJkY91JCfmvfCCd9gl11iuQjaq5YikEBBZgZUA
 RUEL1ZOX3uCGJOgWu1k9J52W0mDUJd30JurLH7B4Lz6KimSXCE2ULq0Mx8MjAyUYMps8AlJF8hI
 RSzidk/qF0m05IGSm3scTSFlWRPgBU2OWbdFVBazVQbhLJqFSUoZj05N7e30Zt16bO/M=
X-Received: by 2002:a17:906:4fd5:b0:6f8:5aa9:6f13 with SMTP id
 i21-20020a1709064fd500b006f85aa96f13mr4947644ejw.267.1652458271828; 
 Fri, 13 May 2022 09:11:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkaMT1IcMPgNiyd1aPE+1s9ej/oxgI7SCM/hvEAqdag6gTEF1Y0Y8pyQYqwDW7cC281RHyTA==
X-Received: by 2002:a17:906:4fd5:b0:6f8:5aa9:6f13 with SMTP id
 i21-20020a1709064fd500b006f85aa96f13mr4947620ejw.267.1652458271552; 
 Fri, 13 May 2022 09:11:11 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d27-20020a056402517b00b0042a2ccdd2b8sm1110505ede.70.2022.05.13.09.11.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 09:11:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: remove another dead variable
Date: Fri, 13 May 2022 18:11:09 +0200
Message-Id: <20220513161109.1125222-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index c8b5b99532..dda25f05bf 100755
--- a/configure
+++ b/configure
@@ -1992,7 +1992,6 @@ fi
 if test "$static" = "yes" ; then
   echo "CONFIG_STATIC=y" >> $config_host_mak
 fi
-qemu_version=$(head $source_path/VERSION)
 echo "SRC_PATH=$source_path" >> $config_host_mak
 echo "TARGET_DIRS=$target_list" >> $config_host_mak
 if test "$modules" = "yes"; then
-- 
2.36.0


