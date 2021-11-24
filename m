Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE3245C5B8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 14:58:47 +0100 (CET)
Received: from localhost ([::1]:38456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpsnO-0000DP-UW
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 08:58:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpsXN-0007XW-Rx
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:42:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpsXL-0003FE-5R
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:42:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637761330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2vQDGyT8TABGtws2B4wWIbwgPlf/X7dvXSymMrc7Jkc=;
 b=OQzXhokbw7+T58uvl9fRWchhbPvtMzzaYXFZnLY6VJ8u/Rv6rUODJIh8W6ts1VOH1r/z+D
 Y0wrmZ1Bt2VeR1+jMK8gvJ2yjrBCRqMMwm0TAdUu81AYk4uPOeTzfbD8fvF100VCJ9HlX5
 ghxctmr29Kqss3f0vH7BBP279TgsRKI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-_VuGHzA5MhGX6ysQVOskHw-1; Wed, 24 Nov 2021 08:42:08 -0500
X-MC-Unique: _VuGHzA5MhGX6ysQVOskHw-1
Received: by mail-wm1-f69.google.com with SMTP id
 n16-20020a05600c3b9000b003331973fdbbso1505897wms.0
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 05:42:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2vQDGyT8TABGtws2B4wWIbwgPlf/X7dvXSymMrc7Jkc=;
 b=vlpNTlq1faGyXd5v7enK+nKq600+oMXfQVmoY5ctsaKheZVJI07ohO3AVGTI6iui3W
 mf6LwdbFRIDXDty09bkY6f03Ft8AcLG3d/soYRp33SxIuP/c9Yf2ar/yEvh0MZ61k0GE
 YiNAsGpHTXMxf1zVS/zWrCFMkEurAy+rZ4g2mX5YZxuzoWyIg9GCSZppmIc6CT3ESSy9
 TI0Rcg8uq3YxalI7qj/Q6GHb6NZYn/Ns1wNOj5s6QnW8IpphpZcCsrZigaUtzDIUZvIW
 KZaVczsJFWp2KBw9nTZAVaNePdIRkq3BdgD+0F3bfsyoHoo6yXdn2h34u/Z9OLLaS4yS
 ybgA==
X-Gm-Message-State: AOAM533mMKI+wSmeYSLhmms0z63ygqFDUF5HrcLKip4ahZPfaSGhrqfI
 F27QqNWR2p1mZdyUlsyqCWm547+y3Zwl0cf0sfCtT8QNz/xjDYH4Ywq5a4NxL7nwskk4ZOi/nuL
 6j/cpCCvBxoBnlTM=
X-Received: by 2002:a7b:c444:: with SMTP id l4mr14841182wmi.115.1637761327672; 
 Wed, 24 Nov 2021 05:42:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNsG/29HZFTxncTzGRNjarUGkKTGXDI+cDxV8lVxbLpYCg8+LjgBGK78FgYPqdoUf0SrnV+w==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr14841122wmi.115.1637761327400; 
 Wed, 24 Nov 2021 05:42:07 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id d7sm14672073wrw.87.2021.11.24.05.42.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 05:42:07 -0800 (PST)
Message-ID: <1ff79505-18c1-d318-871b-74e967113dd3@redhat.com>
Date: Wed, 24 Nov 2021 14:42:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 18/18] tests/docker: auto-generate alpine.docker with
 lcitool
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211124130150.268230-1-berrange@redhat.com>
 <20211124130150.268230-19-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211124130150.268230-19-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 14:01, Daniel P. Berrangé wrote:
> This commit is best examined using the "-b" option to diff.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/docker/dockerfiles/alpine.docker | 225 +++++++++++++------------
>  tests/lcitool/refresh                  |   1 +
>  2 files changed, 120 insertions(+), 106 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


