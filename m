Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EEC625B0B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 14:15:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otT11-0000YU-KT; Fri, 11 Nov 2022 07:20:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otT0r-0000Wm-CK
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 07:20:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otT0q-0000Mp-1F
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 07:20:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668169199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BJp+hfJZfCHfqiY/mJLukHUO6SdHDal5IqAHoqFz1v0=;
 b=bX+syn01Lo53W+Nm6ErMp4c/ed3jUnVDHFY4RO6Kal/2/wFc9id2Fnkk/kaImykRrkqz60
 8aFdtBgsNVKiJ0EPqfXKdDzKryoIE6YA4I870T3nc2tHAF8s9xSzpYtc+WUmUI/CEk4gkG
 9mTVaj8+VvgQT9bJcfdfAavOHurRmXA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-451-ziu6yP1GN5ar-Gq8KzTnQQ-1; Fri, 11 Nov 2022 07:19:57 -0500
X-MC-Unique: ziu6yP1GN5ar-Gq8KzTnQQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 g12-20020a0cfdcc000000b004ad431ceee0so3539714qvs.7
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 04:19:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BJp+hfJZfCHfqiY/mJLukHUO6SdHDal5IqAHoqFz1v0=;
 b=3u6wshMudcvYkGeyDF3UKoEdWTfj19GqHzufu+iOelRJVLRUCMzMRpXBqWH9D4/Cnb
 F2LAGS0MrYx63idcOzQl104uD+5i/RmoaofO1E5kF4Qwc2TxcZ2vN1agnvBA0LU6ec1t
 oEvmx/tm7IiaRdrM+JeawilqFtpYz/uvl7JUTEBogOR8G42MP8d7zO5atE7v4q/Bvjfr
 19rRJQlDfHNLPZVI/0eLHR6fs0HyxUzL3oARZZkqMLZ3ZWCXOm5jk9miUZ8dSmqbtdvl
 jJCQxhSwctru5gEVCmzTR3XRraWjNnhwwTRBdFmx47iYHMLV/SfJUGrxL6G5WIKVqc+M
 ERZQ==
X-Gm-Message-State: ANoB5plNunUlbcyELomdATAf+ubp/dQi3h3DCMqm3LamxhWb38I3kaDM
 f2Q4NPBYFWrRiZBjyAXk825jaL4Dh2gPmEVEEKKkRXj96JbB+aOyXY1oYusH059H1LTZGu1ngj3
 V4rgmgzeTM5w/lfA=
X-Received: by 2002:a05:620a:3720:b0:6e2:5fce:f291 with SMTP id
 de32-20020a05620a372000b006e25fcef291mr768013qkb.86.1668169196852; 
 Fri, 11 Nov 2022 04:19:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4QoFQPpuiv9VtZutSc87jI8uVJ+WdbW5U+8ZhH0rI2sRZgpDZd+XIvJ1hh8xA7Exz7wqfKnw==
X-Received: by 2002:a05:620a:3720:b0:6e2:5fce:f291 with SMTP id
 de32-20020a05620a372000b006e25fcef291mr768001qkb.86.1668169196630; 
 Fri, 11 Nov 2022 04:19:56 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 n77-20020a374050000000b006b5cc25535fsm1290626qka.99.2022.11.11.04.19.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 04:19:56 -0800 (PST)
Message-ID: <e5423ecc-469a-186d-92ff-1cd58f805ef4@redhat.com>
Date: Fri, 11 Nov 2022 13:19:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 4/8] virtio-blk: mark GLOBAL_STATE_CODE functions
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
References: <20221108211930.876142-1-stefanha@redhat.com>
 <20221108211930.876142-5-stefanha@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20221108211930.876142-5-stefanha@redhat.com>
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
> that are always called in the main loop with BQL held.
>
> We know such functions are GS because they all are callbacks
> from virtio.c API that has already classified them as GS.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Message-Id: <20220609143727.1151816-6-eesposit@redhat.com>
>


Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>


