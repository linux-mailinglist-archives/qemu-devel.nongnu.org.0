Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925514DDF4E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 17:48:35 +0100 (CET)
Received: from localhost ([::1]:49760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVFmE-0004ya-3v
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 12:48:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nVFkj-00047R-NQ
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 12:47:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nVFkg-0002xY-OT
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 12:46:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647622017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mEXUHk+evoB/f6eQwdM+8yZz+SSp6P46clHf2pN6R0w=;
 b=cDVKT2iZY1UietKcbLazy+XY/8hsPpVVqiHHku2M5jaovGydl+FaNbKxMPa7sViBIFl2x1
 G0RP/LHnNKfA/WWHNJDE7imnM0XjR+eCfbe6Z3xBxXjjfTMuc+FmZ5KsU/eVP0GvxL7IpG
 Zh1Lx0f2nCcAotmLbp2WTB91ojZ8NKE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-FvoliV6cPjyW_PGVQU5bWw-1; Fri, 18 Mar 2022 12:46:56 -0400
X-MC-Unique: FvoliV6cPjyW_PGVQU5bWw-1
Received: by mail-ed1-f71.google.com with SMTP id
 m21-20020a50d7d5000000b00418c7e4c2bbso5231387edj.6
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 09:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mEXUHk+evoB/f6eQwdM+8yZz+SSp6P46clHf2pN6R0w=;
 b=w+nCELTAeTigDy/0GeqAm419HZr1JMZF5GWsGcezi5SYtWcldyffnnOsIsCInaAQfM
 QHtwHjQCMPlzVGsVM79ULX6nNvEKPNPa3WYdArrj2puVm/ug1LHn04+pP1GVRNKh/0Fh
 w7CLBYLkfJUJbL37Y7IU9ZxB7cvInrRtwzYntfo+IBSn2tWOiQmWL4cxWkXGaCYz+pKA
 kd9eeHV2mEhgFyfNO7/6g2f96A94BXgTAFH/ZMzVVK2ceztyi0ZHf10LwDVPOotibjl4
 F/6bvNxlzwcDDedM1YJFA47s4JCogmfEtIZBPHQxwWjzKFzZ1jltIPtxdk4MOXJR5tem
 n9Gg==
X-Gm-Message-State: AOAM531x9dm7QWcauYO+EUK+A46e0WAUruGzb0Egb8rtf7z87kuoEjcg
 A5cEkjptZlNEG1NWhfgJUFL6LxzyVD3MChezy1QAUmYh76Ar9Ge7NCmcqDQs9Zhkab26K1VgW/V
 SeWSWwKnxIJv1ics=
X-Received: by 2002:a17:907:3f03:b0:6df:b04b:8712 with SMTP id
 hq3-20020a1709073f0300b006dfb04b8712mr4768891ejc.290.1647622015471; 
 Fri, 18 Mar 2022 09:46:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBbaOfm5CGKP6uKzEkS4siF/53o/W0KMod9KmtOmOuLKiXAR1gqFTWtkp/iz+aYmrO/EOr7w==
X-Received: by 2002:a17:907:3f03:b0:6df:b04b:8712 with SMTP id
 hq3-20020a1709073f0300b006dfb04b8712mr4768866ejc.290.1647622015112; 
 Fri, 18 Mar 2022 09:46:55 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 o21-20020a170906289500b006d144662b24sm3778522ejd.152.2022.03.18.09.46.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 09:46:54 -0700 (PDT)
Message-ID: <82853cac-a5e6-f193-9acf-d3371f471dc9@redhat.com>
Date: Fri, 18 Mar 2022 17:46:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tests/qemu-iotests: Use GNU sed in two more spots where
 it is necessary
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
References: <20220309101626.637836-1-thuth@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220309101626.637836-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.03.22 11:16, Thomas Huth wrote:
> These two spots have been missed in commit 9086c7639822 ("Rework the
> checks and spots using GNU sed") - they need GNU sed, too, since they
> are using the "+" address form.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qemu-iotests/common.filter | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to my block branch:

https://gitlab.com/hreitz/qemu/-/commits/block

Hanna


