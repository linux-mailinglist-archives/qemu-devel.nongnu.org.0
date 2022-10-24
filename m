Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9816609B05
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 09:09:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omptT-00007X-58; Mon, 24 Oct 2022 01:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omptP-00005D-Km
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:20:55 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omptO-00030Z-5K
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:20:55 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 r8-20020a1c4408000000b003c47d5fd475so9218670wma.3
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 22:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w5el5hgIRacU22ZDSHlMNMbOn8yY7XbmSNBgJNXio20=;
 b=WrmD9YHaHmNSmlTuLgFfg6wQR5Qu1dFczn39OsDF7pfjZ17nMiX0r4DurC3yomT9H9
 zii+BPqzEpvcjfzCiWJC8MuGXozHUWNJ+mym3tf/tF0My8FswlFoNuaXUzs7QajLBjeC
 3EilHwx10iqjAq7DkdcBvpvehWJoOpgTkaDKpyh8ilK0/UtMErmbG7IG/K3wC5+7H2Ep
 UW81ZbIX4Sh7fVJEuz8U6Cxu2JvAfF81tuE9XWJ2XuT0GlHES9bzUI4noh/yy+v+G4sh
 wWlncLN4Bzsz54c9t5aPjSimhiZPdI0utcbOskR7BWOivC7cI9TK4gZPVCIdX1yVqlmE
 cEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w5el5hgIRacU22ZDSHlMNMbOn8yY7XbmSNBgJNXio20=;
 b=H5+ae5/06x00CMENWhEWuP12n1c8OBRZ4e6ZlGNbA8btLtS4AYKRTHmqY6+pGOklVj
 cOAoO0Nfvp0coEMjF3NZ18B0kugoFt66PWWSq9k1C7u7AkF8IHp8x0QH3xR78cACWUnB
 WZPYcSHViUMGnZRxAKq6+6ILeNLT+HYRQXuJlI3YPPzFxVem9fkNcZKaOadqAQERPLpH
 3LIWpGThRYWtd7eC54FSk1icARZ+id8gjSA9NZtjrNdUDRRRhZviDkk00ZpxDpWeWIJ+
 lj4Z4yTggroGT38KBEBarf0MdCtN/vSPFggUTXwKWQh4HiSpWEpoxP3gy1NRTUvFKoTw
 PZqg==
X-Gm-Message-State: ACrzQf07rgNHmPVz1Uae5/4tW+/mvGDZBilmye+v7ozWLK2WYIQ+162i
 MW4COcXf0wzpOtqNNDaCsZ74rA==
X-Google-Smtp-Source: AMsMyM5thZ9X4C4hlThWzyyiK9+/3PLztDjAh1RFE+rHSa529gMfvRQlhkOoZRP9XcGeKo/9kIq+3g==
X-Received: by 2002:a05:600c:5398:b0:3c3:dccf:2362 with SMTP id
 hg24-20020a05600c539800b003c3dccf2362mr21529636wmb.89.1666588852462; 
 Sun, 23 Oct 2022 22:20:52 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 n4-20020adff084000000b002366b241cf3sm3153349wro.35.2022.10.23.22.20.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Oct 2022 22:20:52 -0700 (PDT)
Message-ID: <b875102b-5d07-b1bd-bb79-bb33e5cfbe65@linaro.org>
Date: Mon, 24 Oct 2022 07:20:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v2 34/43] hw/isa/piix4: Rename reset control operations to
 match PIIX3
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
 <20221022150508.26830-35-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221022150508.26830-35-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
> Both implementations are the same and will be shared upon merging.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix4.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


