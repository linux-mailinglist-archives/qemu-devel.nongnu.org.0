Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C025649CE3
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 11:44:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4gHj-0004wo-SV; Mon, 12 Dec 2022 05:43:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1p4gHh-0004uM-8O
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 05:43:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1p4gHf-0005le-Oy
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 05:43:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670841822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lOoZEHyxDXjcjw0+tx7oWD+T6mrp9WhC5FJBQZTHnyY=;
 b=HiQDzz9iUQl8V4ieU/8XcA+I/gdWJ+5PiogBkoYHTn8N336Kq9iV+imByUlZuuD03zxU2n
 ZVP330Eb9TmYpuOavyjll0BDrMyeniYeFjzEZanxk4RfzGZkYFzkrnBlWcofHoTac1kUZo
 AiLqhgjhKM9v2fFyUKlaiKM3snS1Z4Y=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-38-nlXfsEpUO3iO0iz_57i-wA-1; Mon, 12 Dec 2022 05:43:41 -0500
X-MC-Unique: nlXfsEpUO3iO0iz_57i-wA-1
Received: by mail-ej1-f72.google.com with SMTP id
 hd17-20020a170907969100b007c117851c81so6867082ejc.10
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 02:43:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lOoZEHyxDXjcjw0+tx7oWD+T6mrp9WhC5FJBQZTHnyY=;
 b=RVUk3DXWRhUwvsb+inPEtt+2N3T96uEUI12zPlymVb0wyoOOvFUHfWyQiEyetq60g6
 6pjduh5tf1bRfShlRvo3cyKuaGnJc+xrgEsw8rMjHrflGpP6Uz4TkKG2wGOA2+X4H4QE
 Q315tT10yDaGgbxIP9kzJEwvJFJoTpGWF5z6A7oZ+9iNSDuEsDw80M9bAtpb78NKFaxh
 T5ClYMSLMKdkiNrY//2WjOeN16bxtbKk2SRLf0C8P4qjP+BaGRpspQ1vizWoAqFsMWyK
 zR9jbr992ISkgx+6fKdsp9G9WBskMSB7d2XZTUvpBiqBqwazojW7/kz+I9PZxmfOaPrP
 2gWA==
X-Gm-Message-State: ANoB5pmb814WvaVe1c5BxN/l47QDfUvemPIVi0AFiXeNpMr1MbjCF2ui
 r1/4nCTVpwPucqMYGECq/jmlfR1M20qYbhq0UZ6TGVplTBUDjrpaLOHQb6TjUmFjOHI67cyhIjk
 Ah/F6JhJ3omQkQto=
X-Received: by 2002:a17:906:fcd8:b0:7c0:b66b:9ec0 with SMTP id
 qx24-20020a170906fcd800b007c0b66b9ec0mr12291106ejb.16.1670841819903; 
 Mon, 12 Dec 2022 02:43:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5OVTCl8M5IIjLIbXFvdNpg4ry/KvhW8GVff/lu3v+aey/3DpafJQ55kZuBaEFyBWyG/V3T2w==
X-Received: by 2002:a17:906:fcd8:b0:7c0:b66b:9ec0 with SMTP id
 qx24-20020a170906fcd800b007c0b66b9ec0mr12291095ejb.16.1670841819683; 
 Mon, 12 Dec 2022 02:43:39 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 kw26-20020a170907771a00b007add1c4dadbsm3109201ejc.153.2022.12.12.02.43.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 02:43:39 -0800 (PST)
Message-ID: <f451ccb3-17af-005b-b8ae-c43c91e7b585@redhat.com>
Date: Mon, 12 Dec 2022 11:43:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 5/5] qemu-img: Speed up checksum
Content-Language: en-US
To: Nir Soffer <nsoffer@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221128141514.388724-1-nsoffer@redhat.com>
 <20221128141514.388724-6-nsoffer@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20221128141514.388724-6-nsoffer@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> Add coroutine based loop inspired by `qemu-img convert` design.
>
> Changes compared to `qemu-img convert`:
>
> - State for the entire image is kept in ImgChecksumState
>
> - State for single worker coroutine is kept in ImgChecksumworker.
>
> - "Writes" are always in-order, ensured using a queue.
>
> - Calling block status once per image extent, when the current extent is
>    consumed by the workers.
>
> - Using 1m buffer size - testings shows that this gives best read
>    performance both with buffered and direct I/O.
>
> - Number of coroutines is not configurable. Testing does not show
>    improvement when using more than 8 coroutines.
>
> - Progress include entire image, not only the allocated state.
>
> Comparing to the simple read loop shows that this version is up to 4.67
> times faster when computing a checksum for an image full of zeroes. For
> real images it is 1.59 times faster with direct I/O, and with buffered
> I/O there is no difference.
>
> Test results on Dell PowerEdge R640 in a CentOS Stream 9 container:
>
> | image    | size | i/o       | before         | after          | change |
> |----------|------|-----------|----------------|----------------|--------|
> | zero [1] |   6g | buffered  | 1.600s ±0.014s | 0.342s ±0.016s |  x4.67 |
> | zero     |   6g | direct    | 4.684s ±0.093s | 2.211s ±0.009s |  x2.12 |
> | real [2] |   6g | buffered  | 1.841s ±0.075s | 1.806s ±0.036s |  x1.02 |
> | real     |   6g | direct    | 3.094s ±0.079s | 1.947s ±0.017s |  x1.59 |
> | nbd  [3] |   6g | buffered  | 2.455s ±0.183s | 1.808s ±0.016s |  x1.36 |
> | nbd      |   6g | direct    | 3.540s ±0.020s | 1.749s ±0.018s |  x2.02 |
>
> [1] raw image full of zeroes
> [2] raw fedora 35 image with additional random data, 50% full
> [3] image [2] exported by qemu-nbd via unix socket
>
> Signed-off-by: Nir Soffer <nsoffer@redhat.com>
> ---
>   qemu-img.c | 350 ++++++++++++++++++++++++++++++++++++++++++-----------
>   1 file changed, 277 insertions(+), 73 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


