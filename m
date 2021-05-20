Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E355538A6BF
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 12:33:02 +0200 (CEST)
Received: from localhost ([::1]:55046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljfzB-0006lV-Vi
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 06:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ljfwj-0005Hc-JB
 for qemu-devel@nongnu.org; Thu, 20 May 2021 06:30:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ljfwh-00062s-My
 for qemu-devel@nongnu.org; Thu, 20 May 2021 06:30:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621506627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X5RLz6OgfGyJMSG7sQmP9VgxWZuweSHDsalPBvR3NOQ=;
 b=Z23zlkMDXiVwohpZjLYiTrr47BjHmpfjrP1mPlFci0DKYltNg1NITifbrQithFyj/MeBJL
 p7GWxzTyJMBDA5M3rc1v909ObkexqBcRG5H2Fv1CiV2tXCeEHgasZR85kYLcG2W4ZeNhXR
 hM8lNNPf+nEBd5FtH0GMCfbgdJEyZNQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-LG87JYvCMei4c4J9OYkUdQ-1; Thu, 20 May 2021 06:30:25 -0400
X-MC-Unique: LG87JYvCMei4c4J9OYkUdQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 987361854E32;
 Thu, 20 May 2021 10:30:24 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-58.ams2.redhat.com [10.36.115.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AF665C5E0;
 Thu, 20 May 2021 10:30:23 +0000 (UTC)
Date: Thu, 20 May 2021 12:30:21 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 1/3] qemu-config: parse configuration files to a QDict
Message-ID: <YKY6PX3SFaqGYDmq@merkur.fritz.box>
References: <20210520092618.3250686-1-pbonzini@redhat.com>
 <20210520092618.3250686-2-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210520092618.3250686-2-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: qemu-stable@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 20.05.2021 um 11:26 hat Paolo Bonzini geschrieben:
> Change the parser to put the values into a QDict and pass them
> to a callback.  qemu_config_parse's QemuOpts creation is
> itself turned into a callback function.
> 
> This is useful for -readconfig to support keyval-based options;
> getting a QDict from the parser removes a roundtrip from
> QDict to QemuOpts and then back to QDict.
> 
> Unfortunately there is a disadvantage in that semantic errors will
> point to the last line of the group, because the entries of the QDict
> do not have a location attached.
> 
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

> -int qemu_read_config_file(const char *filename, Error **errp)
> +void qemu_config_do_parse(const char *group, QDict *qdict, void *opaque, Error **errp)
> +{
> +    QemuOptsList **lists = opaque;
> +    const char *id = qdict_get_try_str(qdict, "id");
> +    QemuOptsList *list;
> +    QemuOpts *opts;
> +    const QDictEntry *unrecognized;
> +
> +    list = find_list(lists, group, errp);
> +    if (!list) {
> +        return;
> +    }
> +
> +    opts = qemu_opts_create(list, id, 1, errp);
> +    if (!opts) {
> +        return;
> +    }
> +    if (id) {
> +        qdict_del(qdict, "id");
> +    }
> +    qemu_opts_absorb_qdict(opts, qdict, errp);
> +    unrecognized = qdict_first(qdict);
> +    if (unrecognized) {
> +        error_setg(errp, QERR_INVALID_PARAMETER, unrecognized->key);

This demonstrates why in the v1 review I suggested always checking for
errors explicitly and returning immediately in the error case.

errp can now be set twice, which will cause an assertion failure.

> +        qemu_opts_del(opts);
> +    }
> +}

Kevin


