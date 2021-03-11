Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A19337AEF
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 18:36:01 +0100 (CET)
Received: from localhost ([::1]:38252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKPE7-0003VG-VP
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 12:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKP3h-0003Xx-4s
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:25:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKP3X-0002Cj-QO
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:25:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615483502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=42ScKwPSItcdoTGI8C2tcmInaP1nIuoe98XHW7QnOvc=;
 b=ep/h6bH+PEHa5F6ESnocXodQEH4/1uXs9hbTotshJcWyb0F0kYOhWLklDRAoNKZZU9IqgF
 uQCyvJ9QDCJDyK5ivdlF8yTqp7SBJdxc+JDO6JecEHrtFD2MOI5/FtFUkqNo/1cVhcqtby
 9xq24e1x+bT9IW80zIQMPJdVFZhGZyU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-ZjzoqbbxNmi6u4jmuJ2xEw-1; Thu, 11 Mar 2021 12:25:01 -0500
X-MC-Unique: ZjzoqbbxNmi6u4jmuJ2xEw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E17F107ACCA
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 17:25:00 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF3B660C03;
 Thu, 11 Mar 2021 17:24:59 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] vl: QAPIfy -object
Date: Thu, 11 Mar 2021 12:24:56 -0500
Message-Id: <20210311172459.990281-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a replacement for -object QAPIfication that keeps QemuOpts
in order to not break some of the CLI parsing extensions that OptsVisitor
includes.  Since keyval is not used, support for directly passing
JSON syntax to the option must be added manually, which is what patch
3 does.  However, both the QemuOpts and the JSON paths go through
the new ObjectOptions interface, just with two different visitors,
so we can reuse all the new type-safe code that Kevin has added.

Patch 1 is a patch that I already had lying around, which I included
to be able to remove user_creatable_add_opts completely in patch 2.

Paolo

Based-on: <20210311144811.313451-1-kwolf@redhat.com>

Paolo Bonzini (3):
  tests: convert check-qom-proplist to keyval
  qom: move user_creatable_add_opts logic to vl.c and QAPIfy it
  vl: allow passing JSON to -object

 include/qom/object_interfaces.h | 50 ++------------------
 qom/object_interfaces.c         | 57 +----------------------
 softmmu/vl.c                    | 82 +++++++++++++++++++++++++--------
 tests/check-qom-proplist.c      | 74 ++++++++++++++++++++---------
 4 files changed, 121 insertions(+), 142 deletions(-)

-- 
2.26.2


