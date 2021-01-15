Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EED2F2F8451
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 19:26:57 +0100 (CET)
Received: from localhost ([::1]:46332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0ToH-00064s-1e
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 13:26:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l0TmD-000553-Ms
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 13:24:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l0TmB-0007Zb-7h
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 13:24:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610735086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oeeLTWCWiYoI3df1KP4oGuiBoQ3xRT7iMHvTMxQ5hTM=;
 b=T0M3piqIWQDs5jXZ4p3XLNKBqmxjtFyIzCE5VDPZ01iB7FDwUSZHwg1H6Jp92895pZtSaP
 ed/d359GX0Hh5rSdaFmcvXPiq1FLjbAVL+zKtuSFpYXUWX+x1wKL3GdRw+xVLjyYD7SRX+
 blx7eMDdZ1XG6rsuLpvUzdx7aMC2GiI=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-qZlXymbUOlWv4g-Q8V7OqQ-1; Fri, 15 Jan 2021 13:24:43 -0500
X-MC-Unique: qZlXymbUOlWv4g-Q8V7OqQ-1
Received: by mail-vk1-f199.google.com with SMTP id h21so4491694vke.22
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 10:24:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oeeLTWCWiYoI3df1KP4oGuiBoQ3xRT7iMHvTMxQ5hTM=;
 b=engDaUBBDH7CF0KNnBwcVV3RhMVYhKdUO7Y68YOfjCjjWQK+MLZhSNjEnE2iZ6M5gH
 cd/joofJdpq6Lsi5+FWRfRiD5VJrGXHBXWvH2d81TTZXzKD25xpMXRyD/zpJzh1mYnMN
 pH3UFCyBGB8q1t0LCpkOi2uJ4bUbGVii6GMhauiqU8tenRVO8YssdPbLOiXL/rw7F8hA
 +eI0va5q+iTISLZc/vKiqn67B+ZJeUJfdn3dDtolFF19HsRMlOWbx1YRHgHc2XZK8xry
 X1brBqZ+LU/Gl6EdMsMCCF4f4uirY7knEsyALb0OvBeKksCvixUeRJbvYMfdJxKKqIg3
 ExCw==
X-Gm-Message-State: AOAM5329w+ONBjmn5eZSrnknBRrPtRn8sm7rWAnpdChVsLmokSuBzFDB
 QuzH/9JoMDcqMOKnlEJp9pK+5fbPQ47JsIbse824LFV4WY8QuECVC7BloVVSQ5mc8E6b+PDy7co
 SALHyeSWuLN1lkNLtsM9Y1QUAUNjD92c=
X-Received: by 2002:a1f:9301:: with SMTP id v1mr11918758vkd.7.1610735083057;
 Fri, 15 Jan 2021 10:24:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBXzbowffsBPEZI+4BCOUUNlLlKkOruIRINHagff1If+Tnpr//4HYU1lB7dqOa6ozeoOJAEYUnDnVgcSRqNFA=
X-Received: by 2002:a1f:9301:: with SMTP id v1mr11918739vkd.7.1610735082846;
 Fri, 15 Jan 2021 10:24:42 -0800 (PST)
MIME-Version: 1.0
References: <20210115174315.30949-1-mreitz@redhat.com>
 <20210115174315.30949-11-mreitz@redhat.com>
In-Reply-To: <20210115174315.30949-11-mreitz@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 15 Jan 2021 15:24:16 -0300
Message-ID: <CAKJDGDaqyMST1TSgr_roOqL6x9jEepqF75FhD7O+mCNcRKoySQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/10] iotests/300: Clean up pylint and mypy complaints
To: Max Reitz <mreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 2:43 PM Max Reitz <mreitz@redhat.com> wrote:
>
> And consequentially drop it from 297's skip list.
>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/297 |  2 +-
>  tests/qemu-iotests/300 | 18 +++++++++++++++---
>  2 files changed, 16 insertions(+), 4 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


