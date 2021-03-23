Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0DA34629E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 16:17:07 +0100 (CET)
Received: from localhost ([::1]:46470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOimI-0001WS-MH
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 11:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lOikT-0000IR-KO
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:15:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lOikS-0008Ik-3f
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:15:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616512511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pKSlhwdBfzZdRG4OGCmgTTbwIaoH+jwNW8evUXVJlaU=;
 b=ZbBz3GGl7iLSAGjHp0N5lE9l4Vx/LxsrwZMiCH8QAbJvYWOEnuP6Hf5mPUSNr+QVkYJhS0
 DG5NHtiS6LfSI20HhusqAdZhe09HZJ36PFAbq2rtkhMnM8KRY4KlwmO5y9YGhqmusbjTTC
 wrybySFuderuccRYIdf9AJkLaRuDebw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-PuOpttQePFejlNQqvnrSNQ-1; Tue, 23 Mar 2021 11:15:09 -0400
X-MC-Unique: PuOpttQePFejlNQqvnrSNQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FD471034B20;
 Tue, 23 Mar 2021 15:15:08 +0000 (UTC)
Received: from [10.3.112.201] (ovpn-112-201.phx2.redhat.com [10.3.112.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BDF565DEAD;
 Tue, 23 Mar 2021 15:15:03 +0000 (UTC)
Subject: Re: [PATCH 22/28] qapi: Prepare for rejecting underscore in command
 and member names
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-23-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <197fa844-c184-b0bf-6316-c66da7a2e204@redhat.com>
Date: Tue, 23 Mar 2021 10:15:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323094025.3569441-23-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: michael.roth@amd.com, jsnow@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 4:40 AM, Markus Armbruster wrote:
> Command names and member names within a type should be all lower case
> with words separated by a hyphen.  We also accept underscore.  Rework
> check_name_lower() to optionally reject underscores, but don't use
> that option, yet.
> 
> Update expected test output for the changed error message.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  scripts/qapi/expr.py                    | 24 ++++++++++++++----------
>  tests/qapi-schema/args-member-case.err  |  2 +-
>  tests/qapi-schema/enum-member-case.err  |  2 +-
>  tests/qapi-schema/union-branch-case.err |  2 +-
>  4 files changed, 17 insertions(+), 13 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


