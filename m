Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DC8609A12
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 07:53:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompgb-0001RX-UH; Mon, 24 Oct 2022 01:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ompgW-0001Ov-7I
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:07:36 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ompgU-0007xx-Qz
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:07:36 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 c3-20020a1c3503000000b003bd21e3dd7aso9226567wma.1
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 22:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ChbXoBI9PTstc5ztUVMkoXJAxqyW6lL7AXSb4LcVBQk=;
 b=LVUpRnzDmb+HRdm0vyKPE/YDfZ4DaUM8dlg+xSjpGQqrEqOKidxDUnYK8a0Tv9D96w
 BnxU2hu2Dnj65mn4PFx1VEia+49rTf+m/QsOKnQQZYc1NFwBL7efN0R2m+GNuY8pyH8I
 Q0zy6BBdHsbvG5dEg75Am4NHEDT6xzgLpqkojogGLihKYdoOQ/Tnb8GMDOF6cw+R5fYh
 QRAl5zA/yM+tVpSL5W4GAoOX2wjKDb+t6J3+GeL8ZnsXze0yLkSkc+UigQ50uQZ8TgYY
 sHPORZPoheVWVHEekkhmoMUkQeEitml0vJBYOUdLzTp0lXgK8+f+aaRJZ8RoBwNSZv5h
 JcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ChbXoBI9PTstc5ztUVMkoXJAxqyW6lL7AXSb4LcVBQk=;
 b=NI8T4y2QaP+P5+yUyOegdJoZQX8qH2TbyMOlJb85TD3pokZfAb8TnbHDh33+5DcKt3
 ivG2SLsWxPY/zBz1KHtgznobvPbFZfWDvhojB6XhS9wQKFm0A80RtsCVvzBF+0b5llug
 s7wjzJ9j63YedFSI4FqQR8ljEDVsgVD0teOGEzXGjonUSUh7pTg0P128qH3l9P903/bk
 OeF3vvN7z4SsdXWtD5JWLowE+hL4Biy05LcVS42oFII6Qi4JHoteWo+bCkLJ+bGJczYk
 rPCPUvEa/VHMIDOelWB5QZlB9+PSBixu0nEfKo0A2zT0VYuJV0rhzWgOqu2/RFcgMxlp
 wPfg==
X-Gm-Message-State: ACrzQf3ALcZ2ceAFCMD2WINqDeo5dKZv0fTD6cOWm7nBpcI33OKILgg4
 zO7Z870GnGlNJSv8r8Bf/7t7jQ==
X-Google-Smtp-Source: AMsMyM6vxTbsEQw1CE+xqx0BahTmAwU4msygPjW2qQyVNfLZ7pwDoUs8KBQfvTbN61n/oP3XmQ3XOg==
X-Received: by 2002:a05:600c:3b8f:b0:3cc:c287:46f3 with SMTP id
 n15-20020a05600c3b8f00b003ccc28746f3mr5043562wms.186.1666588053349; 
 Sun, 23 Oct 2022 22:07:33 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a5d52ca000000b0022e653f5abbsm25834760wrv.69.2022.10.23.22.07.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Oct 2022 22:07:32 -0700 (PDT)
Message-ID: <beee91cd-7e90-57b3-1f10-7d2fb21e6877@linaro.org>
Date: Mon, 24 Oct 2022 07:07:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v2 24/43] hw/isa/piix3: Rename typedef PIIX3State to
 PIIXState
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221022150508.26830-1-shentey@gmail.com>
 <20221022150508.26830-25-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221022150508.26830-25-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/10/22 17:04, Bernhard Beschow wrote:
> This commit marks the finalization of the PIIX3 preparations
> to be merged with PIIX4. In particular, PIIXState is prepared
> to be reused in piix4.c.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix3.c                | 58 +++++++++++++++++------------------
>   include/hw/southbridge/piix.h |  4 +--
>   2 files changed, 31 insertions(+), 31 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


