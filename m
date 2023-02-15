Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A1569819C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:06:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLF1-0004oL-Kh; Wed, 15 Feb 2023 12:06:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1pSLEz-0004kj-O2
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:06:45 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1pSLEx-00044Q-UP
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:06:45 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 62DBE20082;
 Wed, 15 Feb 2023 17:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676480801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B1zB8kqKYVTzE0NhdJTKjybRKKGj9gLqZwZwsZ0mRyo=;
 b=YkmMh9mIv8nnGf23Y0Ix5c2sWEI0RgBYiXZJRvaEgagKGLIYfq6y4DFV/B+jSwrjz7YlLA
 CFN+14rmtlCC7hGhdxE7tY4OoQKJ474dqY3bhbEVueUAijNsHg3B6UW1BGwztPK5KEn/Ym
 hGJrr/VA7uahHx7/3/b0q68gH8v1BKQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676480801;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B1zB8kqKYVTzE0NhdJTKjybRKKGj9gLqZwZwsZ0mRyo=;
 b=S0yblhl5YcA/PF18i8Q8MSdAkau0tvkryay08D79XtcElIOGRTxehtJkJ9pwSuGugpB5a0
 qnpsq+HM4cZfOICg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1670E13483;
 Wed, 15 Feb 2023 17:06:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KJaEAyER7WOcUAAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 15 Feb 2023 17:06:41 +0000
Message-ID: <c204fffa-a5b0-1320-88b0-cc936d27d21b@suse.de>
Date: Wed, 15 Feb 2023 18:06:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC v5 0/3] migration: reduce time of loading non-iterable
 vmstate
Content-Language: en-US
To: Chuang Xu <xuchuangxclwt@bytedance.com>, qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
References: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=cfontana@suse.de; helo=smtp-out2.suse.de
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 1/17/23 12:55, Chuang Xu wrote:
> In this version:
> 
> - rename rcu_read_locked() to rcu_read_is_locked().
> - adjust the sanity check in address_space_to_flatview().
> - improve some comments.
> 
> The duration of loading non-iterable vmstate accounts for a significant
> portion of downtime (starting with the timestamp of source qemu stop and
> ending with the timestamp of target qemu start). Most of the time is spent
> committing memory region changes repeatedly.
> 
> This patch packs all the changes to memory region during the period of	
> loading non-iterable vmstate in a single memory transaction. With the
> increase of devices, this patch will greatly improve the performance.
> 
> Here are the test1 results:
> test info:
> - Host
>   - Intel(R) Xeon(R) Platinum 8260 CPU
>   - NVIDIA Mellanox ConnectX-5
> - VM
>   - 32 CPUs 128GB RAM VM
>   - 8 16-queue vhost-net device
>   - 16 4-queue vhost-user-blk device.
> 
> 	time of loading non-iterable vmstate     downtime
> before		about 150 ms			  740+ ms
> after		about 30 ms			  630+ ms
> 
> (This result is different from that of v1. It may be that someone has 
> changed something on my host.., but it does not affect the display of 
> the optimization effect.)
> 
> 
> In test2, we keep the number of the device the same as test1, reduce the 
> number of queues per device:
> 
> Here are the test2 results:
> test info:
> - Host
>   - Intel(R) Xeon(R) Platinum 8260 CPU
>   - NVIDIA Mellanox ConnectX-5
> - VM
>   - 32 CPUs 128GB RAM VM
>   - 8 1-queue vhost-net device
>   - 16 1-queue vhost-user-blk device.
> 
> 	time of loading non-iterable vmstate     downtime
> before		about 90 ms			 about 250 ms
> 
> after		about 25 ms			 about 160 ms
> 
> 
> 
> In test3, we keep the number of queues per device the same as test1, reduce 
> the number of devices:
> 
> Here are the test3 results:
> test info:
> - Host
>   - Intel(R) Xeon(R) Platinum 8260 CPU
>   - NVIDIA Mellanox ConnectX-5
> - VM
>   - 32 CPUs 128GB RAM VM
>   - 1 16-queue vhost-net device
>   - 1 4-queue vhost-user-blk device.
> 
> 	time of loading non-iterable vmstate     downtime
> before		about 20 ms			 about 70 ms
> after		about 11 ms			 about 60 ms
> 
> 
> As we can see from the test results above, both the number of queues and 
> the number of devices have a great impact on the time of loading non-iterable 
> vmstate. The growth of the number of devices and queues will lead to more 
> mr commits, and the time consumption caused by the flatview reconstruction 
> will also increase.
> 
> Please review, Chuang.
> 
> [v4]
> 
> - attach more information in the cover letter.
> - remove changes on virtio_load.
> - add rcu_read_locked() to detect holding of rcu lock.
> 
> [v3]
> 
> - move virtio_load_check_delay() from virtio_memory_listener_commit() to 
>   virtio_vmstate_change().
> - add delay_check flag to VirtIODevice to make sure virtio_load_check_delay() 
>   will be called when delay_check is true.
> 
> [v2]
> 
> - rebase to latest upstream.
> - add sanity check to address_space_to_flatview().
> - postpone the init of the vring cache until migration's loading completes. 
> 
> [v1]
> 
> The duration of loading non-iterable vmstate accounts for a significant
> portion of downtime (starting with the timestamp of source qemu stop and
> ending with the timestamp of target qemu start). Most of the time is spent
> committing memory region changes repeatedly.
> 
> This patch packs all the changes to memory region during the period of
> loading non-iterable vmstate in a single memory transaction. With the
> increase of devices, this patch will greatly improve the performance.
> 
> Here are the test results:
> test vm info:
> - 32 CPUs 128GB RAM
> - 8 16-queue vhost-net device
> - 16 4-queue vhost-user-blk device.
> 
> 	time of loading non-iterable vmstate
> before		about 210 ms
> after		about 40 ms
> 
> 

great improvements on the load times, congrats!

Claudio

