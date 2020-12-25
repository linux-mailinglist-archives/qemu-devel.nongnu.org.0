Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B8D2E29F9
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Dec 2020 07:24:24 +0100 (CET)
Received: from localhost ([::1]:43140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksgWV-0008VR-L1
	for lists+qemu-devel@lfdr.de; Fri, 25 Dec 2020 01:24:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ksgVY-0007zf-0i
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 01:23:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ksgVV-00013I-Vd
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 01:23:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608877400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fi0h43yKUCWAyp9pN52omxE5Zybtx/xSdkefcBYH8oI=;
 b=Hlo6P3XyngvWeBwudBUev3WLxOqYerv5kHPVVGJ8jEz3z76C0DyGd4NowzFjAFmIVVg6Wm
 RJ/alJl7kteaIRVg4lrtL6zT7BGTqoRpMNf1U8KtO1XR+ucVPuZEFjqbYybNK3zmAp1rZt
 NzOZnVWMNlFONVcgo2XESBuT5McFUDg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-9HPtJo_jOa-5y_jHF8U4BQ-1; Fri, 25 Dec 2020 01:23:18 -0500
X-MC-Unique: 9HPtJo_jOa-5y_jHF8U4BQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 970F110051A6;
 Fri, 25 Dec 2020 06:23:17 +0000 (UTC)
Received: from [10.72.12.166] (ovpn-12-166.pek2.redhat.com [10.72.12.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97F165D9CC;
 Fri, 25 Dec 2020 06:23:15 +0000 (UTC)
Subject: Re: [PATCH 0/3] Bypass specific network traffic in COLO
To: Zhang Chen <chen.zhang@intel.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20201224010918.19275-1-chen.zhang@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <247fcbaf-4772-1bf9-db97-471649ce30b0@redhat.com>
Date: Fri, 25 Dec 2020 14:23:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201224010918.19275-1-chen.zhang@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.825, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/12/24 上午9:09, Zhang Chen wrote:
> From: Zhang Chen <chen.zhang@intel.com>
>
> Since the real user scenario does not need to monitor all traffic.


Hi Chen:

It would be better to elaborate more on this. E.g what scenario and who 
will use those new QMP/HMP commands.

Thanks


> This series give user ability to bypass kinds of network stream.
>
> Zhang Chen (3):
>    qapi/net: Add new QMP command for COLO passthrough
>    hmp-commands: Add new HMP command for COLO passthrough
>    net/colo-compare: Add handler for passthrough connection
>
>   hmp-commands.hx       | 26 +++++++++++++++++++++++
>   include/monitor/hmp.h |  2 ++
>   monitor/hmp-cmds.c    | 20 ++++++++++++++++++
>   net/colo-compare.c    | 49 +++++++++++++++++++++++++++++++++++++++++++
>   net/colo-compare.h    |  2 ++
>   net/net.c             | 39 ++++++++++++++++++++++++++++++++++
>   qapi/net.json         | 46 ++++++++++++++++++++++++++++++++++++++++
>   7 files changed, 184 insertions(+)
>


