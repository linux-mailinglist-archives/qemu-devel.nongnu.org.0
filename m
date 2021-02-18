Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62FD31F131
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 21:42:49 +0100 (CET)
Received: from localhost ([::1]:41200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCq8O-0004aP-Lv
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 15:42:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lCq5y-0002ps-89
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:40:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lCq5r-0003Iy-Ub
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:40:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613680810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Xk4mLZB3AoGIFDMkioVWEUTSYxLdO+t8P68CJVAkME=;
 b=aeyB9VWM3m9gQ/4fY/9HirHiOMMITdLc1rYAx09oIFMMBF1IKnEMaEz3GV/7zthianiu/8
 RNJ+sjLV45brkpDRLN6DTpQ/Grrq/Y9yzYAbYHG9gxBTYySsw1AZwtgwcMA+YXChWxNrON
 q4L1n2abidl6xpDuqXY8hjq8JDhgKmc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-vwRpdStOPduGSEwBl5zABQ-1; Thu, 18 Feb 2021 15:40:06 -0500
X-MC-Unique: vwRpdStOPduGSEwBl5zABQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CA99100CCC1;
 Thu, 18 Feb 2021 20:40:05 +0000 (UTC)
Received: from [10.3.113.156] (ovpn-113-156.phx2.redhat.com [10.3.113.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29ECD100164C;
 Thu, 18 Feb 2021 20:40:05 +0000 (UTC)
Subject: Re: [PATCH 0/5] Obey NBD spec regarding block size bounds on reply
To: qemu-devel@nongnu.org
References: <161368042753.24083.12629784076159744291@c667a6b167f6>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ef69c1ab-d649-6aea-3360-3b8385544e94@redhat.com>
Date: Thu, 18 Feb 2021 14:40:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <161368042753.24083.12629784076159744291@c667a6b167f6>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/21 2:33 PM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20210218201528.127099-1-eblake@redhat.com/
> 
> 
> 
> Hi,
> 
> This series seems to have some coding style problems. See output below for
> more information:
> 

> 5/5 Checking commit 7be641fea748 (do not apply: Revert "nbd-client: Work around server BLOCK_STATUS misalignment at EOF")
> ERROR: Missing Signed-off-by: line(s)

Intentional since patch 5 is not part of the final series. (actually,
you can apply patch 5 first to see failures, then 1-4 to see how the
failures are fixed even without the interference of client-side
workarounds).  But at the end of the day, once 1-4 are upstream, we want
to keep the client-side workarounds for communication with older qemu or
with other NBD servers that have a similar compliance problem as what
gets fixed here.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


