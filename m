Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79921423B5B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 12:18:18 +0200 (CEST)
Received: from localhost ([::1]:60756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY409-00018p-Fd
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 06:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mY3wJ-0006Mc-Hi
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:14:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mY3wH-0005V0-L8
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:14:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633515257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zQjrATsHcpFO+jQjUdBC3khY9edpMYSuo3Axa2Hx8DE=;
 b=hnHp44uHwb822vG2Q9do3shI7/JJsQR9Y9mvw/l4P6h9Rmvv4ogqPPXq0OLlSHlsRGQng1
 hgdJbMqMAeUhfmc8w8yGSrQoJAj4puNZQM+BO3eRb2G8bTrM/aI2lW1CPv67QdRIwynWJR
 RPG6QWAXtXAoOE2hmqyK5Qcya6aowSE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-KARkVpBhObmMjQ9HlsFYSQ-1; Wed, 06 Oct 2021 06:14:14 -0400
X-MC-Unique: KARkVpBhObmMjQ9HlsFYSQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 t28-20020a508d5c000000b003dad7fc5caeso2158757edt.11
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 03:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zQjrATsHcpFO+jQjUdBC3khY9edpMYSuo3Axa2Hx8DE=;
 b=gBYOJUazDO7RQEi6GNBUJiJ9Cwfbtph4UXhcMESGB6MogJVpQr1ukAOzMZIhU6A6mt
 UigTbUiD/7Wg0XhzQVcsgh/FT51YlUWp/tugFq17t01WvWcq4nDSlePxdVt0S+OP4QiQ
 1DckDdqOHcTrIlJgn5oQWXfm6DTw6jzvDlwXgKDoThwXZvt0HgqXcI15gZp2oAu0sDET
 SUFv9F4mzI1e9bOOpFyb4leBW68duDxGt/9FpG4xwKWDOs7bdnV+jSdb+MxBCOBgqdBH
 LO8VmcowHkDniBWQUTqqAr7WXj37BLXAHGV/CeFyGMTDFLKPUilpJYgYAICZ5Dm2D8BU
 de0g==
X-Gm-Message-State: AOAM533K3D/4qsQkFQfbhLJxEhxuK4jthRnfSb1salvOfzUj/Ja9nMfJ
 HL/hzvkLgX7kZGnlzxqdZiLTlhfZB2JluYhsfQ73Jh5fehn776L80DdOM3yUuVDjJF+EFhOruh6
 B45HH9ewav4HMjI0=
X-Received: by 2002:a50:fc86:: with SMTP id f6mr14923491edq.283.1633515252965; 
 Wed, 06 Oct 2021 03:14:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWzl83/6sSEfSd3D+ergmbnd4QrbE0uRAUT0O5BXNiZzw8M4fO0nIT2jdTin6fAlx5q5oq0g==
X-Received: by 2002:a50:fc86:: with SMTP id f6mr14923470edq.283.1633515252762; 
 Wed, 06 Oct 2021 03:14:12 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id t14sm8842110ejf.24.2021.10.06.03.14.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 03:14:12 -0700 (PDT)
Message-ID: <d480430f-4e46-e4a5-32c2-8e90d97d8461@redhat.com>
Date: Wed, 6 Oct 2021 12:14:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 00/17] Switch iotests to using Async QMP
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210923004938.3999963-1-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20210923004938.3999963-1-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/09/21 02:49, John Snow wrote:
> Based-on: <20210915162955.333025-1-jsnow@redhat.com>
>            [PATCH v4 00/27] python: introduce Asynchronous QMP package
> GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-aqmp-iotest-wrapper
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/375637927
> 
> Hiya,
> 
> This series continues where the first AQMP series left off and adds a
> synchronous 'legacy' wrapper around the new AQMP interface, then drops
> it straight into iotests to prove that AQMP is functional and totally
> cool and fine. The disruption and churn to iotests is extremely minimal.
> (There's actually a net negative SLOC in tests/qemu-iotests.)
> 
> In the event that a regression happens and I am not physically proximate
> to inflict damage upon, one may set the QEMU_PYTHON_LEGACY_QMP variable
> to any non-empty string as it pleases you to engage the QMP machinery
> you are used to.
> 
> I'd like to try and get this committed early in the 6.2 development
> cycle to give ample time to smooth over any possible regressions. I've
> tested it locally and via gitlab CI, across Python versions 3.6 through
> 3.10, and "worksforme". If something bad happens, we can revert the
> actual switch-flip very trivially.
> 
> Layout:
> 
> Patches 1-7: ./python/qemu/aqmp changes that serve as pre-requisites.
> Patches 8-12: other ./python changes that ease the transition.
> Patches 13-14: iotest changes to support the new QMP backend.
> Patches 15-17: Make the switch.
> 
> V2:
> 
> 001/17:[----] [--] 'python/aqmp: add greeting property to QMPClient'
> 002/17:[----] [--] 'python/aqmp: add .empty() method to EventListener'
> 003/17:[----] [--] 'python/aqmp: Return cleared events from EventListener.clear()'
> 004/17:[0007] [FC] 'python/aqmp: add send_fd_scm'
> 005/17:[down] 'python/aqmp: Add dict conversion method to Greeting object'
> 006/17:[down] 'python/aqmp: Reduce severity of EOFError-caused loop terminations'
> 007/17:[down] 'python/aqmp: Disable logging messages by default'
> 
> 008/17:[0002] [FC] 'python/qmp: clear events on get_events() call'
> 009/17:[----] [--] 'python/qmp: add send_fd_scm directly to QEMUMonitorProtocol'
> 010/17:[----] [--] 'python, iotests: remove socket_scm_helper'
> 011/17:[0013] [FC] 'python/machine: remove has_quit argument'
> 012/17:[down] 'python/machine: Handle QMP errors on close more meticulously'
> 
> 013/17:[0009] [FC] 'iotests: Accommodate async QMP Exception classes'
> 014/17:[down] 'iotests: Conditionally silence certain AQMP errors'
> 
> 015/17:[0016] [FC] 'python/aqmp: Create sync QMP wrapper for iotests'
> 016/17:[0002] [FC] 'python/aqmp: Remove scary message'
> 017/17:[----] [--] 'python, iotests: replace qmp with aqmp'
> 
> - Rebased on jsnow/python, which was recently rebased on origin/master.
> - Make aqmp's send_fd_scm method bark if the socket isn't AF_UNIX (Hanna)
> - Uh... modify send_fd_scm so it doesn't break when Python 3.11 comes out ...
>    See the commit message for more detail.
> - Drop the "python/aqmp: Create MessageModel and StandaloneModel class"
>    patch and replace with a far simpler method that just adds an
>    _asdict() method.
> - Add patches 06 and 07 to change how the AQMP library handles logging.
> - Adjust docstring in patch 08 (Hanna)
> - Rename "_has_quit" attribute to "_quid_issued" (Hanna)
> - Renamed patch 12, simplified the logic in _soft_shutdown a tiny bit.
> - Fixed bad exception handling logic in 13 (Hanna)
> - Introduce a helper in patch 14 to silence log output when it's unwanted.
> - Small addition of _get_greeting() helper in patch 15, coinciding with the
>    new patch 05 here.
> - Contextual changes in 16.
> 
> John Snow (17):
>    python/aqmp: add greeting property to QMPClient
>    python/aqmp: add .empty() method to EventListener
>    python/aqmp: Return cleared events from EventListener.clear()
>    python/aqmp: add send_fd_scm
>    python/aqmp: Add dict conversion method to Greeting object
>    python/aqmp: Reduce severity of EOFError-caused loop terminations
>    python/aqmp: Disable logging messages by default
>    python/qmp: clear events on get_events() call
>    python/qmp: add send_fd_scm directly to QEMUMonitorProtocol
>    python, iotests: remove socket_scm_helper
>    python/machine: remove has_quit argument
>    python/machine: Handle QMP errors on close more meticulously
>    iotests: Accommodate async QMP Exception classes
>    iotests: Conditionally silence certain AQMP errors
>    python/aqmp: Create sync QMP wrapper for iotests
>    python/aqmp: Remove scary message
>    python, iotests: replace qmp with aqmp
> 
>   tests/qemu-iotests/socket_scm_helper.c    | 136 ----------------------
>   python/qemu/aqmp/__init__.py              |  14 +--
>   python/qemu/aqmp/events.py                |  15 ++-
>   python/qemu/aqmp/legacy.py                | 135 +++++++++++++++++++++
>   python/qemu/aqmp/models.py                |  13 +++
>   python/qemu/aqmp/protocol.py              |   7 +-
>   python/qemu/aqmp/qmp_client.py            |  27 +++++
>   python/qemu/machine/machine.py            | 133 +++++++++++----------
>   python/qemu/machine/qtest.py              |   2 -
>   python/qemu/qmp/__init__.py               |  27 +++--
>   python/qemu/qmp/qmp_shell.py              |   1 -
>   scripts/simplebench/bench_block_job.py    |   3 +-
>   tests/Makefile.include                    |   1 -
>   tests/meson.build                         |   4 -
>   tests/qemu-iotests/040                    |   7 +-
>   tests/qemu-iotests/218                    |   2 +-
>   tests/qemu-iotests/255                    |   2 +-
>   tests/qemu-iotests/iotests.py             |  23 +++-
>   tests/qemu-iotests/meson.build            |   5 -
>   tests/qemu-iotests/testenv.py             |   8 +-
>   tests/qemu-iotests/tests/mirror-top-perms |  12 +-
>   21 files changed, 315 insertions(+), 262 deletions(-)
>   delete mode 100644 tests/qemu-iotests/socket_scm_helper.c
>   create mode 100644 python/qemu/aqmp/legacy.py
>   delete mode 100644 tests/qemu-iotests/meson.build
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

apart from the name nit in patch 15.  I would really like this to go in 
and get rid of socket_scm_helper.c!

Paolo


