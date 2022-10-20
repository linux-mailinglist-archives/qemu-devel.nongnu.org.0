Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E23D9606111
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 15:09:45 +0200 (CEST)
Received: from localhost ([::1]:60484 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVIi-0001a9-Ab
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:09:34 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olV3Q-0001ei-7g
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olTdp-00053z-QE
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:23:13 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olTdU-00083m-Hv
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:23:13 -0400
Received: by mail-wr1-x434.google.com with SMTP id bp11so33865971wrb.9
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qeLuBqMrrf60ddrQS5kIMB1G0KMo/uMw/93o5j0BRbA=;
 b=EvhqqP0tsA+OhGXdbX1aSkmkLTgJ021o+8X8kgefgH7W3nnfKs1DEBShJ5+jx6QUbX
 w2FwrZb41vzWKi1pO9meI2F1joVbXKYR4sy+U21In4HCPtCFFqQzpfQQBzR4t+Gmp9/6
 yf2+UHMJXGvCAyNZfhUXNo1SVgtB8nDrZh6C8ipgBtXCSS1hCUu2KakLHjXkgb0oFYol
 VrPOUBo+YxCWuAMDq+IRpM0u6EjYYezdI1SE0ko4YhmRHYfK8Zr9pXuB0Gp6Z9+ISHJ5
 sgFs0vnttL8Hi1uwWjqu0LU0P919ckabIc/ocX96esOzyFtKk0q9Ix8wOSLyZgFC8HEK
 RjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qeLuBqMrrf60ddrQS5kIMB1G0KMo/uMw/93o5j0BRbA=;
 b=Wd5a+8H819LjYGMcIiQO3woUbHtgAKX/uhDa+sS8epyOxJT3q73RGvgBtvGWYonf47
 3XX42hDb/XTuSDRPraV8dWBZJeQoZz1lGmekwKrnUF6YzJ3W2ycEPr380aYomkB6yzFc
 3iBZ2dfet586TJOAnSk4QHbyLt0vvPTIfdhmqpafUMyTT3KkAaBOKBd8AEzovQ8oHjnX
 qob5AXRoFW2qze1JPOCQtSS7cv9RxZxFihUGsgY9iPZuhdzOJ/mxy1KyC7UvmtCT5odK
 RzS6eNmifUoF84DZ+lQJUBIzm/wiRDGsOFapqkHKn6tch3WLitt9psrY/kDvcK1VK/PT
 FVhQ==
X-Gm-Message-State: ACrzQf252v/A5oilDd2cLY2zJ30yTdGT0h+ChKF/Me6s28UCOI+bCjUe
 qjsV2Ex9EnfDb3BbPYMVKRFdmw==
X-Google-Smtp-Source: AMsMyM40ThoQBavxHAlcW+lg4vJY0hKffuLqNqY4Acfc6gQvEbuZViG8MbqPa2YA3YkDkaON6sn1Qg==
X-Received: by 2002:adf:dd0f:0:b0:236:2f7f:4cce with SMTP id
 a15-20020adfdd0f000000b002362f7f4ccemr1256849wrm.347.1666264970374; 
 Thu, 20 Oct 2022 04:22:50 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a05600c490600b003b95ed78275sm2415551wmp.20.2022.10.20.04.22.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 04:22:49 -0700 (PDT)
Message-ID: <3e6d8138-ad6e-9e23-ebc0-f3e4d5afebe1@linaro.org>
Date: Thu, 20 Oct 2022 13:22:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v12 05/17] net: introduce qemu_set_info_str() function
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Anthony Perard
 <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Paul Durrant <paul@xen.org>,
 Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
 <20221020091624.48368-6-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020091624.48368-6-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/10/22 11:16, Laurent Vivier wrote:
> Embed the setting of info_str in a function.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   hw/net/xen_nic.c  |  5 ++---
>   include/net/net.h |  1 +
>   net/l2tpv3.c      |  3 +--
>   net/net.c         | 17 ++++++++++++-----
>   net/slirp.c       |  5 ++---
>   net/socket.c      | 33 ++++++++++++++-------------------
>   net/tap-win32.c   |  3 +--
>   net/tap.c         | 13 +++++--------
>   net/vde.c         |  3 +--
>   net/vhost-user.c  |  3 +--
>   net/vhost-vdpa.c  |  2 +-
>   11 files changed, 41 insertions(+), 47 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


