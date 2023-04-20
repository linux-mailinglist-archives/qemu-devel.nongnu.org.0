Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6546E9665
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:57:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUlW-0006Gw-1u; Thu, 20 Apr 2023 09:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppUlT-0006DH-N1
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:55:59 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppUlR-0004TB-39
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:55:59 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f086770a50so4873685e9.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 06:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681998955; x=1684590955;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QslkW15XHWwi59gvzpn1Iwdj7S4xILhuBQRasEn3xDU=;
 b=hm45BxXFVtzp1ZJiVFok37BbgP90muekG+Gs1I02FrAnSpT6w2kXyP8QzdzadhU8Xt
 AZZUQQWB5Vxj3FUsWy4Hd9Koyu7xlxuLIuWuyyBDmTetZ7M3YqEDDS5xIRQQcQBBzk1L
 LUHil37w5KrURLHyvisFTMUFc5l5odfYGye+PP4bL1PMCn4G5i2V1dsc5ngJNvfMy/bg
 Thdjwr5A9o8LC7jniXw2HR9YZt5wMIKjSwGceOj2EW2V5mpKycXeni1VoS+1wKUZKALk
 jmdh+cTY8AyeALVZJIooDmhpkFwVMy1KhNTNHNDcmB/jBUxtEeAoXIxIn+A2KUIE6nie
 EPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681998955; x=1684590955;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QslkW15XHWwi59gvzpn1Iwdj7S4xILhuBQRasEn3xDU=;
 b=kFAnIGsLKDd24SkdmGjVZu330oXA9akbGaJkkigHp1SurcFLTf9Sy4UFcX1H2i3sZ/
 BPLBsw4u3/JnKqvPoHisChxcOGrqY89A12e0GEofW9Fkwl4aGe6WBCfUqWE7IoUTO6t8
 dvCbJtxhQdvV60/fTuFAcCM0/LvvuZd0EqrwPPT6YIDGKNPN5j1vxmNR9fvyuwwya5bI
 G7crsxLVvdf4zG7v7gbUYQdVzFdg3m5U+p38JYsrPbTXzFZlshQSjXTvpgv7hR38RFRX
 xDZb+3hOOP2QTORawt8ToA+t0mte2E8wN8lVaB6jE7K7Up9V41/JBoCIjNaprNCIYgZo
 GyRw==
X-Gm-Message-State: AAQBX9dwTEKsP9i4oZsaWNKBh82EmEhIbt8WiXYJaKuKOCeSHoraZtm+
 pjl3wL0pTk2qdJTiY4FiaV3pDw==
X-Google-Smtp-Source: AKy350YF69pw8OtT1ib1Uq1JKXddfdmcoEl3IBbeY5SAum/JbViA2002SNkiNZ2q/ptn/uupCxSYQw==
X-Received: by 2002:a5d:4f8e:0:b0:2fb:2567:bc1 with SMTP id
 d14-20020a5d4f8e000000b002fb25670bc1mr1537576wru.8.1681998955537; 
 Thu, 20 Apr 2023 06:55:55 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m2-20020a056000008200b002f53fa16239sm1989669wrx.103.2023.04.20.06.55.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 06:55:55 -0700 (PDT)
Message-ID: <30f1ca18-7289-5bfd-7990-37610b7a2dba@linaro.org>
Date: Thu, 20 Apr 2023 15:55:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] hw/rdma: VMW_PVRDMA should depend on VMXNET3_PCI
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>
Cc: qemu-trivial@nongnu.org
References: <20230419111337.651673-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230419111337.651673-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
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

On 19/4/23 13:13, Thomas Huth wrote:
> The "pvrdma" device is only usable in conjunction with the "vmxnet3"
> NIC - see the check for TYPE_VMXNET3 in pvrdma_realize().
> 
> By adding this dependency, the amount of total files that have to
> be compiled for a configuration with all targets decreases by 64
> files (!), since the rdma code is marked as target specific and thus
> got recompiled for all targets that enable PCI so far.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/rdma/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


