Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE24064E9FF
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 12:08:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p68Zb-0004kN-Ou; Fri, 16 Dec 2022 06:08:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p68ZW-0004jt-M6
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:08:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p68ZR-0002Gr-NM
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:08:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671188884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YdJiwVL1JAQRQ2OvVL3UlebIKrbnIbdAo/ZzrUYOeHQ=;
 b=aBLukGWvf4kCevVAA/CqZslxfVRZrW7lA5qMmqkMYQM33HSm23vEAHiREcsx41NoFTmYuF
 S2lqY3/x0BRN1YEbfXya/OQ3gL3uNmLqZulWiHfIeoJSiA3asS5huwNONzFM5R2BCJ/oFe
 6iXGXBOXgxiE8d/kL9u4KKByDGfllbw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-169-GSvF2oAjMMuKUWD1DQ_Wmw-1; Fri, 16 Dec 2022 06:08:03 -0500
X-MC-Unique: GSvF2oAjMMuKUWD1DQ_Wmw-1
Received: by mail-ed1-f71.google.com with SMTP id
 f15-20020a056402354f00b00475a6378738so1150311edd.8
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 03:08:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YdJiwVL1JAQRQ2OvVL3UlebIKrbnIbdAo/ZzrUYOeHQ=;
 b=noM5kYQiCavOkXPTkAbHS8jQTIIyAr35F2cnnhqP1NzlOEKi4a1a8XrvPYOzMsYNV1
 nJ0wrymc3poG3Svm0pZJllv/8tWd10vp76t5H3bew13lG54DY8IIiB9CrBBYJF59jzq1
 P5NnYBUPz7eAO+Ko2SGy6tDDtFXIDEGY7CQcXYoBuuPrnkYtiWq2ax+zKZ66iXJfoAjK
 xKMVrRs3eXha097pAvG02Y3a08rhZdoECapOlf1SmKvvCkj0Dy+pQ+w1FXzEUXaC0mM4
 sTf1DKupij72ObDgwRsVZ9KcEnyHBs+uCM6xUSNk+Hh3tAzexDMgr+Xh16h6liHllXIE
 0mcA==
X-Gm-Message-State: ANoB5pmqjrqiPNNDLlh8OnocmKLjXTHwsfLQdSDpLdQcQ14+kJhc+pqw
 JQsevNtVBbydg75ow2jusyNhb0+5lGCasuW2jC3Js+qpZ43hMEjNbmydqXy7EDGHnCAvs94o1Tn
 7dBH0nJ1OoIflGXie4th8VllNGk3/d2VRRM5FjcnDbQAc32rrk8IzifDkttVkiZOV/AA=
X-Received: by 2002:a05:6402:c08:b0:46d:83ea:44e8 with SMTP id
 co8-20020a0564020c0800b0046d83ea44e8mr28612355edb.21.1671188881596; 
 Fri, 16 Dec 2022 03:08:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4B7OceiDtpfM5YKnDswg5HsZgoNdshdtWXYwOlPih82Nwi6BN8oSWIKi+pRvpRnbHeRd8pTA==
X-Received: by 2002:a05:6402:c08:b0:46d:83ea:44e8 with SMTP id
 co8-20020a0564020c0800b0046d83ea44e8mr28612331edb.21.1671188881222; 
 Fri, 16 Dec 2022 03:08:01 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 cm12-20020a0564020c8c00b00463b9d47e1fsm740524edb.71.2022.12.16.03.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 03:08:00 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: afaria@redhat.com,
	qemu-block@nongnu.org,
	kwolf@redhat.com
Subject: [PATCH 0/2] Make coroutine annotations ready for static analysis
Date: Fri, 16 Dec 2022 12:07:56 +0100
Message-Id: <20221216110758.559947-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Clang has a generic __annotate__ attribute that can be used by
static analyzers to understand properties of functions and
analyze the control flow.

Unlike TSA annotations, the __annotate__ attribute applies to function
pointers as well, which is very fortunate because many BlockDriver
function driver run in coroutines.

Paolo

v1->v2: improved comments for patch 2

Alberto Faria (2):
  block: Add no_coroutine_fn and coroutine_mixed_fn marker
  coroutine: annotate coroutine_fn for libclang

 include/block/block-common.h | 11 +++++----
 include/qemu/coroutine.h     | 43 ++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+), 4 deletions(-)

-- 
2.38.1


