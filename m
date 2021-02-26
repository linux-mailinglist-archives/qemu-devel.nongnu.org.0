Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2AE325EAC
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:12:41 +0100 (CET)
Received: from localhost ([::1]:41970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYEq-0007TK-HX
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY81-0001kE-AR
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:39 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY7z-00046O-6D
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:36 -0500
Received: by mail-wr1-x42e.google.com with SMTP id l12so7666997wry.2
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QvpruKzy7iRxPp+WZJ5J+qLhT0FlaXM1xbg2aJJPmEw=;
 b=nxyyN2v+QLCKsraT2/E3LPLe71TivsOK9VppdfpUoxeNE0nnqOgpI79qZaN3dSBLUa
 RsZ4xFvg7ZsYMzroS8jaqspNpfwFODOPIEFiRwMtxf8dL8dzBxtPgBaEp1Onlaco9xYe
 4eJT3JmQ9jVlfHdDQIRm1hrkemrAauxTQFnFsqw6jQLXtkl1zzEGIuZh7bZUpRKEkjLk
 qFogatc7Acrzc+hZYwKgHTvkrnAp5SphKKG2NeNrZ8lSMTJ9DAsy5zoeFeGrl9AztCc+
 9ar/8lHweNeiqlAeq5ShkZDv4d8GhV3Yt4f0WaeyJxDbpEWUyLdwd8BWJ98diC7DhOf6
 0qJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QvpruKzy7iRxPp+WZJ5J+qLhT0FlaXM1xbg2aJJPmEw=;
 b=fbbsQo0L5bLidrxaMjTitvXjpNZ9x5wneaRN86Fq5+0GnezJdnPVQe5h/kfwaVMWWz
 zMfruWZZJGf2ClsuZgdWsYDYohEz/7w+lSSpbDP3nFLuw0pGkTSMKNiCTyZ0FF6PIp8H
 DsfZvhUgr/y+b88x0YWs9bqQIhmlJaacGJIhm0tkU9OIHm06zuVvhaGnMk9/TNONzAwW
 uXz1QWcXk0ZEu0qx2BvYE/kn9w8/Qsm8zoejb7lDpl255B3xBRbAjDENIqhUxwI3/4SV
 39iKGkwB6og3HH+3iW7Zf9pbCyYvATAIVj/RiIPDflxQfFlNfwqYEyETCgyFR2FfuroO
 OiRg==
X-Gm-Message-State: AOAM530hWIt2kvyoTFVSg/qrEVQAgUKVi57l7YY3VIZD2PQhZIX+zm3W
 XPPnKLfu0BjNKRFekZL2/BjoexqgpMY=
X-Google-Smtp-Source: ABdhPJxZ2KzNvpnX8F9XH+fwf2Ync52jwOuZ/7bDzRCNPI+Fw6QTolVBTYxG6wzxa+nfu1mkB4YegQ==
X-Received: by 2002:adf:aa08:: with SMTP id p8mr1829595wrd.232.1614326733735; 
 Fri, 26 Feb 2021 00:05:33 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:33 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/29] scsi-disk: do not complete requests early for
 rerror/werror=ignore
Date: Fri, 26 Feb 2021 09:05:06 +0100
Message-Id: <20210226080526.651705-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When requested to ignore errors, just do nothing and let the
request complete normally.  This means that the request will
be accounted correctly.

This is what commit 40dce4ee61 ("scsi-disk: fix rerror/werror=ignore",
2018-10-19) was supposed to do:

Fixes: 40dce4ee61 ("scsi-disk: fix rerror/werror=ignore", 2018-10-19)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-disk.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 18ab777017..36aa872445 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -253,8 +253,7 @@ static bool scsi_handle_rw_error(SCSIDiskReq *r, int error, bool acct_failed)
 
     blk_error_action(s->qdev.conf.blk, action, is_read, error);
     if (action == BLOCK_ERROR_ACTION_IGNORE) {
-        scsi_req_complete(&r->req, 0);
-        return true;
+        return false;
     }
 
     if (action == BLOCK_ERROR_ACTION_STOP) {
-- 
2.29.2



