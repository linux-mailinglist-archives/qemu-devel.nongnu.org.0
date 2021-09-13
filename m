Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC2C408A0C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 13:22:16 +0200 (CEST)
Received: from localhost ([::1]:38760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPk2R-0005iO-Rz
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 07:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPk0A-0004lu-Ux
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:19:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPk09-0003qG-Kl
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:19:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631531993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XvbaNSsWyJ+rGdTRcV4dUpaQEqpMEjcVlMfiTCNE6+4=;
 b=BlG78PJ709+JbKxCqbOQaLvvA1VWxp9U9yhrP3S4L9AA60NLTDBDjGUQGELSFC+5fUT93V
 PKRavcRtrE/QIgu0FGrmsMgOioU5xTLkNWUq4n4oelzqtDwbnQZAKI50iuzMjkg2nbUNML
 DoMGEc3MBMZerGV92/ayVwKoGvtP49w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-ek-urVC0M7mfgcSdw-8RYA-1; Mon, 13 Sep 2021 07:19:49 -0400
X-MC-Unique: ek-urVC0M7mfgcSdw-8RYA-1
Received: by mail-wr1-f70.google.com with SMTP id
 u2-20020adfdd42000000b001579f5d6779so2547934wrm.8
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=XvbaNSsWyJ+rGdTRcV4dUpaQEqpMEjcVlMfiTCNE6+4=;
 b=ErOcA7cU3W4R6wULON1TMQT5u0Ii4jcVBLF7g2BQRhsgRmADAH7/Jze8Hj22XhDjXf
 zjHW5xgLq+lKtAkctvOJ0hi39B/iD/usPfevW2PFPtlFw6r6tURclvYuSMRf5s4DImh2
 risqJbzzAjf0/fatSJkEBEK1RWWp8m9I4ivBEnuxS3MZ7UGR6SDoCz4aSICx/ePVJadM
 maxWIvug4R4u+bqufI1/8rBSOgKkG80vbbNf7z6E5lq6KTzcLX3tBZzWsIeV8L7ax1K5
 e+siDl0ov9AjHe7I85kNeEUkzIFFgvo0bmPGONXXyZNTCTWz/2sJFbeArinbTBQeJBeH
 N8cQ==
X-Gm-Message-State: AOAM5303443Fx+MuuhNJ6kSq8aDUhqRGp/41BcdUWtkWkWZa2fZ96GZN
 i9EKyyXCd2c5Uv6+rg3QIaFVn9DxyQjx9C18OdEO0AzwZ8x75ce+NixyK9fwvFa5J442DFIpHT/
 rdLgCMLHYg2bx37I=
X-Received: by 2002:a7b:c8c3:: with SMTP id f3mr10753178wml.30.1631531988601; 
 Mon, 13 Sep 2021 04:19:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBFzwbiAT4i1svFWmsQEhbC2KERtoU7TxAAWDmtn5GVl2c6rMVvH/zbQabJRUDZjZ7RJEl/Q==
X-Received: by 2002:a7b:c8c3:: with SMTP id f3mr10753168wml.30.1631531988483; 
 Mon, 13 Sep 2021 04:19:48 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id t18sm6852192wrp.97.2021.09.13.04.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 04:19:48 -0700 (PDT)
Subject: Re: [PATCH v2 06/17] iotest 065: explicit compression type
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210720113832.586428-1-vsementsov@virtuozzo.com>
 <20210720113832.586428-7-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <2d914520-a590-89e6-e200-de0f18e5b951@redhat.com>
Date: Mon, 13 Sep 2021 13:19:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720113832.586428-7-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.07.21 13:38, Vladimir Sementsov-Ogievskiy wrote:
> The test checks different options. It of course fails if set
> IMGOPTS='compression_type=zstd'. So, let's be explicit in what
> compression type we want and independent of IMGOPTS. Test both existing
> compression types.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/065 | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


