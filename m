Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0297E5665FD
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 11:23:06 +0200 (CEST)
Received: from localhost ([::1]:47184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8elt-00082k-4G
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 05:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8ekg-0007ER-CC
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 05:21:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8eke-0003NL-AX
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 05:21:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657012907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AsjX85RDFlo+uKMzQ+VRyhrCx44GT5/TzvkEPBCi/mE=;
 b=eZWB0zcn381rflHlNQC7o+at7l1lGCyc0ChZlpS6w6lLLCgY4ixrKCRHF5TBSwtqNg84Uy
 CZZ8mkOgaRQovzBB4zZeExUr0tAm4DhIOLjSc8O7hAxZgX+0s9s5BJIAimCxE0+PFwJfaA
 mCoKdRBNxzhcY6BhMWaM1CDCRiR6K7o=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-fl0fxmSUO3u5oNBQKpin5w-1; Tue, 05 Jul 2022 05:21:45 -0400
X-MC-Unique: fl0fxmSUO3u5oNBQKpin5w-1
Received: by mail-ed1-f69.google.com with SMTP id
 c20-20020a05640227d400b004369cf00c6bso9002961ede.22
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 02:21:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AsjX85RDFlo+uKMzQ+VRyhrCx44GT5/TzvkEPBCi/mE=;
 b=flNa1hXcGZ3tDLbczkw7rU/0Y1fAldjhdJeYJhfIYRhWERvlP38tn2BYOzBK5JFrYI
 2wNzA/4J15Fh6H5dQQJhQXSpCoz6eW37d/jPdYx3rSVPoPJ1Kk2eJmTcoJFz6BbUIPrF
 NlE8w/5uK2ieDYZE2+Qn682Crr20eI3Lc1QKGpeCzxUq0M/AuL8jJjiJFx5EQWLoej95
 19xJPGD/tQl4oRR5knV8Ofsk5g/f7jJYvsf2zpwUJTjXtw0HDIIykZvfcFfKtLaCfHBN
 MyehB4jCMhBUftNXcXSFepdn/86hsqhM3+/HZfDf33mdeRTVok8ADxqE/+ijbDgu6uGn
 XgdQ==
X-Gm-Message-State: AJIora/+5jTW27r0I0Mlm6Ef+Y5JuoDHzmy6FZqWNAxkTEU/PWmhavXN
 lcF1U2TpNgPszTZe8L/sOUYdwBVwmwAL2dUDDxrDs/qqhFYUnqJX7/R/OVE5SHceT+aUH2UgmWd
 YwME0nsaiq3lol44=
X-Received: by 2002:a17:907:6e89:b0:726:e16a:c851 with SMTP id
 sh9-20020a1709076e8900b00726e16ac851mr31700285ejc.507.1657012904733; 
 Tue, 05 Jul 2022 02:21:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ttuHGdb3cCZahjMdiIyTiiZ0kc0C26QOiGoop49r3aJjhUIze3UGdJM+1xyWJ2XsmuIUWc0A==
X-Received: by 2002:a17:907:6e89:b0:726:e16a:c851 with SMTP id
 sh9-20020a1709076e8900b00726e16ac851mr31700273ejc.507.1657012904523; 
 Tue, 05 Jul 2022 02:21:44 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a056402038f00b0043a67dbbb4csm3584377edv.83.2022.07.05.02.21.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 02:21:44 -0700 (PDT)
Message-ID: <da48bbe2-4146-fdc8-71e1-2c55dbbee7b1@redhat.com>
Date: Tue, 5 Jul 2022 11:21:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 18/18] block: Remove remaining unused symbols in
 coroutines.h
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113907.200001-7-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220517113907.200001-7-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.05.22 13:39, Alberto Faria wrote:
> Some can be made static, others are unused generated_co_wrappers.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block/block-backend.c |  6 +++---
>   block/coroutines.h    | 19 -------------------
>   2 files changed, 3 insertions(+), 22 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


