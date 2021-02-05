Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCA0310D2E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:32:43 +0100 (CET)
Received: from localhost ([::1]:56692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l836A-00030c-U0
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:32:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chirantan@google.com>)
 id 1l8333-0001vl-E1
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:29:30 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:41866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chirantan@google.com>)
 id 1l8330-0005Bf-OE
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:29:29 -0500
Received: by mail-ej1-x636.google.com with SMTP id f14so12521326ejc.8
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 07:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UQ0FvqEsvwhOk1J4aJRozU/5FhgB0VGKiDGGsG4//rw=;
 b=Ab9CSnmhQzkZR/cpBXjY3+uocCQDKvCeWJ2Wz00b5LoSap8nsI6+fmijNjeHlg0Z4n
 XCBY1dzAwTmXk3uzdZyJb7E3tXsC8yIyupAoqpzh0wcwN7/xFU5rPWLSAD00ZPbzMXCn
 jFWc8TRG18Ru05TR7exOajo3NUy4zOdPTOVhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UQ0FvqEsvwhOk1J4aJRozU/5FhgB0VGKiDGGsG4//rw=;
 b=Hx56bEQw40weH0okC0gWQo155WVZh4Tm2eeXu99/eJ5XDG7SeVFq4aAJ9e3Qt03pWe
 6ihiq6Hhx4B9+iz9aAG/z8+OPKIh6J6KcldDUAJ9tnKBDFiNvr+ojYG6dKeV3jfMYZnK
 ftbvtojRKhNnwXNTRF5wX8eyU4uoeJUOyFmA5/FkEL05OfTmvPiXCgL6llAZ2GSQmGpn
 mz+jT1uTmAs6Q4NPGcRzhq5mJbXiZzep+/sABRH8ezgpF7bxDyY+k6gDtj1xVyEMFlLp
 o0K1HrUwxqA4DWh0Ug0KmjqYwmjZb3iM39WC6OfTNE8hTlnBaxMnrpi9s6DKCeM1G4jW
 uguw==
X-Gm-Message-State: AOAM531ZUYw7HFvj62Lfk/MdpAtGiOOlySu5xeBp8k9QCqotwqfQhWp9
 RSOF6AUObOTIWs/R2g3R5VNZLIcuTW7sQsIc9BDwYw==
X-Google-Smtp-Source: ABdhPJy+n5T4noLuXUlz4IJwSviadqTlNl9uZlJ9y4YVp2b9WdQfkJLPWyolH6xFMd2vj/WvGe9obsu1hxFVMcK0pZY=
X-Received: by 2002:a17:907:78d5:: with SMTP id
 kv21mr4538731ejc.461.1612538963116; 
 Fri, 05 Feb 2021 07:29:23 -0800 (PST)
MIME-Version: 1.0
References: <20210127112131.308451-1-stefanha@redhat.com>
 <20210128184416.4dbdd23b@bahia.lan>
 <20210201171440.GA180539@stefanha-x1.localdomain>
 <20210201182215.GA221556@stefanha-x1.localdomain>
In-Reply-To: <20210201182215.GA221556@stefanha-x1.localdomain>
From: Chirantan Ekbote <chirantan@chromium.org>
Date: Sat, 6 Feb 2021 00:29:11 +0900
Message-ID: <CAJFHJrq9Miy91T1fmb9iSTYya7U7kwPNpX3y9pvL2JHW=eav=A@mail.gmail.com>
Subject: Re: [Virtio-fs] [PATCH v3] virtiofsd: prevent opening of special
 files (CVE-2020-35517)
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=chirantan@google.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: Daniel Berrange <berrange@redhat.com>, qemu-devel@nongnu.org,
 P J P <ppandit@redhat.com>, virtio-fs-list <virtio-fs@redhat.com>,
 Greg Kurz <groug@kaod.org>, Alex Xu <alex@alxu.ca>,
 Laszlo Ersek <lersek@redhat.com>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 2, 2021 at 3:22 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> Hi Chirantan,
> I wanted to bring this CVE to your attention because the discussion has
> revealed a number of other issues (not necessarily security issues) in
> virtiofsd that may also be present in other virtio-fs daemon
> implementations.
>

Hi Stefan,

Thanks for the heads up.  I'm going to summarize the thread just to
make sure I understood correctly.

The CVE seems to be that the virtio-fs daemon allows opening special
files and the short-term fix is to detect and block this in the
daemon.  The long term fix is to mount the data with
nosuid,nodev,noexec.  I think crosvm's virtio-fs also doesn't check
the file type before opening it but chrome os has mounted all stateful
data as nosuid,nodev,noexec as long as I can remember so I think we
got lucky there.  It's probably still worth adding the check to the
server.

The other issue is that there is a race between when an entry is
created and when we look it up by name where it may be modified and
replaced by an external process.  While I can see how this can be
fixed for files, it seems like there's no choice for directories.
It's not like mkdirat returns an fd for the newly created directory.
Though, it seems like every process is affected by this.  I guess if
you wanted to be really paranoid you could do something like mkdtemp,
get an fd, and then rename to the real name.

Did I miss anything?

Thanks,
Chirantan

