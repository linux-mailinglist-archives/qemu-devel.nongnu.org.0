Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9222831C256
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 20:18:14 +0100 (CET)
Received: from localhost ([::1]:43430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBjNt-00044X-Lm
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 14:18:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lBjLV-00033a-SY
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:15:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lBjLT-0001X7-4i
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:15:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613416542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qCV6Gb23hyWZd1F9yxfUtxju8e9XSO4AMyPYN1Fy8h0=;
 b=bw2nwIqjZcd/fhpr0A/1TPRIHlb0qfy/Gg+ndORPLrIskIobFs8K1P+JOr57r01TdByHn3
 QKSBjalDkLxKjPGoz0R8AGNDQu68NC01SsrmDsUQjyC9uaTmrKf4RavrL9TlrQ8ZHoW7Oc
 OoOJIJYP80QANs8R9bzSylLIqhlOq38=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-kRUbIMSCMr-eO4iOuC-DKg-1; Mon, 15 Feb 2021 14:15:40 -0500
X-MC-Unique: kRUbIMSCMr-eO4iOuC-DKg-1
Received: by mail-vs1-f72.google.com with SMTP id m11so1284663vsp.17
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 11:15:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qCV6Gb23hyWZd1F9yxfUtxju8e9XSO4AMyPYN1Fy8h0=;
 b=inhn/LEXABczvTBaECJ6tspPoxSP3hbBXNR/GrRy6GRiNG0PAS60w/H/gzCp4z75Ah
 hI6MDao6A0YKu+6vL3qZ3WdKU0yFmWUVB9b0VfsPfBcws61yF7WFeh4AtAa3jCdQZjkC
 Tb0+aTQAGMIi15NIaqQhUANwUH5gg1u1iYrMeLAbMliTpIWQuRlKcinQOtKUJDIGqrGF
 MS0Zk5zhGH1OyYncY1iZ4+SQdBhZcfQiHWibWuEt38n9A6sT326Lf0q14q4Nestw/5xJ
 IysaI7rjuAxfIzA9P8DDGoeXpFMPI6SljKt5aqcZAoQjhJre20aSorEBZgaTciGPAAiA
 eL0w==
X-Gm-Message-State: AOAM533sIhqey0/eAWR8tLpV/EziV10e3/ROwH1rIYjMwJVcJHFnwn80
 qvQHcPJfvgPfpZEMoe8QOKm99rvmp348mg9jnQeImgSGz+Zk2YD+jbj78KhXv/k2eHjVuIUqgEa
 GF4x7z3qECaNJkkvtJBlpPJtN5tX6hww=
X-Received: by 2002:a1f:bd08:: with SMTP id n8mr9614759vkf.1.1613416540009;
 Mon, 15 Feb 2021 11:15:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCQ4mwjDuFKpZj2cpUBN+sxRMI1yEboG/XrFX2vfLyh4Pv2jwMOTsww1YH1sklo5/Ipyw12Uo0j3saUp4Bztk=
X-Received: by 2002:a1f:bd08:: with SMTP id n8mr9614742vkf.1.1613416539829;
 Mon, 15 Feb 2021 11:15:39 -0800 (PST)
MIME-Version: 1.0
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-16-crosa@redhat.com>
In-Reply-To: <20210203172357.1422425-16-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 15 Feb 2021 16:15:14 -0300
Message-ID: <CAKJDGDZH0o41N-NM5sKmKvmuHvAtj2JBNwcbtvzkg3ZrVOcqOw@mail.gmail.com>
Subject: Re: [PATCH 15/22] Acceptance Tests: move useful ssh methods to base
 class
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, Eric Auger <eauger@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 3, 2021 at 2:24 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> Both the virtiofs submounts and the linux ssh mips malta tests
> contains useful methods related to ssh that deserve to be made
> available to other tests.  Let's move them to the base LinuxTest
> class.
>
> The method that helps with setting up an ssh connection will now
> support both key and password based authentication, defaulting to key
> based.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 49 ++++++++++++++++++++++-
>  tests/acceptance/linux_ssh_mips_malta.py  | 38 ++----------------
>  tests/acceptance/virtiofs_submounts.py    | 36 -----------------
>  3 files changed, 51 insertions(+), 72 deletions(-)
>

Here I bring back my comment from patch 14, having a common place for
test specific classes would bring a better organization to the code.
Anyway,

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


