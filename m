Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4369F3A1BF5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 19:37:59 +0200 (CEST)
Received: from localhost ([::1]:52490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr29O-0007Pb-C6
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 13:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lr28B-0006hh-Dj
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 13:36:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lr289-0006IL-MK
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 13:36:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623260201;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vhfjiTxpYMMTgdHLn4JIJD2mPuuumgwsYIX64JiZakQ=;
 b=Pz+UflN6M4UewEnDlgLTkt3UwLSZSnXQFxN5l9zbvi+Rgwcp8WiTlvQJ9Tsj6D+1LekHO2
 T4ztkQWzEUCtFpgOOJ1KaDn7MRghiTrBuZHZ23GZzF6atThfoMzmikMehwzKib3fyqS0TV
 qW1CKTjmJ0q5io1ZeLzwslbgvyyiS7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-lalxgrNYNl-JhBsDqFetTA-1; Wed, 09 Jun 2021 13:36:39 -0400
X-MC-Unique: lalxgrNYNl-JhBsDqFetTA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4F1F1012587;
 Wed,  9 Jun 2021 17:36:38 +0000 (UTC)
Received: from redhat.com (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B37695D9C6;
 Wed,  9 Jun 2021 17:36:36 +0000 (UTC)
Date: Wed, 9 Jun 2021 18:36:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] tpm: Return QMP error when TPM is disabled in build
Message-ID: <YMD8IaJKTHJwp+io@redhat.com>
References: <20210609152559.1088596-1-philmd@redhat.com>
 <CAJ+F1CL0ZdNUdcgTR8gv3w-+p++tDfvtFVYPm6NgoU_b03VgRQ@mail.gmail.com>
 <2ebcd286-cc73-e8da-53ef-2424419822ff@redhat.com>
 <d73d226b-557e-d619-10ba-e547fc51ad9d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d73d226b-557e-d619-10ba-e547fc51ad9d@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 09, 2021 at 07:34:32PM +0200, Philippe Mathieu-Daudé wrote:
> On 6/9/21 7:27 PM, Philippe Mathieu-Daudé wrote:
> > On 6/9/21 6:01 PM, Marc-André Lureau wrote:
> >> Hi
> >>
> >> On Wed, Jun 9, 2021 at 7:33 PM Philippe Mathieu-Daudé <philmd@redhat.com
> >> <mailto:philmd@redhat.com>> wrote:
> >>
> >>     When the management layer queries a binary built using --disable-tpm
> >>     for TPM devices, it gets confused by getting empty responses:
> >>
> >>       { "execute": "query-tpm" }
> >>       {
> >>           "return": [
> >>           ]
> >>       }
> >>       { "execute": "query-tpm-types" }
> >>       {
> >>           "return": [
> >>           ]
> >>       }
> >>       { "execute": "query-tpm-models" }
> >>       {
> >>           "return": [
> >>           ]
> >>       }
> >>
> >>     Make it clearer by returning an error, mentioning the feature is
> >>     disabled:
> >>
> >>       { "execute": "query-tpm" }
> >>       {
> >>           "error": {
> >>               "class": "GenericError",
> >>               "desc": "this feature or command is not currently supported"
> >>           }
> >>       }
> >>
> >>     Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com
> >>     <mailto:philmd@redhat.com>>
> >>
> >>
> >> Why not make the qapi schema conditional?
> 
> Using your suggestion (and ignoring QAPI marshaling error) I'm getting:
> 
> { "execute": "query-tpm" }
> {
>     "error": {
>         "class": "CommandNotFound",
>         "desc": "The command query-tpm has not been found"
>     }
> }
> 
> Is that OK from a management perspective?

That's fairly typical of what we'd expect to see from a feature
which is either removed at compile time, or never existed in the first
place. mgmt apps don't really need to distinguish those two scenarios,
so this is fine.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


