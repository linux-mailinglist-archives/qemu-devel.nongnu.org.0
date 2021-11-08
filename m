Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1D14498C2
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 16:53:16 +0100 (CET)
Received: from localhost ([::1]:35784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk6xQ-0002dq-4T
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 10:53:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mk6vj-0001tf-Mp
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:51:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mk6vh-0000Iw-NZ
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:51:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636386689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l11aU+0AnXIA1nVqiZfj2jJiCcOzQLGfD6xztxsd8lU=;
 b=g/WZd2AT92sMzdpS1CKKjwkhS8ZIX2LKIjjwFO9CijliJcvIYMY5nIZX2/uGmvoclMkq+F
 qRWfzYiSSd9B4Go6Sksa7nIIK4R1BzbJY7Mrj1pU3ExMOwAXh4twpy8TkeAMvB4/LqHyni
 L+h1AIJtKgLlvVKou9Cgib8MCvn8TFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-DaSqPzXhM7anZ5jJUmR1Wg-1; Mon, 08 Nov 2021 10:51:26 -0500
X-MC-Unique: DaSqPzXhM7anZ5jJUmR1Wg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A79068799EB;
 Mon,  8 Nov 2021 15:51:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1F2679457;
 Mon,  8 Nov 2021 15:51:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 415E411380A7; Mon,  8 Nov 2021 16:51:10 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH v2 1/6] qapi/qom,target/i386: sev-guest: Introduce
 kernel-hashes=on|off option
References: <20211108134840.2757206-1-dovmurik@linux.ibm.com>
 <20211108134840.2757206-2-dovmurik@linux.ibm.com>
Date: Mon, 08 Nov 2021 16:51:10 +0100
In-Reply-To: <20211108134840.2757206-2-dovmurik@linux.ibm.com> (Dov Murik's
 message of "Mon, 8 Nov 2021 13:48:35 +0000")
Message-ID: <87h7cmk5n5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dov Murik <dovmurik@linux.ibm.com> writes:

> Introduce new boolean 'kernel-hashes' option on the sev-guest object.
> It will be used to to decide whether to add the hashes of
> kernel/initrd/cmdline to SEV guest memory when booting with -kernel.
> The default value is 'off'.
>
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> ---
>  qapi/qom.json     |  7 ++++++-
>  target/i386/sev.c | 20 ++++++++++++++++++++
>  qemu-options.hx   |  6 +++++-
>  3 files changed, 31 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/qom.json b/qapi/qom.json
> index ccd1167808..4fd5d1716b 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -769,6 +769,10 @@
>  # @reduced-phys-bits: number of bits in physical addresses that become
>  #                     unavailable when SEV is enabled
>  #
> +# @kernel-hashes: if true, add hashes of kernel/initrd/cmdline to a
> +#                 designated guest firmware page for measured boot
> +#                 with -kernel (default: false)

Missing: (since 7.0)

> +#
>  # Since: 2.12
>  ##
>  { 'struct': 'SevGuestProperties',
> @@ -778,7 +782,8 @@
>              '*policy': 'uint32',
>              '*handle': 'uint32',
>              '*cbitpos': 'uint32',
> -            'reduced-phys-bits': 'uint32' } }
> +            'reduced-phys-bits': 'uint32',
> +            '*kernel-hashes': 'bool' } }
>  
>  ##
>  # @ObjectType:

[...]


