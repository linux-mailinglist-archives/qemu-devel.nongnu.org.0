Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB6F529D99
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 11:12:59 +0200 (CEST)
Received: from localhost ([::1]:41966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqtGE-0001XI-05
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 05:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqtBm-0000Bd-S9
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:08:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqtBk-0000G6-6J
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:08:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652778498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7kTBs4FXzEohgL8dCVRL7PQS+czyyaCTQeEC7dI/Lf4=;
 b=GjJ1TDAjOPCvxU8wRvAsLjjY0NklFW2cSASNiFgZJEGbA4Amlqm8tGMn9+QNhHNtkvwtpF
 KPhJSAlgJO1qD7UKLNW5sZR+UIEmMDiMebzOUVzSSfPymnRS2hxHJ52JlbBnVQls1+0SK4
 aILny7Zz7/EJG6TugvDytHpeOi1CbTs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-BmHXoGPsOR-2XCH6IsagQw-1; Tue, 17 May 2022 05:08:17 -0400
X-MC-Unique: BmHXoGPsOR-2XCH6IsagQw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D7CB299E75E
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 09:08:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 156F240CF8F0;
 Tue, 17 May 2022 09:08:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CBA2721E690D; Tue, 17 May 2022 11:08:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  Gerd Hoffmann <kraxel@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 libvir-list@redhat.com
Subject: Re: [PATCH 2/3] ui: Switch "-display sdl" to use the QAPI parser
References: <20220511175147.917707-1-thuth@redhat.com>
 <20220511175147.917707-3-thuth@redhat.com>
 <878rr77xpn.fsf@pond.sub.org>
 <870d24be-6c37-ff3d-616b-68255345ebb9@redhat.com>
Date: Tue, 17 May 2022 11:08:15 +0200
In-Reply-To: <870d24be-6c37-ff3d-616b-68255345ebb9@redhat.com> (Thomas Huth's
 message of "Tue, 17 May 2022 10:34:23 +0200")
Message-ID: <87ilq4sf0g.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> On 12/05/2022 14.16, Markus Armbruster wrote:

[...]

>>> This introduces the new "DisplaySDL" QAPI struct that is used to hold
>>> the parameters that are unique to the SDL display. The only specific
>>> parameter is currently "grab-mod" which is modeled as a string, so that
>>> it could be extended for other arbitrary modifiers later more easily.
>> 
>> Are the values of @grab-mod parsed in any way, or do we recognize a set
>> of fixed strings?
>> 
>> The former would be problematic.  We try hard to represent complex data
>> as JSON instead of inventing little ad hoc languages.
>> 
>> If it's the latter, use an enum.  Makes introspection more useful, and
>> adding enumeration values is no harder than adding string literals.
>
> It's currently only two strings that are used to replace the old behavior. 
> But in the long run, I think it would be nice to have more flexibility here, 
> so that a user could specify an arbitrary combination of modifier keys. I 
> don't think that an enum will really scale here, so I'd prefer to go with 
> the current approach and use the string for more flexibility.

"Arbitrary combination of modifier keys" sounds like set of enum to me.
We approximate sets with lists in QAPI.


