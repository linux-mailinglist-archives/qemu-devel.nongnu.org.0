Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66134313CE4
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:13:48 +0100 (CET)
Received: from localhost ([::1]:40688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9B2h-00065F-Fw
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:13:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96l8-0003GB-B0
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:39:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96kt-0005At-Gs
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:39:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612791536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VBLzi63miNCcD2Mkc748tKr3FnYtOvYC+AmDEFCN934=;
 b=Jc+GlKPYLdtlk2q0itWZHZEtcH951dc8Dv2r0sXDgPtZIyFD9WOFHXerhQjMCGw0XVmvjn
 9ze00kS0IDpeZpqG7S+Tc4pKJlrzEIKG8TydXfbgPQgqybVOFH+ZqjHsb2oOQKBgdyp57N
 7i109x7936DJ4rsY7T316eWGHKsnCpc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-iAFH1lyKMW2LRtQdBTKtWA-1; Mon, 08 Feb 2021 08:38:55 -0500
X-MC-Unique: iAFH1lyKMW2LRtQdBTKtWA-1
Received: by mail-wm1-f72.google.com with SMTP id l21so6496773wmj.1
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:38:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VBLzi63miNCcD2Mkc748tKr3FnYtOvYC+AmDEFCN934=;
 b=NdaiOOMyQZIhmbtJ/RrVP/1NKyedc8AQl9vukSL7sWHqM9/5O0dSiEEnLzRSWsBYK5
 Avku8OSIOyD6BG9WR8FwJS9OM2eqc8gFXMI4FHqcpK9s8T9cz+j0L4gKWInHA9VfHDfD
 8wFD4awn+TEvpD1BXvwVTMYM/xTyMc+nuzBR9unq8abdSVRWF/idW33fzUh5vNc7ap+g
 Z61647CBQaM1qoMIDg2mZ2hYHndvcEs2XLVOSn7C+XemiTj8l5yddDSvczyQ9/Vrs9tJ
 BAnbTqe3/afQVl2JA+oEH4V+MRALQ1O/ADVhsis3QuXqp/DMYY8y0hnuax8Q84NFHKKG
 oI1w==
X-Gm-Message-State: AOAM531rkSjv7jFM/gudrOZ1GOU38aKiOvIGDb6Uq6FUkw3TvXzJbv5S
 kvbdIxTai9m6Bbd/Pf9TAQw9kC4mO6neZUpsNHlW7Qs1w7lSEq01ce1JByhD+ChDEdbPgU/h4TD
 fG7Stm28DztojaVAlvLf1MiZBqBQnQzW1t7HySTsokVhf/Xp+oWLe4D9ZVo+5UUXH
X-Received: by 2002:a5d:5304:: with SMTP id e4mr19823320wrv.167.1612791532861; 
 Mon, 08 Feb 2021 05:38:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwf3hbNit+daoCM+szEaCjleQcKWSchip43GakEK2hqj+TFsGFa/PwMCC860B+wLiBxm2xzgg==
X-Received: by 2002:a5d:5304:: with SMTP id e4mr19823297wrv.167.1612791532671; 
 Mon, 08 Feb 2021 05:38:52 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q6sm27380627wrw.43.2021.02.08.05.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:38:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/18] Acceptance Tests: remove unnecessary tag from
 documentation example
Date: Mon,  8 Feb 2021 14:37:11 +0100
Message-Id: <20210208133711.2596075-19-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210208133711.2596075-1-philmd@redhat.com>
References: <20210208133711.2596075-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

The ":avocado: enable" is not necessary and was removed in 9531d26c,
so let's remove from the docs.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210203172357.1422425-4-crosa@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 docs/devel/testing.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 809af697255..209f9d8172f 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -765,9 +765,6 @@ and hypothetical example follows:
 
 
   class MultipleMachines(Test):
-      """
-      :avocado: enable
-      """
       def test_multiple_machines(self):
           first_machine = self.get_vm()
           second_machine = self.get_vm()
-- 
2.26.2


