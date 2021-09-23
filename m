Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E01415814
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 08:05:00 +0200 (CEST)
Received: from localhost ([::1]:34288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTHqt-0000Xr-FZ
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 02:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1mTHpf-0008Hr-Il
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 02:03:43 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:48390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1mTHpd-0003HQ-DR
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 02:03:43 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A477E20275;
 Thu, 23 Sep 2021 06:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632377016; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ylPH4fPX4M2xcX1g4asLnFJSzalIsgq9A64TYJRAHe0=;
 b=oVKdiuBlO0FwX8IKibZnJizW2+uFT4G/FLDvVbf2Vr+BSAbvWTKpaZ4uG2/ZbQw1v92mt/
 kzSImD0c5K9y8JJpBVOigYtzC/zfNyIHop6DCeOctWtuJTqQXSgzyuvfx7M7prPHb8duSd
 OlCh1+nLRL2G/k4blqOPATiRBdC2l2E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632377016;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ylPH4fPX4M2xcX1g4asLnFJSzalIsgq9A64TYJRAHe0=;
 b=fDS1+5Wvpt2Mxy6qQE3za0+65LxlksBfBAOhkL9kT9b+kFUSMaBicFRhiPYyzZKT6pH7cJ
 wXL9uPJQ6c0yaLAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8712713DB5;
 Thu, 23 Sep 2021 06:03:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RbOsH7gYTGE2VAAAMHmgww
 (envelope-from <hare@suse.de>); Thu, 23 Sep 2021 06:03:36 +0000
Subject: Re: [PATCH 2/3] scsi: make io_timeout configurable
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20201116183114.55703-1-hare@suse.de>
 <20201116183114.55703-3-hare@suse.de>
 <dae9daae-aa8d-ddb7-ecf3-95e91defea53@redhat.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <d62528de-b5ac-3941-dc85-aa582f0f31bd@suse.de>
Date: Thu, 23 Sep 2021 08:03:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <dae9daae-aa8d-ddb7-ecf3-95e91defea53@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=hare@suse.de;
 helo=smtp-out2.suse.de
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 5:47 PM, Philippe Mathieu-Daudé wrote:
> Hi Hannes,
> 
> On 11/16/20 19:31, Hannes Reinecke wrote:
>> The current code sets an infinite timeout on SG_IO requests,
>> causing the guest to stall if the host experiences a frame
>> loss.
>> This patch adds an 'io_timeout' parameter for SCSIDevice to
>> make the SG_IO timeout configurable, and also shortens the
>> default timeout to 30 seconds to avoid infinite stalls.
>>
>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>> ---
>>   hw/scsi/scsi-disk.c    |  6 ++++--
>>   hw/scsi/scsi-generic.c | 17 +++++++++++------
>>   include/hw/scsi/scsi.h |  4 +++-
>>   3 files changed, 18 insertions(+), 9 deletions(-)
> 
>>   int scsi_SG_IO_FROM_DEV(BlockBackend *blk, uint8_t *cmd, uint8_t 
>> cmd_size,
>> -                        uint8_t *buf, uint8_t buf_size)
>> +                        uint8_t *buf, uint8_t buf_size, uint32_t 
>> timeout)
>>   {
>>       sg_io_hdr_t io_header;
>>       uint8_t sensebuf[8];
>> @@ -520,7 +522,7 @@ int scsi_SG_IO_FROM_DEV(BlockBackend *blk, uint8_t 
>> *cmd, uint8_t cmd_size,
>>       io_header.cmd_len = cmd_size;
>>       io_header.mx_sb_len = sizeof(sensebuf);
>>       io_header.sbp = sensebuf;
>> -    io_header.timeout = 6000; /* XXX */
>> +    io_header.timeout = timeout * 1000;
> 
>> @@ -637,7 +639,7 @@ static int get_stream_blocksize(BlockBackend *blk)
>>       cmd[0] = MODE_SENSE;
>>       cmd[4] = sizeof(buf);
>> -    ret = scsi_SG_IO_FROM_DEV(blk, cmd, sizeof(cmd), buf, sizeof(buf));
>> +    ret = scsi_SG_IO_FROM_DEV(blk, cmd, sizeof(cmd), buf, 
>> sizeof(buf), 6);
> 
> Why is this timeout hardcoded? Due to the /* XXX */ comment?
> 

60 seconds is the default command timeout on linux.
And the problem is that the guest might set a command timeout on the 
comands being send from the guests user space, but the guest is unable
to communicate this timeout to the host.

Really, one should fix up the virtio spec here to allow for a 'timeout' 
field. But in the absence of that being able to configure it is the next 
best attempt.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

