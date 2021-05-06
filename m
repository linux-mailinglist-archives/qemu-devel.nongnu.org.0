Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65542374F12
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 07:54:47 +0200 (CEST)
Received: from localhost ([::1]:51588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leWyE-0002qg-BQ
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 01:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1leWxM-0002Rk-Rd
 for qemu-devel@nongnu.org; Thu, 06 May 2021 01:53:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1leWxI-0006nj-7x
 for qemu-devel@nongnu.org; Thu, 06 May 2021 01:53:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620280425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KhY2DUIwVnYtbopN2w9q0BGumgHfj9407GbmyCKsRXc=;
 b=BkSkoB/0jNLETU8Rt2MLPdeI4A8QQ/6FavbQoNJ5AI/iotQyHe2GON6xLHK2QSdsvSQvrb
 AtRTDNyxkv01rUZMviBpF57taEDcRzelGhbgxcRweQ+sflluPjrxFRevavcO+Og5eJgM6/
 ShFFc4cstcTiX5/MwTQABCoeVX0Ty34=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-uIPcVzDVNsOAXPCvOr_Zjg-1; Thu, 06 May 2021 01:53:44 -0400
X-MC-Unique: uIPcVzDVNsOAXPCvOr_Zjg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F22BD6D241;
 Thu,  6 May 2021 05:53:42 +0000 (UTC)
Received: from kaapi (unknown [10.74.8.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1EC5687C2;
 Thu,  6 May 2021 05:53:31 +0000 (UTC)
Date: Thu, 6 May 2021 11:23:29 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: Li Qiang <liq3ea@gmail.com>
Subject: Re: [PATCH 1/7] vhost-user-gpu: fix memory disclosure in
 virgl_cmd_get_capset_info
In-Reply-To: <CAKXe6SK_gwLad2khA9iJda2DJi2BDXSg=ZGpPUFqPQdb+V6tRw@mail.gmail.com>
Message-ID: <1970r4n-9opn-q43n-r510-s85so96648op@erqung.pbz>
References: <20210505045824.33880-1-liq3ea@163.com>
 <20210505045824.33880-2-liq3ea@163.com>
 <8o22o26q-9342-o822-2758-372s9s59r2qn@erqung.pbz>
 <CAKXe6SK_gwLad2khA9iJda2DJi2BDXSg=ZGpPUFqPQdb+V6tRw@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="-1463810559-1813655995-1620280422=:56254"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marcandre lureau <marcandre.lureau@redhat.com>, Li Qiang <liq3ea@163.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463810559-1813655995-1620280422=:56254
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

+-- On Wed, 5 May 2021, Li Qiang wrote --+
| P J P <ppandit@redhat.com> 于2021年5月5日周三 下午3:24写道：
| > -   vg_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
| > +   vg_ctrl_response(g, cmd, &resp.hdr, sizeof(resp.hdr));
| >
| > * While memset(3) is okay, should it also send header(hdr) size as 'resp_len'?
| 
| I don't think so. This function also set fields other than header such
| as 'resp.capset_id', 'resp.capset_max_version' and so on.

But it is passing 'resp.hdr' reference as parameter and size of 'resp' as 
length.

  sizeof(struct virtio_gpu_ctrl_hdr): 24
  sizeof(struct virtio_gpu_resp_capset_info): 40

It may cause OOB access.

Thank you.
--
 - P J P
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
---1463810559-1813655995-1620280422=:56254--


