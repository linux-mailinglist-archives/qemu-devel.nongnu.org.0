Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E723BA8CA
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 15:01:52 +0200 (CEST)
Received: from localhost ([::1]:43668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzfHL-0004qP-F9
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 09:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzfF4-0004Bq-Fe
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 08:59:30 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:39890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzfF3-000489-35
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 08:59:30 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso10826260wmh.4
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 05:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/OtjBpmYcpjVG6wpF6oARLCm/RYlVhOin0kwC29oOqA=;
 b=blYIENmt0c6K6khpiVQ397tfyFEB4r62yQQye1FaFHnnwoD+AGd2ejdPS2IBqyxE+q
 b4EgOxf3eXz6VSE+4kXmHuwq02T2XtWBtwmMRtVVT6GBUTN4p5Au/hDELL9K7x1bdkdc
 FQZMZnZLGL49cIux3htRPb9YWiHMZ2YNW0KGqzQBC6VjcTBVgwZuvq5qKSiEdko3qJ9R
 JjXeOGXpX/xY33rHjTJKXUBZt6wbaXPYRzaTUNiWZXuGF6Z7TUZjJuWaCqUPNhcd9T0i
 LiKRJbUyAjLUjH8swwp8lJnOUBKRRiCd3JfhqVcbxqPoGg4CLz4ZScAvQfYNui3TykaG
 ThgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/OtjBpmYcpjVG6wpF6oARLCm/RYlVhOin0kwC29oOqA=;
 b=aLGppnnDiOMTjn1aZGPG/MuUCR5GNWqnFw5WXfJ7fjwpGPYYAf21i0NU3pGN5jVfYM
 E0Vpp+jqmqdZcPUbzD1VzYEzwXluTL1CW4efXBr6bQavEkJUS8UKfdznlCsezBNPepZv
 Mz9/C0w2//xW6mwt673tIcMti0XJY9KuSBJoYbKjXz1uZmyRhlztDCzlbWQELBo6F96Q
 2XPlQP4pRzX/KLu0KcgbIFFBNvatswMH32IYCzpRLfS/t5uTeo5+ryxEuN+rtMfviLSo
 tXEJZpSMyANrhukCPl/w784HShUq4vqZepmNDe3wlAsC9M8gzK4YkZEdLK58Oao9LImq
 ACNg==
X-Gm-Message-State: AOAM530UVMe3ayPdxsWiFiAAGWjiHyma+1SxCR4EQrOP3Q+BXSfhyceD
 cF9peTnh7g1SE7Zk7bWvSKYuaieZkYQshw==
X-Google-Smtp-Source: ABdhPJwlyke/KFbmksIxEsCekDgRPI81xWEBKCGgyJSoMRy/KeOhoOhEdwD6do36kHRtpBRwuSE4Sg==
X-Received: by 2002:a05:600c:354d:: with SMTP id
 i13mr5011717wmq.143.1625317167636; 
 Sat, 03 Jul 2021 05:59:27 -0700 (PDT)
Received: from [192.168.43.238] (184.red-95-127-187.staticip.rima-tde.net.
 [95.127.187.184])
 by smtp.gmail.com with ESMTPSA id n12sm7362128wmq.5.2021.07.03.05.59.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jul 2021 05:59:27 -0700 (PDT)
Subject: Re: [PATCH v2 09/10] dp8393x: fix CAM descriptor entry index
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, jasowang@redhat.com, fthain@telegraphics.com.au,
 laurent@vivier.eu
References: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
 <20210625065401.30170-10-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8a0c3bf0-509d-d115-ebb8-aa201149975e@amsat.org>
Date: Sat, 3 Jul 2021 14:59:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625065401.30170-10-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/21 8:54 AM, Mark Cave-Ayland wrote:
> Currently when a LOAD CAM command is executed the entries are loaded into the
> CAM from memory in order which is incorrect. According to the datasheet the
> first entry in the CAM descriptor is the entry index which means that each
> descriptor may update any single entry in the CAM rather than the Nth entry.
> 
> Decode the CAM entry index and use it store the descriptor in the appropriate
> slot in the CAM. This fixes the issue where the MacOS toolbox loads a single
> CAM descriptor into the final slot in order to perform a loopback test which
> must succeed before the Ethernet port is enabled.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/net/dp8393x.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

