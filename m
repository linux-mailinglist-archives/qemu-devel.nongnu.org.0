Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F16B4124E78
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 17:57:01 +0100 (CET)
Received: from localhost ([::1]:57342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihcdB-0007a9-2u
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 11:57:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52406)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1ihcbT-0006eI-Qg
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 11:55:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1ihcbS-0006Re-OS
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 11:55:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60860
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1ihcbS-0006Oq-Gz
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 11:55:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576688114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XtaIjN69JN5lg5ft4xTpzgokQQ6pRyYcJxly1JoJQK0=;
 b=ggJf0GiNztU4JrVbNHV9Z3jQf3alARgJWXkAj/IHR4Io2QZL+AKFcnMLsHyHE9q78YMsWs
 3DvXBrFjh04rMS+2KXZAFlPLPbZ3JrsAdclvOVUs7CfnPSNIkW5vrnxPJcsvYtg/Nwsiuc
 G5NnyHz5FXDvObCsVrxcBTn52VMmFjk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-Ab-TjQwAMGq3DxltT2PATA-1; Wed, 18 Dec 2019 11:55:13 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4A80593B1;
 Wed, 18 Dec 2019 16:55:11 +0000 (UTC)
Received: from gondolin (ovpn-117-253.ams2.redhat.com [10.36.117.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F43368886;
 Wed, 18 Dec 2019 16:55:07 +0000 (UTC)
Date: Wed, 18 Dec 2019 17:55:05 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH 1/3] s390x: Properly fetch and test the short psw on
 diag308 subc 0/1
Message-ID: <20191218175505.1f2149cf.cohuck@redhat.com>
In-Reply-To: <20191129142025.21453-2-frankja@linux.ibm.com>
References: <20191129142025.21453-1-frankja@linux.ibm.com>
 <20191129142025.21453-2-frankja@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: Ab-TjQwAMGq3DxltT2PATA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: thuth@redhat.com, david@redhat.com, qemu-devel@nongnu.org,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mihajlov@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Nov 2019 09:20:23 -0500
Janosch Frank <frankja@linux.ibm.com> wrote:

> We need to actually fetch the cpu mask and set it. As we invert the
> short psw indication in the mask, SIE will report a specification
> exception, if it wasn't present in the reset psw.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/cpu.c | 12 ++++++++++--
>  target/s390x/cpu.h |  1 +
>  2 files changed, 11 insertions(+), 2 deletions(-)

Thanks, requeued.


