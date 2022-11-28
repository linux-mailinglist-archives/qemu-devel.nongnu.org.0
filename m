Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 594D363A2CB
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 09:22:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozZPB-0008Rd-AY; Mon, 28 Nov 2022 03:22:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozZOu-0008OJ-5Z
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:22:04 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozZOr-0002po-Na
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:22:03 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 m7-20020a05600c090700b003cf8a105d9eso7768076wmp.5
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 00:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5K4wdizwYh6yUw/6qUkU6eXhB2ScKolN9y3zBDOGDT0=;
 b=amLVl1NHzV88TK6uHcWGf8Gp8drpJyECmXtfHfmAstc05Or8lgjBEIs3yLXjG83Can
 j7Z8p5/M4rlfQLleb4j/x+BTCZFU323GDHgHRV2UDWKYxZKxcNRcM2Is+TcBqcDuLpEU
 EdVH65wnegkd7s3ONgbAKK2gzyC59NBvkiEZAh96qijKkoXNj5T75hF73x0Iz4Dh/C25
 XiWvRsQJ2OoC9xPjBRFUIydS0VWux5BTZVtuIvvAmKpxRbO8kTW/jQt38OB/2RFbQCaD
 HLQ6Hl59l3rEc2+EU3X9fF42zVzBsYunkwQLsg9AtbcV8p888/M6zXSOmaUssIolnlZn
 rGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5K4wdizwYh6yUw/6qUkU6eXhB2ScKolN9y3zBDOGDT0=;
 b=sO1avqFt700CMCUIevoNu+krAu3Yg7NPfFQ6VI8XcsjBeSXx77/Oah3UJ0N/ChU9RM
 LWuaIqe1wTnV7VfkJ6gzmDg6HWofD5eZRK9eWvztvcmFf8DtdAeTm19iKrNUDOLhDhTh
 NW9t5qEGoEgD5I8B+bJqZjG0IxVK4t2Uc4nGh2hUiv043kNDosRp+fZD44XV3SIKQ3oN
 O0c+wFSGZatcmMitAQKpu8TsHVHxAoB8HuVrqF2wlE48hWTu2aCN3vSsh+Z+lDWnsTSK
 szMs2OMi04uoT0NvPNPyOLvvDG1tZNtDdir4CHQqc1+EshcV3j/QGPwSilZodcMR15YE
 EKIw==
X-Gm-Message-State: ANoB5ple/uwtuuwPmiesuB6NUX5LoIULE42DO3q1TkdYLizMJ1p6YxCh
 z6FjO0Epd659LZ0pKC5drPKV1oX677szUiIk
X-Google-Smtp-Source: AA0mqf60uoN+pCuL9RpzE8Ss7jwd6AmDqpdoVCwKXiO3XRY+Ith6gR/lPOY2VFbdxCZWJiXm4yAVag==
X-Received: by 2002:a05:600c:3b0c:b0:3cf:8016:880c with SMTP id
 m12-20020a05600c3b0c00b003cf8016880cmr23396815wms.80.1669623720458; 
 Mon, 28 Nov 2022 00:22:00 -0800 (PST)
Received: from [192.168.1.175] (49.red-88-29-176.dynamicip.rima-tde.net.
 [88.29.176.49]) by smtp.gmail.com with ESMTPSA id
 j23-20020a05600c1c1700b003cf57329221sm19280887wms.14.2022.11.28.00.21.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 00:22:00 -0800 (PST)
Message-ID: <51e1fe83-96c2-6dbc-b258-2cbff8e00e32@linaro.org>
Date: Mon, 28 Nov 2022 09:21:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 11/12] pci: Rename hmp_pcie_aer_inject_error()'s local
 variable @err
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, dgilbert@redhat.com
References: <20221128080202.2570543-1-armbru@redhat.com>
 <20221128080202.2570543-12-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221128080202.2570543-12-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 28/11/22 09:02, Markus Armbruster wrote:
> I'd like to use @err for an Error *err.  Rename PCIEAERErr err to
> aer_err.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/pci/pci-hmp-cmds.c | 34 +++++++++++++++++-----------------
>   1 file changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


