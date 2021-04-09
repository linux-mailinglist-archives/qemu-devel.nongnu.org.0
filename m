Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58492359BF1
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 12:25:49 +0200 (CEST)
Received: from localhost ([::1]:54218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUoKi-0004hE-DH
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 06:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lUoIg-0003Wx-5H
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 06:23:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lUoIe-0006Ay-I6
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 06:23:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617963819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cQZPWKv8cj1+GHtCO8W67t9nUpfHeYiRkdu3y9iT3G8=;
 b=HVCqzgDAb/jLa/CXnAxexm1hXaIIKYValgnpFue6e+syQYdKpZPM3Ilsi9adPCuHniu0Os
 7TYbtMOAczrXi+Frp/nhRr5uBl7RK8EU4U4Unv3RKhPZ8IDhlxGns/OM6BTaqs/aE3o43a
 A2un43h9YaD5YIvK5MR/2ycKezYv/gA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-rNUoyZG2Pg6qesieCBl0DA-1; Fri, 09 Apr 2021 06:23:36 -0400
X-MC-Unique: rNUoyZG2Pg6qesieCBl0DA-1
Received: by mail-ed1-f72.google.com with SMTP id h5so2443656edf.17
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 03:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cQZPWKv8cj1+GHtCO8W67t9nUpfHeYiRkdu3y9iT3G8=;
 b=aVA26hjIno/P6IUQ44WdPvlR9fHwsip0v5RDo8sbEZjMPc/B8k+4RvuxEqw9FG6eu1
 vWlzZJQJS4pkriepbFblgGvVv9DMGgAgSLY8UxuE8KHVfhhAcBKnJSA5doJSZv2o3dY3
 +fM1g8WROEIvnx1zmaJRBmCVxeW5Lng7G7EvXgh6YcMtlIAxlEkVwsXmJcaAsEbx7kVr
 4DZq9umxI+6X2UJLPRLItS5q+XDXcvYjSJyWqRSvsSPRDVfw9ITDN5HlrC/e9GRa1Q8t
 Fn+e4S8M2PamS37MqXYOYNzecDhqiA6P8QiHA0cemd1l6BfnykdC3kuc65mMRZV0zuZB
 FJ4A==
X-Gm-Message-State: AOAM530/ScOIcWIBS/QdNj0qrmXKKT5wVndk82agE14K+4XpPFweXeMO
 wRHajkcvSqbH191/HZ+XkYw1KBkiAXPjgoxV0tl162WuQP9+iwITDHunt/Wvl95Uin/ysqNk3OB
 BZxGx/0YS3z3VgfE=
X-Received: by 2002:a05:6402:4395:: with SMTP id
 o21mr16486777edc.22.1617963814068; 
 Fri, 09 Apr 2021 03:23:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztRTv4BSQ5YFDGFrsRilhzPO9AlUKZ0qDhgQ2b6QkWJVSVKDYbkEwPse6myJVSsIySJ9UG4g==
X-Received: by 2002:a05:6402:4395:: with SMTP id
 o21mr16486760edc.22.1617963813919; 
 Fri, 09 Apr 2021 03:23:33 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id e5sm1149405edr.64.2021.04.09.03.23.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 03:23:33 -0700 (PDT)
Subject: Re: [PATCH] virtiofsd: Fix side-effect in assert()
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20210409100627.451573-1-groug@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3f3b6729-4380-40a2-4349-a235422e4535@redhat.com>
Date: Fri, 9 Apr 2021 12:23:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210409100627.451573-1-groug@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: virtio-fs@redhat.com, misono.tomohiro@jp.fujitsu.com,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/9/21 12:06 PM, Greg Kurz wrote:
> It is bad practice to put an expression with a side-effect in
> assert() because the side-effect won't happen if the code is
> compiled with -DNDEBUG.
> 
> Use an intermediate variable. Consolidate this in an macro to
> have proper line numbers when the assertion is hit.
> 
> virtiofsd: ../../tools/virtiofsd/passthrough_ll.c:2797: lo_getxattr:
>  Assertion `fchdir_res == 0' failed.
> Aborted
> 
>   2796          /* fchdir should not fail here */
> =>2797          FCHDIR_NOFAIL(lo->proc_self_fd);
>   2798          ret = getxattr(procname, name, value, size);
>   2799          FCHDIR_NOFAIL(lo->root.fd);
> 
> Fixes: bdfd66788349 ("virtiofsd: Fix xattr operations")
> Cc: misono.tomohiro@jp.fujitsu.com
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  tools/virtiofsd/passthrough_ll.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


