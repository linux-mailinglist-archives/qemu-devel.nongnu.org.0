Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CA4601AF0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 23:06:10 +0200 (CEST)
Received: from localhost ([::1]:35688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okXJJ-0003cO-Mz
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 17:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okXE8-0001V2-1S
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 17:00:48 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okXE6-0000wR-Fl
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 17:00:47 -0400
Received: by mail-wr1-x42a.google.com with SMTP id bu30so20379890wrb.8
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 14:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fQR313Xq22pXC7G/wRQ32hjS3QR6hdBjbJewVk1Dueo=;
 b=y9IOceKnT/CoTnHeTZZHtmSIytpYzrBJKcFa4uFCbOAHLUHU41PgQscYT6XrvoBv1w
 WtNo2XdaJfl19N3rVI/qWz8E97HRJCmyQRZMeOTebL4Nz8uhDU7PPF7uIqcwXO2c0VyR
 Roy7f47sR/k6KpYfwkbvzDlOEl1ZXNN1eRITo3BpD4ZcKozng/DabP+3+UrpoEocTI+M
 dLsg9zZQGf9t0D6NbIDnNMbhIPQHXwzROjGb1aWj+8X8KlNbGLfS2mbebsj4ofxNuSI2
 fbkr98f9qT6Wiqvwc33Pn30xrlhCCvdF9thvHDwzFZbyllSwKNiaQDIKOIdDh0cyCK6p
 graA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fQR313Xq22pXC7G/wRQ32hjS3QR6hdBjbJewVk1Dueo=;
 b=Xs4Egwy3zyWPuzIdwxOJXHj9n35bZKmWk/eNyRlbg3dP9iqYJyqiRZlwIjKR5jFm4r
 7m02XOTR6LctrxOMCrXRiOZjbi9lWpLyQ9qTF9V+7oIQNr8b9YaNGQ3shy3vu4ptjr8U
 511E4x7EIolaZHV6YBNfW9UQ9ltc5kQ219AwKKZjHgiO90ELMTVnrum4byPBioyVtQtb
 G6Grx4aos3GgYIJ7dg+tEWjgfqKwFu/nM971uAJQ5C+7DP2uNqHTplDVYYh1SniOAVO0
 g6oi7LIg95onlfDmPQESe9XQqeVMFbQWlgLVOlu5Tuf90EaTxJP6tNlNnJhDjQJTd1bT
 0/7g==
X-Gm-Message-State: ACrzQf1ZzaxR+0kY0UT7QiaB5/8FE1s00M8CqOA5CC+26LFwFRiIQGY5
 3eQ0ikZXnApuE17l5ASSLEp7Bg==
X-Google-Smtp-Source: AMsMyM5Vz3eW1FVLAq7eTeKNUAHWsR22puDOhdYjZJTnOTdoiuG8HNk/0L5lDyRQVgKyILZHLBPpVQ==
X-Received: by 2002:a05:6000:2c5:b0:22f:5242:131d with SMTP id
 o5-20020a05600002c500b0022f5242131dmr6922773wry.228.1666040444917; 
 Mon, 17 Oct 2022 14:00:44 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a05600c4ed100b003b4ac05a8a4sm21835653wmq.27.2022.10.17.14.00.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 14:00:44 -0700 (PDT)
Message-ID: <8cfcfb93-3a65-c471-f190-c93952c919fc@linaro.org>
Date: Mon, 17 Oct 2022 23:00:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [RFC PATCH] virtio: re-order vm_running and use_started checks
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20221014132108.2559156-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221014132108.2559156-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/10/22 15:21, Alex Bennée wrote:
> During migration the virtio device state can be restored before we
> restart the VM. As no devices can be running while the VM is paused it
> makes sense to bail out early in that case.
> 
> This returns the order introduced in:
> 
>   9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)
> 
> to what virtio-sock was doing longhand.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
> ---
>   include/hw/virtio/virtio.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

