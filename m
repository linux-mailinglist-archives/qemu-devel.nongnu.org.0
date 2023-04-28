Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BC96F1A85
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 16:34:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psPA4-0000oN-EE; Fri, 28 Apr 2023 10:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1psP9z-0000lp-3q; Fri, 28 Apr 2023 10:33:19 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1psP7p-0006oG-7B; Fri, 28 Apr 2023 10:31:08 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 98F312003A;
 Fri, 28 Apr 2023 14:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682692261; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5i66iKCqxlGt/eIayUF84GAyyu+iy6Snh4Tu8IVXrTs=;
 b=aMz61qt1hGkZTUk1GMMlbYOQLZb34/kaeJEAQGmu59mXgnfPgqm+8K/FGi9YarRCKKim0d
 dY19VKPr9Cz9UVo+B5Y4uNui0YLrleXRoJ1B3ToUgeJeL/gGiojrAjDhz5ZrRO9//cA6Vl
 DAlQ2g6MZGe9jFteK6PpgP3crX1tHrI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682692261;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5i66iKCqxlGt/eIayUF84GAyyu+iy6Snh4Tu8IVXrTs=;
 b=fjMmUHpJOJBkf662JLRPVfUq+xRit/iZqZ4GE9DoYB+8VK4hLTp/6jvgWhkdzIhXGR/maF
 54dxr6UhSlXawHBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 255371390E;
 Fri, 28 Apr 2023 14:31:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qkrxN6TYS2QXQAAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 28 Apr 2023 14:31:00 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, Narayana Murty N
 <nnmlinux@linux.ibm.com>, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, npiggin@linux.ibm.com,
 vajain21@linux.ibm.com, harshpb@linux.ibm.com, sbhat@linux.ibm.com
Subject: Re: [PATCH] target: ppc: Correctly initialize HILE in HID-0 for
 book3s processors
In-Reply-To: <87y1mcfvzo.fsf@vajain21.in.ibm.com>
References: <20230420145055.10196-1-nnmlinux@linux.ibm.com>
 <87v8hq8lgz.fsf@suse.de> <87y1mcfvzo.fsf@vajain21.in.ibm.com>
Date: Fri, 28 Apr 2023 11:30:58 -0300
Message-ID: <87sfckrsd9.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Vaibhav Jain <vaibhav@linux.ibm.com> writes:

> Hi Fabiano,
>
> Thanks for looking into this patch and apologies for the delayed reponse.
> Fabiano Rosas <farosas@suse.de> writes:
>
>> Narayana Murty N <nnmlinux@linux.ibm.com> writes:
>>
>>> On PPC64 the HILE(Hypervisor Interrupt Little Endian) bit in HID-0
>>> register needs to be initialized as per isa 3.0b[1] section
>>> 2.10. This bit gets copied to the MSR_LE when handling interrupts that
>>> are handled in HV mode to establish the Endianess mode of the interrupt
>>> handler.
>>>
>>> Qemu's ppc_interrupts_little_endian() depends on HILE to determine Host
>>> endianness which is then used to determine the endianess of the guest dump.
>>>
>>
>> Not quite. We use the interrupt endianness as a proxy to guest
>> endianness to avoid reading MSR_LE at an inopportune moment when the
>> guest is switching endianness.
> Agreed
>
>> This is not dependent on host
>> endianness. The HILE check is used when taking a memory dump of a
>> HV-capable machine such as the emulated powernv.
>
> I think one concern which the patch tries to address is the guest memorydump file
> generated of a BigEndian(BE) guest on a LittleEndian(LE) host is not readable on
> the same LE host since 'crash' doesnt support cross endianess
> dumps. Also even for a LE guest on LE host the memory dumps are marked as BE
> making it not possible to analyze any guest memory dumps on the host.
>

From QEMU's perspective there's no "host" in this equation. We'll
generate a BE dump for a BE guest and a LE dump for a LE guest. Anything
different is a bug in QEMU (as the one this patch addresses).

> However setting the HILE based on host endianess of qemu might not be
> the right way to fix this problem. Based on an off mailing list discussion
> with Narayana, he is working on another patch which doesnt set HILE
> based on host endianess. However the problem seems to be stemming from
> fact that qemu on KVM is using the HILE to set up the endianess of
> memory-dump elf and since its not setup correctly the memory dumps are
> in wrong endianess.
>
>> I think the actual issue might be that we're calling
>> ppc_interrupts_little_endian with hv=true for the dump.
>>
> Yes, that is currently the case with cpu_get_dump_info(). Excerpt from
> that function below that sets the endianess of the dump:
>
>     if (ppc_interrupts_little_endian(cpu, cpu->env.has_hv_mode)) {

This should probably be looking at cpu->vhyp or MSR_HVB since
has_hv_mode will not change after we init the cpu.

>         info->d_endian = ELFDATA2LSB;
>     } else {
>         info->d_endian = ELFDATA2MSB;
>     }
>
> for pseries kvm guest cpu->env.has_hv_mode is already set hence
> ppc_interrupts_little_endian() assumes its running in 'hv' mode. The new
> patch from Narayana will be addressing this.
>
>>> Currently the HILE bit is never set in the HID0 register even if the
>>> qemu is running in Little-Endian mode. This causes the guest dumps to be
>>> always taken in Big-Endian byte ordering. A guest memory dump of a
>>> Little-Endian guest running on Little-Endian qemu guest fails with the
>>> crash tool as illustrated below:
>>>
>>
>> Could you describe in more detail what is your setup? Specifically
>> whether both guests are running TCG or KVM (info kvm) and the state of
>> the nested-hv capability in QEMU command line.
> Currently the issue is seen with any pseries KVM guest running on a PowerNV host.

