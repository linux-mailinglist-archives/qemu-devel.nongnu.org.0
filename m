Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 187122F2E9C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 13:05:28 +0100 (CET)
Received: from localhost ([::1]:35244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzIQQ-0000p0-Sg
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 07:05:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzIHr-00020i-9R
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:56:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzIHp-0002Xz-1m
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:56:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610452592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=owu7Zkb7b657EbWcQ4x9hmxrDAT0p6CEoMTOSPWuRq0=;
 b=T68NwGwhje7qv/MdmJFsBYTVukIHhLrL/cI988NXqXpp6QqaJtlppcMp8YXtlA/ikWLntP
 d6VctuyyQtknE15IfnZ+UfQI4wxkHA/vYdthDmt8PThowjGpESzL01xABY4QL/b70mZabO
 g/3cns6L59y3BS79FcucLHCsqAY7Llw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360--IHFGMJwP7Kd0v6J-hfW8Q-1; Tue, 12 Jan 2021 06:56:30 -0500
X-MC-Unique: -IHFGMJwP7Kd0v6J-hfW8Q-1
Received: by mail-wr1-f72.google.com with SMTP id o12so1036658wrq.13
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 03:56:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=owu7Zkb7b657EbWcQ4x9hmxrDAT0p6CEoMTOSPWuRq0=;
 b=EdsUWGe2jCEchh8D88ntSm5LTUjQ3CFM5G1jFJlahUrW/XmpcrQitVPX3q4uRIyH9c
 GmuO9HFqFTqp06mEa3glFBxdEVPPetO4s578085tNaFCQb9T2Xp3FJB+sDxavRmsnXHz
 H3ylnmY6lK4vwOEfrCF75X6wJ9BLe5gK9ijU9kW7X7VvNTUtt/wRivPVuQ1ItknRWEPn
 woBhJl8KPotACST8be64vZtiII9QLoihfotimgXuqoFRNn4NHUSH7xXt6wsX0nJWwXnw
 9jOvDrtxc7ycoq1YNwWkHgnNlqtw3uR+el5saY8vMQosbClVcvmuLJ9xUiSs4TdwPFy9
 SR5Q==
X-Gm-Message-State: AOAM533LqCx0STNyarbPCvwc/QzK40ZVsy4ephAUujo8BnQ+CEI1n1zU
 R3NUZhq8bryV9wiWN52dm2GZ4BXAMn4pyCgLdDIcRlq5fFpQMgZC4r407v7rasR7t2zcQuPB+PC
 +vEz/0m0Jm0EJtVE=
X-Received: by 2002:adf:90e3:: with SMTP id i90mr4103718wri.248.1610452589069; 
 Tue, 12 Jan 2021 03:56:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7iOUDRCBIItRGFFY985NkQQ9xGLtqyxc7d3SG3dfIuikHjLyfc5lcKXDUhTvaSGLJUC71Yg==
X-Received: by 2002:adf:90e3:: with SMTP id i90mr4103706wri.248.1610452588950; 
 Tue, 12 Jan 2021 03:56:28 -0800 (PST)
Received: from [192.168.1.36] (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id h13sm4578856wrm.28.2021.01.12.03.56.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 03:56:28 -0800 (PST)
Subject: Re: [PATCH v6 3/7] qemu: add support for iOS host
To: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210105022055.12113-1-j@getutm.app>
 <20210105022055.12113-4-j@getutm.app>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f8134df0-6896-9112-1465-4698081a9981@redhat.com>
Date: Tue, 12 Jan 2021 12:56:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105022055.12113-4-j@getutm.app>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Max Reitz <mreitz@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Joelle,

On 1/5/21 3:20 AM, Joelle van Dyne wrote:
> This introduces support for building for iOS hosts. When the correct Xcode
> toolchain is used, iOS host will be detected automatically.
> 
> * block: disable features not supported by iOS sandbox
> * slirp: disable SMB features for iOS
> * osdep: disable system() calls for iOS
> 
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  docs/devel/index.rst    |  1 +
>  docs/devel/ios.rst      | 28 +++++++++++++++++++++++++++
>  configure               | 43 ++++++++++++++++++++++++++++++++++++++++-
>  meson.build             |  2 +-
>  include/qemu/osdep.h    | 11 +++++++++++
>  block.c                 |  2 +-
>  block/file-posix.c      | 31 +++++++++++++++++------------
>  net/slirp.c             | 16 +++++++--------
>  qga/commands-posix.c    |  6 ++++++
>  MAINTAINERS             |  7 +++++++
>  tests/qtest/meson.build |  7 +++----
>  11 files changed, 127 insertions(+), 27 deletions(-)
>  create mode 100644 docs/devel/ios.rst

> 
> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> index f10ed77e4c..2cc8a13ebe 100644
> --- a/docs/devel/index.rst
> +++ b/docs/devel/index.rst
> @@ -35,3 +35,4 @@ Contents:
>     clocks
>     qom
>     block-coroutine-wrapper
> +   ios
> diff --git a/docs/devel/ios.rst b/docs/devel/ios.rst
> new file mode 100644
> index 0000000000..b4ab11bec1
> --- /dev/null
> +++ b/docs/devel/ios.rst
> @@ -0,0 +1,28 @@
> +===========
> +iOS Support
> +===========
> +
> +To run qemu on the iOS platform, some modifications were required. Most of the
> +modifications are conditioned on the ``CONFIG_IOS`` and configuration variable.
> +
> +Build support
> +-------------
> +
> +For the code to compile, certain changes in the block driver and the slirp
> +driver had to be made. There is no ``system()`` call, so it has been replaced
> +with an assertion error. There should be no code path that call system() from
> +iOS.
> +
> +``ucontext`` support is broken on iOS. The implementation from ``libucontext``
> +is used instead.

Do you have a CI testing plan for these builds?

Is it possible to add a Gitlab-CI job? If not, on Cirrus-CI?

Thanks,

Phil.



