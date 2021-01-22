Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFCB300E07
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:48:46 +0100 (CET)
Received: from localhost ([::1]:46786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l33MK-0006in-O6
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:48:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l33Il-0004xV-HO
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:45:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l33Ih-0002WZ-Se
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:45:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611348299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3kJMWGCGaFHbWyDMXV2iCwU8iAJqoNy1I3FHk8D4w/0=;
 b=ZZrhPVvDtcwD6SKLLGxZU9xDlsdyUAuOS7MFF7st8Hkzu6lfa4ybFqX2IzwHQd27BaMDS+
 EgnoVo5rXHEpJsx7K5E1WXysFUt63j6WUP1zEZS7Vemkj0OB1npQewSqQeSBMk2uGRWsFI
 2H2eqsI6kPKCI2eGl183WhQtQtJQlrw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-FUu8okfbN02SAMa6KAr3ig-1; Fri, 22 Jan 2021 15:44:56 -0500
X-MC-Unique: FUu8okfbN02SAMa6KAr3ig-1
Received: by mail-ed1-f70.google.com with SMTP id g6so3504354edw.13
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:44:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3kJMWGCGaFHbWyDMXV2iCwU8iAJqoNy1I3FHk8D4w/0=;
 b=jsk2MRJ2jL5k+Vk66zTApqINDiAS1Ttut41ElAMx8arhBgT1MonA6FHn8TQnaq+nwE
 R0bWPmOABecHmwB6PyGOTVSI4Vq8ZFIu2wm7o1EZ/h3mQfdGnS1HN0Xy9g/cUhx2wTxv
 m27gN/oN4w3EiCn2246LhbcEX3ZZIzVN4pJOa6L7nvTTOLTatHnpN4z0HH6zhZRhdw8E
 cy/RXw6pKm4Rsw7tHtb/VSjAv//gkJpdtcL4wcCiJK+5ylx9UpfX9huYdPo8IBvYXYva
 G1LDu5pPALMYdHZu3Jm8tGZQpg/96tf5wPKLNzhawqljtCeWTVEuhYALjZj7SOcYn0dx
 jOzQ==
X-Gm-Message-State: AOAM533UUd5Iq+LYM5x2kJjuCSKaMKpr76E+msVnQppj1y4dkoMyrh+5
 2nL+IGNe55jiOzkyaHAypz87EzaS5vLODhHR8svh8B3iqoLTiKqF9CI/wWY4bVildOhtBM5eA9U
 vHyLz+9zTnT4YARse5Uaf1BeGaXBZWKetewJg3qwYFOfdWQq6PMdoB6KuLEe3q7wX
X-Received: by 2002:a17:906:ae9b:: with SMTP id
 md27mr4270851ejb.357.1611348295304; 
 Fri, 22 Jan 2021 12:44:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwc642aJvC0q5QJajZDAaPfQ3oxWQ4aIYakUZbpfOomXvlP0MG8L6eynOJteXDf6SKw4rYKWQ==
X-Received: by 2002:a17:906:ae9b:: with SMTP id
 md27mr4270834ejb.357.1611348295162; 
 Fri, 22 Jan 2021 12:44:55 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g25sm5182357ejf.15.2021.01.22.12.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 12:44:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 02/12] tests/meson: Only build softfloat objects if TCG is
 selected
Date: Fri, 22 Jan 2021 21:44:31 +0100
Message-Id: <20210122204441.2145197-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122204441.2145197-1-philmd@redhat.com>
References: <20210122204441.2145197-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Emilio G . Cota" <cota@braap.org>, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Emilio G. Cota <cota@braap.org>
---
 tests/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/meson.build b/tests/meson.build
index 29ebaba48d2..6f1ff926d26 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -276,7 +276,9 @@
      workdir: meson.current_source_dir() / 'decode',
      suite: 'decodetree')
 
-subdir('fp')
+if 'CONFIG_TCG' in config_all
+  subdir('fp')
+endif
 
 if not get_option('tcg').disabled()
   if 'CONFIG_PLUGIN' in config_host
-- 
2.26.2


