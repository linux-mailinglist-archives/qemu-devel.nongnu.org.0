Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3C02F624A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:46:42 +0100 (CET)
Received: from localhost ([::1]:59484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02xV-0003lw-R7
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:46:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l02m7-0007P1-0X
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:34:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l02m4-0004Td-J2
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:34:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610631291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O/NY98ayhHzj6L65ZNzy1SZYyszAz2wW80VvrbDY3/M=;
 b=DPjh61WeyuyMjXg23CB31JLEDtSDb2pd6ZRfS2MuS3HhvhBfO6PZ73xQ2a4iaydaFetb5J
 j3/ISNBQmJbUzocqUKPw5UbodkWEcc7wFvMtAZtdhdCPVPuDE0+6MhpUe25Lv0plfrpanh
 TN9+Rz4IXH50TjSNAHHhG7i0zOWSnkw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-HalHYqKIMGqSkksNVHZTKA-1; Thu, 14 Jan 2021 08:34:49 -0500
X-MC-Unique: HalHYqKIMGqSkksNVHZTKA-1
Received: by mail-wm1-f72.google.com with SMTP id x12so667880wmk.7
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 05:34:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O/NY98ayhHzj6L65ZNzy1SZYyszAz2wW80VvrbDY3/M=;
 b=n725NP6j3moMA7HJWkFWRwHRibznvxN2r2gXSJgvWzBG48i9hKv/JuwcVNuvJjwsSv
 /+vf1X6KgI9Dgal7v3n6lbM22D80xaIHpQFj05QosviZUiPpkNU4B6xCj3BGmyQUMqGI
 AbzMVtLiDkVlttVoegX80z1F98aT/Q805tL0V32KNv1tcuc75uePq3A8vp+yRkRpecyY
 8jkiSkIzNINAjDIAYO/daOGMduERISXgPW9iAwhbXObeQBszP6UDhxgpnNRxPatc1zKd
 x7kO9PSVO2aC2/Vu1ikxkwJwFk19blIhn59Twx7GSTpA+kTUaQwMhKTtu9UtgfeSpieP
 xXMQ==
X-Gm-Message-State: AOAM531l/Mr0GPGB/VK1LsQfwoDeJi9mkL/taDytc8HIRDeYN7S6b7iE
 zGlzWn5zoliQqUpZSCwFgVR8TzclthhLNv6nyJOVD8btsNwtbuuE8ipiqNHHW4rRoboeXVCuxBK
 vA2YRwr0C3Gi1Fuc=
X-Received: by 2002:a7b:cd91:: with SMTP id y17mr4040527wmj.5.1610631288689;
 Thu, 14 Jan 2021 05:34:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwat2EMgBQtZpu4nkJPe908uTqvInMe+rIkEyafRY5qDhFWnIeZrRj6luSiQGNb1u7dThbXxw==
X-Received: by 2002:a7b:cd91:: with SMTP id y17mr4040520wmj.5.1610631288539;
 Thu, 14 Jan 2021 05:34:48 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s20sm7980118wmj.46.2021.01.14.05.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 05:34:47 -0800 (PST)
Subject: Re: [PATCH v2 14/25] tests/docker: expand centos8 package list
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210114130245.1654081-1-berrange@redhat.com>
 <20210114130245.1654081-15-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d71f0870-81b1-ba94-01f4-b7bbbaf239db@redhat.com>
Date: Thu, 14 Jan 2021 14:34:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114130245.1654081-15-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 2:02 PM, Daniel P. Berrangé wrote:
> This is the fully expanded list of build pre-requisites QEMU can
> conceivably use in any scenario.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/docker/dockerfiles/centos8.docker | 65 +++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


