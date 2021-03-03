Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B363232B9D6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:26:48 +0100 (CET)
Received: from localhost ([::1]:35236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWCt-0002bI-PV
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW8u-0004iK-II
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:22:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW8s-0000Qn-VJ
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:22:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614795758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PDMMcK3oLvQF9Y3zPO+zi1w8ujiioTi9C21H6L1uDR8=;
 b=U75I5r4s+WL3Gc1/mCFdub6XnoxeKf8rkt1+AZkA+QkWPfVTQbDKB0TrvNzSMxbWDMeNtT
 njWJ7Is+5vIkFqMfiTNwqwOrTs1Baw+mqvdeXTNXMC7R/pDfIlEnof7Ewfp+EPgRx1Huup
 u+gJf6cON99EBt4aKHanAyMKLPYvTA4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-u9aePSn8Nl-q_H4ADjK4DQ-1; Wed, 03 Mar 2021 13:22:36 -0500
X-MC-Unique: u9aePSn8Nl-q_H4ADjK4DQ-1
Received: by mail-wm1-f70.google.com with SMTP id b62so3392850wmc.5
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:22:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PDMMcK3oLvQF9Y3zPO+zi1w8ujiioTi9C21H6L1uDR8=;
 b=HoO/QlOuHp311rzdK88a+xB9TapfZZ2qhYaXgtutm/FjTTzU9GBUb+3C2ePCni94vE
 cro/vCsho1sISKrrSlLo0I6sX5V445ucs6d5wwhBVCxRQe4rimH+ojrkYDg2QmFwyyJc
 9/vonHcVB1c6jb4DVCbkdC5GIReFvSF8/Iox6n8tphw7Xuwo1tU7Xa09EnEM0WD4k1V5
 khg4JvdMYDfxZg3HxIeLJ/PKEZdFPNTt/cuqfUZPc831Vp1Fs5NeimR9FmOnh2f8QXrp
 VBjrueR8GitllkQoePKOcirz6EZTaNQgM0dgkX5e2T8bNLsMKTvOVbQO+eqv2Vak8Eol
 +2KA==
X-Gm-Message-State: AOAM533u1+iBAeAYxoOoPp4KC8bK8VKrtqNLPme1e04phL1tRJUfF2a4
 dYYtT/sbHS6XreIrMBpPQCZDiVMivN4P1TyRNx9EVNR+mSSyEy3JQi+0/OOLGuPEp2h+Wbbaffc
 CcOZtXpArR0OeFtOY+Zg1YSUp5k50aCyOebRdRSCum1IAhC56nuuLzIhAVSPSPwqN
X-Received: by 2002:a05:6000:1104:: with SMTP id z4mr33850wrw.10.1614795753993; 
 Wed, 03 Mar 2021 10:22:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVg9s4r7l2oq5gGa5GiZIt6JV8Y3K8GM+LsYLl9lX9UTNK+XtLNOIsOPAgN1hKIK0orGUEvQ==
X-Received: by 2002:a05:6000:1104:: with SMTP id z4mr33805wrw.10.1614795753484; 
 Wed, 03 Mar 2021 10:22:33 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f22sm6664306wmc.33.2021.03.03.10.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:22:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/19] target/s390x/kvm: Simplify debug code
Date: Wed,  3 Mar 2021 19:22:02 +0100
Message-Id: <20210303182219.1631042-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303182219.1631042-1-philmd@redhat.com>
References: <20210303182219.1631042-1-philmd@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have the 'run' variable holding 'cs->kvm_run' value.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/s390x/kvm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index 7a892d663df..73f816a7222 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -1785,8 +1785,7 @@ static int handle_intercept(S390CPU *cpu)
     int icpt_code = run->s390_sieic.icptcode;
     int r = 0;
 
-    DPRINTF("intercept: 0x%x (at 0x%lx)\n", icpt_code,
-            (long)cs->kvm_run->psw_addr);
+    DPRINTF("intercept: 0x%x (at 0x%lx)\n", icpt_code, (long)run->psw_addr);
     switch (icpt_code) {
         case ICPT_INSTRUCTION:
         case ICPT_PV_INSTR:
-- 
2.26.2


