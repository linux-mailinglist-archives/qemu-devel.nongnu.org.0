Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8126D4A8D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 16:48:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjLSU-0003tU-Vv; Mon, 03 Apr 2023 10:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjLSN-0003rB-Hy
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:46:53 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjLSK-0001Ab-Bx
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:46:51 -0400
Received: by mail-wr1-x42e.google.com with SMTP id h17so29612124wrt.8
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 07:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680533204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LArqj9VknOgkBTyyuZYG07qAUGjDeEnsQCmGlUFbOUA=;
 b=A2TzxACFJnrY4WLj6EcX7+S/Jn4raH69LlL24IDU/qGSCsS3bIBrU1EKVt3xXzrIJT
 iHjTLzemQHTLaPyWgB2FyZ316WLhFD/RbMCQAeG0dcUyCZuQboKMWzrQynhaUO/cOTsC
 drIDdG5Fvi0XhZ/cKv+A8dgM7OHXzWOa+qZ7ogKaZFLCT+cMS+TxlMYw3fNFRJnqoTYA
 bQslCl5PdK1+ZOjkt9WuJhyNWEXJWqtumv8GJZGdFtfnl4NYLiMgWjnRTxJkjlG9Cc2W
 q65TI6pnsHE6BtQCQjzEEto27NJZMs8Nkf4a0bbWUQf63XcUmtnPNmPfvAchv17wNGF7
 3SsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680533204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LArqj9VknOgkBTyyuZYG07qAUGjDeEnsQCmGlUFbOUA=;
 b=ZM9z5aPN5aU7VqkQR0HdhBW039aEgaWUwys1XO+AO2Syq4ClzeuCnK5GVM3JKRbRqP
 KrhB60CoJBaHSGqWLB3siiaJnxoRWDiNRcm87bkQc2tF0MTlavysPHUvsGEBSVqdLf9e
 oouqKJchzL8Cx0Zn9P6uPro6n+Pi1wLHIc+kejGJnewDtxYvhMlhaxbrsGsBELruuJr2
 Pkw0nD7dHUqs1jutHNFZyR8XlY4ooivUwwCw/ZruZq7QbHVMQ01FZ8y1zMwHu8V6sA57
 kx+YcIjd5NtrNHkgh97ZMbEzK0y2ZCHXn+Swfu81ETBP5/LmpOBI3IQHBxRBxGR9wSdP
 H3mA==
X-Gm-Message-State: AAQBX9d3rocgB/8pw0cygW7PhfXNN2bwiIjFlMgTUDIlCt7ef0uCBbmS
 wgJo01mxWr+QeRqydYqCgVR+3XbgF6cnJhQbAj8=
X-Google-Smtp-Source: AKy350Z6VXOQ0RgqPg/boF5Sjtq6Pt+rs4OfnScG3tuX4u32Q7QpDuSVBOEAqeA4yd82V0QCaFuJsg==
X-Received: by 2002:adf:d08a:0:b0:2d4:99f:6701 with SMTP id
 y10-20020adfd08a000000b002d4099f6701mr24919882wrh.58.1680533204517; 
 Mon, 03 Apr 2023 07:46:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a056000018400b002c56013c07fsm9786747wrx.109.2023.04.03.07.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 07:46:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 09/10] qapi/run-state.json: Fix missing newline at end of
 file
Date: Mon,  3 Apr 2023 15:46:36 +0100
Message-Id: <20230403144637.2949366-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403144637.2949366-1-peter.maydell@linaro.org>
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The run-state.json file is missing a trailing newline; add it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Noticed this because my editor wanted to add the newline
when I touched the file for the following patch...
---
 qapi/run-state.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/run-state.json b/qapi/run-state.json
index 419c188dd1a..9d34afa39e0 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -663,4 +663,4 @@
 # Since: 7.2
 ##
 { 'enum': 'NotifyVmexitOption',
-  'data': [ 'run', 'internal-error', 'disable' ] }
\ No newline at end of file
+  'data': [ 'run', 'internal-error', 'disable' ] }
-- 
2.34.1


