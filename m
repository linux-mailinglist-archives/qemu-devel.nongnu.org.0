Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197ED692016
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:49:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQTlc-0003er-9K; Fri, 10 Feb 2023 08:48:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQTla-0003eg-48
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:48:42 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQTlY-0001Am-8E
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:48:41 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso6350613wms.0
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 05:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=op9b6sP3Yz5GjV3MB7fNh/o6WU8jC3ApZ83rpCwrK2U=;
 b=FogZ2xiYX1XfCV1YZqxvpOdPym+gKKjR9QUwSh6aZHaIcbFOvYTahyyW2E+vH4oo3m
 EUpQC5w1mPHFBq5ItRkQPcESMPkF0ilytJnJxBTOsoS8Ij+eoO5I9aJSlDqffPQW68bt
 h4IRLowP3wsJ9k5X5rU9KLC2CqfrjVzRhlr70ll3iI5j0bz29rp2SfOXRZfTKDgdZghu
 3TcoagQhq72YbnX+AUYCt1PyR+lvOINs9LXhW1tKmVxBNYHYDKSv4upCTYqdohaulJUw
 a80PpemFRjEmO5u4lrGZ11ysMZ4MCqZkq6n3KXJnHAavYa3Fn5rHNSffnMNp9xu+ucRY
 EHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=op9b6sP3Yz5GjV3MB7fNh/o6WU8jC3ApZ83rpCwrK2U=;
 b=oyT2p9/Fy3lC0Wp8w10inIosL/C6A0A3Ur1GdmxIYljr0+z2Nv7ABJN6XHEjP26D2/
 DR1lG34aDjSHXfQqkPiDm1TZlh28nVfjfDkNnT8KsEoyM/u9sK36cQOidPtYlz6Sz2cU
 RB3xHhU47bhP1Xcb+/I8hLz/BuAviVMbI7/L2XlbQE85XSvBd8xtWst0EG+2Y0y23K6I
 McaDXC7mpoTz2deO8el+f8jS43OsF14Jrbj77HCaHSNWsCysdnGB0pi6YyPnkFACAxI0
 xlr3l9Uu79uneDIEoR1oY8ieYEf3yvYrN95LsKkpZz/2ya66d3X4gAzBkn9YKRxLMLVw
 aEQg==
X-Gm-Message-State: AO0yUKUiVONqKF3nFkVCjO4NpJJ3vxujB6GchgLm9AA4T/4mZNTymDrL
 GMbxs1wp1SiNCxhYFmTbXfE=
X-Google-Smtp-Source: AK7set9Jd9okk7waDZcz2SjKpbf1O33AzYPti7HCD6Ln+msBnFXSZ23Voc/Tvs1+BtuFeHMB8ZCscA==
X-Received: by 2002:a05:600c:708:b0:3df:db2f:66a with SMTP id
 i8-20020a05600c070800b003dfdb2f066amr12489412wmn.31.1676036918159; 
 Fri, 10 Feb 2023 05:48:38 -0800 (PST)
Received: from [192.168.15.58] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c3b9300b003daf7721bb3sm8901614wms.12.2023.02.10.05.48.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 05:48:37 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <af406f1b-4da0-991f-2da6-ec7e5b487455@xen.org>
Date: Fri, 10 Feb 2023 13:48:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 32/59] hw/xen: Implement EVTCHNOP_bind_virq
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230201143148.1744093-1-dwmw2@infradead.org>
 <20230201143148.1744093-33-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-33-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 01/02/2023 14:31, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Add the array of virq ports to each vCPU so that we can deliver timers,
> debug ports, etc. Global virqs are allocated against vCPU 0 initially,
> but can be migrated to other vCPUs (when we implement that).
> 
> The kernel needs to know about VIRQ_TIMER in order to accelerate timers,
> so tell it via KVM_XEN_VCPU_ATTR_TYPE_TIMER. Also save/restore the value
> of the singleshot timer across migration, as the kernel will handle the
> hypercalls automatically now.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c  | 85 ++++++++++++++++++++++++++++++++++++
>   hw/i386/kvm/xen_evtchn.h  |  2 +
>   include/sysemu/kvm_xen.h  |  1 +
>   target/i386/cpu.h         |  4 ++
>   target/i386/kvm/xen-emu.c | 91 +++++++++++++++++++++++++++++++++++++++
>   target/i386/machine.c     |  2 +
>   6 files changed, 185 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>

... with one suggestion...

> diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
> index deea7de027..da2f5711dd 100644
> --- a/hw/i386/kvm/xen_evtchn.c
> +++ b/hw/i386/kvm/xen_evtchn.c
> @@ -244,6 +244,11 @@ static bool valid_port(evtchn_port_t port)
>       }
>   }
>   
> +static bool valid_vcpu(uint32_t vcpu)
> +{
> +    return !!qemu_get_cpu(vcpu);
> +}
> +
>   int xen_evtchn_status_op(struct evtchn_status *status)
>   {
>       XenEvtchnState *s = xen_evtchn_singleton;
> @@ -494,6 +499,43 @@ static void free_port(XenEvtchnState *s, evtchn_port_t port)
>       clear_port_pending(s, port);
>   }
>   
> +static int allocate_port(XenEvtchnState *s, uint32_t vcpu, uint16_t type,
> +                         uint16_t val, evtchn_port_t *port)
> +{
> +    evtchn_port_t p = 1;
> +
> +    for (p = 1; valid_port(p); p++) {
> +        if (s->port_table[p].type == EVTCHNSTAT_closed) {
> +            s->port_table[p].vcpu = vcpu;
> +            s->port_table[p].type = type;
> +            s->port_table[p].type_val = val;

It'd be neater to use a structured initializer to create a port_table 
entry on stack and then do a single assignment.


