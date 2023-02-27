Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D946A3F47
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 11:14:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWaVs-00059M-PI; Mon, 27 Feb 2023 05:13:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWaVq-00059D-Vo
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 05:13:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWaVo-0000vl-W6
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 05:13:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677492820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sykJxmnE+WplKe6CQsDza3kjTf9dXjBsT+YyUwJaLTs=;
 b=Ib73jcK20yS3hMFtYonT65b66yfNkkLKoW1h1YZCQ0vRODPpCXlXfbnr+8cz+ebs0iFGw4
 9K1dV0heRrcsQZJtZpR125iALpLLQjfaamP+z6m0eqGPol5iwkC530gHcRtiMYoLCsMCwJ
 Eo4ZZbs5e3O5c38ZWh7v/OHsNsaR7kg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-183-bmgVLuDFNrunBvI29YSxhg-1; Mon, 27 Feb 2023 05:13:37 -0500
X-MC-Unique: bmgVLuDFNrunBvI29YSxhg-1
Received: by mail-ed1-f70.google.com with SMTP id
 cy28-20020a0564021c9c00b004acc6cf6322so7712799edb.18
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 02:13:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sykJxmnE+WplKe6CQsDza3kjTf9dXjBsT+YyUwJaLTs=;
 b=rhdCc20gjRwYv2SAwiPKBUk3KihDqbYogcJr9EOmlY70MYwILPuN95uB/+aWlj/ZP1
 3VnNILETKmG0fFOUxgT1GmjVX9eaSpUoHNzSK9vHqDumksyQjbnLhICMiIsOavJ+FPiN
 THy0DS0V+un5GWgJNHV77grAT4Ao7sN78ZXmbw92366u9hvDd+zKc7AbPwAYN0amgJY+
 rVzlvlFzO2/U8El68lbu9qvOgclPScypgnj+UrbKdxc+uYMvyDguNtK4XXvFV+/O/H+H
 FGlAnq6joFBui3ZdpwnMxQpiMxC1UWyWG2HphN3QJaRl+7plu+AU0L1aLdWRCoKvU9XO
 c+LQ==
X-Gm-Message-State: AO0yUKUFeKO7GMJtPgKDCY5QR5aKf2F68TUf+GHluJOivKk9wNAR62kv
 Ig/gzlLMLswPwE1VR1j1BOUGtbBeZdGWJQsev9j+Q/vIkslCnfsgF11LS54eSuer2mlTT0XjcY6
 UacOqC4Qp3AnQ0Duhc1r5sFUUG3jWjPqtem/CG5yT5/MHJU6/d8afH3fKi1D4Dw4QrEK/ZdO+
X-Received: by 2002:a17:907:1b08:b0:900:a150:cea4 with SMTP id
 mp8-20020a1709071b0800b00900a150cea4mr1539323ejc.37.1677492816263; 
 Mon, 27 Feb 2023 02:13:36 -0800 (PST)
X-Google-Smtp-Source: AK7set/SaD/dW8i+ojgx6ctoZEQxoY5oUFivKhxTppWKAWemDMqh/2INQL+6ujJQ97IeAEqNAsYs+A==
X-Received: by 2002:a17:907:1b08:b0:900:a150:cea4 with SMTP id
 mp8-20020a1709071b0800b00900a150cea4mr1539291ejc.37.1677492815950; 
 Mon, 27 Feb 2023 02:13:35 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a1709060e5400b008e772c97db6sm2984777eji.128.2023.02.27.02.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 02:13:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: lei4.wang@intel.com, robert.hu@linux.intel.com, xiaoyao.li@intel.com,
 chenyi.qiang@intel.com
Subject: [PATCH v4 0/4] target/i386: Add new CPU model SapphireRapids and new
 fast string op leaves
Date: Mon, 27 Feb 2023 11:13:27 +0100
Message-Id: <20230227101332.636203-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Sapphire Rapids enablement patches got stuck on the doubts regarding
properties for AMX support.  However, for now there is no need to have
anything but hardcoded values, because all Intel processors with AMX
currently support exactly the same palettes and TMUL limits.  Intel has
also promised that palette formats will remain backwards compatible so
the only worry is for the TMUL leaf, CPUID[1Eh].

However, providing modifiable properties for AMX is premature.  Rather,
the first step should be to _validate_ host CPUID values against the
ones supported by QEMU.  So for now apply the simpler patch that only
adds the new model.

In addition, add the FZRM, FSRS, FSRC bits: first, they are now supported
by Linux (albeit only in the upcoming 6.3 release); second, they are just
markers that do not require any support in the hypervisors.  While at
it, this series also adds these new markers as well as FSRM to TCG's
"-cpu max" model.

Supersedes: <20230106083826.5384-1-lei4.wang@intel.com>

Paolo Bonzini (3):
  target/i386: add FSRM to TCG
  target/i386: add FZRM, FSRS, FSRC
  target/i386: KVM: allow fast string operations if host supports them

Wang, Lei (1):
  target/i386: Add new CPU model SapphireRapids

 target/i386/cpu.c     | 142 ++++++++++++++++++++++++++++++++++++++++--
 target/i386/cpu.h     |  11 ++++
 target/i386/kvm/kvm.c |  17 ++++-
 3 files changed, 163 insertions(+), 7 deletions(-)

-- 
2.39.1


