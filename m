Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8189E48DC46
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 17:57:18 +0100 (CET)
Received: from localhost ([::1]:57218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n83PZ-0002HN-Bl
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 11:57:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n83O5-0000nC-5j
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:55:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n83Nz-0004iY-QB
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:55:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642092936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DLKgS2HQAXmRBSUoyqDEUVOx2FkAJ944dXrJOarSakU=;
 b=i9V3eMeY8KCljx3fq6xHsEne8yhQzMWlpOwq1m99GsUfT7HDizV3E9umLpfupXyEM2XSNc
 KP4W+VfGVFwLsmlxQSWvYxKdhq8D2wUux4QvosV8qd2Uixctqz/tC6tCZuZNv+/eB7pIGH
 lQt2CAXqPH7nxx6InjgsiXYTJDfH+CI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-G-iLln4mNuuT-g4m1AM_PA-1; Thu, 13 Jan 2022 11:55:33 -0500
X-MC-Unique: G-iLln4mNuuT-g4m1AM_PA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E21664083;
 Thu, 13 Jan 2022 16:55:32 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.37.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEE197DE3E;
 Thu, 13 Jan 2022 16:55:13 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Improved support for AMD SEV firmware loading
Date: Thu, 13 Jan 2022 16:55:09 +0000
Message-Id: <20220113165511.46098-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AMD SEV build of EDK2 only emits a single file, intended to be=0D
mapped readonly. There is explicitly no separate writable VARS=0D
store for persisting non-volatile firmware variables.=0D
=0D
This can be used with QEMU's traditional pflash configuration=0D
mechanism by only populating pflash0, leaving pflash1 unconfigured.=0D
Conceptually, however, it is odd to be using pflash at all when we=0D
have no intention of supporting any writable variables. The -bios=0D
option should be sufficient for any firmware that is exclusively=0D
readonly code.=0D
=0D
=0D
A second issue is that the firmware descriptor schema does not allow=0D
for describing a firmware that uses pflash, without any associated=0D
non-volatile storage.=0D
=0D
In docs/interop/firmware.json=0D
=0D
 'struct' : 'FirmwareMappingFlash',=0D
  'data'   : { 'executable'     : 'FirmwareFlashFile',=0D
               'nvram-template' : 'FirmwareFlashFile' } }=0D
=0D
Notice that nvram-template is mandatory, and when consuming these=0D
files libvirt will thus complain if the nvram-template field is=0D
missing.=0D
=0D
We could in theory make nvram-template optional in the schema and=0D
then update libvirt to take account of it, but this feels dubious=0D
when we have a perfectly good way of describing a firmware without=0D
NVRAM, using 'FirmwareMappingMemory' which is intended to be used=0D
with QEMU's -bios option.=0D
=0D
=0D
A third issue is in libvirt, where again the code handling the=0D
configuration of pflash supports two scenarios=0D
=0D
 - A single pflash image, which is writable=0D
 - A pair of pflash images, one writable one readonly=0D
=0D
There is no support for a single read-only pflash image in libvirt=0D
today.=0D
=0D
=0D
This all points towards the fact that we should be using -bios=0D
to load the AMD SEV firmware build of EDK.=0D
=0D
The only thing preventing us doing that is that QEMU does not=0D
initialize the SEV firmware when using -bios. That is fairly=0D
easily solved, as done in this patch series.=0D
=0D
For testing I've launched QEMU in in these scenarios=0D
=0D
  - SEV guest using -bios and boot from HD=0D
  - SEV guest using pflash and boot from HD=0D
  - SEV-ES guest using -bios and direct kernel boot=0D
  - SEV-ES guest using pflash and direct kernel boot=0D
=0D
In all these cases I was able to validate the reported SEV=0D
guest measurement.=0D
=0D
Daniel P. Berrang=C3=A9 (2):=0D
  hw/i386: refactor logic for setting up SEV firmware=0D
  hw/i386: support loading OVMF using -bios too=0D
=0D
 hw/i386/pc_sysfw.c            | 24 +++---------------------=0D
 hw/i386/pc_sysfw_ovmf-stubs.c | 10 ++++++++++=0D
 hw/i386/pc_sysfw_ovmf.c       | 27 +++++++++++++++++++++++++++=0D
 hw/i386/x86.c                 |  5 +++++=0D
 include/hw/i386/pc.h          |  1 +=0D
 5 files changed, 46 insertions(+), 21 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


