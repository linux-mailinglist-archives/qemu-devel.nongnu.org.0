Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0333274F6
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 23:46:54 +0100 (CET)
Received: from localhost ([::1]:32974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGUpx-0003J9-1h
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 17:46:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lGUnZ-0002HJ-PW
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 17:44:25 -0500
Received: from hera.aquilenet.fr ([185.233.100.1]:34344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lGUnY-0006pm-AO
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 17:44:25 -0500
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id F0A8A34C;
 Sun, 28 Feb 2021 23:44:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lr73M0_8uJwh; Sun, 28 Feb 2021 23:44:21 +0100 (CET)
Received: from begin.home (unknown
 [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 31486F8;
 Sun, 28 Feb 2021 23:44:21 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.94)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1lGUnT-001l5d-P7; Sun, 28 Feb 2021 23:44:19 +0100
Date: Sun, 28 Feb 2021 23:44:19 +0100
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Doug Evans <dje@google.com>
Subject: Re: [PATCH v2 1/2] net/slirp.c: Refactor address parsing
Message-ID: <20210228224419.mcbyhs67d3e7pjyi@begin>
References: <20210203213729.1940893-1-dje@google.com>
 <20210203213729.1940893-2-dje@google.com>
 <fc97283f-51ca-2a2d-d8ae-1345b990e52c@redhat.com>
 <CADPb22TSNA-KQmUO0hSGLtWr0tc7H5++gKBAqnpTP-5iarisMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADPb22TSNA-KQmUO0hSGLtWr0tc7H5++gKBAqnpTP-5iarisMA@mail.gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: F0A8A34C
X-Spamd-Result: default: False [-2.50 / 15.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; HAS_ORG_HEADER(0.00)[];
 RCVD_COUNT_THREE(0.00)[3]; TO_DN_ALL(0.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MID_RHS_NOT_FQDN(0.50)[]; BAYES_HAM(-3.00)[100.00%]
Received-SPF: softfail client-ip=185.233.100.1;
 envelope-from=samuel.thibault@gnu.org; helo=hera.aquilenet.fr
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Doug Evans, le lun. 08 févr. 2021 10:59:01 -0800, a ecrit:
> Samuel, how do qemu patches involving libslirp changes usually work?

Well, we haven't had many yet actually :)

> Should I have held off submitting the qemu patch until the libslirp
> prerequisite has been added to qemu's tree,

No, as this example shows, there are iterations that can happen on the
qemu side before we have something we can commit, so better do both in
parallel.

I don't know what qemu people think about the slirp submodule: do qemu
prefers to only track stable branchs, or would it be fine to track the
master branch? I guess you'd prefer to have a slirp stable release you
can depend on when releasing qemu, so perhaps better wait for a slirp
release before bumping in qemu, just to be safe? Which doesn't mean
avoiding submitting patchqueues that depend on it before that, better go
in parallel.

> or maybe I should include the libslirp patch so that people can at least apply
> it (with a caveat saying the patch is already in libslirp.git) until it's added
> to the qemu tree?

Not sure what is best here. We at least need something so that people
are not confused by the patchqueue calling some function that doesn't
exist in the submodule yet.

Samuel

