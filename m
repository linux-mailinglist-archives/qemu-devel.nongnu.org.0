Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B992CA9EA
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 18:42:09 +0100 (CET)
Received: from localhost ([::1]:40446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk9fE-0003WH-Sv
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 12:42:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kk9YT-0004ST-K1
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:35:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kk9YR-0004WH-25
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:35:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606844105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3LV+vPr2JGxmZfLo0Cl7aS8rYgO1WLDSp1ExQ962pNw=;
 b=SAi3qqa113SObYtrbWvBE73zqJDuTUE5RzGjvkzuiFWm6gehCjEvf4p8cIqbxX5WPkzRH8
 qG7vu1QzQRXLFFGPtXhpAyhCI0iYwPWFTlHDhIJy95DuFhOhQbtBj21c/qv94KojdO0kp8
 eifmy3bUT5hhI5VYngKz450kYF+pls8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-B1ajwPdWNUeZSgFMcLkg9A-1; Tue, 01 Dec 2020 12:35:01 -0500
X-MC-Unique: B1ajwPdWNUeZSgFMcLkg9A-1
Received: by mail-wr1-f69.google.com with SMTP id d1so1279069wrn.23
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 09:35:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3LV+vPr2JGxmZfLo0Cl7aS8rYgO1WLDSp1ExQ962pNw=;
 b=kvv/m0KNnebf7Kaaac1WqiHRE92UE+4MN4lwCPTyxc8WOLex1+MJ25xITFABoITFNX
 ku6knx/a9dgGtr4Ny+zOHNGdeAL6SoDxIdX3mp2GA8oVPG4woqqHIxM3/ikzKVV1e9G4
 ib2xMzSZNHCkEUm0U2RqfhOW1aA0CvJ/yY319YG0gtkv1Pr4oAEY0Ww4y2pCVP2C6Bhx
 t6k/sq7eU+MAzqlGD/6ZVfH8QLa1l8ZNZrmdXXgdt0VQ2VylYhwVsg5aGajR8C4YGdAC
 rm71qe3+bZ64ahbtZu+AtpF5qO3SE9mDhQByVFb6VkNIw45xTVd/P+Q1QgHXZSv6uWor
 /olg==
X-Gm-Message-State: AOAM531kAkO39b+8fcnGuiXQVo2iCn3jeiBSGOnHpf975Tw7RrRa9DSk
 y2y8PVSLNemU2Ui5DxrEgojZQJ038fzBu/yAxSxhWwRDpIMlt17j4Nyq4Pg/lVQCmJ9d+Im2BAn
 u9kAvauVLhqeCNZQ=
X-Received: by 2002:adf:bc13:: with SMTP id s19mr5316482wrg.397.1606844099966; 
 Tue, 01 Dec 2020 09:34:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPXrQ4rZkcPP8zdf4rn95HIBwpk1MFHh7G4+mXkwsVQ+8DJrx2R+qskee3SXE35DLZkRu2Kg==
X-Received: by 2002:adf:bc13:: with SMTP id s19mr5316461wrg.397.1606844099795; 
 Tue, 01 Dec 2020 09:34:59 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id w3sm909604wma.3.2020.12.01.09.34.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 09:34:59 -0800 (PST)
Subject: Re: [PATCH 04/23] tests/docker: use explicit docker.io registry
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20201201171825.2243775-1-berrange@redhat.com>
 <20201201171825.2243775-5-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <14e00e1e-5cc9-2dcf-bab3-84d6b96bdb36@redhat.com>
Date: Tue, 1 Dec 2020 18:34:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201201171825.2243775-5-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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

On 12/1/20 6:18 PM, Daniel P. Berrangé wrote:
> It is good practice to use an explicit registry for referencing the base
> image. This is because some distros will inject their own registries
> into the search path. For example registry.fedoraproject.org comes ahead
> of docker.io. Using an explicit registry avoids wasting time querying
> multiple registries for images that they won't have.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/docker/dockerfiles/debian-xtensa-cross.docker | 2 +-
>  tests/docker/dockerfiles/debian10.docker            | 2 +-
>  tests/docker/dockerfiles/debian11.docker            | 2 +-
>  tests/docker/dockerfiles/ubuntu.docker              | 2 +-
>  tests/docker/dockerfiles/ubuntu1804.docker          | 2 +-
>  tests/docker/dockerfiles/ubuntu2004.docker          | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


