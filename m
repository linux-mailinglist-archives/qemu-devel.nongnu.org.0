Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABDC60C7A5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:13:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFyK-0005hJ-VF; Tue, 25 Oct 2022 05:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1onFxd-0005J3-GU
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 05:11:18 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1onFxY-0003Dd-WF
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 05:10:59 -0400
Received: by mail-pl1-x62f.google.com with SMTP id u6so10623266plq.12
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 02:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/OEHTWyopL+bACyQu9T7xOipS/nFyuwYjCOuOSB+C9Y=;
 b=WME8CFQ8mnPJFNL4tHlolHW5Zq85XATAiQmAaYL9oLoJkFJ8KRldOZGWujfSscrhjW
 KzTq/ZymeDTur4wE/cZGDH6JAk21fB8QlMwjeQZhqKbvNOYKGE/CPww/dYLv4+R6RtfA
 PERQtYK9018/h+iwyRbm7iHrqq+za0tOmTrP/+rsqQwKWQYNOOAgBUamrVVjeus+Bk+d
 dcn99pbQWpn8y0cQUYMwBjudJJT4jLbSoj7nnZNVktXObOZdXRCp5lTNBVcPzD0rJIGb
 5cb3qk0HyXTVtshau65TN5uONL3mRnd8QnMjWC6dIthcsRSXCKKEYBx8Cc2h28iqTME3
 DxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/OEHTWyopL+bACyQu9T7xOipS/nFyuwYjCOuOSB+C9Y=;
 b=jKVhIopeDuAwC4SeMM1TC83HuN6Yrs0UAwx8o4TDSNreg7wznBtaXxMPzUYojGZQgC
 wW+2ycYpxJDF80yb/FRM8aHSGroG6onl679E6RdE1D6yudiU3mdjxE1t/viHjjR43M2M
 c9utfAhdzRAtsco7uqXcM0Bt0EI+snkVrcMSP4PLXBTgaudwPzfOc4wGPn3lVnRiXUiF
 H6+DuonFM9p6iko57dheaeYdkCSvtq5uejUMtEBzUbkk2L3ssTfwv+II8efQmsABo+E1
 kdZSumGmV28YbMXIgC4quKb8nSTWzaT9c/YrMRwSVaT5bG2AeIMtpom2UYv8qsUHjkS3
 tyfA==
X-Gm-Message-State: ACrzQf2WXtDHJz7DpkisDxRfyLoJFIhSJ1TwvCHGLXWkBxNjrdB1TPtG
 gm5fPX8/Zvkidv2hsHaQX2JliA==
X-Google-Smtp-Source: AMsMyM6cg9ly83BAQ/wQnyGtg+sNWMLfQ9TO1Gtgg5zY030tTEO8jsGK4NapYoyJsXKAuI8pbSZ2oQ==
X-Received: by 2002:a17:903:186:b0:182:ecf9:6227 with SMTP id
 z6-20020a170903018600b00182ecf96227mr38151061plg.70.1666689052986; 
 Tue, 25 Oct 2022 02:10:52 -0700 (PDT)
Received: from [10.94.53.13] ([139.177.225.233])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a170903231000b0018099c9618esm869874plh.231.2022.10.25.02.10.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 02:10:52 -0700 (PDT)
Message-ID: <87fbac44-3862-85b6-8070-fc0c5845df61@bytedance.com>
Date: Tue, 25 Oct 2022 17:10:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v7 10/12] multifd: Support for zero pages transmission
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Yanan Wang <wangyanan55@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-11-quintela@redhat.com>
From: chuang xu <xuchuangxclwt@bytedance.com>
In-Reply-To: <20220802063907.18882-11-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 2022/8/2 下午2:39, Juan Quintela wrote:
> This patch adds counters and similar.  Logic will be added on the
> following patch.
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> ---
>
> Added counters for duplicated/non duplicated pages.
> Removed reviewed by from David.
> Add total_zero_pages
> ---
>   migration/multifd.h    | 17 ++++++++++++++++-
>   migration/multifd.c    | 36 +++++++++++++++++++++++++++++-------
>   migration/ram.c        |  2 --
>   migration/trace-events |  8 ++++----
>   4 files changed, 49 insertions(+), 14 deletions(-)
>
> diff --git a/migration/multifd.h b/migration/multifd.h
> index cd389d18d2..a1b852200d 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -47,7 +47,10 @@ typedef struct {
>       /* size of the next packet that contains pages */
>       uint32_t next_packet_size;
>       uint64_t packet_num;
> -    uint64_t unused[4];    /* Reserved for future use */
> +    /* zero pages */
> +    uint32_t zero_pages;
> +    uint32_t unused32[1];    /* Reserved for future use */
> +    uint64_t unused64[3];    /* Reserved for future use */
>       char ramblock[256];
>       uint64_t offset[];
>   } __attribute__((packed)) MultiFDPacket_t;
> @@ -127,6 +130,8 @@ typedef struct {
>       uint64_t num_packets;
>       /* non zero pages sent through this channel */
>       uint64_t total_normal_pages;
> +    /* zero pages sent through this channel */
> +    uint64_t total_zero_pages;
>       /* buffers to send */
>       struct iovec *iov;
>       /* number of iovs used */
> @@ -135,6 +140,10 @@ typedef struct {
>       ram_addr_t *normal;
>       /* num of non zero pages */
>       uint32_t normal_num;
> +    /* Pages that are  zero */
> +    ram_addr_t *zero;
> +    /* num of zero pages */
> +    uint32_t zero_num;
>       /* used for compression methods */
>       void *data;
>   }  MultiFDSendParams;
> @@ -184,12 +193,18 @@ typedef struct {
>       uint8_t *host;
>       /* non zero pages recv through this channel */
>       uint64_t total_normal_pages;
> +    /* zero pages recv through this channel */
> +    uint64_t total_zero_pages;
>       /* buffers to recv */
>       struct iovec *iov;
>       /* Pages that are not zero */
>       ram_addr_t *normal;
>       /* num of non zero pages */
>       uint32_t normal_num;
> +    /* Pages that are  zero */
> +    ram_addr_t *zero;
> +    /* num of zero pages */
> +    uint32_t zero_num;
>       /* used for de-compression methods */
>       void *data;
>   } MultiFDRecvParams;
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 68fc9f8e88..4473d9f834 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -263,6 +263,7 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
>       packet->normal_pages = cpu_to_be32(p->normal_num);
>       packet->next_packet_size = cpu_to_be32(p->next_packet_size);
>       packet->packet_num = cpu_to_be64(p->packet_num);
> +    packet->zero_pages = cpu_to_be32(p->zero_num);
>   
>       if (p->pages->block) {
>           strncpy(packet->ramblock, p->pages->block->idstr, 256);
> @@ -323,7 +324,15 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>       p->next_packet_size = be32_to_cpu(packet->next_packet_size);
>       p->packet_num = be64_to_cpu(packet->packet_num);
>   
> -    if (p->normal_num == 0) {
> +    p->zero_num = be32_to_cpu(packet->zero_pages);
> +    if (p->zero_num > packet->pages_alloc - p->normal_num) {
> +        error_setg(errp, "multifd: received packet "
> +                   "with %u zero pages and expected maximum pages are %u",
> +                   p->zero_num, packet->pages_alloc - p->normal_num) ;
> +        return -1;
> +    }
> +
> +    if (p->normal_num == 0 && p->zero_num == 0) {
>           return 0;
>       }
>   
> @@ -432,6 +441,8 @@ static int multifd_send_pages(QEMUFile *f)
>       ram_counters.multifd_bytes += p->sent_bytes;
>       qemu_file_acct_rate_limit(f, p->sent_bytes);
>       p->sent_bytes = 0;
> +    ram_counters.normal += p->normal_num;
> +    ram_counters.duplicate += p->zero_num;
>       qemu_mutex_unlock(&p->mutex);
>       qemu_sem_post(&p->sem);
>   
> @@ -545,6 +556,8 @@ void multifd_save_cleanup(void)
>           p->iov = NULL;
>           g_free(p->normal);
>           p->normal = NULL;
> +        g_free(p->zero);
> +        p->zero = NULL;
>           multifd_send_state->ops->send_cleanup(p, &local_err);
>           if (local_err) {
>               migrate_set_error(migrate_get_current(), local_err);
> @@ -666,6 +679,7 @@ static void *multifd_send_thread(void *opaque)
>               qemu_mutex_unlock(&p->mutex);
>   
>               p->normal_num = 0;
> +            p->zero_num = 0;
>   
>               if (use_zero_copy_send) {
>                   p->iovs_num = 0;
> @@ -687,8 +701,8 @@ static void *multifd_send_thread(void *opaque)
>               }
>               multifd_send_fill_packet(p);
>   
> -            trace_multifd_send(p->id, packet_num, p->normal_num, p->flags,
> -                               p->next_packet_size);
> +            trace_multifd_send(p->id, packet_num, p->normal_num, p->zero_num,
> +                               p->flags, p->next_packet_size);
>   
>               if (use_zero_copy_send) {
>                   /* Send header first, without zerocopy */
> @@ -712,6 +726,7 @@ static void *multifd_send_thread(void *opaque)
>               qemu_mutex_lock(&p->mutex);
>               p->num_packets++;
>               p->total_normal_pages += p->normal_num;
> +            p->total_zero_pages += p->zero_num;
>               p->pages->num = 0;
>               p->pages->block = NULL;
>               p->sent_bytes += p->packet_len;;
> @@ -753,7 +768,8 @@ out:
>       qemu_mutex_unlock(&p->mutex);
>   
>       rcu_unregister_thread();
> -    trace_multifd_send_thread_end(p->id, p->num_packets, p->total_normal_pages);
> +    trace_multifd_send_thread_end(p->id, p->num_packets, p->total_normal_pages,
> +                                  p->total_zero_pages);
>   
>       return NULL;
>   }
> @@ -938,6 +954,7 @@ int multifd_save_setup(Error **errp)
>           p->normal = g_new0(ram_addr_t, page_count);
>           p->page_size = qemu_target_page_size();
>           p->page_count = page_count;
> +        p->zero = g_new0(ram_addr_t, page_count);
>   
>           if (migrate_use_zero_copy_send()) {
>               p->write_flags = QIO_CHANNEL_WRITE_FLAG_ZERO_COPY;
> @@ -1046,6 +1063,8 @@ int multifd_load_cleanup(Error **errp)
>           p->iov = NULL;
>           g_free(p->normal);
>           p->normal = NULL;
> +        g_free(p->zero);
> +        p->zero = NULL;
>           multifd_recv_state->ops->recv_cleanup(p);
>       }
>       qemu_sem_destroy(&multifd_recv_state->sem_sync);
> @@ -1116,13 +1135,14 @@ static void *multifd_recv_thread(void *opaque)
>               break;
>           }
>   
> -        trace_multifd_recv(p->id, p->packet_num, p->normal_num, p->flags,
> -                           p->next_packet_size);
> +        trace_multifd_recv(p->id, p->packet_num, p->normal_num, p->zero_num,
> +                           p->flags, p->next_packet_size);
>           sync_needed = p->flags & MULTIFD_FLAG_SYNC;
>           /* recv methods don't know how to handle the SYNC flag */
>           p->flags &= ~MULTIFD_FLAG_SYNC;
>           p->num_packets++;
>           p->total_normal_pages += p->normal_num;
> +        p->total_normal_pages += p->zero_num;

Hi, Juan:

If I understand correctly, it should be "p->total_zero_pages += 
p->zero_num; ".

By the way, This patch seems to greatly improve the performance of zero 
page checking,  but it seems that there has been no new update in the 
past two months. I want to know when it will be merged into master?


