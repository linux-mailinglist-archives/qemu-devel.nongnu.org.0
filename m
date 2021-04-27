Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E96736C61C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 14:34:41 +0200 (CEST)
Received: from localhost ([::1]:52194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbMvH-0002AO-L2
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 08:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbMry-0000sm-3J
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 08:31:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbMrl-0001rr-UV
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 08:31:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619526654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9e2VX+il8FwP+r9BiXa3DgdGt8IuJHCzzfxWacj9I3w=;
 b=Ap7nYMa3l5W5W+EnOaVzLzBypoMGMVJd74zRs0N2PJzC/dphOJE17ECFc6j94p85mX6/Bp
 VxeZsit114oxEWtK451ifHw0uORCyKBKx1UnrA9Oar/U1eJRQ+o3Rings3zAbnyrdReRNN
 LGYXaUSaZ3gh4WcNYF1Ha/lwiUTgwVE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-hk_2g_mJOYmIgaNw2XP6GQ-1; Tue, 27 Apr 2021 08:30:52 -0400
X-MC-Unique: hk_2g_mJOYmIgaNw2XP6GQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92DEBA40C4;
 Tue, 27 Apr 2021 12:30:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AEC819714;
 Tue, 27 Apr 2021 12:30:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CF29B113525D; Tue, 27 Apr 2021 14:30:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 05/22] qapi/parser: Assert lexer value is a string
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-6-jsnow@redhat.com>
 <87k0os9j4t.fsf@dusky.pond.sub.org>
 <d7f40069-3e64-9077-f2ac-48f003c83962@redhat.com>
Date: Tue, 27 Apr 2021 14:30:49 +0200
In-Reply-To: <d7f40069-3e64-9077-f2ac-48f003c83962@redhat.com> (John Snow's
 message of "Mon, 26 Apr 2021 13:43:29 -0400")
Message-ID: <874kfrykna.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 4/24/21 4:33 AM, Markus Armbruster wrote:
>> The second operand of assert provides no additional information.  Please
>> drop it.
>
> I don't agree with "no additional information", strictly.
>
> I left you a comment on gitlab before you started reviewing on-list. 
> What I wrote there:
>
> "Markus: I know you're not a fan of these, but I wanted a suggestion on 
> how to explain why this must be true in case it wasn't obvious to 
> someone else in the future."

But the second operand doesn't explain anything.  Look:

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index f519518075e..c75434e75a5 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -303,6 +303,7 @@ def get_doc(self, info):
         cur_doc = QAPIDoc(self, info)
         self.accept(False)
         while self.tok == '#':
+            assert isinstance(self.val, str), "Expected str value"
             if self.val.startswith('##'):
                 # End of doc comment
                 if self.val != '##':

The second operand paraphrases the first one in prose rather than code.
An actual *explanation* would instead tell me why the first operand must
be true.

To do that, I'd point to self.accept()'s postcondition.  Which
(informally) is

    self.tok in ('#', '{', ... )
    and self.tok == '#' implies self.val is a str
    and self.tok == '{' implies self.val is None
    ...

I believe this is required working knowledge for understanding the
parser.  Your PATCH 16 puts it in a doc string, so readers don't have to
extract it from code.  Makes sense.

It's not going to fit into a workable second operand here, I'm afraid.

I assume you need this assertion for mypy.  If yes, let's get the job
done with minimal fuss.  If no, please drop the assertion entirely.


