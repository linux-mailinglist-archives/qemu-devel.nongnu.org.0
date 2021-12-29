Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C90A4811D8
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 12:06:25 +0100 (CET)
Received: from localhost ([::1]:35748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2Wmm-0007zN-6K
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 06:06:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1n2WkF-0006nM-Kq
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 06:03:48 -0500
Received: from rev.ng ([5.9.113.41]:47987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1n2WkA-0004Nz-QM
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 06:03:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vg7IkxHB0P1ax0ICHLuwCsDrYnHeVtQmCf7bE8J+VkI=; b=wPbeWIZVq6ph5iADlnLEcXvn1T
 5uUG3fljNt6l2rBdZRJVjz52sCAMQFue0aZc3cpb+pqPPUdcyeogw5n510mcdreXnExohWe98m72Q
 Vlc/WzetzeVWC6J3Dfjl3NWKSSoJKfyQ6rm2V9CYMpUlzwtjz6VoL19lnY7N13Gh04ec=;
Date: Wed, 29 Dec 2021 12:03:25 +0100
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Brian Cain <bcain@quicinc.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Anton Johansson <qemu-devel@nongnu.org>
Subject: Re: QEMU CI failure of cross-i386-* targets (meson picks wrong glib
 for native target)
Message-ID: <20211229120325.1e593deb@orange>
In-Reply-To: <CABgObfZWaeo2yQLvgHNhA443yqZLtcSusbms8hUafx-KuYXUaA@mail.gmail.com>
References: <20211224113402.6d2d54f9@orange>
 <CABgObfZWaeo2yQLvgHNhA443yqZLtcSusbms8hUafx-KuYXUaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-to:  Alessandro Di Federico <ale@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>

On Fri, 24 Dec 2021 22:25:24 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Is the configure script setting $cross_compile to yes? That will
> decide whether meson getting a --cross-file or a --native-file
> option, and consequently whether it treats the host and build
> machines as equal or different.

=46rom what I can see cross_compile is set only if --cross-prefix is set,
which doesn't seem to be the case for most containers (e.g., s390x)
but not for i386:

    tests/docker/dockerfiles/debian-s390x-cross.docker:ENV QEMU_CONFIGURE_O=
PTS --cross-prefix=3Ds390x-linux-gnu-
    tests/docker/dockerfiles/fedora-i386-cross.docker:ENV QEMU_CONFIGURE_OP=
TS --cpu=3Di386 --disable-vhost-user

I can try to set `--cross-prefix=3Dx86_64-redhat-linux-` but I guess this
will prevent certain tests to run (given the cross-compile environment).

I'll give it a shot.

--=20
Alessandro Di Federico
rev.ng Labs Srl

