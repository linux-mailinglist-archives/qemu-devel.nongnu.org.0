Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BE12F8483
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 19:33:26 +0100 (CET)
Received: from localhost ([::1]:56554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0TuX-00025G-8M
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 13:33:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l0TrQ-0000te-9w
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 13:30:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l0TrI-0000p0-82
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 13:30:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610735402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oG3bTY/7NWP7HRzLCeIVzyhSAsxI02eXyQfCyWIAkwE=;
 b=D9ITDse9SzCQQeiHbjrJekJ4n548N0A134mUGkVDASqgT69QY6PX6pADRCKQdd4ZD0ZDQf
 GAgLmL67Geb3/9OyS3+e33K8WMe80tlAylw0fckUeuG3+0C1bfZzMuHR9oc/94LJp/DU6t
 khgsOjT8Qo83uWCY6nJMQSxJYT7VB5c=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-NIAf96svOoeIG7NeIDfm8g-1; Fri, 15 Jan 2021 13:30:00 -0500
X-MC-Unique: NIAf96svOoeIG7NeIDfm8g-1
Received: by mail-vs1-f70.google.com with SMTP id x4so1828330vsq.16
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 10:30:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oG3bTY/7NWP7HRzLCeIVzyhSAsxI02eXyQfCyWIAkwE=;
 b=CcWiaSiloPjprd75jKzLeRaS164RgavQgZeYhOHrOidd+Sh6D22txwtbNutovYMman
 aiy+hIADPuSPyY4kYYCOlVcZgSVFO6sTwNpWEjmMfLQqUnWLZHAEygxWqi+3snJHMyRP
 WocrtI2ll8a/LWQoc5RAgoRJ55M3efvWg/TxgEbb0Bw5L3BOqSIv6Sq3jferPrDGy8uG
 QMnwNbNpzyjsmGsc+dSM42sxPYlzdfVFxCpg70xCgO5BUAsp/dsKnaj8wHVOY59bJzr1
 zXdmYL6Q9TQ0qCN0pN0LMzdy/onXPfbr179gY0i+jADSlGNwG/+XGpP7wvVrfvYkiiy/
 Olng==
X-Gm-Message-State: AOAM532gH3HN/iu9qT8vvC7DSIcVqfmY7YCgkN35xUzd+tjsGV2a+/8I
 G4dS2vURZuV5vsUzfgKsTEPPP1Ld/Mx5F7f7is9fAmJgsUTHrbnLm7p/Z/nGuccnoYH5HAzdU3p
 d9PNAvYFqIWdKA0YPm+U7X79kwyxbng4=
X-Received: by 2002:a1f:8d92:: with SMTP id p140mr11767071vkd.19.1610735400385; 
 Fri, 15 Jan 2021 10:30:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7E+fasxCGCM1UD08UzXaAKj0KbqeD5cU5GOsKKFH8576AxP2EyLD0wRm958eCTyxF3Fv/O+Vq0f1stmRPWJo=
X-Received: by 2002:a1f:8d92:: with SMTP id p140mr11767053vkd.19.1610735400227; 
 Fri, 15 Jan 2021 10:30:00 -0800 (PST)
MIME-Version: 1.0
References: <20210115174315.30949-1-mreitz@redhat.com>
 <20210115174315.30949-6-mreitz@redhat.com>
In-Reply-To: <20210115174315.30949-6-mreitz@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 15 Jan 2021 15:29:34 -0300
Message-ID: <CAKJDGDaZFJ3ofKPAVf4d+=LyzogF05Lr78xfwAhTUM8Ur+a_iA@mail.gmail.com>
Subject: Re: [PATCH v4 05/10] iotests/129: Do not check @busy
To: Max Reitz <mreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 2:43 PM Max Reitz <mreitz@redhat.com> wrote:
>
> @busy is false when the job is paused, which happens all the time
> because that is how jobs yield (e.g. for mirror at least since commit
> 565ac01f8d3).
>
> Back when 129 was added (2015), perhaps there was no better way of
> checking whether the job was still actually running.  Now we have the
> @status field (as of 58b295ba52c, i.e. 2018), which can give us exactly
> that information.
>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/129 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


