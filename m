Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A54261EC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 12:36:38 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39916 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTObt-0004ke-SX
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 06:36:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1hTOap-0004Lv-97
	for qemu-devel@nongnu.org; Wed, 22 May 2019 06:35:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1hTOah-00012S-Kw
	for qemu-devel@nongnu.org; Wed, 22 May 2019 06:35:29 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:50206)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <berto@igalia.com>)
	id 1hTOad-0000bY-Lf; Wed, 22 May 2019 06:35:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
	bh=WyXmTSQNbQVfuDM5WN0gwF10cafK+wT5tnr2IVnR1UQ=; 
	b=eJuenfu9FbrVy1U/JDKU5EupSnKynRG7dY3bGeHWuwOrStGbnwtWhLSYzK/dk74lRt6RhIerFaXH+oXQwSHSH3cY0hdUDOW2nYnbliqyoD/dsFavvXrQ7Fu6tc/bBmG0YUu2euTfbV4wqFK0F23Cc7/wWOKwizNY5dASnTq0YQVtrsmNyiEzgdZaagEJnuiOBrT2AbbgC1D+lxLCWdKdHbY3HrMAdCoY21iLgJzQ6ye2Mxaf7/iAPVCbbWUOwRWjNb+WE2LdFzQVuz4xcqCJLSgkv6cFJGJteVfnG3mzMm7M68Ds8+dk6cydEBqRd5Mdz42b+ZwDRm4u2XCJQqAL4g==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1hTOaH-0002Fm-4T; Wed, 22 May 2019 12:34:57 +0200
Received: from berto by mail.igalia.com with local (Exim)
	id 1hTOaH-0004kr-1l; Wed, 22 May 2019 12:34:57 +0200
From: Alberto Garcia <berto@igalia.com>
To: Denis Plotnikov <dplotnikov@virtuozzo.com>, eblake@redhat.com,
	kwolf@redhat.com, mreitz@redhat.com
In-Reply-To: <20190520062023.11599-1-dplotnikov@virtuozzo.com>
References: <20190520062023.11599-1-dplotnikov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
	(i586-pc-linux-gnu)
Date: Wed, 22 May 2019 12:34:57 +0200
Message-ID: <w51ftp6g4ku.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH v2] [RFC] qcow2: add
 compression type feature
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, den@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon 20 May 2019 08:20:23 AM CEST, Denis Plotnikov wrote:
> +    /* Compression type extension */
> +    if (s->compression_type != 0) {
> +        Qcow2CompressionTypeExt comp_header = {
> +            .compression_type = cpu_to_be32(s->compression_type),
> +        };

Shouldn't we have an enum to define the available compression types
instead of using numeric constants in the code?

> +== Compression type extension ==
> +
> +The compression type extension is an optional header extension. It stores the
> +ID of the compressor which has to be used to compress/decompress disk clusters.
> +A single compression type is applied to all compressed disk clusters,

s/the ID of the compressor/the ID of the compression algorithm/

> +Available compression types:
> +    ID    0: Invalid value
> +          1: ZSTD

Why is 0 invalid ?

Also: do we need a way to define the compression level?

Berto

