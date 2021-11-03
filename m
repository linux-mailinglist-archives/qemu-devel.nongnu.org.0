Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BA94444A0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:24:55 +0100 (CET)
Received: from localhost ([::1]:44646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miI8E-0002do-WC
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miHqC-00068R-RV
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:06:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miHqA-0002k8-Gb
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:06:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635951973;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8brPr2qWVOnbmaatxMdjYyy1ZRoi+GVTvI796ftkhvY=;
 b=i4lZM+bna89hebZtNyMQVoumC6JEs/1FCsue46vdqBtwHsBNLD1sZvGz5lvhG//JLU6k2n
 Bt8Cdh9aly++8Thj4o49jX+olb3ulEYoKmRllRIRWS/hB0x4qQM/he5D1NADJoLYDtY94q
 okpn8WL/9wxeqT64yfwfgMpfrOlkrMs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-mekbv5pwNbSLKnnLcLzxgg-1; Wed, 03 Nov 2021 11:06:12 -0400
X-MC-Unique: mekbv5pwNbSLKnnLcLzxgg-1
Received: by mail-wm1-f70.google.com with SMTP id
 g11-20020a1c200b000000b003320d092d08so1174083wmg.9
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=8brPr2qWVOnbmaatxMdjYyy1ZRoi+GVTvI796ftkhvY=;
 b=MOSwgJljrxzBj+SswFzPtjBCopKjXDP4lzUyVejEDbPxIjNOZbrWREF7CSutbD0LfB
 sC0gsDFqiEhRmnEmVLIYKmeCEffi2nBOezLpgRyAK6n0MzTCV1pJ23xopVS5SzlUoP6t
 IH9LFq176c4LGq+6G6+hRDdoSO9L2aTY1VoqT0Za5D34QzpwjR5BRKs1kXWovm/Opkkf
 BfHMDA386Vw3hVsGO2mQrTmQmgenYnQm1oM9rYlq5EHJm82WDxp7vaQpN+lF/9FZRm+/
 N7n7obDQq5Uaa4zUN+KfxYlqIocIOIAtk6WyTYJfC8HjnOdBvgOivPs2q2cCsnHdy3So
 O7AQ==
X-Gm-Message-State: AOAM531X1G54D0+a1iu8V/7UvMkDpeoxJGmDKUZ3hAFmhtzJq3Vo7/o0
 uZhy6XN5Z9+tw3e37PV2LFtm3r41uDVb2sAnIp3PTiQgPv3M5FCl/tykQLyNy7dEy8Pla4EWaod
 wzEN18rbkz66LrR84VaUYE8yBai4PEKOGJAf+xUsLYi46s6wOdwau/NJy/qsiRH21ghk=
X-Received: by 2002:a5d:6085:: with SMTP id w5mr48952002wrt.122.1635951971284; 
 Wed, 03 Nov 2021 08:06:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyi0empZsjPrULEk8Zlalvm2l7TVl1+QO+jFTELZdUgwtvkmn9xX2kWEkqAmMJr1nYZx6z5KQ==
X-Received: by 2002:a5d:6085:: with SMTP id w5mr48951954wrt.122.1635951971010; 
 Wed, 03 Nov 2021 08:06:11 -0700 (PDT)
Received: from localhost ([47.60.53.191])
 by smtp.gmail.com with ESMTPSA id 6sm2174603wma.48.2021.11.03.08.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:06:10 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PULL 11/11] Optimized the function of fill_connection_key.
In-Reply-To: <20211103084605.20027-12-quintela@redhat.com> (Juan Quintela's
 message of "Wed, 3 Nov 2021 09:46:05 +0100")
References: <20211103084605.20027-1-quintela@redhat.com>
 <20211103084605.20027-12-quintela@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 03 Nov 2021 16:06:08 +0100
Message-ID: <87cznhi8in.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zhang Chen <chen.zhang@intel.com>, "Rao, Lei" <lei.rao@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Juan Quintela <quintela@redhat.com> wrote:
> From: "Rao, Lei" <lei.rao@intel.com>
>
> Remove some unnecessary code to improve the performance of
> the filter-rewriter module.
>
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> Reviewed-by: Zhang Chen <chen.zhang@intel.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Signed-off-by: Juan Quintela <quintela@trasno.org>

Hi Jason

This was an easy colo patch that I didn't realize that this was for
networking.  So I put in the pull request without noticing that it
should have gone through your tree.

Should I resend the pull request without this patch, or it is ok with
you.

Later, Juan.

PD.  thanks to Dave Gilbert to point me my error.


