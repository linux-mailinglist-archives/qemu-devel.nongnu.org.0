Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B9765CFEB
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 10:49:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD0Nk-0005HB-A6; Wed, 04 Jan 2023 04:48:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pD0NN-0005Fg-Do
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 04:48:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pD0NL-0001Zx-Hi
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 04:48:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672825678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h8EDukHfBRziUhD22gDcJv+yf++6WUbRvhwQlliTBC8=;
 b=Fyr/WVNF8+5b/maQT70N365WleRSbfD87aB0ScaD1CwMQU694PzkTQCKM+Znz7IHNs6iyS
 wm+uo+qpi3DZQCWllQbFNJpDwCsw+/EM3LNMnsvaXQIa/2t75q0YVh5ueMebVGlecLeU7T
 mgZW9zCX5+RJw2W/Y8/O88gFCobAPVA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-103-qzHqwrv1P3uCa5I_RjOcqQ-1; Wed, 04 Jan 2023 04:47:57 -0500
X-MC-Unique: qzHqwrv1P3uCa5I_RjOcqQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 l31-20020a05600c1d1f00b003d9720d2a0eso17761522wms.7
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 01:47:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h8EDukHfBRziUhD22gDcJv+yf++6WUbRvhwQlliTBC8=;
 b=ijOoY9cTxAgzIgOuybfeJqxGMWVa+lgn0pgEA3cHEecoyzC7d7SUJfBmoKN01XThwQ
 k/gTqlfrzu71ZJgmNFs6/2rVFEd+nqsCEbqdD34LDhJdOAAOpIWiOVYe5zMH+sm6xZb7
 dEDxnrFh863RGVhnu1PsmeixpmVEOrTDL698D2R6hBLi4ZY4IqLC4LtGEcTDXWQtKG5A
 m+2e6lYq3DWygVYwWzz7Si9AYyYYidMK2N7Kc3bhLK7dQ89WkDW3NSTVsadLActz1gVQ
 1ee0apjEAfpIZ0zi5RjtscK6QCs7EVQu0IKik/dltpgiGDB8KbkRscB7Vne6LCxrO1M5
 DWIg==
X-Gm-Message-State: AFqh2kpc5aY9XaryygCHrslNDpaA3szht3qzHKBvf5nVEs19h/0IkKxU
 0NyjLu1YEbwybQOBEYFV9xwqg25o+n9sSZu268ukvKw5NLG+kk20N0edfzm4g0v7NX0l0nQg+nP
 oIiyU4r+4ipKGvVo=
X-Received: by 2002:adf:d4c2:0:b0:27e:6782:eac9 with SMTP id
 w2-20020adfd4c2000000b0027e6782eac9mr19487112wrk.42.1672825675992; 
 Wed, 04 Jan 2023 01:47:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuI1Xsue5OVESY8OgsgK/SHiKHEAaArzYttkIr8vbiwBbRy6eodMTUtNWfcu2xGZozEP4PINw==
X-Received: by 2002:adf:d4c2:0:b0:27e:6782:eac9 with SMTP id
 w2-20020adfd4c2000000b0027e6782eac9mr19487105wrk.42.1672825675692; 
 Wed, 04 Jan 2023 01:47:55 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-176-239.web.vodafone.de.
 [109.43.176.239]) by smtp.gmail.com with ESMTPSA id
 c8-20020a5d4148000000b002428c4fb16asm33413062wrq.10.2023.01.04.01.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 01:47:54 -0800 (PST)
Message-ID: <92131031-46de-e37d-31d4-f12cc6edcc9c@redhat.com>
Date: Wed, 4 Jan 2023 10:47:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Nikita Ivanov <nivanov@cloudlinux.com>, qemu-devel@nongnu.org
References: <20221023090422.242617-1-nivanov@cloudlinux.com>
 <CAAJ4Ao-aa+Gnf_=8THxC4_6cayJJ8QM50bH1MXuM5t+x3CPLYg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4 0/2] Refactoring: expand usage of TFR() macro
In-Reply-To: <CAAJ4Ao-aa+Gnf_=8THxC4_6cayJJ8QM50bH1MXuM5t+x3CPLYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.103, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 02/11/2022 21.30, Nikita Ivanov wrote:
> Hi!
> Is there any update on this? I haven't received any comments.

Sorry, seems like this fell through the cracks since it was not quite clear 
which maintainer should pick it up. I'll take the patches for my next pull 
request.

  Thomas


> On Sun, Oct 23, 2022 at 12:04 PM Nikita Ivanov <nivanov@cloudlinux.com 
> <mailto:nivanov@cloudlinux.com>> wrote:
> 
>     At the moment, TFR() macro has a vague name and is not used
>     where it possibly could be. In order to make it more transparent
>     and useful, it was decided to refactor it to make it closer to
>     the similar one in glibc: TEMP_FAILURE_RETRY(). Now, macro
>     evaluates into an expression and is named RETRY_ON_EINTR(). All the
>     places where RETRY_ON_EINTR() macro code be applied were covered.
> 
>     Nikita Ivanov (2):
>        Refactoring: refactor TFR() macro to RETRY_ON_EINTR()
>        error handling: Use RETRY_ON_EINTR() macro where applicable
> 
>       block/file-posix.c        | 37 ++++++++++++++++---------------------
>       chardev/char-fd.c         |  2 +-
>       chardev/char-pipe.c       |  8 +++++---
>       chardev/char-pty.c        |  4 +---
>       hw/9pfs/9p-local.c        |  8 ++------
>       include/qemu/osdep.h      |  8 +++++++-
>       net/l2tpv3.c              | 17 +++++------------
>       net/socket.c              | 16 +++++++---------
>       net/tap-bsd.c             |  6 +++---
>       net/tap-linux.c           |  2 +-
>       net/tap-solaris.c         |  8 ++++----
>       net/tap.c                 | 10 +++-------
>       os-posix.c                |  2 +-
>       qga/commands-posix.c      |  4 +---
>       semihosting/syscalls.c    |  4 +---
>       tests/qtest/libqtest.c    | 14 ++++++--------
>       tests/vhost-user-bridge.c |  4 +---
>       util/main-loop.c          |  4 +---
>       util/osdep.c              |  4 +---
>       util/vfio-helpers.c       | 12 ++++++------
>       20 files changed, 73 insertions(+), 101 deletions(-)
> 
>     -- 
>     2.37.3
> 
> 
> 
> -- 
> Best Regards,
> *Nikita Ivanov* | C developer
> *Telephone:* +79140870696
> *Telephone:* +79015053149


