Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C88238CAA1
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 18:10:33 +0200 (CEST)
Received: from localhost ([::1]:38412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk7jM-0001HP-93
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 12:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lk7iD-00007z-V8
 for qemu-devel@nongnu.org; Fri, 21 May 2021 12:09:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lk7iB-0005tX-Ac
 for qemu-devel@nongnu.org; Fri, 21 May 2021 12:09:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621613357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3RyPPyx0sCQHEjKbXUlCN6aV9HaTbuQXqIayLMchTCc=;
 b=FEbh2inSrV+s87LJaWzhlmZ0fHtINYVQ64N2M/v1VpYwl63cRpWW2VTIjrg6SIqpOxo7Z6
 KQPRm2LbUlbrJuHviLOlQPlV9xOcn2dxkD6AJQKZoWXouXjOhqpVj+doctlcl4fld4Ragy
 yeb0H5iD6WAV1heeZqARbalqjqowKmU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-nbVSQLsLOaueyFw9LTj2xg-1; Fri, 21 May 2021 12:09:15 -0400
X-MC-Unique: nbVSQLsLOaueyFw9LTj2xg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79487106BB24;
 Fri, 21 May 2021 16:09:14 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-9.ams2.redhat.com [10.36.114.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 93C246A035;
 Fri, 21 May 2021 16:09:10 +0000 (UTC)
Date: Fri, 21 May 2021 18:09:09 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 1/3] qemu-config: parse configuration files to a QDict
Message-ID: <YKfbJZVb22MoZXU3@merkur.fritz.box>
References: <20210521102104.3271053-1-pbonzini@redhat.com>
 <20210521102104.3271053-2-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210521102104.3271053-2-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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

Am 21.05.2021 um 12:21 hat Paolo Bonzini geschrieben:
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
> ---
> v1->v2: check for unrecognized entries in the QDict, move a loc_pop for
>         better error messages
> 
> v2->v3: fix error propagation

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
> +    qemu_opts_absorb_qdict(opts, qdict, errp);
> +    if (errp) {

This doesn't do what you wanted.

*errp would be be better, but you also need ERRP_GUARD() then.

The other option would be using the return value of
qemu_opts_absorb_qdict().

> +        return;
> +    }
> +    unrecognized = qdict_first(qdict);
> +    if (unrecognized) {
> +        error_setg(errp, QERR_INVALID_PARAMETER, unrecognized->key);
> +        qemu_opts_del(opts);
> +    }
> +}

Kevin


