Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E8568DC67
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 16:03:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPPUh-0004n8-Ie; Tue, 07 Feb 2023 10:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pPPUJ-0004j9-Ru
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:02:49 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pPPUI-0006NA-Ab
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:02:27 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0374A37A11;
 Tue,  7 Feb 2023 15:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675782145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jdDltlHBkTXwBxznUxaOUuTmRjtUqOCpR7Jz7xH060Y=;
 b=kQ3U1qX9tDId+RAkS5jaseq4izMpGdG2ugzBUOF97d8DbX6plNdC6vg36GtSm1wqpahzP0
 dSpxykWpCNiv9GnmiMZJDSHQgZnNhcaFatAFNbVfjtprH0a5So8abFkuLt0zOeI5LooCCw
 03pTFs2fn+TLYD3M44cAJdZhz0fXXkk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675782145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jdDltlHBkTXwBxznUxaOUuTmRjtUqOCpR7Jz7xH060Y=;
 b=zUQCF3CoRwHI4JJ0KCfNa++je0feDnai3w5E0scndPsUlO1R3NlF2nKi9AP0Q6TudkkY+u
 NUEKxu88LTD0dFDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 85DA013467;
 Tue,  7 Feb 2023 15:02:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hQr9EwBo4mMXHwAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 07 Feb 2023 15:02:24 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 03/12] tests/qtest: Add dependence on PCIE_ROOT for
 virtio-net-failover.c
In-Reply-To: <3392caa9-cb6f-572e-b9a2-8728d207acf2@redhat.com>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-4-farosas@suse.de>
 <3392caa9-cb6f-572e-b9a2-8728d207acf2@redhat.com>
Date: Tue, 07 Feb 2023 12:02:22 -0300
Message-ID: <87y1p9msch.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Thomas Huth <thuth@redhat.com> writes:

> On 06/02/2023 16.04, Fabiano Rosas wrote:
>> This test depends on the presence of the pcie-root-port device. Add a
>> build time dependency and a runtime check.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>   tests/qtest/meson.build           | 3 ++-
>>   tests/qtest/virtio-net-failover.c | 5 +++++
>>   2 files changed, 7 insertions(+), 1 deletion(-)
>> 
>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>> index e97616d327..431b623df9 100644
>> --- a/tests/qtest/meson.build
>> +++ b/tests/qtest/meson.build
>> @@ -73,7 +73,8 @@ qtests_i386 = \
>>     (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
>>     (config_host.has_key('CONFIG_POSIX') and                                                  \
>>      config_all_devices.has_key('CONFIG_ACPI_ERST') ? ['erst-test'] : []) +                   \
>> -  (config_all_devices.has_key('CONFIG_VIRTIO_NET') and                                      \
>> +  (config_all_devices.has_key('CONFIG_PCIE_ROOT') and                                       \
>
> CONFIG_PCIE_ROOT looks wrong ... hw/pci-bridge/meson.build uses 
> CONFIG_PCIE_PORT instead, so I assume this is a typo?
>
> Also, do we really need a run-time check if we already have a build-time check?

I guess not. It seems it was the typo that made it necessary. I'll fix
it.

