Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAF143B56D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:22:04 +0200 (CEST)
Received: from localhost ([::1]:38014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfOH5-000723-Oj
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mfO6a-0001NP-40
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:11:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mfO6V-0004DW-IU
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:11:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635261065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=efmC0iabVdGP6DYqFeqJHJTFiGBWq12ZJql3cELBfVw=;
 b=C4JoKWxUJkblhbF9JU/eBzpYYtikdwT5XYDgXRyd9Tsfk1eH7Go3IdkZwaBTTWyg0iH7Oc
 8hcNJoRWUzkA4cG2UyxBVBhRdOG34X8G254qgTsqav/SnW9ZdxBSm0LL3DfelfSHHtdI8y
 pGuo9ufHj0TUoTPzZjpx5V2Eo1qQtwQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-Agm69IODN_qJNw71ORYjVQ-1; Tue, 26 Oct 2021 11:11:03 -0400
X-MC-Unique: Agm69IODN_qJNw71ORYjVQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 126118735C2;
 Tue, 26 Oct 2021 15:11:02 +0000 (UTC)
Received: from localhost (unknown [10.22.17.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76A5919D9D;
 Tue, 26 Oct 2021 15:11:01 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] pc: Support configuration of SMBIOS entry point type
Date: Tue, 26 Oct 2021 11:10:57 -0400
Message-Id: <20211026151100.1691925-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This includes code previously submitted[1] by Daniel P. Berrangé
to add a "smbios-ep" machine property on PC.

SMBIOS 3.0 is necessary to support more than ~720 VCPUs, as a
large number of VCPUs can easily hit the table size limit of
SMBIOS 2.1 entry points.

Changes from v2:
* Renamed option to "smbios-entry-point-type" for clarity
* Renamed option values to "32" and "64", for two reasons:
  * The option is not about reporting an exact SMBIOS
    version, but just the entry point format.
    FWIW, the SMBIOS specification uses the phrases "32-bit entry
    point" and "64-bit entry point" more often than "2.1 entry
    point" and "3.0 entry point".
  * QAPI doesn't allow us to use enum member names with dots
    or underscores

[1] https://lore.kernel.org/qemu-devel/20200908165438.1008942-5-berrange@redhat.com
    https://lore.kernel.org/qemu-devel/20200908165438.1008942-6-berrange@redhat.com

Eduardo Habkost (3):
  smbios: Rename SMBIOS_ENTRY_POINT_* enums
  hw/smbios: Use qapi for SmbiosEntryPointType
  hw/i386: expose a "smbios-entry-point-type" PC machine property

 include/hw/firmware/smbios.h | 10 ++--------
 include/hw/i386/pc.h         |  4 ++++
 hw/arm/virt.c                |  2 +-
 hw/i386/pc.c                 | 26 ++++++++++++++++++++++++++
 hw/i386/pc_piix.c            |  2 +-
 hw/i386/pc_q35.c             |  2 +-
 hw/smbios/smbios.c           |  8 ++++----
 qapi/machine.json            | 12 ++++++++++++
 8 files changed, 51 insertions(+), 15 deletions(-)

-- 
2.32.0


