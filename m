Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEA53B594E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 08:55:57 +0200 (CEST)
Received: from localhost ([::1]:43108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxlBU-0006Od-4B
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 02:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lxlAE-0005i0-Ic
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 02:54:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lxlA9-0007vC-BA
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 02:54:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624863271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hwD0Ohb+V9OzfdPkyyf1q0FQOWG98RYrRyEV5/BCjj0=;
 b=URYYDNYOaRpaGdEeoCx42CBPIY+TQpDBD2XRMPmLgBxMlvcdM/k2UqxrMsgn8tP+XDDeRI
 bh3cRxYSx62p7qFo8MrX621kMkUE3+zyHEVf9eDhYaawnenm39QZIqxcrg650detBjG2nQ
 9q0LlVE8a1LIW4jxHHD0aPsZO6rJAR4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-FKIjXlSdMm2odXDf1i5QcQ-1; Mon, 28 Jun 2021 02:54:27 -0400
X-MC-Unique: FKIjXlSdMm2odXDf1i5QcQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 t10-20020a5d49ca0000b029011a61d5c96bso4230924wrs.11
 for <qemu-devel@nongnu.org>; Sun, 27 Jun 2021 23:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hwD0Ohb+V9OzfdPkyyf1q0FQOWG98RYrRyEV5/BCjj0=;
 b=XIgSbfwnGDkiQABRShOtvRKANjRrntC77CUdgczzflKlz8jpM768V8BU4RE/KLFb/S
 lE6h9UqAY1E6rpBIXykPejgNS290IccS8bND0M952iZH3BnIj6spchPjYB4sgRSUCfyb
 BCXYQESgCW072brkKYzGRlmHQ+fxZ2WAWIv0IatpCoytEvK2CRKBAKHhD6NYReoX7dVl
 vdjWfrHzmqcZmE0oq/aOozchPeWlYr7As+5Oyq4sb1IWjXSI4Ux82dXYReMFBbKHYfOf
 IfIXZjREmHPn9fEXy4VbVn+zM7xy3eeMiADOczH85bbzURLbaM4q+TtGwC41opZsNzAW
 6ESA==
X-Gm-Message-State: AOAM533eJkirZ8z/9C0TDJbuWpJiesm62Mdz3gV2Htgsinmcqdp7id8k
 /f+ef2mMFd5nbrS2eefkRnxUIzak5afCK/dyLV9L7CLeVQ+m42QI8fyC8nyAKhQzih2X3ZzGm52
 54YmYUIRt/lL1rbY=
X-Received: by 2002:a05:600c:3b1e:: with SMTP id
 m30mr24385325wms.25.1624863266002; 
 Sun, 27 Jun 2021 23:54:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4p5BtMZKpX7lIR2P5puTA4AiY2UKrl+k0HIxHWk+H5qJCJaykNhQF9Fu5VTaOMvDPrg2dKQ==
X-Received: by 2002:a05:600c:3b1e:: with SMTP id
 m30mr24385297wms.25.1624863265771; 
 Sun, 27 Jun 2021 23:54:25 -0700 (PDT)
Received: from thuth.remote.csb (pd9575ea7.dip0.t-ipconnect.de.
 [217.87.94.167])
 by smtp.gmail.com with ESMTPSA id z6sm13424324wrl.15.2021.06.27.23.54.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Jun 2021 23:54:25 -0700 (PDT)
Subject: Re: [PATCH 1/3] build: validate that system capstone works before
 using it
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210625172211.451010-1-berrange@redhat.com>
 <20210625172211.451010-2-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4ee4016a-5973-599c-c85e-3acae238ffa8@redhat.com>
Date: Mon, 28 Jun 2021 08:54:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625172211.451010-2-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.696,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.765, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
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
Cc: Sean Bruno <sbruno@freebsd.org>, Ed Maste <emaste@freebsd.org>,
 Warner Losh <imp@freebsd.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Nathan Whitehorn <nwhitehorn@freebsd.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/06/2021 19.22, Daniel P. Berrangé wrote:
> Some versions of capstone have shipped a broken pkg-config file which
> puts the -I path without the trailing '/capstone' suffix. This breaks
> the ability to "#include <capstone.h>". Upstream and most distros have
> fixed this, but a few stragglers remain, notably FreeBSD.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   meson.build | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/meson.build b/meson.build
> index d8a92666fb..9979ddae71 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1425,6 +1425,19 @@ if capstone_opt in ['enabled', 'auto', 'system']
>                           kwargs: static_kwargs, method: 'pkg-config',
>                           required: capstone_opt == 'system' or
>                                     capstone_opt == 'enabled' and not have_internal)
> +
> +  # Some versions of capstone have broken pkg-config file
> +  # that reports a wrong -I path, causing the #include to
> +  # fail later. If the system has such a broken version
> +  # do not use it.
> +  if capstone.found() and not cc.compiles('#include <capstone.h>',
> +                                          dependencies: [capstone])
> +    capstone = not_found
> +    if capstone_opt == 'system'
> +      error('system capstone requested, it it does not appear to work')
> +    endif
> +  endif

Reviewed-by: Thomas Huth <thuth@redhat.com>


