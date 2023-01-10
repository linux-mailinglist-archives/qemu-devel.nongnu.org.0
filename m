Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F03E66474A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:20:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFHcW-0000im-U8; Tue, 10 Jan 2023 11:37:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFHcM-0000hj-DZ
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:36:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFHcJ-0004sQ-MZ
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:36:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673368610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AGtYZHa2EQuYr4CRaasP2f35tfcqxIqTJA5CDW3A6PI=;
 b=KHyxmNWnJ8frWdeSuo8I28tsm6e2Kh1ieRXbZlF5fTQKlfsZXtjLs+J5wUWbCOU3xfBU1O
 ke41yZNQy4lUn9OfIxF16pDnRiZi1cJa+iKpV/hhFJcqf3Zz+QutuSZBBV13oCiLR8Spun
 kU3xcUUMWb6Y/2n5Sm9HnJHBPwacfng=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-7-oDn__C9kNN-tjnvdAHN35w-1; Tue, 10 Jan 2023 11:36:47 -0500
X-MC-Unique: oDn__C9kNN-tjnvdAHN35w-1
Received: by mail-wr1-f71.google.com with SMTP id
 b6-20020adfc746000000b002bae2b30112so2151125wrh.13
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:36:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AGtYZHa2EQuYr4CRaasP2f35tfcqxIqTJA5CDW3A6PI=;
 b=U9ob/e6nexFvhPUCpzEsflNDeZwps7Pm1bf1YsrAAomp1UDL/hMzZ9r94G+w+nbJuL
 6T97YPWdXRWbu9brenj3G3l85fHevC8B+JAK82lKq/MJUl5t97Og71UCwK2fK7dkb8Jo
 n0wX3tAsFufP4zH2nU7T02Mt5osaGpog80U9zdAtlL8I4r1GmPav2NCmBaM4rFm5d9gl
 OxByzOMKXh6+VQzeqeyIyQy8DFbtCYPPhs8dtbR9Ob1jQSoX2W1x3BEBqLqHjUK0NBbt
 hygBZQ3wclAOa6FNg/H/s7uFI0ChT6lnaxsq+NTAqlXpjo5OBVR6HYDwtIgw8EEhwYVo
 XgXQ==
X-Gm-Message-State: AFqh2kqqr4xYY+9N0Kc+T68BbfL5TvzU0hh+D/rG16wyKOy7BsXv9EtB
 2qzZZog4d02Ic7r/x2zC3lNZeGgAPyu2EnEWvaOCsHhjkGasYmXidQy8dCXemgAK46fLDhHOh0h
 xwP+jwWLA543YuZDtpTtNfaMukV7wEpsradi7a6O5oFWBaQPSSq3MiNr7CdEQDNoO2Xo=
X-Received: by 2002:adf:f482:0:b0:2bb:f4bf:e758 with SMTP id
 l2-20020adff482000000b002bbf4bfe758mr5066279wro.48.1673368605984; 
 Tue, 10 Jan 2023 08:36:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvaRnLW1FLTHdl2Upf3trNzZoJWPIzapaZCplaBzD3S0u+aPeiOqCSyn7tNyi0hKVBbJsDtHw==
X-Received: by 2002:adf:f482:0:b0:2bb:f4bf:e758 with SMTP id
 l2-20020adff482000000b002bbf4bfe758mr5066267wro.48.1673368605556; 
 Tue, 10 Jan 2023 08:36:45 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 b1-20020adf9b01000000b0028e55b44a99sm11440416wrc.17.2023.01.10.08.36.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:36:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] block/iscsi: fix double-free on BUSY or similar statuses
Date: Tue, 10 Jan 2023 17:36:41 +0100
Message-Id: <20230110163642.344592-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Commit 8c460269aa77 ("iscsi: base all handling of check condition on
scsi_sense_to_errno", 2019-07-15) removed a "goto out" so that the
same coroutine is re-entered twice; once from iscsi_co_generic_cb,
once from the timer callback iscsi_retry_timer_expired.  This can
cause a crash.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1378
Reported-by: Grzegorz Zdanowski <https://gitlab.com/kiler129>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/iscsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/iscsi.c b/block/iscsi.c
index a316d46d9625..1bba42a71b77 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -268,6 +268,7 @@ iscsi_co_generic_cb(struct iscsi_context *iscsi, int status,
                 timer_mod(&iTask->retry_timer,
                           qemu_clock_get_ms(QEMU_CLOCK_REALTIME) + retry_time);
                 iTask->do_retry = 1;
+                return;
             } else if (status == SCSI_STATUS_CHECK_CONDITION) {
                 int error = iscsi_translate_sense(&task->sense);
                 if (error == EAGAIN) {
-- 
2.38.1


