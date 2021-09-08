Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C172B403823
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:43:50 +0200 (CEST)
Received: from localhost ([::1]:39946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNv3V-00035Z-QX
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNuxE-00009e-PU
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:37:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNuxC-0003r4-1P
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631097437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0LaGWGHRKF4KyGLUeIWs7LfNT8ZIwfCo3FPBs0wLOR4=;
 b=N/5Cr5rqaF5Vg6YdY7gEPavDEWky+dGvV0i5cHZ4kZDn764UXJncLfIPsCVE84uzMpeXxv
 vyPWE6tnfFzBq7oajO66RVdERutrEXemjKs0i3ajcIURifoWcf59GdU+IaxBkCZVlJN8UA
 UHI+nI53P/Ft8iR+8qZFz8UbrgQ/VhE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-9zUKwunhNdS9fVDzaEGNEw-1; Wed, 08 Sep 2021 06:37:16 -0400
X-MC-Unique: 9zUKwunhNdS9fVDzaEGNEw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4ED681023F4E;
 Wed,  8 Sep 2021 10:37:15 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.192.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9BA05C1BB;
 Wed,  8 Sep 2021 10:37:13 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] docs/devel: document expectations for QAPI data modelling
 for QMP
Date: Wed,  8 Sep 2021 11:37:07 +0100
Message-Id: <20210908103711.683940-2-berrange@redhat.com>
In-Reply-To: <20210908103711.683940-1-berrange@redhat.com>
References: <20210908103711.683940-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Traditionally we have required that newly added QMP commands will model
any returned data using fine grained QAPI types. This is good for
commands that are intended to be consumed by machines, where clear data
representation is very important. Commands that don't satisfy this have
generally been added to HMP only.

In effect the decision of whether to add a new command to QMP vs HMP has
been used as a proxy for the decision of whether the cost of designing a
fine grained QAPI type is justified by the potential benefits.

As a result the commands present in QMP and HMP are non-overlapping
sets, although HMP comamnds can be accessed indirectly via the QMP
command 'human-monitor-command'.

One of the downsides of 'human-monitor-command' is that the QEMU monitor
APIs remain tied into various internal parts of the QEMU code. For
example any exclusively HMP command will need to use 'monitor_printf'
to get data out. It would be desirable to be able to fully isolate the
monitor implementation from QEMU internals, however, this is only
possible if all commands are exclusively based on QAPI with direct
QMP exposure.

The way to achieve this desired end goal is to finese the requirements
for QMP command design. For cases where the output of a command is only
intended for human consumption, it is reasonable to want to simplify
the implementation by returning a plain string containing formatted
data instead of designing a fine grained QAPI data type. This can be
permitted if-and-only-if the command is exposed under the 'x-' name
prefix. This indicates that the command data format is liable to
future change and that it is not following QAPI design best practice.

The poster child example for this would be the 'info registers' HMP
command which returns printf formatted data representing CPU state.
This information varies enourmously across target architectures and
changes relatively frequently as new CPU features are implemented.
It is there as debugging data for human operators, and any machine
usage would treat it as an opaque blob. It is thus reasonable to
expose this in QMP as 'x-query-registers' returning a 'str' field.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/devel/writing-qmp-commands.rst | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/docs/devel/writing-qmp-commands.rst b/docs/devel/writing-qmp-commands.rst
index 6a10a06c48..d032daa62d 100644
--- a/docs/devel/writing-qmp-commands.rst
+++ b/docs/devel/writing-qmp-commands.rst
@@ -350,6 +350,31 @@ In this section we will focus on user defined types. Please, check the QAPI
 documentation for information about the other types.
 
 
+Modelling data in QAPI
+~~~~~~~~~~~~~~~~~~~~~~
+
+For a QMP command that to be considered stable and supported long term there
+is a requirement returned data should be explicitly modelled using fine grained
+QAPI types. As a general guide, a caller of the QMP command should never need
+to parse individual returned data fields. If a field appears to need parsing,
+them it should be split into separate fields corresponding to each distinct
+data item. This should be the common case for any new QMP command that is
+intended to be used by machines, as opposed to exclusively human operators.
+
+Some QMP commands, however, are only intended as adhoc debugging aids for human
+operators. While they may return large amounts of formatted data, it is not
+expected that machines will need to parse the result. The overhead of defining
+a fine grained QAPI type for the data may not be justified by the potential
+benefit. In such cases, it is permitted to have a command return a simple string
+that contains formatted data, however, it is mandatory for the command to use
+the 'x-' name prefix. This indicates that the command is not guaranteed to be
+long term stable / liable to change in future and is not following QAPI design
+best practices. An example where this approach is taken is the QMP command
+"x-query-registers". This returns a printf formatted dump of the architecture
+specific CPU state. The way the data is formatted varies across QEMU targets,
+is liable to change over time, and is only intended to be consumed as an opaque
+string by machines.
+
 User Defined Types
 ~~~~~~~~~~~~~~~~~~
 
-- 
2.31.1


