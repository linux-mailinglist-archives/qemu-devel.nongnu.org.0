Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38126288FF9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 19:29:26 +0200 (CEST)
Received: from localhost ([::1]:40482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQwCr-0006tN-97
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 13:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kQwA3-0005Ph-3L
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 13:26:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kQwA1-0003v3-1A
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 13:26:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602264387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=smn7AqDO2v3V56fL4tD0bEx26VO9ccepN4pF+xEe6X8=;
 b=Qsmy0sd2yI1q76f75GQTEWL+QWTP1ojIJz7nANoNW9ApHOfD1X8l7HGSVWVyQRJoVLcpiu
 WOahB3+p57iqG8uZx/PmmM5/Vq6/6O3t8cPXI19OWgs0Oq3Bitw+cMWsncBPabEIZ6DQtp
 6oWw9roQbI3/ewPvu+PooHczac3eacE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-zfFrUCvJMEWUpknE3TQINw-1; Fri, 09 Oct 2020 13:26:26 -0400
X-MC-Unique: zfFrUCvJMEWUpknE3TQINw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B2921005E5A;
 Fri,  9 Oct 2020 17:26:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1E785D9F3;
 Fri,  9 Oct 2020 17:26:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A716E11329AE; Fri,  9 Oct 2020 19:26:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 03/36] qapi-gen: Separate arg-parsing from generation
References: <20201009161558.107041-1-jsnow@redhat.com>
 <20201009161558.107041-4-jsnow@redhat.com>
Date: Fri, 09 Oct 2020 19:26:23 +0200
In-Reply-To: <20201009161558.107041-4-jsnow@redhat.com> (John Snow's message
 of "Fri, 9 Oct 2020 12:15:25 -0400")
Message-ID: <87y2kfcnuo.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 02:34:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> This is a minor re-work of the entrypoint script. It isolates a

<pedantic>entrypoint is not a word</>  ;-P

> generate() method from the actual command-line mechanism.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> Tested-by: Cleber Rosa <crosa@redhat.com>
> ---
>  scripts/qapi-gen.py | 89 ++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 67 insertions(+), 22 deletions(-)
>
> diff --git a/scripts/qapi-gen.py b/scripts/qapi-gen.py
> index 541e8c1f55d..054554ed846 100644
> --- a/scripts/qapi-gen.py
> +++ b/scripts/qapi-gen.py
> @@ -1,30 +1,77 @@
>  #!/usr/bin/env python3
> -# QAPI generator
> -#
> +
>  # This work is licensed under the terms of the GNU GPL, version 2 or later.
>  # See the COPYING file in the top-level directory.
>  
> +"""
> +QAPI Generator
> +
> +This is the main entry point for generating C code from the QAPI schema.
> +"""
>  
>  import argparse
>  import re
>  import sys
> +from typing import Optional
>  
>  from qapi.commands import gen_commands
> +from qapi.error import QAPIError
>  from qapi.events import gen_events
>  from qapi.introspect import gen_introspect
> -from qapi.schema import QAPIError, QAPISchema
> +from qapi.schema import QAPISchema
>  from qapi.types import gen_types
>  from qapi.visit import gen_visit
>  
>  
> -def main(argv):
> +def invalid_char(prefix: str) -> Optional[str]:

Naming is hard...  invalid_char() makes sense because it returns the
invalid character.  The name's a tad generic, though.  Would
first_invalid_prefix_char() be easier to understand?

> +    match = re.match(r'([A-Za-z_.-][A-Za-z0-9_.-]*)?', prefix)
> +    if match.end() != len(prefix):
> +        return prefix[match.end()]
> +    return None
[...]


