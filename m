Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC0C49DE47
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 10:42:56 +0100 (CET)
Received: from localhost ([::1]:45196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD1Is-0004Mk-LR
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 04:42:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD1GW-0002bX-Ny
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:40:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD1GO-0000jq-QZ
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:40:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643276419;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=0AcRmYzpWJ3OHOkC993L1MUCnMPirU8kmcjZrsKPGOQ=;
 b=XoN3BiYAWUxKrkvIzaPmeLSSJJbsszXn+9RuiCB3JAaSNiLeRRwUbwWPR2Y2Sm8Er9DHN9
 xVSv+/mJncwHiX/Rf67g2o7qUqiO+G8fFD74oT78L1YcE0/Q4mvrQxoq1+XycqLozdDIHx
 a7j8MTLJBGE3xqJONbPpbbPSUOro3TY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-ioiUyj_3PWuFQ-UGkFmJ3w-1; Thu, 27 Jan 2022 04:40:17 -0500
X-MC-Unique: ioiUyj_3PWuFQ-UGkFmJ3w-1
Received: by mail-wm1-f69.google.com with SMTP id
 c16-20020a1c9a10000000b0034dd409329eso1240723wme.3
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 01:40:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=0AcRmYzpWJ3OHOkC993L1MUCnMPirU8kmcjZrsKPGOQ=;
 b=oEdnqyiGpbrhkbIh6DUToiNNhXSAsGdqvRJxizzqLEqPYluuPPzy6tKcMvYBqlWvfl
 CihcKNLMW9vewNzKcogyJdoO05+d+iWhx6/w6lRgwrmN2uTJPcxk2g46/kemdcOeKc2u
 1HR76YE8TLczFe35XqOVNguuwGiWF2JgDvdBtox8f0nQkvxAd6y4rxS9z5LDVtAXAYYs
 HWlPhL/lS4cvm9tcGd7GjqLd1ByaOo1tZo8mCMqZxiqifKqkRa7+o9/KHyQ1fxov30rt
 Pdmc6/KmJRYJCo1OKDx8tEF+xWxXzle5Cp945cioR+JqKrIKJsmErxa6oNMdsW3jnCax
 IYRQ==
X-Gm-Message-State: AOAM532tfZ60XvgXhKIfbWcQz8gq3lhxNwaw0ymBu9CJF90y3aAy8gOL
 c7p3kl1FhhCY5/CuhTCt2f0d5F/E8T3ueY1BMGXIIvDUhAnjZnZfNl7uKJ4XNnWIZpcjItoMFRw
 sMcESZNnuAhWIb88=
X-Received: by 2002:adf:f302:: with SMTP id i2mr2358180wro.114.1643276416676; 
 Thu, 27 Jan 2022 01:40:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgqYetCo9Pm/lx1dO/e6gjzhCXozopDmV68PAwWlro9CZFmnrWAeKc+/8TYsbm5zuBJpY98w==
X-Received: by 2002:adf:f302:: with SMTP id i2mr2358163wro.114.1643276416495; 
 Thu, 27 Jan 2022 01:40:16 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id u3sm1771081wrs.55.2022.01.27.01.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 01:40:16 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 01/15] migration: No off-by-one for pss->page update
 in host page size
In-Reply-To: <20220119080929.39485-2-peterx@redhat.com> (Peter Xu's message of
 "Wed, 19 Jan 2022 16:09:15 +0800")
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-2-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 27 Jan 2022 10:40:15 +0100
Message-ID: <87zgnhldog.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: quintela@redhat.com
Cc: Kunkun Jiang <jiangkunkun@huawei.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Keqian Zhu <zhukeqian1@huawei.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> wrote:
> We used to do off-by-one fixup for pss->page when finished one host huge page
> transfer.  That seems to be unnecesary at all.  Drop it.
>
> Cc: Keqian Zhu <zhukeqian1@huawei.com>
> Cc: Kunkun Jiang <jiangkunkun@huawei.com>
> Cc: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>


Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


