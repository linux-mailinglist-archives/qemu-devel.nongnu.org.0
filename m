Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C19E285C20
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 11:54:34 +0200 (CEST)
Received: from localhost ([::1]:58534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQ69Z-00006A-I4
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 05:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kQ68b-0007gE-74
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 05:53:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kQ68Y-0002Sj-8R
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 05:53:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602064409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kXqPZ6tSoF6aIyyYv/yqz9crpudJq5z+v4WSW925OVY=;
 b=DygcTLGD+Co0P4WaMx+CEk8YXfp9MJKxIO9Rdd+qlYPisoigSCk+SiBOV0cNGKJ2K3FPsO
 /2Uxh567YX36LOXIPAWd/W3Ud93wSmjsng2+HKBLFcIfo8TuJYbjNVTJgdY8cORl+rs7rC
 OY2QQV6FMtS7alLirsE/V7ogoEHvO5E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-REMvjNTPOvmiEPzYbKnsww-1; Wed, 07 Oct 2020 05:53:27 -0400
X-MC-Unique: REMvjNTPOvmiEPzYbKnsww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C6181018F65;
 Wed,  7 Oct 2020 09:53:26 +0000 (UTC)
Received: from linux.fritz.box (ovpn-113-169.ams2.redhat.com [10.36.113.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED6485C1C4;
 Wed,  7 Oct 2020 09:53:23 +0000 (UTC)
Date: Wed, 7 Oct 2020 11:53:22 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 07/20] python/machine.py: Add _qmp access shim
Message-ID: <20201007095322.GC7212@linux.fritz.box>
References: <20201006235817.3280413-1-jsnow@redhat.com>
 <20201006235817.3280413-8-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201006235817.3280413-8-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:44:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.10.2020 um 01:58 hat John Snow geschrieben:
> Like many other Optional[] types, it's not always a given that this
> object will be set. Wrap it in a type-shim that raises a meaningful
> error and will always return a concrete type.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

> @@ -515,11 +515,13 @@ def set_qmp_monitor(self, enabled=True):
>                          line. Default is True.
>          @note: call this function before launch().
>          """
> -        if enabled:
> -            self._qmp_set = True
> -        else:
> -            self._qmp_set = False
> -            self._qmp = None
> +        self._qmp_set = enabled

This change seems unrelated to wrapping the connection in a property.
Intuitively, it makes sense that the connection of a running instance
doesn't go away just because I disable QMP in the command line for the
next launch.

If this is the reasoning behind the change, maybe mention it in the
commit message.

With this:
Reviewed-by: Kevin Wolf <kwolf@redhat.com>


