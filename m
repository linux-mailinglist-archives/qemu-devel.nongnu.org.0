Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDADE3227F7
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 10:45:29 +0100 (CET)
Received: from localhost ([::1]:55020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEUG0-0007Xz-Gd
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 04:45:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lEUEy-000753-Ah
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:44:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lEUEv-0000kE-7i
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:44:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614073460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Eh7r3DIMFa+U5VlvHmuD2N5+gGODLiciLPHjOk4xsYU=;
 b=cFxN1I1zPpJvBsMSDzXd+Qwb4DB7az8UhQ1U2/nAGzK81ROmulThM8+UYaDtTU30d84bNg
 Z2ggRHnTRi9IEwNEzg8uUFzb7cU0sgp9arkOXvNiXePdPLpypE4/Wy2vvvi3HurNZC5WQf
 5EyqeLbUD7urW47/YIp6kPDNq6m/gYk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-V0e9F_mBM5CIdF33gFVK5w-1; Tue, 23 Feb 2021 04:44:13 -0500
X-MC-Unique: V0e9F_mBM5CIdF33gFVK5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B34F8AF001;
 Tue, 23 Feb 2021 09:37:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D7FC6E71A;
 Tue, 23 Feb 2021 09:37:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F0324113860F; Tue, 23 Feb 2021 10:37:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: A brief look at deprecating our JSON extensions over RFC 8259
References: <875z2knoa5.fsf@dusky.pond.sub.org> <YDPMs1Hu8LDRJUhX@redhat.com>
 <c5d13648-445d-92b9-6bff-95bd2b99d52e@redhat.com>
 <YDPv7Bk6/DNq/lCn@redhat.com> <87o8gbf7uc.fsf@dusky.pond.sub.org>
Date: Tue, 23 Feb 2021 10:37:24 +0100
In-Reply-To: <87o8gbf7uc.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Tue, 23 Feb 2021 10:31:55 +0100")
Message-ID: <87k0qzf7l7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

[...]
> A bigger stumbling block for replacement is our need for a streaming
> interface: we feed the parser characters, and expect to be called back
> when an expression is complete.

Another stumbling block: check-qjson.c test case "/literals/string/utf8"
and "/literals/string/escaped".  Off-the-shelf parsers flunking them
would surprise me about as much as the sun going up in the morning.

[...]


