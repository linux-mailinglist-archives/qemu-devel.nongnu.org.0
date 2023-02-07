Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2831868DF28
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 18:42:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPRyG-0007cL-Es; Tue, 07 Feb 2023 12:41:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pPRyE-0007cA-FR
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:41:30 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pPRyC-00058u-VJ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:41:30 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 560DF33715;
 Tue,  7 Feb 2023 17:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675791687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LpByPTC6k8es1dclaWHVlMgVpMRxuZXJt6XgsWshplM=;
 b=1CVQaDY6zhx6lX7vxJY3saMaGFYgHXBhVMah0dUG0dBAuNa4eHO30oqEi4gWnjZBqesib3
 b3b9U6XOzGQ8+nHYSVAexPiN7CCeAGkze7vQLBKhvv1q97Kp098RPC2MTlSYCrbYwWMUit
 Hf1Hxgqd8trKF/ydMT2g1+AIUwXJAVY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675791687;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LpByPTC6k8es1dclaWHVlMgVpMRxuZXJt6XgsWshplM=;
 b=qPlK1j6lbaDFLDMF0UqVhVGmAQHMB0eOE2ZTmgYvFH2M+/KDDUO2U8DI6zwGTLsjkw+TAd
 kHrJPQG48SwhwjDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D8E8413467;
 Tue,  7 Feb 2023 17:41:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id c/FaKEaN4mNdYAAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 07 Feb 2023 17:41:26 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>
Subject: Re: [PATCH 03/10] hw/i386: Select VGA_PCI in Kconfig
In-Reply-To: <6a2ded82-8bbf-8fd5-4704-071c6bdbf3eb@redhat.com>
References: <20230206140809.26028-1-farosas@suse.de>
 <20230206140809.26028-4-farosas@suse.de>
 <6a2ded82-8bbf-8fd5-4704-071c6bdbf3eb@redhat.com>
Date: Tue, 07 Feb 2023 14:41:24 -0300
Message-ID: <87sffhmkzf.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
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

> On 06/02/2023 15.08, Fabiano Rosas wrote:
>> Machines that have "std" as default VGA display need to always build
>> vga-pci.c, otherwise we get a crash when CONFIG_PCI_DEVICES=n:
>> 
>> $ ./qemu-system-x86_64 -M q35 -vga std
>
> I'd remove the "-vga std" in above example to show that it also crashed "by 
> default".
>
>> qemu-system-x86_64: unknown type 'VGA'
>> Aborted (core dumped)
>> 
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>   hw/i386/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
>> index 527b95df81..8e59cb6634 100644
>> --- a/hw/i386/Kconfig
>> +++ b/hw/i386/Kconfig
>> @@ -30,9 +30,9 @@ config PC
>>       imply TEST_DEVICES
>>       imply TPM_CRB
>>       imply TPM_TIS_ISA
>> -    imply VGA_PCI
>>       imply VIRTIO_VGA
>>       imply NVDIMM
>> +    select VGA_PCI
>>       select FDC_ISA
>>       select I8259
>>       select I8254
>
> Maybe it would be better to add it to the i440fx and the q35 machine only, 
> so that you could still compile the isapc machine without it?

isapc depends on i440fx, so it's will bring VGA_PCI into the build
anyway.

