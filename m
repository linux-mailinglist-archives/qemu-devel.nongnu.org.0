Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 737053432A1
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Mar 2021 13:56:02 +0100 (CET)
Received: from localhost ([::1]:60704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNxce-0000Ig-Tn
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 08:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>) id 1lNxb9-0008Fq-L9
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 08:54:27 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:33689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>) id 1lNxb7-0000iK-Hd
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 08:54:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=VlRO/q9Nd+cqhknSh9QgUQhyj9h+HOCjfj0Cz8OYE98=; 
 b=NFGvKHzo+3r8l4I8IfhEvMh093pAY9toUjSj3c0ZIbooUwKvK3dx5mRAVHwq/PrdrDxQE1VI52pl/cxofDfRbuBZehhM7ly+vTPXWrZ/GhU3G4NgAhcAUcEcNu+JLJRWBmmlUoOxyvInCLuWFAkQNged7FSzDGPDAML06Pi/aJn8bHQ+3ynWgcH+QAtuCstiyoSkPHZoci+ecuNKo1/iWIpMC+JrSVUpHk7w9mpZ5sy8H6vQPHuzCP0z87aIiR/Vw4NSzParAHt6961MzW20+28F9+D9cPa/cCs9hFhhxkkBfEh5Na6WHI814ytpggwLmHjdGEWjZ13+zQKAMBeAKQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1lNxab-00005w-PC; Sun, 21 Mar 2021 13:53:53 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1lNxab-0007z2-Fq; Sun, 21 Mar 2021 13:53:53 +0100
From: Alberto Garcia <berto@igalia.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] tests/unit/test-block-iothread: fix maybe-uninitialized
 error on GCC 11
In-Reply-To: <20210319112218.49609-1-eesposit@redhat.com>
References: <20210319112218.49609-1-eesposit@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Sun, 21 Mar 2021 13:53:53 +0100
Message-ID: <w51tup4fz1a.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 19 Mar 2021 12:22:18 PM CET, Emanuele Giuseppe Esposito <eesposit@re=
dhat.com> wrote:
> When building qemu with GCC 11, test-block-iothread produces the following
> warning:
>
> ../tests/unit/test-block-iothread.c:148:11: error: =E2=80=98buf=E2=80=99 =
may be used
> uninitialized [-Werror=3Dmaybe-uninitialized]
>
> This is caused by buf[512] left uninitialized and passed to
> bdrv_save_vmstate() that expects a const uint8_t *, so the compiler
> assumes it will be read and expects the parameter to be initialized.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

