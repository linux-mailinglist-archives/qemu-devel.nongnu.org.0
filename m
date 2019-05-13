Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286B71BA88
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 18:02:38 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59587 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQDPR-0000C2-1Z
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 12:02:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1hQDJw-00057S-17
	for qemu-devel@nongnu.org; Mon, 13 May 2019 11:56:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1hQDGA-0002gq-65
	for qemu-devel@nongnu.org; Mon, 13 May 2019 11:53:03 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:59044)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <berto@igalia.com>)
	id 1hQDG7-0002dK-IH; Mon, 13 May 2019 11:53:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
	bh=Q/Vw9NDFO9dgvlEIHA7x7WdDVKxx+5ud2KagsvnvcqY=; 
	b=A8tm14XHM6HejF1UPzfQUYmm0rEhQx/hNazyEapGLEiolui2kP22lNtiQl/XDtpII/l+1l4KOV0Joi+FZWBralLHuk0Emn1EJuSPjDeVnsBBBbDfFAX6n4vYwPW8dwSk61JearGjS6QM9ETepfywJeuTRm0+TG0bLBKgKxxtzA/BocZkTc9OMMppOYH+I4NJeSYVtdhI0FE6UM93kSrSXLxuiOlhO4c4J0i7ADPtDpi4JURjUHCabTC+daCh4RAMMDckDVoPGWfQIiSJY7MIwV8q0UfrQNio8wqALLuP+LQ7k8wF43/aoyZ64O2h106KC+UsrN6jI9WtArvYDyE2wg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1hQDG4-0001S8-Gy; Mon, 13 May 2019 17:52:56 +0200
Received: from berto by mail.igalia.com with local (Exim)
	id 1hQDG4-0003Tz-E9; Mon, 13 May 2019 17:52:56 +0200
From: Alberto Garcia <berto@igalia.com>
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
In-Reply-To: <5783a050-5866-80d5-4699-7ea0bf122398@redhat.com>
References: <cover.1557754872.git.berto@igalia.com>
	<20dfb3d9ccec559cdd1a9690146abad5d204a186.1557754872.git.berto@igalia.com>
	<5783a050-5866-80d5-4699-7ea0bf122398@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
	(i586-pc-linux-gnu)
Date: Mon, 13 May 2019 17:52:56 +0200
Message-ID: <w51r292pd0n.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: Re: [Qemu-devel] [PATCH v3 2/2] block: Make
 bdrv_root_attach_child() unref child_bs on failure
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon 13 May 2019 04:31:16 PM CEST, Max Reitz wrote:
>> @@ -2569,10 +2582,6 @@ BdrvChild *bdrv_open_child(const char *filename,
>>      }
>>  
>>      c = bdrv_attach_child(parent, bs, bdref_key, child_role, errp);
>> -    if (!c) {
>> -        bdrv_unref(bs);
>> -        return NULL;
>> -    }
>>  
>>      return c;
>>  }
>
> (That could have been simplified even further. *shrug*)

Right, we can remove the 'c' variable altogether. Feel free to edit the
commit if you want.

Berto

