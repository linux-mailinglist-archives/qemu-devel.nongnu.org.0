Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06361626FB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 14:16:49 +0100 (CET)
Received: from localhost ([::1]:34728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j42k4-0000jI-PO
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 08:16:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43157)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1j42aE-00026M-CT
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 08:06:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1j42aD-0003sS-F6
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 08:06:38 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55507
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1j42aD-0003qc-B9
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 08:06:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582031196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PAX5FfzVgRq8oQsaTELtjwPMrQPpGT01uNPHkzoksKU=;
 b=E3DQT/hc0jNAZRfFQrSnz6e5ng9jt6/UhOn+rrhpNpF5zaS9IE1sdZ4Srdi+pBcfeb8w/s
 W+ljygmMvgXWylaoaknkYHq7cFiZAFpRg+381qa3Ee7Ksb6/KvoTCXG+UMkEGQGeF9eKXt
 K3QzwyTvZuaV/cRWzulUwSTup4WeXig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-7_UALgioNk6rjpNjb1TuCQ-1; Tue, 18 Feb 2020 08:06:34 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B12218B9FC1;
 Tue, 18 Feb 2020 13:06:32 +0000 (UTC)
Received: from [10.3.116.180] (ovpn-116-180.phx2.redhat.com [10.3.116.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31D8F60C80;
 Tue, 18 Feb 2020 13:06:32 +0000 (UTC)
Subject: Re: [PATCH v3 04/33] block: Add BdrvChildRole to BdrvChild
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20200218124242.584644-1-mreitz@redhat.com>
 <20200218124242.584644-5-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <37c08cce-d953-4f27-8fdc-c9046435d272@redhat.com>
Date: Tue, 18 Feb 2020 07:06:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200218124242.584644-5-mreitz@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 7_UALgioNk6rjpNjb1TuCQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/20 6:42 AM, Max Reitz wrote:
> For now, it is always set to 0.  Later patches in this series will
> ensure that all callers pass an appropriate combination of flags.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---

>   31 files changed, 62 insertions(+), 49 deletions(-)

Mostly mechanical, and the differences from v2 stem from the type 
changes in patch 3.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


