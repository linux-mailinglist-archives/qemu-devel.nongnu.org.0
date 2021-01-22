Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3FB30011E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 12:03:33 +0100 (CET)
Received: from localhost ([::1]:39046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2uE0-0002Ok-4b
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 06:03:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2u9o-0007Sq-W1
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:59:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2u9g-0003rO-9p
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:59:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611313143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g4EDW26wqJzvbldi/AmeB50uRCleZG3tNbcnAK553ZI=;
 b=QLaVFyKfaShGL/DEEmzkK+VXJEvm6RtpkigEU/66ceKphsWpFS4IhxzY3n5LgRHHOQfswS
 uKfSkIgu6hyGF4vk0G+w2Axvacvg/SXN07mIrW/RJMVWiQlOtd25yHV9iUyKfBEzRFD8MK
 0AX9+DWDI72FI67RX2hCOPE5cl273Y8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-F6fSyW76NP2ZyG_ZeSDOVg-1; Fri, 22 Jan 2021 05:59:01 -0500
X-MC-Unique: F6fSyW76NP2ZyG_ZeSDOVg-1
Received: by mail-ed1-f71.google.com with SMTP id t9so2738720edd.3
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 02:59:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g4EDW26wqJzvbldi/AmeB50uRCleZG3tNbcnAK553ZI=;
 b=Hay/DpXltBcteSvOcJ4IfBYITJNyYdsj7pNL3fX3XXl7W0Cc/RLU4EM4SidVkXXXdE
 vKUfwP3VBDu0lbhO44HTc2qSykh7Z52nZMOz3KLBPqZEyXxAVHQhmfED2l5J1heJ52Ul
 xPChZ3o+Js3HF/cpupDMEMer5KDwJyWMYMILS3MkNeTcwpa9QDEbVl4BS5INmKu6is7X
 NTASJn3wPESacPXLSPBDhJxF1meAURu1pULUG88ifc2Fi4ptb/BYt7z+sanlxMyoUaGE
 OMam/R3wN+bi5ESqXzLwheITAY4i3USs7HA9FdRUjfwoxGtc9cXhr1RLE+Ct/PXH1Uuw
 5Mlg==
X-Gm-Message-State: AOAM533doLINcWpPqIk4JZePNgXLN4p4EWnmrddDLS9WthKlMhM/ibNn
 TZhu8EmnpQDO+tYl2F4M6flpwgLnCmGJcVXXAcSM5WJzTxtqvBrT7G1pBZlnbyfblU54LYuiJFz
 jtlSrvBd1TUs8io3IxQxglzjvzPyrj//oiRJOVOe+2KWkv02VOrglCZoYMlbw/FhA
X-Received: by 2002:aa7:c94a:: with SMTP id h10mr87325edt.247.1611313140336;
 Fri, 22 Jan 2021 02:59:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwL+8ju/0d0X7lZcqJhWEo9y75bFTmkAXG2IM9QJl1rh6fBJbCLgLTnzUtjOXo7rjbybTpWiA==
X-Received: by 2002:aa7:c94a:: with SMTP id h10mr87311edt.247.1611313140199;
 Fri, 22 Jan 2021 02:59:00 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z25sm4134918ejd.23.2021.01.22.02.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 02:58:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 4/4] configure: Reword --enable-tcg-interpreter as
 --disable-native-tcg
Date: Fri, 22 Jan 2021 11:58:36 +0100
Message-Id: <20210122105836.1878506-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122105836.1878506-1-philmd@redhat.com>
References: <20210122105836.1878506-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Users might want to enable all features, without realizing some
features have negative effect. Rename '--enable-tcg-interpreter'
as '--disable-native-tcg' to avoid user selecting this feature
without understanding it. '--enable-tcg-interpreter' is kept in
for backward compability with scripts.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
RFC so it can be discarded from the series

 configure | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 71bdc523aa0..5e56fa76499 100755
--- a/configure
+++ b/configure
@@ -1121,7 +1121,8 @@ for opt do
   ;;
   --disable-tcg-interpreter) tcg_interpreter="no"
   ;;
-  --enable-tcg-interpreter) tcg_interpreter="yes"
+  --enable-tcg-interpreter) # backward compatibility
+  --disable-native-tcg) tcg_interpreter="yes"
   ;;
   --disable-cap-ng)  cap_ng="disabled"
   ;;
@@ -1753,7 +1754,7 @@ Advanced options (experts only):
   --with-trace-file=NAME   Full PATH,NAME of file to store traces
                            Default:trace-<pid>
   --disable-slirp          disable SLIRP userspace network connectivity
-  --enable-tcg-interpreter enable TCG with bytecode interpreter (experimental and slow)
+  --disable-native-tcg     enable TCG with bytecode interpreter (experimental and slow)
   --enable-malloc-trim     enable libc malloc_trim() for memory optimization
   --oss-lib                path to OSS library
   --cpu=CPU                Build for host CPU [$cpu]
-- 
2.26.2


