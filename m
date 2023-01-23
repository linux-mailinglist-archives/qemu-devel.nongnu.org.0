Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 001BF67767B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 09:40:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJsNB-0000sb-Jg; Mon, 23 Jan 2023 03:40:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pJsN7-0000rN-H6
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:40:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pJsN5-0007zr-GQ
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:40:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674463206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bwustFUS19jSEdDbNwXPFhat5B2LjiXo2NUYCdImpME=;
 b=N47E2MLpRJm6NPPu1EZAuW5H2C2EkSiy7NN/8J62/v/tn2yXakXncSX7D/u4BoQ46gjJKq
 es6d50dy6d44B7SBKSLkhjG05z1tdODrIIEq8kzJa1Quh6zoAYxUc+1rzCpLYoS+NRTIt9
 B6HNIDpy1Dy5JIWscsg4pJfOFu33fUE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-mwgrrZe9OMeL86rmMgaskg-1; Mon, 23 Jan 2023 03:40:01 -0500
X-MC-Unique: mwgrrZe9OMeL86rmMgaskg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7DA6801779;
 Mon, 23 Jan 2023 08:40:00 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E87EF175A2;
 Mon, 23 Jan 2023 08:39:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: [PATCH v2 0/2] audio: make audiodev introspectable by management apps
Date: Mon, 23 Jan 2023 09:39:55 +0100
Message-Id: <20230123083957.20349-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

Here's a respin from Daniel's audiodev introspection patches from
2021. I've rebased them to the current master branch and addressed
the review comments from v1.

The Audiodev QAPI type is not introspectable via query-qmp-schema as
nothing in QMP uses it. "-audiodev" is not introspectable via
query-command-line-options because it avoided legacy QemuOpts.

To fix it, introduce a tiny "query-audiodev" QMP command that uses
the "Audiodev" QAPI structure, so that it shows up in the schema.
Then mark the various backend types with conditionals so that only
the ones that were available at compile time show up in the schema.

Daniel P. Berrangé (2):
  qapi, audio: add query-audiodev command
  qapi, audio: Make introspection reflect build configuration more
    closely

 qapi/audio.json        | 57 +++++++++++++++++++++++++++++++++---------
 audio/audio_template.h | 20 +++++++++++++++
 audio/audio.c          | 32 ++++++++++++++++++++++++
 audio/audio_legacy.c   | 41 +++++++++++++++++++++++++++++-
 4 files changed, 137 insertions(+), 13 deletions(-)

-- 
2.31.1


