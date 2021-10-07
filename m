Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A94425A67
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 20:11:11 +0200 (CEST)
Received: from localhost ([::1]:52740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXrK-00017I-JV
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 14:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYXd1-0004W4-NJ
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:56:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYXd0-0005Xc-3g
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:56:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633629381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FZVjcgkP4eJJl8An6XCiksZGp8eMqhiHN5s8v/EvDhg=;
 b=D3KeWMujpgQnxOaY0BqY6teDMQcXAmxFl6Dj/E3bCc2aF9/FkgrHyIkc2EgABJp5InGbVx
 g8WSSoJh+2zK7/K3Ny6TlKekteeZ4FbxIKT3rHS3Co9rXIvr6aTjJ7v/H1PyzD6cSYIML6
 n1QLWFfYdQTJ29jQfZ8G5yetY+sSY28=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-h0jkpLk0NFG9BRy1VA5-nA-1; Thu, 07 Oct 2021 13:56:19 -0400
X-MC-Unique: h0jkpLk0NFG9BRy1VA5-nA-1
Received: by mail-wr1-f70.google.com with SMTP id
 l6-20020adfa386000000b00160c4c1866eso5317853wrb.4
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 10:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FZVjcgkP4eJJl8An6XCiksZGp8eMqhiHN5s8v/EvDhg=;
 b=17Jhhd8W+1GLPik9UvFj1kKpMAdzVoys258nt5atgiZJGtxf5BGG944xGIU6aBizzC
 1YhStOcgnbx+y723EipUEeJSyV7PGMEspAJwB7WpAyKg8tnsVeD3CYv/UAtfAxf8+6HP
 5ywGzD163wcy8wanSdxwvbOcoxQCB188Mjb4NbGzZM8QZD/M5giDnvxmQlg8ZeZKBl9A
 5pDVzI7+N+eFrOkvS/Ha1aPryHM9teqDbIW4Zdog54RD02ZCRD7pDv4tpBF8dmI7Tm0w
 SKDEg8DxUCbqsupsx6hMHJz/DGcF4Drz8GPJNqEjjk7ix+hTb6+Pxs1N+4akS1enT0Tk
 8/zw==
X-Gm-Message-State: AOAM532+PyF/+h9NY2Pg2UFFhYCUhwXIiCqbHz4HTG57XmaZaythUdJZ
 LlvaK/JCA9l/pUhZMeN7uffaM7aXxrpxvhDIGZ/0thRZf98yf4ZbbdEuJpbhRmI2sD4iQeViedC
 +wGvw/IPs/Qi9s/kR7ZMrFS2zLzBauFPrLq0PbLztC2gkbE2hSeOmJlm1C9N14gpt
X-Received: by 2002:adf:d1c4:: with SMTP id b4mr7278655wrd.356.1633629378182; 
 Thu, 07 Oct 2021 10:56:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXcrZxEq0zE1KxGLK7GORHRQff+PENSO+uo8sA9P30h6bxl88lbstHkqQIC9vF5iZyEstiFg==
X-Received: by 2002:adf:d1c4:: with SMTP id b4mr7278619wrd.356.1633629377977; 
 Thu, 07 Oct 2021 10:56:17 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id k17sm13128wrc.93.2021.10.07.10.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 10:56:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] MAINTAINERS: Cover SGX documentation file with X86/KVM
 section
Date: Thu,  7 Oct 2021 19:56:09 +0200
Message-Id: <20211007175612.496366-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007175612.496366-1-philmd@redhat.com>
References: <20211007175612.496366-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Yang Zhong <yang.zhong@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Yang Zhong <yang.zhong@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a49555d94d5..cb8cb48a51b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -418,6 +418,7 @@ M: Marcelo Tosatti <mtosatti@redhat.com>
 L: kvm@vger.kernel.org
 S: Supported
 F: docs/amd-memory-encryption.txt
+F: docs/system/i386/sgx.rst
 F: target/i386/kvm/
 F: target/i386/sev*
 F: scripts/kvm/vmxcap
-- 
2.31.1


