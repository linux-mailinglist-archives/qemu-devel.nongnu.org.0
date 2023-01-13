Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A35669035
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 09:12:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGFA2-0003t7-9b; Fri, 13 Jan 2023 03:11:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGF9x-0003sb-5E
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:11:33 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGF9v-0007EP-CM
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:11:32 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 p3-20020a05600c1d8300b003d9ee5f125bso11706341wms.4
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 00:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iWBhIu11mk5dvM20Jfv8/5dkYZaoRvZJSB+ILT7XMZw=;
 b=Jhew7By1AhO1vuvHbzAqLJpvWQM5dotwA9HZRADnqNdRW7On8MgmhovyPFJI/FCg8N
 7fux663jhmYPaYVq+vIyghbNbw3Md5fb1tVR1n5+u4nVU4J0Ck8krXIdNhOqEONF/NVw
 x0KZxlCZhjWXWGZlIEeok+36gtTHfEH3dd/rT7OkT1f2dXx+U753I0oiQWbqqmfOuRj/
 pzuikQwrbgqivMvN56/sVgilmSSR7VdEWiGN51aF6I8klXR7kDwEihvyk9NJZoGtd93d
 N6kbz/XW0BGhWAmUXHIxLC2/6TAb9WVy8Z7F+xOg2Amqf9ckT4/59SSL9036HsqxZm79
 6Y2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iWBhIu11mk5dvM20Jfv8/5dkYZaoRvZJSB+ILT7XMZw=;
 b=PWtMIey3g9pmS6OHboBwoIHVfiR5VI3Sw9VXMQQIheBdPKP/y9qnUNP2m0adDvvdRd
 KharysApB7s6xpqo0fTTHzMhsc1lWYwtIPAN+hwWbbLoWSvUwwPKYOF5JIDH3sPc6OL+
 VhRARJzjX5GKOWuwf5YLUHI3PhRSn0sGpkT0OjTFGBihbP9npiQbnK5/8N+H40XsKhS0
 C71P/r6lr2T2rT79saYatHxIVv4xfFSE61dLS+FQMXgZO45fmojnUPmYHKuV+6E7vSKI
 9RGf5o5pLRrocQdfpy2UuiU5xlMrjLz9u6GyG9O09rnENfZq7q+hWxOnO7eJ18DMsuUu
 NFzg==
X-Gm-Message-State: AFqh2kry0d+n25zZU/18xnZTKIx5uPMgcv0x94zxSArlc26ND2h0ZUz5
 s3Rncc3TMZsawFoO5Ya17Nux4NW5a8vbVUFw
X-Google-Smtp-Source: AMrXdXs+g+nd3CB0xMZcQLvYGgP64b73srw5glqtrCCB+AwPNBUwA+GhJpG/j6DbJ4b8AcHt9WxdUA==
X-Received: by 2002:a1c:790c:0:b0:3da:22a6:7b6b with SMTP id
 l12-20020a1c790c000000b003da22a67b6bmr687179wme.13.1673597489333; 
 Fri, 13 Jan 2023 00:11:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 iv14-20020a05600c548e00b003b47b80cec3sm33196221wmb.42.2023.01.13.00.11.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:11:28 -0800 (PST)
Message-ID: <148b4e67-7731-e5cc-985c-5059d160ece0@linaro.org>
Date: Fri, 13 Jan 2023 09:11:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 0/8] hw/pci-host/bonito: Housekeeping
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>, Bernhard Beschow
 <shentey@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230105130710.49264-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230105130710.49264-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 5/1/23 14:07, Philippe Mathieu-Daudé wrote:
> Minor housekeeping while reviewing PCI host bridge models.

> Philippe Mathieu-Daudé (8):
>    hw/pci-host/bonito: Convert to 3-phase reset
>    hw/pci-host/bonito: Use 'bonito_host' for PCI host bridge code
>    hw/pci-host/bonito: Use 'bonito_pci' for PCI function #0 code

>    hw/pci-host/bonito: Declare TYPE_BONITO_PCI_HOST_BRIDGE in header

Patches 1-3 & 7 queued to mips-next.

