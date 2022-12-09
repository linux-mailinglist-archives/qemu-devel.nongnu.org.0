Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CCC6481D4
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:37:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bWC-0004tk-Ge; Fri, 09 Dec 2022 06:26:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUb-0003xS-Gl
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:24:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUY-0000yG-VR
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:24:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QAW6f5Ww8mIY4+U+CCrsUVvJqjkHLnfYiUIZfiFUURc=;
 b=bRAEr44U+3gb7fNTE5bA/nUD7+uZqCh/9aHfTuxIpKXnV+0TLuEkqpuGl37+DBeNESc/Ot
 iSy1SDPtbEv5iLDC85xlsiT77G2yrVbDsERzZoqLQpM6FzzGAuUGXaAIPSWuNZhsdrId4I
 6GGI+4a9dSg2rKq1/6jrRtiDFNH9Aes=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-397-3tI8VNb-M8OYlRmLkMRx_Q-1; Fri, 09 Dec 2022 06:24:32 -0500
X-MC-Unique: 3tI8VNb-M8OYlRmLkMRx_Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 v4-20020a056402348400b0046cbbc786bdso1201324edc.7
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:24:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QAW6f5Ww8mIY4+U+CCrsUVvJqjkHLnfYiUIZfiFUURc=;
 b=dWbfT75bKue5mNX6o9MlZPHLY7MZ3Iphnv7UpBONi9h7fw25Cx5Xu6A4qm9jwYIcrY
 sc1eKlayQv210Ts9zPO3FfO2lnlVD4TbNblVhkcsRRTCKti83M2n6wRvwNP+li0SQRty
 pwBWTfHSO1N9RAChIzARVK4YEVuACov8xqlG5DDXw2+eTiF6Bl+c85yp0jJ5JBSsRHIu
 gB6ok85FOcBCMQBsK4BH1gw2ePjHjJZI+f/uaVDYQXHJkTYpAXF/dUF/ZpGfNI8DyqTF
 FV490HUEMg8+ukrDVFT9L0YR2qgngM1hdQkL8TB9VWqgs++2MhpvF7fFZdHEQgKrTpDY
 GaTQ==
X-Gm-Message-State: ANoB5plwN1cKmals2U+a0jmGBzwiQBINNUfsPUy53tcIOB3MtwTvwGTv
 q5PSwtU1liS0AaWznQ+ddb0NY/QxuLMHCXhAD6BgysdG1Kd3dX0S6yjQ/9wrx0Oq0BlE2E42tQW
 yCNn3xH0vE7fw7XBVvfikOw0VYijo7sBthyJLXsrXjhizSTTUi2MHeubDwuAoIjhNrCs=
X-Received: by 2002:a50:fb91:0:b0:46a:732e:fd29 with SMTP id
 e17-20020a50fb91000000b0046a732efd29mr4761757edq.42.1670585070802; 
 Fri, 09 Dec 2022 03:24:30 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7SRVwjtDgPYQVDvzbPw4CAQ1sGKfqjcaXyhRt6HnL6yrtq4eeV839Yk3OBEEePk21EmiMjWw==
X-Received: by 2002:a50:fb91:0:b0:46a:732e:fd29 with SMTP id
 e17-20020a50fb91000000b0046a732efd29mr4761739edq.42.1670585070467; 
 Fri, 09 Dec 2022 03:24:30 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a056402164c00b0046bada4b121sm517027edx.54.2022.12.09.03.24.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:24:30 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/30] meson: support meson 0.64 -Doptimization=plain
Date: Fri,  9 Dec 2022 12:23:46 +0100
Message-Id: <20221209112409.184703-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209112409.184703-1-pbonzini@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

In Meson 0.64, the optimization built-in option now accepts the "plain" value,
which will not set any optimization flags.  While QEMU does not check the
contents of the option and therefore does not suffer any ill effect
from the new value, it uses get_option to print the optimization flags
in the summary.  Clean the code up to remove duplication, and check for
-Doptimization=plain at the same time.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/meson.build b/meson.build
index d61c7a82f112..dbd0b5563446 100644
--- a/meson.build
+++ b/meson.build
@@ -3752,18 +3752,16 @@ endif
 if targetos == 'darwin'
   summary_info += {'Objective-C compiler': ' '.join(meson.get_compiler('objc').cmd_array())}
 endif
-summary_info += {'CFLAGS':            ' '.join(get_option('c_args')
-                                               + ['-O' + get_option('optimization')]
-                                               + (get_option('debug') ? ['-g'] : []))}
+option_cflags = (get_option('debug') ? ['-g'] : [])
+if get_option('optimization') != 'plain'
+  option_cflags += ['-O' + get_option('optimization')]
+endif
+summary_info += {'CFLAGS':            ' '.join(get_option('c_args') + option_cflags)}
 if link_language == 'cpp'
-  summary_info += {'CXXFLAGS':        ' '.join(get_option('cpp_args')
-                                               + ['-O' + get_option('optimization')]
-                                               + (get_option('debug') ? ['-g'] : []))}
+  summary_info += {'CXXFLAGS':        ' '.join(get_option('cpp_args') + option_cflags)}
 endif
 if targetos == 'darwin'
-  summary_info += {'OBJCFLAGS':       ' '.join(get_option('objc_args')
-                                               + ['-O' + get_option('optimization')]
-                                               + (get_option('debug') ? ['-g'] : []))}
+  summary_info += {'OBJCFLAGS':       ' '.join(get_option('objc_args') + option_cflags)}
 endif
 link_args = get_option(link_language + '_link_args')
 if link_args.length() > 0
-- 
2.38.1


