Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E269262673
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 06:49:47 +0200 (CEST)
Received: from localhost ([::1]:32954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFs3G-0005LX-KZ
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 00:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kFs2b-0004w1-IX
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 00:49:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59356
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kFs2Z-0005M6-Dg
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 00:49:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599626941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FRahnxs0MJd3JFNv20KXFByOIgzunZ5qG6CxkdE0pJ4=;
 b=II/vdtsQ3eJk5mUUp5bGDMoAgGSrVzqjgw13dxL8E66uImeua/ZrxxsPzU6FzIEjKYHapy
 6ttmxHxsHI+57Vz/fvx5cvvn6/FfTZ9cviMz4s9lQTEM1yKrl5KQnmc6H3iVqvXuYY1Y9i
 Qa0ygnD+FDzlbz9dfoJ9anG2PITDSLE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-4xr8CeJiN7G3VeQ7LUza8g-1; Wed, 09 Sep 2020 00:49:00 -0400
X-MC-Unique: 4xr8CeJiN7G3VeQ7LUza8g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 423EB1084C81;
 Wed,  9 Sep 2020 04:48:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA9541A8EC;
 Wed,  9 Sep 2020 04:48:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CC19D9D77; Wed,  9 Sep 2020 06:48:56 +0200 (CEST)
Date: Wed, 9 Sep 2020 06:48:56 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC 1/4] memory: add memory_region_init_io_with_dev interface
Message-ID: <20200909044856.lvk77pcfvt567ub6@sirius.home.kraxel.org>
References: <20200908164157.47108-1-liq3ea@163.com>
 <20200908164157.47108-2-liq3ea@163.com>
 <48a99ece-d808-f860-2551-0fec05ec5b01@redhat.com>
MIME-Version: 1.0
In-Reply-To: <48a99ece-d808-f860-2551-0fec05ec5b01@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 00:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, dmitry.fleytman@gmail.com, berrange@redhat.com,
 ehabkost@redhat.com, liq3ea@gmail.com, Li Qiang <liq3ea@163.com>,
 f4bug@amsat.org, qemu-devel@nongnu.org, alxndr@bu.edu, pbonzini@redhat.com,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 09, 2020 at 10:15:47AM +0800, Jason Wang wrote:
> 
> On 2020/9/9 上午12:41, Li Qiang wrote:
> > Currently the MR is not explicitly connecting with its device instead of
> > a opaque. In most situation this opaque is the deivce but it is not an
> > enforcement. This patch adds a DeviceState member of to MemoryRegion
> > we will use it in later patch.
> 
> 
> I don't have a deep investigation. But I wonder whether we could make sure
> of owner instead of adding a new field here.

Should be possible.  There is object_dynamic_cast() which can be used to
figure whenever a given owner object is a device.

take care,
  Gerd


