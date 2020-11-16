Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8740F2B43FF
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:50:57 +0100 (CET)
Received: from localhost ([::1]:47634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedyC-000730-KD
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:50:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kedwa-0005Ml-7Q
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:49:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kedwY-0003Nz-Ic
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:49:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605530953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r74z7IOp6K9IMxyYJ9QaLX1EDVX8ulECyblS9b3lkl8=;
 b=QpmQUOKVTzfpnR3C54ZARb+W3Pm82nPCroVw/kKMqLYcMzTIMI1tfUGNN6XTB1UcRVukn4
 OSUNJxt+oDSUu4HA7tbpjpOHaEZvpayHJZWG9nk6RK6k9CufD1fCZ4HvU0XV0CobaJvUR6
 l77K/BToZFVJm18SRRLszxUV5UuTRjA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-_gM3osg7MhmG5SOAAuuipw-1; Mon, 16 Nov 2020 07:49:12 -0500
X-MC-Unique: _gM3osg7MhmG5SOAAuuipw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81385186DD23;
 Mon, 16 Nov 2020 12:49:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 732C26B8D4;
 Mon, 16 Nov 2020 12:48:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 697C416E31; Mon, 16 Nov 2020 13:48:58 +0100 (CET)
Date: Mon, 16 Nov 2020 13:48:58 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201116124858.epiz322osx753plo@sirius.home.kraxel.org>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <64fb6a41-fbfa-994c-9619-4df41ac97fde@redhat.com>
 <20201111143615.GA1421166@stefanha-x1.localdomain>
 <20201111154850.GG906488@redhat.com>
 <20201116111524.GD96297@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201116111524.GD96297@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John G Johnson <john.g.johnson@oracle.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, mtsirkin@redhat.com,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>, quintela@redhat.com,
 Jason Wang <jasowang@redhat.com>, "Zeng, Xin" <xin.zeng@intel.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Felipe Franciosi <felipe@nutanix.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > In validating QEMU migration compatibility we merely compare the
> > versioned machine type.
> 
> Thinking more about this, maybe the big picture is:
> 
> Today the managment tool controls the variables in the migration (the
> device configuration). It has knowledge of the VMM, can set a machine
> type, apply a device configuration on top, and then migrate safely.
> 
> VFIO changes this model because VMMs and management tools do not have
> knowledge of specific device implementations. The device implementation
> is a new source of variables in the migration and the management tool no
> longer has the full picture.

Well.  We actually have the variables.  They are device properties.
Then the qemu compat properties basically map a machine type to a
set of device properties.  That way we hide the complexity inside
qemu.  The management apps have to deal with the (versioned) machine
type only.

I guess now we have to decide whenever we want expose the individual
variables or whenever we want something like "profiles", i.e. basically
a set of variables with a name attached.

At the end of the day it is a complexity vs. flexibility tradeoff ...

take care,
  Gerd


