Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E25631383D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 16:43:06 +0100 (CET)
Received: from localhost ([::1]:44232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l98gr-0005J8-6d
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 10:43:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l94cA-0006xh-TE
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:22:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l94c1-0007xV-GS
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:21:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612783305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ea72i7wW+BLjL2iNsYcJmAtd6sRCSBqncZSd7+flZPc=;
 b=VbFYfoNNPhph4lxQmntfpTRYABQloRzeD1F+HmFNwDREZ0PWXC2tYrN/9fVw2WPzlOeBLx
 pmCIv30AUx8/JYnB1R1GFb12ClJ4junyvr0HCTzf6XzXsUMLo4Oh9lSxb0+JgV3Z0T5Izd
 ACDghNMjteGYIDX5h5Vf2D+tpNUZ/Pk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-dInOi2atPUuD6i4Ry85bmg-1; Mon, 08 Feb 2021 06:21:42 -0500
X-MC-Unique: dInOi2atPUuD6i4Ry85bmg-1
Received: by mail-wr1-f69.google.com with SMTP id c1so12908275wrx.2
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 03:21:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ea72i7wW+BLjL2iNsYcJmAtd6sRCSBqncZSd7+flZPc=;
 b=C6hfT/MUBtlIJHueC0qJITnVPmVQOu/hNWxQBYv53ay/GogzUN2lk+V/i6TtMUIi8l
 CPiKePoyz9AwHGDS3/eBEe+MAzLyUBx0+1uZkpikhPeJkWZQ9XIp4dJfq+UVXWmwC84t
 5jC03ZUDxzcLB+PbEOwU3/7QAcP0KdW9hx9k0+dna6a2Z8ULDAeaaV6XYT846HAxGyLt
 yBnhFYxTzqesu7RLOPfGdonmmH4aIUsEPwtTq+gKJSQ+aYVd77ozVRf6X2jLXQwUiIiX
 cFwaGgX27yYRkKXcJmi7mEsx0PvD1dcKk9K9i6Jew/KR1FETDNxf24Y8IqqasCmCXvh+
 +1rw==
X-Gm-Message-State: AOAM5329inKMCrS1d/vH33HkS/bnXvEOPT7nZzkwn/DKQ9AiDge7DW15
 12TQu7Ca0lAc53KkGAIJfTuAAx0ABirnEn0Lh/yGiEwgNn0bJ1Slzb+ialsvIybxVClaabtDQpL
 F99SXSpW4cxKeAtA=
X-Received: by 2002:a1c:7910:: with SMTP id l16mr14500068wme.34.1612783300948; 
 Mon, 08 Feb 2021 03:21:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx71EG5mgDCrK1ogT8W+8kKuNrvrxnpaLZUyZW7J9vCHnpX4sNZFrPsV0cQFfBh03hD0gmESw==
X-Received: by 2002:a1c:7910:: with SMTP id l16mr14500037wme.34.1612783300734; 
 Mon, 08 Feb 2021 03:21:40 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x13sm14722107wmc.27.2021.02.08.03.21.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 03:21:39 -0800 (PST)
Subject: Re: [PATCH 09/22] tests/acceptance/virtiofs_submounts.py: required
 space between IP and port
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-10-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c2e92e2b-842e-641e-a6a7-395599d651be@redhat.com>
Date: Mon, 8 Feb 2021 12:21:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210203172357.1422425-10-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 6:23 PM, Cleber Rosa wrote:
> AFAICT, there should not be a situation where IP and port do not have
> at least one whitespace character separating them.
> 
> This may be true for other '\s*' patterns in the same regex too.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/virtiofs_submounts.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


