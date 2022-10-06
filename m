Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAA35F6D2E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 19:44:46 +0200 (CEST)
Received: from localhost ([::1]:38116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogUvN-0004tz-Iz
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 13:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ogUE8-0005pK-LV
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 13:00:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ogUE2-0004rP-Ck
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 13:00:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665075597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fzGASpRlhZ7tqWWlNBZLNa/9RQLuoMQZNcEiX4PtE3I=;
 b=Rm58Wz1EKOUDqxHGOqU3vXtmsEdcUOiff2+MMD7qEJTNsIQVDCkMw4PE7YFG1Nx2FsZA4l
 Fpo6Ncn3W2suNwtfj9dIVP59uS8Q5wUdI6cFdQlEFFARTTC6KS1XMCkt+2+mDJAlu+KHJG
 XenyLPohr6ECDManLjWX6/dGIci/b78=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-4zxQXTzENhC8Fbl5HXrsZQ-1; Thu, 06 Oct 2022 12:59:55 -0400
X-MC-Unique: 4zxQXTzENhC8Fbl5HXrsZQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 f26-20020a7bcc1a000000b003c03db14864so791321wmh.6
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 09:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=fzGASpRlhZ7tqWWlNBZLNa/9RQLuoMQZNcEiX4PtE3I=;
 b=Y3M0yUIK5RTsU0HlkKrk+41rhJiI22AmCRXiDtXAqUdeVAy/2eYfwaExMbfTDSH+Hh
 yT9Y3S1aTWDcZPTzz5ear/JK/FeH+xfZMByAmdxJlqQZhhf4eejWMKqBUK/RFDW1h1bS
 REiC2aQx3dfFNeS/DeIRUwRJhDbzevGj/UpOHWddXbsycgC4u4Q8ePx4i+LHfy8B7eeV
 GwYCVG50cDAmozvz6JvLvM7EERZu+ygC7nbOw51EQlCIm2rKkKql+6+cwWoiqfv3Wh1J
 vLvB+dTt2tGvD0hM2T0TWJi1JO8bsHgVGARyyEe3QE4YFuiyv/afFo+TxAE6XvkuytVC
 yeXQ==
X-Gm-Message-State: ACrzQf3kfZuvQLRZd3OxE2I9b+yfFAEU0QwQoFz8RhyUGoubY4weh0z4
 eWA7kOCUlOSluqVzI71cQkU62yeCZ39CUw7ql3K6JwQ8ZtTBs1wfTmBEHTKPmegm55CJksFfwGI
 unT3Bb/yL5ztjVPc=
X-Received: by 2002:adf:a40c:0:b0:22e:47fe:7ea3 with SMTP id
 d12-20020adfa40c000000b0022e47fe7ea3mr611955wra.248.1665075594780; 
 Thu, 06 Oct 2022 09:59:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6VuDzJWafbDjtq1Dt2T84Tk3bzumFPt+G2UFukaBLLRKYdSm7iwmZnj4jJco0jLMS895PQtQ==
X-Received: by 2002:adf:a40c:0:b0:22e:47fe:7ea3 with SMTP id
 d12-20020adfa40c000000b0022e47fe7ea3mr611938wra.248.1665075594513; 
 Thu, 06 Oct 2022 09:59:54 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 iv14-20020a05600c548e00b003b4c40378casm6164741wmb.39.2022.10.06.09.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 09:59:53 -0700 (PDT)
Date: Thu, 6 Oct 2022 17:59:51 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 11/14] migration: Move last_sent_block into
 PageSearchStatus
Message-ID: <Yz8Jhyd6b5DscLxr@work-vm>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225223.49052-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920225223.49052-1-peterx@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> Since we use PageSearchStatus to represent a channel, it makes perfect
> sense to keep last_sent_block (aka, leverage RAM_SAVE_FLAG_CONTINUE) to be
> per-channel rather than global because each channel can be sending
> different pages on ramblocks.
> 
> Hence move it from RAMState into PageSearchStatus.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/ram.c | 71 ++++++++++++++++++++++++++++---------------------
>  1 file changed, 41 insertions(+), 30 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index dbe11e1ace..fdcb61a2c8 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -89,6 +89,8 @@ XBZRLECacheStats xbzrle_counters;
>  struct PageSearchStatus {
>      /* The migration channel used for a specific host page */
>      QEMUFile    *pss_channel;
> +    /* Last block from where we have sent data */
> +    RAMBlock *last_sent_block;
>      /* Current block being searched */
>      RAMBlock    *block;
>      /* Current page to search from */
> @@ -368,8 +370,6 @@ struct RAMState {
>      int uffdio_fd;
>      /* Last block that we have visited searching for dirty pages */
>      RAMBlock *last_seen_block;
> -    /* Last block from where we have sent data */
> -    RAMBlock *last_sent_block;
>      /* Last dirty target page we have sent */
>      ram_addr_t last_page;
>      /* last ram version we have seen */
> @@ -677,16 +677,17 @@ exit:
>   *
>   * Returns the number of bytes written
>   *
> - * @f: QEMUFile where to send the data
> + * @pss: current PSS channel status
>   * @block: block that contains the page we want to send
>   * @offset: offset inside the block for the page
>   *          in the lower bits, it contains flags
>   */
> -static size_t save_page_header(RAMState *rs, QEMUFile *f,  RAMBlock *block,
> +static size_t save_page_header(PageSearchStatus *pss, RAMBlock *block,
>                                 ram_addr_t offset)
>  {
>      size_t size, len;
> -    bool same_block = (block == rs->last_sent_block);
> +    bool same_block = (block == pss->last_sent_block);
> +    QEMUFile *f = pss->pss_channel;
>  
>      if (same_block) {
>          offset |= RAM_SAVE_FLAG_CONTINUE;
> @@ -699,7 +700,7 @@ static size_t save_page_header(RAMState *rs, QEMUFile *f,  RAMBlock *block,
>          qemu_put_byte(f, len);
>          qemu_put_buffer(f, (uint8_t *)block->idstr, len);
>          size += 1 + len;
> -        rs->last_sent_block = block;
> +        pss->last_sent_block = block;
>      }
>      return size;
>  }
> @@ -783,17 +784,19 @@ static void xbzrle_cache_zero_page(RAMState *rs, ram_addr_t current_addr)
>   *          -1 means that xbzrle would be longer than normal
>   *
>   * @rs: current RAM state
> + * @pss: current PSS channel
>   * @current_data: pointer to the address of the page contents
>   * @current_addr: addr of the page
>   * @block: block that contains the page we want to send
>   * @offset: offset inside the block for the page
>   */
> -static int save_xbzrle_page(RAMState *rs, QEMUFile *file,
> +static int save_xbzrle_page(RAMState *rs, PageSearchStatus *pss,
>                              uint8_t **current_data, ram_addr_t current_addr,
>                              RAMBlock *block, ram_addr_t offset)
>  {
>      int encoded_len = 0, bytes_xbzrle;
>      uint8_t *prev_cached_page;
> +    QEMUFile *file = pss->pss_channel;
>  
>      if (!cache_is_cached(XBZRLE.cache, current_addr,
>                           ram_counters.dirty_sync_count)) {
> @@ -858,7 +861,7 @@ static int save_xbzrle_page(RAMState *rs, QEMUFile *file,
>      }
>  
>      /* Send XBZRLE based compressed page */
> -    bytes_xbzrle = save_page_header(rs, file, block,
> +    bytes_xbzrle = save_page_header(pss, block,
>                                      offset | RAM_SAVE_FLAG_XBZRLE);
>      qemu_put_byte(file, ENCODING_FLAG_XBZRLE);
>      qemu_put_be16(file, encoded_len);
> @@ -1289,19 +1292,19 @@ static void ram_release_page(const char *rbname, uint64_t offset)
>   * Returns the size of data written to the file, 0 means the page is not
>   * a zero page
>   *
> - * @rs: current RAM state
> - * @file: the file where the data is saved
> + * @pss: current PSS channel
>   * @block: block that contains the page we want to send
>   * @offset: offset inside the block for the page
>   */
> -static int save_zero_page_to_file(RAMState *rs, QEMUFile *file,
> +static int save_zero_page_to_file(PageSearchStatus *pss,
>                                    RAMBlock *block, ram_addr_t offset)
>  {
>      uint8_t *p = block->host + offset;
> +    QEMUFile *file = pss->pss_channel;
>      int len = 0;
>  
>      if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
> -        len += save_page_header(rs, file, block, offset | RAM_SAVE_FLAG_ZERO);
> +        len += save_page_header(pss, block, offset | RAM_SAVE_FLAG_ZERO);
>          qemu_put_byte(file, 0);
>          len += 1;
>          ram_release_page(block->idstr, offset);
> @@ -1314,14 +1317,14 @@ static int save_zero_page_to_file(RAMState *rs, QEMUFile *file,
>   *
>   * Returns the number of pages written.
>   *
> - * @rs: current RAM state
> + * @pss: current PSS channel
>   * @block: block that contains the page we want to send
>   * @offset: offset inside the block for the page
>   */
> -static int save_zero_page(RAMState *rs, QEMUFile *file, RAMBlock *block,
> +static int save_zero_page(PageSearchStatus *pss, RAMBlock *block,
>                            ram_addr_t offset)
>  {
> -    int len = save_zero_page_to_file(rs, file, block, offset);
> +    int len = save_zero_page_to_file(pss, block, offset);
>  
>      if (len) {
>          qatomic_inc(&ram_counters.duplicate);
> @@ -1374,16 +1377,18 @@ static bool control_save_page(PageSearchStatus *pss, RAMBlock *block,
>   *
>   * Returns the number of pages written.
>   *
> - * @rs: current RAM state
> + * @pss: current PSS channel
>   * @block: block that contains the page we want to send
>   * @offset: offset inside the block for the page
>   * @buf: the page to be sent
>   * @async: send to page asyncly
>   */
> -static int save_normal_page(RAMState *rs, QEMUFile *file, RAMBlock *block,
> +static int save_normal_page(PageSearchStatus *pss, RAMBlock *block,
>                              ram_addr_t offset, uint8_t *buf, bool async)
>  {
> -    ram_transferred_add(save_page_header(rs, file, block,
> +    QEMUFile *file = pss->pss_channel;
> +
> +    ram_transferred_add(save_page_header(pss, block,
>                                           offset | RAM_SAVE_FLAG_PAGE));
>      if (async) {
>          qemu_put_buffer_async(file, buf, TARGET_PAGE_SIZE,
> @@ -1423,7 +1428,7 @@ static int ram_save_page(RAMState *rs, PageSearchStatus *pss)
>  
>      XBZRLE_cache_lock();
>      if (rs->xbzrle_enabled && !migration_in_postcopy()) {
> -        pages = save_xbzrle_page(rs, pss->pss_channel, &p, current_addr,
> +        pages = save_xbzrle_page(rs, pss, &p, current_addr,
>                                   block, offset);
>          if (!rs->last_stage) {
>              /* Can't send this cached data async, since the cache page
> @@ -1435,8 +1440,7 @@ static int ram_save_page(RAMState *rs, PageSearchStatus *pss)
>  
>      /* XBZRLE overflow or normal page */
>      if (pages == -1) {
> -        pages = save_normal_page(rs, pss->pss_channel, block, offset,
> -                                 p, send_async);
> +        pages = save_normal_page(pss, block, offset, p, send_async);
>      }
>  
>      XBZRLE_cache_unlock();
> @@ -1459,14 +1463,15 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
>                                   ram_addr_t offset, uint8_t *source_buf)
>  {
>      RAMState *rs = ram_state;
> +    PageSearchStatus *pss = &rs->pss[RAM_CHANNEL_PRECOPY];
>      uint8_t *p = block->host + offset;
>      int ret;
>  
> -    if (save_zero_page_to_file(rs, f, block, offset)) {
> +    if (save_zero_page_to_file(pss, block, offset)) {
>          return true;
>      }
>  
> -    save_page_header(rs, f, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
> +    save_page_header(pss, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
>  
>      /*
>       * copy it to a internal buffer to avoid it being modified by VM
> @@ -2286,7 +2291,8 @@ static bool save_page_use_compression(RAMState *rs)
>   * has been properly handled by compression, otherwise needs other
>   * paths to handle it
>   */
> -static bool save_compress_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
> +static bool save_compress_page(RAMState *rs, PageSearchStatus *pss,
> +                               RAMBlock *block, ram_addr_t offset)
>  {
>      if (!save_page_use_compression(rs)) {
>          return false;
> @@ -2302,7 +2308,7 @@ static bool save_compress_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
>       * We post the fist page as normal page as compression will take
>       * much CPU resource.
>       */
> -    if (block != rs->last_sent_block) {
> +    if (block != pss->last_sent_block) {
>          flush_compressed_data(rs);
>          return false;
>      }
> @@ -2333,11 +2339,11 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
>          return res;
>      }
>  
> -    if (save_compress_page(rs, block, offset)) {
> +    if (save_compress_page(rs, pss, block, offset)) {
>          return 1;
>      }
>  
> -    res = save_zero_page(rs, pss->pss_channel, block, offset);
> +    res = save_zero_page(pss, block, offset);
>      if (res > 0) {
>          /* Must let xbzrle know, otherwise a previous (now 0'd) cached
>           * page would be stale
> @@ -2469,7 +2475,7 @@ static void postcopy_preempt_choose_channel(RAMState *rs, PageSearchStatus *pss)
>           * If channel switched, reset last_sent_block since the old sent block
>           * may not be on the same channel.
>           */
> -        rs->last_sent_block = NULL;
> +        pss->last_sent_block = NULL;
>  
>          trace_postcopy_preempt_switch_channel(channel);
>      }
> @@ -2804,8 +2810,13 @@ static void ram_save_cleanup(void *opaque)
>  
>  static void ram_state_reset(RAMState *rs)
>  {
> +    int i;
> +
> +    for (i = 0; i < RAM_CHANNEL_MAX; i++) {
> +        rs->pss[i].last_sent_block = NULL;
> +    }
> +
>      rs->last_seen_block = NULL;
> -    rs->last_sent_block = NULL;
>      rs->last_page = 0;
>      rs->last_version = ram_list.version;
>      rs->xbzrle_enabled = false;
> @@ -2999,8 +3010,8 @@ void ram_postcopy_send_discard_bitmap(MigrationState *ms)
>      migration_bitmap_sync(rs);
>  
>      /* Easiest way to make sure we don't resume in the middle of a host-page */
> +    rs->pss[RAM_CHANNEL_PRECOPY].last_sent_block = NULL;

Why don't we reset the postcopy one here as well?

Dave

>      rs->last_seen_block = NULL;
> -    rs->last_sent_block = NULL;
>      rs->last_page = 0;
>  
>      postcopy_each_ram_send_discard(ms);
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


