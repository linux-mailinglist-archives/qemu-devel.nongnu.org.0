Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F473446477
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 14:53:36 +0100 (CET)
Received: from localhost ([::1]:47798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mizew-0000D0-D4
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 09:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mizWs-0007Qq-Az
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 09:45:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mizWj-0001wO-Le
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 09:45:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636119904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=bGLin5by3NvoUnlNC3yyM/b0blRIn2+qS7Vyr/etTE0=;
 b=StSFYOKn97PSchZUrmymq1wvaWbFErjl5WrxuKtAleDlhxSUOveW1zOvgYzfC/QfmyIQ8f
 Zs1hQNcr3ZFqQ0BmcqWWZQN2b7K3fcsxqBPAc12Jc5RrXM1j4y5mUlXQmuACh8DqigcPRm
 cXdew9Rsi9N4VkIEC1cFF9H0mpoDWbs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-29R0QkAOPYm_N7Nj8TvAJg-1; Fri, 05 Nov 2021 09:45:03 -0400
X-MC-Unique: 29R0QkAOPYm_N7Nj8TvAJg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 548D456FAA
 for <qemu-devel@nongnu.org>; Fri,  5 Nov 2021 13:45:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 236FC5D9D3;
 Fri,  5 Nov 2021 13:45:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9C20811380A7; Fri,  5 Nov 2021 14:45:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Artificially target-dependend compiles
Date: Fri, 05 Nov 2021 14:45:00 +0100
Message-ID: <87czneyaw3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some .c need to be compiled per target.  build-system.rst calls these
target-dependent.

Consider hw/acpi/vmgenid.c.  hw/acpi/meson.build has

    acpi_ss.add(when: 'CONFIG_ACPI_VMGENID', if_true: files('vmgenid.c'))

and

    softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)

softmmu_ss is target-independent, and so is hw/acpi/vmgenid.c.

The C macro CONFIG_ACPI_VMGENID is actually target-dependent;
config-poison.h has

    #pragma GCC poison CONFIG_ACPI_VMGENID

This feels odd until you think about it some.  Meson's
CONFIG_ACPI_VMGENID means "we need to compile hw/acpi/vmgenid.c (because
at least one target we're building needs it)".  We have no use for a C
macro with this meaning.  We sometimes want "*this* target needs it".
That's C macro CONFIG_ACPI_VMGENID.  It's unused, as far as I can tell.
Similar C macros exist that are used.


QMP command query-vm-generation-id exists regardless of either
CONFIG_ACPI_VMGENID.  For targets with CONFIG_ACPI_VMGENID, we link the
real handler from hw/acpi/vmgenid.c.  For other targets, we link the
stub from stubs/vmgenid.c, which always fails.

This works, but it's not introspectable.  To make it introspectable,
we'd have to make the command conditional.  Naive attempt:

    diff --git a/qapi/machine.json b/qapi/machine.json
    index 17794ef681..e554cac53d 100644
    --- a/qapi/machine.json
    +++ b/qapi/machine.json
    @@ -264,7 +264,8 @@
     #
     # Since: 2.9
     ##
    -{ 'struct': 'GuidInfo', 'data': {'guid': 'str'} }
    +{ 'struct': 'GuidInfo', 'data': {'guid': 'str'},
    +  'if': 'CONFIG_ACPI_VMGENID' }

     ##
     # @query-vm-generation-id:
    @@ -273,7 +274,8 @@
     #
     # Since: 2.9
     ##
    -{ 'command': 'query-vm-generation-id', 'returns': 'GuidInfo' }
    +{ 'command': 'query-vm-generation-id', 'returns': 'GuidInfo',
    +  'if': 'CONFIG_ACPI_VMGENID' }

     ##
     # @system_reset:

No go, because CONFIG_ACPI_VMGENID can only be used in target-dependent
code.

Moving these definitions to machine-target.json moves the generated C
from qapi/qapi-*-machine.[ch] to qapi/qapi-*-machine-target.[ch], where
CONFIG_ACPI_VMGENID is okay.  It also makes qmp_query_vm_generation_id()
target-dependent: it needs qapi/qapi-commands-machine-target.h.

The target-dependence is completely artificial: compiling
hw/acpi/vmgenid.c just once is as fine as it ever was.

You might challenge the utility of making this one introspectable.  I'm
not going to debate; it's just a random example.  The problem exists
unless you can demonstrate that introspection is useless for *all*
commands with similar target-dependent stubbery.


Have you seen similar artificial target-dependence elsewhere?

Any smart ideas on avoiding it?


