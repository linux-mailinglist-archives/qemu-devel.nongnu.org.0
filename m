Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D03DB3D88E6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 09:35:15 +0200 (CEST)
Received: from localhost ([::1]:46452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8e5y-0004sc-UG
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 03:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m8e5D-0004CY-Ef
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 03:34:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m8e5B-0003XJ-Ug
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 03:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627457664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SPArJxftoTMX4hsN2p0Bnau3qIisjhjNKSo/brslRG4=;
 b=UnSXZI+Pq9KjaldrbkBIyxXaDNveOcyXjdx73VIWCkvypQCD9Jkzrw3z8PbyDVUhm8z+dU
 D/SRtRPcxU6L7OsseA8Bg+KUAW/76d+ygW/9SFLDX/gQ93QW1QRvcFsglH424O5Vhv4A+j
 ZI8/LdBl88T/LZyEz4bVFKFYbU21Llk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-PD88402zMeedzDRBgbdK2Q-1; Wed, 28 Jul 2021 03:34:23 -0400
X-MC-Unique: PD88402zMeedzDRBgbdK2Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 h16-20020aa7de100000b02903a6620f87feso806259edv.18
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 00:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SPArJxftoTMX4hsN2p0Bnau3qIisjhjNKSo/brslRG4=;
 b=BPsKwqjbHk2P9zkzISt1xXcS8m6KY2IfaCv9J9JlsCtCqQIBc71rkt4UCiqSypCH9P
 2bO1szHCtj4DFZxm9Lt0902Pao9Z9615ID77YbOkmXMdOD+7QcMy6w84xow5iTlPJp8z
 qM2mg3HsfBVl1iuLoGaElWhFNq2IpixAH/GcIWL5TSO8NYkVUgzKP6nQpUQtxMqZ2/zO
 pLZ4ke7sOmBr0p0C5RRHpTcgSD3RzIvzM3mZD9jb/jbn8N/wsqtDeULarL+ywFyGwTUv
 /9+BkMyZolvPBmKCn9GuTs9KNHEQbsDSFfMUKaQWZhXE22VlFXGg3kHYaUTH5trFJbk8
 8Rkg==
X-Gm-Message-State: AOAM530VlKhiDfK16AehG29voG+wZrLM8Y6knZvPTK/kcFOaildotKHV
 QhiK/ZoPz2SkAOztzD15sWqjCzGwjD3xKApSWX76B0Xvyw6ffOxQqBs9z49YX9J/0yGxIM9Ju87
 IGO/F2qjPzkKxg+U=
X-Received: by 2002:aa7:c603:: with SMTP id h3mr13288362edq.165.1627457662291; 
 Wed, 28 Jul 2021 00:34:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmObZ3laCwK3tpP9uMlbOqHRkNLmUY+TEsVa22X0MHdKxJj6PyDAVsDbLo4WxRPTHG7G+3Cg==
X-Received: by 2002:aa7:c603:: with SMTP id h3mr13288352edq.165.1627457662164; 
 Wed, 28 Jul 2021 00:34:22 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id o16sm319117edv.91.2021.07.28.00.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 00:34:21 -0700 (PDT)
Subject: Re: [PATCH 3/3] docs: Move user-facing barrier docs into system manual
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210727204112.12579-1-peter.maydell@linaro.org>
 <20210727204112.12579-4-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fa424a66-6926-9571-cf84-11c42805def2@redhat.com>
Date: Wed, 28 Jul 2021 09:34:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727204112.12579-4-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/07/21 22:41, Peter Maydell wrote:
> +where VM-1 is the name the display configured int the Barrier server

in the Barrier server

> +on the host providing the mouse and the keyboard events.
> +
> +by default ``<barrier server address>`` is ``localhost``,
> +``<port>`` is ``24800``, ``<x-origin>`` and ``<y-origin>`` are set to ``0``,
> +``<width>`` and ``<height>`` to ``1920`` and ``1080``.
> +
> +If Barrier server is stopped QEMU needs to be reconnected manually,

If the Barrier server

> +by removing and re-adding the input-barrier object, for instance
> +with the help of the HMP monitor::
> +
> +    (qemu) object_del barrier0


Paolo


