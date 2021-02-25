Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC36932517B
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 15:30:27 +0100 (CET)
Received: from localhost ([::1]:34332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFHes-0002w6-Qi
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 09:30:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lFHdW-00027U-21
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:29:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lFHdU-0003S8-5M
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:29:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614263338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r4OcGxTLUFpLxngskDlG+XhqSuD6Ydr9RC683HreLIY=;
 b=RfTHgfUi++WA5uDoWfQuEVXck3fEcfSXZz/+DUamyzmcv5CG2zGMZly4MoSdDPxvbTRSuE
 LJJSxejHwWIGAZ3W+XJIjn0pzKLxgW+iI1w/ApGIQgpnvouhXrj1VrUMeu6yzxoAHgQcsN
 yeobd3/kTfz5VUfcQQvPI8vcBzlZL4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-dPlrKyKrMKuXYtsGIhylyA-1; Thu, 25 Feb 2021 09:28:56 -0500
X-MC-Unique: dPlrKyKrMKuXYtsGIhylyA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE50280196C
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 14:28:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4BBE5D9E3;
 Thu, 25 Feb 2021 14:28:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 35646113860F; Thu, 25 Feb 2021 15:28:48 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] vl: deprecate -writeconfig
References: <20210225131316.631940-1-pbonzini@redhat.com>
 <YDeuOYpYZX+49AAd@redhat.com>
 <7593fccc-fb5b-4e1c-a35f-e9e4ff940a9a@redhat.com>
Date: Thu, 25 Feb 2021 15:28:47 +0100
In-Reply-To: <7593fccc-fb5b-4e1c-a35f-e9e4ff940a9a@redhat.com> (Paolo
 Bonzini's message of "Thu, 25 Feb 2021 15:08:03 +0100")
Message-ID: <87lfbc9q74.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 25/02/21 15:03, Daniel P. Berrang=C3=A9 wrote:
>> FWIW, we've rarely kept exactly to our 2 cycle plan. In practice it has
>> become more of a minimum bar, rather than an exact deadline.  If you wan=
t
>> to promise death in 6.2 though I'll defer to your judgement :=3D)
>> Reviewed-by: Daniel P. Berrang=C3=A9<berrange@redhat.com>
>
> Well, I have patches waiting for the removal and sitting over them for
> a year is already enough. :)

I don't see a need to bake the end of the grace period into the
deprecation message.  We don't do that elsewhere, either.


