Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F294096CE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 17:11:41 +0200 (CEST)
Received: from localhost ([::1]:54570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPncS-0006ok-6u
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 11:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPnaT-0005bB-3r
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:09:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPnaR-0005Fy-L5
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:09:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631545774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Nwb7Vn2MAaQQHsAVbGWg9Uw7OGdEqr8Fa40ExfZKGc=;
 b=bbiOpON3KzrZOCVJYssXfCNvm/86Sap996aJF6X/7BGvYKipPvDatleCMYRMeMQ67TefNw
 BB426E2ZngWrmsoax1zE3KeDg1r4gAyhJVNW5qssogrHujTDCyTeUMt0lzZS29BmR2AAaS
 GYAy4vNpwAaQdgUMXyL3ZAgNp0u1xds=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-7Sk2WvxNMLy2HUBwM_iFOQ-1; Mon, 13 Sep 2021 11:09:33 -0400
X-MC-Unique: 7Sk2WvxNMLy2HUBwM_iFOQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 j21-20020a05600c1c1500b00300f1679e4dso3716323wms.4
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 08:09:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/Nwb7Vn2MAaQQHsAVbGWg9Uw7OGdEqr8Fa40ExfZKGc=;
 b=6butEc/4J+KlRTsMO7HPela7hdp4ea+aJjz6M1ilOD6595XO3tpJPGvdecUmh1q205
 7UkWk3i3eRdAKuGd5TC9swv4DsFLBkDqJUC2zc0bt/s4GR2+J6Pb4pY8TpAW+teEsm1m
 a9H7bnZV/41+QR6RirSj+/nbfKp4RhRT/yEWTZdLsR8vNLQea9yGmRZsyfLqyUkB41aL
 fJomqQeFRelhKrT/R/HIfp9E1t/wKWjP1NGmwS3KKaaEK1QqbmSMF5w4Euo4juc8L21e
 PTtecJFClWJElmof6Vg1E73eVkP0F/jUeKpEM2ygBh/xwSCbg+a/AhrzwekH03tgQRks
 CgzQ==
X-Gm-Message-State: AOAM531fyOpd7ux/aw8mdNz6rVDouPGw7WReddoEkoVF63bFMxCCEMWH
 Nwrc1Iuw3l4v/6ZhIr3OQunGyI4I38R06gb6QsFn6B1S//bDGkw9GcOpE/ELzVmMO39uwqiouZ9
 PNF6QP5GYIHxERyg=
X-Received: by 2002:a05:6000:343:: with SMTP id
 e3mr12874062wre.96.1631545772590; 
 Mon, 13 Sep 2021 08:09:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn8mkI5Z3coEbWno0pRxD7RRMzfegMGOSHtalWq3nQvyeDn4sEZWXH8cpXUZTXc/dxw5YHag==
X-Received: by 2002:a05:6000:343:: with SMTP id
 e3mr12874030wre.96.1631545772422; 
 Mon, 13 Sep 2021 08:09:32 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id r25sm8398106wrc.26.2021.09.13.08.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 08:09:32 -0700 (PDT)
Subject: Re: [PATCH v3 01/10] qcow2-refcount: improve style of
 check_refcounts_l2()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210524142031.142109-1-vsementsov@virtuozzo.com>
 <20210524142031.142109-2-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <1f16cbac-68f3-cb71-d941-751849925e6b@redhat.com>
Date: Mon, 13 Sep 2021 17:09:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210524142031.142109-2-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, berto@igalia.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, ktkhai@virtuozzo.com, den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.05.21 16:20, Vladimir Sementsov-Ogievskiy wrote:
>   - don't use same name for size in bytes and in entries
>   - use g_autofree for l2_table
>   - add whitespace
>   - fix block comment style
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>   block/qcow2-refcount.c | 47 +++++++++++++++++++++---------------------
>   1 file changed, 24 insertions(+), 23 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


