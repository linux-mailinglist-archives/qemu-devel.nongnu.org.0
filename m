Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 629E2E358C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 16:25:32 +0200 (CEST)
Received: from localhost ([::1]:44102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNe3O-0004JR-OW
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 10:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34635)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iNdih-0006xK-TQ
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 10:04:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iNdig-0007dT-Su
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 10:04:07 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45364)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iNdig-0007cV-IT
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 10:04:06 -0400
Received: by mail-wr1-x435.google.com with SMTP id q13so21264273wrs.12
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 07:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=gC+nKqV0M8tEfDmWGeiuGoh13N0jWlVmQT3b97dNgSY=;
 b=t19Oi9uOmscQZSWZuKOaqFY8j+svlpPXzfbq8HbUlwn17b+uFFJoDuVJLDykV4uFoa
 PGgvffsTlML17kn4vM6C/Kp3CEh84nP1F2N8xM5DbKmfYMuulZHQKhcxsyT8qzglp6wp
 hHKWQKqFvxkxwsRndJEzIEo56vZID027gIUbPyy/7SE0/mF6tFH/CyU/g35DgW+aMkST
 b44jQxyiu2fCSUA6fbytMUNC4DSI0qnx4iopVYGxRvI3ssDelmwl4pA+o3YA/maSwx74
 W51Qt876s+FZt5tGDD4AVJApl2qc+l21PBC9dZ/DjS7640ESD5D8lYLh639HuG606zG6
 HLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=gC+nKqV0M8tEfDmWGeiuGoh13N0jWlVmQT3b97dNgSY=;
 b=WwCQ4s1wjmAX5Gg/gP7WPM1zMP/FFN0rP/YwM74yDRmf9rrDQcYv+Cgg1pHo4bZbLO
 /yfRt8LV6rHM9Zk44bJLGj7rHc282N3zlM1RjAbvBzNHdfUy8v/R/b+EMa1rsceNWYSZ
 r8n145AxYUQ2YiTbriPeQq7YWz7MKc9FhbzZ9boUWSt/AUAlsfSbMrktXXMtpzERKuBk
 fG0ffILK+EaqQmoiZpkYQ+M2YDd5312fDKLLIiqomeg5wQI8VKrZFXYK/ZnMM//cX/89
 Xo4ClDmXMtIbGwEA1DlZ+NpmBbUoWdl1eVvrHV1ezM9VK+4E40YfXbLcFRjLF0eMweAt
 UmXQ==
X-Gm-Message-State: APjAAAW5B7aZDjFfOrTbF9hYvS7KkKVcmVvSs3FvUDIPgZdpWnJqf4JG
 NuyeLRMX/XU1mSrybmZSwC0ejLa6
X-Google-Smtp-Source: APXvYqwnbunzsnWDEn1KcRz9DxmLsbv9rM46Emat3xNHh41RTQVvKD6ORZWsZgMnx2xwjryLR0z5Eg==
X-Received: by 2002:adf:ecc7:: with SMTP id s7mr4016548wro.305.1571925844195; 
 Thu, 24 Oct 2019 07:04:04 -0700 (PDT)
Received: from 640k.localdomain ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id b7sm10610155wrn.53.2019.10.24.07.04.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Oct 2019 07:04:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/39] memory-device: simplify Makefile.objs conditions
Date: Thu, 24 Oct 2019 16:03:22 +0200
Message-Id: <1571925835-31930-7-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1571925835-31930-1-git-send-email-pbonzini@redhat.com>
References: <1571925835-31930-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::435
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

hw/mem/ is only included if CONFIG_MEM_DEVICE is true, so we need not
specify the condition again in hw/mem/Makefile.objs.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/mem/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/mem/Makefile.objs b/hw/mem/Makefile.objs
index 3e2f7c5..56345be 100644
--- a/hw/mem/Makefile.objs
+++ b/hw/mem/Makefile.objs
@@ -1,3 +1,3 @@
 common-obj-$(CONFIG_DIMM) += pc-dimm.o
-common-obj-$(CONFIG_MEM_DEVICE) += memory-device.o
+common-obj-y += memory-device.o
 common-obj-$(CONFIG_NVDIMM) += nvdimm.o
-- 
1.8.3.1



