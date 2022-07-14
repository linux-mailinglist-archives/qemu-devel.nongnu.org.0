Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC577574E50
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 14:47:40 +0200 (CEST)
Received: from localhost ([::1]:56386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oByFn-0002bS-BF
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 08:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oByC2-00083k-5N
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 08:43:47 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:34454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oByC0-00073k-K5
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 08:43:45 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D887B1F8FB;
 Thu, 14 Jul 2022 12:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657802622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6+RLGBm2VEQeV2LaOcqvcHSYaukbA0B8tNtMyTQ2F84=;
 b=OyRZNN7CGsXgLjlJIbWwQ6QHIpO7/vn6+otV2owxkFKD0w9fdZt5eqHID7R1lip5ZHQphp
 RwKKLVKIAr6Perf3qNwkbjuTyBngVJtyjKunkT2vS5W+ro8GRVZP7iYCD9lW/ErXneo2sQ
 4oc9NisnnzIpQ2aikihuGlo4Xy01oYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657802622;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6+RLGBm2VEQeV2LaOcqvcHSYaukbA0B8tNtMyTQ2F84=;
 b=ucfdTSa1daK9cT+AAJxD1lcUqN4oCD59scEa0rwnoE/uLw/xxq8GcyxIc7lTsVQSNXRehJ
 54RDZeCFhMov8YCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 895AA133A6;
 Thu, 14 Jul 2022 12:43:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ixHJH34P0GKTAwAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 14 Jul 2022 12:43:42 +0000
Message-ID: <4c300edb-59c9-a9b0-13f2-5b4a6cde8f98@suse.de>
Date: Thu, 14 Jul 2022 14:43:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v7 04/13] migration: Export ram_transferred_ram()
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
References: <20220531104318.7494-1-quintela@redhat.com>
 <20220531104318.7494-5-quintela@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20220531104318.7494-5-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It doesn't seem like the commit subject and the content match.

Is it ram_transferred_ram() or ram_transferred_add() ?

C

On 5/31/22 12:43, Juan Quintela wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/ram.h | 2 ++
>  migration/ram.c | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/ram.h b/migration/ram.h
> index ded0a3a086..7b641adc55 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -65,6 +65,8 @@ int ram_load_postcopy(QEMUFile *f);
>  
>  void ram_handle_compressed(void *host, uint8_t ch, uint64_t size);
>  
> +void ram_transferred_add(uint64_t bytes);
> +
>  int ramblock_recv_bitmap_test(RAMBlock *rb, void *host_addr);
>  bool ramblock_recv_bitmap_test_byte_offset(RAMBlock *rb, uint64_t byte_offset);
>  void ramblock_recv_bitmap_set(RAMBlock *rb, void *host_addr);
> diff --git a/migration/ram.c b/migration/ram.c
> index 5f5e37f64d..30b0680942 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -394,7 +394,7 @@ uint64_t ram_bytes_remaining(void)
>  
>  MigrationStats ram_counters;
>  
> -static void ram_transferred_add(uint64_t bytes)
> +void ram_transferred_add(uint64_t bytes)
>  {
>      if (runstate_is_running()) {
>          ram_counters.precopy_bytes += bytes;


