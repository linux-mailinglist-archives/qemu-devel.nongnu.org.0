Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD93630E178
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:53:05 +0100 (CET)
Received: from localhost ([::1]:53252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7MKu-0003qZ-Q1
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:53:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7M9r-0007hq-0S
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:41:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7M9p-00076n-KI
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:41:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612374096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LABXSQIiK+sTUHxXcPvHiGzW6h6gk2MFF11ZdwHcuFo=;
 b=FknxYDO1UBLYbzGw/05NCelMpohh6N/yK/uaNiqJPMcSnH4OFz3Fzpx/t+shkEelr1ZZ9o
 sfWp2N4+aIaFwtj+VNiheuysnhdYdJJxoH3tAjKqCp8r8BHDMfR00BkfVzeQotpWhsbJD1
 UJwG2BCjJ3+iR4LvoXb2cKOZNGs0Hak=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-_SOjfNiLOxiJrDYhZNASfQ-1; Wed, 03 Feb 2021 12:41:33 -0500
X-MC-Unique: _SOjfNiLOxiJrDYhZNASfQ-1
Received: by mail-ej1-f72.google.com with SMTP id m4so152920ejc.14
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 09:41:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LABXSQIiK+sTUHxXcPvHiGzW6h6gk2MFF11ZdwHcuFo=;
 b=DqfVtRxOy8jGgZOQg4USRp1furNNFPqKRVUWGxyEnRIbgMZjvVuxtleN8jbcyg+SS7
 Qz9Ey3uRM1AXWzV4DR+Ja8OfiPev+uPGRvrcdmbcsFxEIjt/mcNY/EFefKSyODA6Y2SH
 Y3hsRS3VSHNp9Y5oZw57yj88qPbdpW6JMPLU0jrKzbaAvC2/aC2DXhzaPUW1jwoHB+U2
 u7zAqe+l62rf2L47ULCeNCY4ZaFwfu8bEz+K/vZ1MyhweXiRBACb5OIlD1A0osP24wxR
 zX9Sk7D/SjfyvZm2kVUY0t7pM7x5MdMLTHPMB0SmUmSSrZQZovE7nMoNSk+Un4FLuHC+
 Zfcg==
X-Gm-Message-State: AOAM5317USPQ+WeGoe5+7akluRf3nbr41MtYRth+NCXSwYr1enotjLPa
 eJbCvK8smFZF+wyBKDX6mftwXlRT4fkfNz+cwhfuqnIui0QpMUuY+Az7B0vMEKu9pSInMDH8nZa
 TX9sMhp9KcDcMHj8=
X-Received: by 2002:a17:906:bc99:: with SMTP id
 lv25mr1656227ejb.15.1612374092040; 
 Wed, 03 Feb 2021 09:41:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+pUpbxNFtpYwTC27SJBLyi3CzDY+mv3LmBsZBxVWWKcjvZJKwEl5rqaK5mJ5ygxTHWJ0rpA==
X-Received: by 2002:a17:906:bc99:: with SMTP id
 lv25mr1656195ejb.15.1612374091802; 
 Wed, 03 Feb 2021 09:41:31 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id p25sm701696ejz.64.2021.02.03.09.41.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 09:41:31 -0800 (PST)
Subject: Re: [PATCH 01/22] tests/acceptance/boot_linux.py: fix typo on
 cloudinit error message
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-2-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <46376ddb-0a7b-6594-f4fd-4538ffe1a92c@redhat.com>
Date: Wed, 3 Feb 2021 18:41:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210203172357.1422425-2-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/boot_linux.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


