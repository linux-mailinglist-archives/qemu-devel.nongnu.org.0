Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439A04B2A6C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:32:10 +0100 (CET)
Received: from localhost ([::1]:34272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIYq9-0006h0-3q
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:32:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nIYpF-0005mg-8v
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:31:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nIYpC-0001bg-8K
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:31:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644597069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oLzeFeFp06/yNcUI0+pFGuK5k0sDBlxQDp+mrXVLric=;
 b=G6Muh/mxZJdWkr9Z7bOTmiRGSAPx+/nEzmdwnenGAYLn2PXQAtkyoNH8eEdTnxmlqar6J8
 AP8COsZJQ5/vGWk9iXdcp0e+AcVpvPwhVihtEpJ8S7ry9lAZ70yS2r3X2iUaxzKceV6jWM
 xNL2zoBi7WAOmy8EWMJw7l5BdO0hJvE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-3ONlZZzwO9Ohs3rUGgGK2A-1; Fri, 11 Feb 2022 11:31:05 -0500
X-MC-Unique: 3ONlZZzwO9Ohs3rUGgGK2A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4BC41091DA3;
 Fri, 11 Feb 2022 16:31:04 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.189])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE0387CD63;
 Fri, 11 Feb 2022 16:31:02 +0000 (UTC)
Date: Fri, 11 Feb 2022 10:31:00 -0600
From: Eric Blake <eblake@redhat.com>
To: Fabian Ebner <f.ebner@proxmox.com>
Subject: Re: [PATCH 0/4] Make qemu-img dd more flexible
Message-ID: <20220211163100.lhqrztyrr2a4akji@redhat.com>
References: <20220210133123.347350-1-f.ebner@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <20220210133123.347350-1-f.ebner@proxmox.com>
User-Agent: NeoMutt/20211029-304-033d7f
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, w.bumiller@proxmox.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, aderumier@odiso.com, hreitz@redhat.com,
 t.lamprecht@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 10, 2022 at 02:31:19PM +0100, Fabian Ebner wrote:
> Adds support for reading from stdin and writing to stdout (when raw
> format is used), as well as overriding the size of the output and
> input image/stream.
> 
> Additionally, the options -n for skipping output image creation and -l
> for loading a snapshot are made available like for convert.

Without looking at the series itself, I want to refer back to earlier
times that someone proposed improving 'qemu-img dd':

https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg00636.html
https://lists.gnu.org/archive/html/qemu-devel/2018-08/msg02618.html

As well as the observation that when we originally allowed 'qemu-img
dd' to be added, the end goal was that if 'qemu-img dd' can't operate
as a thin wrapper around 'qemu-img convert', then 'qemu-img convert'
needs to be made more powerful first.  Every time we diverge on what
the two uses can do, rather than keeping dd as a thin wrapper, we add
to our maintenance burden.

Sadly, there is a lot of technical debt in this area ('qemu-img dd
skip= count=' is STILL broken, more than 4 years after I first
proposed a potential patch), where no one has spent the necessary time
to improve the situation.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


