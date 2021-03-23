Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0793346B7B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 22:59:03 +0100 (CET)
Received: from localhost ([::1]:52732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOp3G-00016C-NQ
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 17:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1O-0006tl-6G
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1M-0002kK-8S
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616536623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZplKmfyzLpn9U8O9j5k7/v/RAV5MmSxFp9+gn1KfJ5Q=;
 b=GOi2sbjQa5duVQ6v9G1s6IVujCqaa+oRfaE721aG3dMsp42zAdBMafNk/QUYzyNoc21Sid
 9YOawCg5Mi98r7ZZz+dQh9WnNXbz/hl3+UJJ/vKWeoWCumOWGOUK8fRKKfeVWgf1iLObhh
 UMG19oQw04i7h70w31+7RSib7FN172I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-di5uxwdjPLGbMsqIkn8vpw-1; Tue, 23 Mar 2021 17:57:01 -0400
X-MC-Unique: di5uxwdjPLGbMsqIkn8vpw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 223261B2C983;
 Tue, 23 Mar 2021 21:57:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6DBC5D6D7;
 Tue, 23 Mar 2021 21:56:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7F6D711327F9; Tue, 23 Mar 2021 22:56:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/29] qapi/pragma: Tidy up after removal of deprecated commands
Date: Tue, 23 Mar 2021 22:56:30 +0100
Message-Id: <20210323215658.3840228-2-armbru@redhat.com>
In-Reply-To: <20210323215658.3840228-1-armbru@redhat.com>
References: <20210323215658.3840228-1-armbru@redhat.com>
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit cbde7be900 "migrate: remove QMP/HMP commands for speed,
downtime and cache size" neglected to remove query-migrate-cache-size
from pragma returns-whitelist.

Commit 8af54b9172 "machine: remove 'query-cpus' QMP command" neglected
to remove CpuInfo & friends from pragma name-case-exceptions.

Remove these now.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210323094025.3569441-2-armbru@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
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


