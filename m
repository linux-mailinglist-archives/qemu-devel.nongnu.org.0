Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BC42FBC3C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:19:38 +0100 (CET)
Received: from localhost ([::1]:35070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1tjF-0001wh-34
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:19:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l1tgW-0000C7-HW
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:16:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l1tgS-0004K1-Gz
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:16:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611073003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=80Q/txhAjGk5r9Y+H7LrFYyC1ZgC2B7kRl1qOCtQ5sU=;
 b=UGgcAHXYWOSiP6vA8TD6KKFldZtobZdCdr2y0O62SvlWNQMhyxajf54XI63tA/S91p6dFz
 ITbcl/dMqigzMHAMoHRKNqlvMMe3wG2o1PlDNcf2pzw4ceiWUXDuDq5KqwUR/T0nGnQ8gD
 wH+gnHEU6A0cDwcmUwRBeim00Lkqz2c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-Pf-VcEtrPa68gns4faxt6w-1; Tue, 19 Jan 2021 11:16:41 -0500
X-MC-Unique: Pf-VcEtrPa68gns4faxt6w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 547D21966324
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 16:16:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 178A960C69;
 Tue, 19 Jan 2021 16:16:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EFF9218003A1; Tue, 19 Jan 2021 17:16:37 +0100 (CET)
Date: Tue, 19 Jan 2021 17:16:37 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/usb/hcd-xhci: Fix extraneous format-truncation error
 on 32-bit hosts
Message-ID: <20210119161637.gwpzg335xg4kvap2@sirius.home.kraxel.org>
References: <20210118181115.313742-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210118181115.313742-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: Daniel =?utf-8?B?QmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 18, 2021 at 07:11:15PM +0100, Philippe Mathieu-Daudé wrote:
> For some reason the assert() added in commit ccb799313a5
> ("hw/usb: avoid format truncation warning when formatting
> port name") does not fix when building with GCC 10.

Added to usb queue.

thanks,
  Gerd


