Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 967CF47B3BB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 20:30:35 +0100 (CET)
Received: from localhost ([::1]:42556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzOMk-000490-8B
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 14:30:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzOJL-00027b-3a
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 14:27:03 -0500
Received: from [2607:f8b0:4864:20::62f] (port=37500
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzOJH-0002ag-Fl
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 14:27:02 -0500
Received: by mail-pl1-x62f.google.com with SMTP id n8so8874265plf.4
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 11:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Cei72ciGbZCpn3DFF0ldlH1k+AFrMS09pv1BH70L5E8=;
 b=nOamrPB/d0CsncWObSqwzKQbXfI7zUzFyQkSLlrZiKOknwmUoIPr+O7bpnGRyKTCPf
 biC1qYzFftfykNNDTp1XOvR1YU9FrxArulTmKwxq0yUSmy2JBhTLPCqNVmlsys/ykwxT
 CcIq9Po3WRm1bA9T5To3HJGsfyQ6MJEN6vQLUKIzR2m6rodZZvcRftOlw3cHx0RgIhTg
 cLdT5+L2joE3s+EOH49BmMXdyO9PmoGJjHjnF4aYkXaftZrFyFfCv0CqIIqIsTXVXI9U
 cM3Ls0i7FBMFwMXyYDWK0bsLizeax9otKI/X+3bp0jMjbyXoPthDSzPShegg7xSxVOes
 HFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cei72ciGbZCpn3DFF0ldlH1k+AFrMS09pv1BH70L5E8=;
 b=eLqcO5v4I7YBMs8ng78a435elTyG6FhC6g0K05EQZG5C9bO9h1ASZH6XeYrZ1sXf3B
 F0ubeAM4/oMivPhoiaPqZHFmFyk6xw7W8NMUEtdxgRssCbUX52jVrXnj1dNFaDMOTNBM
 oFXl8zACwuWvIAVF9uQwYRYuzDC/TkSFOZADbbucm5/QOausg8igtoYqhJHH5np8O45W
 IOFIxOFBa3Vbd2nhaHZMeUPb+YAyQz0H65v2L9ybKoqpx4GHBruT9gKy9hKRgBQaycWD
 tZToeZRoedQUly/n4EW1VGbFL/3UAj54ylZ4rFiAwH3Z1bJ4WGgGR+JsF9dhLO/I/WpC
 EN9g==
X-Gm-Message-State: AOAM5321/eetVLyE7IUaxwTqxgfV5KlU7HfrmhcVWUi0cT/2HdQbCYxv
 jZbflvfnXYRKW4dK69++3Mt13w==
X-Google-Smtp-Source: ABdhPJyQW5aVDDwhRVSef+x0LklBw/djjSn3JZLVZo3OhammdjcYdrbTCEo4JNLOsoo7758e83dakw==
X-Received: by 2002:a17:902:ed85:b0:148:9d8d:2aa2 with SMTP id
 e5-20020a170902ed8500b001489d8d2aa2mr17917272plj.81.1640028417121; 
 Mon, 20 Dec 2021 11:26:57 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id r11sm18954434pff.81.2021.12.20.11.26.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 11:26:56 -0800 (PST)
Subject: Re: [PATCH] tests/qtest/virtio-net-failover: Use g_random_int()
 instead of g_test_rand_int()
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>
References: <20211220102759.311224-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a752f53a-f563-4d54-affa-40925f39b62f@linaro.org>
Date: Mon, 20 Dec 2021 11:26:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211220102759.311224-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.608,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 2:27 AM, Thomas Huth wrote:
>       const gchar *tmpdir = g_get_tmp_dir();
>       gchar *tmpfile = g_strdup_printf("%s/failover_test_migrate-%u-%u",
> -                                     tmpdir, getpid(), g_test_rand_int());
> +                                     tmpdir, getpid(), g_random_int());

Random numbers plus pid are irrelevant, because you still don't have guaranteed uniqueness 
-- think stale files in /tmp.

Use g_file_open_tmp.


r~

