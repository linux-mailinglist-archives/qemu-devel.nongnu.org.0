Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 271DC147AB5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 10:38:18 +0100 (CET)
Received: from localhost ([::1]:39276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuvPt-0001an-7u
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 04:38:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33568)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iuvP0-0000XY-W4
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 04:37:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iuvP0-0003Aa-43
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 04:37:22 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:26103
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iuvP0-0003AW-0U
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 04:37:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579858641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=PAQkoaLFJr/q1JYWzBg1i7Mp2EbmG0hj85YXoq/pvYk=;
 b=aFy88v1NIT6uQBSj2TzqsmqVoKJU9z05yuRUZB6k8RWKdzmGfcfb3XYMs6W8geNB/UDLiK
 3gqsMx0YihJpgXyw3s843qMMtWrXFlfrmp7Qt/thHbIo7uiq6jRKYaK2HrsyP4260LA/tn
 /LgkXvszNIRnIvNxok4PiSFei6ETR+E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-DDxk2UKnMDuiSVRn_HeLww-1; Fri, 24 Jan 2020 04:37:19 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 062C2107ACC9;
 Fri, 24 Jan 2020 09:37:19 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-156.ams2.redhat.com [10.36.116.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3500F388;
 Fri, 24 Jan 2020 09:37:18 +0000 (UTC)
Subject: Re: [PATCH 3/5] target/s390x: Pass DisasContext to get_field and
 have_field
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20200123232248.1800-1-richard.henderson@linaro.org>
 <20200123232248.1800-4-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <bb352885-d7dc-c07b-7d2b-f6e3f623aa1d@redhat.com>
Date: Fri, 24 Jan 2020 10:37:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200123232248.1800-4-richard.henderson@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: DDxk2UKnMDuiSVRn_HeLww-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/01/2020 00.22, Richard Henderson wrote:
> All callers pass s->fields, so we might as well pass s directly.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/translate.c        | 534 ++++++++++++++--------------
>  target/s390x/translate_vx.inc.c | 609 ++++++++++++++++----------------
>  2 files changed, 569 insertions(+), 574 deletions(-)

Looks like a pretty automated change (apart from translate_one()).

Reviewed-by: Thomas Huth <thuth@redhat.com>


