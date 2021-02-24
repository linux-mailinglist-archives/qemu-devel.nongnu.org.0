Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D01323A70
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 11:23:21 +0100 (CET)
Received: from localhost ([::1]:55584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lErKC-00066r-PH
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 05:23:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lErIr-0005dR-Gg
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 05:21:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lErIj-0004OV-Ib
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 05:21:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614162108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ylLEq1h3LkRvYPexOcXHDsfUC1W5UG2Fxs/R7W6DqKU=;
 b=Fv3eTrbqB5diyIV2j//dopEpBAdrSSftNFTSwH45EasgxCs+AtZTe70N9qddvTgf+Y5OTA
 PFONeRDRyeWdjwSbCo+WlBEjAfrwP9RZcgSS/Nl4yaks/uYZn513jL4xHqUz8S47AMKyXo
 wHfreggaSnRdPkx4MLYy/SQOKQchYWQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-bg1MRMKrNwCDX_6qkxAHEg-1; Wed, 24 Feb 2021 05:21:44 -0500
X-MC-Unique: bg1MRMKrNwCDX_6qkxAHEg-1
Received: by mail-ed1-f70.google.com with SMTP id c7so632762ede.17
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 02:21:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ylLEq1h3LkRvYPexOcXHDsfUC1W5UG2Fxs/R7W6DqKU=;
 b=cZ20rp4TEiyNo749jl2M2//k2NW1HXdXUexB8NWSU0JHc3r+5hupuroSD4doVlW+cO
 QNCvpiFAcMuMTQrj3ZZqqYABXxt89rzPDJrQTeFjhcvvlcOlaBR9RkFv/NMRo+e0XqQu
 KyGns0F3laLJR8iXJPsjAwc5uBhbJaq+F5vx+/kIYeSVgzVsAxatXnOK0EU9IMvcgxAb
 9OG5k6y7yQxs/il4+/2MRPJyIygC2PvP8hrDVnNbqhcrmeFG7+Lxriu7PnmZkFrF43Jy
 +9kfKh3l6Qi4oG1x0JF++w7RJEqnlHjX4j5v/KYU3kNYji/pahYqAFHIMqtuVC+7gdBB
 JO1Q==
X-Gm-Message-State: AOAM53023hKS83HvLSrE5HaP9gLOJlQQzw+p+kqAKxeckl/vaSOsVopu
 pSuPqpWb8pBddIzbZeXywPohwUjXTAH1Z/J8I8mDbF2JKBfcoaAUJxqwolGpXxqUpWMtJShbZzM
 PJ9j9ju/VLb7yTjM=
X-Received: by 2002:a17:906:f885:: with SMTP id
 lg5mr21451514ejb.25.1614162103610; 
 Wed, 24 Feb 2021 02:21:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7wpvMpdCYNFmBuPD+qOYQzUF++lJXeF/FIOzyMbC1rRyXY/ASTOXY87Zupz3tW9lFbVEBDA==
X-Received: by 2002:a17:906:f885:: with SMTP id
 lg5mr21451500ejb.25.1614162103434; 
 Wed, 24 Feb 2021 02:21:43 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id rn18sm979053ejb.99.2021.02.24.02.21.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 02:21:42 -0800 (PST)
Subject: Re: [PATCH] virtio: disable ioeventfd for record/replay
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Cornelia Huck <cohuck@redhat.com>
References: <161303249335.948571.16873882207700527766.stgit@pasha-ThinkPad-X280>
 <20210211094406.664520e6.cohuck@redhat.com>
 <ad446311-c5f9-9887-73d5-3c1f3707e5d1@ispras.ru>
 <fb2d2816-a696-a407-2f92-ec5950db9c4d@redhat.com>
 <b59c3b42-b22b-8056-35e5-d7e37c215314@ispras.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1e157b72-6db8-2630-67f8-c60ac69b287c@redhat.com>
Date: Wed, 24 Feb 2021 11:21:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b59c3b42-b22b-8056-35e5-d7e37c215314@ispras.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/02/21 10:56, Pavel Dovgalyuk wrote:
>>
> 
> Thanks for pointing at these machines.
> But virtio-mmio does not support ioeventfd disabling as in PCI and CCW 
> devices.
> Should this option be added first?

Yes, that was a good idea.

Paolo


