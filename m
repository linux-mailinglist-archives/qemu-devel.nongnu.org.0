Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFE54ECA48
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 19:06:31 +0200 (CEST)
Received: from localhost ([::1]:59956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZbm9-0006d3-Pz
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 13:06:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZbkN-0005vS-69
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 13:04:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZbkK-0002wR-KR
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 13:04:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648659862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sgw0G73KyIxaklgIf9e83ujY+s5dgWPxJpdI8KCahTc=;
 b=dhOuI86cse410J6qRVvwxgiaTH56mBFE9sRr9W+pMPGtbjY/Aa+u4mV/h6CkE49TxHHmCo
 7MAsK0qoxD2IZVCgpNiQVaw2K+izb4nFY37hlPQ5wgkt0Yw9ARK01bxWhc+zqkM86218Kn
 jA7skrjWc5CrMUZd5SUypzWjigFKdWI=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-jKATJXPfNmW0k718NA3AzQ-1; Wed, 30 Mar 2022 13:04:19 -0400
X-MC-Unique: jKATJXPfNmW0k718NA3AzQ-1
Received: by mail-ua1-f69.google.com with SMTP id
 4-20020a9f2404000000b00359ae34c591so6304911uaq.13
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 10:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sgw0G73KyIxaklgIf9e83ujY+s5dgWPxJpdI8KCahTc=;
 b=iliLNTbk0LcFXVoamPpVpDeqG0AghpnI2ugtPlWBPRGQqIe8zV/+GsySbNAIqq70Tp
 /PTQiJR3aEOc8FaylGmuYZiLyk3Kx0BAHTi554gjzLwwqpY/0HBHyYCDd0n/qxxROI07
 lM6bgs3QrJGDPzoggP/823/WEQIvoKm8ncpJDcn7jrhgCggZ1ujRkkjLiXaAPI4gWe81
 RWVtjk/6miF3x/bpIRQJgzDyvk8BiYU+xrSBAf/EW0C9kSXiDiKh4zBOU320xSMMNBII
 TWnpwyQmAjoujtbMDyLgjknuMT4VEmmC4FjY61r+p0s6ekXRK5njCfOIdj0iJZ0ufUIa
 rrsQ==
X-Gm-Message-State: AOAM530ClYpijmqV/KRiqdzBfyiTR9+ZQPS2VxbvFJgH+BeTTlpuI7PW
 W56MPY2oZJ4XqGTFoCimO4lBqzwlH3OAE1lhiD1PdFqqrV5pubX0UK9Dg+yfzH0pJzFrga2+mKw
 708OW1owY/WXKAOU6xCZcbfhPo60JysE=
X-Received: by 2002:ab0:ae:0:b0:351:4e9a:c3fd with SMTP id
 43-20020ab000ae000000b003514e9ac3fdmr280701uaj.119.1648659858341; 
 Wed, 30 Mar 2022 10:04:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHuCWeayIm7iBTvkZpKLhZrVQ/TwspU3wCHTuhZANF4M+aEqbKkvjLf/0vwQSrkTfJjuWEPErFQpX8e49HahA=
X-Received: by 2002:ab0:ae:0:b0:351:4e9a:c3fd with SMTP id
 43-20020ab000ae000000b003514e9ac3fdmr280676uaj.119.1648659858117; 
 Wed, 30 Mar 2022 10:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220325200438.2556381-1-jsnow@redhat.com>
In-Reply-To: <20220325200438.2556381-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 30 Mar 2022 13:04:07 -0400
Message-ID: <CAFn=p-YWJHvXmgfWrfabL42wC67cajpikz5mP_TAbSZ8ZjK1EA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Python: relicense async qmp as LGPLv2+
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eric Blake <eblake@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 25, 2022 at 4:04 PM John Snow <jsnow@redhat.com> wrote:
>
> Patch 2 explains most of the why.
>
> The only dangling exception is legacy.py (patch 1), which I have plans
> to replace "soon" :tm: (after I fork this code out of qemu.git.)
>
> John Snow (4):
>   python/aqmp: add explicit GPLv2 license to legacy.py
>   python/aqmp: relicense as LGPLv2+
>   python/qmp-shell: relicense as LGPLv2+
>   python/aqmp-tui: relicense as LGPLv2+
>
>  python/qemu/aqmp/__init__.py  |  6 +++---
>  python/qemu/aqmp/aqmp_tui.py  |  2 +-
>  python/qemu/aqmp/legacy.py    | 11 +++++++++++
>  python/qemu/aqmp/qmp_shell.py |  7 ++++---
>  4 files changed, 19 insertions(+), 7 deletions(-)
>
> --
> 2.34.1
>

Thanks everyone. This is now staged on my python branch.

https://gitlab.com/jsnow/qemu/-/tree/python


