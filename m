Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 825F53D5C5F
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 16:56:56 +0200 (CEST)
Received: from localhost ([::1]:57374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m822J-0002M2-KY
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 10:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m81xH-0003Ro-RW
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:51:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m81xG-0002Zn-F1
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:51:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627311101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=emeuBW/jpE6fIU/owqRvGLjv+ciVviVbTVJn7gD52zw=;
 b=GYsMz8RMDgYapz1p8rOsxDiq1vvTwkic7UezDM5KOwbCKT7QpnegWigVwpMiEeToAFFhtB
 xnIPYYHPpbxxBUTupFovpawd4FpdxQl44C6c2AcDzawEP1+mE7dDx+bGks9pLP5HMyg53G
 j163DGN0toIsHm1+D4NXd2JOeVltn/U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-77irw95JO1SF1vfFdLiyQQ-1; Mon, 26 Jul 2021 10:51:38 -0400
X-MC-Unique: 77irw95JO1SF1vfFdLiyQQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 f142-20020a1c1f940000b029025093cddc1eso786254wmf.3
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 07:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=emeuBW/jpE6fIU/owqRvGLjv+ciVviVbTVJn7gD52zw=;
 b=n633o37cvAylwkoHVDUcNJIw/nG6ft97dJ02uUDrscPjpVeVTazSt77k/LMOVoQUe+
 mzA9IyOPynG9VtEA9ybtCVf+8Uwh6x8H92ud3gCeUvPEi9Ucwcsr0heFfRyWNPW2f6fp
 FaA5iPEtfiiyKeMtW0iCmkZ2XdcEnkU7xp77uwSHhrID9cNE19KhdB2BCO892FQqPINC
 l4ftqRxMozarBStSCh9R8twJ6dFgLAf8XgS1RnVKTj8KWY87RdJzXzKw6W93E+Kgb6d8
 QDcfFDVo6gAvqUZ3RyIRH6ekRIn50+e3R2326rLG2vHwb4uyA0ZOvkzWvbWOa1ptcH8U
 IOmQ==
X-Gm-Message-State: AOAM533jKO8KvhTa8AOFYAFR5izPMreqV88QguC1F+FUIwggbXc/+6ly
 pVn++WcgM0vGkSxrvrgOJgYM1FupUrw34/96DEnp+bWKVjDgfN2gIMysbMq+xKey0Ce4huoar5P
 4xeiGn4MprhNf2gQ=
X-Received: by 2002:a5d:504d:: with SMTP id h13mr19657028wrt.46.1627311097742; 
 Mon, 26 Jul 2021 07:51:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSwBMV7BBtTcz3SZZkXozc3RN0hWF7OpJ9kVW/ENaG1uxy0Ag686as+29EcuOjD2X+zK1D/A==
X-Received: by 2002:a5d:504d:: with SMTP id h13mr19657018wrt.46.1627311097636; 
 Mon, 26 Jul 2021 07:51:37 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id b6sm13914676wmj.34.2021.07.26.07.51.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 07:51:36 -0700 (PDT)
Subject: Re: [PATCH for-6.1 02/10] docs/devel/build-system.rst: Correct typo
 in example code
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210726142338.31872-1-peter.maydell@linaro.org>
 <20210726142338.31872-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ffee654c-a252-8ed0-217c-05ffd5f1d09b@redhat.com>
Date: Mon, 26 Jul 2021 16:51:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726142338.31872-3-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/26/21 4:23 PM, Peter Maydell wrote:
> One of the example meson.build fragments incorrectly quotes some
> symbols as 'CONFIG_FOO`; the correct syntax here is 'CONFIG_FOO'.
> (This isn't a rST formatting mistake because the example is displayed
> literally; it's just the wrong kind of quote.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/devel/build-system.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


