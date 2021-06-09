Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6EE3A140A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:16:26 +0200 (CEST)
Received: from localhost ([::1]:53466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqx8E-0003n9-1Z
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lqx62-0001UR-Re
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:14:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lqx60-0006Rb-9z
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:14:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623240847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E2P74na6e/RzfWw2ClydmXNbdrYkY7ufoo+E64JrbRA=;
 b=Li70tKxj99h9K+PYmex7a4P5aq6lX4VcSnIhhMtLUGFPyJJC9pCVBPsuumJeu2jlABBPhq
 J8K398bkKnn0698w3NL5ZKF/rESf/EZMsN0zR73N5jiBeWrL2jILpwGmGza1rP9+nb7ML7
 14644aUVzfOmcvKpSUkj6EFmJRnCLEM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-FSO6y-KjM_G2mQ12UBhIeA-1; Wed, 09 Jun 2021 08:14:05 -0400
X-MC-Unique: FSO6y-KjM_G2mQ12UBhIeA-1
Received: by mail-wr1-f69.google.com with SMTP id
 x9-20020adfffc90000b02901178add5f60so10719488wrs.5
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 05:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E2P74na6e/RzfWw2ClydmXNbdrYkY7ufoo+E64JrbRA=;
 b=Vie/HbQB5Cb/z1+AV8FaIMXHwTryX1QkCN6Xg1GlQ0Kr7UanSn4fQWSCoEqz+nchx0
 ZnqippuD8+DWDBhI4yrqciwzt8zDbqFp+m1JaubkQ1+n8aze3wzijKVcYawYtbo2s2rv
 Nms0+gc37UF3lQ/tFuLJmo4FfzvwPooOS+peGWqMB9yJJzMdB0aqHiD6N9kCYGJCbl9m
 r2SWLxI+sQS3vgtw1dpwvPHMvYoOcRk7OuzVcBuY07OxoWadTakbvAM8RIhWyzlhsjcx
 6NanoalKTsnIe6sdiUn6ecWCNknBZooYnuzt9QYMzd2Kn7tlMRRQ7A8HhW74NkGLhcat
 //Ng==
X-Gm-Message-State: AOAM530TCIR4wy9IJjQxbXtTkjR6AEdOT6VlzdDWXJBG6iQuciYGoSTV
 JgBIBCikBJkDMWaDLxneWHjg3WXgOAJ14g4E01RAtTI/TresWOsmYocJYYyKRAZ2nWsBfooSc8C
 Mx79kA9N3NOytT+U=
X-Received: by 2002:adf:fd0c:: with SMTP id e12mr27387459wrr.265.1623240844510; 
 Wed, 09 Jun 2021 05:14:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnUA+qFt3VAMlJxD/bASMZDzwpc6Pvk3GvT7xcMfUL4VqxxW1TC9035MD7nqylO6gDs0XEcw==
X-Received: by 2002:adf:fd0c:: with SMTP id e12mr27387436wrr.265.1623240844280; 
 Wed, 09 Jun 2021 05:14:04 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q11sm22962849wrx.80.2021.06.09.05.14.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 05:14:03 -0700 (PDT)
Subject: Re: [PATCH 0/5] esp: fixes for MacOS toolbox ROM
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 fam@euphon.net, laurent@vivier.eu, hpoussin@reactos.org
References: <20210519100803.10293-1-mark.cave-ayland@ilande.co.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <993dcb51-5eba-50c7-655c-323a4f07e88c@redhat.com>
Date: Wed, 9 Jun 2021 14:13:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210519100803.10293-1-mark.cave-ayland@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/05/21 12:07, Mark Cave-Ayland wrote:
> This patchset contains more ESP fixes from my attempts to boot MacOS under
> the QEMU q800 machine (along with a related NetBSD fix).
> 
> With these patches it is possible for the MacOS toolbox ROM and MacOS drivers
> to detect and access SCSI drives and CDROMs during the MacOS boot process.
> 
> This patchset has been tested on top of the ESP fix series posted yesterday
> (see https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg05763.html) with
> the extended set of ESP test images without noticing any regressions.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> [q800-macos-upstream patchset series: 1]
> 
> 
> Mark Cave-Ayland (5):
>    esp: allow non-DMA callback in esp_transfer_data() initial transfer
>    esp: handle non-DMA transfers from the target one byte at a time
>    esp: ensure PDMA write transfers are flushed from the FIFO to the
>      target immediately
>    esp: revert 75ef849696 "esp: correctly fill bus id with requested lun"
>    esp: correctly accumulate extended messages for PDMA
> 
>   hw/scsi/esp.c | 137 ++++++++++++++++++++++++++++++--------------------
>   1 file changed, 83 insertions(+), 54 deletions(-)
> 

Queued except for patch 4 (waiting for your comments and possibly a v2), 
thanks.

Paolo


