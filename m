Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74806F55D3
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:18:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9Yl-0006Ft-AA; Wed, 03 May 2023 06:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9Yg-0006CC-04
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:18:02 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9Ye-0006Qw-7T
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:18:01 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f195b164c4so31545695e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 03:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683109079; x=1685701079;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WbW86zBcCE3HYFXRbo4b/FrvTuQLYccPnZ8IqetQ7lY=;
 b=zPxGK/pwbsPJGLBvB8MUZhtt/OX/LrMTzsccYP0Qk8AZQFJaZ1cq5BzmwGgCFjU2f7
 n01Qu0OXkAu9Bv62TF96ElI450VbYmz0SNI5PnWZDp+wk+tBofnrmRYCppbLSUJxjaOL
 xb6j635NNdlVx6dwSbEk+mzGcutXcsC3pAYeJr3NTE1Q2kEuwpxQgtq1KPgUQBrB9OmM
 HfEW13a1vWwM6BnGsgoLqXedR0rIUi6AXwFPqt8UQYW2QoiFSIE2KTeOSB+HEnEod0fb
 XpNe37EbAzh9uR8pLPLnzDTZRzF0Bscgeo3HplZD3CM5hOJrb7j6o61eFjg8N2blOz9p
 bu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683109079; x=1685701079;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WbW86zBcCE3HYFXRbo4b/FrvTuQLYccPnZ8IqetQ7lY=;
 b=RsR/zfuyBp2Q9US1hwoEkcMe3F1dDa9/vZUAUZM5VYJZyueDtmbgvvE7YTwt65tdB6
 H+eDhGTd8NB0e+NDIM6Ac9+ApHmfX/J0ptFQ+7TmYXasHu2oXgJGsiVfh2RvDs/mC0Dz
 Emol8D/QsNg4x2MwaFPxOqKnZVb7iR4/1vXkYq87th+fvUWg3PYyzhUt6MYrPwqjBEcG
 jonPKAvVp0bKgIoNMovZeli0OMBXQg8tha60/8MIcx0Ex/wiq/XjNMixDEajLamUQsfy
 hiwJZbjN7A+NY9p4H7uuhXPP/lqVDS+lH5BD6h3rcu6jOSo4E5WE2jdxuP1BkwqXHfmR
 p0Hg==
X-Gm-Message-State: AC+VfDzPtovhP/Eu8jxKcvPpAEdWkenuEwTI6eDlP0G725HxT1Zh25yw
 NoBS3DgMVmQCeoGQgpn8vNPHaw==
X-Google-Smtp-Source: ACHHUZ5mtBhGbnmgin2Hhf1H+Tctcpr9QJbnfNCkm66gdBJha9irLysCeBLt6+s0BoAVy8W5X0PmmQ==
X-Received: by 2002:a1c:f707:0:b0:3f1:93c8:4a79 with SMTP id
 v7-20020a1cf707000000b003f193c84a79mr13538744wmh.29.1683109078657; 
 Wed, 03 May 2023 03:17:58 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 g22-20020a7bc4d6000000b003f049a42689sm1412498wmk.25.2023.05.03.03.17.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 03:17:58 -0700 (PDT)
Message-ID: <721e61be-b1b1-b8ae-9259-02100d72f483@linaro.org>
Date: Wed, 3 May 2023 11:17:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 06/22] hw/arm: Select VIRTIO_BLK for virt machine
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503091244.1450613-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/3/23 10:12, Alex Bennée wrote:
> From: Fabiano Rosas<farosas@suse.de>
> 
> The virt machine has IF_VIRTIO as block_default_type, which causes the
> generic code to try to create a virtio-blk-pci device pair at
> configure_blockdev()/qemu_create_cli_devices().
> 
> Select VIRTIO_BLK and VIRTIO_PCI from CONFIG_ARM_VIRT to avoid errors
> when PCI_DEVICES=n (due to e.g. --without-default-devices):
> 
> $ ./qemu-system-aarch64 -M virt -accel tcg -cpu max -nodefaults -cdrom foo.qcow2
> qemu-system-aarch64: -cdrom foo.qcow2: 'virtio-blk' (alias
> 'virtio-blk-pci') is not a valid device model name
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20230208192654.8854-7-farosas@suse.de>
> ---
>   hw/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

