Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6DA4FF7C2
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 15:38:03 +0200 (CEST)
Received: from localhost ([::1]:57774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nedC5-0006P5-ME
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 09:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1nedAc-0005iP-Kr
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 09:36:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1nedAZ-0002ld-6G
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 09:36:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649856985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EhyWe/cai3Ei0JTtT0j3378X3H+cKoa5Jq1NmD8GUUM=;
 b=RmCFDYAChgdj+67HURH4I5TiJZh0yMu0dHkuuDY1s6iVzO5zQY7a694u3AQXLqHn3r2Zb/
 +DA+MfGEFuaqhoq56y9sphpvv9AG5hjID02JdLVWXmSZLwwrqG/Xa6L1XF5Us86C0W2J4z
 esP/AMzcdgKf8jxYT6U3AbOCSpPbN2I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-AdPL8sEdO0yq8d7oHkQ7wg-1; Wed, 13 Apr 2022 09:36:24 -0400
X-MC-Unique: AdPL8sEdO0yq8d7oHkQ7wg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B69171014A63;
 Wed, 13 Apr 2022 13:36:23 +0000 (UTC)
Received: from [10.22.8.161] (unknown [10.22.8.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B53FC28109;
 Wed, 13 Apr 2022 13:36:23 +0000 (UTC)
Message-ID: <a713533d-c4c5-2237-58d0-57b812a56ba4@redhat.com>
Date: Wed, 13 Apr 2022 09:36:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
From: Cole Robinson <crobinso@redhat.com>
Subject: adding 'official' way to dump SEV VMSA
To: "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Singh, Brijesh" <brijesh.singh@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

SEV-ES and SEV-SNP attestation require a copy of the initial VMSA to
validate the launch measurement. For developers dipping their toe into
SEV-* work, the easiest way to get sample VMSA data for their machine is
to grab it from a running VM.

There's two techniques I've seen for that: patch some printing into
kernel __sev_launch_update_vmsa, or use systemtap like danpb's script
here: https://gitlab.com/berrange/libvirt/-/blob/lgtm/scripts/sev-vmsa.stp

Seems like this could be friendlier though. I'd like to work on this if
others agree.

Some ideas I've seen mentioned in passing:

- debugfs entry in /sys/kernel/debug/kvm/.../vcpuX/
- new KVM ioctl
- something with tracepoints
- some kind of dump in dmesg that doesn't require a patch

Thoughts?

Thanks,
Cole


