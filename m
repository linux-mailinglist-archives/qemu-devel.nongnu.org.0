Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DA52FC070
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:56:48 +0100 (CET)
Received: from localhost ([::1]:57420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1x7Q-0005vR-0j
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:56:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1w5f-0003lP-3h
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:50:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1w5d-0003bg-3F
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:50:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611082252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eFeB9KxvwuKFjE9JDOG/SlOtbrTpw1pjcYE1xEwVoW0=;
 b=avAfiIx74seJC3tc2Kt6FO6n+RD9atgqexmAGYF4iV+ZhJoUrlPXu0Zyl7L1uBtV/hfPp8
 3gYpWzY8IPJrRbblQr07cEUOadTtfpUxxQCseSG2E6g6jQzMHND7tog+828o8oeXs1rePN
 qpv/Rf6oX1gAY4koAx/zpMPhfPANwck=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-5rIVAimFOle2KC5lkFACAQ-1; Tue, 19 Jan 2021 13:50:50 -0500
X-MC-Unique: 5rIVAimFOle2KC5lkFACAQ-1
Received: by mail-ed1-f69.google.com with SMTP id r4so571357eds.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 10:50:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eFeB9KxvwuKFjE9JDOG/SlOtbrTpw1pjcYE1xEwVoW0=;
 b=r2W/hVC7LkBaIyoqywv+I0IcxWoSWEaOtG5UtjoS/0yAac9SjjzNJVPrUQVoHkydCy
 Yfe/5HPVBLzdHIy/3m8AZqKBMBClFnm25jaxLdL+UfHCIrVM4h4P/kY7yipNtrK3Mzzw
 inyrVXRvlDnkZ2pzisCZTB4krWn5S6z9B8TC4QMq+8aKFVd0WI9yI0kwLM8sBnOGQtab
 XWGSycH2JN8kYomWjMgTmvVobPizfUG1RXi5+lb7DIQ+fuCnM+GTvPcODfIf5zROaSYi
 5HcEzmV4yphF2eNzSe6Krpb8XWzKTPS6GXEcqp2w48oMa78facT4QLcsieeFMrOXAISh
 Y0/w==
X-Gm-Message-State: AOAM530Tddazvvq8ODs+fQ1MFNa9RGvCxTHQrGGd6dY23lcHuaxT6sQQ
 m/B6AWT8UudQnPPVueZIzp2Dmlbg2Um1cpnPQYkjxvwZXMMuBGkhSmT3VyT1vS4d4YIB0EquCph
 IkxPETHkolEcl0ActINymBlvSsV5N6EeEaKZ74kczlqVMp1w2vSztHqYIfI+P1lBm
X-Received: by 2002:a17:906:4c48:: with SMTP id
 d8mr3822139ejw.358.1611082249229; 
 Tue, 19 Jan 2021 10:50:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuqQwZkXorsM3ilTbQhJBjTFMauWQoiQJt/x7SgjNtrLmSu24D90UNSEGNI7RW61JOe1Qupg==
X-Received: by 2002:a17:906:4c48:: with SMTP id
 d8mr3822129ejw.358.1611082249041; 
 Tue, 19 Jan 2021 10:50:49 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id u2sm9774716edp.12.2021.01.19.10.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 10:50:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/9] meson: Display if user-mode emulation is selected in
 summary
Date: Tue, 19 Jan 2021 19:50:04 +0100
Message-Id: <20210119185005.880322-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210119185005.880322-1-philmd@redhat.com>
References: <20210119185005.880322-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meson.build b/meson.build
index e6c6d1518ef..0435bfd1c51 100644
--- a/meson.build
+++ b/meson.build
@@ -2371,6 +2371,7 @@
 endif
 
 summary_info += {'system-mode emulation': have_system}
+summary_info += {'user-mode emulation': have_user}
 summary_info += {'module support':    config_host.has_key('CONFIG_MODULES')}
 if config_host.has_key('CONFIG_MODULES')
   summary_info += {'alternative module path': config_host.has_key('CONFIG_MODULE_UPGRADES')}
-- 
2.26.2


