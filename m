Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29A730A2ED
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 08:58:19 +0100 (CET)
Received: from localhost ([::1]:54164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6U6E-0007Yo-Tf
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 02:58:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l6U4x-0006HW-5i
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 02:56:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l6U4v-0004g1-Nm
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 02:56:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612166216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TjhS5a3AD6l2YGU/jGesKWDu4NRtrTHVVOt9rxSZh2Y=;
 b=bLNrGIWTabZd3MPxUUy2j2H7N2gKxnmRXlyJbJTeRfV+kKqKdxE4Qm/qxNusj9epRMRYfQ
 9tO/bDclRywBfSt3nbdtzqwp2uLvyVsm7Vs02KW3+4Wm1/yjx7xQkv1iKFsj5OB0WhDRw3
 8j14tvPeaEzBeBe87yR8hzESWTrnaDU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-tc-DD0PTPSW_vtcIzWo0LQ-1; Mon, 01 Feb 2021 02:56:55 -0500
X-MC-Unique: tc-DD0PTPSW_vtcIzWo0LQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CCF68030A2
 for <qemu-devel@nongnu.org>; Mon,  1 Feb 2021 07:56:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 046CC5FC15;
 Mon,  1 Feb 2021 07:56:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BCA7E1800387; Mon,  1 Feb 2021 08:56:32 +0100 (CET)
Date: Mon, 1 Feb 2021 08:56:32 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 2/2] pci: add romsize property
Message-ID: <20210201075632.lfchwzrzr6aiuplu@sirius.home.kraxel.org>
References: <20210129192838.582771-1-pbonzini@redhat.com>
 <20210129192838.582771-3-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210129192838.582771-3-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: mst@redhat.com, lersek@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> +    DEFINE_PROP_UINT32("romsize", PCIDevice, romsize, -1),

IIRC we have a DEFINE_PROP_SIZE() which can parse units and therefore
accepts -- for example -- "512k" or "1M".

take care,
  Gerd


