Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB79178D74
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Mar 2020 10:30:50 +0100 (CET)
Received: from localhost ([::1]:59600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9QMb-0003K3-Gl
	for lists+qemu-devel@lfdr.de; Wed, 04 Mar 2020 04:30:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58529)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pkrempa@redhat.com>) id 1j9QLi-0002pB-2D
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 04:29:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pkrempa@redhat.com>) id 1j9QLg-0004MD-V0
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 04:29:53 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42068
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pkrempa@redhat.com>) id 1j9QLg-00042g-NA
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 04:29:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583314176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1zN26ckK2tYerX3rkoFDXv4tnNriq9MOt+tek0s8vMI=;
 b=aMrex76rEy6GVwZA2qZWPsQKkpVGpcdQJqXBPyBf4g3Cc4OtpPa9z6JbiCa1SlO9V3i361
 A1kwZsVdrUT+7wrE/iXJA9bK/AFOP7fU73T9ArIGqtgCYyS9HMcAs29BBDNFGSQK4XS5r5
 Dxu/r9I5Q+zo4Ea/7Wt99OtN0zKi6Tk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-e8iIQpTgOgWb_O4znIVNZw-1; Wed, 04 Mar 2020 04:29:34 -0500
X-MC-Unique: e8iIQpTgOgWb_O4znIVNZw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1137802598;
 Wed,  4 Mar 2020 09:29:33 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.43.2.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B1165E245;
 Wed,  4 Mar 2020 09:29:29 +0000 (UTC)
Date: Wed, 4 Mar 2020 10:29:26 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 0/2] block: bdrv_reopen() with backing file in different
 AioContext
Message-ID: <20200304092926.GA1320660@angien.pipo.sk>
References: <20200227181804.15299-1-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200227181804.15299-1-kwolf@redhat.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: berto@igalia.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 27, 2020 at 19:18:02 +0100, Kevin Wolf wrote:
> Kevin Wolf (2):
>   iotests: Refactor blockdev-reopen test for iothreads
>   block: bdrv_reopen() with backing file in different AioContext

Thanks for the patches. It fixes the problem we've talked about:

Tested-by: Peter Krempa <pkrempa@redhat.com>


