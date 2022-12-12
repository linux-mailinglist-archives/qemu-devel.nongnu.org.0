Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2706649CE4
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 11:44:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4gHd-0004mr-CK; Mon, 12 Dec 2022 05:43:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1p4gHQ-0004lj-Aq
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 05:43:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1p4gHN-0005gc-G2
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 05:43:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670841801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WXdoQfKlC+JUWD5tOa/KvdFmjE9mwQOP1CJ19oeKWcA=;
 b=D5iUvR3Fu95jnlBKyOXaTeFIoxpy23Iq7SvEnMh0jCIDuNsrm5WZopnE+oOxy7a3xxo5j3
 23Wl5I9fijQnTmE9c/hPEhBCzW+hze/miuUukcL0QTjTauOdv34YeAsNXGDjDH+GQu/An5
 +Kv0UXIgt8F8L3lPSBPBsKoLdjYhK1c=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-633-ZI9e41RhPneVU6ai5qUvPQ-1; Mon, 12 Dec 2022 05:43:19 -0500
X-MC-Unique: ZI9e41RhPneVU6ai5qUvPQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 v4-20020a056402348400b0046cbbc786bdso4778497edc.7
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 02:43:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WXdoQfKlC+JUWD5tOa/KvdFmjE9mwQOP1CJ19oeKWcA=;
 b=S01I/pFDG63+lpYFK2ZDy2htU2BMNlPc+7reqaF+lWQzEzHIVGV59zhGPOPjlSRh3L
 6wBVq4Xn3sg5jf+kQLe58NLC7lJtOjB1yJ98IOT14HYs7uYn9D54pm5Uvc9x1Amgu+Yd
 /3JmDGZdjKEvCBFJGu+Z3B+MXmeMmWRFfx4UA010w6aoRO1zSWltrcXjaWdFFNtzvoeC
 fQs18jBBaS30PJNbGMvxHU7oJP1x9EQiFOrokzPaGtwdJK5jEThv/QUyL5jQWaOBKjQp
 Evudz9kEYa/nXFVtZPn7RgqInbLtjtyy/hFO6IXsPLTNEbkXQAH1NFNWWe09atQvpr5c
 Wt2A==
X-Gm-Message-State: ANoB5pnqpnrjkO7EXs8hhFnpNn8cRz3Zf+rDzBF/RbZgtKA9zYxUXheK
 aoKd7xMkYk6RM+coeVw9ozMTzD3YeKERbt1tU2p5eraWZqJa4OPrHhdH5cJ8UDSEa/joAw+bGHB
 f77NCmdJrmojzFQ0=
X-Received: by 2002:a17:906:3cc:b0:7c1:277:cb00 with SMTP id
 c12-20020a17090603cc00b007c10277cb00mr12625658eja.23.1670841798873; 
 Mon, 12 Dec 2022 02:43:18 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7A4T/XG5b3pw10GFIOv7DQD6rNxK0D6B0q6YfWGAWmuhTGXyHhGrfGtMu+OFkIl2awkdwwAA==
X-Received: by 2002:a17:906:3cc:b0:7c1:277:cb00 with SMTP id
 c12-20020a17090603cc00b007c10277cb00mr12625645eja.23.1670841798732; 
 Mon, 12 Dec 2022 02:43:18 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a170906470400b007bd7178d311sm3151791ejq.51.2022.12.12.02.43.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 02:43:18 -0800 (PST)
Message-ID: <46a752d4-a4e0-d602-178d-6cce8125919a@redhat.com>
Date: Mon, 12 Dec 2022 11:43:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 4/5] iotests: Test qemu-img checksum
Content-Language: en-US
To: Nir Soffer <nsoffer@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221128141514.388724-1-nsoffer@redhat.com>
 <20221128141514.388724-5-nsoffer@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20221128141514.388724-5-nsoffer@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 28.11.22 15:15, Nir Soffer wrote:
> Add simple tests computing a checksum for image with all kinds of
> extents in raw and qcow2 formats.
>
> The test can be extended later for other formats, format options (e..g
> compressed qcow2), protocols (e.g. nbd), and image with a backing chain,
> but I'm not sure this is really needed.
>
> To help debugging in case of failures, the output includes a json map of
> the test image.
>
> Signed-off-by: Nir Soffer <nsoffer@redhat.com>
> ---
>   tests/qemu-iotests/tests/qemu-img-checksum    | 63 +++++++++++++++++++
>   .../tests/qemu-img-checksum.out.qcow2         | 11 ++++
>   .../tests/qemu-img-checksum.out.raw           | 10 +++
>   3 files changed, 84 insertions(+)
>   create mode 100755 tests/qemu-iotests/tests/qemu-img-checksum
>   create mode 100644 tests/qemu-iotests/tests/qemu-img-checksum.out.qcow2
>   create mode 100644 tests/qemu-iotests/tests/qemu-img-checksum.out.raw

Thanks!

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


