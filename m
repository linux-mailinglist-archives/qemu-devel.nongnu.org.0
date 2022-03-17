Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6A64DC416
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 11:37:51 +0100 (CET)
Received: from localhost ([::1]:46544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUnVu-0004SQ-H0
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 06:37:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUnMd-0006Fo-20
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 06:28:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUnMb-00075N-Bl
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 06:28:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647512892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+fFDP+4thfRwxVNCGalOhBSo58U2R1MrvBaCKf9ziO4=;
 b=BzLcUXCKLrcSg4vqHIY/PrfTsQfaNPlVo/DhXPsed0Y7p5agfZ7L4UJTdP+obLnRyTgdR5
 U9gtIZfbT7HBLono8MHQZkSvgOhxvcYOyTrkHoKL60sfVIw3qVD2PDDriZiaUpTzbquspH
 97iv8z6SwmLLD2Utl0j1msURzYOl62U=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-dZfvXLKOOWyh_z4Uh1SCIQ-1; Thu, 17 Mar 2022 06:28:11 -0400
X-MC-Unique: dZfvXLKOOWyh_z4Uh1SCIQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 11-20020a50874b000000b004186b7c1252so2853756edv.3
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 03:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+fFDP+4thfRwxVNCGalOhBSo58U2R1MrvBaCKf9ziO4=;
 b=KmutQOQnRfLT2mtHlYCzmM5m1vE1Is+43RXDsRq4q7DFtkrJCqmGYWOwMOmUiN74VN
 hf+YjA1H5MCcGjUf6vJluPmK3Z07Oh4Ih+kAzJyjFu8RT8R1rC2DRc0ppj5gQ+Af2WlO
 2WqDgpYMNwU6QZfu7SkboVzjBKbGIFD2ehpbWXiLdVKbhqNbXVfBe6bUj6FhPIhsb4S9
 Yr166Ieje2rt4f78mT0AmSPyS21mrtP+T9GmK8SYpIlllBJ9WeVrynqxpOOtN8xn+dnO
 red5VpBUaU24tWIUmVFCLljuRfWBt1Yjzsg0IxlMjL3d+2cIKjmnDSOSC9QMVFy3Mnem
 4iYw==
X-Gm-Message-State: AOAM533N/rjLeDYvwCCoAppTpKpEY452CRNbZ81YrRdGU9dJWwUTJpRa
 R369joIBOam1MXWnoX1XVOV1BRnC7vo2g0P9H31AcIpSYormSnWvT6iT3lvynK7WO7RA3eoosV5
 I+uOGTtUiLZF+miE=
X-Received: by 2002:a17:906:2811:b0:6ce:eacf:5210 with SMTP id
 r17-20020a170906281100b006ceeacf5210mr3892674ejc.618.1647512890377; 
 Thu, 17 Mar 2022 03:28:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkHK9EhGHa5LgjARWjLmFXR14wYuVxrotGdoQnT45aEHoXtTi0iBC+1vLLrWsXXWvOVGkfNg==
X-Received: by 2002:a17:906:2811:b0:6ce:eacf:5210 with SMTP id
 r17-20020a170906281100b006ceeacf5210mr3892653ejc.618.1647512890176; 
 Thu, 17 Mar 2022 03:28:10 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 qf2-20020a1709077f0200b006df742a3521sm2105531ejc.54.2022.03.17.03.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 03:28:09 -0700 (PDT)
Message-ID: <c1622285-d8f8-4a1c-3439-f00c6c646825@redhat.com>
Date: Thu, 17 Mar 2022 11:28:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/5] iotests: Remove explicit checks for qemu_img() == 0
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220308015728.1269649-1-jsnow@redhat.com>
 <20220308015728.1269649-4-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220308015728.1269649-4-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.03.22 02:57, John Snow wrote:
> qemu_img() returning zero ought to be the rule, not the
> exception. Remove all explicit checks against the condition in
> preparation for making non-zero returns an Exception.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/163                              |  9 +++------
>   tests/qemu-iotests/216                              |  6 +++---
>   tests/qemu-iotests/218                              |  2 +-
>   tests/qemu-iotests/224                              | 11 +++++------
>   tests/qemu-iotests/228                              | 12 ++++++------
>   tests/qemu-iotests/257                              |  3 +--
>   tests/qemu-iotests/258                              |  4 ++--
>   tests/qemu-iotests/310                              | 13 ++++++-------
>   tests/qemu-iotests/tests/block-status-cache         |  3 +--
>   tests/qemu-iotests/tests/graph-changes-while-io     |  7 +++----
>   tests/qemu-iotests/tests/image-fleecing             | 10 +++++-----
>   tests/qemu-iotests/tests/mirror-ready-cancel-error  |  6 ++----
>   tests/qemu-iotests/tests/mirror-top-perms           |  3 +--
>   tests/qemu-iotests/tests/remove-bitmap-from-backing |  8 ++++----
>   tests/qemu-iotests/tests/stream-error-on-reset      |  4 ++--
>   15 files changed, 45 insertions(+), 56 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


