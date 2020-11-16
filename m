Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D6A2B43E0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:42:21 +0100 (CET)
Received: from localhost ([::1]:55296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedpr-0006mo-SO
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:42:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kednd-0006E1-QS
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:40:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kednb-0000Bg-99
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:40:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605530398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N6vJafF+ZWVlhyoMmgfR0sAS+baM5HwENF+9ycZo8cY=;
 b=IxgP110/jQp90zWilQ02uEFOHTsQ6OYdW9iac6bJpiWVnVydqoh+y6MWiPh+/r0M2A7Ysl
 p4V4wUmGPoNUo3e2TbnM1rt/R5KM3eISaYC27x+IUrIcfHZgamMgF0X/l3H74cediJLsO7
 hAWlIqs2/G1h0M2HDcDIlw+qHQDycsk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-y1IRJfsUNgWHo2RiSqSJqA-1; Mon, 16 Nov 2020 07:39:55 -0500
X-MC-Unique: y1IRJfsUNgWHo2RiSqSJqA-1
Received: by mail-wr1-f69.google.com with SMTP id y2so11136743wrl.3
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 04:39:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N6vJafF+ZWVlhyoMmgfR0sAS+baM5HwENF+9ycZo8cY=;
 b=VOUFV3tcCYdC/w3o9HTlhX2e45+EIY8T8EKeb0mT6+s9TwndsPn/bSvuxfWf7WPvrb
 z25hR9rIOiSTPQfAUn0AhuT+4lqRyxMxp0TgNlNq+vfZF4tWeJrHPPOMCrOw6ZEjhSg3
 nw2R1uTu2/7nKCGzKOx7pDi0/qQ5VPDcA9GG9FRdBAlX9X1c61BsxUBEqr+BcflNRQHu
 aVm7M+jmmgdFNg7JeRRNgAsK6Juhpi9hRnt0kjHfSuk4VHQr5b+KpVhpGz9U2AAz4nDu
 fyUa+uXP/ERCfkWS3XWG7g51RhIzRFZsQRJ4lD7YexxyyJWiW9LUyb09OEOuYrRMwRAt
 Andg==
X-Gm-Message-State: AOAM532GTT5f4rEYvGifSVhwPfEYaknVD/GGD98UNDVUYrTZbQS+bZIS
 3VeP6zM/8IBlB4k7oPBmrgXymyPHNZCASBSfD++7MoR7gVbldBnfUvJRuCm6oXnHbSp1JxCZPjA
 tzLo2X8DTVrkHe77BOH5NNBKRXy5UTKY/Y0pEKZEUNSC2qPOGDc5EqQ13Zn5vkjTX
X-Received: by 2002:a5d:4d87:: with SMTP id b7mr20063395wru.115.1605530394506; 
 Mon, 16 Nov 2020 04:39:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+Hl7nWspvikPy3CQCflRfja98CLPGTsQzN4Sh3h9WNhrV9Jcbw6db60eUdxrPa54MUjhr3A==
X-Received: by 2002:a5d:4d87:: with SMTP id b7mr20063376wru.115.1605530394302; 
 Mon, 16 Nov 2020 04:39:54 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id t9sm22579950wrr.49.2020.11.16.04.39.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 04:39:53 -0800 (PST)
Subject: Re: [PATCH for-5.2] iotests: Replace deprecated ConfigParser.readfp()
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20201113100602.15936-1-kwolf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e8e6509f-6f95-27f2-f9f5-108a70267e3a@redhat.com>
Date: Mon, 16 Nov 2020 13:39:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201113100602.15936-1-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/13/20 11:06 AM, Kevin Wolf wrote:
> iotest 277 fails on Fedora 33 (Python 3.9) because a deprecation warning
> changes the output:
> 
>     nbd-fault-injector.py:230: DeprecationWarning: This method will be
>     removed in future versions.  Use 'parser.read_file()' instead.
> 
> In fact, readfp() has already been deprecated in Python 3.2 and the
> replacement has existed since the same version, so we can now
> unconditionally switch to read_file().
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  tests/qemu-iotests/nbd-fault-injector.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


