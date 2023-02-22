Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E8669F98D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 18:05:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUsWK-0002Ej-JY; Wed, 22 Feb 2023 12:03:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUsVk-000234-Tx
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:02:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUsVj-0003Mi-A6
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:02:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677085348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G1eY87ZXMp623jRUESzYNYBoMTQyXdiL9sOeHREsrBM=;
 b=PqUrVXo3q/XxC7xr6j7lMdY772dbW8NR/rAsaCW406HqAZvBB4OxBZX/2kvlqioRzobv4V
 Skz47NSvx09xwAtSPbq86LGNTJ8J+aPh3xmdybKpYmOx7SRCq4chcQ9qhPCVEVDWPLAkzO
 GIO7HqLI+/YHgC+SqGRbPoWJVDmKvG8=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-350-0OGBBdlGN9GqQoX6Ff8RRA-1; Wed, 22 Feb 2023 12:02:27 -0500
X-MC-Unique: 0OGBBdlGN9GqQoX6Ff8RRA-1
Received: by mail-vs1-f71.google.com with SMTP id
 k2-20020a0561023f0200b00411c70e9579so3302209vsv.17
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 09:02:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G1eY87ZXMp623jRUESzYNYBoMTQyXdiL9sOeHREsrBM=;
 b=K1So/djtX8YmpeoBl/Fv4Bd3Q9xNAn7bpPZ5tgpAUImDICbEG/wm8hHv/LFHrsI7zR
 tVKRhb4D9ZqrKlwwDPcwReH9Z88EapyDRcC7Zxcjea8icgRhSn3WnsSt6GczDDqT6zSv
 +itoJSd6U87o2IJGpSXlftaB9bfy+C6kTMjfXbrloSu0Gwuwn3iJiV3ck/jpp9QCW5Vc
 eWVpE+nXm807dTQuDEoCmjd2nir2PQ5Et761cOd52cDSS28IiksOX4aEHJnzjKB3LvDn
 W7tO2fNt82X7zegV7NnhViEcADFdMOroqGwlCaUJrcChShNnpia+Q/DRkyq3YAXo6j+K
 LTOg==
X-Gm-Message-State: AO0yUKVNamLISdlYBaqgSSJyDwXLDVxxpPvzlko5flxfRZZo8H/sdFV5
 HA/1r4SeY50Bys+5+gRdzqNrA/YhXi6mLHzsP5lVr4ioByUjIUqZUH03DO6wN1cZ0nIlBca9PRl
 YAuMT5I9zqvxc/FxvwILj6g3VIcLvzcg=
X-Received: by 2002:a67:8c42:0:b0:41e:9107:d3e6 with SMTP id
 o63-20020a678c42000000b0041e9107d3e6mr1367539vsd.53.1677085346896; 
 Wed, 22 Feb 2023 09:02:26 -0800 (PST)
X-Google-Smtp-Source: AK7set+4zU1NJMaqhYSyR+WSxK1pE6IIkd0fNafC6i3kG/km4Z6evUjTq7i2nM8/PNqAYqWveqP0v5aIt8byHHTavEo=
X-Received: by 2002:a67:8c42:0:b0:41e:9107:d3e6 with SMTP id
 o63-20020a678c42000000b0041e9107d3e6mr1367528vsd.53.1677085346653; Wed, 22
 Feb 2023 09:02:26 -0800 (PST)
MIME-Version: 1.0
References: <20230222143752.466090-1-pbonzini@redhat.com>
 <20230222143752.466090-10-pbonzini@redhat.com>
 <878rgpll0i.fsf@pond.sub.org>
In-Reply-To: <878rgpll0i.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 22 Feb 2023 18:02:14 +0100
Message-ID: <CABgObfZDJQvnm4UO8E5tdFgwmvip4dYT8qrdKU0_iTpYru8+WQ@mail.gmail.com>
Subject: Re: [PATCH 09/10] Python: Drop support for Python 3.6
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, jsnow@redhat.com, peter.maydell@linaro.org, 
 thuth@redhat.com, alex.bennee@linaro.org, berrange@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 22, 2023 at 5:31 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Paolo Bonzini <pbonzini@redhat.com> writes:
>
> > Python 3.6 was EOL 2021-12-31. Newer versions of upstream libraries have
> > begun dropping support for this version and it is becoming more
> > cumbersome to support. Avocado-framework and qemu.qmp each have their
> > own reasons for wanting to drop Python 3.6, but won't until QEMU does.
>
> In review of the original "[PATCH v3 6/6] Python: Drop support for
> Python 3.6", I volunteered to rework the rationale.  Second thoughts: if
> y'all think this is good enough, let's leave it there.

As you prefer; "docs: build-platforms: refine requirements on Python
build dependencies" already provides a fairly lengthy rationale
distilled from the same discussions, so I think we can leave it at
that, but I can merge whatever change you prefer.

Paolo


