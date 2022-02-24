Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D14C34C31B5
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 17:43:49 +0100 (CET)
Received: from localhost ([::1]:44958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNHDY-0001Qd-UT
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 11:43:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nNH6h-0002Un-Bq
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 11:36:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nNH6X-0008Q0-0a
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 11:36:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645720592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HWIJVkUliOUlh14UP8quJV2gETNTjXNGL6XQ9c3JYnQ=;
 b=bSYPm9QzIMVW2+PhDMSC95IN4GVRaGMIyCiIkKhtf4XaurPLxvnPLiQKvW6v1FgiSLn5o5
 5ndZBdGl+QULiFvvZiceuC1ef5xA5UwhEy6V0Ku7i59YsbZLYmI0Ux/KM55715ayk46fQQ
 opKc5TUQPqdqlutRjDAEr7V1Nzq2Pd8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-_LzyC_10OreC9Hxnu8_Ebw-1; Thu, 24 Feb 2022 11:36:31 -0500
X-MC-Unique: _LzyC_10OreC9Hxnu8_Ebw-1
Received: by mail-wr1-f72.google.com with SMTP id
 p9-20020adf9589000000b001e333885ac1so116734wrp.10
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 08:36:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HWIJVkUliOUlh14UP8quJV2gETNTjXNGL6XQ9c3JYnQ=;
 b=TUrmmQonOXX3SPu8UEUxzFI+YAlrdgCp91rvAx9d0tkgB+t+p+fQR97nn046G/Lnqn
 c+8sqhjj7k0AI3wIclYeE5YGUGe5TNpRGP9S7PkZ4epszpl8edcjmyYg/FHmhioho4yp
 0YtlinetbMHPeT4ofakHlUzK9wqvjN85I36KZzoZlRpxjy86kU0wANhPSd16wpMP+Zym
 y8hW817GJOy4GEG8Tfh/rnO5DQu9S/ZuqNm+YGBYWcWFMbXJx+kXDJmt4TfTJq07q3YW
 wfKuDaUuY3sipW5QF9ssv+sn217eqvxIC/IGMt7D2bv0XZYtqD+3I58J5NRC9L55Pp0X
 L3wA==
X-Gm-Message-State: AOAM530DrAUbxaMcfPeNz4UcDhvWs6YOhYE+AfYRE+Gf2VZI6+FTK+8e
 OH7YQhd+sPeKW3getdefSHSKY4VhlvLd7jS9ISJc0W33ZZzmTjlKk3nGNx46iB9jbs6zYrwWzcR
 j5dphuMRUy1/nidM=
X-Received: by 2002:a5d:47cc:0:b0:1e8:50e2:94cd with SMTP id
 o12-20020a5d47cc000000b001e850e294cdmr2885311wrc.34.1645720589654; 
 Thu, 24 Feb 2022 08:36:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkbwD683Y1V2geymTDVLyMlSYbIchrdjJgf8LMzo/0IWLKno5Hn1mElrDjnvdPF4xm3FeVuw==
X-Received: by 2002:a5d:47cc:0:b0:1e8:50e2:94cd with SMTP id
 o12-20020a5d47cc000000b001e850e294cdmr2885288wrc.34.1645720589262; 
 Thu, 24 Feb 2022 08:36:29 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id p11sm3361440wrr.16.2022.02.24.08.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 08:36:28 -0800 (PST)
Message-ID: <5e3472f7-1f49-e0cd-75a7-4356ccd26100@redhat.com>
Date: Thu, 24 Feb 2022 17:36:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 3/4] hyperv: Add support to process syndbg commands
To: Jon Doron <arilou@gmail.com>, qemu-devel@nongnu.org
References: <20220216102500.692781-1-arilou@gmail.com>
 <20220216102500.692781-4-arilou@gmail.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20220216102500.692781-4-arilou@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: pbonzini@redhat.com, vkuznets@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 16/02/2022 11:24, Jon Doron wrote:
> SynDbg commands can come from two different flows:
> 1. Hypercalls, in this mode the data being sent is fully
>    encapsulated network packets.
> 2. SynDbg specific MSRs, in this mode only the data that needs to be
>    transfered is passed.
> 
> Signed-off-by: Jon Doron <arilou@gmail.com>
> ---
>  docs/hyperv.txt               |  15 +++
>  hw/hyperv/hyperv.c            | 243 ++++++++++++++++++++++++++++++++++
>  include/hw/hyperv/hyperv.h    |  58 ++++++++
>  target/i386/cpu.c             |   2 +
>  target/i386/cpu.h             |   7 +
>  target/i386/kvm/hyperv-stub.c |   6 +
>  target/i386/kvm/hyperv.c      |  52 +++++++-
>  target/i386/kvm/kvm.c         |  76 ++++++++++-
>  8 files changed, 451 insertions(+), 8 deletions(-)
> 
> diff --git a/docs/hyperv.txt b/docs/hyperv.txt
> index 0417c183a3..33588a0396 100644
> --- a/docs/hyperv.txt
> +++ b/docs/hyperv.txt
> @@ -225,6 +225,21 @@ default (WS2016).
>  Note: hv-version-id-* are not enlightenments and thus don't enable Hyper-V
>  identification when specified without any other enlightenments.
>  
> +3.21. hv-syndbg
> +===============
> +Enables Hyper-V synthetic debugger interface, this is a special interface used
> +by Windows Kernel debugger to send the packets through, rather than sending
> +them via serial/network .
> +When enabled, this enlightenment provides additional communication facilities
> +to the guest: SynDbg messages.
> +This new communication is used by Windows Kernel debugger rather than sending
> +packets via serial/network, adding significant performance boost over the other
> +comm channels.
> +This enlightenment requires a VMBus device (-device vmbus-bridge,irq=15)
> +and the follow enlightenments to work:
> +hv-relaxed,hv_time,hv-vapic,hv-vpindex,hv-synic,hv-runtime,hv-stimer
> +
> +
>  4. Supplementary features
>  =========================
>  
> diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
> index aaba6b4901..86d295395e 100644
> --- a/hw/hyperv/hyperv.c
> +++ b/hw/hyperv/hyperv.c
> @@ -704,3 +704,246 @@ uint16_t hyperv_hcall_signal_event(uint64_t param, bool fast)
>      }
>      return HV_STATUS_INVALID_CONNECTION_ID;
>  }
> +
> +static HvSynDbgHandler hv_syndbg_handler;
> +static void *hv_syndbg_context;
> +
> +void hyperv_set_syndbg_handler(HvSynDbgHandler handler, void *context)
> +{
> +    assert(!hv_syndbg_handler);
> +    hv_syndbg_handler = handler;
> +    hv_syndbg_context = context;
> +}
> +
> +uint16_t hyperv_hcall_reset_dbg_session(uint64_t outgpa)
> +{
> +    uint16_t ret;
> +    HvSynDbgMsg msg;
> +    struct hyperv_reset_debug_session_output *reset_dbg_session = NULL;
> +    hwaddr len;
> +
> +    if (!hv_syndbg_handler) {
> +        ret = HV_STATUS_INVALID_HYPERCALL_CODE;
> +        goto cleanup;
> +    }
> +
> +    len = sizeof(*reset_dbg_session);
> +    reset_dbg_session = cpu_physical_memory_map(outgpa, &len, 1);
> +    if (!reset_dbg_session || len < sizeof(*reset_dbg_session)) {
> +        ret = HV_STATUS_INSUFFICIENT_MEMORY;
> +        goto cleanup;
> +    }
> +
> +    msg.type = HV_SYNDBG_MSG_CONNECTION_INFO;
> +    ret = hv_syndbg_handler(hv_syndbg_context, &msg);
> +    if (ret) {
> +        goto cleanup;
> +    }
> +
> +    reset_dbg_session->host_ip = msg.u.connection_info.host_ip;
> +    reset_dbg_session->host_port = msg.u.connection_info.host_port;
> +    /* The following fields are only used as validation for KDVM */
> +    memset(&reset_dbg_session->host_mac, 0,
> +           sizeof(reset_dbg_session->host_mac));
> +    reset_dbg_session->target_ip = msg.u.connection_info.host_ip;
> +    reset_dbg_session->target_port = msg.u.connection_info.host_port;
> +    memset(&reset_dbg_session->target_mac, 0,
> +           sizeof(reset_dbg_session->target_mac));
> +cleanup:
> +    if (reset_dbg_session) {
> +        cpu_physical_memory_unmap(reset_dbg_session,
> +                                  sizeof(*reset_dbg_session), 1, len);
> +    }
> +
> +    return ret;
> +}
> +
> +uint16_t hyperv_hcall_retreive_dbg_data(uint64_t ingpa, uint64_t outgpa,
> +                                        bool fast)
> +{
> +    uint16_t ret;
> +    struct hyperv_retrieve_debug_data_input *debug_data_in = NULL;
> +    struct hyperv_retrieve_debug_data_output *debug_data_out = NULL;
> +    hwaddr in_len, out_len;
> +    HvSynDbgMsg msg;
> +
> +    if (fast || !hv_syndbg_handler) {
> +        ret = HV_STATUS_INVALID_HYPERCALL_CODE;
> +        goto cleanup;
> +    }
> +
> +    in_len = sizeof(*debug_data_in);
> +    debug_data_in = cpu_physical_memory_map(ingpa, &in_len, 0);
> +    if (!debug_data_in || in_len < sizeof(*debug_data_in)) {
> +        ret = HV_STATUS_INSUFFICIENT_MEMORY;
> +        goto cleanup;
> +    }
> +
> +    out_len = sizeof(*debug_data_out);
> +    debug_data_out = cpu_physical_memory_map(outgpa, &out_len, 1);
> +    if (!debug_data_out || out_len < sizeof(*debug_data_out)) {
> +        ret = HV_STATUS_INSUFFICIENT_MEMORY;
> +        goto cleanup;
> +    }
> +
> +    msg.type = HV_SYNDBG_MSG_RECV;
> +    msg.u.recv.buf_gpa = outgpa + sizeof(*debug_data_out);
> +    msg.u.recv.count = TARGET_PAGE_SIZE - sizeof(*debug_data_out);
> +    msg.u.recv.options = debug_data_in->options;
> +    msg.u.recv.timeout = debug_data_in->timeout;
> +    msg.u.recv.is_raw = true;
> +    ret = hv_syndbg_handler(hv_syndbg_context, &msg);
> +    if (ret == HV_STATUS_NO_DATA) {
> +        debug_data_out->retrieved_count = 0;
> +        debug_data_out->remaining_count = debug_data_in->count;
> +        goto cleanup;
> +    } else if (ret != HV_STATUS_SUCCESS) {
> +        goto cleanup;
> +    }
> +
> +    debug_data_out->retrieved_count = msg.u.recv.retrieved_count;
> +    debug_data_out->remaining_count =
> +        debug_data_in->count - msg.u.recv.retrieved_count;
> +cleanup:
> +    if (debug_data_out) {
> +        cpu_physical_memory_unmap(debug_data_out, sizeof(*debug_data_out), 1,
> +                                  out_len);
> +    }
> +
> +    if (debug_data_in) {
> +        cpu_physical_memory_unmap(debug_data_in, sizeof(*debug_data_in), 0,
> +                                  in_len);
> +    }
> +
> +    return ret;
> +}
> +
> +uint16_t hyperv_hcall_post_dbg_data(uint64_t ingpa, uint64_t outgpa, bool fast)
> +{
> +    uint16_t ret;
> +    struct hyperv_post_debug_data_input *post_data_in = NULL;
> +    struct hyperv_post_debug_data_output *post_data_out = NULL;
> +    hwaddr in_len, out_len;
> +    HvSynDbgMsg msg;
> +
> +    if (fast || !hv_syndbg_handler) {
> +        ret = HV_STATUS_INVALID_HYPERCALL_CODE;
> +        goto cleanup;
> +    }
> +
> +    in_len = sizeof(*post_data_in);
> +    post_data_in = cpu_physical_memory_map(ingpa, &in_len, 0);
> +    if (!post_data_in || in_len < sizeof(*post_data_in)) {
> +        ret = HV_STATUS_INSUFFICIENT_MEMORY;
> +        goto cleanup;
> +    }
> +
> +    if (post_data_in->count > TARGET_PAGE_SIZE - sizeof(*post_data_in)) {
> +        ret = HV_STATUS_INVALID_PARAMETER;
> +        goto cleanup;
> +    }
> +
> +    out_len = sizeof(*post_data_out);
> +    post_data_out = cpu_physical_memory_map(outgpa, &out_len, 1);
> +    if (!post_data_out || out_len < sizeof(*post_data_out)) {
> +        ret = HV_STATUS_INSUFFICIENT_MEMORY;
> +        goto cleanup;
> +    }
> +
> +    msg.type = HV_SYNDBG_MSG_SEND;
> +    msg.u.send.buf_gpa = ingpa + sizeof(*post_data_in);
> +    msg.u.send.count = post_data_in->count;
> +    msg.u.send.is_raw = true;
> +    ret = hv_syndbg_handler(hv_syndbg_context, &msg);
> +    if (ret != HV_STATUS_SUCCESS) {
> +        goto cleanup;
> +    }
> +
> +    post_data_out->pending_count = msg.u.send.pending_count;
> +    ret = post_data_out->pending_count ? HV_STATUS_INSUFFICIENT_BUFFERS :
> +                                         HV_STATUS_SUCCESS;
> +cleanup:
> +    if (post_data_out) {
> +        cpu_physical_memory_unmap(post_data_out,
> +                                  sizeof(*post_data_out), 1, out_len);
> +    }
> +
> +    if (post_data_in) {
> +        cpu_physical_memory_unmap(post_data_in,
> +                                  sizeof(*post_data_in), 0, in_len);
> +    }
> +
> +    return ret;
> +}
> +
> +uint32_t hyperv_syndbg_send(uint64_t ingpa, uint32_t count)
> +{
> +    HvSynDbgMsg msg;
> +
> +    if (!hv_syndbg_handler) {
> +        return HV_SYNDBG_STATUS_INVALID;
> +    }
> +
> +    msg.type = HV_SYNDBG_MSG_SEND;
> +    msg.u.send.buf_gpa = ingpa;
> +    msg.u.send.count = count;
> +    msg.u.send.is_raw = false;
> +    if (hv_syndbg_handler(hv_syndbg_context, &msg)) {
> +        return HV_SYNDBG_STATUS_INVALID;
> +    }
> +
> +    return HV_SYNDBG_STATUS_SEND_SUCCESS;
> +}
> +
> +uint32_t hyperv_syndbg_recv(uint64_t ingpa, uint32_t count)
> +{
> +    uint16_t ret;
> +    HvSynDbgMsg msg;
> +
> +    if (!hv_syndbg_handler) {
> +        return HV_SYNDBG_STATUS_INVALID;
> +    }
> +
> +    msg.type = HV_SYNDBG_MSG_RECV;
> +    msg.u.recv.buf_gpa = ingpa;
> +    msg.u.recv.count = count;
> +    msg.u.recv.options = 0;
> +    msg.u.recv.timeout = 0;
> +    msg.u.recv.is_raw = false;
> +    ret = hv_syndbg_handler(hv_syndbg_context, &msg);
> +    if (ret != HV_STATUS_SUCCESS) {
> +        return 0;
> +    }
> +
> +    return HV_SYNDBG_STATUS_SET_SIZE(HV_SYNDBG_STATUS_RECV_SUCCESS,
> +                                     msg.u.recv.retrieved_count);
> +}
> +
> +void hyperv_syndbg_set_pending_page(uint64_t ingpa)
> +{
> +    HvSynDbgMsg msg;
> +
> +    if (!hv_syndbg_handler) {
> +        return;
> +    }
> +
> +    msg.type = HV_SYNDBG_MSG_SET_PENDING_PAGE;
> +    msg.u.pending_page.buf_gpa = ingpa;
> +    hv_syndbg_handler(hv_syndbg_context, &msg);
> +}
> +
> +uint64_t hyperv_syndbg_query_options(void)
> +{
> +    HvSynDbgMsg msg;
> +
> +    if (!hv_syndbg_handler) {
> +        return 0;
> +    }
> +
> +    msg.type = HV_SYNDBG_MSG_QUERY_OPTIONS;
> +    if (hv_syndbg_handler(hv_syndbg_context, &msg) != HV_STATUS_SUCCESS) {
> +        return 0;
> +    }
> +
> +    return msg.u.query_options.options;
> +}
> diff --git a/include/hw/hyperv/hyperv.h b/include/hw/hyperv/hyperv.h
> index a63ee0003c..015c3524b1 100644
> --- a/include/hw/hyperv/hyperv.h
> +++ b/include/hw/hyperv/hyperv.h
> @@ -81,4 +81,62 @@ void hyperv_synic_update(CPUState *cs, bool enable,
>                           hwaddr msg_page_addr, hwaddr event_page_addr);
>  bool hyperv_is_synic_enabled(void);
>  
> +/*
> + * Process HVCALL_RESET_DEBUG_SESSION hypercall.
> + */
> +uint16_t hyperv_hcall_reset_dbg_session(uint64_t outgpa);
> +/*
> + * Process HVCALL_RETREIVE_DEBUG_DATA hypercall.
> + */
> +uint16_t hyperv_hcall_retreive_dbg_data(uint64_t ingpa, uint64_t outgpa,
> +                                        bool fast);
> +/*
> + * Process HVCALL_POST_DEBUG_DATA hypercall.
> + */
> +uint16_t hyperv_hcall_post_dbg_data(uint64_t ingpa, uint64_t outgpa, bool fast);
> +
> +uint32_t hyperv_syndbg_send(uint64_t ingpa, uint32_t count);
> +uint32_t hyperv_syndbg_recv(uint64_t ingpa, uint32_t count);
> +void hyperv_syndbg_set_pending_page(uint64_t ingpa);
> +uint64_t hyperv_syndbg_query_options(void);
> +
> +typedef enum HvSynthDbgMsgType {
> +    HV_SYNDBG_MSG_CONNECTION_INFO,
> +    HV_SYNDBG_MSG_SEND,
> +    HV_SYNDBG_MSG_RECV,
> +    HV_SYNDBG_MSG_SET_PENDING_PAGE,
> +    HV_SYNDBG_MSG_QUERY_OPTIONS
> +} HvDbgSynthMsgType;
> +
> +typedef struct HvSynDbgMsg {
> +    HvDbgSynthMsgType type;
> +    union {
> +        struct {
> +            uint32_t host_ip;
> +            uint16_t host_port;
> +        } connection_info;
> +        struct {
> +            uint64_t buf_gpa;
> +            uint32_t count;
> +            uint32_t pending_count;
> +            bool is_raw;
> +        } send;
> +        struct {
> +            uint64_t buf_gpa;
> +            uint32_t count;
> +            uint32_t options;
> +            uint64_t timeout;
> +            uint32_t retrieved_count;
> +            bool is_raw;
> +        } recv;
> +        struct {
> +            uint64_t buf_gpa;
> +        } pending_page;
> +        struct {
> +            uint64_t options;
> +        } query_options;
> +    } u;
> +} HvSynDbgMsg;
> +typedef uint16_t (*HvSynDbgHandler)(void *context, HvSynDbgMsg *msg);
> +void hyperv_set_syndbg_handler(HvSynDbgHandler handler, void *context);
>  #endif
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index aa9e636800..9529a6389a 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6841,6 +6841,8 @@ static Property x86_cpu_properties[] = {
>                        HYPERV_FEAT_AVIC, 0),
>      DEFINE_PROP_ON_OFF_AUTO("hv-no-nonarch-coresharing", X86CPU,
>                              hyperv_no_nonarch_cs, ON_OFF_AUTO_OFF),
> +    DEFINE_PROP_BIT64("hv-syndbg", X86CPU, hyperv_features,
> +                      HYPERV_FEAT_SYNDBG, 0),
>      DEFINE_PROP_BOOL("hv-passthrough", X86CPU, hyperv_passthrough, false),
>      DEFINE_PROP_BOOL("hv-enforce-cpuid", X86CPU, hyperv_enforce_cpuid, false),
>  
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 9911d7c871..56e0317924 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1060,6 +1060,7 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
>  #define HYPERV_FEAT_IPI                 13
>  #define HYPERV_FEAT_STIMER_DIRECT       14
>  #define HYPERV_FEAT_AVIC                15
> +#define HYPERV_FEAT_SYNDBG              16
>  
>  #ifndef HYPERV_SPINLOCK_NEVER_NOTIFY
>  #define HYPERV_SPINLOCK_NEVER_NOTIFY             0xFFFFFFFF
> @@ -1560,6 +1561,12 @@ typedef struct CPUX86State {
>      uint64_t msr_hv_hypercall;
>      uint64_t msr_hv_guest_os_id;
>      uint64_t msr_hv_tsc;
> +    uint64_t msr_hv_syndbg_control;
> +    uint64_t msr_hv_syndbg_status;
> +    uint64_t msr_hv_syndbg_send_page;
> +    uint64_t msr_hv_syndbg_recv_page;
> +    uint64_t msr_hv_syndbg_pending_page;
> +    uint64_t msr_hv_syndbg_options;
>  
>      /* Per-VCPU HV MSRs */
>      uint64_t msr_hv_vapic;
> diff --git a/target/i386/kvm/hyperv-stub.c b/target/i386/kvm/hyperv-stub.c
> index 0028527e79..778ed782e6 100644
> --- a/target/i386/kvm/hyperv-stub.c
> +++ b/target/i386/kvm/hyperv-stub.c
> @@ -27,6 +27,12 @@ int kvm_hv_handle_exit(X86CPU *cpu, struct kvm_hyperv_exit *exit)
>          return 0;
>      case KVM_EXIT_HYPERV_HCALL:
>          exit->u.hcall.result = HV_STATUS_INVALID_HYPERCALL_CODE;
> +        return 0;
> +    case KVM_EXIT_HYPERV_SYNDBG:
> +        if (!hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNDBG)) {
> +            return -1;
> +        }
> +
>          return 0;
>      default:
>          return -1;
> diff --git a/target/i386/kvm/hyperv.c b/target/i386/kvm/hyperv.c
> index 26efc1e0e6..9026ef3a81 100644
> --- a/target/i386/kvm/hyperv.c
> +++ b/target/i386/kvm/hyperv.c
> @@ -81,20 +81,66 @@ int kvm_hv_handle_exit(X86CPU *cpu, struct kvm_hyperv_exit *exit)
>      case KVM_EXIT_HYPERV_HCALL: {
>          uint16_t code = exit->u.hcall.input & 0xffff;
>          bool fast = exit->u.hcall.input & HV_HYPERCALL_FAST;
> -        uint64_t param = exit->u.hcall.params[0];
> +        uint64_t in_param = exit->u.hcall.params[0];
> +        uint64_t out_param = exit->u.hcall.params[1];
>  
>          switch (code) {
>          case HV_POST_MESSAGE:
> -            exit->u.hcall.result = hyperv_hcall_post_message(param, fast);
> +            exit->u.hcall.result = hyperv_hcall_post_message(in_param, fast);
>              break;
>          case HV_SIGNAL_EVENT:
> -            exit->u.hcall.result = hyperv_hcall_signal_event(param, fast);
> +            exit->u.hcall.result = hyperv_hcall_signal_event(in_param, fast);
> +            break;
> +        case HV_POST_DEBUG_DATA:
> +            exit->u.hcall.result =
> +                hyperv_hcall_post_dbg_data(in_param, out_param, fast);
> +            break;
> +        case HV_RETRIEVE_DEBUG_DATA:
> +            exit->u.hcall.result =
> +                hyperv_hcall_retreive_dbg_data(in_param, out_param, fast);
> +            break;
> +        case HV_RESET_DEBUG_SESSION:
> +            exit->u.hcall.result =
> +                hyperv_hcall_reset_dbg_session(out_param);
>              break;
>          default:
>              exit->u.hcall.result = HV_STATUS_INVALID_HYPERCALL_CODE;
>          }
>          return 0;
>      }
> +
> +    case KVM_EXIT_HYPERV_SYNDBG:
> +        if (!hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNDBG)) {
> +            return -1;
> +        }
> +
> +        switch (exit->u.syndbg.msr) {
> +        case HV_X64_MSR_SYNDBG_CONTROL: {
> +            uint64_t control = exit->u.syndbg.control;
> +            env->msr_hv_syndbg_control = control;
> +            env->msr_hv_syndbg_send_page = exit->u.syndbg.send_page;
> +            env->msr_hv_syndbg_recv_page = exit->u.syndbg.recv_page;
> +            exit->u.syndbg.status = HV_STATUS_SUCCESS;
> +            if (control & HV_SYNDBG_CONTROL_SEND) {
> +                exit->u.syndbg.status =
> +                    hyperv_syndbg_send(env->msr_hv_syndbg_send_page,
> +                            HV_SYNDBG_CONTROL_SEND_SIZE(control));
> +            } else if (control & HV_SYNDBG_CONTROL_RECV) {
> +                exit->u.syndbg.status =
> +                    hyperv_syndbg_recv(env->msr_hv_syndbg_recv_page,
> +                            TARGET_PAGE_SIZE);
> +            }
> +            break;
> +        }
> +        case HV_X64_MSR_SYNDBG_PENDING_BUFFER:
> +            env->msr_hv_syndbg_pending_page = exit->u.syndbg.pending_page;
> +            hyperv_syndbg_set_pending_page(env->msr_hv_syndbg_pending_page);
> +            break;
> +        default:
> +            return -1;
> +        }
> +
> +        return 0;
>      default:
>          return -1;
>      }
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 2c8feb4a6f..1c6f3b53af 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -102,6 +102,7 @@ static bool has_msr_hv_synic;
>  static bool has_msr_hv_stimer;
>  static bool has_msr_hv_frequencies;
>  static bool has_msr_hv_reenlightenment;
> +static bool has_msr_hv_syndbg_options;
>  static bool has_msr_xss;
>  static bool has_msr_umwait;
>  static bool has_msr_spec_ctrl;
> @@ -932,6 +933,14 @@ static struct {
>               .bits = HV_DEPRECATING_AEOI_RECOMMENDED}
>          }
>      },
> +    [HYPERV_FEAT_SYNDBG] = {
> +        .desc = "Enable synthetic kernel debugger channel (hv-syndbg)",
> +        .flags = {
> +            {.func = HV_CPUID_FEATURES, .reg = R_EDX,
> +             .bits = HV_FEATURE_DEBUG_MSRS_AVAILABLE}
> +        },
> +        .dependencies = BIT(HYPERV_FEAT_SYNIC) | BIT(HYPERV_FEAT_RELAXED)
> +    },
>  };
>  
>  static struct kvm_cpuid2 *try_get_hv_cpuid(CPUState *cs, int max,
> @@ -972,8 +981,8 @@ static struct kvm_cpuid2 *try_get_hv_cpuid(CPUState *cs, int max,
>  static struct kvm_cpuid2 *get_supported_hv_cpuid(CPUState *cs)
>  {
>      struct kvm_cpuid2 *cpuid;
> -    /* 0x40000000..0x40000005, 0x4000000A, 0x40000080..0x40000080 leaves */
> -    int max = 10;
> +    /* 0x40000000..0x40000005, 0x4000000A, 0x40000080..0x40000082 leaves */
> +    int max = 11;
>      int i;
>      bool do_sys_ioctl;
>  
> @@ -1086,6 +1095,12 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid_legacy(CPUState *cs)
>          entry_feat->eax |= HV_SYNTIMERS_AVAILABLE;
>      }
>  
> +    if (has_msr_hv_syndbg_options) {
> +        entry_feat->edx |= HV_GUEST_DEBUGGING_AVAILABLE;
> +        entry_feat->edx |= HV_FEATURE_DEBUG_MSRS_AVAILABLE;
> +        entry_feat->ebx |= HV_PARTITION_DEBUGGING_ALLOWED;
> +    }
> +
>      if (kvm_check_extension(cs->kvm_state,
>                              KVM_CAP_HYPERV_TLBFLUSH) > 0) {
>          entry_recomm->eax |= HV_REMOTE_TLB_FLUSH_RECOMMENDED;
> @@ -1337,12 +1352,22 @@ static int hyperv_fill_cpuids(CPUState *cs,
>  {
>      X86CPU *cpu = X86_CPU(cs);
>      struct kvm_cpuid_entry2 *c;
> -    uint32_t cpuid_i = 0;
> +    uint32_t signature[3];
> +    uint32_t cpuid_i = 0, max_cpuid_leaf = 0;
> +
> +    max_cpuid_leaf = HV_CPUID_IMPLEMENT_LIMITS;
> +    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
> +        max_cpuid_leaf = MAX(max_cpuid_leaf, HV_CPUID_NESTED_FEATURES);
> +    }
> +
> +    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNDBG)) {
> +        max_cpuid_leaf =
> +            MAX(max_cpuid_leaf, HV_CPUID_SYNDBG_PLATFORM_CAPABILITIES);
> +    }
>  
>      c = &cpuid_ent[cpuid_i++];
>      c->function = HV_CPUID_VENDOR_AND_MAX_FUNCTIONS;
> -    c->eax = hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS) ?
> -        HV_CPUID_NESTED_FEATURES : HV_CPUID_IMPLEMENT_LIMITS;
> +    c->eax = max_cpuid_leaf;
>      c->ebx = cpu->hyperv_vendor_id[0];
>      c->ecx = cpu->hyperv_vendor_id[1];
>      c->edx = cpu->hyperv_vendor_id[2];
> @@ -1421,6 +1446,33 @@ static int hyperv_fill_cpuids(CPUState *cs,
>          c->eax = cpu->hyperv_nested[0];
>      }
>  
> +    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNDBG)) {
> +        c = &cpuid_ent[cpuid_i++];
> +        c->function = HV_CPUID_SYNDBG_VENDOR_AND_MAX_FUNCTIONS;
> +        c->eax = hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS) ?
> +            HV_CPUID_NESTED_FEATURES : HV_CPUID_IMPLEMENT_LIMITS;
> +        memcpy(signature, "Microsoft VS", 12);
> +        c->eax = 0;
> +        c->ebx = signature[0];
> +        c->ecx = signature[1];
> +        c->edx = signature[2];
> +
> +        c = &cpuid_ent[cpuid_i++];
> +        c->function = HV_CPUID_SYNDBG_INTERFACE;
> +        memcpy(signature, "VS#1\0\0\0\0\0\0\0\0", 12);
> +        c->eax = signature[0];
> +        c->ebx = 0;
> +        c->ecx = 0;
> +        c->edx = 0;
> +
> +        c = &cpuid_ent[cpuid_i++];
> +        c->function = HV_CPUID_SYNDBG_PLATFORM_CAPABILITIES;
> +        c->eax = HV_SYNDBG_CAP_ALLOW_KERNEL_DEBUGGING;
> +        c->ebx = 0;
> +        c->ecx = 0;
> +        c->edx = 0;
> +    }
> +
>      return cpuid_i;
>  }
>  
> @@ -2215,6 +2267,9 @@ static int kvm_get_supported_msrs(KVMState *s)
>              case HV_X64_MSR_REENLIGHTENMENT_CONTROL:
>                  has_msr_hv_reenlightenment = true;
>                  break;
> +            case HV_X64_MSR_SYNDBG_OPTIONS:
> +                has_msr_hv_syndbg_options = true;
> +                break;
>              case MSR_IA32_SPEC_CTRL:
>                  has_msr_spec_ctrl = true;
>                  break;
> @@ -3132,6 +3187,11 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
>                  kvm_msr_entry_add(cpu, HV_X64_MSR_TSC_EMULATION_STATUS,
>                                    env->msr_hv_tsc_emulation_status);
>              }
> +            if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNDBG) &&
> +                has_msr_hv_syndbg_options) {
> +                kvm_msr_entry_add(cpu, HV_X64_MSR_SYNDBG_OPTIONS,
> +                                  hyperv_syndbg_query_options());
> +            }
>          }
>          if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VAPIC)) {
>              kvm_msr_entry_add(cpu, HV_X64_MSR_APIC_ASSIST_PAGE,
> @@ -3565,6 +3625,9 @@ static int kvm_get_msrs(X86CPU *cpu)
>          kvm_msr_entry_add(cpu, HV_X64_MSR_TSC_EMULATION_CONTROL, 0);
>          kvm_msr_entry_add(cpu, HV_X64_MSR_TSC_EMULATION_STATUS, 0);
>      }
> +    if (has_msr_hv_syndbg_options) {
> +        kvm_msr_entry_add(cpu, HV_X64_MSR_SYNDBG_OPTIONS, 0);
> +    }
>      if (has_msr_hv_crash) {
>          int j;
>  
> @@ -3851,6 +3914,9 @@ static int kvm_get_msrs(X86CPU *cpu)
>          case HV_X64_MSR_TSC_EMULATION_STATUS:
>              env->msr_hv_tsc_emulation_status = msrs[i].data;
>              break;
> +        case HV_X64_MSR_SYNDBG_OPTIONS:
> +            env->msr_hv_syndbg_options = msrs[i].data;
> +            break;
>          case MSR_MTRRdefType:
>              env->mtrr_deftype = msrs[i].data;
>              break;
> 

Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>


