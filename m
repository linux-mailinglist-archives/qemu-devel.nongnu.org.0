Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF3C4577A6
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 21:16:56 +0100 (CET)
Received: from localhost ([::1]:58314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moAJb-0002s8-C3
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 15:16:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1moAEk-0007ME-LU
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 15:11:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1moAEh-0007mq-Qq
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 15:11:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637352711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tyeixmmwuZJID1W+S/tZDE99JTCY1osLTIUAw+RmmGY=;
 b=h1QADtltZ0rr91ZGnACrrVWwyBbuwqPOIpV4p1YbYa5ZCRyi7iByNZreb8av3IDXhabtGg
 DnTaGSRwleNsEO+7dpj4jrb77VygH/h/MyFY8j7eQWjTkcGKzpkECaYdSNkT17FRDILvLA
 i+cbO1WZh6CSS0vIXkacziq6mlDfLa4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-f1bEgcCfMwCWcwTB2xSRXQ-1; Fri, 19 Nov 2021 15:11:50 -0500
X-MC-Unique: f1bEgcCfMwCWcwTB2xSRXQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 n16-20020a05600c3b9000b003331973fdbbso5262741wms.0
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 12:11:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tyeixmmwuZJID1W+S/tZDE99JTCY1osLTIUAw+RmmGY=;
 b=zEoZ2AYr2GunAnYScEJjyngBD4IWCRoNAxCju2T0/RrhLips1xa2+raa4d4p7W5urA
 BQkCSqpxdPXQvZdrIM7JpusbROcQcUHqQq0f/1PZNR49PpL+vKUPE7XKgUMChu+WILF6
 6ZCvKhFB7bYi2uIQdac6jLgCw9ycSTO0ZWcivoqF32nRbqzTURHZjTYqSopmZkxBLRs1
 GBE3YpcAKrQFm9fCaDa3pw0bPU+6cwyV6G9bLQa3SK15WE91nlMd4MFwtve9+mrZoW8E
 51/cTE+ctCCxLh+AWlg1kd14Ow85FI0QHT0PJpgRxCdM/IvLOERFthjkM35SjUARr6/k
 LLig==
X-Gm-Message-State: AOAM531CLc0222wcyZd/S3nvrVwOwQ/lRWbiwBm7A+Nszdnchvn1Brat
 DCxqv9tRX/TeHrqKRCYQG5NqG5yavx+CDqDDX4OWQecgxNeAK0HrhbzC+Y9Lc6/FYvlRlExaZNi
 AzkaUl7Gq+aU1niA1Gm2obrKKIy7zagcD1hcMgOUvGagj+gfPLf+v6UCMoJlrAiwq
X-Received: by 2002:a5d:4b0e:: with SMTP id v14mr11064793wrq.196.1637352708803; 
 Fri, 19 Nov 2021 12:11:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsfp2lkYJx1+otbjpU1L0/VpexWA/+XdcMu8ge67WwaaPeyZ6588vnjTZIon+MaE9MFF4cYw==
X-Received: by 2002:a5d:4b0e:: with SMTP id v14mr11064745wrq.196.1637352708576; 
 Fri, 19 Nov 2021 12:11:48 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 q123sm13015208wma.30.2021.11.19.12.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 12:11:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 1/2] hw/scsi/megasas: Fails command if SGL buffer
 overflows
Date: Fri, 19 Nov 2021 21:11:40 +0100
Message-Id: <20211119201141.532377-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211119201141.532377-1-philmd@redhat.com>
References: <20211119201141.532377-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If we detect an overflow on the SGL buffer, do not
keep processing the command: discard it. TARGET_FAILURE
sense code will be returned (MFI_STAT_SCSI_DONE_WITH_ERROR).

Reported-by: Alexander Bulekov <alxndr@bu.edu>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/521
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
No, I haven't looked at the datasheet.
---
 hw/scsi/megasas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 4ff51221d4c..8f357841004 100644
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
2.31.1


