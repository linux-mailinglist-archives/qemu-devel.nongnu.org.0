Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA7D285E63
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 13:44:36 +0200 (CEST)
Received: from localhost ([::1]:52166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQ7s3-0001po-H2
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 07:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kQ7lI-00065c-BS
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 07:37:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kQ7lG-0007gU-7L
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 07:37:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602070653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nLhmxo5xaAnOIYybvv4l7ha9cW+9Al6/raERNbnXySY=;
 b=PKrTq0Mbv4ybSHDVbU0C0VleU7O/ot/lHs/PtZlaIAT9verO/uH77ZgbiHgKF/bPno2ahS
 F3w/ZZJJksn5TDtVk325XAiQfJBiwrf7g1xa3y0HlB83gWApmFYxySiqEG/FFrLszarf1H
 23RI9rKZo1dbtt9Y71eMERbbmUlDGNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-1UeZQbN5NJW1pFPaQSNIaw-1; Wed, 07 Oct 2020 07:37:30 -0400
X-MC-Unique: 1UeZQbN5NJW1pFPaQSNIaw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBA7181F000
 for <qemu-devel@nongnu.org>; Wed,  7 Oct 2020 11:37:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E8A36EF40;
 Wed,  7 Oct 2020 11:37:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1F11211329C1; Wed,  7 Oct 2020 13:37:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v5 23/36] qapi/commands.py: enable checking with mypy
References: <20201005195158.2348217-1-jsnow@redhat.com>
 <20201005195158.2348217-24-jsnow@redhat.com>
Date: Wed, 07 Oct 2020 13:37:28 +0200
In-Reply-To: <20201005195158.2348217-24-jsnow@redhat.com> (John Snow's message
 of "Mon, 5 Oct 2020 15:51:45 -0400")
Message-ID: <87r1qae07b.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:44:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> ---
>  scripts/qapi/mypy.ini | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/scripts/qapi/mypy.ini b/scripts/qapi/mypy.ini
> index 5df11e53fd1..8ab9ac52cc4 100644
> --- a/scripts/qapi/mypy.ini
> +++ b/scripts/qapi/mypy.ini
> @@ -4,11 +4,6 @@ strict_optional = False
>  disallow_untyped_calls = False
>  python_version = 3.6
>  
> -[mypy-qapi.commands]
> -disallow_untyped_defs = False
> -disallow_incomplete_defs = False
> -check_untyped_defs = False
> -
>  [mypy-qapi.error]
>  disallow_untyped_defs = False
>  disallow_incomplete_defs = False

The equivalent change for  events.py you squashed into the commit adding
type hints.  Any particular reason for not doing the same here?


