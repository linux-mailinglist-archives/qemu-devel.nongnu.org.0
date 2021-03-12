Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4723399BB
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 23:41:38 +0100 (CET)
Received: from localhost ([::1]:35470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKqTQ-0001YG-QC
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 17:41:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lKqRy-0000yv-BS
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 17:40:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lKqRv-0002Vr-Jz
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 17:40:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615588802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ojZIS9lHfUU3fEbC1UROtlV97gKdJFp0a8kE4wxNDho=;
 b=gvKw3saj/qmAd2eufELiPPBk0HV8A1ety8aQnx+XJ359gyYRfyQ3kinrTloDNSjdApBoT/
 kfAwinAvyllH+5LYxM9bokyxvH5Sk/K5UwDXHGKldEwewRbzVDw3a4lSvB19P9RbgPIgAO
 NfGLYxH6VGNh7V7ZAvn1xc/4nBhpUgM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-jxwHenfUM7K6SWIlUmgo-w-1; Fri, 12 Mar 2021 17:40:00 -0500
X-MC-Unique: jxwHenfUM7K6SWIlUmgo-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75B5019057A0;
 Fri, 12 Mar 2021 22:39:59 +0000 (UTC)
Received: from localhost (unknown [10.40.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC4EE610A8;
 Fri, 12 Mar 2021 22:39:51 +0000 (UTC)
Date: Fri, 12 Mar 2021 23:39:49 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: qemu crashes on changing display resolution within guest
Message-ID: <20210312233949.3681b75d@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: pbonzini@redhat.com, drjones@redhat.com, zhukeqian1@huawei.com,
 kraxel@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

happens on current master,

to reproduce start
./x86_64-softmmu/qemu-system-x86_64 -enable-kvm -m 1g -M pc -vnc localhost:0 \
     -snapshot -cdrom Fedora-Workstation-Live-x86_64-33-1.2.iso

connect to guest using 'Remote Desktop', wait till it boots to graphical desktop
then try to change resolution to 800x600

QEMU will crash in a second or 2 with:
qemu-system-x86_64: ../qemu/accel/kvm/kvm-all.c:690: kvm_log_clear_one_slot: Assertion `QEMU_IS_ALIGNED(start | size, psize)' failed.


offending commit:

commit 3920552846e881bafa9f9aad0bb1a6eef874d7fb (HEAD, refs/bisect/bad)
Author: Keqian Zhu <zhukeqian1@huawei.com>
Date:   Thu Dec 17 09:49:41 2020 +0800

    accel: kvm: Add aligment assert for kvm_log_clear_one_slot

PS:
same happens when using spice client


