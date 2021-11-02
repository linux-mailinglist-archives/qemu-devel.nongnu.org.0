Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C588C442EEC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:13:29 +0100 (CET)
Received: from localhost ([::1]:40232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtbU-0008IB-FS
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mhtD4-0002JS-Jc
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:48:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mhtD2-0002AA-6g
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:48:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635857290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MNmeECBMWibP/5q1aebloRJs0aujpkPjHPAX+avhCC4=;
 b=iB4A6zqvY/aGO5uCKI4zcBXWq2hxqg7tfdF0jER5IM2kc5ChzZXxg+eEQxkGjap+juyQuT
 R/FB+qEMDkZRmkymSksEcdYfHZ7sesd+EnlW5DQdcFMHDQdB1pPxffBVL/PALwGaLLNU9O
 66wLjiNRX6AhPZC1oKqXkXmZ9CR5ci0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-3wmDfbluNgmWa75MwZK3eg-1; Tue, 02 Nov 2021 08:48:08 -0400
X-MC-Unique: 3wmDfbluNgmWa75MwZK3eg-1
Received: by mail-wm1-f69.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so1082469wmc.7
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 05:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MNmeECBMWibP/5q1aebloRJs0aujpkPjHPAX+avhCC4=;
 b=z0gvGvmEsmc+pAkFgZrE/+Z9BRc78pyx5ltGhhvL/6O0fZBI6u2ew/KDD/8CokembI
 o48bSPwLt4Acmx/jWyhP6UmwFeVY15p2bJGuXpxQnBL83pq0KqTcT2swXFOxh/SsoZGv
 oZhizM9MJCBefzhKQEwqAe4Yy6kU8ojTEmBdvkUG/mXp0pW+AeyEL9CrSj+b1DLdr1a2
 o6wFKF6FdjoiEzKXAbDit/x5lIIcDd2YUt5aK+pL97RNdGNo+ShyWqhOxGkUUU0rDEve
 RkP6ZY6CmP1AseryOcZvC1v86ZvHCanXzwzZ8JEfBQ+vvyCfm9gfDD4/J2cBw7QJIs35
 lDSg==
X-Gm-Message-State: AOAM532uQKDxCcy8N7DX4G3Ver5J7Bn/6leN7ZITCIs6CYTQh3AYLGV1
 H1VAx40A7IVrQVQ5VXNRDqxz1YX60dqnJiMoSc0L2nSo/dqQliUBDlJFBQukftL5XlPyti6YtJ6
 U30pjOGiz9DPJh94=
X-Received: by 2002:a05:6000:1868:: with SMTP id
 d8mr10425576wri.285.1635857287633; 
 Tue, 02 Nov 2021 05:48:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQXXCkkWcTub32aAYeu2+nUL6dP3MGomk2Hawi3JkvmODFeZLmbSaehg1zcB0A1dVDs4PAhw==
X-Received: by 2002:a05:6000:1868:: with SMTP id
 d8mr10425543wri.285.1635857287467; 
 Tue, 02 Nov 2021 05:48:07 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id t9sm11826173wrx.72.2021.11.02.05.48.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 05:48:07 -0700 (PDT)
Message-ID: <2cfa2b7d-feaf-b9c3-db61-2bbe49a84fe0@redhat.com>
Date: Tue, 2 Nov 2021 13:48:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 2/4] qemu-img: make --block-size optional for compare
 --stat
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211028102441.1878668-1-vsementsov@virtuozzo.com>
 <20211028102441.1878668-3-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211028102441.1878668-3-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 nsoffer@redhat.com, nikita.lapshin@virtuozzo.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.10.21 12:24, Vladimir Sementsov-Ogievskiy wrote:
> Let's detect block-size automatically if not specified by user:
>
>   If both files define cluster-size, use minimum to be more precise.
>   If both files don't specify cluster-size, use default of 64K
>   If only one file specify cluster-size, just use it.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   docs/tools/qemu-img.rst |  7 +++-
>   qemu-img.c              | 71 +++++++++++++++++++++++++++++++++++++----
>   qemu-img-cmds.hx        |  4 +--
>   3 files changed, 72 insertions(+), 10 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


