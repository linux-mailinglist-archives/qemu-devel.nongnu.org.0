Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BA64E44B2
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 18:06:59 +0100 (CET)
Received: from localhost ([::1]:37932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWhyE-0007GF-4Y
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 13:06:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWhuy-0003kh-AW
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 13:03:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWhuw-0003Ji-Ir
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 13:03:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647968613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oz1blCasAoIt0CmmWN4KT9nJozqgyq9yS0om6Fd+F1o=;
 b=gB9+ptzElhUq2fOfl9jvHvdt+YVnsn3Uxb5kZ+cOqYy6EeTj8H/IjqPhCA9xJFVovuCP2x
 aHY0+1BYuDaScL31H1KcRRqmwUeVyV6hU1vpw2hXThfnFNeUgr5MdbHT2rgdf2blc6TTzp
 Sp66N9f4/Er6MYe8Y//4GPvaUGg4Fm0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-yXO4kkUCMSy4qK6bPSLXiA-1; Tue, 22 Mar 2022 13:03:31 -0400
X-MC-Unique: yXO4kkUCMSy4qK6bPSLXiA-1
Received: by mail-ej1-f71.google.com with SMTP id
 w11-20020a170907270b00b006df8927010eso7802211ejk.0
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 10:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Oz1blCasAoIt0CmmWN4KT9nJozqgyq9yS0om6Fd+F1o=;
 b=bnkZ+40bIeDGU0eFXaZgJXjncYuTnVg5QiPRP+1C5gonSpXx6tNnJDoo5WSL5rzh2L
 Jatb6+ysPP3X3uEijDDCrSJ5vtuNjs0R4Jjn/W3RuBcmYo4l4GO75YtTSNHbrPVpnexG
 /jVgDAjC7fQ/htBOiXtQ6cMuwlFOKHgO0Zn4UY3V47qfHaxL+K5nOpETXjr58YXIItsR
 NiFD8edgRSpAEjzu2hgtWZ0ScimbPdMCw1WpXFQM3r2pb79Wv3Uoul1+4Sr1BWb3P87s
 vdjTLOKewCGUZ0TFTWKw/KMWnhcJotHdSIhqc+0mqKVBm9DbuaJtWOoIndYAx0mve+WO
 bwoA==
X-Gm-Message-State: AOAM5307/tuYgxIbQA2dyit1wDoTLUBOPx395a8UlcIlrgIij3C4jG3e
 oboRi1lZuqiTDKMNij4L8S9tb99rJd/aezfS+O5OOPAdGUaicxRiktH8CKuMdZqxX+h8eS8R4Zp
 FiEOcC+WRgDDj6pg=
X-Received: by 2002:a17:906:a1a:b0:6cf:d2d9:410c with SMTP id
 w26-20020a1709060a1a00b006cfd2d9410cmr27469047ejf.713.1647968610754; 
 Tue, 22 Mar 2022 10:03:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxA5sthCUXzRLDsDgDhPGXLnEUm+wZALC0BDIulpZbwRhz4jBEu2gRlHTFxj99GlEdPpxFhAQ==
X-Received: by 2002:a17:906:a1a:b0:6cf:d2d9:410c with SMTP id
 w26-20020a1709060a1a00b006cfd2d9410cmr27469030ejf.713.1647968610546; 
 Tue, 22 Mar 2022 10:03:30 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a17090637c600b006e058e4ab74sm112807ejc.94.2022.03.22.10.03.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 10:03:30 -0700 (PDT)
Message-ID: <4ea992b8-7d4e-778f-27b6-176903a3c43a@redhat.com>
Date: Tue, 22 Mar 2022 18:03:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 15/15] iotests: make qemu_io_log() check return codes by
 default
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-16-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220318203655.676907-16-jsnow@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.03.22 21:36, John Snow wrote:
> Just like qemu_img_log(), upgrade qemu_io_log() to enforce a return code
> of zero by default.
>
> Affected tests: 242 245 255 274 303 307 nbd-reconnect-on-open
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/iotests.py                  | 5 +++--
>   tests/qemu-iotests/tests/nbd-reconnect-on-open | 2 +-
>   2 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


