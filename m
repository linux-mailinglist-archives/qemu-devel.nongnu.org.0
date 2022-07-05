Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AB55669B5
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 13:35:00 +0200 (CEST)
Received: from localhost ([::1]:33896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8gpX-0003Ak-QA
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 07:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8gmz-0001GN-7h
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 07:32:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8gmv-00074S-Vo
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 07:32:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657020737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vRtz+foAvXX+/XuS77bTOWcfji13tj2/ESHgCY8grNY=;
 b=XVw49TCe04rl9TlqHKxOugYyvIko54fYpUIm0CKpanlIiyX6k95VnBLnVRMrluzmX6bx5o
 3Hq3C70lJrDj7CV/b2xVnxxPLYQPvZF+o+wBgQkbV8yfSWh8U3SGweGCFKzwnsNj/RgZax
 LOctaxjQ8ZrWMk+tlQwp5cUZSjjz+p0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-0YtJpySPNE-HkGeM3jU0nQ-1; Tue, 05 Jul 2022 07:32:16 -0400
X-MC-Unique: 0YtJpySPNE-HkGeM3jU0nQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 o11-20020a056402438b00b0043676efd75dso9199198edc.16
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 04:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vRtz+foAvXX+/XuS77bTOWcfji13tj2/ESHgCY8grNY=;
 b=kxozWwqQTSb4jyPepNrodenYfNbKlVwrcqI+sc7yNE+7pSv00+GHhb/6ZMXSNaK2C0
 GyCU6Udj2uAVlacVAietge0SV05KJfyst6IF369pHKsmpERlDI0541IT5EqZ8xti4Zx9
 NtIbBHUALRE9j3KC4Yom64JWtORgvIzwW1/sK9Dfs7fTlIEVb9dEuba+gU5SyJYEd0Y3
 d7bURinwNEipXe815bnZ8MZJHQu+eL4+t8GAQTVrnlbESB8VGn/ettY6QOH8/BY3YN1w
 TiQJPXb5YFN91X1W68ZSuhOAbzE9TuBNbP15UpcyRaghFdULAw+bWCZ9AV1j46A82vsA
 hIoQ==
X-Gm-Message-State: AJIora/Cpiz/Upem6B/N7tpCsucIuqQMc9x92GhgvKCAPoVcn7AZVcjz
 CC2LgOEpH14IY14+ZJGo4LANBl69mDA87Ko3aAaF7hNki185i4PBQ7lqZwgOoT+p6pcm2dQz3Uz
 /ty/KljKaCw+JVdc=
X-Received: by 2002:a05:6402:228f:b0:43a:896:e4f0 with SMTP id
 cw15-20020a056402228f00b0043a0896e4f0mr20841628edb.81.1657020735248; 
 Tue, 05 Jul 2022 04:32:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vbN1EDHqYcTfUqiXMIvXIfX8vULO50MZXbP7oBIsU4HsW/sIPv1SsLSgM7LBWmIVKW5Xy72g==
X-Received: by 2002:a05:6402:228f:b0:43a:896:e4f0 with SMTP id
 cw15-20020a056402228f00b0043a0896e4f0mr20841591edb.81.1657020735004; 
 Tue, 05 Jul 2022 04:32:15 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 ev20-20020a056402541400b0043a20be7a33sm5555631edb.90.2022.07.05.04.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 04:32:14 -0700 (PDT)
Message-ID: <06136c6a-1cef-cfd4-a749-6d1c99987cf7@redhat.com>
Date: Tue, 5 Jul 2022 13:32:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: questions about QMP commands - "block-export-add" and
 "nbd-server-add"
Content-Language: en-US
To: Yu Zhang <yu.zhang@ionos.com>, qemu-devel <qemu-devel@nongnu.org>,
 Gioh Kim <gi-oh.kim@ionos.com>, Alexei Pastuchov
 <alexei.pastuchov@ionos.com>, Jinpu Wang <jinpu.wang@ionos.com>,
 Fuad Faron <fuad.faron@ionos.com>, Elmar Gerdes <elmar.gerdes@ionos.com>
References: <CAHEcVy7gC_h4Nei3m6KMvFkjTAFR6XkJcw+AMoxJ3r9CMXp=-Q@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAHEcVy7gC_h4Nei3m6KMvFkjTAFR6XkJcw+AMoxJ3r9CMXp=-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.07.22 11:57, Yu Zhang wrote:
> Hi All,
>
> since QEMU-5.2, the QMP command "nbd-server-add" was deprecated and 
> replaced with "block-export-add" [1].
>
> Arguments for the two are different. For using "block-export-add", 
> "id" and "node-name" are needed, of which "id" is "device" for 
> "nbd-server-add"

No, @id is the ID for the export, which is used to identify it it in 
other block-export-* commands like block-export-del. nbd-server-add’s 
@device parameter corresponds to block-export-add’s @node-name parameter.

> and "node-name" can be obtained from the querying result of "query-block".

Ideally, management tools would set every block node’s @node-name 
manually so it doesn’t need to be queried.

> As shown by an example below:
>
> { "execute": "query-block" }
> {"return": [..., {..., "device": "drive-virtio-disk5", ...: {...:
> {"virtual-size": 53687091200, "filename": "/dev/md0", "format": "raw", 
> ...}
> , ..., "node-name": "#block349", ...}, "qdev": 
> "/machine/peripheral/virtio-disk5/virtio-backend", "type": "unknown"}]}
>
> { "execute": "nbd-server-add", "arguments": { "device": 
> "drive-virtio-disk5", "writable": true }}

Note that you could pass “#block349” for @device here, instead of 
“drive-virtio-disk5”.

> {"error": {"class": "GenericError", "desc": "Permission conflict on 
> node '#block349': permissions 'write' are both required by an unnamed 
> block device (uses node '#block349' as 'root' child) and unshared by 
> block device 'drive-virtio-disk5' (uses node '#block349' as 'root' 
> child)."}}
>
> { "execute": "block-export-add", "arguments": { "type": "nbd", "id": 
> "drive-virtio-disk5", "node-name": "#block349", "writable": true }}

You can pass anything for @id that you’d like, for example 
“nbd-export-349”.  It should identify the export, not the block device 
underneath.

> {"error": {"class": "GenericError", "desc": "Permission conflict on 
> node '#block349': permissions 'write' are both required by an unnamed 
> block device (uses node '#block349' as 'root' child) and unshared by 
> block device 'drive-virtio-disk5' (uses node '#block349' as 'root' 
> child)."}}
>
>
> An issue we encountered with "block-export-add" for VM live migration:
>
> on the target server
> - exported device name: drive-virtio-disk5
> - node name of the exported device: #node123
>
> on the source server
> - gets the device name from target via network: driver-virtio-disk5
> - gets the node name from the target via network: #node123
>
> However, on the source server, the node name #node123 can't be identified.
>
> Assumption: the same "device" may have different "node-name" on the 
> source and target servers.

Yes.  You should configure the node name to match or at least to be 
something that you can work with.

I don’t know how you command line to configure block devices looks, but 
if you’re using -drive (which I assume you do, because with -blockdev, 
the @node-name parameter would be mandatory for you to set), then you 
can simply use something like

-drive id=drive-virtio-disk5,node-name=drive-virtio-disk5-node,...

And then you can address the drive-virtio-disk5 block device with the 
node name “drive-virtio-disk5-node”.

Hanna


