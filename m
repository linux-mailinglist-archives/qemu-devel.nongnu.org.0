Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCC32DD242
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 14:38:28 +0100 (CET)
Received: from localhost ([::1]:57648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kptUB-0007WA-Kp
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 08:38:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kptSR-0006T6-Lk
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:36:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kptSQ-0004mo-3E
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:36:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608212197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4+aqINEqiJyUp8tFB6rbBzZqPe4pOajgHu37gutC6Ew=;
 b=A4tpGVoY2Er5U6x1OJRPPJr6mUb/FaK/qafOXKWtXHLrNxeuVQZvNw/AOi5RY8sjZZ4XoO
 Rvaeps4IxBoSAJi0j8v0ylM4pfR+tjbMiwd9C+5ZQ2MAnXZPWScCTHUO6cicMcd6qvjOX3
 CMlU14u0XMaVspF465bK4qgtXVdb7wg=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-fsj3KQ5YOEiU22FNRZrT0g-1; Thu, 17 Dec 2020 08:36:35 -0500
X-MC-Unique: fsj3KQ5YOEiU22FNRZrT0g-1
Received: by mail-vs1-f69.google.com with SMTP id x6so8278166vso.17
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 05:36:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4+aqINEqiJyUp8tFB6rbBzZqPe4pOajgHu37gutC6Ew=;
 b=IvACMAI6i96NamC0n00gfz+uazv3Cl+K0w4PBGDZaAxth6vihQOYbX9BQ+iea28isl
 bWfk+/se65ThY/VmAAssXQUsBtOqRFZx3QL+lVkmjj50lnMdsDAorO7sz+jZWbC3sT4e
 y+BGrdhL7Js8hIYYC1F6i4Tj/3otWN0HS5oLau+QHmuXB1Mr2RF9bA1/fbsQmURSOaHt
 Hu+7QnFX1JM+SgUj0UVTgVwAq330BV9jucLj4we306gegTtazIUcyUpQZa/nI/mTCy7F
 K7PbFmcgphDfGedveguXjjpnUbOTzAWTbZe2pQtX3Fys1bTzi0MBE8Wne5zMeLXlzfMs
 dasw==
X-Gm-Message-State: AOAM532jPOSkNSBzWiZopzJJs7Uw6Tpzz09i9GEsGXivAQM7qsamyFy6
 IZ3cZTdZd1oN9KV0nE91JVc0kALGB7cl4CnAkYjh04wqTeVkWIG7FOVYI681RlOc/xHUFL2Nt/m
 j7XvpVdoXmJXw737yqr802LGa4yehxlY=
X-Received: by 2002:a9f:2886:: with SMTP id d6mr5047563uad.113.1608212195350; 
 Thu, 17 Dec 2020 05:36:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZ5BT5Cjm/CrQOkNiIfizsB8tio+gFkK5Ovwn2hspiphYcT8xr1wr7xpm9mubdn7bk2a7VyU0Drw5VJxA2YPA=
X-Received: by 2002:a9f:2886:: with SMTP id d6mr5047542uad.113.1608212195156; 
 Thu, 17 Dec 2020 05:36:35 -0800 (PST)
MIME-Version: 1.0
References: <20201211183827.915232-1-wainersm@redhat.com>
 <20201211183827.915232-4-wainersm@redhat.com>
In-Reply-To: <20201211183827.915232-4-wainersm@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 17 Dec 2020 10:36:24 -0300
Message-ID: <CAKJDGDYAp+FML_fjJYR5zcPsxhtbG+Ajv_zQMNokiZB+dMv-tg@mail.gmail.com>
Subject: Re: [PATCH 3/3] gitlab-ci: Archive logs of acceptance tests
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Philippe Mathieu Daude <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa Junior <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 11, 2020 at 3:38 PM Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
> Keep the logs of acceptance tests for two days on GitLab. If you want
> to make it available for more time, click on the 'Keep' button on
> the Job page at web UI.
>
> By default GitLab will archive artifacts only if the job succeed.
> Instead let's keep it on both success and failure, so it gives the
> opportunity to the developer/maintainer to check the error logs
> as well as to the logs of CANCEL tests (not shown on the job logs).
>
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  .gitlab-ci.yml | 4 ++++
>  1 file changed, 4 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


