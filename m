Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE57F39E186
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 18:10:26 +0200 (CEST)
Received: from localhost ([::1]:46490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqHpZ-00058s-OQ
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 12:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqHjf-0007Mu-K2
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:04:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqHjb-0001Mi-Dq
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:04:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623081852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=msVP/QFUOqa/WgoKQbgfuKB22Fo7Vc71OBfppDmmc/s=;
 b=bIT+ea7ncwBjEXsnzN/79ZjIB8cpD205wWTpJdg93CWtTi/HKYJHITwgzvXfXCFNiDfPvs
 g5SSJia4JMxjgH47y3G7WstYlZ5f3fZQGo8PgigPddssFbEBflWlDJb7VAQN5Z/pBaVWK8
 mFDAbWOXpa/4Sympdr9KrcskbtXEey0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-2amW7rZvPrKDUu80RH-4hw-1; Mon, 07 Jun 2021 12:04:08 -0400
X-MC-Unique: 2amW7rZvPrKDUu80RH-4hw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 643421012D9C;
 Mon,  7 Jun 2021 16:04:07 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 154AC5B4A7;
 Mon,  7 Jun 2021 16:03:52 +0000 (UTC)
Date: Mon, 7 Jun 2021 11:03:50 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 2/9] replace machine phase_check with
 machine_is_initialized/ready calls
Message-ID: <20210607160350.h7kqpwua6hfb7c62@redhat.com>
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
 <20210513082549.114275-3-mirela.grujic@greensocs.com>
 <dcaf4794-0661-afae-a256-5043be20aa5b@redhat.com>
 <164d41e2-262f-0dab-17d6-c280428687cd@greensocs.com>
 <dd18ebb7-9583-86b8-e368-afef3b71e5ef@redhat.com>
MIME-Version: 1.0
In-Reply-To: <dd18ebb7-9583-86b8-e368-afef3b71e5ef@redhat.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: damien.hedde@greensocs.com, edgar.iglesias@xilinx.com,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 mark.burton@greensocs.com, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 14, 2021 at 11:14:23PM +0200, Paolo Bonzini wrote:
> On 14/05/21 15:13, Mirela Grujic wrote:
> > However, if you believe it should rather be just renamed I can do so.
> 
> I am just not sure it's such an advantage to replace phase_check with
> separate functions.  The rename is a constraint of QAPI, so we have to live
> with the long names.

You can also use 'prefix':'...' as part of the QAPI 'enum' declaration
to pick a shorter name for the C enum (see for example BlkdebugEvent
in block-core.json).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


