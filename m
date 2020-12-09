Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D93752D483F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:50:25 +0100 (CET)
Received: from localhost ([::1]:34582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3ba-0000Ul-Fj
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:50:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kn3MS-0003cx-PZ; Wed, 09 Dec 2020 12:34:44 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:33210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kn3MP-0004Sd-Jo; Wed, 09 Dec 2020 12:34:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=7mXgug0gsETKiFMN0CvyY1yT9JRqi0g+U9qse7pbKgY=; 
 b=o9yTWGmN7jnk6kEtkMgb1UPgWFTadqzspmumY24O2Q62Rji6IYswEpeN7kTQjq3FK14t3NpmahI/zSGweZIpEMNBmx+Z2iWE9+M9Foi6/USw1KXGsy0kkrdUh+3hc0XspgGDIeTMhr109Q8c1ix0dafibJszIf1sLuMWwKECT7qZ/sVIhRKh0Q5/rYM8hMlT2el0GcDNreNJU3nKN2PIo+gjBDMDpMRDFQmQpeGjt89Z8Cyscn+D6LJa+vey7esDjltY7hAwzqZ+w6gnE9XNiiOuwdyeBDc9vNknYKjuLjuTCArlCMVEn88ZB0OjUKQ6yRgGB6QTDXvPKrnrfZ+/Jg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kn3M1-0005JC-CW; Wed, 09 Dec 2020 18:34:17 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1kn3M1-0002g2-2B; Wed, 09 Dec 2020 18:34:17 +0100
From: Alberto Garcia <berto@igalia.com>
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 2/4] block: add bdrv_co_delete_file_noerr
In-Reply-To: <20201209164441.867945-3-mlevitsk@redhat.com>
References: <20201209164441.867945-1-mlevitsk@redhat.com>
 <20201209164441.867945-3-mlevitsk@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 09 Dec 2020 18:34:17 +0100
Message-ID: <w51pn3inasm.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed 09 Dec 2020 05:44:39 PM CET, Maxim Levitsky wrote:
> +void coroutine_fn bdrv_co_delete_file_noerr(BlockDriverState *bs)
> +{
> +    Error *local_err = NULL;
> +
> +    if (!bs) {
> +        return;
> +    }
> +
> +    int ret = bdrv_co_delete_file(bs, &local_err);
       ^^^

According to the QEMU coding style we should not have declarations in
the middle of a block.

The patch looks otherwise fine.

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

