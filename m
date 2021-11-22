Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA96458D08
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 12:08:52 +0100 (CET)
Received: from localhost ([::1]:43286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp7Bi-0003s8-VD
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 06:08:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mp6rP-0001ek-FI
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 05:47:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mp6rO-0008Fn-19
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 05:47:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637578061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7vIKauLk4a+Iz2VF7MBP9ptXSsSZS43uFQ0y0qFk688=;
 b=PLP7vlVwX+Ad7ilUAu5uMfNKxKhX7ycjj5Gfp5524ChnYNL4JXKDIs+ej2kdCwyLb/VXi+
 Nt2szyXyIzlizVl97+4XlES2V79qegvcrhdzNiffCQ+XkGxAk8bK6ZcweJ5BzpvQIxIJ1L
 xqJwinxw1Z1/SmHrH4J9hg6zvh4cAGk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-MtNAGA0ZPFKcskxV0pNjNA-1; Mon, 22 Nov 2021 05:47:38 -0500
X-MC-Unique: MtNAGA0ZPFKcskxV0pNjNA-1
Received: by mail-wm1-f72.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so6627696wmb.3
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 02:47:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7vIKauLk4a+Iz2VF7MBP9ptXSsSZS43uFQ0y0qFk688=;
 b=6FuI3pOj9XwhbrYePWpOw+cNX/VxMchnc57+HKr1aORPcPlKKTSp5agnN/eLvAn5NJ
 4oHPWY9zCsFFihcONbPDCaqKOV9jYAFIxz2A+1a/UmURhG7ilIkIGR2OGczSDWcAK53U
 z88e0j/86gAkehJpUSm8TGGd8C3HiczJSTXxOxDnAzI84CP00hlNA3STVpff+cmF3aau
 OWUpwSdNuJ9LaUfF+oNBcBH1q/V4wUpYq16DDdMANMZbIflU/VgfVrqBpSD/asnDWGuY
 1MaPHuFXWbBjySTo/xNocl2AHUB5zhy/EdgQOYd7S8umssBbKc433vlyhaZK1nWwbPVm
 IfJA==
X-Gm-Message-State: AOAM532nzWq47NqR0idTFSZwClDR6+cXdW6fxsSMeq7kM9rp+NVdf8Wg
 xR3nADpSWSBSvIYjqsKX/dBX4WQx9XTWuP3XKarunZw5n/AWaXtVgWg7U2dvl/4RehTby5bT51w
 ij0eZL7TJFk21X3E=
X-Received: by 2002:adf:e78c:: with SMTP id n12mr36100293wrm.83.1637578057152; 
 Mon, 22 Nov 2021 02:47:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXI8JKaFu67ehYD4xLVUXXis+2jbOGETIDlz39xolTTiAIKUrwfAhwfgia+lCastW2X/e2fg==
X-Received: by 2002:adf:e78c:: with SMTP id n12mr36100261wrm.83.1637578056934; 
 Mon, 22 Nov 2021 02:47:36 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id a1sm10422187wri.89.2021.11.22.02.47.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 02:47:36 -0800 (PST)
Message-ID: <303fb332-a321-044d-cfec-a4866584a48c@redhat.com>
Date: Mon, 22 Nov 2021 11:47:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 1/2] docs: Drop deprecated 'props' from object-add
To: "Rao, Lei" <lei.rao@intel.com>, armbru@redhat.com, chen.zhang@intel.com,
 zhang.zhanghailiang@huawei.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, berto@igalia.com, eblake@redhat.com,
 vsementsov@virtuozzo.com
References: <1637567387-28250-1-git-send-email-lei.rao@intel.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <1637567387-28250-1-git-send-email-lei.rao@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/11/2021 08.49, Rao, Lei wrote:
> From: "Rao, Lei" <lei.rao@intel.com>
> 
> In commit 5024340745 "qapi/qom: Drop deprecated 'props' from
> object-add" (v6.0.0), we also should update documents.
> 
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> ---
>   docs/COLO-FT.txt        | 16 ++++++++--------
>   docs/system/authz.rst   | 26 ++++++++++----------------
>   docs/throttle.txt       |  8 +++-----
>   docs/tools/qemu-nbd.rst |  2 +-
>   4 files changed, 22 insertions(+), 30 deletions(-)

Thansk! FYI, I'm currently assembling a pull request for documentation 
updates and will add you both patches there.

  Thomas


