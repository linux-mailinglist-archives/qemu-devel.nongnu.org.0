Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F742CBE15
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 14:19:23 +0100 (CET)
Received: from localhost ([::1]:38200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkS2U-0003f6-5j
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 08:19:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kkS0v-0002d7-Vb
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 08:17:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kkS0u-0003hT-5x
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 08:17:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606915063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=09FS+jg6Pe3dsS7LgumQZvzOGXM5TIK7QwGMBkPF3YI=;
 b=hjYenLI+UTSrWggmhzb4TGXlLI3R1L2zhgAco3hTMlZF/q+4IJhObleb+EjnOW7NbUHJww
 KxF3tjQ/Tnd2661RJOG+mx292n8tMXlspnmrN5WIISkX9Cm91iPX432rKUZA8zidvmEM/6
 o77AnSbXYfsQPDVupOCSbYGPUyjUIPA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-EeBv5fNKP_KZq0YDKLqScQ-1; Wed, 02 Dec 2020 08:17:39 -0500
X-MC-Unique: EeBv5fNKP_KZq0YDKLqScQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36CF01842156;
 Wed,  2 Dec 2020 13:17:38 +0000 (UTC)
Received: from kaapi (unknown [10.33.36.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B5D655C1B4;
 Wed,  2 Dec 2020 13:17:34 +0000 (UTC)
Date: Wed, 2 Dec 2020 18:47:29 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] ide:atapi: check io_buffer_index in
 ide_atapi_cmd_reply_end
In-Reply-To: <87sg8o65ys.fsf@dusky.pond.sub.org>
Message-ID: <212n55r-9n3q-8r4r-85p7-14n495r53s6n@erqung.pbz>
References: <20201118142745.112579-1-ppandit@redhat.com>
 <204751s9-11np-413q-q3pr-3o6os86078@erqung.pbz>
 <492170b8-8056-bd65-5150-62c6e89cb3f0@redhat.com>
 <933np1s-8p4p-o74p-rp94-517r98nop2o6@erqung.pbz>
 <a964ffea-ece6-3f33-3dd1-ee9c2b729b75@redhat.com>
 <87sg8o65ys.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="-1463810047-1237243701-1606915057=:373362"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Wenxiang Qian <leonwxqian@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463810047-1237243701-1606915057=:373362
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

  Hi,

[doing a combined reply]

+-- On Tue, 1 Dec 2020, Philippe Mathieu-Daudé wrote --+ 
| Is it possible to release the reproducer to the community, so we can work on 
| a fix and test it?

* No, we can not release/share reproducers on a public list.

* We can request reporters to do so by their volition.


| What happens to reproducers when a CVE is assigned, but the bug is marked as 
| "out of the QEMU security boundary"?
|
+-- On Tue, 1 Dec 2020, Peter Maydell wrote --+
| Also, why are we assigning CVEs for bugs we don't consider security bugs?

* We need to mark these componets 'out of security scope' at the source level, 
  rather than on each bug.

* Easiest could be to just have a list of such components in the git text 
  file. At least till the time we device --security build and run time option 
  discussed earlier.
  -> https://lists.nongnu.org/archive/html/qemu-devel/2020-07/msg04680.html

+-- On Tue, 1 Dec 2020, Paolo Bonzini wrote --+
| qtests are not just helpful.  Adding regression tests for bugs is a *basic* 
| software engineering principle.  If you don't have time to write tests, you 
| (or your organization) should find it.

* I've been doing the patch work out of my own interest.

* We generally rely on upstream/engineering for fix patches, because of our 
  narrower understanding of the code base.

+-- On Wed, 2 Dec 2020, Markus Armbruster wrote --+
| Paolo Bonzini <pbonzini@redhat.com> writes:
| > you need at least to enclose the reproducer, otherwise you're posting a 
| > puzzle not a patch. :)
| 
| Indeed. Posting puzzles is a negative-sum game.]

* Agreed. I think the upcoming 'qemu-security' list may help in this regard.  
  As issue reports+reproducer details shall go there.

* Even then, we'll need to ask reporter's permission before sharing their 
  reproducers on a public list OR with non-members.

* Best is if reporters share/release reproducers themselves. Maybe we can have 
  a public git repository and they can send a PR to include their reproducers 
  in the repository.

* That way multiple reproducers for the same issue can be held together.


Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
---1463810047-1237243701-1606915057=:373362--


