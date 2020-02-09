Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC030156C3E
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Feb 2020 20:29:24 +0100 (CET)
Received: from localhost ([::1]:53890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j0sGh-0000GF-Bf
	for lists+qemu-devel@lfdr.de; Sun, 09 Feb 2020 14:29:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56557)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1j0sFx-0007nq-8i
 for qemu-devel@nongnu.org; Sun, 09 Feb 2020 14:28:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1j0sFw-0004ft-4X
 for qemu-devel@nongnu.org; Sun, 09 Feb 2020 14:28:36 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:41856)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1j0sFv-0004MW-Hk; Sun, 09 Feb 2020 14:28:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=fQ4ScEg0FAWouo+l0ERsQRaLMWRR7pED2tAq/pxgh78=; 
 b=D3mCwpSoXfKa93fxrOSpb2sEXEc3D82Z24pngq4KFJ75H7e25HB2wai/kIA/FxaV78+Wi54Dvt4YOVWuVwID6bGFnOW3jMqMubybnOT919qIvw3+wM2WGPc51dmcBcFcLjwEzZIBq3IbiTn0ZVWgJF8tVyrEPEdFikFg4vUp/CZttvd+AWEpS3yXpZJRcPbRxbftPwG6/1D0tf2gQP95xQMzdgh3KeNE90+kqmvGy2KgxeYDOK4XkCBWN50F/5r129xlbc6Al3mTAOa+L2DhQIlhcEJZ/wFhZiLtWnphjB0lWFWLG54A9uZufzQTv/hPktqORAgmNCOnp0+SwFxDVA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1j0sFb-0002oq-7N; Sun, 09 Feb 2020 20:28:15 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1j0sFa-00064B-Tm; Sun, 09 Feb 2020 20:28:14 +0100
From: Alberto Garcia <berto@igalia.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 03/17] qcow2: Avoid feature name extension on small
 cluster size
In-Reply-To: <20200131174436.2961874-4-eblake@redhat.com>
References: <20200131174436.2961874-1-eblake@redhat.com>
 <20200131174436.2961874-4-eblake@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Sun, 09 Feb 2020 20:28:14 +0100
Message-ID: <w51tv3z8ss1.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: david.edmondson@oracle.com, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 31 Jan 2020 06:44:22 PM CET, Eric Blake wrote:
> As the feature name table can be quite large (over 9k if all 64 bits
> of all three feature fields have names; a mere 8 features leaves only
> 8 bytes for a backing file name in a 512-byte cluster), it is unwise
> to emit this optional header in images with small cluster sizes.
>
> Update iotest 036 to skip running on small cluster sizes; meanwhile,
> note that iotest 061 never passed on alternative cluster sizes
> (however, I limited this patch to tests with output affected by adding
> feature names, rather than auditing for other tests that are not
> robust to alternative cluster sizes).
>
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

