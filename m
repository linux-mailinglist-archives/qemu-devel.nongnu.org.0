Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D87B6AB8D5
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 09:52:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ6Zy-0004NB-Gf; Mon, 06 Mar 2023 03:52:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pZ6Zt-0004L5-5w
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 03:52:17 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pZ6Zr-0007n8-Lv
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 03:52:16 -0500
Received: by mail-ed1-x529.google.com with SMTP id o12so35239365edb.9
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 00:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678092733;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=YH3W1xqKKBWY/KcpFgZaZQu85P/63mKD/Wkl+AdW+QY=;
 b=O6wRyLD5HBnZERXsPBULeV/By6zvSmtB5+pVxm+J69FmKD0TW3PYf8lbogl2XFH2QR
 NMDQwl2qp5IWGVuOAFauSR3P6xBcSQaDhpS1rAN5Ek5H/Z8XOlCNlCOq+jBPqe2bnASC
 y7/PwHFwHMYgcW+41Nwbs47EZJnPlVMQMKvlR6yKaI//ndxoYJNc324CHeWWyIZap+bq
 sbA6rYGpx6UqeKK39mZLcA2GvHRh4R3HKYr559ZcYAaupIOYR7l5weLlYaX3ykA69VYh
 RB97P9Wrwd2vP7tHm3vEodNsAZ0NMjN387Wm+jX7JytYWFwv9GpBN3QUF+UUji6bkJVi
 S8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678092733;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YH3W1xqKKBWY/KcpFgZaZQu85P/63mKD/Wkl+AdW+QY=;
 b=GmGdRfMyiBUTx/ArCTtENlcN3eB71XLTzDJJaCxOzgpiAMqyyZcmmWDpRfMiewQxjx
 VnJl70+NicAiw9fxTuvurnzgfqhJx4GMr+ixCJOQdDTRlH1sc3DIpZrCWdQIu7Aa9LYc
 dx1LSuL7UhDaMJGKDEfjxrHR4tgZFuLq1iX2pf9KeJAywN+uU/C0e4dUcmoIsqF0Z0Le
 CgiVTwnZQq1jVFa6+6RRZy4JtHFOsUOdjH+cM2yldZhxm3t1hpDl4fo/5mXlk9HLgtwR
 fHftbqqqL21gBGV5vZQfZ/GA8F+iBX+IOgb1bDmEVT9plU9aO7Ev2OQYTOy6V9QplWL1
 /Uqw==
X-Gm-Message-State: AO0yUKUSqzQm4Sb9zenYvZS4LF9VPih97YfvG/qUCkoK9gis+PWCD9ij
 09zDm2bw6jucJlZjCskuyfzFag==
X-Google-Smtp-Source: AK7set96Eg5erHaNoscwZIKROQzx2BfnOLJMQosciRU9EGOzZqiNaVEhHqttNrZFwYO8GxFuyoxxeQ==
X-Received: by 2002:a17:906:da82:b0:88f:9f5e:f40 with SMTP id
 xh2-20020a170906da8200b0088f9f5e0f40mr14564027ejb.68.1678092733515; 
 Mon, 06 Mar 2023 00:52:13 -0800 (PST)
Received: from [192.168.200.206] (83.11.36.13.ipv4.supernova.orange.pl.
 [83.11.36.13]) by smtp.gmail.com with ESMTPSA id
 lo2-20020a170906fa0200b008e09deb6610sm4239576ejb.200.2023.03.06.00.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 00:52:13 -0800 (PST)
Message-ID: <19ba6bdf-a676-f25b-1fa4-5c4e64e17c9b@linaro.org>
Date: Mon, 6 Mar 2023 09:52:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] target/arm: Add Neoverse-N1 registers
Content-Language: pl-PL, en-GB, en-HK
To: Chen Baozi <chenbaozi@phytium.com.cn>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20230303161518.3411149-1-chenbaozi@phytium.com.cn>
 <20230303161518.3411149-2-chenbaozi@phytium.com.cn>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <20230303161518.3411149-2-chenbaozi@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ed1-x529.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

W dniu 3.03.2023 o 17:15, Chen Baozi pisze:
> Add implementation defined registers for neoverse-n1 which
> would be accessed by TF-A.
> 
> Signed-off-by: Chen Baozi<chenbaozi@phytium.com.cn>

Tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

~ # cat /proc/cpuinfo
processor       : 0
BogoMIPS        : 125.00
Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics 
fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp ssbs
CPU implementer : 0x41
CPU architecture: 8
CPU variant     : 0x4
CPU part        : 0xd0c
CPU revision    : 1

I used TF-A with Chen's N1 patches, EDK2 upstream and Debian 6.1.12 kernel.

