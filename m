Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 199BD63A2F4
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 09:28:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozZUY-0004Z6-9f; Mon, 28 Nov 2022 03:27:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozZUS-0004Qn-I8
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:27:49 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozZUQ-0003rz-Ve
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:27:48 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so11020389wma.1
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 00:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9I2zrDAJgUwD314VtyzCxf/u4yY5xj5Gx2w3qhd6gF8=;
 b=ybBSJe2W7mzngmrJ6t27g9snC/t1I19HnCMxY/Cx0Fc+lh6AC6NNzbFE8mrxZ5N36R
 txrEkfw7Vxaay9kFOpJCiTWynPXem3lO0s+iZUN/A/gsVMSopyHU5LVWJ+lyaXcLQSB0
 HNH5qBLacDSqAVM1TcpFmVjbK0Ugl2Iy6EDsDUnU+700RzY2rP32CL6DhSu4BKNokKBd
 7dttYa0ehxE/0Uf8ZAWzaP9YgsUaoziKblNXeUyAMU56lw7PV5Y9hjkHs5ofccacDiLu
 fShg6RBMb9ASK70jXeJqTdbhdji4T2pR7VHai8u/29pnZZJ3ySdjYz5kwSJJCK/z/Ejy
 +dfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9I2zrDAJgUwD314VtyzCxf/u4yY5xj5Gx2w3qhd6gF8=;
 b=F1ZfAm4pLDvK4xoGqP1VuXxP99G8zvMKadrPep2B15KUx6wZI+CppnvoecAGvAbuJe
 U7AoEANaAk8ffw0ntuklvWxKXkz56PLvkUb8hlyQ0w4dFhBxL53z2vQo5qZqTRQVlahU
 wZyYgPcmf674DpW+/NOdX8iTGkvcCvkQyhKVm4556wwzkCSyZDGa7SlICl7gHT/xwBKK
 1ZOAcvDY3NcJ77GWBX4MfJ/IpC9w/sQjC3S0X3FrkRkJNXVgTs8xDLhlgsHBLD23l2YM
 qfko8XAwcCikvIGedUxvENPcxtzB/PiIiL2rZ6LGd4XWGLCQ5aHqUE7OnEC7QoeNd772
 3P+A==
X-Gm-Message-State: ANoB5pki9xuGRexVOn1414z2/g+vXTlDYq6SMTpEdgbowolTt5uGmRSv
 rJ7J7sUR7tSnmg/jttQF/s3Fag==
X-Google-Smtp-Source: AA0mqf7000Y/yK/NFs6ucFoiSuhk9RH3JdxUD75wMlRMS6/2Vug7Va9UIvNIWd7kEZFXUaZNluPPWQ==
X-Received: by 2002:a1c:f401:0:b0:3cf:8731:8110 with SMTP id
 z1-20020a1cf401000000b003cf87318110mr23195987wma.32.1669624065461; 
 Mon, 28 Nov 2022 00:27:45 -0800 (PST)
Received: from [192.168.1.175] (49.red-88-29-176.dynamicip.rima-tde.net.
 [88.29.176.49]) by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c310e00b003a2f2bb72d5sm22557118wmo.45.2022.11.28.00.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 00:27:45 -0800 (PST)
Message-ID: <02f767f1-d08f-35f0-b73c-87926f5024ea@linaro.org>
Date: Mon, 28 Nov 2022 09:27:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 01/12] pci: Clean up a few things checkpatch.pl would flag
 later on
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, dgilbert@redhat.com
References: <20221128080202.2570543-1-armbru@redhat.com>
 <20221128080202.2570543-2-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221128080202.2570543-2-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 28/11/22 09:01, Markus Armbruster wrote:
> Fix a few style violations so that checkpatch.pl won't complain when I
> move this code.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/pci/pci.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


