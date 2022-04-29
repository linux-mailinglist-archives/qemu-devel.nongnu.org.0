Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4BB514C73
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 16:11:04 +0200 (CEST)
Received: from localhost ([::1]:47276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkRKp-0002uM-Aw
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 10:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nkRJC-0001br-AR
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:09:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nkRJ9-00039g-Tc
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:09:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651241358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HtBXDxr6pbtKNZ95bu2UAtUewlHMXzNWYR06bBJ0pME=;
 b=RJpPvXulgtxRG2biFuXyrwdm+QpV14lkE8D8xnpRGSjBwgyOegDlq//HagjjLTS4JQ86OR
 s84+I1eE7ZN197eMBTrT6P0JNqpJ7CL8SKRcFx4+MTXGktjTU9q6iDy5qQa9QqsMa8D+DK
 Hay3tyjUumH/wBz8+Prk86XIe1OKRcc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-QNMfNNCQN5CMhjGEj8z5lA-1; Fri, 29 Apr 2022 10:09:15 -0400
X-MC-Unique: QNMfNNCQN5CMhjGEj8z5lA-1
Received: by mail-qk1-f200.google.com with SMTP id
 u129-20020a372e87000000b0069f8a79378eso5334805qkh.5
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 07:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HtBXDxr6pbtKNZ95bu2UAtUewlHMXzNWYR06bBJ0pME=;
 b=vUmPrW4BJrY7Vii6IW/YD32ynSsmYDgvrApyRJOyMsJjEsRQFDKZph9MTlu+fR9aMV
 xUM4FGeoMrsM707Rb+KThIZCl6FVPeIKXmPY+fJvf6ERtg/tpn2KmOEo8boHBNoFvAAu
 XWO/s+ipu/fm4UVkVpnqdYf4c5E0/ye/aT8qyK79fN7sIC6eg5liyfwfV7iZ2Mx00tjl
 3ZN9WSQLjOnvBGnK2buYnSglYliPdl4ClnrUMlX3ywwXXzNbd0NEVfbypNmBBVPwEsyW
 lGmP5ZzsoR7Hl3afpQmSn4rxF+515ZHPhRN9Q5W3CVYIICREf14R09TPtln/RHzba6Lb
 VYnQ==
X-Gm-Message-State: AOAM530Oq/I713aMcLySrdrUb/R3YRLP5VHFnZiwLxjUPmsCcdhwZiNG
 vzaBD6aZmiisQB7njylk17czQtSmOo7rI2XTa0/9zgdT53awGiq/AXb85MJ0h8xP8OI7fY8aBYE
 BMuuTAR83IDSBTiw=
X-Received: by 2002:a05:620a:1403:b0:69f:bb69:5a7e with SMTP id
 d3-20020a05620a140300b0069fbb695a7emr858317qkj.589.1651241354538; 
 Fri, 29 Apr 2022 07:09:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzEWEiGAmtpoPtZWfKOiofCnkJisOyCDwUUp/9tHF5PgRZzZhItSRUg0i2yFV0qvEmaIrUJA==
X-Received: by 2002:a05:620a:1403:b0:69f:bb69:5a7e with SMTP id
 d3-20020a05620a140300b0069fbb695a7emr858299qkj.589.1651241354332; 
 Fri, 29 Apr 2022 07:09:14 -0700 (PDT)
Received: from localhost ([191.181.58.94]) by smtp.gmail.com with ESMTPSA id
 o19-20020a05622a009300b002f20511d9f4sm1935042qtw.6.2022.04.29.07.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 07:09:13 -0700 (PDT)
Date: Fri, 29 Apr 2022 11:09:12 -0300
From: Beraldo Leal <bleal@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [qemu.qmp PATCH 12/12] update VERSION to 0.0.0a1
Message-ID: <20220429140912.vwrnx4szkh4qgpce@laptop.redhat>
References: <20220422184940.1763958-1-jsnow@redhat.com>
 <20220422184940.1763958-13-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422184940.1763958-13-jsnow@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kashyap Chamarthy <kchamart@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 22, 2022 at 02:49:40PM -0400, John Snow wrote:
> qemu.qmp will be independently versioned, without regard to QEMU
> version. While the repo is being established here, set the version to
> something impossibly low.
> 
> Later, I intend to introduce automatic versioning based on git
> tags. While the repo is being established it's going to be
> easier to have a static version while we get bootstrapped.
> 
> (Note: PyPI already has a 0.0.0a0 version which I uploaded without prior
> review to aid in developing and testing this series. This version, and
> all 0.0.0 pre-release versions, will be buried after the first "real"
> release, expected to be 0.0.1.)
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  VERSION | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/VERSION b/VERSION
> index c19f3b8..7741e1a 100644
> --- a/VERSION
> +++ b/VERSION
> @@ -1 +1 @@
> -0.6.1.0a1
> +0.0.0a1
> -- 
> 2.34.1
> 

Makes sense,

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


