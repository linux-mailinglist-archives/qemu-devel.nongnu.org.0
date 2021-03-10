Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FD4333D44
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 14:06:08 +0100 (CET)
Received: from localhost ([::1]:43394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJyXP-0003tP-9p
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 08:06:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lJyWO-0003N2-DU
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 08:05:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lJyWL-0001oX-Nm
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 08:05:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615381500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HDhYvrzjMa95RNqzrSuxKZCYg7yOomNx9i6ZIAM46SE=;
 b=CuuehnWrc3YrILvUUQGNhnntC0mjonqYLyhQrkcfXKVZUfgJ7Vk0uLPUqr5NWRpEvQlBVf
 vg5/a7zYbcr/Q3GI9ZKov/+YDc3wlcwi7lRBoKVTQnqUIWvlcvZY2uIOP8B2I8cclq/st6
 JbxxrcB6/H48qEdUTw5NmkoTCbRANxc=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-82c4ZgCrPVuN5N0l5HbXQw-1; Wed, 10 Mar 2021 08:04:56 -0500
X-MC-Unique: 82c4ZgCrPVuN5N0l5HbXQw-1
Received: by mail-vk1-f200.google.com with SMTP id q20so3412413vkb.3
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 05:04:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HDhYvrzjMa95RNqzrSuxKZCYg7yOomNx9i6ZIAM46SE=;
 b=laNkJw/RccTK95hwFPCm4J3gq0BZzcPSoh4LzkYjzcaWKVFAOpO5KVTEZjFcmEHInW
 spfVfyIpyEgSgviqer28n2GbdSX9AdMRoubHiAeP1AvsiY6s7C+Xz827RaZah+CJybLv
 42dzCbHQGvn699s7S8MGS2jVxlgM4G8z7ZXu5JYGjm7mQO8Ix7W6o0BD33T4Q87dHsEB
 F4AqfCLlNQcyB+69zFdncEaHTF/9CKxxnlEoK7SXpDZ6ZubhBisQUvkP+Ydmh6Ewo8n2
 YSL0Rb8ovTor4XDnCXAGo8BnPjWxpUoFL35V6KSK2Uh5Xt5tJs7Qg4Td27tsGEtHiOeO
 IZxg==
X-Gm-Message-State: AOAM531Nr/rKEjzXOg9podM9VCUqOUZokimNQDkau//bJldbYPt7+8D6
 Bd/SMNh83jIaeEhAL5yxDazYKDRd6+hxTIoOrnmskYS5vHU773LjglVgcmo1Tcw8TEF0QmtDhsM
 h45hI/1rCmT/89phvPQzVsjiSv/ep9s8=
X-Received: by 2002:a67:c80e:: with SMTP id u14mr1275422vsk.39.1615381496201; 
 Wed, 10 Mar 2021 05:04:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6ljUwTOglQJH81LcQWG9kHZusb4jQoA8ZWNzfd461jISG3NJAUh1m0rNPBH06P75LYD3qQOaarI+HUEmfeBQ=
X-Received: by 2002:a67:c80e:: with SMTP id u14mr1275398vsk.39.1615381496001; 
 Wed, 10 Mar 2021 05:04:56 -0800 (PST)
MIME-Version: 1.0
References: <20210309112356.737266-1-thuth@redhat.com>
In-Reply-To: <20210309112356.737266-1-thuth@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 10 Mar 2021 10:04:30 -0300
Message-ID: <CAKJDGDZrGZVKYgjRfM24XC5vKc=a-miEU93iUqPo9OSQVazZzA@mail.gmail.com>
Subject: Re: [PATCH v3] MAINTAINERS: Merge the Gitlab-CI section into the
 generic CI section
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 9, 2021 at 8:24 AM Thomas Huth <thuth@redhat.com> wrote:
>
> The status of the gitlab-CI files is currently somewhat confusing, and
> it is often not quite clear whether a patch should go via my tree or
> via the testing tree of Alex. That situation has grown historically...
> Initially, I was the only one using the gitlab-CI, just for my private
> repository there. But in the course of time, the gitlab-CI switched to
> use the containers from tests/docker/ (which is not part of the gitlab-CI
> section in the MAINTAINERS file), and QEMU now even switched to gitlab.com
> completely for the repository and will soon use it as its gating CI, too,
> so it makes way more sense if the gitlab-ci.yml files belong to the people
> who are owning the qemu-project on gitlab.com and take care of the gitlab
> CI there. Thus let's merge the gitlab-ci section into the common "test and
> build automation" section.
>
> And while we're at it, I'm also removing the line with Fam there for now,
> since he was hardly active during the last years in this area anymore.
> If he ever gets more time for this part again in the future, we surely
> can add the line back again. I'm also removing the Patchew URL from this
> section now since Patchew's files are not tracked in the main QEMU repo
> and it is also not maintained by Alex, Philippe and myself.
> The maintainers of Patchew are still listed more accurately in the wiki on
> https://wiki.qemu.org/AdminContacts & https://wiki.qemu.org/Testing/CI/Patchew
> instead.
>
> Now to avoid that Alex is listed here in this section alone, Philippe and
> I agreed to help as backup maintainers here, too. And Willian volunteered
> to be an additional reviewer.
>
> Acked-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Acked-by: Willian Rampazzo <willianr@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 23 ++++++++---------------
>  1 file changed, 8 insertions(+), 15 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


