Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6CC4176E9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 16:36:22 +0200 (CEST)
Received: from localhost ([::1]:55092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTmJJ-0002ii-A5
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 10:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mTmGP-0000eb-DN
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 10:33:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mTmGL-0006cf-4E
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 10:33:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632493995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I0Lxbx24slguq5ksAgDPOr+Z+Qh1DDu8PYVpHNU05qU=;
 b=fdK5PJH3SYIwzZZlhIfQsJylxeXeFWnvCa2woHBJkAHGLqBr5RQZcKDTCFvlTGsJJ9k0jy
 E5znC0WSUIs5DeZU4o0iwbLebGxwEd8ofBtlif8PH018WCvJJAbuQThhp2c89VO8ldIYQo
 +Tamu5yBcfe70K1AB7VyAr9a6iwvVyU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-iotKMSR1NYuWPpLx7XNY6w-1; Fri, 24 Sep 2021 10:33:13 -0400
X-MC-Unique: iotKMSR1NYuWPpLx7XNY6w-1
Received: by mail-wr1-f71.google.com with SMTP id
 e1-20020adfa741000000b0015e424fdd01so8257874wrd.11
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 07:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=I0Lxbx24slguq5ksAgDPOr+Z+Qh1DDu8PYVpHNU05qU=;
 b=piLG6i5HIexSirWr3lSii48FzjnuH4oeoBYov8gZb0XnZ1snZWxaaa7nyKDPSaqxxN
 O1P90Fgu2CoehbsxyUrGef2N1tx+TKq4MqbPakS37ZSLzAd3I4lqRbknFV/d0KG7oCHX
 ZELzhlr0OeS5rSgnXizZlrvzOjg88VEbEfteFhEoysKqXZuziAHdmiQBT46jCia0IX+T
 LV1DdrYiUom62ZTGoV1GYunUKqY4ZUvbkqIoUwsKGgGZIQSqG58+Mtlk8McWB7DnOjIi
 edQFa4jmGYhE6oj2eZ0eCcLfMq6lFASTZfR/kmLKm3Yo/iDLDb17HZTZJ5AbXvyycDpv
 ZqCg==
X-Gm-Message-State: AOAM531U5npRq6cTHOyceEQvjQVhn6Sp1zmTs5tFJg8u0t18c/BmHiFN
 UUpxS7gxl6TBBvvM74b3vrnTxUZJYz8N9eq9+M8Gu0c4Ehow5jPaUhy+SALaLx48jxJ3EfOsB+C
 CbsbToV5Ygic0S54=
X-Received: by 2002:a05:600c:4b87:: with SMTP id
 e7mr2480488wmp.108.1632493992749; 
 Fri, 24 Sep 2021 07:33:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznFVpb8+aQOcT4s+hNH5BJhmq5wM5fVsizQEMtvWBnsapFQKQ0akBOeelDjO/O+d/aEnzeNQ==
X-Received: by 2002:a05:600c:4b87:: with SMTP id
 e7mr2480466wmp.108.1632493992539; 
 Fri, 24 Sep 2021 07:33:12 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id x21sm12471409wmc.14.2021.09.24.07.33.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 07:33:12 -0700 (PDT)
Message-ID: <91ba09c0-cc96-e588-1af9-5142759a7361@redhat.com>
Date: Fri, 24 Sep 2021 16:33:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 0/5] Reduce load on ppc target maintainers
To: David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20210924095536.441849-1-david@gibson.dropbear.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210924095536.441849-1-david@gibson.dropbear.id.au>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, dbarboza@redhat.com, aik@ozlabs.ru,
 mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hervé email is invalid, so forwarding only the cover to him,
the series is available here:
https://lore.kernel.org/qemu-devel/20210924095536.441849-1-david@gibson.dropbear.id.au/

On 9/24/21 11:55, David Gibson wrote:
> Greg Kurz and myself have been co-maintainers for the ppc and ppc64
> targets for some time now.  However, both our day job responsibilities
> and interests are leading us towards other areas, so we have less time
> to devote to this any more.
> 
> Therefore, here's a bunch of updates to MAINTAINERS, intended to
> reduce the load on us.  Mostly this is marking fairly obscure
> platforms as orphaned (if someone wants to take over maintainership,
> let me know ASAP).  Bigger changes may be coming, but we haven't
> decided exactly what that's going to look like yet.
> 
> Changes since v1:
>   * Reworked how OpenPIC is listed
> 
> David Gibson (5):
>    MAINTAINERS: Orphan obscure ppc platforms
>    MAINTAINERS: Remove David & Greg as reviewers for a number of boards
>    MAINTAINERS: Remove David & Greg as reviewers/co-maintainers of
>      powernv
>    MAINTAINERS: Add information for OpenPIC
>    MAINTAINERS: Demote sPAPR from "Supported" to "Maintained"
> 
>   MAINTAINERS | 42 ++++++++++++++----------------------------
>   1 file changed, 14 insertions(+), 28 deletions(-)
> 


