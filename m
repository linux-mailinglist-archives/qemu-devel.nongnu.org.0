Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FB62A96D3
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Nov 2020 14:17:07 +0100 (CET)
Received: from localhost ([::1]:35092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kb1c2-0003Cn-F0
	for lists+qemu-devel@lfdr.de; Fri, 06 Nov 2020 08:17:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kb1ak-0002LT-M9
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 08:15:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kb1ai-0004jl-WA
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 08:15:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604668544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=njEU7jFKN8JSzDEhO2YUBRAPqWB0Q6WksBq34KLqCmE=;
 b=b6PjE/NyDCpJOb4f17j69cV/N2As38zKz399mJmHeuJ3OfLsJG5O6F3WtRCqooFArIZTLw
 /xyphvurNVH+EWRIRCfrj1LajV6PNVQMediSOOhkIsFFtJg3tsQD2CgT1B5YXW7YbAq2rs
 MfREnGsD66iQ3/IK02Tqr7NbVHfoPh0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-mfw1qTwMOpaz2pabHkQTaA-1; Fri, 06 Nov 2020 08:15:42 -0500
X-MC-Unique: mfw1qTwMOpaz2pabHkQTaA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F33BA1009E2D
 for <qemu-devel@nongnu.org>; Fri,  6 Nov 2020 13:15:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C447419746;
 Fri,  6 Nov 2020 13:15:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 564501132BD6; Fri,  6 Nov 2020 14:15:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-5.2 3/4] qtest: escape device name in
 device-introspect-test
References: <20201103151452.416784-1-pbonzini@redhat.com>
 <20201103151452.416784-4-pbonzini@redhat.com>
Date: Fri, 06 Nov 2020 14:15:40 +0100
In-Reply-To: <20201103151452.416784-4-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Tue, 3 Nov 2020 10:14:51 -0500")
Message-ID: <87zh3uiq2r.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/06 07:11:31
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> device-introspect-test uses HMP, so it should escape the device name
> properly.  Because of this, a few devices that had commas in their
> names were escaping testing.
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

$ git-grep '\.name *= *"[^"]*,' | cat
hw/block/fdc.c:    .name          = "SUNW,fdtwo"

Any others?


