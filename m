Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 905D24046DE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 10:16:30 +0200 (CEST)
Received: from localhost ([::1]:48368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOFEV-0002sX-Ck
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 04:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mOFAj-0000aT-S7
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 04:12:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mOFAd-0008W2-On
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 04:12:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631175149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NL9nDRHj7SgMnv58yLwvDab0QXxqaKeIun0Nst8QU/o=;
 b=C0B7I1kPV1FK4T0bpebdALIxo3vWPenUDyIsa3df2dH50iPYRI1q9fx2k+TLdxsbDum32L
 b+mCkwfaO54YuvhvVf4vXcut+TSSZQOvD5M8jPd7+XUq8MdUZz6pZ3PkFUnEXQreyrvzAX
 ++bt6rB8pn2MLq5gpLfC4uWrfGrtKLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-POAUyDRdOY-2VYc4JVtB-A-1; Thu, 09 Sep 2021 04:12:26 -0400
X-MC-Unique: POAUyDRdOY-2VYc4JVtB-A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68E2B80196C
 for <qemu-devel@nongnu.org>; Thu,  9 Sep 2021 08:12:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 491936B550;
 Thu,  9 Sep 2021 08:12:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BAACD1138606; Thu,  9 Sep 2021 10:12:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hmp: Unbreak "change vnc", tidy up set_password's doc
Date: Thu,  9 Sep 2021 10:12:17 +0200
Message-Id: <20210909081219.308065-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: pbonzini@redhat.com, dgilbert@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If you'd rather delete "change vnc", go ahead and post a patch.

Markus Armbruster (2):
  hmp: Unbreak "change vnc"
  hmp: Drop a bogus sentence from set_password's documentation

 monitor/hmp-cmds.c |  2 +-
 hmp-commands.hx    | 11 +++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

-- 
2.31.1


