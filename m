Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 689FE345B2A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 10:43:56 +0100 (CET)
Received: from localhost ([::1]:59798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOdZr-0006Ni-D7
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 05:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdWe-0001HW-Qt
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:40:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdWc-0001xS-8M
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616492433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ufP+riIcs1/6sOtRhigTZV2ZHOxdUP+Kz4AuFTen3As=;
 b=PtImxDXmg8ZOVW5WQAI52V96/24MH3laFH/TMgcj10Bqy593KySWXgNyVyfOq00TbXOVoM
 10G+YwFWwQxE+O6dPweFMU7yWHzbhzJ1UK/IYYrQDiQ2dcUUkRWZx1JMaZuVrqwGeLO31h
 HTifjn7o1EZh7o2LFfzEesi285ntbOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-McvdSbzcP86ynAN7WNs9cw-1; Tue, 23 Mar 2021 05:40:31 -0400
X-MC-Unique: McvdSbzcP86ynAN7WNs9cw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82FCD1007477;
 Tue, 23 Mar 2021 09:40:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 240CD5C1A3;
 Tue, 23 Mar 2021 09:40:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AA48911327F9; Tue, 23 Mar 2021 10:40:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/28] qapi/pragma: Tidy up after removal of deprecated
 commands
Date: Tue, 23 Mar 2021 10:39:58 +0100
Message-Id: <20210323094025.3569441-2-armbru@redhat.com>
In-Reply-To: <20210323094025.3569441-1-armbru@redhat.com>
References: <20210323094025.3569441-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: jsnow@redhat.com, michael.roth@amd.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit cbde7be900 "migrate: remove QMP/HMP commands for speed,
downtime and cache size" neglected to remove query-migrate-cache-size
from pragma returns-whitelist.

Commit 8af54b9172 "machine: remove 'query-cpus' QMP command" neglected
to remove CpuInfo & friends from pragma name-case-exceptions.

Remove these now.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/pragma.json | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/qapi/pragma.json b/qapi/pragma.json
index cffae27666..7f158e183d 100644
--- a/qapi/pragma.json
+++ b/qapi/pragma.json
@@ -7,18 +7,14 @@
     'returns-whitelist': [
         'human-monitor-command',
         'qom-get',
-        'query-migrate-cache-size',
         'query-tpm-models',
         'query-tpm-types',
         'ringbuf-read' ],
     'name-case-whitelist': [
         'ACPISlotType',             # DIMM, visible through query-acpi-ospm-status
-        'CpuInfoMIPS',              # PC, visible through query-cpu
-        'CpuInfoTricore',           # PC, visible through query-cpu
         'BlockdevVmdkSubformat',    # all members, to match VMDK spec spellings
         'BlockdevVmdkAdapterType',  # legacyESX, to match VMDK spec spellings
         'QapiErrorClass',           # all members, visible through errors
         'UuidInfo',                 # UUID, visible through query-uuid
-        'X86CPURegister32',         # all members, visible indirectly through qom-get
-        'CpuInfo'                   # CPU, visible through query-cpu
+        'X86CPURegister32'          # all members, visible indirectly through qom-get
     ] } }
-- 
2.26.3


