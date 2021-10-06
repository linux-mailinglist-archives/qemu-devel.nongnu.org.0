Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F823423B50
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 12:15:31 +0200 (CEST)
Received: from localhost ([::1]:55904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY3xR-0006Dy-DA
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 06:15:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mY3vP-0005EK-KS
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:13:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mY3vM-0004jz-10
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:13:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633515198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wsK5r8Wkg7gs/VCJsk4ZSA1sPozfzkm0123IOTmeDd4=;
 b=QI5NrQha1jorWMKxxW/k5dmboEqDKfIxfDJnZ+ZgOeMCzm16o3yc0/B/Z7nFNzhj9NANb4
 ylF44ghe9eGo0as6KvndzG894Za9xWXuWco31AdIxEJqWDy+A39ooeJJ5AjZK0GUB46WXh
 0l0saF9YLApx/iqi25lZaKHBmPTHUU0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-4ke6oXGrNv-DgSbIf4beWw-1; Wed, 06 Oct 2021 06:13:17 -0400
X-MC-Unique: 4ke6oXGrNv-DgSbIf4beWw-1
Received: by mail-ed1-f72.google.com with SMTP id
 c7-20020a05640227c700b003d27f41f1d4so2130586ede.16
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 03:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wsK5r8Wkg7gs/VCJsk4ZSA1sPozfzkm0123IOTmeDd4=;
 b=tz2U5gJkoAw08n9b1MiulQGcWsuxLKkFKrBR1Bp7CEHGFkb0NaYRtBhM1v/qOOUNc+
 HLEHNQEpo6sdw7qDFonpx60xeMWJ1KgmQxMA4OGKcEomMmGQK42i6JDwR1z4e+0cJFhn
 KWwBkR86tH28HtYcfO1cCLfV2gz6eOFvUZs5zYcwxZ3mu5Ozm/g1KDnqyEn5txlCg+PF
 fmyHE/eb0uEZfvDllZfi509mOVDus6R3zlMjkKd+2wSEkE7i+omZmgff1giE6XrOqrPO
 skqFgckO7byx2/LE8WCOwOxO1xW2u8UtGuMlNc/p7ut5Q0l/2Yo7JLJbKH1ewzFMiDqZ
 y5Yg==
X-Gm-Message-State: AOAM530U5BeznFxEAoqbQSFLrgb6nP25UKZqzkSI0MFzTiBOUApF40Fo
 IEsC/Zd9KofS7sbriR/WB0pTZHvytvM/2YahQnDlKGg/oTKXUcwyinQEwqEiGQnxNFHhwILs1aL
 XI2uUT3x9jyAbHP8=
X-Received: by 2002:a17:906:b303:: with SMTP id
 n3mr17885638ejz.267.1633515196109; 
 Wed, 06 Oct 2021 03:13:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEE8amYR9eCc9uM0AFLRIOChtBwymOOa5iik+oO4OdkA07lFFW4R5ofNxqNGckT3jyzMzosw==
X-Received: by 2002:a17:906:b303:: with SMTP id
 n3mr17885606ejz.267.1633515195815; 
 Wed, 06 Oct 2021 03:13:15 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id y4sm8700494ejr.101.2021.10.06.03.13.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 03:13:15 -0700 (PDT)
Message-ID: <aea93f68-68ff-b1d0-4966-869c89e7f707@redhat.com>
Date: Wed, 6 Oct 2021 12:13:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 15/17] python/aqmp: Create sync QMP wrapper for iotests
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210923004938.3999963-1-jsnow@redhat.com>
 <20210923004938.3999963-16-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20210923004938.3999963-16-jsnow@redhat.com>
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
> This is a wrapper around the async QMPClient that mimics the old,
> synchronous QEMUMonitorProtocol class. It is designed to be
> interchangeable with the old implementation.
> 
> It does not, however, attempt to mimic Exception compatibility.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> Acked-by: Hanna Reitz <hreitz@redhat.com>

I don't like the name (of course).  qemu-iotests shows that there is a 
use for sync wrappers so, with similar reasoning to patch 16, there's no 
need to scare people away.  Why not just qemu.aqmp.sync?

Paolo

> ---
>   python/qemu/aqmp/legacy.py | 135 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 135 insertions(+)
>   create mode 100644 python/qemu/aqmp/legacy.py
> 
> diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
> new file mode 100644
> index 00000000000..a75dbc599c0
> --- /dev/null
> +++ b/python/qemu/aqmp/legacy.py
> @@ -0,0 +1,135 @@
> +"""
> +Sync QMP Wrapper
> +
> +This class pretends to be qemu.qmp.QEMUMonitorProtocol.
> +"""
> +
> +import asyncio
> +from typing import (
> +    Awaitable,
> +    List,
> +    Optional,
> +    TypeVar,
> +    Union,
> +)
> +
> +import qemu.qmp
> +from qemu.qmp import QMPMessage, QMPReturnValue, SocketAddrT
> +
> +from .qmp_client import QMPClient
> +
> +
> +# pylint: disable=missing-docstring
> +
> +
> +class QEMUMonitorProtocol(qemu.qmp.QEMUMonitorProtocol):
> +    def __init__(self, address: SocketAddrT,
> +                 server: bool = False,
> +                 nickname: Optional[str] = None):
> +
> +        # pylint: disable=super-init-not-called
> +        self._aqmp = QMPClient(nickname)
> +        self._aloop = asyncio.get_event_loop()
> +        self._address = address
> +        self._timeout: Optional[float] = None
> +
> +    _T = TypeVar('_T')
> +
> +    def _sync(
> +            self, future: Awaitable[_T], timeout: Optional[float] = None
> +    ) -> _T:
> +        return self._aloop.run_until_complete(
> +            asyncio.wait_for(future, timeout=timeout)
> +        )
> +
> +    def _get_greeting(self) -> Optional[QMPMessage]:
> +        if self._aqmp.greeting is not None:
> +            # pylint: disable=protected-access
> +            return self._aqmp.greeting._asdict()
> +        return None
> +
> +    # __enter__ and __exit__ need no changes
> +    # parse_address needs no changes
> +
> +    def connect(self, negotiate: bool = True) -> Optional[QMPMessage]:
> +        self._aqmp.await_greeting = negotiate
> +        self._aqmp.negotiate = negotiate
> +
> +        self._sync(
> +            self._aqmp.connect(self._address)
> +        )
> +        return self._get_greeting()
> +
> +    def accept(self, timeout: Optional[float] = 15.0) -> QMPMessage:
> +        self._aqmp.await_greeting = True
> +        self._aqmp.negotiate = True
> +
> +        self._sync(
> +            self._aqmp.accept(self._address),
> +            timeout
> +        )
> +
> +        ret = self._get_greeting()
> +        assert ret is not None
> +        return ret
> +
> +    def cmd_obj(self, qmp_cmd: QMPMessage) -> QMPMessage:
> +        return dict(
> +            self._sync(
> +                # pylint: disable=protected-access
> +
> +                # _raw() isn't a public API, because turning off
> +                # automatic ID assignment is discouraged. For
> +                # compatibility with iotests *only*, do it anyway.
> +                self._aqmp._raw(qmp_cmd, assign_id=False),
> +                self._timeout
> +            )
> +        )
> +
> +    # Default impl of cmd() delegates to cmd_obj
> +
> +    def command(self, cmd: str, **kwds: object) -> QMPReturnValue:
> +        return self._sync(
> +            self._aqmp.execute(cmd, kwds),
> +            self._timeout
> +        )
> +
> +    def pull_event(self,
> +                   wait: Union[bool, float] = False) -> Optional[QMPMessage]:
> +        if wait is False:
> +            # Return None if there's no event ready to go
> +            if self._aqmp.events.empty():
> +                return None
> +
> +        timeout = None
> +        if isinstance(wait, float):
> +            timeout = wait
> +
> +        return dict(
> +            self._sync(
> +                self._aqmp.events.get(),
> +                timeout
> +            )
> +        )
> +
> +    def get_events(self, wait: Union[bool, float] = False) -> List[QMPMessage]:
> +        events = [dict(x) for x in self._aqmp.events.clear()]
> +        if events:
> +            return events
> +
> +        event = self.pull_event(wait)
> +        return [event] if event is not None else []
> +
> +    def clear_events(self) -> None:
> +        self._aqmp.events.clear()
> +
> +    def close(self) -> None:
> +        self._sync(
> +            self._aqmp.disconnect()
> +        )
> +
> +    def settimeout(self, timeout: Optional[float]) -> None:
> +        self._timeout = timeout
> +
> +    def send_fd_scm(self, fd: int) -> None:
> +        self._aqmp.send_fd_scm(fd)
> 


