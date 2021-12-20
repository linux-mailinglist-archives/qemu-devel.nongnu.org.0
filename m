Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D9447B1E5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 18:11:17 +0100 (CET)
Received: from localhost ([::1]:59198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzMBw-0004Mh-If
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 12:11:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzKcY-0006qo-5F
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:30:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzKc7-0003Xz-3V
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:30:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640014210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FSlWxrFxgbIzs46smg+Cq7H1vZZIRbhBfGs0BBgLd6s=;
 b=Bhtrn1s+ZYIk6Wlo5JgqUVzFdDlygKCoZgZKVBvrtscF3ix10a5Lg0fQdeNvy9ueI3uJPU
 bBRtuElT14kcZXI5HRj3uxzQf7OdZ8jpwWcRlpQf8Kdy2VwO5UlXPxFOdnPfZvwCyxtdpB
 AbBmlyzzJdnaQlrNRYClzCjRCUSVwQo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-ULIgTI9rMLiE05xPf9PwUA-1; Mon, 20 Dec 2021 08:16:47 -0500
X-MC-Unique: ULIgTI9rMLiE05xPf9PwUA-1
Received: by mail-wm1-f70.google.com with SMTP id
 b75-20020a1c804e000000b0034569bde713so6440272wmd.9
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 05:16:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FSlWxrFxgbIzs46smg+Cq7H1vZZIRbhBfGs0BBgLd6s=;
 b=WeytDPZAwM2xXAAEXo6eOhiB7LXSja3OPkMHdueEmHhOIR4Ed10qm8JGc+r31RYv+Z
 obeHuUtPdJIfSAO4F+XZZgsWLfvRHkvchbKTlXfFe84KLzfxT+oHPr3gz0IKRBFTYDxC
 1En5moG9XWwnAutOW08wi1QAkNy1nC4NK1OUTqgV1cmGiQje+KQCX2v1UyvRl5oUiydl
 Ze78h1Ko7N8HFsW+QSUSEzExFgrUqoKkEgxRgbbXLpZdJowosI96Db3jwMI6Fu7q4E5x
 HPrv/IwbQ+NB70HlWYf27zh01Ao2yQSd3sbA8ETYZ5tZ6ZOFn67krnswip/phcLgb0s2
 6pew==
X-Gm-Message-State: AOAM532katUQndE+kDPMCmgPzzpkNLFrqi+yZfluyNzeRVxHNWQ4ymnV
 R1I49gM1nWGc/QKQxr0qhzhL5qEIUP+mWnvtxwQJXAQ9NjbPsIZHQR1PBmDNvKVlz6IUOnNJa6U
 P12EdSJAijLxM9JM=
X-Received: by 2002:a5d:5849:: with SMTP id i9mr7194748wrf.446.1640006206466; 
 Mon, 20 Dec 2021 05:16:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNNtsVSRnBuHV5HAo4lOhKbApuRi68h9ndkAv4FmLZwfWeWf3yG1dyX8Y0VnXgoCM9cB0KmQ==
X-Received: by 2002:a5d:5849:: with SMTP id i9mr7194612wrf.446.1640006204006; 
 Mon, 20 Dec 2021 05:16:44 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id t12sm1380950wrs.72.2021.12.20.05.16.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 05:16:43 -0800 (PST)
Message-ID: <8327996f-8ed8-22dc-24d5-92b15f6d8b3f@redhat.com>
Date: Mon, 20 Dec 2021 14:16:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] tests/qtest/virtio-net-failover: Use g_random_int()
 instead of g_test_rand_int()
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>
References: <20211220102759.311224-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211220102759.311224-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.608, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 11:27, Thomas Huth wrote:
> g_test_rand_int() must not be called before g_test_init(), otherwise
> the glib will show a "g_rand_int: assertion 'rand != NULL' failed"
> message in the log. So we could change the order here, but actually,
> g_test_rand_int() seems also the wrong choice here, since we're using
> it to create a temporary file name, which certainly should not depend
> on the "--seed" CLI option of the g_test suite. Thus let's use the
> g_random_int() function instead.
> 
> Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/qtest/virtio-net-failover.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


