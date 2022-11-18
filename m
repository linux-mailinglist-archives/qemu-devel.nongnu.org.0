Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF7B62EEBF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 08:58:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovwGI-0004Zn-Jk; Fri, 18 Nov 2022 02:58:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovwG7-0004XX-Lb
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 02:58:00 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovwG5-00024w-W2
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 02:57:59 -0500
Received: by mail-wr1-x436.google.com with SMTP id v1so7956572wrt.11
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 23:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MnthRJhvwO1Soj8hL4e5dQ2dpToNoQwaBK0lNsQ70e8=;
 b=BATqKNUxGbcZ9gsqPspByfLYGNMzIL7K0m0X9E6C+vG5g5m2lGUueE1tqdTFzJ9niS
 OfX3t/CBtxf0B+xu5VIrA/E3IvqfgHDWa1sWd2FTzQx0JYwM7us2TslcPNMAkdDI6yCY
 2fbltu/MqIewOYJwF5vdoA90xcrYCeItvNBzEGrbxo8NoZOlKHuagCEjWOGrNA21IVtn
 NAN/CEMY4U1XVf4p3rI7J+i4quDPpreNnNQpHa4uZ51I7IA2vMV0O/uIoNKPTc0BWz7O
 L2cMPtMO4/CZEsiMd0hxnutYWwqhScFNNBRHbe2vSFPkWKUFRDtR9AfCEfwikFFcCSwx
 w5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MnthRJhvwO1Soj8hL4e5dQ2dpToNoQwaBK0lNsQ70e8=;
 b=FA2LkOyplrNG3V1s8G2xUppRYnUUsnQrUVGMVAk1a0kPUr8ov2w821LmMH6P4JwAxR
 ZVNGsKCiUwBOTNSN1WUIKByviSyVo4lla58zLbmIoFYdvQ8BYoWzHmTdl0+9QP96JkzC
 eZnSro2DVxzvLhXMXitiHC6Ac2+Rk+T+P0qb1kInGcThS2Et8NZCy6WAl2s1yIsA8iW5
 g/H0Nx5zOVoFV1mozr4QPVxdsbvY4iVJ9NlHpFyUCqjuhIUl6YSIeouv/qBmMAenUhBL
 X2OsE7HOUUY9qIHgJ5IkOAkuo/Ll0kpRiecvAFqr/u56o4ALDc7ZRWO9M9tOcROukAmV
 3lpg==
X-Gm-Message-State: ANoB5pmOhW5qdPpqzdnERl03kQg5OR2+3rCL2evHF7YkAT8g1WR+/dxZ
 yYkyzYn9ysQrtxPdXJXMM5cK9g==
X-Google-Smtp-Source: AA0mqf5WWMEdnGtwhvlSnQMWsglAyNYPF/L9hsvhhMZpGH8wxnMdXCnZW/3nfiqDswkKcoQhzQ8JtQ==
X-Received: by 2002:a05:6000:1148:b0:236:71cd:1a71 with SMTP id
 d8-20020a056000114800b0023671cd1a71mr3540542wrx.712.1668758276717; 
 Thu, 17 Nov 2022 23:57:56 -0800 (PST)
Received: from [192.168.230.175] (34.red-88-29-175.dynamicip.rima-tde.net.
 [88.29.175.34]) by smtp.gmail.com with ESMTPSA id
 p6-20020a1c5446000000b003b47e75b401sm7899595wmi.37.2022.11.17.23.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 23:57:43 -0800 (PST)
Message-ID: <8db30e87-6f69-c173-308b-b9c41064362b@linaro.org>
Date: Fri, 18 Nov 2022 08:57:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v3 07/13] docs/devel: try and improve the language around
 patch review
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Markus Armbruster <armbru@redhat.com>
References: <20221117172532.538149-1-alex.bennee@linaro.org>
 <20221117172532.538149-8-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221117172532.538149-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

On 17/11/22 18:25, Alex Bennée wrote:
> It is important that contributors take the review process seriously
> and we collaborate in a respectful way while avoiding personal
> attacks. Try and make this clear in the language.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Message-Id: <20221111145529.4020801-9-alex.bennee@linaro.org>
> ---
>   docs/devel/submitting-a-patch.rst | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


