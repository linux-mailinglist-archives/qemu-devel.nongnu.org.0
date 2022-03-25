Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 318B44E6E8D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 08:12:32 +0100 (CET)
Received: from localhost ([::1]:39384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXe7b-0002Lo-85
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 03:12:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXe2S-0007zC-01
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 03:07:12 -0400
Received: from [2a00:1450:4864:20::534] (port=33331
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXe2P-0000XO-Vq
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 03:07:11 -0400
Received: by mail-ed1-x534.google.com with SMTP id r23so8205675edb.0
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 00:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XzTvH2o6xZOBNz5JvOhSjrJLnI1BDwX/0YybgWLPmX0=;
 b=hZkKFK8uLLDaZk+3fBV16F6x6ESnbDin0IALmmkWZ+Kf8fwCsMOx8VEJY3C+ZOBHbe
 XDFE+MstW7lSffpaoTZBtjfSIDmASfWzTC0pIIWOtYP1ep8ZPAQgVA5jqsX4kMtMRexA
 IkaBsSrblvny3qZqMfCP3Y913WlFO96tq0DIOqzEJMvqcik5RAHSywJ9YPB8dB17317r
 Q4d+fzKEthG+p6eQCdE5rEehwf1ekuIjmunEtW9WVuwv8GrG/jkDwa+dulMwhxFQxTZl
 JIps3DRtRWcWmE28UcHN739Ukp9bX4rOsgmloJCpcWlOZ8bSqcvjfr6pTgrkUp1tga55
 dmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=XzTvH2o6xZOBNz5JvOhSjrJLnI1BDwX/0YybgWLPmX0=;
 b=cWDkmC6Hw/EmenQU5/hVTec5snm/qk+86grzqGCa5pzAdMzrvgQ/guePoO084uL82F
 +MR38x6rCaoCU/DbOf7zJyzBikgi+O8Bh+LWmlsSlgqgmThOV7BOY34YsIcoUSJDqecN
 JqA6bvs39UaWrTQ4z2wcdz6WgIl626gKpW6LSEjbm5/YgD0GlzAJz54KT9QpbjmF+484
 A8Fd8wgg5k8I1God552ODb7BHB+o3xbmzmTE9IjW7LpDvogBf3QOUqo0jSx2dqay6zCr
 eCQAWT0qJT6NeSvQE1J0Goav9joIgn2JdXX+lG94g9lesOk/ByG0PUNuQWQe+eMfNN+J
 CPvg==
X-Gm-Message-State: AOAM533DDzrwtFZ1LLwGqxYXYccyzUodHwxikoF9oO/VMfgVa7JcS7aO
 TCC4q1bdGaBXxJIW4hrnJvlLN1/Cpy8=
X-Google-Smtp-Source: ABdhPJz5xwfds4D8ZoGuyEbIXgOV+kiU32ZiBmIR9xtte5CRcnoXhkkfTopMfLz7ii4LhTnNGFKdWg==
X-Received: by 2002:a50:d64f:0:b0:418:f142:5d1c with SMTP id
 c15-20020a50d64f000000b00418f1425d1cmr11273253edj.192.1648192028044; 
 Fri, 25 Mar 2022 00:07:08 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 ka6-20020a170907990600b006ce54c95e3csm2011497ejc.161.2022.03.25.00.07.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 00:07:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] (Mostly) x86 fixes for QEMU 7.0.0-rc2
Date: Fri, 25 Mar 2022 08:06:59 +0100
Message-Id: <20220325070706.271291-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 15ef89d2a1a7b93845a6b09c2ee8e1979f6eb30b:

  Update version for v7.0.0-rc1 release (2022-03-22 22:58:44 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 9584d3d00a454f47b0341465142bcf0735d734ae:

  build: disable fcf-protection on -march=486 -m16 (2022-03-24 18:44:07 +0100)

----------------------------------------------------------------
Bugfixes.

----------------------------------------------------------------
Christian Ehrhardt (1):
      build: disable fcf-protection on -march=486 -m16

Paolo Bonzini (4):
      KVM: x86: workaround invalid CPUID[0xD,9] info on some AMD processors
      configure: remove dead int128 test
      target/i386: tcg: high bits SSE cmp operation must be ignored
      target/i386: properly reset TSC on reset

Philippe Mathieu-Daudé (1):
      target/i386/kvm: Free xsave_buf when destroying vCPU

luofei (1):
      i386: Set MCG_STATUS_RIPV bit for mce SRAR error

 configure                   | 18 ------------------
 pc-bios/optionrom/Makefile  |  4 ++++
 target/i386/cpu.c           | 17 +++++++++++++++--
 target/i386/cpu.h           |  4 +++-
 target/i386/kvm/kvm-cpu.c   | 19 ++++++++++++-------
 target/i386/kvm/kvm.c       |  4 +++-
 target/i386/tcg/translate.c |  6 ++----
 7 files changed, 39 insertions(+), 33 deletions(-)
-- 
2.35.1


