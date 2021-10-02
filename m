Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A8741FC10
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:09:26 +0200 (CEST)
Received: from localhost ([::1]:33190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWelY-0007J2-6L
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeWW-0000tc-MZ
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:53:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeWV-0000gG-BC
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:53:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633179230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T1NIBoSE4LuxR67pjfbeheswmOYBoIBhIFI0FnH33UA=;
 b=IOcMGwkJaSie4BtFLBt0Z/Xorv3SZb4wZPHhI2EMIWEbAzDO8J48K1EoBIXy9peerEPMny
 sUaDd1KxPY8DXnkOo0Oc21Blr2537jvtvCpIV4tPBPlQH6KqPkAQnCF/jZUW+r7ALnRHxx
 fNU35CuymihCxT3FUTds8HBgKOTiQus=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-J3rk7O8aPQOfOGVv1YFSbA-1; Sat, 02 Oct 2021 08:53:49 -0400
X-MC-Unique: J3rk7O8aPQOfOGVv1YFSbA-1
Received: by mail-wr1-f69.google.com with SMTP id
 c2-20020adfa302000000b0015e4260febdso3488903wrb.20
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 05:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T1NIBoSE4LuxR67pjfbeheswmOYBoIBhIFI0FnH33UA=;
 b=gnx8Y70v/kOtLpe3o/wrj5lxgEOc0kZ5pUvOCQl25W1hHo8bpM8tcdIkRasNkFMngS
 3eRJ3tOT0Mr3DwHGA8KZIKLTa4Wtd5FgYmJhs7SgFRupAjq4c30QdiBfY3BX5IHvFoQ2
 k/JxDtzKmXwcdy6ssPzBejXdVhZZAuXv7xZM3sg/BbbxGT2+TqJNnHDd+CXqrRac1b1f
 wjK8pdRtCnjB3B3cfEcjXcLeNM914kVF8KaeWhkdaj19CEOUOSaGQTRhNFXrNxb2fqLA
 LhjdOWpvSp5GFUTMcdmIS8at+eDQuuCuzki9lWe/D+Lt1LN+tJjjJEJyCeWyJbHl58zP
 +cMQ==
X-Gm-Message-State: AOAM530eso2SolZiLEbI+EA8uZNA+cIZfOQPFrJfkCVDMycKtPc+5qtg
 h5MkkMDCS3pHCoE6bQ0/cRwu16E6BmGJKOdihT40xQfu7oekbZ9z0ZeJ8vVbcUTDGHreCqPoyAJ
 Xvq7MKZqpzFi+rx1P04N4IFDUZFLAoGzrddB6J3FDhSxxFGsE5dJskzTYNxt5dxgQ
X-Received: by 2002:a05:6000:c3:: with SMTP id
 q3mr3272640wrx.361.1633179226541; 
 Sat, 02 Oct 2021 05:53:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSb9fTK6/UuOYq5MO4Gn39GE9tLudrOZsgwLInKNkYdtRvDdV88QT0skDGxAwXecnl0DrCeA==
X-Received: by 2002:a05:6000:c3:: with SMTP id
 q3mr3272609wrx.361.1633179226312; 
 Sat, 02 Oct 2021 05:53:46 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 l26sm10571166wmi.25.2021.10.02.05.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 05:53:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/22] target/i386/cpu: Add missing 'qapi/error.h' header
Date: Sat,  2 Oct 2021 14:53:01 +0200
Message-Id: <20211002125317.3418648-7-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002125317.3418648-1-philmd@redhat.com>
References: <20211002125317.3418648-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 00b81053244 ("target-i386: Remove assert_no_error usage")
forgot to add the "qapi/error.h" for &error_abort, add it now.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index cacec605bf1..e169a01713d 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -27,6 +27,7 @@
 #include "sysemu/hvf.h"
 #include "kvm/kvm_i386.h"
 #include "sev_i386.h"
+#include "qapi/error.h"
 #include "qapi/qapi-visit-machine.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/qapi-commands-machine-target.h"
-- 
2.31.1


