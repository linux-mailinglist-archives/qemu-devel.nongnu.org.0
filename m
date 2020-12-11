Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 399A92D77A1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 15:18:39 +0100 (CET)
Received: from localhost ([::1]:36872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knjFm-0003Ha-8r
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 09:18:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1knjE0-0002dG-Pn
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:16:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1knjDy-0006IR-Vg
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:16:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607696205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7Iaszy/MFmkKOUZPW1Cg501ah47JYbBS3hDfTzHKMrk=;
 b=cXA+CKRYk8W4kozxsN0lkpA7M3A7ZoEhsS45gB1oNL99fwj1ZURsnJguDXEBqnGGa5Nh08
 ff6YF52MsxTkpL5/wPTnan9BsO2tLhogsqwi/W7YLKIKxiX9x8XSorkyNKKl6sBIJZyQwv
 fEoMwWLvl1C5gKmQxpJFfI2XzEf0R4k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-9agLqth4Pd22V7bJ3Gk53g-1; Fri, 11 Dec 2020 09:16:43 -0500
X-MC-Unique: 9agLqth4Pd22V7bJ3Gk53g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAE69107ACFB;
 Fri, 11 Dec 2020 14:16:42 +0000 (UTC)
Received: from kaapi (unknown [10.33.36.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D344C60BF1;
 Fri, 11 Dec 2020 14:16:39 +0000 (UTC)
Date: Fri, 11 Dec 2020 19:46:35 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] ide:atapi: check io_buffer_index in
 ide_atapi_cmd_reply_end
In-Reply-To: <2c1b5a52-cce0-560e-269b-9d61348cfa92@redhat.com>
Message-ID: <53s4p836-4rp7-9p5-19r9-37n1qr70o02s@erqung.pbz>
References: <20201118142745.112579-1-ppandit@redhat.com>
 <204751s9-11np-413q-q3pr-3o6os86078@erqung.pbz>
 <492170b8-8056-bd65-5150-62c6e89cb3f0@redhat.com>
 <933np1s-8p4p-o74p-rp94-517r98nop2o6@erqung.pbz>
 <a964ffea-ece6-3f33-3dd1-ee9c2b729b75@redhat.com>
 <87sg8o65ys.fsf@dusky.pond.sub.org>
 <212n55r-9n3q-8r4r-85p7-14n495r53s6n@erqung.pbz>
 <CAKZf9JDg=5y=2v=O6ZQjcLCYXXEn2szM_c3rrQgtTHvLsSicww@mail.gmail.com>
 <2c1b5a52-cce0-560e-269b-9d61348cfa92@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Wenxiang Qian <leonwxqian@gmail.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+-- On Fri, 11 Dec 2020, Paolo Bonzini wrote --+
| This is not the root cause.  These are the last steps before bad things 
| happen; the root cause is what _led_ to those last steps.  In this case, the 
| root cause is that a read request with s->lba == -1 is mistaken for a 
| non-read.  Read requests are able to reset s->io_buffer_index and start with 
| the index pointing just after the end of the sector buffer; non-read 
| requests instead visit the buffer just once and start with 
| s->io_buffer_index == 0.
| 
| In turn, the fix is to validate:
| 
| 1) that s->lba is in range when issuing a read request
| 
| 2) that the size of the device is sane (e.g. the number of blocks is a
| positive 32-bit integer).

  Yes, working on a revised patch...

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


