Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E475A6EE4F7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 17:48:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prKto-00060U-3s; Tue, 25 Apr 2023 11:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prKth-0005u9-Kx
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 11:48:07 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prKtf-0006d7-Le
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 11:48:05 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3047ff3269aso1394896f8f.0
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 08:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682437680; x=1685029680;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mFXUeqmf7J7ZmdEqZ/F9UYdDBPhcEtftBoUmvdXGTbQ=;
 b=Rm/oHBKmuQwVPHcCxcJLLFSijeEkMvYyFZ+3XQMStb5p3IDxE+Tw0gReJqb8vu152N
 OAHP2JPHRLDFM5BjDLf3lsvvGKBwlzyCz0b6hadMH5KU87GwbaBWBiSTD7lpwkcXuB5n
 o/q2Iw8q6fG64aQaUdCf9PugJFgmYt8HqPgJ0kq3cOIH+ycrZW2J4z2Iw5i5yEyzBHAt
 i2pZbuqGpWOc3FNh2Fy5dUDRbhGqn5RBcXjcuSra70bbygBKF3qnOQahM8X9ZaQf1F0U
 tBiR9wKgFPYjK3GLUASkC5L9e1C5nxBM61zrRSeuh/HywDsWc2oszTxu4MFoUtc4YOhz
 keDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682437680; x=1685029680;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mFXUeqmf7J7ZmdEqZ/F9UYdDBPhcEtftBoUmvdXGTbQ=;
 b=K0I4QPg1lFHdhrB40GbrUokkqEG5jtMTeZSLYtrLztdsk8VHu5T1r27oaoFfmqgAe1
 37JiAbRD6snvau1zPJ8o/Gxo44hIc+TLrd4a54DzLFcK5BEzOpLaJDKj2HfCvVkY+AiC
 JLDffowDY8uGE5djOFWpbwo6GMNDgw+kY8kzsL6JD474/5cwrxq1KU9Po9BMHQR9MkIr
 ND5a6nxrOFQJRqUyrHV/J1hdi1DZPEtkuwIpQBRZ7MJxvTyg9iA2jthL1UVk8Om9Trq/
 xvQjiJAbfeaWL0t5cV2V0qRkaMVW6hnORzPZ80Fy55/2k+LVffSO8QtuC4fHRm/6GTWQ
 deeA==
X-Gm-Message-State: AAQBX9dhZy9I0kCFvu62O+VI8TTbfLJ9u2G9MVz82l9h7xDBRqflFoTr
 dbGF7mIXRJGcPW4HerLkT4NBdA==
X-Google-Smtp-Source: AKy350aiVkQ3IlvSKbOWmdRFruyTs6wtEn6615QzrqWYkiqSOvuOCuemOP/P4py9xTIX85NBt/61AA==
X-Received: by 2002:a5d:5181:0:b0:2d5:2c7b:bc5f with SMTP id
 k1-20020a5d5181000000b002d52c7bbc5fmr12444379wrv.58.1682437679885; 
 Tue, 25 Apr 2023 08:47:59 -0700 (PDT)
Received: from [172.27.248.56] ([212.187.182.164])
 by smtp.gmail.com with ESMTPSA id
 v12-20020adfe28c000000b0030497b3224bsm209356wri.64.2023.04.25.08.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 08:47:59 -0700 (PDT)
Message-ID: <de9e4f6d-e985-b1f9-5a59-0127c54a7323@linaro.org>
Date: Tue, 25 Apr 2023 16:47:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] hw/intc/allwinner-a10-pic: Don't use set_bit()/clear_bit()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
References: <20230424152833.1334136-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424152833.1334136-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 24/4/23 17:28, Peter Maydell wrote:
> The Allwinner PIC model uses set_bit() and clear_bit() to update the
> values in its irq_pending[] array when an interrupt arrives.  However
> it is using these functions wrongly: they work on an array of type
> 'long', and it is passing an array of type 'uint32_t'.  Because the
> code manually figures out the right array element, this works on
> little-endian hosts and on 32-bit big-endian hosts, where bits 0..31
> in a 'long' are in the same place as they are in a 'uint32_t'.
> However it breaks on 64-bit big-endian hosts.
> 
> Remove the use of set_bit() and clear_bit() in favour of using
> deposit32() on the array element.  This fixes a bug where on
> big-endian 64-bit hosts the guest kernel would hang early on in
> bootup.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/allwinner-a10-pic.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


