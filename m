Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4DC44D5FC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:40:58 +0100 (CET)
Received: from localhost ([::1]:48912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml8Ru-00088i-2u
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:40:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ml8Po-0005Vu-9M
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:38:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ml8Ph-0006xH-Hb
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:38:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636630720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BeEMn3XRyoxAotZLHbBLdwGsYPn3fVTVofhN37DrKSw=;
 b=HXiW6mcyvdW7+uItvS22UQOAWG8B2IdQ9JOlz+wCBET/hQh1p1l5nS9pHuUio6XVJSEL2N
 yW/StmCJc4bpCxf82L4S4tyIwbSRvWNNsed2RMQvLgYBUzrIKrq51LXyXNKcmtc8yjQ/AP
 jSLimaHU6vuBbt626SAr4/b+AlStQQs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-opSM3dYOPASoTdLq33fSTw-1; Thu, 11 Nov 2021 06:38:39 -0500
X-MC-Unique: opSM3dYOPASoTdLq33fSTw-1
Received: by mail-wm1-f70.google.com with SMTP id
 v10-20020a1cf70a000000b00318203a6bd1so2550753wmh.6
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 03:38:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BeEMn3XRyoxAotZLHbBLdwGsYPn3fVTVofhN37DrKSw=;
 b=pJ/IAxQsr1ZY/AKTMHGh0MomZpQFR0pwIZJawMtU9gowrIj+OXZydTjVLH/Z++iYnB
 uh2dgShLRcZWdyyydEd6PqTPV7klg6bRVsa/e2BkTCgYCcemVXsJMxb2sh/MYjWdRRhB
 qziOkzyw3mGhVXRTCb/UZLPIFfvt+I2m5lgiFuAx00d0j24LKin2+y7xELSlEx+PxW6O
 eRsZXbM8k3/WRu26qhOMuXCUkaUOoDJU1f4/taqUQDl+WrQsNltlbpF5jvLkQx8yj1Rk
 FSED6hb91+mZ/cxRUiTDNA2yXtGEb2EjZV3wqBJyU0vdfKUFxRccv2eb8vP4jNNQhJXy
 EwcA==
X-Gm-Message-State: AOAM5314gWWVi1n3iS9IjenzxIZQ4aKlCpw7RYF9ieXxU6k6KzVf3liH
 cAUv5Zbkfqo3CI5/JRclCg8WcGRp2+spE9Mt2ycJDeTRJlkqu7idEq4mIBbj9Kpn+tX273Rh+XN
 P2GB6knUS1iZeF4gZZNjyczw2v9743XA+ljV71csvfM3gX+BMFjLtKQeTsate1pJQ
X-Received: by 2002:a5d:460d:: with SMTP id t13mr7964497wrq.44.1636630718015; 
 Thu, 11 Nov 2021 03:38:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUoSqfTU/ZcEmzjdopzlRWf+lRZQH8SzhJJvRrR6UbqttU6h+yPLNs3tXsMgATW6X+jMxfSA==
X-Received: by 2002:a5d:460d:: with SMTP id t13mr7964464wrq.44.1636630717701; 
 Thu, 11 Nov 2021 03:38:37 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id c79sm2683064wme.43.2021.11.11.03.38.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 03:38:37 -0800 (PST)
Message-ID: <0063585f-e3e2-dc62-5d85-3864e992c953@redhat.com>
Date: Thu, 11 Nov 2021 12:38:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/5] gdbstub: reject unsupported flags in
 handle_set_qemu_sstep
To: qemu-devel@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>
References: <20211111110604.207376-1-pbonzini@redhat.com>
 <20211111110604.207376-4-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211111110604.207376-4-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, mlevitsk@redhat.com, cohuck@redhat.com,
 alex.bennee@linaro.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 12:06, Paolo Bonzini wrote:
> From: Maxim Levitsky <mlevitsk@redhat.com>
> 
> handle_query_qemu_sstepbits is reporting NOIRQ and NOTIMER bits
> even if they are not supported (as is the case with record/replay).
> Instead, store the supported singlestep flags and reject
> any unsupported bits in handle_set_qemu_sstep.  This removes
> the need for the get_sstep_flags() wrapper.
> 
> While at it, move the variables in GDBState, instead of using
> global variables.
> 
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> [Extracted from Maxim's patch into a separate commit. - Paolo]
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  gdbstub.c | 73 +++++++++++++++++++++++++++++++++++--------------------
>  1 file changed, 47 insertions(+), 26 deletions(-)

>  static void init_gdbserver_state(void)
> @@ -399,6 +382,24 @@ static void init_gdbserver_state(void)
>      gdbserver_state.str_buf = g_string_new(NULL);
>      gdbserver_state.mem_buf = g_byte_array_sized_new(MAX_PACKET_LENGTH);
>      gdbserver_state.last_packet = g_byte_array_sized_new(MAX_PACKET_LENGTH + 4);

Simpler:

 gdbserver_state.supported_sstep_flags = SSTEP_ENABLE;

> +    /*
> +     * In replay mode all events written into the log should be replayed.
> +     * That is why NOIRQ flag is removed in this mode.
> +     */

 if (replay_mode == REPLAY_MODE_NONE) {
   gdbserver_state.supported_sstep_flags |= SSTEP_NOIRQ | SSTEP_NOTIMER;
 }

> +    if (replay_mode != REPLAY_MODE_NONE) {
> +        gdbserver_state.supported_sstep_flags = SSTEP_ENABLE;
> +    } else {
> +        gdbserver_state.supported_sstep_flags =
> +            SSTEP_ENABLE | SSTEP_NOIRQ | SSTEP_NOTIMER;
> +    }
> +
> +    /*
> +     * By default use no IRQs and no timers while single stepping so as to
> +     * make single stepping like an ICE HW step.
> +     */
> +    gdbserver_state.sstep_flags = gdbserver_state.supported_sstep_flags;
> +
>  }

>  static void handle_set_qemu_sstep(GArray *params, void *user_ctx)
>  {
> +    int new_sstep_flags;
> +
>      if (!params->len) {
>          return;
>      }
>  
> -    sstep_flags = get_param(params, 0)->val_ul;
> +    new_sstep_flags = get_param(params, 0)->val_ul;
> +
> +    if (new_sstep_flags  & ~gdbserver_state.supported_sstep_flags) {
> +        put_packet("E22");
> +        return;
> +    }

Please does this change in a separate patch, after moving
to GDBState.

> +    gdbserver_state.sstep_flags = new_sstep_flags;
>      put_packet("OK");
>  }


