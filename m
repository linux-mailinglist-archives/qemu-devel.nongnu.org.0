Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 677A547A0EB
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 15:26:12 +0100 (CET)
Received: from localhost ([::1]:60428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myx8d-0005SW-H9
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 09:26:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx2s-0003ex-6z
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:20:14 -0500
Received: from [2a00:1450:4864:20::52b] (port=40623
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx2q-0006Mi-JC
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:20:13 -0500
Received: by mail-ed1-x52b.google.com with SMTP id z29so27732721edl.7
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 06:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bxjewu8xAoe2o5vKu5a0q8tM8PGVblCdED+dQbhjA90=;
 b=KpwyBeBzUjf6VcMUH36iBZCSbeJBSrIVMbbDe1a2/nfMhakVjvFjFqMKFk44Kb3fki
 NhNJKEiU9VQkj/4tLijtUlGJKItlo6wFynLfKb7ChokTs6Roh4elUio4lqscA0IQ9sGB
 EXhETZEExE5FpuisExNHJWzg/BMUC5a2VyWHIF7WC336jaKDnL+6SQxpP8cONBrv7z/M
 FF0cgbExII9Ec9ndJDp3T8zoHqvBY583P2pf0fWceRL10jRgK0HBI1OGUi1Jis4431B+
 Cf1YD0NMqsrXOHrATC//jR8UPY9eCdwWTyr9ikcWH7aL9sB4SFxrhz8/klYcBz4ddQRZ
 vwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bxjewu8xAoe2o5vKu5a0q8tM8PGVblCdED+dQbhjA90=;
 b=6fKxDobW/qvG4HjJhYo9WxiMkK45OZZ+1lHbtBQMPhH/3HbbB/V9+5wpNKrQoAJrQb
 T5sZzId+FocqDa2j3zRfieO52fUSUIYWFcZl8d7swZSpPxhoLjoOKyl/zKfB8Hy1I3bN
 UZ4O2bvVtR1IcJWU92xF745yQHZCfsD3aOXpWvOMipah5ljNeW5jgTAlGbe/3vTLeKFn
 oLQZU/9hGkTmrNtw03voc5nDitbemATmvUS/FIpDmgOkJ8SaqM9WDw4hDY7mR7qZ14PJ
 B46yQQRT90/9mraZABQSmtDHoJFFvkWy5gLUSvRG+SnBYQFTbL8L9An9M0hvtNrU9Tmi
 lROA==
X-Gm-Message-State: AOAM532VeyNnQXwW/hmGgk8q/fihlHrF26eblVz8GNmRQhgVObGGVRmY
 +85j1DmZ1Mw4iTdAsfPn19wocKy6QZc=
X-Google-Smtp-Source: ABdhPJwV+8bwsHIf8xjJdrECGs0ER+lhfIveEYul0Qcuj+SMZ4an9ot1k4eirFYDS7vrhjJlXVe97A==
X-Received: by 2002:a17:907:1b11:: with SMTP id
 mp17mr9535148ejc.374.1639923611429; 
 Sun, 19 Dec 2021 06:20:11 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id y19sm5791584edc.17.2021.12.19.06.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 06:20:11 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/16] hw/scsi/megasas: Fails command if SGL buffer overflows
Date: Sun, 19 Dec 2021 15:20:06 +0100
Message-Id: <20211219142008.248807-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211219141711.248066-1-pbonzini@redhat.com>
References: <20211219141711.248066-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

If we detect an overflow on the SGL buffer, do not
keep processing the command: discard it. TARGET_FAILURE
sense code will be returned (MFI_STAT_SCSI_DONE_WITH_ERROR).

Reported-by: Alexander Bulekov <alxndr@bu.edu>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/521
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Message-Id: <20211119201141.532377-2-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/megasas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 4ff51221d4..8f35784100 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -303,6 +303,7 @@ static int megasas_map_sgl(MegasasState *s, MegasasCmd *cmd, union mfi_sgl *sgl)
     }
     if (cmd->iov_size > iov_size) {
         trace_megasas_iovec_overflow(cmd->index, iov_size, cmd->iov_size);
+        goto unmap;
     } else if (cmd->iov_size < iov_size) {
         trace_megasas_iovec_underflow(cmd->index, iov_size, cmd->iov_size);
     }
-- 
2.33.1



