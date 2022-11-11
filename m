Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC72625AFC
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 14:08:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otT1l-0002Bh-8V; Fri, 11 Nov 2022 07:20:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otT1j-00028c-3h
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 07:20:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otT1e-0000gM-Dr
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 07:20:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668169249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P5Lma2of8H1dxS0IHdKGM5nHZVDb7UkgxGCyA/bReUs=;
 b=jQiUDePnkgqJmzaxe7U+JYeAYahkfqdM6ZBK3EdNUH+RITW7120gFnDeS03ZZQ8wuMqiVT
 X4o4bi4tCgk8HDTMP9W1EGjGDacroaelcNtJOy0GWUHWifHR35n+vy4oTRHnLw7+P5HHZr
 UxZ2oNNJNMQ5XuzArHbP18K2/Ric21o=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-567-fZMoQtOyM_uz3lKK0XgpNg-1; Fri, 11 Nov 2022 07:20:48 -0500
X-MC-Unique: fZMoQtOyM_uz3lKK0XgpNg-1
Received: by mail-qt1-f200.google.com with SMTP id
 b20-20020ac844d4000000b003a542f9de3dso3483736qto.7
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 04:20:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P5Lma2of8H1dxS0IHdKGM5nHZVDb7UkgxGCyA/bReUs=;
 b=e+a3rHlcWxEEbTnYfuBUgmbEOYlUuoZY66qawSe4dXsmpyrOXeWmgUafJPzBqPhEG5
 wAETvddXnv795Ko6nHPfh8G2tlWWNCgCnCAf7CDBXe6AX5szYQFRb3m5A8j8ievTTWTF
 FEO55rK8F1Ztmxmu7LaYlVSO/GALtZQwNMM+LJ6UN/Kv6FZf1IZxQARBfXj2KPqYU+x5
 5Y1wPXY6Az/Y+avuwDAEZVUKI+VtB1OX0xHo1SrIglKgHsm5NcZsvzVNfE3v+qL+2J0q
 IrX215H0ap8+CGSWQy75ly55v/+/PK78m9vTtcdYorrWPq9wPb+BTiC5ZrLsogVSJT+N
 WZog==
X-Gm-Message-State: ANoB5pll3yL0FjOC5kdE/lAoF/SNkFJsjpFVkIqF/CW4UHkc55YNt7BO
 m/ylaUQoRHLYK93o7+mymNvnTr6XhvMdxCDor1OomGQ9ZsZ5AvjsO6AeIEmFk6Dz4wLFQKL7XRN
 aEx1ow6XmyAV9rfM=
X-Received: by 2002:a05:6214:580b:b0:4bb:ddaf:b9e5 with SMTP id
 mk11-20020a056214580b00b004bbddafb9e5mr1526552qvb.52.1668169248082; 
 Fri, 11 Nov 2022 04:20:48 -0800 (PST)
X-Google-Smtp-Source: AA0mqf68bGEM1zfpx51qcwpWU3wsAv9tYRYB3L8zd1QWc0tB5+DbvDTMJWROcY3MJXP63Tc8vFOlAQ==
X-Received: by 2002:a05:6214:580b:b0:4bb:ddaf:b9e5 with SMTP id
 mk11-20020a056214580b00b004bbddafb9e5mr1526545qvb.52.1668169247874; 
 Fri, 11 Nov 2022 04:20:47 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 g10-20020ae9e10a000000b006fa4cac54a5sm1283232qkm.72.2022.11.11.04.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 04:20:47 -0800 (PST)
Message-ID: <3c02b0ca-b21e-cc23-eee4-0feb82f0bcb7@redhat.com>
Date: Fri, 11 Nov 2022 13:20:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 5/8] virtio-blk: mark IO_CODE functions
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
References: <20221108211930.876142-1-stefanha@redhat.com>
 <20221108211930.876142-6-stefanha@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20221108211930.876142-6-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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



Am 08/11/2022 um 22:19 schrieb Stefan Hajnoczi:
> From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>
> Just as done in the block API, mark functions in virtio-blk
> that are called also from iothread(s).
>
> We know such functions are IO because many are blk_* callbacks,
> running always in the device iothread, and remaining are propagated
> from the leaf IO functions (if a function calls a IO_CODE function,
> itself is categorized as IO_CODE too).
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Message-Id: <20220609143727.1151816-7-eesposit@redhat.com>
>


Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>


