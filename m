Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEE768D600
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 12:52:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPMVl-0005OO-0p; Tue, 07 Feb 2023 06:51:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pPMVh-0005Ld-OV
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:51:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pPMVg-0007Yf-2f
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:51:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675770698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RITAABn75a5XKfEg9cMGzGLj2S6703ebzUYgRVvXQX4=;
 b=Q+AEqTPaXQwhaqb2C8G02Dp7XtupkxoVXnhZ8/sXFQ/5R56pXzs3CaeBQEWUrw81FuToB6
 KvVbceulpK4UlxoYkD9JyC6eqUIS2xKdj7Mwfg7idiQ0p/2XipUfV6oAUE96mvBbq6gTEN
 zwXu1tX5M5f/RK/uv7MBWREjNHBdQpM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-126-eLYGSToLOAGosX3ACaMH7w-1; Tue, 07 Feb 2023 06:51:37 -0500
X-MC-Unique: eLYGSToLOAGosX3ACaMH7w-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg32-20020a05600c3ca000b003dc0df8c77dso8034855wmb.6
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 03:51:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RITAABn75a5XKfEg9cMGzGLj2S6703ebzUYgRVvXQX4=;
 b=JoaZ3cNJhjeKIVW/HyKpPl0wKKcGAjkqpsfbmPLEIt8RRjaL7jtNI9tJaCM+loA80A
 K+NAyHxtTUPAz/T+9LKhg9kj0m9nPKU+m9ur0K5U/2gM1v/s2Jwoj74AYDBxeLTa5B6O
 2anG+Cd2Y7k3Jdol6JvAa92clIzhyyNYXmidR4VrnxIsJP0HJeq9SrgoLx3uSLoKTHU2
 v5Ql2n/QkD56/YUkSvWZmx+yxQZoqv3zwOCm7yQ8mocuvcuDDIeC6LuG7XmPf2A7d3rv
 a9eXZDvIzl5DWT9mKrL9nymtaF8bYXB+oaBJ47x2RC5zKJX2Rub3ck6+pjmIMPsMtK94
 P24Q==
X-Gm-Message-State: AO0yUKVaYmHCBlI+qGqZLa3tNx9QEFpzmp+zQ7PRaaw4F4wyjoBrLAT7
 5+ehpBzicqWsqFNesq2RJE99xzk726SDt4v4l2EZSiG7MWyY5NaCK9zre0KMyAMoxyZoAZArQvL
 12FQCz0eZSggY4SxEopV8
X-Received: by 2002:a05:600c:490a:b0:3dc:433a:e952 with SMTP id
 f10-20020a05600c490a00b003dc433ae952mr2781212wmp.33.1675770696157; 
 Tue, 07 Feb 2023 03:51:36 -0800 (PST)
X-Google-Smtp-Source: AK7set+X++B8DxwLOD1kRE6uvgMFO7JzanL28SdQHMDmH1gum20dZLp3NlcVs6zIm0GT+8yyWL2OEg==
X-Received: by 2002:a05:600c:490a:b0:3dc:433a:e952 with SMTP id
 f10-20020a05600c490a00b003dc433ae952mr2781199wmp.33.1675770695986; 
 Tue, 07 Feb 2023 03:51:35 -0800 (PST)
Received: from ?IPV6:2003:cf:d708:4b2c:f69d:dcc6:80c8:9f6f?
 (p200300cfd7084b2cf69ddcc680c89f6f.dip0.t-ipconnect.de.
 [2003:cf:d708:4b2c:f69d:dcc6:80c8:9f6f])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a05600c512300b003cffd3c3d6csm14797914wms.12.2023.02.07.03.51.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 03:51:35 -0800 (PST)
Message-ID: <539281bf-c384-faff-0a2b-86890130d252@redhat.com>
Date: Tue, 7 Feb 2023 12:51:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 4/4] iotests/detect-zeroes-registered-buf: add new test
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Fam Zheng <fam@euphon.net>, Fiona Ebner <f.ebner@proxmox.com>,
 Eric Blake <eblake@redhat.com>
References: <20230201152751.270508-1-stefanha@redhat.com>
 <20230201152751.270508-5-stefanha@redhat.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230201152751.270508-5-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 01.02.23 16:27, Stefan Hajnoczi wrote:
> This regression test demonstrates that detect-zeroes works with
> registered buffers. Bug details:
> https://gitlab.com/qemu-project/qemu/-/issues/1404
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   .../tests/detect-zeroes-registered-buf        | 58 +++++++++++++++++++
>   .../tests/detect-zeroes-registered-buf.out    |  7 +++
>   2 files changed, 65 insertions(+)
>   create mode 100755 tests/qemu-iotests/tests/detect-zeroes-registered-buf
>   create mode 100644 tests/qemu-iotests/tests/detect-zeroes-registered-buf.out

Reviewed-by: Hanna Czenczek <hreitz@redhat.com>


