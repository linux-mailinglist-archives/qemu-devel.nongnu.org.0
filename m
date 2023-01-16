Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2A066B92A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 09:40:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHL1T-0001NA-Ld; Mon, 16 Jan 2023 03:39:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHL1Q-0001Mf-Oi
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:39:17 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHL1N-0003MJ-UG
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:39:15 -0500
Received: by mail-wr1-x435.google.com with SMTP id k8so12201457wrc.9
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 00:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=41QeNXP1IEfbGMx9Lk5LRMYwiu2lUjMaZEfYeTNEoV8=;
 b=TzSfxSKh6Ox/m8n8TtnhhBL+MhDIiidS+5DFQvcCmMoWqh+sy1l/+gkS/bk8LfNmGM
 EnSxzVH6n4tmvpz3orhGHF30xnk4+z/WOygz7Au58k8XQtUqIGu5k8mcdcJlTiQwB/M4
 k4Y4W2p/WLsn7dLNfFWVpXB1vX2Lem1qMHLSECMUJjMJ3nwZBzzGb64FN53RPI9bEHkE
 sNsjUKzHvNXxENbXJtVBJUyqgX2anu+T/Hgmd9lw2IpKmIXLIc5nU3HrjMCIDmiOtvLy
 vu4+2WhHEvH9I8UIwu9jrYomWsw3BavMtwcDtjeuSiwBCbbKq+92IJl81QhOBbQ+sxh1
 xJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=41QeNXP1IEfbGMx9Lk5LRMYwiu2lUjMaZEfYeTNEoV8=;
 b=CfBCBfzmV7XJIPlCNZrFKcOf3RZBClS8XTfkDKQTVQeX50IzFeZlsyHugz7nQRv0E3
 ZF/oNsjJI1njcJy1EIXTKBkVf187u8FjL5IPlInAVuLQUmwZQEWKHpxfDCYEgN2IMtCn
 kjN/6/VXJPWGdMlGNyzxhh2e/EJ+U6oE5Q8iMH8H4fBwbpp9OEGHcEymysG+9wvAQWEZ
 cDnX/lkXsd2+lchL/U1dDorSSgtwRRAArmajKAHSgVndOpseovGRDCTriXjn8J79UlMt
 ZmN3C1nZLwWppufgV1UVagi2msVvq/4LbqK2p7Uc+CxCZ7R2J8TS2FaI+leh8pPfW1do
 CQbw==
X-Gm-Message-State: AFqh2krKJEWtU1f94a3taBdLKpCn7c+AY+whMyxX+yJbEvvSv2qIrWW1
 RsZGzXcXT3zcQXcOSeavzCKD8A==
X-Google-Smtp-Source: AMrXdXu3ydip1YRlkesu+6xMJa4FofWA9FkvUifRPSK+l0MGueCfJ3MhxqUT2GbXc4g+4Fuarg7KoQ==
X-Received: by 2002:adf:cd02:0:b0:2bd:bbf6:6adf with SMTP id
 w2-20020adfcd02000000b002bdbbf66adfmr15771147wrm.20.1673858352393; 
 Mon, 16 Jan 2023 00:39:12 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w10-20020a5d404a000000b00275970a85f4sm25559317wrp.74.2023.01.16.00.39.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 00:39:12 -0800 (PST)
Message-ID: <f542fb40-1c8d-a222-476b-28b2319cfcfa@linaro.org>
Date: Mon, 16 Jan 2023 09:39:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v3 22/28] tests/qtest: Restrict bcm2835-dma-test to
 CONFIG_RASPI
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-23-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230113140419.4013-23-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

On 13/1/23 15:04, Fabiano Rosas wrote:
> We will soon enable the build without TCG, which does not support many
> machines, so only run the bcm2835-dma-test when the corresponding
> machine is present.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/meson.build | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



