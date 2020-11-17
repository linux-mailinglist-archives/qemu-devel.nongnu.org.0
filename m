Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08852B6AB7
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 17:54:48 +0100 (CET)
Received: from localhost ([::1]:47154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4Fj-0003iV-SQ
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 11:54:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EO-0001zZ-Cx
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:24 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:34857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EM-00073q-9k
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:24 -0500
Received: by mail-ej1-x643.google.com with SMTP id f23so30458748ejk.2
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ArDMKySatkMVEUjIFtkfkJUZ/d5fmcXFZVM5ofr2RH0=;
 b=R9hSN4keg1Zrt2jt25PXAKIiPCXCcQBilYLO6EmVKOqbw/IIBpjz8dRZ1VGINXCAkt
 PL0YnOFEWR9bzMeWgD7Lt66GZB+K802ufbunydzOnEVrIuwrzpcpMKANW8WFXHRTKkUG
 5Gv/GfwqOIqUhwLqQ9l86LgaO6ltoc11dHITk7v1zEbwLM7RL5yKq1mvz9gQr++eEIzp
 2Y8PawiYeD27PRliHWlmwvtzHPQWdMWdukeAIwjKeKYEz1EdaBOk5v7+DZmpKf+AQuVk
 CeZ9HMCXjMjvOXfo2mF5Nv8RpjP0L6lmNXLy4gEszDC8IQb9lTnC7abx6i8UBl/dQWE9
 WZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ArDMKySatkMVEUjIFtkfkJUZ/d5fmcXFZVM5ofr2RH0=;
 b=tEYI5xV1tLXFueXhxPdS1wLTdKLhBA/8Bmb+Au5wgGt+l22BNNfjf0ReWTRQzkQMdJ
 ps5T4USFB3F5bk3DjzRUh1UXHra8KBAHJgAqD5eqtKkCRhhwP0G/E1s4xy4PX0rVv9C8
 4DzrZ5EdCNzT1SDpibnEVme6ANqUu0ncUIALMtpQ6WlY0xDvrz0UNnJmxgJ5vXM5v205
 Yy7mH7FxEDqrFcw0i0q1j7KMqihD4ouUAvfO0tDE2LvHS6g5vHyliKfrp6PSVOMwtSAs
 my1qvhd0kfw0R6OYVVjoKoOev5XdVpgA3gr3etvD8sMJPU751OCF4ASLCNDf75KMfnaD
 D8bQ==
X-Gm-Message-State: AOAM533DBWIp3L094vzhm3htfEfWDz9ez40CW8ltUPKL7P/x8NfmmcV9
 B06TAczEbN5F5pijg6oewrhekhxykhI=
X-Google-Smtp-Source: ABdhPJwbfV0/x1notpgJgS+mRhGcNXK3T/XD+ttoA8oE9X7EUXClGTLLWmK9NwJ++BN9KxarGRR9AA==
X-Received: by 2002:a17:906:e4f:: with SMTP id
 q15mr19729316eji.220.1605631999505; 
 Tue, 17 Nov 2020 08:53:19 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:18 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/29] scripts: kernel-doc: proper handle @foo->bar()
Date: Tue, 17 Nov 2020 17:52:47 +0100
Message-Id: <20201117165312.118257-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201117165312.118257-1-pbonzini@redhat.com>
References: <20201117165312.118257-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The pattern @foo->bar() is valid, as it can be used by a
function pointer inside a struct passed as a parameter.

Right now, it causes a warning:

	./drivers/firewire/core-transaction.c:606: WARNING: Inline strong start-string without end-string.

In this specific case, the kernel-doc markup is:

	/**
	 * fw_core_remove_address_handler() - unregister an address handler
	 * @handler: callback
	 *
	 * To be called in process context.
	 *
	 * When fw_core_remove_address_handler() returns, @handler->callback() is
	 * guaranteed to not run on any CPU anymore.
	 */

With seems valid on my eyes. So, instead of trying to hack
the kernel-doc markup, let's teach it about how to handle
such things. This should likely remove lots of other similar
warnings as well.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Link: https://lore.kernel.org/r/48b46426d7bf6ff7529f20e5718fbf4e9758e62c.1586881715.git.mchehab+huawei@kernel.org
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 0f67664165..99530fb08b 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -216,6 +216,7 @@ my $type_constant2 = '\%([-_\w]+)';
 my $type_func = '(\w+)\(\)';
 my $type_param = '\@(\w*((\.\w+)|(->\w+))*(\.\.\.)?)';
 my $type_fp_param = '\@(\w+)\(\)';  # Special RST handling for func ptr params
+my $type_fp_param2 = '\@(\w+->\S+)\(\)';  # Special RST handling for structs with func ptr params
 my $type_env = '(\$\w+)';
 my $type_enum = '#(enum\s*([_\w]+))';
 my $type_struct = '#(struct\s*([_\w]+))';
@@ -251,6 +252,7 @@ my @highlights_rst = (
                        [$type_member_func, "\\:c\\:type\\:`\$1\$2\$3\\\\(\\\\) <\$1>`"],
                        [$type_member, "\\:c\\:type\\:`\$1\$2\$3 <\$1>`"],
 		       [$type_fp_param, "**\$1\\\\(\\\\)**"],
+		       [$type_fp_param2, "**\$1\\\\(\\\\)**"],
                        [$type_func, "\$1()"],
                        [$type_enum, "\\:c\\:type\\:`\$1 <\$2>`"],
                        [$type_struct, "\\:c\\:type\\:`\$1 <\$2>`"],
-- 
2.28.0



