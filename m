Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1197B65BFFF
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 13:39:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCgY1-0000yA-Io; Tue, 03 Jan 2023 07:37:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCgXY-0000mn-Ff
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 07:37:13 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCgXW-0003vb-TC
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 07:37:12 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so16459887wml.0
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 04:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GU+UPaPJIxyapDIER8KmniM49s1ahX3/Yf813loU/JM=;
 b=o+81A/T+xXnNd1uc1qwaRXdCpIbf9Yp+3c7n5Z9vJOHzNhmt71kUxPtQ2w2bSJJj08
 lYPBahW0vr9AoSYcIyoyUKf1z8TbmTKfConfi/4vaxrP5Q3WoPGAXjZCLTPjUZ2bxnkv
 fDfaeozxrfacvj8rf/4Yi1PMVT2kjts+61/9V2bEkIwsfY7ip+s2kFJHGyT8GpFYSQX1
 Rpi8I5TqwwpBLNKaL8VJY4XksLZNiO5J/BHcGkKjNaFBJ6Wzx3YGfko9kiD5sIadA4tv
 tN1rjzuGrC2T8ECU0jsXlZyJAWi+zwcWcNcVCM13AjOeiY1OPWmvnXApTG5J8QXLMx+y
 /+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GU+UPaPJIxyapDIER8KmniM49s1ahX3/Yf813loU/JM=;
 b=DbG5Pru/aRlvhGjeOoFcWkqDOTzByJPp3iXCzDYAewGtbdoEiNvkljHSyK8SPjDrg/
 2xxKzLAeq+AMTPAD+o8nhlkntKXpM6fgYQ41510BqX8RWmWdiqdTLEhBr2w+nJwbqgj+
 4pPGu8jLIiRrW/Ihj3SsaKooo18KisRiJg184nQtfYG7EJ3zTcv831IgI57XflvYc9AQ
 XytvHCk0RdA1w6wg3J0OiDARVWCPm5qNZ9GFhOJb6kikfCWbhww73wljD0bYZfu7dTis
 ZBgz8VMLjIWMIZzo+jqHv3VN57v4M32SJ4pQ/H7FV0I1sFvq1Qqjm85F7KmpW4Jx9cAu
 1HNA==
X-Gm-Message-State: AFqh2kr+X+HLAlYfN3kW1ctDkoPVVCl4c/pI/LB3nL0IYkJntaOEbwso
 9Xk0LsNCdxn+cBkH8iJWmPt9sQ==
X-Google-Smtp-Source: AMrXdXsYCQ2IRBL0Ajls53TElfM1u962yn6g5VlHEGkUN8ZlwUqxPTx6EfWL7U9icwvP//0tth1naQ==
X-Received: by 2002:a05:600c:3491:b0:3d1:f16d:5848 with SMTP id
 a17-20020a05600c349100b003d1f16d5848mr31666931wmq.26.1672749428760; 
 Tue, 03 Jan 2023 04:37:08 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c3b0400b003c6b7f5567csm73482850wms.0.2023.01.03.04.37.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 04:37:08 -0800 (PST)
Message-ID: <c7e8df6b-7ac9-f331-e96f-0edbc16fd426@linaro.org>
Date: Tue, 3 Jan 2023 13:37:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 02/10] tests: fix path separator, use g_build_filename()
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230103110814.3726795-1-marcandre.lureau@redhat.com>
 <20230103110814.3726795-3-marcandre.lureau@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230103110814.3726795-3-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.103,
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

On 3/1/23 12:08, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   tests/unit/test-io-channel-command.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


