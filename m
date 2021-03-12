Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A81193393AF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 17:38:47 +0100 (CET)
Received: from localhost ([::1]:52772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKkoI-0002gK-MV
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 11:38:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKkiM-00070r-B9
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 11:32:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKkiF-0008SK-N4
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 11:32:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615566750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lj4YIz+ZNTIFnkvs4741ueZjk5k2FJSNGfInzGkBh5c=;
 b=CYGdTUOS74YNvYKI2coxutUVLewldR1b/5E2v3oELM79LkFla2Jb44JEK4Ic8SmtVFy7QB
 56h9OkLmOQYIrAdsncZTdV/jdRr+v4nvLQhAbr+vwnCSZXEvlbFeXmWNjcJI04vjBcblu2
 +5xZ82R00ITDf+Bvugc1czibUGOjrko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-oPweV-U1NY-vTCixfXlWsQ-1; Fri, 12 Mar 2021 11:32:28 -0500
X-MC-Unique: oPweV-U1NY-vTCixfXlWsQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB20F100C666
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 16:32:27 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-110.ams2.redhat.com [10.36.114.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 97B3219C71;
 Fri, 12 Mar 2021 16:32:26 +0000 (UTC)
Date: Fri, 12 Mar 2021 17:32:25 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] qom: Support JSON in user_creatable_parse_str()
Message-ID: <YEuXmXzTjCPyAn+j@merkur.fritz.box>
References: <20210312131921.421023-1-kwolf@redhat.com>
 <87h7lg1huk.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87h7lg1huk.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: pbonzini@redhat.com, pkrempa@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 12.03.2021 um 17:01 hat Markus Armbruster geschrieben:
> Is this an alternative to Paolo's "[PATCH 0/3] vl: QAPIfy -object", and
> if not, how do the two play together?

Paolo's patch adds JSON support to the system emulator CLI (using
QemuOpts to stay compatible with the list magic), this patch adds it to
everything else (tools don't have memory-backend, and HMP isn't a stable
interface, so they all use the same keyval-based function modified by
this patch).

Kevin


