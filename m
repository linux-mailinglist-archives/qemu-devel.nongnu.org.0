Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ACC4F3302
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 15:07:22 +0200 (CEST)
Received: from localhost ([::1]:56200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbiu1-0001qI-II
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 09:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nbird-0000O1-CX
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 09:04:53 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:39751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nbirb-0003x3-OY
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 09:04:53 -0400
Received: by mail-oi1-x22a.google.com with SMTP id j83so13308421oih.6
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 06:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8dSMUBER5iWCxjQxg4cimJAVjlpSESDyGBA3rSjXR0s=;
 b=clrvte+kINfiiAdCbzPPYpJznmoI6AMsGCXGX7g10Tu7jIB91bYzwOX1K7635CovSP
 0093fNL3utgrOhgyrjqwbmn25vXeiFAw+mZmY+6KNz5s6uBJe2dJwTg7yH1tRD5fP+kG
 cMa60OAQDRKTXeE/OlFYVesL5xby8iX88Dyctv/a/CdQJ7RFEcPT9xm1bD2krQvpWzbr
 rSy34CA88ykN28w59w+1TvWxYbQacDYTvBdVaZ3sOcFanPdCHfqeBdaS3UHpqQOb9RYM
 +AcH4BGPdjhDNe6S8AQpFv8K1dWK2NvdYfiquGgZeeFJR+AJ1kLmfq19riRZErvtvJuc
 4raA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8dSMUBER5iWCxjQxg4cimJAVjlpSESDyGBA3rSjXR0s=;
 b=XUxCrXQXjLaox+uVSgEyZ1L0NeD9BX0IBS+gyypjGqKXTki24xf0/Re+VIA+Zgfsnk
 HUY/3SX+LftRtom5/ljGPRROr8MiplYwAYccyDF8uz86CsNpfQ5JVWeCQ3MyoLA8hegw
 n3cxoaFiWwjnwFNuO+4zK2Zzz5IHb7+DLqZfbkXubW77AKoiNF8bRRWNMRs9/NeHS6RT
 qImGSVuirrDlDHG0Kjr9OypMA9GNV5byt+dreEVSaMS9/fJKKcr1mFgQI/CdCDHeTMRc
 yilvWq4768CjX+lalPsM2hMFar2VJpd7sSMbd4//YowzOIpL+Q0BX7QO5nEPo/VrY2Df
 JK8g==
X-Gm-Message-State: AOAM532PaEfdcMIr7BDvMQBMrUKLuvznJXxDjkjIzn0iHqwz0fc9KzBP
 iEYJc3gPEJZIjkNBGwAX1ihebhSivD8=
X-Google-Smtp-Source: ABdhPJwb3h1nQapD8fpoYsBm/Spl0nmXQKr7+bB4oI44h9vAyYMwE/XXQXWuunG2gbrOqrP40z3lug==
X-Received: by 2002:aca:705:0:b0:2d9:6bb6:5b0 with SMTP id
 5-20020aca0705000000b002d96bb605b0mr1440980oih.11.1649163890119; 
 Tue, 05 Apr 2022 06:04:50 -0700 (PDT)
Received: from rekt.ibmmodules.com ([2804:431:c7c6:abe8:ed:2c78:ab0c:7946])
 by smtp.gmail.com with ESMTPSA id
 60-20020a9d0642000000b005b22a82458csm5658134otn.55.2022.04.05.06.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 06:04:49 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/1] add Valgrind hint in kvm_get_one_reg()
Date: Tue,  5 Apr 2022 10:04:38 -0300
Message-Id: <20220405130439.44253-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Valgrind is not happy with how we're using KVM functions that receives a
parameter via reference and write them. This results in a lot of
complaints about uninitialized values when using these functions
because, as default, Valgrind doesn't know that the variable is being
initialized in the function.

This is the overall pattern that Valgrind does not like:

---
uint64_t val;
(...)
kvm_get_one_reg(...., &val);

if (val) {...}
---

Valgrind complains that the 'if' clause is using an uninitialized
variable.

A quick fix is to init 'val' and be done with it. The drawback is that
every single caller of kvm_get_one_reg() must also be bothered with
initializing these variables to avoid the warnings.

David suggested in [1] that, instead, we should add a Valgrind hint in
the common KVM functions to fix this issue for everyone. This is what
this patch accomplishes. kvm_get_one_reg() has 20+ callers so I believe
this extra boilerplate is worth the benefits.

There are more common instances of KVM functions that Valgrind complains
about. If we're good with the approach taken here we can think about
adding this hint for more functions.


[1] https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg07351.html

Daniel Henrique Barboza (1):
  kvm-all.c: hint Valgrind that kvm_get_one_reg() inits memory

 accel/kvm/kvm-all.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

-- 
2.35.1


