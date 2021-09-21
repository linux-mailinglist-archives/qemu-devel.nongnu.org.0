Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BE7412E45
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 07:43:18 +0200 (CEST)
Received: from localhost ([::1]:37124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSYYn-0007h2-Al
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 01:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1mSYVT-0006C6-0T
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 01:39:52 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:37606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1mSYVP-0006lp-IM
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 01:39:50 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E9CC7220BF;
 Tue, 21 Sep 2021 05:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632202782; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=90swtQfF9tDH2f3ZLA+wR1kXJMfgCEkOxr+mlzPDOMk=;
 b=VhfGfMLvozNAbs4dOkzyIPPPjByEGynLcHfSU72NXsaX1o401XPtQTRXd6EUCpkIKETJaw
 jxvcOams9XelQKORJkKe4Ua/I1PDcu3tZxS9+v077SAyYPh6dV94lqTBS1miWlqBxAjqqr
 9qVhPbV19YXt91f+f9qcR2Rm1RssIvE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632202782;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=90swtQfF9tDH2f3ZLA+wR1kXJMfgCEkOxr+mlzPDOMk=;
 b=Vk2xQbVxo2HMpFdirCf3eK69el/JX3Wl4r4bw4EUnaWTt/jfWL4HR9J85lc+SoskcRRz/H
 K/oCWLIcU4VH5TAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AEAB013B97;
 Tue, 21 Sep 2021 05:39:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6aktKB5wSWFCWwAAMHmgww
 (envelope-from <hare@suse.de>); Tue, 21 Sep 2021 05:39:42 +0000
Subject: Re: [PATCH 2/3] scsi: make io_timeout configurable
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20201116183114.55703-1-hare@suse.de>
 <20201116183114.55703-3-hare@suse.de>
 <CABgObfbUH4Djyicuie0-Bbu1zKrYN3+NDd56c5KA16s+Q+Liww@mail.gmail.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <1f46ca6f-4ea7-247e-b3e9-680e3f60b2b2@suse.de>
Date: Tue, 21 Sep 2021 07:39:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CABgObfbUH4Djyicuie0-Bbu1zKrYN3+NDd56c5KA16s+Q+Liww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=hare@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 8:56 PM, Paolo Bonzini wrote:
> On Mon, Nov 16, 2020 at 7:31 PM Hannes Reinecke <hare@suse.de> wrote:
>> The current code sets an infinite timeout on SG_IO requests,
>> causing the guest to stall if the host experiences a frame
>> loss.
>> This patch adds an 'io_timeout' parameter for SCSIDevice to
>> make the SG_IO timeout configurable, and also shortens the
>> default timeout to 30 seconds to avoid infinite stalls.
> 
> Hannes, could 30 seconds be a bit too short for tape drives?
> 
It would, but then anyone attempting to use tapes via qemu emulation 
deserves to suffer.
Tapes are bitchy even when used normally, so attempting to use them 
under qemu emulation will land you with lots of unhappy experiences, 
where the timeout is the least of your problems.
I sincerely doubt anyone will be using tapes here.
Not in real-world scenarios.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

