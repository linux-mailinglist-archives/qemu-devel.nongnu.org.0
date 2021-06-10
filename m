Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C25703A285C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 11:37:21 +0200 (CEST)
Received: from localhost ([::1]:35438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrH7o-0002Ly-RR
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 05:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrH65-0001fI-Hw
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:35:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrH64-0000la-0O
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623317731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sqOaNp6td1lBogK1iqDpaQoKQnOEsnFffVlOK2sIjtA=;
 b=gih6cB0eMn8VWAirL8BGFlw7lIPtpz9rLAN0EQpk9/95PSziB5faY/aQ4+IIAMUoTmvFcc
 IRyH9DZH+jPpOBY8ZRuBjQHZpAh6wbgeU3SB4ypDvYbz8gRNYIfGHVABSjUpT3n1AAZKcD
 hDo4dMQ6qg4HlmexLYsI5ito1XUPa8s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-bu2F7M92PoSgWGjMRaJ2vQ-1; Thu, 10 Jun 2021 05:35:27 -0400
X-MC-Unique: bu2F7M92PoSgWGjMRaJ2vQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E43B08015A4;
 Thu, 10 Jun 2021 09:35:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3934660853;
 Thu, 10 Jun 2021 09:35:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9FE44113865F; Thu, 10 Jun 2021 11:35:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 2/2] tpm: Return QMP error when TPM is disabled in build
References: <20210609184955.1193081-1-philmd@redhat.com>
 <20210609184955.1193081-3-philmd@redhat.com>
Date: Thu, 10 Jun 2021 11:35:21 +0200
In-Reply-To: <20210609184955.1193081-3-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 9 Jun 2021 20:49:55
 +0200")
Message-ID: <87a6nydpuu.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> When the management layer queries a binary built using --disable-tpm
> for TPM devices, it gets confused by getting empty responses:

What software exactly gets confused, and how?

>
>   { "execute": "query-tpm" }
>   {
>       "return": [
>       ]
>   }
>   { "execute": "query-tpm-types" }
>   {
>       "return": [
>       ]
>   }
>   { "execute": "query-tpm-models" }
>   {
>       "return": [
>       ]
>   }
>
> To make it clearer by returning an error:
> - Make the TPM QAPI schema conditional
> - Adapt the HMP command
> - Remove stubs which became unnecessary
>
> The management layer now gets a 'CommandNotFound' error:
>
>   { "execute": "query-tpm" }
>   {
>       "error": {
>           "class": "CommandNotFound",
>           "desc": "The command query-tpm has not been found"
>       }
>   }
>
> Suggested-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Yes, please.  But see my review of PATCH 1.


