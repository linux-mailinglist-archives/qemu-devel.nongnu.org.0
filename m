Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A0B66D797
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 09:09:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHh1H-0002p2-Hv; Tue, 17 Jan 2023 03:08:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pHh0f-0002mx-67
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:07:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pHh0a-0000RZ-Fz
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:07:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673942871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wiF5o6njUsC0203MhYuzTKVXzMSAtaT/LrD93Eelhpk=;
 b=cFgmOlnkBGkPlDda+GcviBXdE3C3f8eiLiBI6YhVP4I3C9vv7t5+SUBUoZMv8hhmgg07r/
 JCpTzkOWdk78pzi5zwAZ1/M+Qgeyvkop+DsuXfhsJbVW0e61FaG9C78eF34bl8pPPgv0Hg
 OXeO0aPucEUgo5X9awubiYmzMYze6eY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-m93ASgOKPb-oXgtZggy5Kg-1; Tue, 17 Jan 2023 03:07:49 -0500
X-MC-Unique: m93ASgOKPb-oXgtZggy5Kg-1
Received: by mail-ed1-f72.google.com with SMTP id
 w3-20020a056402268300b00487e0d9b53fso20735466edd.10
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 00:07:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wiF5o6njUsC0203MhYuzTKVXzMSAtaT/LrD93Eelhpk=;
 b=TGlVFOGZtPPgHj4xlq7WOZTLydPlr0E9i6VgLcaETTWlPih9TcuklFTCBHcl78J26h
 w4wztf3p0HwYDyAIU/1Hrgb4+3zjH9Py2ZFraZQqUwNl3fwmwwr8IV6oULlm4fGkFZJ/
 53klX1VCJ7jROrh2/kLkXMToz7SPyl77wn7DUV4i3BfaNVb/aCIO+dVzlzWOkSVJzNL6
 r2E1m+fMSF1GiX3HmTu1LoqPvAMZAD41XpUJdbuygNaMuKfCU2+XWmJlAvKcs9NvJxeF
 eVMEgejWmTroJLrJregu+hjnaBPJ/bBvS5gMdrQNkyMxAAuRGU1WKygNjG2Itea7MOZv
 lzug==
X-Gm-Message-State: AFqh2koQ57Y47vLYweWEyyMJMJ/5eCuhZ7kUxEj7UbHI/AR2dPFi2xL8
 zqOBBUcWZw6vLsiPCJcN5UmOwdwcAmLjJ4cL30/7ofGk2Ymb3e9yV0ScIYbr/FThXNiBtl7v+j0
 sygXg99wDXF9++qwqKMSAKC0Njq2cMZG5wVG4aoSk0jNosEklD9BvDyFPeD4uQxXhgl0=
X-Received: by 2002:a05:6402:3986:b0:49d:5c6:3e5f with SMTP id
 fk6-20020a056402398600b0049d05c63e5fmr2169315edb.41.1673942868389; 
 Tue, 17 Jan 2023 00:07:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuOvjaNABQwmBPvCxnYnxkCsnYD9kEUWaCK7pEWuyvvRmOg1IECprCqjmRFCVy+QjcMrMopDw==
X-Received: by 2002:a05:6402:3986:b0:49d:5c6:3e5f with SMTP id
 fk6-20020a056402398600b0049d05c63e5fmr2169302edb.41.1673942868124; 
 Tue, 17 Jan 2023 00:07:48 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 l15-20020aa7c3cf000000b00467481df198sm12364988edr.48.2023.01.17.00.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 00:07:47 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com
Subject: [PATCH 0/4] vl: avoid SIGSEGV on invalid [accel] configuration
Date: Tue, 17 Jan 2023 09:07:41 +0100
Message-Id: <20230117080745.43247-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
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

While QEMU catches invalid -accel command line options:

    $ qemu-system-x86_64 -accel foo=bar
    Accelerators supported in QEMU binary:
    tcg
    xen
    kvm

the same is not true of configuration files, which instead crash.  Patch 1
is the trivial fix, but writing a test is a bit more complex: there are
no existing testcases where the qtest socket would not even start.  So
the series does the required refactoring and cleanup before adding tests
for both valid and invalid [accel] sections in patch 4.

Paolo Bonzini (4):
  vl: catch [accel] entry without accelerator
  libqtest: split qtest_spawn_qemu function
  libqtest: ensure waitpid() is only called once
  readconfig-test: add test for accelerator configuration

 softmmu/vl.c                  |  15 +++-
 tests/qtest/libqtest.c        | 160 +++++++++++++++++++++-------------
 tests/qtest/libqtest.h        |  12 +++
 tests/qtest/readconfig-test.c |  45 ++++++++--
 4 files changed, 156 insertions(+), 76 deletions(-)

-- 
2.38.1


