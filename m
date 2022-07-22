Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDC257E5A6
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 19:32:48 +0200 (CEST)
Received: from localhost ([::1]:33050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEwW6-0002eP-P2
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 13:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oEwTG-0000hR-G0
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 13:29:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oEwTC-00069T-H4
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 13:29:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658510983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=yUHhGfdpuasrm32xobCTURb1WCOkySqm+EqJUmjHS0k=;
 b=T/6kaH286B7c/hK3KM28gvNiANOC4PgOZua8PL2s1259h+NdX0gNGbY9a44nOf4wR0Bz3a
 qHAPF+7Nk+3zjdwrX9QtdNpPj6ZK8LfEOTioQhJmUaO02g4P4WUZZ17o49hYlwE5eJz96J
 GHIIn+mZcz3FtNhMnUO7jQJWxNiPVOY=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-vgxz-InIOLWTMEXcNz9ncg-1; Fri, 22 Jul 2022 13:29:36 -0400
X-MC-Unique: vgxz-InIOLWTMEXcNz9ncg-1
Received: by mail-vs1-f70.google.com with SMTP id
 o7-20020a677307000000b0035743c045b7so370726vsc.8
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 10:29:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=yUHhGfdpuasrm32xobCTURb1WCOkySqm+EqJUmjHS0k=;
 b=7J5elCt4KujtuwOUXDhoNAgCK2tMiEL4hnLaGFtNr2m07b8K2r5eqQGZ5POb7Hfg9d
 Uu5p5xQZ7I4WMkkPnIxInlMIicOHobbVDxnFo2Fw1Gb+aQDEKtd48ZJy5XRF0ZlmjNCL
 JxECbcXkaID1OrFCFm8eThf40++wRWbajGnTLuVaBKQHH9PiBBjZxY34AaNcgFjQ10Ro
 M+TMD+4VfHfYrUxdley6rQmQhpNFIcNXKS2dbbBY5cieBuMHKCkf3nh7fdwK9p8DUY09
 DMihcbrNhdOzNvsp99H/F/jYrq4bSnM6bHW7AVVbnAbq7J49Pq4EG3UCKSll84Lsu4tz
 I8jw==
X-Gm-Message-State: AJIora8HE5ke1jG6D7LgNszTSdjdHBAxjwt7beyAA7R1waDmHK1WvUwQ
 2HiFzv06sVbVUsQxfaWFEvvaj3UzcIqK5N0wFP2EEs3G6SN8gAKbatozM+sDGc11iMAzSt0TD+A
 JEhb4c+mVnbPqT4dPvEjrk+xfP/7IWiM=
X-Received: by 2002:ab0:59e6:0:b0:383:6c3d:a6d5 with SMTP id
 k35-20020ab059e6000000b003836c3da6d5mr452742uad.100.1658510975782; 
 Fri, 22 Jul 2022 10:29:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1unk6BbNLwAqEd7QbPVywbJpUvgMvFxLE4bs+7w+oteQoaG9OLW1XwELWQ0O+tuwmDv6IO53YILHvfmbCD7h84=
X-Received: by 2002:ab0:59e6:0:b0:383:6c3d:a6d5 with SMTP id
 k35-20020ab059e6000000b003836c3da6d5mr452738uad.100.1658510975477; Fri, 22
 Jul 2022 10:29:35 -0700 (PDT)
MIME-Version: 1.0
From: John Snow <jsnow@redhat.com>
Date: Fri, 22 Jul 2022 13:29:24 -0400
Message-ID: <CAFn=p-ZX-sSpKw-5D-rdwPZ1fbdE=X0VagwoSTVbtQUO_45Vpw@mail.gmail.com>
Subject: Python package qemu.qmp v0.0.1 released
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm pleased to announce the very first version of the standalone QMP
library for Python, "qemu.qmp".

PyPI: https://pypi.org/project/qemu.qmp/
Docs: https://qemu-project.gitlab.io/python-qemu-qmp/
Source: https://gitlab.com/qemu-project/python-qemu-qmp

This library is identical to the one currently in the QEMU repo, with
a generous helping of extra GitLab CI rules and PyPI packaging
scripts. In 2021, the QMP library originally written by Luiz
Capitulino was re-written from the ground up to include native support
for Python asyncio, which brings along with it some new features and
characteristics:

- Full, native support for Python asyncio
- True asynchronous event handling and full-duplex communication
- Arbitrary numbers of separate event-handling queues (EventListener objects)
- Support for out-of-band execution
- Continued support for QEMU Guest Agent
- Robust error detection and error reporting mechanisms
- Semantic error classes for simplified client writing
- Extensible callback hooks for logging and rewriting I/O messages
- Support for Python 3.6 through the upcoming Python 3.11
- Unit testing of the library itself provided by Avocado Framework
- Compatibility with Luiz's QMP library provided by a synchronous shim class
- Fully statically typed using Python 3.6 type hints and validated with mypy
- PEP 561 compliant export of static typing information for client packages
- Rigorously documented API, including all error pathways and exceptions
- *Zero* mandatory dependencies! This is all Python stdlib native.
- LGPLv2+ license for easier external integration.
- Fully self-contained repository with all publishing and packaging
scripts included.
- qmp-shell and qmp-shell-wrap convenience/debugging utilities are included
- An early alpha version of qmp-tui which has support for displaying
asynchronous events is also included. This is the version authored by
Niteesh for Summer 2021's GSoC session.
- Extensible "AsyncProtocol" class that can be used to implement QTEST
or other full-duplex, asynchronous message-based protocols.
- Native GitLab merge request contributor workflow for ease of
contribution by newer, casual contributors. Merge request
announcements are automatically relayed to the qemu-devel list via
GitLab webhook integrations so that core QEMU developers don't miss
out on development activity.

Cool, in my opinion! This library has been the provider of QMP support
for all of our Python tests in qemu.git for about two releases now, so
we've already been using it for some time. I would be flattered if you
didn't even notice.

Some other features that are in a draft state and need polish, docs,
and review, but do exist;

- A fully statically typed implementation of the qtest protocol built
on top of AsyncProtocol
- An extensible implementation of a complete QMP server, useful for
acting as a debugging proxy to a QMP server, unit testing of the QMP
library itself, or for more meticulous unit testing of other QMP
clients.

With the first official release of this library now published,
attention will shift to integrating this library back into qemu.git,
ensuring that both internal and external projects benefit from the
same library.

Please check out the README visible from PyPI, the source repository,
or the documentation site for more information; see the issue tracker
for pending issues and enhancements, or refer to the project
milestones on GitLab[1] for future roadmap information on this
mini-project.

Thanks to everyone that helped get to this point; in no particular
order: Luiz, Hanna, Kevin, Vladimir, Kashyap, Eduardo, Cleber, Daniel,
Niteesh, Willian, Beraldo, Wainer, Thomas, Eric, Paolo, Stefan,
Andrea, and Victor. Thanks to my friends outside of work for their
help, too; thanks Mike J.!

Enjoy!

--John Snow

[1] https://gitlab.com/qemu-project/python-qemu-qmp/-/milestones


