Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B910B679809
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 13:27:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKILq-0000tk-2Z; Tue, 24 Jan 2023 07:24:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKILj-0000Cu-Cy
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:24:27 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKILh-0007Qt-9r
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:24:27 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d14so10017611wrr.9
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 04:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D4tXS0YY4OfV20lyQ82vMbgmPELSA08qkLjQr8OzI8E=;
 b=LjYW4fnvl4449bS74mYEA7zGB+5LYSm7/s3uHUKGTJUnTFk4dX4gzW6iwSgv87uPKH
 bWnxGzqAOj2zk4M//awmgB25pVMBrcFh8Q2fxSfffg7mk2sFgvR02HmVURbL/QCAfJTH
 kC1teX1dlb2BAzkz0cWZVt9/uvH7MjMHa/vl2bndISE04h3NjbPDGWVv27l5G9wqLtLg
 SzpvwAY8r5NmKWAlO/xzYhMuGWT8z3utNNHhRZS+sfPatT8YL7gQZBGsS7b1DVZ2uw8Z
 WfgX7AWm+/G3xQWKpOjeLBXBhOMyKxjtMMbATxSyGfM93qC5syR6jJzq249t3lOaa76s
 4HSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D4tXS0YY4OfV20lyQ82vMbgmPELSA08qkLjQr8OzI8E=;
 b=EtgmftZIF6eVXRBis1JVFQ8KmPkw49ojnGJ3jhMYHueClSD5iscJ6OtInvGT84fj0C
 LgyIjtVMocFhgFKjQlRM+mYP8mvpx5TX84hRYYh2ABcKiW4MFIff+Te20e+TPiF8Jkin
 P+GjF4qO9esWt3E1SNjNAAkEpdM7lQNIjbueAHqUjxvGaY1Zp7jA8JnAix+VLI3v6VIJ
 zr65R6qidxAL86mlfEB9cn0v4OQPY8nmDsKKIQ0zlCZK+qIFfEZO0/XEFe13Y5Sz4eBY
 LKHlMSINJwdp3/uqZDlw6Q8j/ghaKzGFdgx9QF2a0mMcIrtWmVef9Yw4c3CZL1tEa++I
 cOug==
X-Gm-Message-State: AFqh2kp+tkMkHx3Mm3UTT9KC+iu12LAUaWr52Dq8mB4rB3dEW5E5coaP
 a6C/Ul0/pPVl4J4cnx8/+kXlcQ==
X-Google-Smtp-Source: AMrXdXsSYvQwYJIqCNw+xUU8GF5FTE5Q7fGKYFAKCuccTP6lg1hg6K6mtRBR2vU17wVUZ37i385fxA==
X-Received: by 2002:adf:d084:0:b0:2ae:b451:a0f7 with SMTP id
 y4-20020adfd084000000b002aeb451a0f7mr24024283wrh.5.1674563063429; 
 Tue, 24 Jan 2023 04:24:23 -0800 (PST)
Received: from [192.168.37.175] (173.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.173]) by smtp.gmail.com with ESMTPSA id
 q3-20020adff943000000b002bfae43109fsm1654372wrr.93.2023.01.24.04.24.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 04:24:23 -0800 (PST)
Message-ID: <cfc2472e-14c6-8737-976d-d7d912cb4096@linaro.org>
Date: Tue, 24 Jan 2023 13:24:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 19/32] virtio: Move HMP commands from monitor/ to
 hw/virtio/
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, kraxel@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, marcandre.lureau@redhat.com, dgilbert@redhat.com,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, jasowang@redhat.com,
 jiri@resnulli.us, berrange@redhat.com, thuth@redhat.com,
 quintela@redhat.com, stefanb@linux.vnet.ibm.com, stefanha@redhat.com,
 kvm@vger.kernel.org, qemu-block@nongnu.org
References: <20230124121946.1139465-1-armbru@redhat.com>
 <20230124121946.1139465-20-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230124121946.1139465-20-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/1/23 13:19, Markus Armbruster wrote:
> This moves these commands from MAINTAINERS section "Human
> Monitor (HMP)" to "virtio".
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/virtio/virtio-hmp-cmds.c | 321 ++++++++++++++++++++++++++++++++++++
>   monitor/hmp-cmds.c          | 309 ----------------------------------
>   hw/virtio/meson.build       |   1 +
>   3 files changed, 322 insertions(+), 309 deletions(-)
>   create mode 100644 hw/virtio/virtio-hmp-cmds.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


