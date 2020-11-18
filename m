Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1E32B79FF
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 10:09:53 +0100 (CET)
Received: from localhost ([::1]:48804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJTM-0003Zc-2W
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 04:09:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kfJRu-0002Jt-K7
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 04:08:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kfJRs-0001mW-Vn
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 04:08:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605690500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Qr2BKko3GzWi6t0DHOZrk2WkqHZlHtKyHIlqKxgkzA=;
 b=cKwyZ6qGlOX37tpcALZuHqK94V36zvBfXft4QPbGRhNKWX+wW8874YCidMl6YyAZo/Kp0f
 5RQoZsga2C6KfSGS5kUzlLSfsYpHpnynYuNGbat/0hNgTHPKN/o2PlV4QXOFENKx0oxd4/
 VAfjQGAqAHCb7zzXVhZMHwhsNiWXbFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-XM3-uh9pOdOlOzLxKGve9w-1; Wed, 18 Nov 2020 04:08:17 -0500
X-MC-Unique: XM3-uh9pOdOlOzLxKGve9w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45EE11084C83;
 Wed, 18 Nov 2020 09:08:16 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-139.ams2.redhat.com [10.36.113.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 758CA60C05;
 Wed, 18 Nov 2020 09:08:13 +0000 (UTC)
Subject: Re: Should bus-less devices default to .user_creatable = false? (was:
 [PATCH 13/13] bcm2835_cprman: put some peripherals of bcm2835 cprman
 into the 'misc' category)
To: Markus Armbruster <armbru@redhat.com>
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-14-ganqixin@huawei.com>
 <c2ca2185-4253-da71-eab4-f96b29067c96@amsat.org>
 <882df4ee-948c-7e00-d951-9b14ea40b2df@redhat.com>
 <877dqldyoh.fsf@dusky.pond.sub.org> <875z63oxq1.fsf_-_@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <610fa3c0-0896-1ee7-76f3-9f2b97d54295@redhat.com>
Date: Wed, 18 Nov 2020 10:08:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <875z63oxq1.fsf_-_@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, zhang.zhanghailiang@huawei.com,
 qemu-trivial@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Gan Qixin <ganqixin@huawei.com>,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/11/2020 09.50, Markus Armbruster wrote:
> Markus Armbruster <armbru@redhat.com> writes:
> 
> [...]
>> qdev_device_add() looks like a bus-less device is usable if the machine
>> provides a hotplug handler for it.  Commit 03fcbd9dc5 "qdev: Check for
>> the availability of a hotplug controller before adding a device" seems
>> to be pertinent.
> 
> Nope.  A hotplug handler is only required for hot plug (d'oh!), not for
> cold plug.  
> 
> I wonder whether bus-less devices should default to .user_creatable =
> false like sysbus devices, and for the same reasons.
> 
> To actually *do* something, a physical device requires some connection
> to the rest of the world.  Same for a virtual device (at least the ones
> that model physical devices).

I know at least two virtual devices that are bus-less and cold-pluggable:
hw/ppc/spapr_rng.c and hw/watchdog/wdt_diag288.c ... but we could certainly
mark them with user_creatable = true manually if we decide that bus-less
devices should be handled differently by default.

 Thomas



