Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7857A3B45ED
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:40:20 +0200 (CEST)
Received: from localhost ([::1]:55350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwn0F-0000Sg-Ff
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfI-0003Ee-S0
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:40 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfH-0003DU-9q
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:40 -0400
Received: by mail-ej1-x62a.google.com with SMTP id he7so15318753ejc.13
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 07:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GjCZXEAAw7qiNbzDIiyL4DTYii0HnblTscfX7SsNJa4=;
 b=M9IOQKpKAR0FvTblWAwjs/P7/R797OtDX8uMSX5QLo2gbW5dG2Dnw2j/9QwfllBmC0
 rz/paPDgjkXXlfioIkJ69Rz9eaYN4R39UIvPGghdGYSPIW0Tq/jxaNVUdZYU6jjb/0B3
 0wlHd9W3C/WScaAZXoQ5KUaSUdFBzjy5YqF1QIrGea4GNmN8COVnfMnX2ZhTBzC0SbX9
 yJjTdv3ngiA+CA8VAWXPqrijdyBPM1F+MQiSTo4oawe3pyvrc1C5xbsX210Y/5s0R4bN
 lG4lYNAjxQpeW2r4/z20JQi+KsB4/f/+VAO0SZAskUJm9WKWe25oX6xmBCPtHM+JoXLf
 J0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GjCZXEAAw7qiNbzDIiyL4DTYii0HnblTscfX7SsNJa4=;
 b=MprDj3jD415l42rF2V3eK6joR5NRXsv9Le4QqRgBEtd8XOarzc3ndqnDpPtubavG03
 JOzjfD7Iv9IqYvjiFE7PEY6bf4280mOjow0JvbzfWizfrZFMJPYJ4dGit92o2rPnr9Q+
 luGvlczyuVCd3HBG7gwFJVphGEPFciVl1jCLBezvpavvoVZKuqxtSksMYOX78W8eDO6Z
 LjdkEvKkYtYmLG/yCkBhiL+sZDg/eWPV1zCljv8O981KcprcFvBqaOuJRhCpaX2Fo0DG
 Krqrl+AQ3YkmyspOLd7C8O1TfCa0tCI0S2e16dbQ02CUVwK1xvQPzUNbaEgA9U7H9LSj
 NXLA==
X-Gm-Message-State: AOAM5334wRwcfIySL5lIH6FoavcwbGsG+akJshybb0mvedij2hhTol3L
 vbZCLd/EUVlMDv0UgqridquM9GHbM/Y=
X-Google-Smtp-Source: ABdhPJxO7iZN7BNyGeRZ+nEFdtmQhZ3MCCFk+BJ/qCTciXK8dDk4TXsWkbRQ1ADXBJ1N5dBhO7zeRw==
X-Received: by 2002:a17:907:8329:: with SMTP id
 mq41mr11038782ejc.319.1624630715143; 
 Fri, 25 Jun 2021 07:18:35 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c28sm326579ejc.102.2021.06.25.07.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 07:18:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/28] file-posix: fix max_iov for /dev/sg devices
Date: Fri, 25 Jun 2021 16:18:07 +0200
Message-Id: <20210625141822.1368639-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625141822.1368639-1-pbonzini@redhat.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
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
Cc: Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Even though it was only called for devices that have bs->sg set (which
must be character devices), sg_get_max_segments looked at /sys/dev/block
which only works for block devices.

On Linux the sg driver has its own way to provide the maximum number of
iovecs in a scatter/gather list, so add support for it.  The block device
path is kept because it will be reinstated in the next patches.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/file-posix.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index b3fbb9bd63..b8dc19ce1a 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1178,6 +1178,17 @@ static int sg_get_max_segments(int fd)
         goto out;
     }
 
+    if (S_ISCHR(st.st_mode)) {
+        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
+            return ret;
+        }
+        return -ENOTSUP;
+    }
+
+    if (!S_ISBLK(st.st_mode)) {
+        return -ENOTSUP;
+    }
+
     sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
                                 major(st.st_rdev), minor(st.st_rdev));
     sysfd = open(sysfspath, O_RDONLY);
-- 
2.31.1



