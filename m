Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B0D40975A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 17:31:51 +0200 (CEST)
Received: from localhost ([::1]:54918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPnvy-00027r-CH
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 11:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mPntP-0007vZ-Be
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:29:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mPntN-00035V-OY
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:29:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631546949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bV67086Hh6Vlhgaq+DBJ+sUfNBkPM+/YTgi4lkHj5fA=;
 b=SLsBgP/p0U4uTaD7eflzpmSkIxTwoW+nOvu11oRSatnxueR2ptOly9Y9P7rXTh64XoXZa6
 rMaM2wvEEiiWXRGWKmr8/HzGdWyN7FHNU8KmL7wrfpEgKK0RDcVMT7oNte49VrvLpavaMG
 ghiw3jzk6FG2UVyszj2PfhyIJWQeBog=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-FYKJ7YnWMyiLyKVIm2G3tg-1; Mon, 13 Sep 2021 11:29:07 -0400
X-MC-Unique: FYKJ7YnWMyiLyKVIm2G3tg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBC8757220
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 15:29:06 +0000 (UTC)
Received: from redhat.com (ovpn-113-222.phx2.redhat.com [10.3.113.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32A2C5D9D3;
 Mon, 13 Sep 2021 15:29:00 +0000 (UTC)
Date: Mon, 13 Sep 2021 10:28:58 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 17/22] tests/qapi-schema: Rewrite simple union
 TestIfUnion to be flat
Message-ID: <20210913152858.pgb2i5n367cuj4z5@redhat.com>
References: <20210913123932.3306639-1-armbru@redhat.com>
 <20210913123932.3306639-18-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210913123932.3306639-18-armbru@redhat.com>
User-Agent: NeoMutt/20210205-772-2b4c52
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 13, 2021 at 02:39:27PM +0200, Markus Armbruster wrote:
> Simple unions predate flat unions.  Having both complicates the QAPI
> schema language and the QAPI generator.  We haven't been using simple
> unions in new code for a long time, because they are less flexible and
> somewhat awkward on the wire.
> 
> To prepare for their removal, rewrite TestIfUnion to be flat.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  tests/qapi-schema/qapi-schema-test.json |  4 +++-
>  tests/qapi-schema/qapi-schema-test.out  | 16 ++++++----------
>  2 files changed, 9 insertions(+), 11 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


