Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A061C3AB0C0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:59:15 +0200 (CEST)
Received: from localhost ([::1]:36088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltonq-0002Hj-LQ
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ltoPP-00077M-Br
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:33:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ltoPN-0007k7-K5
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:33:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623922437;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+5qUmO5N1Y0Pv2X+k8TfAW/W7F6o3HX2qhBW2ffo2/o=;
 b=KjDJmZGE2gBlL4RoaB1BhsJGWJxTmmJULMk00jIQpPIRy1psrvGT9BgTOPj8UxNy729vve
 aXtmyw7cOh11X0C7o8AtLz2PwAY0Lw5hGQcxi1gOv2lncYarPvWKr51pCiHTbY5odlKLi1
 /sGTD01rkZAEpNBUfFU6vxKUr6nNnfk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-kJDvvnHUMQm10P4S7A64vA-1; Thu, 17 Jun 2021 05:33:53 -0400
X-MC-Unique: kJDvvnHUMQm10P4S7A64vA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76B471850608;
 Thu, 17 Jun 2021 09:33:52 +0000 (UTC)
Received: from redhat.com (ovpn-114-220.ams2.redhat.com [10.36.114.220])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3760A5D9CC;
 Thu, 17 Jun 2021 09:33:48 +0000 (UTC)
Date: Thu, 17 Jun 2021 10:33:46 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 5/7] crypto/tlssession: Introduce
 qcrypto_tls_creds_check_endpoint() helper
Message-ID: <YMsW+v4/7vuuAs7q@redhat.com>
References: <20210616162225.2517463-1-philmd@redhat.com>
 <20210616162225.2517463-6-philmd@redhat.com>
 <55c03d12-3359-858e-8e71-7ba7a6fddad4@linaro.org>
 <bda6ced3-3299-f1ed-f5c4-b53ed61bde28@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bda6ced3-3299-f1ed-f5c4-b53ed61bde28@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 16, 2021 at 09:21:45PM +0200, Philippe Mathieu-Daudé wrote:
> On 6/16/21 9:12 PM, Richard Henderson wrote:
> > On 6/16/21 9:22 AM, Philippe Mathieu-Daudé wrote:
> >> Introduce the qcrypto_tls_creds_check_endpoint() helper
> >> to avoid accessing QCryptoTLSCreds internal 'endpoint' field
> >> directly.
> > 
> > I don't understand this one.  Comment ...
> > 
> >> +bool qcrypto_tls_session_check_role(QCryptoTLSCreds *creds,
> >> +                                    QCryptoTLSCredsEndpoint endpoint,
> >> +                                    Error **errp)
> >> +{
> >> +    return qcrypto_tls_creds_check_endpoint(creds, endpoint, errp);
> >> +}
> > 
> > ... doesn't match the function.
> > 
> > The new function is a pure forwarder, and begs the question of why the
> > caller isn't using qcrypto_tls_creds_check_endpoint directly.
> 
> I tried to follow the maintainer/subsystem style (I was also tempted to
> use qcrypto_tls_creds_check_endpoint directly). ui/vnc uses the TLS
> "session" API and not the "creds" one. Daniel, what is your preference?

I think we don't need this extra function - just use the function from
earlier directly.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


