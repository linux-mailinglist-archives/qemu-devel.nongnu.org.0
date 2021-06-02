Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4889398E16
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 17:14:48 +0200 (CEST)
Received: from localhost ([::1]:38082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loSZz-0005HN-Nz
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 11:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1loSYl-0004bI-Lz
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 11:13:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1loSYi-0005HZ-S9
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 11:13:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622646808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PM1iy2fVSGiyD0CyvbqPEGY5batkpIvsi23l1C2Yc00=;
 b=ZHzUoTY3ibWE2qrnCJ4pNJe+NtNe7Lq+IVBOv6K8A1NPA6kUOrSC1lvN7M5FMxPWdoUL2l
 ZN97kTaZ21C2gwQ1i63/1Elt4xmOJ723NDdsdk2RODgmlIZto43xqpR+e/nT/FkWmrueEK
 PauxWFPCwoAenURMmmLXe7g/gwirrBg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-_XQaKG47OGWo-8oEkOr2oA-1; Wed, 02 Jun 2021 11:13:26 -0400
X-MC-Unique: _XQaKG47OGWo-8oEkOr2oA-1
Received: by mail-ej1-f71.google.com with SMTP id
 dp16-20020a170906c150b02903f1e4e947c9so783616ejc.16
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 08:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PM1iy2fVSGiyD0CyvbqPEGY5batkpIvsi23l1C2Yc00=;
 b=VE9xe93RDGbFOY4kUh/KAxIF2pBOxcnzNlpnLMAU7/xzVpiM9xLi+lCjefWoNspxVi
 7KyOvUNBipACysgWD2fYyg5m1WfBbfStCQ1/FFTzFSP0WFH+XwwsMwAKzJn7qaiSG2aD
 x4TqsCdDkltRd4mgI1JGS2r/yG5DVTln37jp7hQ1KaMQwNzxxcXpnbNtpUr4+8eb8Q+r
 mAHadIIBJK8eZlLehy26kSv6WiLEkUir7WEbGAM0xG3YsxRz0DdqEgsIeEuxvAkT+SVL
 IYTchMn6l/DG/Ougmq55vJjdqa+c6QLXC3Sn+M//uzQn3eZLyXKkneRsfU5Cnw77dx7W
 wftg==
X-Gm-Message-State: AOAM532fvzlPElxL9tEdnc1/4HSiVQcZEJy5fU9UxwI99Ra9p2b5MR7a
 fUUel8sXGad88y1N95iLpEdUWyFZzfU06yfDfDhikgzJGrIPu1e1q33f60GvQ6Zez+15oc9YRwj
 AS8x70KTVY0xSAkdeqc8+qj2DkLmzAafAxVfEqIrBkFx3SRZK4jojdJumOQxaNuC0
X-Received: by 2002:a17:906:6bc7:: with SMTP id
 t7mr22017848ejs.267.1622646804871; 
 Wed, 02 Jun 2021 08:13:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuFO37euaS0Zl2b9w4yEA3dEmRt/yCIH++p28ODuoZkzvafLqVXA9+qfaNuaW5S6hYT3oTWw==
X-Received: by 2002:a17:906:6bc7:: with SMTP id
 t7mr22017802ejs.267.1622646804521; 
 Wed, 02 Jun 2021 08:13:24 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id i15sm164635ejk.30.2021.06.02.08.13.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 08:13:23 -0700 (PDT)
Subject: Re: [PATCH] s390x/kvm: remove unused gs handling
To: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>
References: <20210602125050.492500-1-cohuck@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3f802b37-ae09-37d0-ec5d-2c7820f07c87@redhat.com>
Date: Wed, 2 Jun 2021 17:13:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602125050.492500-1-cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/21 2:50 PM, Cornelia Huck wrote:
> With commit 0280b3eb7c05 ("s390x/kvm: use cpu model for gscb on
> compat machines"), we removed any calls to kvm_s390_get_gs()
> in favour of a different mechanism.
> 
> Let's remove the unused kvm_s390_get_gs(), and with it the now
> unneeded cap_gs as well.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  target/s390x/kvm-stub.c  |  5 -----
>  target/s390x/kvm.c       | 10 +---------
>  target/s390x/kvm_s390x.h |  1 -
>  3 files changed, 1 insertion(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


