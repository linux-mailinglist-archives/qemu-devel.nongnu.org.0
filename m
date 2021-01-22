Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC51F30011D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 12:03:23 +0100 (CET)
Received: from localhost ([::1]:38472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2uDq-00029Q-K2
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 06:03:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2u9X-00077s-T6
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:58:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2u9V-0003lq-BB
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:58:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611313132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ui9PEIVesR+pjrhyiwMOpt8icvFevk6frc+i55QdokQ=;
 b=e1PcJ9F4R7rK4OSfWUaBKVq5mWjh+Ee5GW2me1dWt2Ghl++jgH6YYAs7ufALZ9epEHkGob
 A77meKnkoRV/LhGWmzOAHL98A8IJ/+LDdapYJfTnW+ChaQp5TAsN+xyfV+FkIgpVAVFdG7
 b4ItSz7P5WJb7hKU61tvxG5CiiNqxM4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-Y2gUQ3gHOXCQUHDfXxb8xQ-1; Fri, 22 Jan 2021 05:58:51 -0500
X-MC-Unique: Y2gUQ3gHOXCQUHDfXxb8xQ-1
Received: by mail-ed1-f69.google.com with SMTP id g6so2727245edw.13
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 02:58:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ui9PEIVesR+pjrhyiwMOpt8icvFevk6frc+i55QdokQ=;
 b=bCZugyLaiHJ6zo/dKFmm/5wZKLnGVeB2inn2H0mu+3q+sXDcTkPFyvKBB1D2diBwUi
 N34AxNVzEeDexFlPzuGToct29XTw7IfkP73Z6T1GhBQJR2Ta+ZECd/soFGnH/4t/waUT
 2akH7pUyfZ4GYa78qX7WfBa6VqZmlLA1kcrBi41xbJ0+JIQU4+97d/GZaJ4ZHYQW9R2J
 QEKHID3shtvSF0nWeaJsgRjUuDGmpJRTPvhCqRP50OgUQXBh7oSamlw9ePs935Tf0vXx
 6WzVauP1a1sh3WqJn1Gfb4M8h/vKHgHWVdNlYHv4dZvarzmtMjpQhHeqCUya1mWSh6hY
 aPLg==
X-Gm-Message-State: AOAM532sVzSckrd45mOTgD8fJsKFselUdS726vEsEPBryYt0MXRKzKTz
 D05MIPy8xT8IzX8Az+WhVfL5G1SEyZbTJPghjJ1j1RALaRdDX58q2iSrIhJViUX+3fXCNlTDoEO
 gRvXLvfULKKDn/a3uuxo+e/dgcsIJSLiTTA0D0mxbzfSxKklZ0WYL3cLC032Y6drd
X-Received: by 2002:a50:d552:: with SMTP id f18mr2718974edj.168.1611313129821; 
 Fri, 22 Jan 2021 02:58:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTuytXpKW69oCvTDPUGbmVPEcVYdz8PXtcvHoQBAaEhiFtcb/WdSaZ+qnqt0t1UT5urDcjpQ==
X-Received: by 2002:a50:d552:: with SMTP id f18mr2718961edj.168.1611313129626; 
 Fri, 22 Jan 2021 02:58:49 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id q2sm4964236edn.91.2021.01.22.02.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 02:58:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] meson: Warn when TCI is selected but TCG backend is
 available
Date: Fri, 22 Jan 2021 11:58:34 +0100
Message-Id: <20210122105836.1878506-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122105836.1878506-1-philmd@redhat.com>
References: <20210122105836.1878506-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some new users get confused with 'TCG' and 'TCI', and enable TCI
support expecting to enable TCG.

Emit a warning when native TCG backend is available on the
host architecture, mentioning this is a suboptimal configuration.

Reviewed-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meson.build b/meson.build
index d5b76150e49..d3df5fa3516 100644
--- a/meson.build
+++ b/meson.build
@@ -234,6 +234,9 @@
       error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(cpu))
     endif
   endif
+  if 'CONFIG_TCG_INTERPRETER' in config_host and cpu in supported_cpus
+    warning('Experimental TCI requested while native TCG is available on @0@, suboptimal performance expected'.format(cpu))
+  endif
   accelerators += 'CONFIG_TCG'
   config_host += { 'CONFIG_TCG': 'y' }
 endif
-- 
2.26.2


