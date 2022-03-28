Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ABF4E9EC0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 20:15:56 +0200 (CEST)
Received: from localhost ([::1]:46104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYtuF-0002Hz-FF
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 14:15:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYts9-0001CK-BJ
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 14:13:45 -0400
Received: from [2607:f8b0:4864:20::22d] (port=38888
 helo=mail-oi1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYts7-000289-JC
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 14:13:44 -0400
Received: by mail-oi1-x22d.google.com with SMTP id r8so16487878oib.5
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 11:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8hngE82XE2tOyMwf7EyKCCPWq/YAms3XAf4WkJXBFmo=;
 b=tS7YtI8xlTXsieIcbXPcPDRL2v3MX92TpfIizbHGhl/91mZG4QlbO7MJV+fJJRx/BY
 FSpkvFwjwfmiovZGLkOi+lg9i1X78FIQhyHcR4L2/HRbyOygRdmmx1MMh5C76Ezd4FXZ
 +kTsSUZQwe88/T7c5xExXZOuMw381UyQEexRCCATfyUZ+/AmsLlthWfb2c8K+Ua5hmw2
 XnkYwWIludS0AMdImwN5wiywn7qWvTe6UfZ2mYGYrC8nAN6+koeAgYIs6gyVW3BXWcp1
 BzipgqyyjbiTiO/RcDXS2dmiDzY/VJOpqoYqu5gh0Ybvti/d7lNci1pk7XK8Xmm+5Lkw
 5UBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8hngE82XE2tOyMwf7EyKCCPWq/YAms3XAf4WkJXBFmo=;
 b=fJ3oNUpLpvXYMpEsYmsAzp6uwxgcJB5OD61/905B9FNQBrosv1qZBVu1XtDXldupZH
 20/dfnX78gUYnt5iXuYB8GxspP0tc4d0RPLd28Qm9osW1Hfkm4Awtx5JY4cvEqACBtbO
 vUDCkjTb1ro4Oa1zAqQ6o2h344JvpnOPSnoDfnIHzPY7ntOE92vXsbYZeTVuhqd8Qx/X
 K0t66nAJtX7qDRwPg/ijXVCF+i3ax3go3YUPCGhuxwH8/hnrBBaCIDcCMOXvJmnORszL
 Kc/jHrYR+6MkzX0NR2aAjMmfN4wyqkD0EeTWoAbK+3FbZwzgCj/7et9pFPyCVLT28Tgg
 8RGg==
X-Gm-Message-State: AOAM532+bpl9wV3ngac7DqHLEg7NqCt71jpchQRfP25FpA46hKujeT1D
 eXpsArDsWp6uGgw4IyQceCvNcW7JvsSFyroewoE=
X-Google-Smtp-Source: ABdhPJwYIzFy+ll+TkeHTEqDdpJiXjKY/ounWJaEtMwwxnxhIbhjFHLhgtu/zmaBahgz2JrPTnypDw==
X-Received: by 2002:aca:1a07:0:b0:2ef:87fd:7f9d with SMTP id
 a7-20020aca1a07000000b002ef87fd7f9dmr212642oia.23.1648491222271; 
 Mon, 28 Mar 2022 11:13:42 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 m3-20020a4ae3c3000000b00320d7c78b01sm7080933oov.20.2022.03.28.11.13.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 11:13:41 -0700 (PDT)
Message-ID: <306d867f-42b8-bf40-0fdf-7fe996542fb7@linaro.org>
Date: Mon, 28 Mar 2022 12:13:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v7 00/29] Add LoongArch softmmu support
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 06:57, Xiaojuan Yang wrote:
> This series patch add softmmu support for LoongArch.
> The latest kernel:
>    * https://github.com/loongson/linux/tree/loongarch-next
> The latest uefi:
>    * https://github.com/loongson/edk2
>    * https://github.com/loongson/edk2-platforms
> The manual:
>    * https://github.com/loongson/LoongArch-Documentation/releases/tag/2021.10.11
> 
> You can get LoongArch qemu series like this:
>     git clone https://github.com/loongson/qemu.git
>     git checkout tcg-dev

I strongly suggest that you rebase *without* the patches for linux-user/loongarch64/.
If you do not do this, you will be stalled until your linux kernel patches are merged.

Testing this rebase locally, there is only a minor patch conflict in

     target/loongarch: Add LoongArch interrupt and exception handle

which suggests that the EXCP_* names be removed from

     target/loongarch: Add core definition

The EXCCODE_* names be introduced early instead, and all of the uses updated.


r~

