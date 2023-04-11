Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09AF6DDAFF
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 14:37:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmDFP-0000zU-UM; Tue, 11 Apr 2023 08:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmDFK-0000z6-U5
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:37:14 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmDFJ-0001NO-5c
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:37:14 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 d8-20020a05600c3ac800b003ee6e324b19so4192960wms.1
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 05:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681216631;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ieRYjbjc0R7VAimsYZbALFqMAhB642YecdfGIwtUfRs=;
 b=LaPq74TXIbr1ZSUjAAd4AON6evtmQyV1f8W93vlv7WS9S0upkI2iEtC6PwZTYzI4F/
 KPPz92oZJ8xu77I/Cj4IrawJmuYVjGTtSWcpePlToCthwt7yMIsdK551gbOzr83DxoVE
 sTeSBZ7aeErqWCI1ahzjRULw4qG4B1xNPwcXd8/NkFmCsL8wbfX0R6ahfpVWUMx2H20M
 2WwkQuTnGWft3pNCvZdRhy1zejOCc+RgtUcYXZgv2pdSkrr1p+bfkPZZTdVGrppnkGQo
 nGntoY6oARhKBYh63BuXGH8WyYT5q52LHUVBFlh1nDAPH3wfJTOBOf0TxgbbpKXfG7tv
 EJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681216631;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ieRYjbjc0R7VAimsYZbALFqMAhB642YecdfGIwtUfRs=;
 b=fKqLChOgvsdXHKAmXDUVN+jHn4ICYrg5rGJLPOz/uioUMtPQWc9PTRe7fXBOuTAq/Y
 wzy2mstp4znxhKOcgJOsar3VmPJnYES1JSCzWyfazFlu4Az1twzn0iUSoxBWFsuHHETo
 bi0AAgaR9c2Y4+h5SXHTJr4Wq+5S6hZ8hXkL3lb5J7X65RuRPVV2ebq7/dmBk3GA7Dbm
 sRlG3Liq75IOubesJD2lA0mp45xvqBzx8oHtcaHEHzZADWuoU5YbcuFdjB4Xjtupt3J8
 NxnY0WKbIJ1AZU8oN4Cy0jQHi92gjoryk2tjKOc+DVFw6EausflXPX1vCZ19Pyf9+HC/
 8IXg==
X-Gm-Message-State: AAQBX9cUz0wFc0ZKf1T2RIZxnvMaWc7ZmfWUeYA25vty8tSKbGAolPxY
 Xpy2lFtOeYA3NPg6y9HKQXpTXw==
X-Google-Smtp-Source: AKy350Z2orEPeeGfM/LUS3O5QQnLRz9u0q5tyqyPiSC3wbho7N68JRgBNZssSDb3Ucz1zx4rLnPhYQ==
X-Received: by 2002:a7b:cd0a:0:b0:3ed:5a12:5641 with SMTP id
 f10-20020a7bcd0a000000b003ed5a125641mr9683627wmj.36.1681216631113; 
 Tue, 11 Apr 2023 05:37:11 -0700 (PDT)
Received: from [192.168.1.101] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 j23-20020a05600c1c1700b003ee443bf0c7sm20698789wms.16.2023.04.11.05.37.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 05:37:10 -0700 (PDT)
Message-ID: <fe33efe2-71c5-32d6-55cf-5644fbd94355@linaro.org>
Date: Tue, 11 Apr 2023 14:37:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [for-8.0] hw/i2c/allwinner-i2c: Fix subclassing of
 TYPE_AW_I2C_SUN6I
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qianfan Zhao <qianfanguijin@163.com>, Thomas Huth <thuth@redhat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
References: <20230411103106.3992862-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411103106.3992862-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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

On 11/4/23 12:31, Peter Maydell wrote:
> In commit 8461bfdca9c we added the TYPE_AW_I2C_SUN6I, which is a
> minor variant of the TYPE_AW_I2C device.  However, we didn't quite
> get the class hierarchy right.  We made the new TYPE_AW_I2C_SUN6I a
> subclass of TYPE_SYS_BUS_DEVICE, which means that you can't validly
> use a pointer to this object via the AW_I2C() cast macro, which
> insists on having something that is an instance of TYPE_AW_I2C or
> some subclass of that type.
> 
> This only causes a problem if QOM cast macro debugging is enabled;
> that is supposed to be on by default, but a mistake in the meson
> conversion in commit c55cf6ab03f4c meant that it ended up disabled by
> default, and we didn't catch this bug.
> 
> Fix the problem by arranging the classes in the same way we do for
> TYPE_PL011 and TYPE_PL011_LUMINARY in hw/char/pl011.c -- make the
> variant class be a subclass of the "normal" version of the device.
> 
> This was reported in
> https://gitlab.com/qemu-project/qemu/-/issues/1586 but this fix alone
> isn't sufficient, as there is a separate cast-related issue in the
> CXL code in pci_expander_bridge.c.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/i2c/allwinner-i2c.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


