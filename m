Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A93668F993
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 22:14:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPrk3-00007q-N9; Wed, 08 Feb 2023 16:12:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPrk1-000071-Ki
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 16:12:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPrjz-0007nh-9C
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 16:12:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675890750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=urtHEAv6TEXWhqK0ccVUEtbQBcR8E+gJVsq26PRR1Pg=;
 b=H3S7SJQZDtMq/FQWV45vls94oNXXFIV40jrMRiiynH8hex+LAYVEUDvLy2XrSqeisQNicv
 huf/u4Glp1WsHxZsNwBkE0LAFuv6qCTZfqBUt0xI3SOoNMqpe5e5vr8s2bIggVcCocEkgl
 IloGY4KRXNwYgC6LWY3R3yJ4pgNDYDc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-6-joL7kkmENFiXylFQgi1sgQ-1; Wed, 08 Feb 2023 16:12:29 -0500
X-MC-Unique: joL7kkmENFiXylFQgi1sgQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 c14-20020a5d528e000000b002c3f54b828bso1543698wrv.21
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 13:12:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=urtHEAv6TEXWhqK0ccVUEtbQBcR8E+gJVsq26PRR1Pg=;
 b=s9JtyTLUb+9EfHf1IYLGXGQI/oeI6lbyxLTyyifod8MYxh8E3FzyNRierRFGL221xE
 rhR/uiHCFfLQ5JMBmeWMoJc/yVxZ+istI6lDwskp93XRCLIKM/5BXPvodzEc6dzZ1AJF
 pYkLCq7E4xqM5OyznETL8Abz8O9dkruD7VIyGsqETtSpmo0cYl6xq5Ml27ZSG6lO3xFB
 DYF5mfLjGNjW3aAC2COzTPw8vdxrydJi5tEk0nGdAps8rMlMxairhajfAt3sDQveQzbn
 6F+PYsJGidmhGPdvdklm7i0jY8onMp/on6EHwuim1SUbKDlfW7sCvFq9+DPZHORt64S6
 /XpA==
X-Gm-Message-State: AO0yUKX+vRfGoSV5GbZCmOKurdaD8zQ8LK33R9ZyHgc9SJ9VDDGLOfms
 CaV2UZafqVygMuBTFEkzfs2wxhnSBZ19DewtQag+6K7qySPrqyueR4vOCNaDFkQ/0MHWWGYS+vD
 R+8oZUxu+IoQjytrpsqXsiUWLPF7k2YH3wVTm9U85T/O3VZjGVhkQ75D/WzvX2SZLInHF
X-Received: by 2002:a05:600c:4a9c:b0:3dd:1b6f:4f30 with SMTP id
 b28-20020a05600c4a9c00b003dd1b6f4f30mr10581889wmp.3.1675890747159; 
 Wed, 08 Feb 2023 13:12:27 -0800 (PST)
X-Google-Smtp-Source: AK7set+SEIQDKhnpiK7g7LlHXVjc1t0Oty/78WEZWZfusDb3P9/NANYw2WZHQxzeHgsToIOSvWxArg==
X-Received: by 2002:a05:600c:4a9c:b0:3dd:1b6f:4f30 with SMTP id
 b28-20020a05600c4a9c00b003dd1b6f4f30mr10581862wmp.3.1675890746822; 
 Wed, 08 Feb 2023 13:12:26 -0800 (PST)
Received: from redhat.com ([2.52.132.212]) by smtp.gmail.com with ESMTPSA id
 ip21-20020a05600ca69500b003dc59081603sm2742148wmb.48.2023.02.08.13.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 13:12:26 -0800 (PST)
Date: Wed, 8 Feb 2023 16:12:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 Dov Murik <dovmurik@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH RFC 0/7] revert RNG seed mess
Message-ID: <20230208211212.41951-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

All attempts to fix up passing RNG seed via setup_data entry failed.
Let's just rip out all of it.  We'll start over.


Warning: all I did was git revert the relevant patches and resolve the
(trivial) conflicts. Not even compiled - it's almost midnight here.

Jason this is the kind of approach I'd like to see, not yet another
pointer math rich patch I need to spend time reviewing. Just get us back
to where we started. We can redo "x86: use typedef for SetupData struct"
later if we want, it's benign.

Could you do something like this pls?
Or test and ack if this patchset happens to work by luck.

Michael S. Tsirkin (7):
  Revert "x86: don't let decompressed kernel image clobber setup_data"
  Revert "x86: do not re-randomize RNG seed on snapshot load"
  Revert "x86: re-initialize RNG seed when selecting kernel"
  Revert "x86: reinitialize RNG seed on system reboot"
  Revert "x86: use typedef for SetupData struct"
  Revert "x86: return modified setup_data only if read as memory, not as
    file"
  Revert "hw/i386: pass RNG seed via setup_data entry"

 include/hw/i386/microvm.h |   5 +-
 include/hw/i386/pc.h      |   3 -
 include/hw/i386/x86.h     |   3 +-
 include/hw/nvram/fw_cfg.h |  31 ----------
 hw/i386/microvm.c         |  17 ++----
 hw/i386/pc.c              |   4 +-
 hw/i386/pc_piix.c         |   2 -
 hw/i386/pc_q35.c          |   2 -
 hw/i386/x86.c             | 122 ++++++++++----------------------------
 hw/nvram/fw_cfg.c         |  21 ++-----
 10 files changed, 49 insertions(+), 161 deletions(-)

-- 
MST


