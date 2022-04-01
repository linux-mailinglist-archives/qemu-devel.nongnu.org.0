Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E410D4EFCD7
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 00:42:58 +0200 (CEST)
Received: from localhost ([::1]:48382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naPyr-00045c-NX
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 18:42:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1naPxF-0001vV-L7
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 18:41:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1naPxB-0005PJ-Ri
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 18:41:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648852871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dGW1zHac7SzEaXvmCmdzrOOi5GCA57CKM+jxDmeyKF4=;
 b=Rxisxt/HNnmJa0TCYNK7b/tDls5houtrrTblHvwYJNlATkUuBt6ZfHYg5sUK9GGxmtDHw6
 aFlJAGpLMa8mVjjQUjanU7CQBGJXJ36DKCN7gxYJBJMe1G2FfI092PcPS3D3U0w5psz3z/
 r5woU5Cdl/FKOYROvCtsrgs3e0IliQQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-L3dpmwp_OamQrsK0l6R77A-1; Fri, 01 Apr 2022 18:41:08 -0400
X-MC-Unique: L3dpmwp_OamQrsK0l6R77A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53EC880159B
 for <qemu-devel@nongnu.org>; Fri,  1 Apr 2022 22:41:07 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.193.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E5BF9D70;
 Fri,  1 Apr 2022 22:41:05 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
Date: Sat,  2 Apr 2022 00:40:56 +0200
Message-Id: <20220401224104.145961-1-victortoso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=victortoso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Happy 1st April. Not a joke :) /* ugh, took me too long to send */

This series is about adding a generator in scripts/qapi to produce
Go data structures that can be used to communicate with QEMU over
QMP.


* Why Go?

There are quite a few Go projects that interact with QEMU over QMP
and they endup using a mix of different libraries with their own
code.


** Which projects?

The ones I've found so far:

- podman machine
  https://github.com/containers/podman/tree/main/pkg/machine/qemu

- kata-containers (govmm)
  https://github.com/kata-containers/kata-containers/tree/main/src/runtime/pkg/govmm

- lxd
  https://github.com/lxc/lxd/tree/master/lxd/instance/drivers

- kubevirt (plain json strings)
  https://github.com/kubevirt/kubevirt

(let me know if you know others)


* But Why?

I'm particularly interested in 3 out of 4 of the projects above and
only Kubevirt uses libvirt to handle QEMU. That means that every
QEMU releases where a QMP command, event or other data struct is
added, removed or changed, those projects need to check what changed
in QEMU and then address those changes in their projects, if needed.

The idea behind generating Go data structures is that we can keep a
Go module which can have releases that follow QEMU releases.

The project that uses this Go module, only need to bump the module
version and it shall receive all the changes in their own vendored
code base.


* Status

There are a few rough edges to work on but this is usable. The major
thing I forgot to add is handling Error from Commands. It'll be the
first thing I'll work on next week.

If you want to start using this Today you can fetch it in at

    https://gitlab.com/victortoso/qapi-go/

There are quite a few tests that I took from the examples in the
qapi schema. Coverage using go's cover tool is giving `28.6% of
statements`

I've uploaded the a static generated godoc output of the above Go
module here:

    https://fedorapeople.org/~victortoso/qapi-go/rfc/victortoso.com/qapi-go/pkg/qapi/


* License

While the generator (golang.py in this series) is GPL v2, the
generated code needs to be compatible with other Golang projects,
such as the ones mentioned above. My intention is to keep a Go
module with a MIT license.


* Disclaimer to reviewers

This is my first serious python project so there'll be lots of
suggetions that I'll be happy to take and learn from.


Thanks for taking a look, let me know if you have questions, ideas
or suggestions.

Cheers,
Victor

Victor Toso (8):
  qapi: golang: Generate qapi's enum types in Go
  qapi: golang: Generate qapi's alternate types in Go
  qapi: golang: Generate qapi's struct types in Go
  qapi: golang: Generate qapi's union types in Go
  qapi: golang: Generate qapi's event types in Go
  qapi: golang: Generate qapi's command types in Go
  qapi: golang: Add CommandResult type to Go
  qapi: golang: document skip function visit_array_types

 qapi/meson.build       |   1 +
 scripts/qapi/golang.py | 727 +++++++++++++++++++++++++++++++++++++++++
 scripts/qapi/main.py   |   2 +
 3 files changed, 730 insertions(+)
 create mode 100644 scripts/qapi/golang.py

-- 
2.35.1


