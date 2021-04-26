Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7C336B848
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 19:48:11 +0200 (CEST)
Received: from localhost ([::1]:51524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb5L8-0005EU-4H
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 13:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lb5Gh-0003XO-Vi
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 13:43:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lb5Gg-00064Z-Du
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 13:43:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619459013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KcSeLpFsQ3yBT39pS4Ko15oWqoKv8yMB43dF3FV0ykM=;
 b=Cv8GMS3kdHL/tFTQePv0lcsI36eosIyHm6gURDxbg1tDsCNjIps+nDz7UE6y8k1jF32nV/
 sDuade32Saz5M9Ca/Wi9ACgNGJJniBZFFwjFG7ADHWItipoRc+u3bZiVwvxrJ1sJyywz5v
 ERnLY3/pVbhw1XxyFscAD6RXR6dhUeI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-hlODEqOeMGW01WwIDndWZQ-1; Mon, 26 Apr 2021 13:43:31 -0400
X-MC-Unique: hlODEqOeMGW01WwIDndWZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54C93802B40;
 Mon, 26 Apr 2021 17:43:30 +0000 (UTC)
Received: from [10.10.120.13] (ovpn-120-13.rdu2.redhat.com [10.10.120.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE44B19C78;
 Mon, 26 Apr 2021 17:43:29 +0000 (UTC)
Subject: Re: [PATCH 05/22] qapi/parser: Assert lexer value is a string
To: Markus Armbruster <armbru@redhat.com>
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-6-jsnow@redhat.com>
 <87k0os9j4t.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <d7f40069-3e64-9077-f2ac-48f003c83962@redhat.com>
Date: Mon, 26 Apr 2021 13:43:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87k0os9j4t.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 4:33 AM, Markus Armbruster wrote:
> The second operand of assert provides no additional information.  Please
> drop it.

I don't agree with "no additional information", strictly.

I left you a comment on gitlab before you started reviewing on-list. 
What I wrote there:

"Markus: I know you're not a fan of these, but I wanted a suggestion on 
how to explain why this must be true in case it wasn't obvious to 
someone else in the future."

--js


