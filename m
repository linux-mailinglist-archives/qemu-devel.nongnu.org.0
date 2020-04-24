Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542071B6B3D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 04:21:18 +0200 (CEST)
Received: from localhost ([::1]:47308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRnxt-0005K6-Cl
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 22:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42396)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1jRnwl-0004b8-LC
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 22:20:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1jRnwj-0004Ol-L2
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 22:20:06 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:28670
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jRnwh-00043N-HG
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 22:20:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587694795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vn10l5Dv5OMDQtMULPVzuPDUyFLVBFzM66Pxzh0y7cs=;
 b=MwvC8zuAFIL1rgAmYPfrsRTQICoI/61HF0eFcPdj//DvUlsHY6ylnNo/uej/jhIgaWeiXZ
 5zzXsK+EKkFZeaNQNyhk7S1kx094MjnLXkUGcn3MMy5Fk3tCT42TcNbpB9OYrcLXuUTGrN
 M+pzeIQphd3Lgag6RW6O7lvDClmSa/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-iZY6igxwPXuGab5gUytYLg-1; Thu, 23 Apr 2020 22:19:52 -0400
X-MC-Unique: iZY6igxwPXuGab5gUytYLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F6DE107ACF2;
 Fri, 24 Apr 2020 02:19:51 +0000 (UTC)
Received: from [10.72.13.199] (ovpn-13-199.pek2.redhat.com [10.72.13.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33659600E8;
 Fri, 24 Apr 2020 02:19:49 +0000 (UTC)
Subject: Re: [PATCH 0/2] net/colo-compare.c: Expose "max_queue_size" to users
 and clean up
To: Zhang Chen <chen.zhang@intel.com>, qemu-dev <qemu-devel@nongnu.org>
References: <20200411033824.19389-1-chen.zhang@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c8ce4348-d81c-1d10-ff82-74be39a03b5a@redhat.com>
Date: Fri, 24 Apr 2020 10:19:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200411033824.19389-1-chen.zhang@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 22:19:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/4/11 =E4=B8=8A=E5=8D=8811:38, Zhang Chen wrote:
> From: Zhang Chen <chen.zhang@intel.com>
>
> This series make a way to config COLO "max_queue_size" parameters accordi=
ng to
> user's scenarios and environments and do some clean up for descriptions.
>
> Zhang Chen (2):
>    net/colo-compare.c: Expose compare "max_queue_size" to users
>    qemu-options.hx: Clean up and fix typo for colo-compare
>
>   net/colo-compare.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
>   qemu-options.hx    | 33 +++++++++++++++++----------------
>   2 files changed, 59 insertions(+), 17 deletions(-)


Queued for 5.1.

Thanks


