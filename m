Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D5945B5FE
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 08:54:55 +0100 (CET)
Received: from localhost ([::1]:44820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpn7G-0006Iu-SE
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 02:54:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpmp8-0003HC-KI
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:36:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpmp7-0008MJ-5j
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:36:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637739368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GKPuxNqa1wJlnINQD34bWZJogj2B6zXNsyNLD2jhE/Y=;
 b=dF5Qa5c/uwrvrqVt09bZT1gghQekj02G2vP7fJ7HwsnLE4ggnMaqZLef5c25s7XptV0Kwr
 iVdwclwr4FBABULnNhKG8sDrR7MG/Ed+mkToCYxDIDBREuhAq5t/kuKcjbkpiF3ihaQh+O
 eJawAetDq7bdP/vpv3L1Xaam3Nufmtw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-295-XWA_fBOGN_q2Tr9UsfOmmg-1; Wed, 24 Nov 2021 02:36:05 -0500
X-MC-Unique: XWA_fBOGN_q2Tr9UsfOmmg-1
Received: by mail-wm1-f72.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso954856wms.1
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 23:36:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GKPuxNqa1wJlnINQD34bWZJogj2B6zXNsyNLD2jhE/Y=;
 b=lz5ZZ+eDnrpTLVAB0NZwbnzVGqqBAqSYMZtH8SEosF0Poq8yL/miGwAmowcVvJYTgz
 0XMlDSA4ZNe341KRbevhzRNRm8/iSMRIlkLeC3dr0kO4O6AjkZhCRCV0WG+mmBIJTAIA
 RRege5LrR2kDG7f18GrSLfXt6UHPbxtwBKT+DoJ/hjNCLw6biD/dh/y9fcwNiZNb6RpZ
 Z/ZpK2a8XCFCBz2JXqS1DlLhOG2i4LsVK9Tlhi5fBaEvheVDOtTNVhbkmu2dkpKX8cW4
 vxdFc7+IGkENYRonpKfeEoZjS2v+KSAARJ6yXa50MotFI1HwY43NDIBjWJc8AKXG8oK+
 uNrg==
X-Gm-Message-State: AOAM532pZaiS+xDr6Hu4Cjhwf40GI5l8r/2AlHpQ4jM2WiiA9tEte+XQ
 QSzDWlUlsTjEjCNh8Xr59xrQaZdUkJKUeNIKZrWjDSxan8IOZQ8aL4KurmInNtHe4WN3MHcCdct
 0n3JSsfnfyk9PHiY=
X-Received: by 2002:a5d:4b82:: with SMTP id b2mr15911157wrt.419.1637739364159; 
 Tue, 23 Nov 2021 23:36:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLNHbBkOnvhoNOZTePI0hCa8CiKPAbo1Otd7iXZGI++lcLOQESuBBllTnT2i/RWNkZ94astg==
X-Received: by 2002:a5d:4b82:: with SMTP id b2mr15911120wrt.419.1637739363955; 
 Tue, 23 Nov 2021 23:36:03 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u14sm14414405wrt.49.2021.11.23.23.36.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 23:36:03 -0800 (PST)
Message-ID: <0b1f54a0-cee9-9a3c-f568-93c6518ab4f9@redhat.com>
Date: Wed, 24 Nov 2021 08:36:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/4] include/sysemu/blockdev.h: rename if_name in
 block_if_name
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211124063640.3118897-1-eesposit@redhat.com>
 <20211124063640.3118897-3-eesposit@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211124063640.3118897-3-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 07:36, Emanuele Giuseppe Esposito wrote:
> In preparation to next patch, where we export it to be used
> also in softmmu/vlc.c

"vl.c"? :)

> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  blockdev.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


