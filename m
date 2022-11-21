Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7356328FD
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 17:08:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox9L1-0008Bw-S9; Mon, 21 Nov 2022 11:08:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ox9Kz-0008BA-LP
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:08:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ox9Kx-0005tW-6c
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:08:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669046878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jfUWvxwZ8p7qrB65C96GiJ6xaMEVygQ44NTI7Wm8bSU=;
 b=FceXke6p3i3s7Ott+u08XnJxuGMvQ1I+huzUtTc1jy5Vi6zu5U+FN2Kgv9XIyyrdO28lf8
 A6MRGRtP2Qf1pKEHRhA2cnI9ZT5rCqUuriOa15bJL7g+VnbdnPqDwniUTTbWLO7Q5Dsbj0
 ntKsvHBgxcgNOVdYlqKK7PFKYOP+Pqk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-583-mFBo3eCGNemre9Lx-QC9KQ-1; Mon, 21 Nov 2022 11:07:56 -0500
X-MC-Unique: mFBo3eCGNemre9Lx-QC9KQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 az40-20020a05600c602800b003cfa26c40easo6485136wmb.1
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 08:07:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jfUWvxwZ8p7qrB65C96GiJ6xaMEVygQ44NTI7Wm8bSU=;
 b=M7ORntPd/+cFwEArFyw4iQLjCZPTvPs76MbZVAjp745pW5M2GqfrwN2VzPaH15SK+M
 QYOCJkL4n9ZUu+g0kcMJcU9y2CraNrvzJy4DKf2lYjjbhrt1Ca082JUuHJGRfRz1mEc7
 jGjurEiEj8am4kDr8r3f5LUt73QiAu2IwHhGJk6baOqU1jdKpELb6XCo2D5d4nED68qe
 JPR9IgbMo+wZbaULubraItcoDyAFFM/tNu49z08L3Y2SPGc0VjyvBXG1EySbEcw6JqVb
 Is6PcPRIglZFPj0MkOHiT1J5DlE4tiYPKf9LYKjgypmk/oru/V4QXFTrlo4bPClEMGp2
 S7pQ==
X-Gm-Message-State: ANoB5plv6smAFP8q1RKjcFpRvmsj+rdFgYVtywTUE7t9Lu2qevmuHJy5
 VRAbEPm/c/Qwlis81uJZ+/J8ERsU+DnhKBrgcOko4GrVo1fRKGB5I6m44rb2wC+MluiSpjfNfEZ
 9z5J6U0t/SsD7/kg=
X-Received: by 2002:a05:600c:792:b0:3cf:6a83:bd19 with SMTP id
 z18-20020a05600c079200b003cf6a83bd19mr6337414wmo.29.1669046875607; 
 Mon, 21 Nov 2022 08:07:55 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Q91C2jai2EP8vs3cpsEvL8p8jcHI6ph4+xiidMUX0K8RBVwMosFpgkbDj2dnFbDLTVEqUYA==
X-Received: by 2002:a05:600c:792:b0:3cf:6a83:bd19 with SMTP id
 z18-20020a05600c079200b003cf6a83bd19mr6337398wmo.29.1669046875407; 
 Mon, 21 Nov 2022 08:07:55 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c0a0b00b003c6f1732f65sm20976321wmp.38.2022.11.21.08.07.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 08:07:54 -0800 (PST)
Message-ID: <70941035-2d82-4697-950c-cc26f5df6639@redhat.com>
Date: Mon, 21 Nov 2022 17:07:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 07/11] block/vmdk: add missing coroutine_fn annotations
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20221116122241.2856527-1-eesposit@redhat.com>
 <20221116122241.2856527-8-eesposit@redhat.com> <Y3ug5AlK0+h6c1tu@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Y3ug5AlK0+h6c1tu@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 21/11/2022 um 17:01 schrieb Kevin Wolf:
> Am 16.11.2022 um 13:22 hat Emanuele Giuseppe Esposito geschrieben:
>> These functions end up calling bdrv_create() implemented as generated_co_wrapper
>> functions.
>> In addition, they also happen to be always called in coroutine context,
>> meaning all callers are coroutine_fn.
>> This means that the g_c_w function will enter the qemu_in_coroutine()
>> case and eventually suspend (or in other words call qemu_coroutine_yield()).
>> Therefore we need to mark such functions coroutine_fn too.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> Just one remark about patch ordering: This doesn't require the
> g_c_w_simple patches, so wouldn't it make more sense to move the
> g_c_w_simple right before the first patch that actually makes use of
> them?

I thought about it, but then I thought it was too far from bdrv_create
patches.
Both g_c_w_simple and this patch are needed by bdrv_create_file, so I
thought if you read this one first then you wouldn't have a clue on what
is the end goal.

Anyways, I'll change the order.

Thank you,
Emanuele

> 
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> 


