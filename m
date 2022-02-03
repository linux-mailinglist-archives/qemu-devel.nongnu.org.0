Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8384A83B1
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 13:18:24 +0100 (CET)
Received: from localhost ([::1]:42130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFb4B-0008Hl-14
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 07:18:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nFb0o-000771-1j
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 07:14:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nFb0k-0005NW-5B
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 07:14:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643890486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wcOLtE0r3P5wGc7HrvfJYopI9N37ExPqSGpCU/867Wc=;
 b=Cbvc/4uCZ4+vG2Eh9/O+txwk+3p4Fl4ste9k1DitXde1iui56Kh3RC/Sbwx8FK/BkQwcY8
 +NtgXjFlNYZqe00m0jp4i8ja/l7PGkCmLV8uHF2nOpYZZWwZaJtn/A5uyHqZVKLysphdsp
 u2SeFE2v6IlnFIzmb2vlqjC3+8JC+7o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-y0iQ7ulfOf2X63lJM2FWiQ-1; Thu, 03 Feb 2022 07:14:45 -0500
X-MC-Unique: y0iQ7ulfOf2X63lJM2FWiQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 k12-20020adfe3cc000000b001d6806dfde1so582051wrm.16
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 04:14:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wcOLtE0r3P5wGc7HrvfJYopI9N37ExPqSGpCU/867Wc=;
 b=7DeTlCJmlBVoqF0kX2saqBCCUokkcMVNILwb70UhMg43DwsAMJ8gvKe7H8xt67++Ki
 Qn5b0+WDryFp15GU1S5BFsFXR05LjoajnmESaNTyAbX9foCbGaOh32F/BGLLwelTwQCX
 GgJDQZGj0wU7YXrDsnBP93iI2AIFffhovQ4HApQEp4aMjB8k0af9+atEshr9ruarBWPW
 ARux/E/b1HYW1XTer6CMPSx6gDFaeommQzMJFDkkriaFB4nrqovySlb8APllzSxAOEE1
 FlSzURQQjbWt+SiBSVeUn1nt8YTfRGvW5YZg5L9oAMvBIcWNU5hTzE9qjOcRKuXUTPtM
 vFVg==
X-Gm-Message-State: AOAM532aoWL1SlA59uxFzy8Gg4abeTM92X/uA3EBJAG/leJtxcMlNE6f
 d65d5rfmZ2TItbF9wApIkeVtdKUS7ATYojBWWX1WYWlJumPRjabTYsF3KZ6bucjlHg92rcB0Efg
 HJfd099hR+gAQeAw=
X-Received: by 2002:a1c:2b01:: with SMTP id r1mr10218646wmr.63.1643890484487; 
 Thu, 03 Feb 2022 04:14:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzen2ESY0cPJ1/PmeRqYBGpmtsS14YGsNz6hN0hReOCSx9uJiGbHFiqofF7C1Owtc9BFu4FwQ==
X-Received: by 2002:a1c:2b01:: with SMTP id r1mr10218625wmr.63.1643890484254; 
 Thu, 03 Feb 2022 04:14:44 -0800 (PST)
Received: from steredhat (host-95-238-125-214.retail.telecomitalia.it.
 [95.238.125.214])
 by smtp.gmail.com with ESMTPSA id k20sm8019275wmi.36.2022.02.03.04.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 04:14:43 -0800 (PST)
Date: Thu, 3 Feb 2022 13:14:40 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Peter Lieven <pl@kamp.de>
Subject: Re: [PATCH V2 for-6.2 0/2] fixes for bdrv_co_block_status
Message-ID: <20220203121440.i2avn4lenqardxun@steredhat>
References: <20220113144426.4036493-1-pl@kamp.de> <YflB4LKDdf8ay1PU@redhat.com>
 <98d5f022-e1c7-83b4-a043-ce63e8b6f38e@kamp.de>
MIME-Version: 1.0
In-Reply-To: <98d5f022-e1c7-83b4-a043-ce63e8b6f38e@kamp.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, idryomov@redhat.com, berrange@redhat.com,
 qemu-block@nongnu.org, ct@flyingcircus.io, qemu-devel@nongnu.org,
 idryomov@gmail.coms, pbonzini@redhat.com, mreitz@redhat.com,
 dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 03, 2022 at 12:42:30PM +0100, Peter Lieven wrote:
>Am 01.02.22 um 15:39 schrieb Kevin Wolf:
>> Am 13.01.2022 um 15:44 hat Peter Lieven geschrieben:
>>> V1->V2:
>>>  Patch 1: Treat a hole just like an unallocated area. [Ilya]
>>>  Patch 2: Apply workaround only for pre-Quincy librbd versions and
>>>           ensure default striping and non child images. [Ilya]
>>>
>>> Peter Lieven (2):
>>>   block/rbd: fix handling of holes in .bdrv_co_block_status
>>>   block/rbd: workaround for ceph issue #53784
>> Thanks, applied to the block branch.
>>
>> Kevin
>>
>Hi Kevin,
>
>
>thanks for taking care of this. I was a few days out of office.
>
>@Stefano: it seems Kevin addresses your comments that should have gone 
>into a V3.

Yep :-)

Thanks,
Stefano


