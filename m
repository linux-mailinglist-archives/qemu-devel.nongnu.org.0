Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A276233742
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 19:00:53 +0200 (CEST)
Received: from localhost ([::1]:43250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1BvD-0002av-G8
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 13:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k1Bte-0001ef-Qo
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 12:59:10 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:47781
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k1Btc-0007Mm-QV
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 12:59:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596128347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZL0xNwdQj2tGUD/d61wqSj3lSeaH9Xvo46XMheEw5/4=;
 b=XTlP4u3ShEIoQlBHyoD3kHYTtlpv1iaGHcnpWVDxdP9GRLQrOOmIXPM4fLfmeN/MvLfWzU
 pARllscwEFFHGkvh7MpIfQv7cZetQW0BcSICrG33A4SgOutgw7Br65cFU5V2XY5WNOGgCE
 h0MX0ESIKY/tYJa2Eag+hdwqWk1dg88=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-PcXtPJ74O8ODzNlcY83--A-1; Thu, 30 Jul 2020 12:59:04 -0400
X-MC-Unique: PcXtPJ74O8ODzNlcY83--A-1
Received: by mail-wr1-f70.google.com with SMTP id w1so6160574wro.4
 for <qemu-devel@nongnu.org>; Thu, 30 Jul 2020 09:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZL0xNwdQj2tGUD/d61wqSj3lSeaH9Xvo46XMheEw5/4=;
 b=fI3RNYJDIHRlGUjy0MWn6W8EDKYTWOV7MiPepU+PblsjC5S/YyEZM7IxgJNtnZiKFk
 Q5JnNWqTEqFJZ43zbaEF4fNIjp7MkuWwLgi7tQjRmWsstZV+g/bKwOW5Z9pjTc+RFTLL
 VWNaZStz/FB++F+DHM/rRF3x9ZqJ1r3Z/CazBrC8dxdf2tQG8CdYIEKVGfGM8f3cpXSJ
 FamgihZZpv3h9zAyzGy85lptncYb5pWlsSNNwabwVuya4G6UsIXGZCKIIIxSCQgbwxTI
 sMKeuXBjIq7g2KjPSNSWe+EnivGVNAkqCmK7i1mNC9SHTFg1iC0gDtnnyfqY5H/gbM57
 OOkA==
X-Gm-Message-State: AOAM532nuOInyK/3VZKwAfm6hHCGI6oJqsjBfA4zm6R5iBfn2MxO1Dwq
 AjfCw4Vl67vuBmMzm48pOKnHjUrIo7BGsZaJ+vwJ3liUlToZlLoNCmFjgs6+l+vQli9q7Orpva7
 YI6da+XXHS6Cvhdc=
X-Received: by 2002:adf:c552:: with SMTP id s18mr28270076wrf.209.1596128342675; 
 Thu, 30 Jul 2020 09:59:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+ynC0f8pMOEB+emI2gVJzn1PbQSit3rYqj7wbHhAxbEeGUggppFhB3SKBxOsc2RM/M7uraA==
X-Received: by 2002:adf:c552:: with SMTP id s18mr28270062wrf.209.1596128342492; 
 Thu, 30 Jul 2020 09:59:02 -0700 (PDT)
Received: from localhost.localdomain (214.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.214])
 by smtp.gmail.com with ESMTPSA id w7sm10131920wmc.32.2020.07.30.09.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 09:59:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 0/2] hw/char: Remove TYPE_SERIAL_IO
Date: Thu, 30 Jul 2020 18:58:58 +0200
Message-Id: <20200730165900.7030-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 03:51:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the TYPE_SERIAL_IO which is simply a superset of
TYPE_SERIAL_MM, as suggested by Paolo and Peter here:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg721806.html

Philippe Mathieu-Daudé (2):
  hw/mips/mipssim: Use MMIO serial device on fake ISA I/O
  hw/char/serial: Remove TYPE_SERIAL_IO (superset of TYPE_SERIAL_MM)

 include/hw/char/serial.h |  9 ---------
 hw/char/serial.c         | 41 ----------------------------------------
 hw/mips/mipssim.c        |  4 +++-
 3 files changed, 3 insertions(+), 51 deletions(-)

-- 
2.21.3


