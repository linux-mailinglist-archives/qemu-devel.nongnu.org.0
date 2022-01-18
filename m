Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F92492196
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 09:46:42 +0100 (CET)
Received: from localhost ([::1]:32786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9k8Y-0002aR-2B
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 03:46:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n9jn8-0003ex-M1
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 03:24:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n9jmz-0004sw-UR
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 03:24:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642494252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=RWiXY0qRGffWsZ86WDzh4lGPcJYVUuPIERRF1pJSF4M=;
 b=Hvmq9xRUR3bXj1OkDjo+KuLJXOXoD1qAaPX7PQNb9tbcrscpNEDT7ktqRZl0ocR2J7szQa
 gbjOvgLwJ6cNUeVNC5BDuZevDvARremqe4rcrLfIDbcg9eEeLVoLtTQIKGZzP16f00cwGe
 vMFjHyhtlMPuPaOaiKXpFleXJ87sq3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-bsydMgDjPIi6CD7lVPb1AA-1; Tue, 18 Jan 2022 03:24:05 -0500
X-MC-Unique: bsydMgDjPIi6CD7lVPb1AA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E617F824F83
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 08:24:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14C7F6F948;
 Tue, 18 Jan 2022 08:23:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9704C11380A2; Tue, 18 Jan 2022 09:23:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: tracing.rst neglects to document syntax of trace-events files
Date: Tue, 18 Jan 2022 09:23:50 +0100
Message-ID: <87zgntpi3t.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Almost[*] all trace-events files start with this line:

    # See docs/devel/tracing.rst for syntax documentation.

But I can't find syntax documentation there.


[*] Exceptions:
    $ git-ls-files \*/trace-events| xargs fgrep -L '# See docs/devel/tracing.rst for syntax documentation.'
    ebpf/trace-events
    hw/core/trace-events
    hw/hyperv/trace-events
    hw/mips/trace-events
    hw/net/can/trace-events
    hw/nubus/trace-events
    hw/nvme/trace-events
    hw/remote/trace-events
    hw/sh4/trace-events
    hw/ssi/trace-events
    target/arm/hvf/trace-events
    target/riscv/trace-events
    target/s390x/kvm/trace-events


