Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B883BB620
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 06:23:45 +0200 (CEST)
Received: from localhost ([::1]:52432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0G92-0002fp-9G
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 00:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m0G6n-0001FT-KH
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 00:21:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m0G6j-0007iz-VO
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 00:21:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625458877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bT3XTZ68N9oFPDfqnb9QxsSClCya+x/ot/yXOlwUWXg=;
 b=AVkURNZCbGDQZHOjLyTBg5KFhSz/JpwPwaKJEakL3mOG3SFmV3ebEwr5kL6CYiWUdj9Sz9
 3RR8VVArhtVTE3I3klrtM4t7CzBfSHP/TmQZiuCdvYga0mpQRV8y6GtNR8IU7Gv8s7xiyD
 zNFYUH6oTCKV6SA9p+xa5woizcFDxak=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-c0IEuYRnOGuGRI_a76QZyw-1; Mon, 05 Jul 2021 00:21:16 -0400
X-MC-Unique: c0IEuYRnOGuGRI_a76QZyw-1
Received: by mail-pg1-f199.google.com with SMTP id
 j17-20020a63cf110000b0290226eb0c27acso12730071pgg.23
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 21:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=bT3XTZ68N9oFPDfqnb9QxsSClCya+x/ot/yXOlwUWXg=;
 b=XEQyk936LOk6VJUsXgCj2DkaFHLdfgfy/cU9oZUjEE7JXTbHKuER/O/ccUvFy0CsMy
 QKymL/ZgNKNCufzGfaFLFgpe3enyXis9PK8F3d1zot2RH/Zbrp49IAuXz93dJFt2L7bc
 S8DYJrv735EaTr7rIxbxXhfXxhIEOpzV0TLgUT8EosOLMlGdeTImwfy1BebHqTCitHPg
 wjNqWppJh4c1lB4WndXGLknSdzJMe1yvujkVrZYjsADRqxf7V37axBc5rdaKXuNOUT6q
 DTqOmFmhtu336s7pkkw+lUU044elj+on7YLDb7/I/BB0flHl62HsrmdF5sEQYHrdY1D2
 hUMA==
X-Gm-Message-State: AOAM533ZhWJHs+hvUTpLqi4A3h4thngklPjawmFuK3jyqXlqvxchWIB3
 gGa0LszO0PrjmO6S96jbtZsrlqXrR/mZzJjllYJqj5+Dev2Op7ntBume+xDrlNepP78bqDR2hT5
 IyRUkT746/rnM/Gc=
X-Received: by 2002:a63:2cc4:: with SMTP id
 s187mr13506115pgs.233.1625458875498; 
 Sun, 04 Jul 2021 21:21:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGxe7aKHRINGgoriJUL05ENthjMkdWpKXnySFTJ75R+ndEttaUOy1ckZdYV2QMBufLIxF2YA==
X-Received: by 2002:a63:2cc4:: with SMTP id
 s187mr13506098pgs.233.1625458875229; 
 Sun, 04 Jul 2021 21:21:15 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id h1sm19349563pji.14.2021.07.04.21.21.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jul 2021 21:21:14 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] hw/net: e1000: Correct the initial value of VET
 register
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
References: <20210702092427.1323667-1-bmeng.cn@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <434daef6-4afb-c796-9b63-f72cca403314@redhat.com>
Date: Mon, 5 Jul 2021 12:21:11 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702092427.1323667-1-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Christina Wang <christina.wang@windriver.com>,
 Markus Carlstedt <markus.carlstedt@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/7/2 ÏÂÎç5:24, Bin Meng Ð´µÀ:
> From: Christina Wang <christina.wang@windriver.com>
>
> The initial value of VLAN Ether Type (VET) register is 0x8100, as per
> the manual and real hardware.
>
> While Linux e1000 driver always writes VET register to 0x8100, it is
> not always the case for everyone. Drivers relying on the reset value
> of VET won't be able to transmit and receive VLAN frames in QEMU.
>
> Reported-by: Markus Carlstedt <markus.carlstedt@windriver.com>
> Signed-off-by: Christina Wang <christina.wang@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> (no changes since v1)
>
>   hw/net/e1000.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
> index 4f75b44cfc..20cbba6411 100644
> --- a/hw/net/e1000.c
> +++ b/hw/net/e1000.c
> @@ -29,6 +29,7 @@
>   #include "hw/pci/pci.h"
>   #include "hw/qdev-properties.h"
>   #include "migration/vmstate.h"
> +#include "net/eth.h"
>   #include "net/net.h"
>   #include "net/checksum.h"
>   #include "sysemu/sysemu.h"
> @@ -254,6 +255,7 @@ static const uint32_t mac_reg_init[] = {
>       [MANC]    = E1000_MANC_EN_MNG2HOST | E1000_MANC_RCV_TCO_EN |
>                   E1000_MANC_ARP_EN | E1000_MANC_0298_EN |
>                   E1000_MANC_RMCP_EN,
> +    [VET]     = ETH_P_VLAN,


I wonder if we need a compat flag for this, since we change the behavior.

(See e1000_properties[])

Thanks


>   };
>   
>   /* Helper function, *curr == 0 means the value is not set */


