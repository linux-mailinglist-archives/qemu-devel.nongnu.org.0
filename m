Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F41D43E5F5
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 18:19:35 +0200 (CEST)
Received: from localhost ([::1]:50144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg87q-0007yu-DL
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 12:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mg7mR-0003xt-UJ
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:57:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mg7mQ-0004TM-0I
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:57:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635436645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K+uUtvBZwNV0JiYmSOvDnSIiGNED4uCQ0Vl36Pi6tRQ=;
 b=JVzQWqJMqnQPjmenVsLE6WwbKsreAAx92QUwK9Hu2dqAAbdsud3t7nDz7krw8DxrYWbI2K
 QzZvBiXeyynFaDrz2mCYDH8YbQ11Sg/fV4x5cHXq09VCcUIpAyOfdJWpqYCtj+17QgoBL5
 73RyHXMBx/zRVVd3efPN6Xgd2uECh2c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-Nz73paXJO4yIdfPFyWa30Q-1; Thu, 28 Oct 2021 11:57:24 -0400
X-MC-Unique: Nz73paXJO4yIdfPFyWa30Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B18F41023F4E;
 Thu, 28 Oct 2021 15:57:22 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.195.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F11D0708DF;
 Thu, 28 Oct 2021 15:57:09 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/22] docs/devel: document expectations for HMP commands
 in the future
Date: Thu, 28 Oct 2021 16:54:44 +0100
Message-Id: <20211028155457.967291-10-berrange@redhat.com>
In-Reply-To: <20211028155457.967291-1-berrange@redhat.com>
References: <20211028155457.967291-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We no longer wish to have commands implemented in HMP only. All commands
should start with a QMP implementation and the HMP merely be a shim
around this. To reduce the burden of implementing QMP commands where
there is low expectation of machine usage, requirements for QAPI
modelling are relaxed provided the command is under the "x-" name
prefix.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/devel/writing-monitor-commands.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/docs/devel/writing-monitor-commands.rst b/docs/devel/writing-monitor-commands.rst
index b87992df91..b3e2c8481d 100644
--- a/docs/devel/writing-monitor-commands.rst
+++ b/docs/devel/writing-monitor-commands.rst
@@ -11,6 +11,14 @@ For an in-depth introduction to the QAPI framework, please refer to
 docs/devel/qapi-code-gen.txt. For documentation about the QMP protocol,
 start with docs/interop/qmp-intro.txt.
 
+New commands may be implemented in QMP only.  New HMP commands should be
+implemented on top of QMP.  The typical HMP command wraps around an
+equivalent QMP command, but HMP convenience commands built from QMP
+building blocks are also fine.  The long term goal is to make all
+existing HMP commands conform to this, to fully isolate HMP from the
+internals of QEMU. Refer to the `Writing a debugging aid returning
+unstructured text`_ section for further guidance on commands that
+would have traditionally been HMP only.
 
 Overview
 --------
-- 
2.31.1


