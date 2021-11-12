Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4B444E465
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 11:11:22 +0100 (CET)
Received: from localhost ([::1]:36842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlTWi-0004Zh-K5
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 05:11:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mlTVa-0003i3-Ih
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 05:10:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mlTVY-0007Rr-RZ
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 05:10:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636711807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w98aVl1ip97mF28Ma7KmSO+gINZIB1etkH5xjqxorzo=;
 b=BefUYihbR5/DW2fhdrme02Ow4q+jRhVN6d8hDB498WEG9gkEULIGkkzeDPW+wI0Gk0FtCj
 4+ty0ZRWUBrn4FcDDAoP8/jfISLvJEF2NYbF8L4wmCkOpfZhfYCpIunzl+uy+cj7Sfn5Yl
 EstChe9YbLgI3BbWKqGX7megm/U0L6c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-zdS0mhroNPOJmPpGTmsb8Q-1; Fri, 12 Nov 2021 05:10:03 -0500
X-MC-Unique: zdS0mhroNPOJmPpGTmsb8Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 v17-20020adfedd1000000b0017c5e737b02so1456403wro.18
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 02:10:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=w98aVl1ip97mF28Ma7KmSO+gINZIB1etkH5xjqxorzo=;
 b=KObhhME41Deyp2rKuZAqEVoTvXOjsXZyPYN5A4JHYtG8BMJCWJkjv3JQxJln6k+2xZ
 IqwOpxjuXgTaV3pYo1fMu8Gl7V9aDMME0DghyIFzAx4OteDhPstYq48OlQegOsJ1v0oA
 ac1HY4k3PO08yOggiWB5RQkkkRcMeqQOcmxaWE/CmTmDl9lnNKwZ7Zduxfrr+GfpHKO/
 X8aTMlH1raUyDXWyLEkLpW73dNoTfFYN2pAlkWDn1947L2Foc1aHPPkoHkFRjNKECjho
 yOsFNDUQPSrUMOWdnw25AsAbkJ6Ai4Xrh48GUezwPMctrt06vbhrvaZNeBIv9VdKEr9m
 2z1A==
X-Gm-Message-State: AOAM533yLpJE3UY+FUORSeCW69byEzHe3Iy50ddZAVEz7kC7cgcML5Ek
 e8VJ7p0h/Nku7lABQNDT2W4WH4RFHGzC9uUcqC2WUbUlaG3FaVMhlu2NCM1BPlOWKZ/WQNnHJOf
 lpRaCzKeOR6L/JCw=
X-Received: by 2002:adf:dd46:: with SMTP id u6mr17637943wrm.280.1636711802504; 
 Fri, 12 Nov 2021 02:10:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwoRmcZqi9hwvRP6G29EFGhM+hqhcDjbOw5Db9G/9QsPDuDgjKP9DILFtMylXgyfVSXz4Ywqg==
X-Received: by 2002:adf:dd46:: with SMTP id u6mr17637911wrm.280.1636711802335; 
 Fri, 12 Nov 2021 02:10:02 -0800 (PST)
Received: from [192.168.3.132] (p4ff23f5f.dip0.t-ipconnect.de. [79.242.63.95])
 by smtp.gmail.com with ESMTPSA id
 p27sm5027477wmi.28.2021.11.12.02.10.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 02:10:01 -0800 (PST)
Message-ID: <81cc6f3a-ba15-4278-5481-76206a8a4a13@redhat.com>
Date: Fri, 12 Nov 2021 11:10:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <163662450348.125458.5494710452733592356.stgit@pasha-ThinkPad-X280>
 <163662451431.125458.14945698834107669531.stgit@pasha-ThinkPad-X280>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 2/3] softmmu: fix watchpoint-interrupt races
In-Reply-To: <163662451431.125458.14945698834107669531.stgit@pasha-ThinkPad-X280>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.449, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, alex.bennee@linaro.org,
 peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.11.21 10:55, Pavel Dovgalyuk wrote:
> Watchpoint may be processed in two phases. First one is detecting
> the instruction with target memory access. And the second one is
> executing only one instruction and setting the debug interrupt flag.
> Hardware interrupts can break this sequence when they happen after
> the first watchpoint phase.
> This patch postpones the interrupt request until watchpoint is
> processed.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>  accel/tcg/cpu-exec.c |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index df12452b8f..e4526c2f5e 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -742,6 +742,11 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
>              qemu_mutex_unlock_iothread();
>              return true;
>          }
> +        /* Process watchpoints first, or interrupts will ruin everything */
> +        if (cpu->watchpoint_hit) {
> +            qemu_mutex_unlock_iothread();
> +            return false;
> +        }
>  #if !defined(CONFIG_USER_ONLY)
>          if (replay_mode == REPLAY_MODE_PLAY && !replay_has_interrupt()) {
>              /* Do nothing */
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


