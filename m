Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB0B1D46AF
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 09:07:30 +0200 (CEST)
Received: from localhost ([::1]:39774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZURN-000615-6E
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 03:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jZUQO-0005NB-NF
 for qemu-devel@nongnu.org; Fri, 15 May 2020 03:06:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39822
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jZUQN-0005U9-Uc
 for qemu-devel@nongnu.org; Fri, 15 May 2020 03:06:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589526386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=DL+w9M/PZdV6Hp7z4KZavuMsvQ+aem7rvdUsMH+cSe8=;
 b=jEU6n5iJmkFyzeDkagBOiE3d5hTVBxjcxTx09yRjNOvFpGNPm0IuVleCb3FGYArD0rQR3Y
 XiFhdQZq6d92EXXSQNBbd1wdS24alKxyubPERywgmG5m6/Rz92o7UO8g7Kj9tso5gZJTRV
 DSbWrGPr1jdzQY/TOg1ASWpqpqw1mnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-kBsMt_hmOqOaskqwpUXnEg-1; Fri, 15 May 2020 03:06:25 -0400
X-MC-Unique: kBsMt_hmOqOaskqwpUXnEg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C96A835B42
 for <qemu-devel@nongnu.org>; Fri, 15 May 2020 07:06:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DF522B4DC;
 Fri, 15 May 2020 07:06:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0BC1011358BC; Fri, 15 May 2020 09:06:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Onboard audio devices and -audiodev none
Date: Fri, 15 May 2020 09:06:20 +0200
Message-ID: <87pnb5r82b.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 22:56:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Watch this:

    $ aarch64-softmmu/qemu-system-aarch64 -S -nodefaults -accel qtest -display none -M vexpress-a15 -audiodev none,id=foo
    audio: Device lm4549: audiodev default parameter is deprecated, please specify audiodev=foo

I did, didn't I?

Also: use warn_report()?


