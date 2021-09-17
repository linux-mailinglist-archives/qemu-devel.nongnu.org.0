Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EEF40F753
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 14:19:01 +0200 (CEST)
Received: from localhost ([::1]:49096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRCpX-0003yN-MN
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 08:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mRCkX-0007Q0-V7
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 08:13:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mRCkU-0002eT-7O
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 08:13:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631880824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BQ9LOHcVL6pMO9RURYwTiSX6yYYsfgGPQdwzQBlnO4I=;
 b=gvqktLlD3J3X0rEG+j6maFVipa0zSEUG4gctQ4eSZ8bZSzzurStaPMAwb3QqQq3hvM/iuW
 Ij+XZPEK/qBf3j+6wYtDTqR/6zs65f/s0S9Pqq7vdtfpYsTZq8UhSaOeW5CiNtPKo7IHKZ
 5bu9FzY6kpwu29GxNhripeh6GxeQz+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-rpbCsAgHMue8mxLHn55n8Q-1; Fri, 17 Sep 2021 08:13:43 -0400
X-MC-Unique: rpbCsAgHMue8mxLHn55n8Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 834D6800FF4;
 Fri, 17 Sep 2021 12:13:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3AB86A257;
 Fri, 17 Sep 2021 12:13:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 729F0113865F; Fri, 17 Sep 2021 14:13:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-trivial@nongnu.org
Subject: Re: [PATCH 0/2] hmp: Unbreak "change vnc", tidy up set_password's doc
References: <20210909081219.308065-1-armbru@redhat.com>
Date: Fri, 17 Sep 2021 14:13:19 +0200
In-Reply-To: <20210909081219.308065-1-armbru@redhat.com> (Markus Armbruster's
 message of "Thu, 9 Sep 2021 10:12:17 +0200")
Message-ID: <87ilyzs8m8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: pbonzini@redhat.com, kraxel@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Routing to qemu-trivial.


