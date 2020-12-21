Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040612DFC4E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 14:29:38 +0100 (CET)
Received: from localhost ([::1]:58806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krLFp-0006Le-3p
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 08:29:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1krLCB-0004xT-RO
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 08:25:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1krLC6-00056N-PK
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 08:25:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608557145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P+lPXiAL1rTSS5/AHiHxE3G6s4PPGu7F7Esp739Z0X0=;
 b=PmXTBDH8CLo0NzH2DfE+U5asg73Efw4qlf+b5L6qw18GeS5RyEj3AO4yfUHuFrEaR1mhea
 YJRB7FfaXedZHrMBpp5uUQVkFVicybSu2djolv7Kwr0evHFR6oyQ2c8Azs1p+56seBlo0i
 9gz4Tz3ABNF7eFKvckMWHP48EV3udqE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-R5IYl3rcPsCNqXZNc5lsNw-1; Mon, 21 Dec 2020 08:25:43 -0500
X-MC-Unique: R5IYl3rcPsCNqXZNc5lsNw-1
Received: by mail-wr1-f71.google.com with SMTP id w8so8416551wrv.18
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 05:25:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P+lPXiAL1rTSS5/AHiHxE3G6s4PPGu7F7Esp739Z0X0=;
 b=ddmoMOkcG5OIrNje2Edi3gYEMNiy/Zuun8NvsS5l77QUUjY5qJz4a6xn4L5ZEA7CMu
 I8eifNL9a7JA3EctvQGDIsuMXa/ckWyMyOmSR0l37dVvU/ueRLvFsXCT2sH67KACmUZx
 jMzJm7Ki635QhB+Z2d3xH+aY6WVsD+nutot6FZfHXPoV02gzvigMEVBGQPyoKJX9vme8
 216+sDNw9/hfKkROYMlOxu7XeqCv0IubEKkDxYucDp6zXTvlHRH969YScOgPT+hxauUp
 9GL4Gnw9jgEedmclroGjCQUIk4X+/hxk4jnpkITJ+Nu1h5HvN/R+d6lzEPkDB7KKhXL1
 kfTw==
X-Gm-Message-State: AOAM532XWKzYI/iEn1jeCMUTEeNPvi23MbpfuD24aedX0pxt3OressfS
 6bBALLxRTlfTr/kpn66cq7W7FT6AFbw7bLm054g6PUEZ0MMk8sWga8L4H1QYVDq4lBh/gbfMI0f
 12o7eeEumD8ajgWQ=
X-Received: by 2002:a1c:5fd4:: with SMTP id t203mr16129261wmb.15.1608557142234; 
 Mon, 21 Dec 2020 05:25:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwS4zdbPIJuttgyVd890lszMc0dQ64yf3/RVbnjEILkCcWMKHt6/o62at+CoZnkm06RTTpxIg==
X-Received: by 2002:a1c:5fd4:: with SMTP id t203mr16129243wmb.15.1608557141995; 
 Mon, 21 Dec 2020 05:25:41 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id i16sm26247035wrx.89.2020.12.21.05.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 05:25:41 -0800 (PST)
Subject: Re: [PATCH] Docs/RCU: Correct sample code of qatomic_rcu_set
To: Keqian Zhu <zhukeqian1@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20201221121745.27156-1-zhukeqian1@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2acdeb6f-6763-7332-e3f2-6d9cf9acf5ae@redhat.com>
Date: Mon, 21 Dec 2020 14:25:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201221121745.27156-1-zhukeqian1@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.233, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, qemu-arm@nongnu.org, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/12/20 13:17, Keqian Zhu wrote:
> Correct sample code to avoid confusing readers.
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>   docs/devel/rcu.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/devel/rcu.txt b/docs/devel/rcu.txt
> index cdf002edd8..2e6cc607a1 100644
> --- a/docs/devel/rcu.txt
> +++ b/docs/devel/rcu.txt
> @@ -392,7 +392,7 @@ Instead, we store the size of the array with the array itself:
>   
>               /* Removal phase.  */
>               old_array = global_array;
> -            qatomic_rcu_set(&new_array->data, new_array);
> +            qatomic_rcu_set(&global_array, new_array);
>               synchronize_rcu();
>   
>               /* Reclamation phase.  */
> 

Cc: qemu-trivial@nongnu.org
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


