Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CDC691FB9
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:25:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQTP2-0007D9-MX; Fri, 10 Feb 2023 08:25:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQTOv-0007CS-TC
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:25:17 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQTOu-0005HF-AX
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:25:17 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so4039422wmb.5
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 05:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jHZkOaNzPDSQYGpWlqknupqXvvN/RW68o4X3EzlqsYU=;
 b=BeMdTN82hy1N3BMu2f+QwsuZ668c25Y5e9+QfoYOeiVf5z9cu0/TtVjtp4/2Cjmb5V
 YTHNqRY7tzoZeZgIqBa1Giip98QOIvvA01lTZV+BgC69Ngf0ono45taNNF8y78R5sRhI
 Rg57wLE+Tyd+CrtyouEV7QCR8u9hPKar1+t1c9CkuiCf86UGl9m5UyPNuXzTFQx5LQjZ
 e4fF4g0LbLVT7ZuA/5ZsBo5d1AKArzEMALBdbsqywUQHtx5+dkR+AzrVrHAHE7T18DkY
 hPJ0e1nGwajRYtt/hk/sVjmRWjpuWOzoebYCcJq8bhwQ4MKp43twaVrr9s62xzPlmS+d
 uJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jHZkOaNzPDSQYGpWlqknupqXvvN/RW68o4X3EzlqsYU=;
 b=Lp5U8kccC5qBFwkNCoUJZ8+0V+KXGNbYL/IHcu3+e2+09SkhfTVZUI85YXsFaM/sve
 EKXbB0Y1uHjlrzWRxfjKnf8x9in6uqhujka9ZOxPDjyUwgp4iuZXDYKCF+iTID+QdrWK
 8VRP4toBtkhK+S+lfggKKrUWR1wElGd/zHczpKD+SybL8QXXYFk+tFg+TQjDsIjFZ/DH
 0MLhAysyFaKKy9MDDir8nY1JhUc2X7ts9Qe1EnPm5EHvw1BpZDJnAdSgYeN+V/YwAy6N
 EmisqlAW5A7pt1ZuqQOuLqVMMjf/4Hq2fN/QDm+ErSmvM4Go70VrhfS8nP+QX7x3IcbQ
 1+xg==
X-Gm-Message-State: AO0yUKVlreyJqcSuN2n19squo6Ex/djXW2y90G6FxWYnWYpol7YGb282
 9eem5dEmCsIPBm90CXth6p4=
X-Google-Smtp-Source: AK7set98xFFC5RN+aGv6ONw5jJOcTBweNdYnxW0/NGiOzj6t1jDDftIiuVbl3YbQBK2u2Xl52zsqFA==
X-Received: by 2002:a05:600c:1685:b0:3db:2e06:4091 with SMTP id
 k5-20020a05600c168500b003db2e064091mr14609794wmn.37.1676035513891; 
 Fri, 10 Feb 2023 05:25:13 -0800 (PST)
Received: from [192.168.15.58] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a1c4c06000000b003d1d5a83b2esm7798960wmf.35.2023.02.10.05.25.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 05:25:13 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <5ff185ea-7170-bc66-3f4e-38810ec07add@xen.org>
Date: Fri, 10 Feb 2023 13:25:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 30/59] hw/xen: Implement EVTCHNOP_close
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
 <20230201143148.1744093-31-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-31-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x332.google.com
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
> It calls an internal close_port() helper which will also be used from
> EVTCHNOP_reset and will actually do the work to disconnect/unbind a port
> once any of that is actually implemented in the first place.
> 
> That in turn calls a free_port() internal function which will be in
> error paths after allocation.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c  | 121 ++++++++++++++++++++++++++++++++++++++
>   hw/i386/kvm/xen_evtchn.h  |   2 +
>   target/i386/kvm/xen-emu.c |  12 ++++
>   3 files changed, 135 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


