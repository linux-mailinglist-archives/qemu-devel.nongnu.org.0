Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD95B302814
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:43:00 +0100 (CET)
Received: from localhost ([::1]:58518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l44x9-0007Qr-5q
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l44vD-0006o2-Ao
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:40:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l44vB-000224-Vs
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:40:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611592857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P//V+VwdWNwLg9L2dxTGJhU0tJFnSeAU7CUFr9kEa4U=;
 b=KPiW9JkNrBHtoBJ5fvJU0L35SDqQ8Ho85uUZhDtbxyA1YjxKnU4N3jM/IVq0UjX+OxDDqT
 MVTPG9tTmdDrlcESJz+LBcXmKXzcVgqe087Ik7aRisZ9WWGnOoWnbpGgJhQsmkHenarB0j
 uG/Rm2oxTmQhvlknj5DHzl/LqN72H0A=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-QWNdVTGMOh-ZWvmThCYkTQ-1; Mon, 25 Jan 2021 11:40:54 -0500
X-MC-Unique: QWNdVTGMOh-ZWvmThCYkTQ-1
Received: by mail-ej1-f70.google.com with SMTP id q11so4031027ejd.0
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 08:40:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P//V+VwdWNwLg9L2dxTGJhU0tJFnSeAU7CUFr9kEa4U=;
 b=G/467jBmA8RH2UJewOcrZ2B2eOk4buBTkndU0L4bw+oQP3goyXkv8wUxAZSOKZNi08
 bPGfy+rvis1kFlfTC6sKq3Uet8tb1p2U49XbmIp+NM4gL17FxC4P6IG8gkq58GgF/D+u
 8VY1JmUNGcoflJDdrEOnDGtlDAngfLPWYyxy6Ahs+hSxeo8ycVAHOSuE0sgABEg2Wj/5
 bnXvmF7TemCuPknMICwXLY5WgVkKGB6o7uzxg/8Zocz7jqlgmFd3pqFOlICD87NaNZu/
 Kshn+QNq+4tf2fcPw69KUqAhsRzkRKWKFEpAnbGjI2H1n970TJ9Jha+GHscMOK1vgVpO
 DRRg==
X-Gm-Message-State: AOAM533OTEKjm1Ljc8cTa+NFmQb+psmu6rMlXEDya6wuN2fw/QBROpUq
 LJppfUCWNgJxgNMxVuU6a82EEoLc03UKip4lyvSUEi10BNYLOsJ1froS+4fkRuxqzFNDFOOtAK9
 lR43B3fn3x54rRvg=
X-Received: by 2002:a17:906:3388:: with SMTP id
 v8mr933540eja.104.1611592853483; 
 Mon, 25 Jan 2021 08:40:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfHIxfiKlKwMeyWYVAO6cwjxAuhFIWZQ67afaKYpw43JyCOnda8aJh4HDgmbWwdE4srl63UA==
X-Received: by 2002:a17:906:3388:: with SMTP id
 v8mr933534eja.104.1611592853375; 
 Mon, 25 Jan 2021 08:40:53 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g90sm11496893edd.30.2021.01.25.08.40.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 08:40:52 -0800 (PST)
Subject: Re: [PATCH] trace: add meson custom_target() depend_files for
 tracetool
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210125110958.214017-1-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <06b6fb5e-cf9b-aa0a-265e-3d523faed814@redhat.com>
Date: Mon, 25 Jan 2021 17:40:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210125110958.214017-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/21 12:09 PM, Stefan Hajnoczi wrote:
> Re-generate tracetool output when the tracetool source code changes. Use
> the same approach as qapi_gen_depends and introduce a tracetool_depends
> files list so meson is aware of the dependencies.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  meson.build       | 28 +++++++++++++++++++++++++++-
>  trace/meson.build | 21 ++++++++++++++-------
>  2 files changed, 41 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


