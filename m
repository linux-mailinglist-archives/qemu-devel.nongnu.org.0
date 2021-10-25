Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 278D34395EB
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 14:17:33 +0200 (CEST)
Received: from localhost ([::1]:54124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meyux-00079S-Tw
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 08:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1meypi-0004QW-AL
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:12:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1meypg-0008Bp-A3
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:12:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635163923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GagKtegaz6INHo3iLscucGiGZDaOm6CRHD2zyp9Hvcs=;
 b=cT2YbdkVKpkdG4L1WQZQLRKaYS+DRCQ3P+qv60Vpk3MyayP8VW8s1O5xQgFDLFmX3/3E3n
 gssvH0Ybin2fVL8WuuL3secmn8XFPMxHwIdGHJ2J2lOkr0DjKxqVo1aCLHjtmV6xyOvEd9
 yvLyRNdHVxhHtNuOkq678B+OLy72GlI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-s_xQ0EucP_SP1TEYPkSqyg-1; Mon, 25 Oct 2021 08:10:54 -0400
X-MC-Unique: s_xQ0EucP_SP1TEYPkSqyg-1
Received: by mail-wm1-f72.google.com with SMTP id
 b79-20020a1c1b52000000b0032328337393so42104wmb.1
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 05:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GagKtegaz6INHo3iLscucGiGZDaOm6CRHD2zyp9Hvcs=;
 b=GR+LDaZHd6y+fcmsDfCKQ6R/9lsNC7TWCHWseUktCsNVo3ZlWRv3abWAjnhA3GUReX
 OZ3XtUZfgsh7M4Mud402ypxruQKr0D8peXdFZkDelvlxGgArmVojxtlGe60I2pPQIEs5
 RyJz/grNE8QaHcMHCKZ/KGFgm8cRHVImh9VEfWPVdVSErVsk8vnhm0TpJE9dLaFsUAS7
 tAMzOs0muHNeiqaAx2qCOnh6DyMs7+4dkrw2ybaYZiner0hvvwcJvCas2bBU0MOhsP/O
 FpQ9YInOzvMzXQ+kw+t7ljv8kRVN0hPUAsJ/NbCdRC76HFlnHEN0vS++H/HyU4iW5ipZ
 MCQA==
X-Gm-Message-State: AOAM530xRu3RjiJ+miZJhRYM2Lm0wMvdG1v5yP4grS1OMfGn0YqSfGZW
 k7AZqD9zjkcs+dbc5Kfu5+MNhohpxlne5kHCrDl/OP+MkfVJ3/ItmV4RwVhgrNbRsZSuSwzeTwZ
 RQYefKBHckbw7E10=
X-Received: by 2002:adf:ec0f:: with SMTP id x15mr20005016wrn.186.1635163853325; 
 Mon, 25 Oct 2021 05:10:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4aJCDqJ51uHrohUSq04/PmuMW8ZHo0b6srHhTlYVKDfA97M0vTnaAxmF0/8P01YYjnDtG0Q==
X-Received: by 2002:adf:ec0f:: with SMTP id x15mr20004977wrn.186.1635163853067; 
 Mon, 25 Oct 2021 05:10:53 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id o26sm18892585wmc.17.2021.10.25.05.10.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 05:10:52 -0700 (PDT)
Message-ID: <225f15d0-a0e2-12c0-6214-c0488f99fbbe@redhat.com>
Date: Mon, 25 Oct 2021 14:10:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 6/8] iotests/300: avoid abnormal shutdown race condition
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211013215748.2154908-1-jsnow@redhat.com>
 <20211013215748.2154908-7-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211013215748.2154908-7-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.10.21 23:57, John Snow wrote:
> Wait for the destination VM to close itself instead of racing to shut it
> down first, which produces different error log messages from AQMP
> depending on precisely when we tried to shut it down.
>
> (For example: We may try to issue 'quit' immediately prior to the target
> VM closing its QMP socket, which will cause an ECONNRESET error to be
> logged. Waiting for the VM to exit itself avoids the race on shutdown
> behavior.)
>
> Reported-by: Hanna Reitz <hreitz@redhat.com>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/300 | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


