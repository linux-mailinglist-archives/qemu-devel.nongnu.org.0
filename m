Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59292700BFF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 17:36:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxUmy-0003JO-Gw; Fri, 12 May 2023 11:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUmw-0003IA-Nv
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:34:34 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUmu-00060f-1p
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:34:34 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3078aa0b152so5108487f8f.3
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 08:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683905668; x=1686497668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XS1NtYn5iwPNS9VhylpiqLFc8xoyrR7WGR1e+ZwATeA=;
 b=g6aMt2lZWFzdNN4G33fNPgujoR7YBhLNT2gSy1wrhFyOIle904SOMimGxvUf//cstq
 gAjmOt9/4ypvj87Ydnb1Fht4ztsgmrb8TQDUC23C01+bQhEC9Sw4rAbQXxZqNSJ/CA/Z
 0yT1eVW8jYzKITihSDqVdFLsXhOeB/XT48POPR8JjiQloikzooxVaUAgCjYqfAv9y9N0
 RYNBVVeZ3JEH60Esie8L3FW6+g2/o/u7mpmtIFzN6X+fCFAnbQRbwQ9dJZ+ExS+tOmpe
 LR6MmpPjr/un2QUq4khCIxY3xSLNek986v5BIWvm8fkWjrU9JJxoRNjKnmZzAyvE0Y/g
 ML6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683905668; x=1686497668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XS1NtYn5iwPNS9VhylpiqLFc8xoyrR7WGR1e+ZwATeA=;
 b=NERtNmbQ2Y8zK9s+z9BUrg765pD+a0wO+A3D8OZYymbV71nHl0RE2o9ZDGAe6bqE5+
 U3eI+oOLdvqZ3PkVppZ0Nq1EBfRj+1YgUChH4FKl2u5Bpig1BdLvvM6CoCwfZpAGwtmt
 /Igc8BaA0ne4MXMhPOHPN5zsipWtejM95AvRILsy9dq2ll7Vm/s8Z+twLO4tYvIRDnWl
 dwI+CBIj8Ozbw0JaFPYaOtuJ2j54do5xwqqnhXhXvpzAQeMWf5wkvPRlt4NyqwigouaT
 QinAyNFs1ijv7/GazLO1tUIpQNyzUCsAuaixko8ams5KW6EmQM9DpafBYWk78yfestbi
 Xe+w==
X-Gm-Message-State: AC+VfDwUpCcUjTlY13dRxpJcAk8WyoSolId4s+2VksGVGRj5J0g9YsmL
 Es9Ydegw2ntlmVNhD4nkHXQ7rvQ8i+W5VUdiwf4=
X-Google-Smtp-Source: ACHHUZ478s+tsScnWDX/oeWpVUiblAeiEb1lk5D/Utt3if1UAgMxdYLtOlB3NDKH6DF1Wze1Ezs4AA==
X-Received: by 2002:a5d:594e:0:b0:307:8691:1ea5 with SMTP id
 e14-20020a5d594e000000b0030786911ea5mr14626380wri.26.1683905668528; 
 Fri, 12 May 2023 08:34:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b6-20020adfee86000000b002feea065cc9sm11721297wro.111.2023.05.12.08.34.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 08:34:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/12] MAINTAINERS: Update Akihiko Odaki's email address
Date: Fri, 12 May 2023 16:34:16 +0100
Message-Id: <20230512153423.3704893-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512153423.3704893-1-peter.maydell@linaro.org>
References: <20230512153423.3704893-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Akihiko Odaki <akihiko.odaki@gmail.com>

I am now employed by Daynix. Although my role as a reviewer of
macOS-related change is not very relevant to the employment, I decided
to use the company email address to avoid confusions from different
addresses.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20230506072333.32510-1-akihiko.odaki@daynix.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f757369373f..ff2aa53bb9a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2566,7 +2566,7 @@ Core Audio framework backend
 M: Gerd Hoffmann <kraxel@redhat.com>
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Christian Schoenebeck <qemu_oss@crudebyte.com>
-R: Akihiko Odaki <akihiko.odaki@gmail.com>
+R: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Odd Fixes
 F: audio/coreaudio.c
 
@@ -2850,7 +2850,7 @@ F: docs/devel/ui.rst
 Cocoa graphics
 M: Peter Maydell <peter.maydell@linaro.org>
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
-R: Akihiko Odaki <akihiko.odaki@gmail.com>
+R: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Odd Fixes
 F: ui/cocoa.m
 
-- 
2.34.1


