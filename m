Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24532102267
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 11:57:38 +0100 (CET)
Received: from localhost ([::1]:43836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iX1CS-0000N0-Sr
	for lists+qemu-devel@lfdr.de; Tue, 19 Nov 2019 05:57:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43556)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iX1Ax-0007YC-Hf
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 05:56:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iX1Aw-0005D0-F5
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 05:56:03 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41994
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iX1Aw-00059y-Ae
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 05:56:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574160958;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BTFyNnF4Uu4j19grsGMJ332l9oU2INSRkL8BbD7+NPA=;
 b=KQrAkV/FiQ+thTjXgnGSoFTESE3N909/UOXNM8Q0EpGsemwq4kvBSof0hbwECYTbsR2nk0
 UM+eGzlxCY9RQqLUsAmU1OyWegfGnO2gUbV/g1PkZvfCcsmnYEb0GhKAWofpoje35VcEfB
 S+Oik7RrGSEfd+T1GkGoZqPWAgn2uhw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-Of8LyRfYOESiDQCeJmXSDA-1; Tue, 19 Nov 2019 05:55:57 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A08A477;
 Tue, 19 Nov 2019 10:55:56 +0000 (UTC)
Received: from redhat.com (ovpn-116-161.ams2.redhat.com [10.36.116.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C22E810002B8;
 Tue, 19 Nov 2019 10:55:55 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Subject: Re: [PATCH 2/2] migration/multifd: not use multifd during postcopy
In-Reply-To: <20191025232000.25857-3-richardw.yang@linux.intel.com> (Wei
 Yang's message of "Sat, 26 Oct 2019 07:20:00 +0800")
References: <20191025232000.25857-1-richardw.yang@linux.intel.com>
 <20191025232000.25857-3-richardw.yang@linux.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Tue, 19 Nov 2019 11:55:52 +0100
Message-ID: <87d0dogmo7.fsf@trasno.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Of8LyRfYOESiDQCeJmXSDA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Reply-To: quintela@redhat.com
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wei Yang <richardw.yang@linux.intel.com> wrote:
> We don't support multifd during postcopy, but user still could enable
> both multifd and postcopy. This leads to migration failure.
>
> Skip multifd during postcopy.
>
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

I was working in a different implementation, but I agree with the idea.

My patch series try to decide during negotiation if multifd + everything
else is setup or not.

Thanks, Juan.


