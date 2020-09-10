Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C33CF26479A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 16:00:25 +0200 (CEST)
Received: from localhost ([::1]:56216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGN7g-0002fQ-Pr
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 10:00:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kGN6N-0001Kb-AQ
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 09:59:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30107
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kGN6K-0003rC-D8
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 09:59:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599746339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=67KVF2Mo/PLYPmr8arLLFWFfJ7nkELJaTpbCNPfWhAM=;
 b=CkqKZQQ++80CjZGAynBd8yw0h1V74CmVTHA1mNAdxht4xv/B0D0ZKrzM6GkvkqfPzPfXs3
 hzAaixMv3GrNMiFOIFVhOvnCpYBvaiaKUZsRJcyCpUJko1E3yeon0Ew66KfZLaQRV6lJhW
 +zd9WBpj+th6Bd8pEZcf9hkr/0ueiAI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-ZL_HCCu7Poexi6CTq3ZItQ-1; Thu, 10 Sep 2020 09:58:55 -0400
X-MC-Unique: ZL_HCCu7Poexi6CTq3ZItQ-1
Received: by mail-wr1-f70.google.com with SMTP id j7so2294469wro.14
 for <qemu-devel@nongnu.org>; Thu, 10 Sep 2020 06:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=67KVF2Mo/PLYPmr8arLLFWFfJ7nkELJaTpbCNPfWhAM=;
 b=fUH/IP8ohnnH7DJW7n8YY7HhQ7EBycafRqxbVlTdYGEJvI7OQDOQ8ucxnqch6DRErW
 j6XxH26G3fxgY2Julfqxzs4nLrQJXZf8dFDEQQfFmOnKjF2JjfzxpOg8Trbj2/2maV41
 PODba3cwwfvqiNBpLY/Z4lqB9W0TM1zUXtAegVsMYjrIhnCYh4FmTqWVFD7pKYMDDsvz
 B5YCC06ePp/UZOtBLVKJT7uPh6ZwqaAvuf2ulppQ0zzBoT/GIEJZVHWJO2J2Yk6euO8b
 Jx3Q7JvKW9qHWp4TLXW7JnAoH9ZKrJqNV5LbO0bI/BjjIthYQ3KW2s8qb7aYQ7tam9BC
 dZMg==
X-Gm-Message-State: AOAM533rxwLM+Y9NEqS/TnZQTcoFwXc5AS2nkj32yTs89c9bG4LOgMQm
 jfhJnkkMhLw6vbZ9aibDBnVcJfIhS/iWbqgtokTYtT/yyg0o8mPQ5zvzTg8hnilkEDTYpfiwTdW
 6gTJTQ2C72HgI9AY=
X-Received: by 2002:a5d:444b:: with SMTP id x11mr9059728wrr.402.1599746334663; 
 Thu, 10 Sep 2020 06:58:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDMWK0MDfV3alN3ANhNvHLFVWUMr+xxFNJ6h4INhrLKw+WojL6uBnnNyygGdfETd7oi5hm4Q==
X-Received: by 2002:a5d:444b:: with SMTP id x11mr9059706wrr.402.1599746334417; 
 Thu, 10 Sep 2020 06:58:54 -0700 (PDT)
Received: from x1w.redhat.com (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id o4sm8998317wrv.86.2020.09.10.06.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 06:58:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] hw/timer/hpet: Trivial format string fix
Date: Thu, 10 Sep 2020 15:58:50 +0200
Message-Id: <20200910135852.516809-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 08:35:50
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Dov Murik <dovmurik@linux.vnet.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a format string and remove dead code.

Since v1:
- Addressed Dov comments (fix format string + style):
  https://www.mail-archive.com/qemu-devel@nongnu.org/msg739239.html

Philippe Mathieu-Daudé (2):
  hw/timer/hpet: Remove dead code
  hw/timer/hpet: Fix DPRINTF format string

 hw/timer/hpet.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

-- 
2.26.2


