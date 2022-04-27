Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 975F55122C9
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 21:31:42 +0200 (CEST)
Received: from localhost ([::1]:37504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njnNz-0001oW-KN
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 15:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1njnMX-0000n2-GN
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 15:30:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1njnMU-0002wV-KJ
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 15:30:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651087804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jMDj5baAOMCqcsimnYVI+1qayHTENI8W08SIsawwZLM=;
 b=SfyhndzOePqOqgDihhCHB7ee10OWdnL4PYRH2i8V2XLxEtf7eBtpBqKoyAEVN/AZgo10VT
 oIe36UaVY+XAVfemHyC7qxlIYrfZ+5kvKvI1b+RmFajigFAPLuUnLF1VFOhUh9wO9IAVOX
 8wY+3wByeEgwSWxWI06os/SLE9CY8JM=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-FVennxLOMtW8aVEjWMwfvw-1; Wed, 27 Apr 2022 15:30:03 -0400
X-MC-Unique: FVennxLOMtW8aVEjWMwfvw-1
Received: by mail-ua1-f70.google.com with SMTP id
 t12-20020ab0688c000000b0036274f5d6a4so1236912uar.9
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 12:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jMDj5baAOMCqcsimnYVI+1qayHTENI8W08SIsawwZLM=;
 b=BYtOomZN3c4bl3qgCY/SaV2K4LA2UT9lZOYNCA9Hi2TH6+I2OYWTDB16/PRkPeDqtT
 frWcY6MWCXfXT2UPxs3L+FILhVBqEqJmeq8OhekrDCVDaO3vbHPal80l1t07wvMioLwl
 C1gViro8xY1NGW5eg2WB3PaV8Lf89YH1K6VDdZa5GHYMNhNVdwvhj+ouAzV5OP8vuCiJ
 lAAlm54ZtvShcI34WAWaDGuJBK22xphONO4kH5VI+yevZrFDoYvjmWPOK4ngF02YaU4w
 FgvV3pRm1N8hWaEsG6KSTxCcRozYCGU5BC18qwsd/lE032HqSMjBgmUB2znM3rnOhTh8
 Mw6Q==
X-Gm-Message-State: AOAM532e26NG+TbKbgkYcN6ewoY4CWFO7ZGrMgQ51WyKY6attG06OJ3x
 w3acGtOByl7AjBy6fxVeSL2vLBBVKUSsq25PTkVLhAYQwne1ZEsEJYHeuapuBeHER2B2AV/Sgf8
 IJOiYYTTumEOE/cYG1KXG8m0w4A/CnZM=
X-Received: by 2002:a9f:3193:0:b0:35d:21ec:4ae1 with SMTP id
 v19-20020a9f3193000000b0035d21ec4ae1mr8950665uad.100.1651087803004; 
 Wed, 27 Apr 2022 12:30:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpFMZwRAEJ6ohdQGXtdvSuDrwJgji5A007/JYBZXKe+fsGIRKKxVE3o/hMjJk2rQuDExl9HB9jYLna/Y5GC/E=
X-Received: by 2002:a9f:3193:0:b0:35d:21ec:4ae1 with SMTP id
 v19-20020a9f3193000000b0035d21ec4ae1mr8950654uad.100.1651087802761; Wed, 27
 Apr 2022 12:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220408170214.45585-1-vsementsov@openvz.org>
In-Reply-To: <20220408170214.45585-1-vsementsov@openvz.org>
From: John Snow <jsnow@redhat.com>
Date: Wed, 27 Apr 2022 15:29:52 -0400
Message-ID: <CAFn=p-Zn-L+vBF34v1BNK9i8VuSPH0J9D9Vx0+zLjip0iD2JqQ@mail.gmail.com>
Subject: Re: [RFC 0/2] introduce QEMUMachind.cmd()
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 vsementsov@openvz.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 8, 2022 at 1:02 PM Vladimir Sementsov-Ogievskiy
<vladimir.sementsov-ogievskiy@openvz.org> wrote:
>
> Hi all!
>
> I always dreamed about getting rid of pattern
>
>     result = self.vm.qmp(...)
>     self.assert_qmp(result, 'return', {})
>
> Here is a suggestion to switch to
>
>     self.vm.cmd(...)
>
> pattern instead.

Yeah, I am absolutely on board for this!

>
> I'm not sure we really want to update so many tests. May be just commit
> patch 01, and use new interface for new code. On the other hand, old
> code always used as an example to write the new one.

I think it's worth updating all the old tests ... especially if you've
already done it here. We could even do something like what I did with
qemu_img() and qemu_io() and have the uncaught exception print a bunch
of information to the screen to help make it extremely obvious as to
what failed and why.

If you can rebase this, I'd love to review it more carefully - it
aligns with my own selfish goals and interests :) The Python branch
was merged recently and so we should be all set.

>
> The series is based on John's python branch.
>
> Vladimir Sementsov-Ogievskiy (2):
>   python/machine.py: upgrade vm.command() method
>   iotests: use vm.cmd() instead of vm.qmp() where appropriate
>
>  python/qemu/machine/machine.py                |  16 +-
>  tests/qemu-iotests/030                        | 168 +++----
>  tests/qemu-iotests/040                        | 167 +++---
>  tests/qemu-iotests/041                        | 474 ++++++++----------
>  tests/qemu-iotests/045                        |  15 +-
>  tests/qemu-iotests/055                        |  61 +--
>  tests/qemu-iotests/056                        |  23 +-
>  tests/qemu-iotests/093                        |  41 +-
>  tests/qemu-iotests/118                        | 221 ++++----
>  tests/qemu-iotests/124                        |  69 ++-
>  tests/qemu-iotests/129                        |  13 +-
>  tests/qemu-iotests/132                        |   5 +-
>  tests/qemu-iotests/139                        |  43 +-
>  tests/qemu-iotests/147                        |  30 +-
>  tests/qemu-iotests/151                        |  40 +-
>  tests/qemu-iotests/155                        |  53 +-
>  tests/qemu-iotests/165                        |   7 +-
>  tests/qemu-iotests/196                        |   3 +-
>  tests/qemu-iotests/205                        |   6 +-
>  tests/qemu-iotests/245                        | 245 ++++-----
>  tests/qemu-iotests/256                        |  34 +-
>  tests/qemu-iotests/257                        |  36 +-
>  tests/qemu-iotests/264                        |  31 +-
>  tests/qemu-iotests/281                        |  21 +-
>  tests/qemu-iotests/295                        |  27 +-
>  tests/qemu-iotests/296                        |  14 +-
>  tests/qemu-iotests/298                        |  13 +-
>  tests/qemu-iotests/300                        |  50 +-
>  tests/qemu-iotests/iotests.py                 |   6 +-
>  .../tests/migrate-bitmaps-postcopy-test       |  31 +-
>  tests/qemu-iotests/tests/migrate-bitmaps-test |  37 +-
>  .../qemu-iotests/tests/migrate-during-backup  |  40 +-
>  .../qemu-iotests/tests/migration-permissions  |   9 +-
>  tests/qemu-iotests/tests/mirror-top-perms     |  15 +-
>  34 files changed, 821 insertions(+), 1243 deletions(-)

Is there anything missing, to your knowledge?

--js


