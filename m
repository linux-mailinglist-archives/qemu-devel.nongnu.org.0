Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4863243BA
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 19:27:09 +0100 (CET)
Received: from localhost ([::1]:43422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEysO-000435-8V
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 13:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lEyqJ-0002JH-EA
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:24:59 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:33091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lEyqH-0004lo-8N
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:24:58 -0500
Received: by mail-ej1-x62e.google.com with SMTP id jt13so4673791ejb.0
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 10:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QvpruKzy7iRxPp+WZJ5J+qLhT0FlaXM1xbg2aJJPmEw=;
 b=KH4gf+iZbX3Ocwqz+RHnkMgyB/oaD0nmiDgkjS4PiWw6YPIJpfoWfeIatX86n70glN
 AlyOvHZzZgFaaD7WekpFCkw1zbamk4mkdWFNEuffIsne60rUl1NKox/nqNDHrjbTyKP3
 nR1VrNnM1ThxMKo1vwkeUpGr0dd+Kc9IVVmEnt9shOgY5Q0lnQMBwduNM+ofkqbM03T3
 U7bBxna2DeyB9F3MvvyOmxvUCsh5F0v/vD2j1NECTYPRMZrJ6jVC50Er38MEdlqwTi/T
 YYRat61ad+MdLARPfbf+UhpxzlebC61TVl2Mw3E+0WjjOR94D2PavxKorqWsOhVVk1Tv
 1+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QvpruKzy7iRxPp+WZJ5J+qLhT0FlaXM1xbg2aJJPmEw=;
 b=F0HP0ypi/PRdm9sbApoOqC+2P7oPJF880vC8X+zUOnpJuDZ2GrwmhQwABykbES1wwW
 N3ib4OdDUVF3KnE0gcJqq+IkgOM0rALSaqED0xETjWzu+NSZBKtu0aMeEMP/Z4b3BqeF
 tuq4ZAsrsVxUNgSlckifGWswAE91Cg2l7VEv8aGd79WqFW9d/TxU33q/I8Oy4MTrlG86
 bGh9+ZZZp83boDPpgxJevMWootnvVSSgWjHvsfFf3UJAbNF4WfHg/VUG2HKybTVvu7c9
 0VxhJcFvgt3vyqrTiuCEV9HFFyVDeie3H5rw/rXACXaPNn8RqRBqZCrqchumXf4U0eFC
 w9+w==
X-Gm-Message-State: AOAM530NTQERw0oPXKpYXwoWRW/MyDk4IhbrKsrudrU/JxOsFFd4L7Km
 H0hK63pV7suJmR4ktkwprhSPKS9PXcM=
X-Google-Smtp-Source: ABdhPJwdNiMKW4WJarITs9U65tE7mEzID+tA92tnwKTj+waQNmjwgQ7nBXXTlO4WYGtrT2nnR6BzKA==
X-Received: by 2002:a17:906:c45a:: with SMTP id
 ck26mr3624552ejb.125.1614191095920; 
 Wed, 24 Feb 2021 10:24:55 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bw22sm1791172ejb.78.2021.02.24.10.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 10:24:55 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/10] scsi-disk: do not complete requests early for
 rerror/werror=ignore
Date: Wed, 24 Feb 2021 19:24:45 +0100
Message-Id: <20210224182453.587731-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210224182453.587731-1-pbonzini@redhat.com>
References: <20210224182453.587731-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: hare@suse.de
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



