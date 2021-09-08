Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE044033EB
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 07:48:47 +0200 (CEST)
Received: from localhost ([::1]:46472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNqRy-0000Ai-HI
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 01:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNqPb-0006X1-Di
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:46:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNqPY-0004tB-HQ
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:46:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631079973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q3Lh6Ggy5OYTyAkN6kZsRbEoL+i4GFz7KJS3zdNXP0Q=;
 b=VLBPXx0Ae9Y8fxxVxR/jP6eLXkjc4Q/l+dxtkUaHQO9O73/TwfuKqLVAFg5T008SBBtLs7
 ut1olCsUVIJo8WP1SV/XDD985bAqGW/nX4BBjXO28CT0JOPRCAM/TpK3ply0FRcb6hTaj9
 +NzE5rm8UWtnsviSmSH6+TNEGNnNv/s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-RyPzCkyGPnysFMbaD_TNkw-1; Wed, 08 Sep 2021 01:46:12 -0400
X-MC-Unique: RyPzCkyGPnysFMbaD_TNkw-1
Received: by mail-wm1-f72.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so547854wml.5
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 22:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q3Lh6Ggy5OYTyAkN6kZsRbEoL+i4GFz7KJS3zdNXP0Q=;
 b=NbbMhFQjYAAx1X+bc96zDAolr7VFWnIg+CunoqrxDYkUQQ27QvuYVLwh/VvJc//5OS
 7m5CFbysyDtkXROpNljxHAPQ4PKJ68sOQh5Sn2HnNq5DTlHWgjGiP0jx3HwYzJ/dV72t
 r2pFofHu+73GLP20TubESuyCcqZ3xZ2Umumj/uOwv/fsbNLcFBfJXwVUtB3UEWBbjbQj
 ob7K30k4m3hzwCdszltQommWY5mw9KcxItVQwwyIurnCiGJ661adZwEC6r+vZBd4f6ib
 Z/1iJIAqiXEIou3NH4LCMaYlTHvs1pfQwUzI/kr76ya5iXuoY4z91+AJEcySYKwoHJtF
 Zc3g==
X-Gm-Message-State: AOAM531Nl1wMKG/rnmTtmx7qXYwXz7TIDq96UcYn9owJXlI50Wv3VbKy
 4Pa86SdKa/DQ7jI+i37cl0aXIfk8wbcSbed9ztBL559RGJHWdLtVCVZ+xhwj9XVz9GmfaKs25cL
 Pzfc99KjbmY2madA=
X-Received: by 2002:a5d:4305:: with SMTP id h5mr1901661wrq.4.1631079971143;
 Tue, 07 Sep 2021 22:46:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2wFt+ptJDsPwm9KPoz9TqPMau2YNFcPuzf8RAZ3fTjTN1q5rkJLXwlWo6zUOEQRueJMe1ZA==
X-Received: by 2002:a5d:4305:: with SMTP id h5mr1901638wrq.4.1631079970892;
 Tue, 07 Sep 2021 22:46:10 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f3sm957345wmj.28.2021.09.07.22.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 22:46:10 -0700 (PDT)
Subject: Re: [PATCH] ebpf: only include in system emulators
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <20210907104512.129103-1-pbonzini@redhat.com>
 <8b500aeb-b4e2-dcee-24f8-825ae6327acf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e6790a9c-f2a3-75f8-623f-51726f4b656d@redhat.com>
Date: Wed, 8 Sep 2021 07:46:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8b500aeb-b4e2-dcee-24f8-825ae6327acf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: yuri.benditovich@daynix.com, andrew@daynix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/09/21 05:08, Jason Wang wrote:
> 
> ÔÚ 2021/9/7 ÏÂÎç6:45, Paolo Bonzini Ð´µÀ:
>> eBPF files are being included in system emulators, which is useless
> 
> 
> I think it should work since it's an independent feature. The current 
> use case is to offload the RSS from Qemu to kernel TAP.

Sorry, I meant "user emulators".  That should make more sense, they 
don't have TAP at all.

Paolo


