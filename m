Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AA8495E7D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 12:41:05 +0100 (CET)
Received: from localhost ([::1]:47562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAsHu-0000fG-LU
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 06:41:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nAsCk-0006ja-ES
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 06:35:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nAsCg-0002gP-JQ
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 06:35:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642764936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AchzIubqgm8w3rjpET8H05LTQtjFygndjR6g5twktE8=;
 b=RMPdgYFpJoPMef6qVnE/bs7XlQqb+V4pa5JoKdqQ733bfWGxdicXsFiLVE11wtswu0ePlK
 BbW7CwWCwGJFramOWInhaqePajPlfyPBaih9PSYdjreV3w+ueQCju/4GDaCK9wWxD0fta2
 ziIkBP/A7JQF21KLApmpAv5igXwYWFM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-hIhgSGo0P52Ih8B3t2y1eg-1; Fri, 21 Jan 2022 06:35:36 -0500
X-MC-Unique: hIhgSGo0P52Ih8B3t2y1eg-1
Received: by mail-wm1-f70.google.com with SMTP id
 w5-20020a1cf605000000b0034b8cb1f55eso9320874wmc.0
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 03:35:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AchzIubqgm8w3rjpET8H05LTQtjFygndjR6g5twktE8=;
 b=1pCczkDO1tLnqeIpn2bCgbZuJcS7AgoQfZQTX/+QreG5GhlFXX1kPmB3YVGk+YWjLn
 cHwuHhIvY3T5HVMXPW1XGUU7a/WKfdUis9ha8iMY7SnN5ILTi0ziAW6svm2Dsh04rEFJ
 G9eeVS5+rXt/w4CbssaMnfQ8RuVnyszHLXUuy4kR6cdM37Wjk9iPZJjgny03/+4sZ1ff
 4nCPiVyPB2DEn/xwhxmoIIG79MH21KHrhNf6N2957GcxkmYFmC4j6kvKzYJCX4P6FSmP
 uJTeFntt0YcQRbsfbN7IwQdtvtcso/TOWQ6s9M87gK57GXrp+wER72bdRFCUquIlrD8I
 U5ZQ==
X-Gm-Message-State: AOAM531Q9lP08W8533q+oYb5oB1cOrgqCQ2zA+UW/xkFF8MhKlTuMwH9
 ZN0cEuoCotRSBd7ERcUHaR4ST0vKkFBGAvQkN2DRzB7Yl1OeaFBSWyaYSeKKt4FGrF2v2ZR2KeF
 Ou0fXp3tfDtgVEwk=
X-Received: by 2002:adf:ea02:: with SMTP id q2mr3381265wrm.302.1642764934604; 
 Fri, 21 Jan 2022 03:35:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmuvUqbKApeelyraSa4NdAlw475f5KE3MPF9Ns56VGHKOoRTxTv6XEdtTxynyxB+wCVx3+OQ==
X-Received: by 2002:adf:ea02:: with SMTP id q2mr3381247wrm.302.1642764934390; 
 Fri, 21 Jan 2022 03:35:34 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id g189sm12135517wme.18.2022.01.21.03.35.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 03:35:33 -0800 (PST)
Message-ID: <7378d915-a6d9-45a9-d5cd-021d01d69662@redhat.com>
Date: Fri, 21 Jan 2022 12:35:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 1/8] MAINTAINERS: Cover lcitool submodule with build
 test / automation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220121103623.288054-1-f4bug@amsat.org>
 <20220121103623.288054-2-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220121103623.288054-2-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/01/2022 11.36, Philippe Mathieu-Daudé wrote:
> lcitool is used by build test / automation, we want maintainers
> to get notified if the submodule is updated.
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Thomas Huth <thuth@redhat.com>


