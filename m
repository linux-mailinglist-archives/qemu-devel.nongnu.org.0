Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F40B1619F12
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 18:44:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or0jJ-0006GQ-0M; Fri, 04 Nov 2022 13:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1or0jF-0006Fm-TP
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:43:43 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1or0jC-0004kt-TK
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:43:41 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 ja4-20020a05600c556400b003cf6e77f89cso5770817wmb.0
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 10:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N1iJN427WNYZl7U2RtcjneL7vTVAKcarGkKT+ZlT3m4=;
 b=Oq4JP/fpNQwyckspChHQ9tOb44/OCh4TWM8UX5Fa+kp3bDc+2j4pfkt7kLbfFMzFzP
 VNscCPpOzK0EumcDHFjHYRoROmo0aJU1H4NrycgtYDzxXNDANBCgS2uCos005wjtYHbX
 y+SjoT+CNyTX5WgHQnsMbdIxo4AvuY6v3C+vbM4hD5BdAWlLp5B7zydmt1jBCs7R9btF
 hPa/gUvAv7ekD+yJTNx+LYhRVu18yG1HGyyrd47qBx51ver6C1Ivn4HVdCu3z4dhUl9e
 AVpGzWDdqTv2kuOgkdkeNiELQ/hC1jP/ctuFvxDrEOpId+/hDIJuD3yaPSIR1ucgDbRJ
 axQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N1iJN427WNYZl7U2RtcjneL7vTVAKcarGkKT+ZlT3m4=;
 b=5JulswyRPDu0MajFYbPRNxtbu2Q2GDYckS6MDlyM6M5nUDetY7sR8duzUxOp6tix2x
 MFyAjXVNupOapap0VKNDP6a1RIQFJe5A0uQ9JnxqDBPTRMgdB2T4JQ+VArWi6a++aEMr
 bsHNLFgVYlRxU7M1kvAko2aXKBl6bBFFopHXoq2Phj54rPTFW6EYuME8oBlkcXzX3aBQ
 FuOgz+PPE77yq8m0shX7jkWG1iQryCG3oOzioL3H2Zm8rA5GvSaXsZdA3DqQyaQuze5G
 4i7W+9DutW9W6A69OwhDKEhSwQIofPrFRKBbLeDqt9BY0VrDIclBeZdCLARKel9z6jO8
 wjSA==
X-Gm-Message-State: ACrzQf0ifF7nfPmNI9Vp8ie6J44XlxJddeOpjAlV5R2pZlXE/WEJDhsq
 4ngs6HsiLG2x2Tm0FtBvwNDsHbiUMSA2PQ==
X-Google-Smtp-Source: AMsMyM6YQf2n/623ed6q2igZ72kHCWYmvM9XXnh9NjtuTjmfIkVluq/Dyo6hgBGh0Dir3o/FSe+rtQ==
X-Received: by 2002:a7b:c2fa:0:b0:3cf:755c:8830 with SMTP id
 e26-20020a7bc2fa000000b003cf755c8830mr18947201wmk.172.1667583817390; 
 Fri, 04 Nov 2022 10:43:37 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v128-20020a1cac86000000b003a3170a7af9sm99167wme.4.2022.11.04.10.43.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 10:43:36 -0700 (PDT)
Message-ID: <9a733e4e-98c5-9a0a-74eb-56db846f2dab@linaro.org>
Date: Fri, 4 Nov 2022 18:43:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH for-8.0 9/9] hw: Remove device_legacy_reset()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org
References: <20221104161513.2455862-1-peter.maydell@linaro.org>
 <20221104161513.2455862-10-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221104161513.2455862-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 4/11/22 17:15, Peter Maydell wrote:
> The device_legacy_reset() function is now not used anywhere, so we
> can remove the implementation.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/qdev-core.h |  9 ---------
>   hw/core/qdev.c         | 10 ----------
>   2 files changed, 19 deletions(-)

> -void device_legacy_reset(DeviceState *dev)
> -{
> -    DeviceClass *klass = DEVICE_GET_CLASS(dev);
> -
> -    trace_qdev_reset(dev, object_get_typename(OBJECT(dev)));

We can remove the "qdev_reset" entry in hw/core/trace-events.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> -    if (klass->reset) {
> -        klass->reset(dev);
> -    }
> -}

