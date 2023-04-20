Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8396E9B7B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 20:21:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppYt4-0001At-Ko; Thu, 20 Apr 2023 14:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1ppYt3-0001Ag-3W; Thu, 20 Apr 2023 14:20:05 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1ppYt0-0000S9-RW; Thu, 20 Apr 2023 14:20:04 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CE9D51F88F;
 Thu, 20 Apr 2023 18:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682014799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FSLE+q64VX9JLiXEWz3ddwog8BPvbLelHYNjuBFVRtA=;
 b=1f+swi1JgK0+6JaGqzzgPwY+nyTEfkbqdaOdRcDalCg8zMtmC9C5IymokEokJPT2cxGotp
 H01O9NauUbVsSQGNbDMH5949HMeiHivRrOznPi5kxWs6dSwe2z1fcd9U08TIHO100bIV/w
 T/B+yJADpehVtgh/krOfa/3YPWpmtVE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682014799;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FSLE+q64VX9JLiXEWz3ddwog8BPvbLelHYNjuBFVRtA=;
 b=027XXH713Kg3gxsr2zW29xte7eLCQOBsBy244Phx5LvBWTZ39n8UjMdYJjG+CPlpjfsI3m
 03HGhFP0zwkLiuBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5049713584;
 Thu, 20 Apr 2023 18:19:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8zBaBk+CQWSoLwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 20 Apr 2023 18:19:59 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Narayana Murty N <nnmlinux@linux.ibm.com>, danielhb413@gmail.com,
 clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, npiggin@linux.ibm.com,
 vajain21@linux.ibm.com, harshpb@linux.ibm.com, sbhat@linux.ibm.com
Subject: Re: [PATCH] target: ppc: Correctly initialize HILE in HID-0 for
 book3s processors
In-Reply-To: <20230420145055.10196-1-nnmlinux@linux.ibm.com>
References: <20230420145055.10196-1-nnmlinux@linux.ibm.com>
Date: Thu, 20 Apr 2023 15:19:56 -0300
Message-ID: <87v8hq8lgz.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
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

Narayana Murty N <nnmlinux@linux.ibm.com> writes:

> On PPC64 the HILE(Hypervisor Interrupt Little Endian) bit in HID-0
> register needs to be initialized as per isa 3.0b[1] section
> 2.10. This bit gets copied to the MSR_LE when handling interrupts that
> are handled in HV mode to establish the Endianess mode of the interrupt
> handler.
>
> Qemu's ppc_interrupts_little_endian() depends on HILE to determine Host
> endianness which is then used to determine the endianess of the guest dump.
>

Not quite. We use the interrupt endianness as a proxy to guest
endianness to avoid reading MSR_LE at an inopportune moment when the
guest is switching endianness. This is not dependent on host
endianness. The HILE check is used when taking a memory dump of a
HV-capable machine such as the emulated powernv.

I think the actual issue might be that we're calling
ppc_interrupts_little_endian with hv=true for the dump.

> Currently the HILE bit is never set in the HID0 register even if the
> qemu is running in Little-Endian mode. This causes the guest dumps to be
> always taken in Big-Endian byte ordering. A guest memory dump of a
> Little-Endian guest running on Little-Endian qemu guest fails with the
> crash tool as illustrated below:
>

Could you describe in more detail what is your setup? Specifically
whether both guests are running TCG or KVM (info kvm) and the state of
the nested-hv capability in QEMU command line.

