Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBDF4AFDCF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 20:57:38 +0100 (CET)
Received: from localhost ([::1]:33000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHt5r-0000Jw-K3
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 14:57:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nHsrg-00076J-47
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 14:42:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nHsre-0005gc-KL
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 14:42:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644435774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ex2rJ0l54VnOb2wZUotjZidi+eyYcGhxKpyM5bKJCVQ=;
 b=X72LdpJ4CH7KfDW9mPkLGg6Y5ThCJC++4LRfanSa6E0xfSSdAkbZf8s7/o0mVA+4CEXWt9
 9K1NZW1ShMDo+s8lfVYQ7gBwqfn7lCzua8vTVaLkmXDszNBME+iK254xp/K3l66JBd6dUG
 1CytgD8FxJkcDvvHg1nwSfZEZehq+HY=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42--mU3why5N66L3-g1vRugzA-1; Wed, 09 Feb 2022 14:42:53 -0500
X-MC-Unique: -mU3why5N66L3-g1vRugzA-1
Received: by mail-vk1-f197.google.com with SMTP id
 w192-20020a1f30c9000000b0032c4ff280f7so242786vkw.12
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 11:42:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ex2rJ0l54VnOb2wZUotjZidi+eyYcGhxKpyM5bKJCVQ=;
 b=wJwSZx+9wkNQeeTflBlw1z5dz5FbDdrycfpYMpgXtJZeoEWHnUWJ3UMfNrJSPhmPhG
 SI7Tz34/Fldj/xJ1rnLAO2iQpgXMqiLL9RQkh4RnUvVhoKE6szvJpws9J9iEnxeAk1G2
 fw5+g3qBY9d1jHbg8MZ+jPyekb0y/tVxg+R45BJU28U1suLYoPIbSOxGCIVgyV130ngi
 on77CGYGOnqOqs4PknFA9gGJ5Il9mzE9vx5gL7G1K6qqZ1Yx0vRwTu87G1XrmB4/6cbC
 zIKwzOsi1gNU0n0iH0++RMo6FthW5YzYxpO2AU70t4cL6204yiTdIEvsLRyDvthOz/Rb
 EkOA==
X-Gm-Message-State: AOAM532q/K8330U8wRnQfuoDwJz5sv4agelSKz11YdwXb0x+NXT/mCoU
 QLe8w5feJK2i5H1fpTeTuXzb/jsIg9OtgPeqlb9A+kOjihiiWH5KtCgW9BuD24iGxXiHpDeulfe
 2GsvnuIiB9Ftq3b70eOrmQE67pTYVt+U=
X-Received: by 2002:a1f:e745:: with SMTP id e66mr1452363vkh.24.1644435772419; 
 Wed, 09 Feb 2022 11:42:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKGRouqJyzgRCh0e0Ke6EW89iEzp4BDRUhthG3HRGyhQWO7eJ1ijQwsMMqlc8dNHShl/M12pO6gf1yjvG3AWw=
X-Received: by 2002:a1f:e745:: with SMTP id e66mr1452357vkh.24.1644435772208; 
 Wed, 09 Feb 2022 11:42:52 -0800 (PST)
MIME-Version: 1.0
References: <20220204221804.2047468-1-jsnow@redhat.com>
In-Reply-To: <20220204221804.2047468-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 9 Feb 2022 14:42:41 -0500
Message-ID: <CAFn=p-b3ZGWWUBZq_s7wdHS4pQy+=Lx5NS4uu0jiXELzAjMAsw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Python: setuptools v60+ workaround
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 4, 2022 at 5:18 PM John Snow <jsnow@redhat.com> wrote:
>
> Long story short: Python 3.7/3.8 on Fedora with setuptools v60.0.0+
> together create a bug that ultimately causes pylint to fail. See the
> first commit message for more detail.
>
> I sent out a hotfix two weeks ago to fix this behavior on our CI, but
> there's a better workaround. This adds the better workaround and reverts
> the hotfix.
>
> John Snow (2):
>   Python: add setuptools v60.0 workaround
>   Revert "python: pin setuptools below v60.0.0"
>
>  python/Makefile                | 2 --
>  python/setup.cfg               | 1 -
>  python/tests/iotests-pylint.sh | 3 ++-
>  python/tests/pylint.sh         | 3 ++-
>  4 files changed, 4 insertions(+), 5 deletions(-)
>
> --
> 2.34.1
>

Assuming no news is good news. I'm staging this to my Python branch,
and intend to send a PR after I get an ACK on '[PATCH 0/4] iotests:
finalize switch to async QMP' -- so there's time to veto this if you
have concerns.

--js


