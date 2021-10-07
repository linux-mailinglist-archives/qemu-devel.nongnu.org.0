Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 138B3425A58
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 20:06:13 +0200 (CEST)
Received: from localhost ([::1]:41048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXmW-0001ez-3T
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 14:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYXcx-0004H1-LW
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:56:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYXcv-0005SW-5I
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:56:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633629376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=45hrM8wuc+myNiOM2zoMYzzXxjY8sOr9rUzPHTWOskw=;
 b=cg7tgBNlzcWLu6F2DRm9wdonAAcp+W1Uj5Vg+WKaHz3maMe5/pV9Yxvxxlizbo2qdAaRR0
 agIoY2ycguIRP+IvbFxZCcMZ6rSTFA7wQ8po7JIJVE4KmfJ/PyBgxpyO5j+2b67irF3x0o
 FA4wci8htATsS3OqTFuZe4NeH4RbuUw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-9vZRu3TqM4aaWfy4TNMLew-1; Thu, 07 Oct 2021 13:56:15 -0400
X-MC-Unique: 9vZRu3TqM4aaWfy4TNMLew-1
Received: by mail-wr1-f70.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so5318063wrb.14
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 10:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KZEs3CHKVCPRrYTgLS0uyWcTaAMKvQL1Cby26ru6Q68=;
 b=fqiqUoja8hLidENrjlzw8DJqLSynHlUVBqkSq1D/oLKQwTgMqJ05LX2QX+jBJ6hr9B
 w6Ql8DUG4rrnjs+a5GM3FiJjuOmo2MiUaIR0uYTRj14wBjoJrIu/ZxgSZwQ5qcDTa761
 P4Dt6jfn57lPCBFcJ3ydIrdp+rVdvO1OtjSOFaSiDZGrNmXDN8V/eDLyuf3ksifCZ98a
 I2WqWErJuOVohKFkqxhEgenUPihR0Br8Q/ps3UjuJCqhaU11Ufn5l2CZYwboVq6FUbU6
 3BNf5Q7xdMheAGW4+BYmJ8iUZG171Dcwxc0tAh85u+WmTjhaMzHJ7tWH/bcbqfTHfhLz
 HkxA==
X-Gm-Message-State: AOAM532ekwvCOnHBoZu+oyI2aTWxllKPEz3nawmi6I+9xrNStcfSjGJF
 hqz9klCkANS/JCAC+ZU07H1/+FVLVcwHOqWNghwz5tsacw+ChTnm5NLKz3R41eZ3lwRUStVvg2G
 C7NQRKt60Wdc1eT2zDZ/k76zFa+5Iv5xcPjujho9fyG8EHzfIj1dyfgU2f/yiSY//
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr7450190wrr.278.1633629373897; 
 Thu, 07 Oct 2021 10:56:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+9umpctT3UPQ6GHS06rOgBeXK0Eow9hoM/zqz4ZFEISeSFRsG+JU0QqBTMq7vIVmJCVG0HA==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr7450166wrr.278.1633629373709; 
 Thu, 07 Oct 2021 10:56:13 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id q7sm20369wrs.73.2021.10.07.10.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 10:56:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] hw/i386/sgx: Housekeeping around SGX
Date: Thu,  7 Oct 2021 19:56:08 +0200
Message-Id: <20211007175612.496366-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

- Update MAINTAINERS=0D
- Have sgx_epc_get_section() return a boolean=0D
- Move QMP commands from target/i386 to hw/i386 (suggested by Paolo)=0D
=0D
Based-on: <20211007161716.453984-1-philmd@redhat.com>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  MAINTAINERS: Cover SGX documentation file with X86/KVM section=0D
  hw/i386/sgx: Have sgx_epc_get_section() return a boolean=0D
  hw/i386/sgx: Move qmp_query_sgx_capabilities() to hw/i386/sgx.c=0D
  hw/i386/sgx: Move qmp_query_sgx() and hmp_info_sgx() to hw/i386/sgx.c=0D
=0D
 include/hw/i386/sgx-epc.h |  2 +-=0D
 include/hw/i386/sgx.h     | 12 ------------=0D
 hw/i386/sgx-stub.c        | 16 ++++++++++++----=0D
 hw/i386/sgx.c             | 35 +++++++++++++++++++++++++++++------=0D
 target/i386/monitor.c     | 32 --------------------------------=0D
 MAINTAINERS               |  1 +=0D
 6 files changed, 43 insertions(+), 55 deletions(-)=0D
 delete mode 100644 include/hw/i386/sgx.h=0D
=0D
--=20=0D
2.31.1=0D
=0D


