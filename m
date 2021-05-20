Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB1238A1B0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 11:33:40 +0200 (CEST)
Received: from localhost ([::1]:41796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljf3j-0000NJ-SW
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 05:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljexs-0001wh-JL
 for qemu-devel@nongnu.org; Thu, 20 May 2021 05:27:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljexo-0000mq-6d
 for qemu-devel@nongnu.org; Thu, 20 May 2021 05:27:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621502849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r7E7Rh1C1d9ib5Cl8kXcRjvl+cwaxH0e2XS5I66kpcE=;
 b=X26HKs6HYz5ONbo2K9G7b3Ne1oP2PjVaONH2xylZ2w/dL3E6rhJeBn6yRFPAtJG6NlB5sR
 q9G5FOseLEkFkZZJZilUq5Gtw9BSg5bn/TLIJpu7BjafzZPXkquK/2M5/GOtYsM7yhjAZh
 med2hQcF3NJsrULiHwV35x69tHbkgEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-V0lcvMt3NeaM2WCqQIw_LA-1; Thu, 20 May 2021 05:27:27 -0400
X-MC-Unique: V0lcvMt3NeaM2WCqQIw_LA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D446107ACCA;
 Thu, 20 May 2021 09:27:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AB3D5D9CC;
 Thu, 20 May 2021 09:27:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E46CA113861E; Thu, 20 May 2021 11:27:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 00/15] qapi: static typing conversion, pt5a
References: <20210519183951.3946870-1-jsnow@redhat.com>
Date: Thu, 20 May 2021 11:27:24 +0200
In-Reply-To: <20210519183951.3946870-1-jsnow@redhat.com> (John Snow's message
 of "Wed, 19 May 2021 14:39:36 -0400")
Message-ID: <87cztlbvr7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> This is part five (a), and focuses on QAPISchemaParser in parser.py.
> It does not touch QAPIDoc yet, which will be covered next.
> 
> gitlab: https://gitlab.com/jsnow/qemu/-/commits/python-qapi-cleanup-pt5a
> 
> Requirements:
> - Python 3.6+
> - mypy >= 0.770
> - pylint >= 2.6.0 (2.7.0+ when using Python 3.9+)
> 
> Every commit should pass with:
>  - `isort -c qapi/`
>  - `flake8 qapi/`
>  - `pylint --rcfile=qapi/pylintrc qapi/`
>  - `mypy --config-file=qapi/mypy.ini qapi/`

Series
Reviewed-by: Markus Armbruster <armbru@redhat.com>

and queued with doc string spacing slightly tweaked to consistently
satisfy PEP 8's two spaces between sentences rule.  Thanks!


