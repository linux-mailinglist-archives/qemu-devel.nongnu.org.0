Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 523AF62B390
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 07:56:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovCJk-0006OS-Q7; Wed, 16 Nov 2022 01:54:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ovCJj-0006OC-Dy
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 01:54:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ovCJh-0006SN-Nk
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 01:54:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668581676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/k0/U9n66+/sIAJ1q6cJjvTakoSLBw6e0l19T6VF6Do=;
 b=AS2yuJGHil6z9TjSu9HsjD2MNnHTKVtUegspYuwiH1/K/75XN7qH5FEYgZpyoSNeL9qvyy
 eDxTdzLkov3Lo8HA2jaECCm5/lkmt+IZl+YBeYFIyOWdqSStrPvh4Xihv64XzIkea/fqW9
 iMm/IAfOBpqvacuMY0pggGok7uVfRT4=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-480-YEUaqNWuPD62iaNl2PF4PA-1; Wed, 16 Nov 2022 01:54:34 -0500
X-MC-Unique: YEUaqNWuPD62iaNl2PF4PA-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-13b041fd3cbso7707510fac.16
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 22:54:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/k0/U9n66+/sIAJ1q6cJjvTakoSLBw6e0l19T6VF6Do=;
 b=0xB30F9GDCVdrjGsXyVP05Uys373GtJ07DLW/WiWwNFLtDMVyZw/I+C0GAYJyim+OJ
 FvSM/PCB46tbvpMUdAlSIRnC6J7u5DXUQkKDQznaTGr3iSYhUATcXvyqj5X2ZKIkEq/P
 tg3jlVuwqQx463c1xJQQ/bw+xmb+kGzLZN87MlkRvSh/6FRLp8h1wEA8ZE7MbOqXY7zy
 xq/2a0Tdwxl7qht6pYBqYM5Nki7OYqK4lFh01LgcmKoiE/jiVCLuRbRMp1YXK5re/Vxm
 23rBvtrNxYRDKEu7ItiefaQdTMzNTrVmTD7iMHPkFspsUHq70Kkgns3RHwWoNAannJWN
 hSPA==
X-Gm-Message-State: ANoB5pkBltpdLAm4fKkKPxw54a+W1fHON46NrNqtRRKiEusE0Qs9kO6z
 dNSuABkV/ZFmMAXtMpAgcE8Y6sm4qxJBvqdH5FoDS6mNzs3+qMvVvVBzw3b/+josqiSCP2Tvd+C
 DG7TuE09W4r62nAq/AWAYw2GA8HwLWO4=
X-Received: by 2002:aca:906:0:b0:354:68aa:9c59 with SMTP id
 6-20020aca0906000000b0035468aa9c59mr903362oij.35.1668581673722; 
 Tue, 15 Nov 2022 22:54:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6VMKDo44HYizDPzqO8Co7L7mKwKS1/MVgual/InSE0rM2hEeBij5kEHZdHMOGhuHrPdQg6nzmux1eS07+rlvk=
X-Received: by 2002:aca:906:0:b0:354:68aa:9c59 with SMTP id
 6-20020aca0906000000b0035468aa9c59mr903357oij.35.1668581673510; Tue, 15 Nov
 2022 22:54:33 -0800 (PST)
MIME-Version: 1.0
References: <20221115163659.1595865-1-stefanha@redhat.com>
 <011801d8f967$5dad0f00$19072d00$@fiebig.nl>
In-Reply-To: <011801d8f967$5dad0f00$19072d00$@fiebig.nl>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 16 Nov 2022 14:54:22 +0800
Message-ID: <CACGkMEtJ2+2yhHgD33wiWvUEREei2ThQAkRNFWzRrDt5D50u+g@mail.gmail.com>
Subject: Re: [PATCH for-7.2] rtl8139: honor large send MSS value
To: Tobias Fiebig <tobias@fiebig.nl>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, Russell King - ARM Linux <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Nov 16, 2022 at 10:59 AM Tobias Fiebig <tobias@fiebig.nl> wrote:
>
> Heho,
> I just tested around with the patch;
> Good news: Certainly my builds are being executed. Also, if I patch the old code to have a MAX_MTU <= the max MTU on my path, throughput is ok.
>
> Bad news: Something is wrong with getting the MSS in the patch you shared. When enabling DPRINT, values are off (sent MSS vs. printed MSS):
> 600 2060
> 800 2308
> 1000 2316
> 1023 2307
> 1200 3076
> 1400 3340 (most likely clamped to 1320)
>
> Fiddling around a bit more, I found txdw0 printed earlier in the stack as hex (sent MSS, txdw0):
> 769 900502f5
> 1000 900503dc
> 1280 900504f4
> 1281 900504f5
> 1301 90050509
> 1317 90050519
> 1320 9005051c
>
> This maps rather well to:
> MSS = txdw0 - 2416246772
> MSS = txdw0 - 9004FFF4
>
> Sadly, my C is 'non-existent' and it is kind-of 4AM, so also not in the brainspace to fill those gaps. But if one of you could look at the patch again, that would be nice. Otherwise, I should have some brainspace for this tomorrow night (UTC) again.
>

Ok, I think I found at least one issue:

/* large send MSS mask, bits 16...25 */
#define CP_TC_LGSEN_MSS_MASK ((1 << 12) - 1)

First, MSS occupies 11 bits from 16 to 26
Second, the mask is wrong it should be ((1 << 11) - 1)

Thanks

> With best regards,
> Tobias
>


