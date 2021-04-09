Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01118359DAC
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 13:44:19 +0200 (CEST)
Received: from localhost ([::1]:42036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUpYg-000707-2o
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 07:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lUpXg-0006Xl-AL
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 07:43:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lUpXd-0003rw-4M
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 07:43:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617968592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+IS9shmr2e0/wApPCREkd+L5dzvcxKOL1XqGj/7meCE=;
 b=irJVyPSfyYQvahN4MUV6brNG74lsFCJYZ3qbmjjCFk/fEUQZfzn71ucTrv4cFXtl+F9SRD
 t75ELK8VzQzqo8R+AkvrhPTzArY91+Kmje6omlJZq0WRu7dOK6bIGC8s+15i5FAV94qwBC
 1q7tYhLOpqIQxdQ6TdE9tFcyOSPDDjY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-cCNuoMGPMVWGgKGV-Wjrjw-1; Fri, 09 Apr 2021 07:43:10 -0400
X-MC-Unique: cCNuoMGPMVWGgKGV-Wjrjw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8551387A841
 for <qemu-devel@nongnu.org>; Fri,  9 Apr 2021 11:43:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-165.ams2.redhat.com
 [10.36.114.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41E115D9E3;
 Fri,  9 Apr 2021 11:43:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6797818000AB; Fri,  9 Apr 2021 13:43:04 +0200 (CEST)
Date: Fri, 9 Apr 2021 13:43:04 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2] qemu-trace-stap: changing SYSTEMTAP_TAPSET considered
 harmful.
Message-ID: <20210409114304.gmtn5emlfnzhhhsu@sirius.home.kraxel.org>
References: <20210409105810.374976-1-kraxel@redhat.com>
 <YHA3yGYQ9xSbbB+M@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YHA3yGYQ9xSbbB+M@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 09, 2021 at 12:17:28PM +0100, Daniel P. Berrangé wrote:
> On Fri, Apr 09, 2021 at 12:58:10PM +0200, Gerd Hoffmann wrote:
> > Setting SYSTEMTAP_TAPSET to some value other than
> > /usr/share/systemtap/tapsets results in systemtap not finding the
> > standard tapset library any more, which in turn breaks tracing because
> > pid() and other standard systemtap functions are not available any more.
> > 
> > So using SYSTEMTAP_TAPSET to point systemtap to the qemu probes will
> > only work for the prefix=/usr installs because both qemu and system
> > tapsets in the same directory then.  All other prefixes are broken.
> > 
> > Fix that by using the "-I $tapsetdir" command line switch instead.
> 
> Do you know if "-I tapsetdir" appends or prepends to the search path ?
> 
> We need it to prepend to ensure that we override any QEMU stp files
> that might be already present in /usr/share from an RPM provided
> QEMU binary.

Dunno, "man stap" isn't clear on that one.  strace shows the files in
the SYSTEMTAP_TAPSET directory are read first.  That doesn't imply those
probes have a higher priority though.

take care,
  Gerd


