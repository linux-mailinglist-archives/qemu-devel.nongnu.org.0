Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ABF2CB589
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 08:09:55 +0100 (CET)
Received: from localhost ([::1]:44904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkMGt-0005UB-R3
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 02:09:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kkMFA-00050u-HU
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 02:08:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kkMF7-0006jZ-Vu
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 02:08:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606892880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ehbotpec37fXNdSpPTk5o4hgk1Y14L82vAZQMn05JiM=;
 b=aerX2yDTDJGB0/lNkH9VrBP7C2uUIWy6JyrtkYFKgqRSbxePRp52RpO91DjiK49oZuFuGd
 Wv/OxD4ESoop5LtyfZHh0X9/ersOCkzx8dOufaioDZd6YW62PRQ/sIwuQW3NDHrZDhUIdK
 Mz4XyTBllish+6aNOtsqSoQR4QaeNoU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-Y3qDu7h3OVC3qPeeOGZaIg-1; Wed, 02 Dec 2020 02:07:58 -0500
X-MC-Unique: Y3qDu7h3OVC3qPeeOGZaIg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 315AB8030CC;
 Wed,  2 Dec 2020 07:07:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D23605C1B4;
 Wed,  2 Dec 2020 07:07:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 65742113864E; Wed,  2 Dec 2020 08:07:55 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] ide:atapi: check io_buffer_index in
 ide_atapi_cmd_reply_end
References: <20201118142745.112579-1-ppandit@redhat.com>
 <204751s9-11np-413q-q3pr-3o6os86078@erqung.pbz>
 <492170b8-8056-bd65-5150-62c6e89cb3f0@redhat.com>
 <933np1s-8p4p-o74p-rp94-517r98nop2o6@erqung.pbz>
 <a964ffea-ece6-3f33-3dd1-ee9c2b729b75@redhat.com>
Date: Wed, 02 Dec 2020 08:07:55 +0100
In-Reply-To: <a964ffea-ece6-3f33-3dd1-ee9c2b729b75@redhat.com> (Paolo
 Bonzini's message of "Tue, 1 Dec 2020 16:30:21 +0100")
Message-ID: <87sg8o65ys.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Wenxiang Qian <leonwxqian@gmail.com>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 01/12/20 16:00, P J P wrote:
[...]
>> * I did test it against a reproducer, but did not get to the qtest
>> part for
>>    the time constraints.
>
> qtests are not just helpful.  Adding regression tests for bugs is a
> *basic* software engineering principle.  If you don't have time to
> write tests, you (or your organization) should find it.
>
> But even if you don't write tests you need at least to enclose the
> reproducer, otherwise you're posting a puzzle not a patch. :)

Indeed.

Posting puzzles is a negative-sum game.  You save a little time, but
your reviewers have to pay back, with usurious interest.  Depending on
how nice they are, they may even do it a few times for you, but
eventually even the nicest ones will take one look at your patch, and
bounce it right back to you.  Mission accomplished: all terms in the
negative sum are now negative.


