Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E082F203480
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 12:06:44 +0200 (CEST)
Received: from localhost ([::1]:41816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnJLg-0004fm-0a
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 06:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jnJKp-0004FH-Aa
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 06:05:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40782
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jnJKn-0007la-O9
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 06:05:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592820349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=ndorFcfGR0uGc+Ip/ykMoDaRHSK8cDkN5OEk3EvCxDs=;
 b=ASEXxAyRzmq8ZH44XUpHlLfeWHOQi1T1080NW5EkKpo0m0hNAt1OcFR/kKquh0lq/gEGHb
 QziiezRiM1RbXhQstUvHntpx/UTdHjXyrRBlT+EUP2bEQQhaZE1dlJzhsJaN6J713LoAOU
 JIEVBgHo5jrgcKNg3EVnTkwynvdADM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-SS8-TH9XPzKVzCGd7cntyA-1; Mon, 22 Jun 2020 06:05:47 -0400
X-MC-Unique: SS8-TH9XPzKVzCGd7cntyA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A68A835B49;
 Mon, 22 Jun 2020 10:05:46 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-125.ams2.redhat.com [10.36.112.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE2F87CCC0;
 Mon, 22 Jun 2020 10:05:44 +0000 (UTC)
Subject: Re: [PATCH v4 3/9] pc-bios: s390x: Move sleep and yield to helper.h
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20200622074235.32528-1-frankja@linux.ibm.com>
 <20200622074235.32528-4-frankja@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <bd7a098c-92a7-bb5c-b1c7-722c02f93495@redhat.com>
Date: Mon, 22 Jun 2020 12:05:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200622074235.32528-4-frankja@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 01:27:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/06/2020 09.42, Janosch Frank wrote:
> They are definitely helper functions.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
>  pc-bios/s390-ccw/helper.h      | 17 +++++++++++++++++
>  pc-bios/s390-ccw/s390-ccw.h    | 18 ------------------
>  pc-bios/s390-ccw/virtio-net.c  |  1 +
>  pc-bios/s390-ccw/virtio-scsi.c |  1 +
>  4 files changed, 19 insertions(+), 18 deletions(-)
Reviewed-by: Thomas Huth <thuth@redhat.com>


