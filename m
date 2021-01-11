Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C59462F1990
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 16:22:53 +0100 (CET)
Received: from localhost ([::1]:60168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyz1w-0004DK-RB
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 10:22:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyyzm-0001uy-Hr
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:20:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyyzk-00044l-TD
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:20:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610378434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=97BNT6jh6NRO0TVk+TL23RreQDhzFRma0TINePq+NK8=;
 b=gkISrOGj+re/41lTjOkWdcVMMaJMWpIBT1Bln1bCFxYZdv3LHcMD14FsqGWJmJJrs0v6HY
 TQ+2qNUyLHpXS12AK3JxwGaya7Sv12ZMHIg/QECG0TxArJWnBO2P+/wXdazOkNNWD/o0Qf
 sbIbuUKFYGtt8PUb2knBezRBaXVXfKM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-8rM4sBpJMoGN-qVdtqtdCw-1; Mon, 11 Jan 2021 10:20:32 -0500
X-MC-Unique: 8rM4sBpJMoGN-qVdtqtdCw-1
Received: by mail-ed1-f69.google.com with SMTP id f19so8357391edq.20
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 07:20:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=97BNT6jh6NRO0TVk+TL23RreQDhzFRma0TINePq+NK8=;
 b=ff4crBEHTSZxx6n9XejSsnyXYCfTKZIJWxapHkOwQuy4JxPCOjG7/54alPS1/2dK8g
 L/3J56ngB8BKPJQ6avdi3ruXJT1uplXNAynNqJFQv+9sQYbahHOkbwo3aKAoxpDrWFcM
 m1YrMAI3Z53Rr4nKkxcZYlBqiGgN4BZx5qjsJD/QiHFmkKAaf0GWhyaup6Eip5P65xHx
 dJmyQXLBD5cRTx/AX0/WcuOPd1CuMR4B7zHa9hzWecF/nbhhnEEOksWxFGf+4ZY8xgh7
 nYTGfYtQ9pbpECdmx9L5CsIRtORZIMLXwAjCtOCqxzqgfJj2iu5/5y6H+kd2KLhOuroR
 OprQ==
X-Gm-Message-State: AOAM531Q0TpWouytjGn38nFYArHco8NzqpJ3Rc+D1EG6FSCc3eFd7BHO
 Spn8lZZM8KFfao6u14rV2MwPs43gB9WsSIeb/pripfORH2YiQ9iYjCWr6ERc9N6Vn4narqqpSt7
 lxgT6txxqwmo8xn6DVPKe90L+kvRME0OBdT4q+lRi/yU1FDc1M0AIh2OUfUu2qHv7
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr14237038edw.52.1610378431441; 
 Mon, 11 Jan 2021 07:20:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfzQ4g/Xi77uXbjKsyJn2nZrlWGnmTOg2kIy8FkRbXj1BTf3rxwC5MxkZMkcW73D4xDrLEXw==
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr14236981edw.52.1610378431207; 
 Mon, 11 Jan 2021 07:20:31 -0800 (PST)
Received: from x1w.redhat.com (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id c12sm76932edw.55.2021.01.11.07.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 07:20:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] sysemu/runstate: Let runstate_is_running() return bool
Date: Mon, 11 Jan 2021 16:20:19 +0100
Message-Id: <20210111152020.1422021-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111152020.1422021-1-philmd@redhat.com>
References: <20210111152020.1422021-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Amit Shah <amit@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org,
 Sunil Muthuswamy <sunilmut@microsoft.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 Max Reitz <mreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

runstate_check() returns a boolean. runstate_is_running()
returns what runstate_check() returns, also a boolean.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/runstate.h | 2 +-
 softmmu/runstate.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
index e557f470d42..3ab35a039a0 100644
--- a/include/sysemu/runstate.h
+++ b/include/sysemu/runstate.h
@@ -6,7 +6,7 @@
 
 bool runstate_check(RunState state);
 void runstate_set(RunState new_state);
-int runstate_is_running(void);
+bool runstate_is_running(void);
 bool runstate_needs_reset(void);
 bool runstate_store(char *str, size_t size);
 
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 636aab0addb..c7a67147d17 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -217,7 +217,7 @@ void runstate_set(RunState new_state)
     current_run_state = new_state;
 }
 
-int runstate_is_running(void)
+bool runstate_is_running(void)
 {
     return runstate_check(RUN_STATE_RUNNING);
 }
-- 
2.26.2


