Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C45344992
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:47:44 +0100 (CET)
Received: from localhost ([::1]:59344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOMmN-0005xu-8n
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lOMiR-0002ed-8e
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:43:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lOMiM-0006A1-Bl
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:43:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616427813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SFm0GcxookWsphFG0ePmcmSdxn0t+IIg/1U+TFZKakw=;
 b=eEIHVlleH6NlurkKUnrasMQzTzJLnHGCU45Ow2wgQrik+dSmZHon7cPxq8Q05k2ilwCOZL
 L3QKlSJeUpyq/ZZ10GM2ZlxdUGjCY8QoGn/DY8qb2v8LZ7sG0sEAsKbZkW1jIqKYl0AMXE
 VBcEz7HN0kxM5o6EDkUZuX5GBxEMcy0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-odrpU44cNGmR6iI2Ue7-3A-1; Mon, 22 Mar 2021 11:43:31 -0400
X-MC-Unique: odrpU44cNGmR6iI2Ue7-3A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E59A10866A5;
 Mon, 22 Mar 2021 15:43:30 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-125.ams2.redhat.com [10.36.115.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E64E10023AB;
 Mon, 22 Mar 2021 15:43:29 +0000 (UTC)
Date: Mon, 22 Mar 2021 16:43:27 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Patrik =?utf-8?B?SmFub3XFoWVr?= <pj@patrikjanousek.cz>
Subject: Re: [PATCH 1/2] block/raw: added support of persistent dirty bitmaps
Message-ID: <YFi7HyjWXtYHOFe5@merkur.fritz.box>
References: <20210320093235.461485-1-pj@patrikjanousek.cz>
 <20210320093235.461485-2-pj@patrikjanousek.cz>
MIME-Version: 1.0
In-Reply-To: <20210320093235.461485-2-pj@patrikjanousek.cz>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, lmatejka@kiv.zcu.cz
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 20.03.2021 um 10:32 hat Patrik Janoušek geschrieben:
> Current implementation of dirty bitmaps for raw format is very
> limited, because those bitmaps cannot be persistent. Basically it
> makes sense, because the raw format doesn't have space where could
> be dirty bitmap stored when QEMU is offline. This patch solves it
> by storing content of every dirty bitmap in separate file on the
> host filesystem.
> 
> However, this only solves one part of the problem. We also have to
> store information about the existence of the dirty bitmap. This is
> solved by adding custom options, that stores all required metadata
> about dirty bitmap (filename where is the bitmap stored on the
> host filesystem, granularity, persistence, etc.).
> 
> Signed-off-by: Patrik Janoušek <pj@patrikjanousek.cz>

I'm not sure if you're going to try to change your thesis to use qcow2
with an external data file, but in case you're still using this patch
for your thesis, let's imagine for a moment that we all agreed on adding
the functionality to raw.

After skimming over the patch, I see two major things that we would ask
to change:

1. You need to change BlockdevOptions to the QAPI schema in
   qapi/block-core.json, because if you don't add new options there,
   they won't be accessible with -blockdev and QMP blockdev-add.

   Among others, this means you would describe RawDirtyBitmapOpts in the
   schema and would get the structure and some helpers automatically
   generated, simplifying your code.

   Instead of processing QemuOpts manually, I would then probably try to
   use the QAPI visitors to get RawDirtyBitmapOpts from the input, which
   could potentially further simplify the code.

2. Instead of having a 'filename': 'str' option and working on the
   bitmap files with stdio.h functions (which block the guest instead of
   allowing asynchronous operation in the background), we would probably
   want something like 'file': 'BlockdevRef', so you get another
   BlockDriverState for each bitmap file that you access with the normal
   QEMU block layer I/O functions.

   The advantage is not only that this isn't blocking, but it also
   allows you to configure more details than just the filename (think
   cache mode, AIO mode, locking, etc.). In fact, it would even allow
   you to store the metadata not in a file, but in any place that can be
   accessed with a protocol supported by QEMU (like NBD, iscsi, ssh,
   whatever).

Kevin


