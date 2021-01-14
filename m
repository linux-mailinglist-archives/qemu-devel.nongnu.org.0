Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E952F62B0
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 15:07:38 +0100 (CET)
Received: from localhost ([::1]:53124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l03Hj-0000ZR-CP
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 09:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l037x-0008IQ-B6
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:57:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l037u-0005xH-4e
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:57:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610632645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dzaXN+0eXmlsCVb3l12w3Rt+VBhKNSnItVKewSJ/XS4=;
 b=GZXl7Kl2PwZ4LkLY5QqextLVIUT6KL7+gz0+uwT2nLJ0gCQn7Bh5syu4zqeVxcGIO3PNeS
 wdPHBa00es1fbTq+RX2FlklzS7RXm4XZin0rL6uoW4VRF3jQJQumyg7GbLYx2s5/CoPDpX
 c7xZab2WI90q+itPu3Obs0/I1W6F4hc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-d_XXfPX0P_O-I3beKNNsag-1; Thu, 14 Jan 2021 08:57:23 -0500
X-MC-Unique: d_XXfPX0P_O-I3beKNNsag-1
Received: by mail-wr1-f71.google.com with SMTP id w8so2627384wrv.18
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 05:57:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dzaXN+0eXmlsCVb3l12w3Rt+VBhKNSnItVKewSJ/XS4=;
 b=Zvi+oyOAFfPVQD27mDYaDrbPRlHxbK51WKrr0Sx/y5IgF2PAppktMb/keZfii9VfAz
 UsQZ7xJMTLfGw9Hv4EQ3lrgfu6kDfnd0jzyUiJ7bukGN4mhlSrOG/dPnDOx/8rZ3GKtp
 5i2TeHigXYTNmXwwML3BFlrgmRTU3VONAF8n3IIwUg/ym0oJjEpqhTcD6vl1P/GmYPys
 a5C8qAcbmoiwnY4XDldvAvFmff/D4CqCu36KUcVQcOVXA4QtNMaMW8rd1L4cdhxxdpa4
 +nANUsxJeyJr7a98YiSYhD5cC4M6bpBSeScN4L1/aA2+TywFxP1Sp2QHFWx0wkHwWFZs
 ffew==
X-Gm-Message-State: AOAM530qHcfazv24lYzvn4FYHdJgdAqdN0lc6NGC8mJFHK5m1fTdRCsc
 0bZ0EiaLzGaU84qg+XPw0kp32ZYqTqtwgbp2KI60wjCLmO61tFg8hwxGqSkwCJ3ZGVMVUT4cqup
 uP3C/td9eUW9Yv88=
X-Received: by 2002:a7b:c8da:: with SMTP id f26mr4187105wml.155.1610632642017; 
 Thu, 14 Jan 2021 05:57:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwezSD0taeUy2/ACvyK0GPipyAqigb1b54WqLe7Vc6WVd1dnnh92QTRExtioRTMJu/ekGsPoQ==
X-Received: by 2002:a7b:c8da:: with SMTP id f26mr4187095wml.155.1610632641905; 
 Thu, 14 Jan 2021 05:57:21 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id c11sm8749305wmd.36.2021.01.14.05.57.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 05:57:21 -0800 (PST)
Subject: Re: [PATCH v2 24/25] tests/docker: auto-generate opensuse-leap with
 lcitool
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210114130245.1654081-1-berrange@redhat.com>
 <20210114130245.1654081-25-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f3debf97-43c6-5783-9d93-da927e03ea5d@redhat.com>
Date: Thu, 14 Jan 2021 14:57:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114130245.1654081-25-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
> This commit is best examined using the "-b" option to diff.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/docker/dockerfiles/opensuse-leap.docker | 221 ++++++++++--------
>  tests/docker/dockerfiles/refresh              |   1 +
>  2 files changed, 119 insertions(+), 103 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


