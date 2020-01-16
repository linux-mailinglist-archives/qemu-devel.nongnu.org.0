Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA6A13DD5E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 15:27:10 +0100 (CET)
Received: from localhost ([::1]:42944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is673-0006U9-3B
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 09:27:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51437)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1is64s-0004b0-Q1
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 09:24:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1is64q-0004sL-0R
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 09:24:54 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:40077)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1is64p-0004lW-FJ; Thu, 16 Jan 2020 09:24:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=IiCaZziZPacMcbVQ9RLheo3fn4G5bGB8e0He/NJ7oBo=; 
 b=CoRONq8qbRFaBenkzgPOOXbWxRzzJaoQKXvq+YmnwA9HidmAd++zLX6HLaNQO3XCY/bmt5xjai8ZS3egQG/W7jvEKld4QLfUNnSa3fLLLpvomMdnBqrU17/lkcikmDM/kAAg6dLX9VUpiiR64z2kWIsX5JRqq/t8n7D6vLHLcvNNP0EcHWGUBxbMODvrIU4+6mXxYGsF9xLL+qpF51x1EqPAu42/gMb7P5K5I19nrfqoGJvozg5SGiLiPaJiCMU8L4oabuxWn1tSFWnM7EfAyf9f80oPTwLkaOArTNj8hv7Blh0u55vcg6fNdNscIoItPykxW/M8EwfeGey4h7wYKQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1is64X-0007QI-F7; Thu, 16 Jan 2020 15:24:33 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1is64W-0003s6-QL; Thu, 16 Jan 2020 15:24:32 +0100
From: Alberto Garcia <berto@igalia.com>
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/4] qcow2: Require that the virtual size is a multiple
 of the sector size
In-Reply-To: <70f3996c-e62d-c560-b7a3-e0653f38493d@redhat.com>
References: <cover.1578596897.git.berto@igalia.com>
 <6a1cfcbb533b487bac96e1d2282ebf210954d27a.1578596897.git.berto@igalia.com>
 <bd6ca991-c2f7-0e27-5bee-07a7c53f8a8e@redhat.com>
 <w51v9peb2dz.fsf@maestria.local.igalia.com>
 <9f7ab60c-c9d4-527b-55dd-40f487a36895@redhat.com>
 <w51sgkib0n3.fsf@maestria.local.igalia.com>
 <70f3996c-e62d-c560-b7a3-e0653f38493d@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Thu, 16 Jan 2020 15:24:32 +0100
Message-ID: <w51a76nfpi7.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: Kevin Wolf <kwolf@redhat.com>, Nir Soffer <nsoffer@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 14 Jan 2020 03:03:31 PM CET, Max Reitz wrote:
>> 3. QEMU can open them but it gets the size wrong.
>
> Yes, but in a safe way.  The user simply doesn=E2=80=99t get access to th=
ose
> 13 bytes.

Ok, I think I'll withdraw the patch then :-)

Berto

