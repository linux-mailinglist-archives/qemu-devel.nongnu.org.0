Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30578439842
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 16:13:44 +0200 (CEST)
Received: from localhost ([::1]:42418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf0jP-0005hb-9M
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 10:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mf0go-0003Dx-Gd
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:11:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mf0gl-0000bs-SC
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:11:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635171059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nR8+BJbUg9ImSBITyWtn3/LY+8SjnAH0hF0ElPVyfiw=;
 b=ZRIln4zkAoN4jnoMlHujMmLpjhNtU3MBlYekp0ShXzRD5WWR/Entoect5GYMyet9FJIiSf
 amKCH/JqvLuvMGF9gLYNfa1uapwewdicB87eYa8Gea/Ql8l/lJDLqJeugeZ7xzmfnk9wwh
 KXBxmznslOReXuaOxNLc9VX3KW3hcCQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-RhJqE7PwMuiESIzwYeJjDw-1; Mon, 25 Oct 2021 10:10:57 -0400
X-MC-Unique: RhJqE7PwMuiESIzwYeJjDw-1
Received: by mail-wm1-f72.google.com with SMTP id
 b197-20020a1c1bce000000b0032ca040eb40so3225971wmb.7
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 07:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nR8+BJbUg9ImSBITyWtn3/LY+8SjnAH0hF0ElPVyfiw=;
 b=gyUKaSCve2i3DHIJS6t3TyS7OcabuE26xvanN0lJ40d5ECr49GZ8zI+VDC2NqSpxac
 8M6uwhdREAkOSnaZ3HdbnvwMrJEpPcH8f8nH/F2VxcVgJlPHOwXSsuSJkO0JZbdG4RKH
 3BhpC0ePvLX6dtLWhXHxH5aSQPCyavxn40Sb32cG6POLkLZeswCM7UOF2egdhreAXeG/
 Z2H64KD8uEqE+pUXMKl01ZgRr+wmwK/sVK0aCiz2dgYmpcLdHtCUi4CFgUagLqoSPOi8
 a/BHau/rlSoHTfetYSLaYTSM0rybHSXfXGYLiORUW5JQzWSYiETyJ8zY0PbZsK2QOMUK
 gm1A==
X-Gm-Message-State: AOAM533p6NoewUOJ0fhhO2XYJhv7+ySeF1gkBQ84h86Ybpc+bCch76WF
 ddQk8d9Bt6cGe4bkcRCVYl/xgC+Tq6Cn2pfopBHt3Vs4ZS1SJwZaVfG8/9BXLmNlOzxu7OBKX1r
 KvVO6lQC3GBBRhmw=
X-Received: by 2002:a05:600c:24d:: with SMTP id
 13mr8910384wmj.150.1635171055733; 
 Mon, 25 Oct 2021 07:10:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzU03ZeMkOMm0w3KxlWRomoWTkMHWJv4pkwNML4aSpoDE/i+BmowIHrpEGqSOXPMVY7WlwZIA==
X-Received: by 2002:a05:600c:24d:: with SMTP id
 13mr8910348wmj.150.1635171055445; 
 Mon, 25 Oct 2021 07:10:55 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u10sm13093060wrm.34.2021.10.25.07.10.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 07:10:54 -0700 (PDT)
Message-ID: <23cec6d8-0625-cf7c-59ff-f42c91143345@redhat.com>
Date: Mon, 25 Oct 2021 16:10:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 23/25] block-backend-common.h: split function pointers
 in BlockDevOps
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-24-eesposit@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211025101735.2060852-24-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 12:17, Emanuele Giuseppe Esposito wrote:
> Assertions in the callers of the funciton pointrs are already
> added by previous patches.

Typo "function pointers".

> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/sysemu/block-backend-common.h | 28 ++++++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


