Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0548435162A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 17:26:02 +0200 (CEST)
Received: from localhost ([::1]:50542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRzCr-00050n-3E
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 11:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lRz7M-0007NC-Rk
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 11:20:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lRz7J-00058Y-Bz
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 11:20:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617290415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+U1pKH/BW9UvMBTuyQgNKNKt0F7u/dWh8uFIyKFMJFc=;
 b=ewOfHD/pmP3V+TH9Yac11ec9W0f1zlsUJkjqhsbKP42/SR5sIlre1KK0ThvFHEMDbJtKfi
 jv12ZVkoVvnntQhCnC907Z0Sc+sxXaU1je9/ia1s4JGKtu3kkHITGWddMjCEWwVukLwqn3
 5CLOBmKm+GZqE846N1tMJUklvx1bUOg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-qx-vpLpYN06Kjx633TCGZQ-1; Thu, 01 Apr 2021 11:20:13 -0400
X-MC-Unique: qx-vpLpYN06Kjx633TCGZQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EBEB107B7C5;
 Thu,  1 Apr 2021 15:20:12 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 410E11001281;
 Thu,  1 Apr 2021 15:19:58 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 0/2] i386: Fix interrupt based Async PF enablement
Date: Thu,  1 Apr 2021 17:19:55 +0200
Message-Id: <20210401151957.408028-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I noticed two issues with 'kvm-asyncpf-int' enablement:
1) We forgot to add to to kvm_default_props[] so it doesn't get enabled
 automatically (unless '-cpu host' is used or the feature is enabled
 manually on the command line)
2) We forgot to disable it for older machine types to preserve migration.
 This went unnoticed because of 1) I believe.

Vitaly Kuznetsov (2):
  i386: Add 'kvm-asyncpf-int' to kvm_default_props array
  i386: Disable 'kvm-asyncpf-int' feature for machine types <= 5.1

 hw/i386/pc.c      | 1 +
 target/i386/cpu.c | 1 +
 2 files changed, 2 insertions(+)

-- 
2.30.2


