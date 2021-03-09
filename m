Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB6E331FBF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 08:25:13 +0100 (CET)
Received: from localhost ([::1]:38192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJWjw-0003CQ-Br
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 02:25:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJWix-0002ea-UW
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 02:24:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJWis-00055Q-Go
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 02:24:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615274645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cJ7zMPccKYiyxcpHm2V2WAg6ZAeMtEFjYB8BiTTHP60=;
 b=XlUfIMGiYJ5hwu23kvsv9zQaq/9R5VWNyx2M2nVROJ40ryDeEJq5iQXnGulrR/4cUxaUgQ
 DStC1qmZuOQr9wu6CfRz5COQeiDmF7pj/u6rLbIkr12S8rX0zxezoNuLS+W9XWeigdX7xC
 25i1uoWmAP8P2/aaUgosVDYrgExRWzQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-ZtKCfY8kPqu5JI-rCb_rIQ-1; Tue, 09 Mar 2021 02:24:02 -0500
X-MC-Unique: ZtKCfY8kPqu5JI-rCb_rIQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77DA6107465C;
 Tue,  9 Mar 2021 07:24:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-41.ams2.redhat.com
 [10.36.113.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 28C0A10013D6;
 Tue,  9 Mar 2021 07:24:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 777B218000A2; Tue,  9 Mar 2021 08:23:59 +0100 (CET)
Date: Tue, 9 Mar 2021 08:23:59 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Ben Leslie <benno@benno.id.au>
Subject: Re: What is the intended behaviour of usb_host_get_port for root hubs?
Message-ID: <20210309072359.6ep2bmu2zda6ojud@sirius.home.kraxel.org>
References: <CABZ0LtCh37eXx0evxYNsZigFJgq-RY+wdFvA0SMDH4HgxpK-zw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABZ0LtCh37eXx0evxYNsZigFJgq-RY+wdFvA0SMDH4HgxpK-zw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 09, 2021 at 10:54:15AM +1100, Ben Leslie wrote:
> When usb_host_get_port is called for a root-hub device what string should
> be output in the port parameter?

Just the port number, as string.

(and in case this isn't a root port the hub port number(s) are appended,
separated by a dot).

> The current behaviour writes a string with whatever stack value happened to
> be in the paths stack array.

Huh?  Isn't paths updated by the libusb_get_port_numbers() call?

take care,
  Gerd


