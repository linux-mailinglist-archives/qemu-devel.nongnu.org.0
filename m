Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DEB4066CB
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 07:32:24 +0200 (CEST)
Received: from localhost ([::1]:55290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOZ9D-0003zQ-7c
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 01:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mOZ72-0002ZH-Se
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 01:30:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mOZ70-0004aQ-2q
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 01:30:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631251804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NszuVmkR/a2Ok5R9Its1ynDqX52LArOxOLRitMQ1l00=;
 b=XnuDxfmOzWUo+O+tYYqI/+Bkp/kpdYJg30WGhWwx7+HNGK1lMmSQgeQhyh+P2BPO5AquF7
 /QhQPa0Y7UlT+2GEmtO4IOj+inaqQymSHX6tXkKIMB+UJuITo46xD9G2fZZRHUWhjJ4vsb
 X1oqBIkdAk2lGtvIDuXKiAkbdSk1SgA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-dUlXCvzkP6SHJrKX-y4IpQ-1; Fri, 10 Sep 2021 01:30:01 -0400
X-MC-Unique: dUlXCvzkP6SHJrKX-y4IpQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D2E2801A92
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 05:30:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4514518428;
 Fri, 10 Sep 2021 05:30:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D2FE518000AA; Fri, 10 Sep 2021 07:29:58 +0200 (CEST)
Date: Fri, 10 Sep 2021 07:29:58 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 0/2] hmp: Unbreak "change vnc", tidy up set_password's doc
Message-ID: <20210910052958.jyp2uzq6jyhqzd72@sirius.home.kraxel.org>
References: <20210909081219.308065-1-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210909081219.308065-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 09, 2021 at 10:12:17AM +0200, Markus Armbruster wrote:
> If you'd rather delete "change vnc", go ahead and post a patch.
> 
> Markus Armbruster (2):
>   hmp: Unbreak "change vnc"
>   hmp: Drop a bogus sentence from set_password's documentation

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


