Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B96B44DB69
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 19:01:56 +0100 (CET)
Received: from localhost ([::1]:37412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlEOZ-0004Y7-2k
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 13:01:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mlENN-00039e-4r
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 13:00:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mlENK-0003Zw-JE
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 13:00:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636653638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OEWMjP0vVHlE8gRec9XSViBTEETCfxEhKBbmRDctx+U=;
 b=CpHKFEZCXDG29lHOiKtNqEpwpUh98eBpPFP2+gsf4ScReY/nm4G5yWCbhKoKDd2+/PyJn8
 1VK8txZ78Qzv4olVLzA4xJ5YyCgS1R8npr0p4Uw5vpOTUmYI5rC7ufq7UBLzKLRgxFF8Mr
 W5NYVVobRDxxUvjZVsDEk4By2Np/ia8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-DTxY9l4aONenZ-jGI2rB2w-1; Thu, 11 Nov 2021 13:00:36 -0500
X-MC-Unique: DTxY9l4aONenZ-jGI2rB2w-1
Received: by mail-wm1-f71.google.com with SMTP id
 c1-20020a05600c0ac100b00322fcaa2bc7so3003172wmr.4
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 10:00:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OEWMjP0vVHlE8gRec9XSViBTEETCfxEhKBbmRDctx+U=;
 b=tLbh043P8R10h4worcK+QaehLZG7hUgkU61r8DaDKWw3jKJzcDoXfkF3zJeZESaOMr
 KSID/XoXLu8yc7zAzv9IRGrf32qnoPuHX6Lzp4U8cqsH2y+/W0zLb6vBxsGROV3S1I+R
 Q121B/0dce+rDMWdoB/Fyc+CWxyuKxsvPLp3uHgM2Gf1niVfqXOZxtQh0ugg5DChI0MK
 cJgJBMLKXln4d4PJHAkYn2/S+NkPD2ABlzGStNmt3HBoFnhGgCDZ4UFSRiCcl7hBQ5Vi
 JDY2ZoIhDVcX7N//zI8TGkSU4TSvZx1QfeaUZKfsMog4bERVGeIIBPppwzqM4XBu/bfK
 GE/w==
X-Gm-Message-State: AOAM530InyMZO0P7O6QoJoe2w5TKg9RTleO8p8nkoew+PcjA82Q2I6Wo
 uBERtLfLJ17/6aD56dwK4QbNN5405Ej7OgfreWcQderTHc4MKh3QM2bhmM8AIABsw38+n9lcimj
 qT4QMHEeRMwkipjI=
X-Received: by 2002:a1c:1fcf:: with SMTP id f198mr10235277wmf.66.1636653635656; 
 Thu, 11 Nov 2021 10:00:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxAmoSsNjjdc4QGDuEbDPAdlpkcBxWHtg7TtLgQy3R+5Bi0j+Rhpxyx+OQ9bj+kKoe1LhyFzQ==
X-Received: by 2002:a1c:1fcf:: with SMTP id f198mr10235235wmf.66.1636653635366; 
 Thu, 11 Nov 2021 10:00:35 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id r17sm10708487wmq.5.2021.11.11.10.00.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 10:00:35 -0800 (PST)
Message-ID: <ef3616c0-0758-7085-a86b-22221abaaa90@redhat.com>
Date: Thu, 11 Nov 2021 19:00:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 06/10] vhost-backend: stick to -errno error return
 convention
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
References: <20211111153354.18807-1-rvkagan@yandex-team.ru>
 <20211111153354.18807-7-rvkagan@yandex-team.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211111153354.18807-7-rvkagan@yandex-team.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, Hanna Reitz <hreitz@redhat.com>,
 yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 16:33, Roman Kagan wrote:
> Almost all VhostOps methods in kernel_ops follow the convention of
> returning negated errno on error.
> 
> Adjust the only one that doesn't.
> 
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> ---
>  hw/virtio/vhost-backend.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


