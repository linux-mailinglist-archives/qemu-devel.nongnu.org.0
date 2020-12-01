Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E05F12CAD8F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 21:45:19 +0100 (CET)
Received: from localhost ([::1]:45564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkCWU-0004Qs-Vi
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 15:45:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kkCVF-0003nQ-9P
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:44:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kkCV8-0007Op-Nm
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:44:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606855433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XdYvde+agLcbiY54nm1cpR46swLyWhEHCDiXW6Hok4M=;
 b=Kbr+yAsKmQZK3UYRR8zgdsI4XURvZ/AX6hyGNe3/OKoC0pWLJr73xmn0R+s+VicaMIPQWT
 2IiNekg44Gk5aJoPK06Qe8Q2v2R++q9Kj8LqXRchs9GCcApnf/Pgvrn1iEUQIoe2XCGPlH
 IcVioiZ1c/uRxD4bgKeAX+GB3cqd7mk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-TVv2NGIOOXKpwGS7H2A-2w-1; Tue, 01 Dec 2020 15:43:49 -0500
X-MC-Unique: TVv2NGIOOXKpwGS7H2A-2w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB3B41823DD6;
 Tue,  1 Dec 2020 20:43:47 +0000 (UTC)
Received: from [10.3.113.230] (ovpn-113-230.phx2.redhat.com [10.3.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13E1660BFA;
 Tue,  1 Dec 2020 20:43:44 +0000 (UTC)
To: Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
References: <cover.1605439674.git.lukasstraub2@web.de>
 <2f88d8992faf582fc5172a8a09ec0a2df241e4f2.1605439674.git.lukasstraub2@web.de>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v11 1/7] Introduce yank feature
Message-ID: <c702eeae-300b-deee-5809-7ea6ed9ec8f1@redhat.com>
Date: Tue, 1 Dec 2020 14:43:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <2f88d8992faf582fc5172a8a09ec0a2df241e4f2.1605439674.git.lukasstraub2@web.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/20 5:36 AM, Lukas Straub wrote:
> The yank feature allows to recover from hanging qemu by "yanking"

"allows to $verb" is not idiomatic English, better is "allows $subject
to verb" or "allows ${verb}ing".  In this case, I suggest "The yank
feature allows the recovery of a hung qemu by "yanking" at various parts".

> at various parts. Other qemu systems can register themselves and
> multiple yank functions. Then all yank functions for selected
> instances can be called by the 'yank' out-of-band qmp command.
> Available instances can be queried by a 'query-yank' oob command.
> 
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> ---

> +# @YankInstanceType:
> +#
> +# An enumeration of yank instance types. See @YankInstance for more
> +# information.
> +#
> +# Since: 6.0
> +##
> +{ 'enum': 'YankInstanceType',
> +  'data': [ 'block-node', 'chardev', 'migration' ] }
> +

> +##
> +# @YankInstance:
> +#
> +# A yank instance can be yanked with the @yank qmp command to recover from a
> +# hanging QEMU.
> +#
> +# Currently implemented yank instances:
> +#  - nbd block device:
> +#    Yanking it will shut down the connection to the nbd server without
> +#    attempting to reconnect.

Mismatch in documentation; I presume it gets cleaned up later in the
series, in which case I can live with this patch as-is.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


