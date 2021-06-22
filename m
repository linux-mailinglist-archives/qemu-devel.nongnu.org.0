Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECFB3B08AE
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:22:12 +0200 (CEST)
Received: from localhost ([::1]:43828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lviE7-0003N1-4h
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lviCr-0002gK-5P
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:20:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lviCn-0004be-Dz
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:20:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624375248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=i/a8ozgq629avrZWqel6QtyaQdtP0Y8E0hG1+8SSx/E=;
 b=ekS8wFgpmv+Y4sLCN2p+fCdQg7pnjH3GjJUEPkliPygI6xZDgAvsvJhpun39VakAZgiEhP
 jJ80I1HcVea+I97xSBEdhdOj8MN3VvCOwpnZ6vsSMDW6xb/w7EosXk088xOGgD+8uxtawP
 HwKep25ombXXMcbzkqaiuWSKraJq2gU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-GCIgwVVgOv6vrTybuosZxw-1; Tue, 22 Jun 2021 11:20:47 -0400
X-MC-Unique: GCIgwVVgOv6vrTybuosZxw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E2B61835AC5
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 15:20:46 +0000 (UTC)
Received: from [10.10.118.71] (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9981F5D9DE;
 Tue, 22 Jun 2021 15:20:45 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Subject: Auditing QEMU to replace NULL with &error_abort
Message-ID: <7132e6a4-8d3a-828e-1c08-b17954445341@redhat.com>
Date: Tue, 22 Jun 2021 11:20:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

One of our Bite-Sized tasks on the wiki was to audit QEMU and, where 
applicable, replace NULL with &error_abort.

Everywhere else where it is intentional, we ought to add a comment or 
some other indication explaining why it's the right thing to do in that 
case.

That task was ported to GitLab here:
https://gitlab.com/qemu-project/qemu/-/issues/414

mreitz and thuth have chimed in with excellent clarifications. Phil 
suggests that we should replace the intentional cases of NULL with 
&error_ignore, to possibly log squelched errors in debugging mode. This 
sounds like a great idea to me:

- It allows us to remove NULL entirely, which as mreitz states "is 
fishy", but sometimes valid.
- It annotates callsites where we have decided the ignore is intentional 
and correct.
- It gives us a review opportunity to require good comments at those 
callsites.
- It gives us a good way to measure progress of the audit by making the 
removal of NULL a concrete goal. (Can we use coccinelle to find all 
instances of the literal NULL being passed to a variable named errp?)

 From a brief chat on IRC, Markus is "reluctant to deviate from GError 
even more". It sounds like there isn't consensus here. We should 
probably reach consensus on this point before trying to pass the task 
off to a neophyte, though -- so I'm raising this discussion on the list 
and CC'ing Markus to see if we can define the task better or not.

--js


(Personally, I've got no horse in the race beyond moving these tasks off 
the wiki and onto the tracker. Since I moved the issue, though, I might 
as well make sure the filing is accurate.)


