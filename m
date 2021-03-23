Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478073461AD
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:43:59 +0100 (CET)
Received: from localhost ([::1]:43860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOiGE-0007rR-46
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lOiCz-00068n-PU
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:40:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lOiCj-0005FB-Df
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:40:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616510418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vEDo+WWuCAQ74Z4egNsd3WbFqo0EwKPyuhSU3NURiPk=;
 b=QMXlKu3KvUg55vk1YLLx4vvjwYBrnAGQSJwoH641XZ141H+GPfBC7n7DoXX6bklL30QU65
 nsQzsZeVL7qfsLqYcYMga3fJ/3U7t1IPWmrYv+dqv1ex7k+lR7qEqB0YdU/uVovLnXLFqv
 xV3vYayy/5b0myjf+Cns16eSVe87Fbk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-rrpti3O1N_-CmfEvbKRv1w-1; Tue, 23 Mar 2021 10:40:16 -0400
X-MC-Unique: rrpti3O1N_-CmfEvbKRv1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DA661B18BC3;
 Tue, 23 Mar 2021 14:40:15 +0000 (UTC)
Received: from [10.3.112.201] (ovpn-112-201.phx2.redhat.com [10.3.112.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9BAD18BAC;
 Tue, 23 Mar 2021 14:40:11 +0000 (UTC)
Subject: Re: [PATCH 10/28] qapi: Rework name checking in preparation of
 stricter checking
To: John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-11-armbru@redhat.com>
 <ed036808-1666-8efd-14d4-dfe0863dfa4a@redhat.com>
 <c0da3a0f-da39-80e1-8f02-3ffa0b9e9fb0@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <2944aa2d-03fa-da25-feaf-ffcf503edfae@redhat.com>
Date: Tue, 23 Mar 2021 09:40:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c0da3a0f-da39-80e1-8f02-3ffa0b9e9fb0@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: michael.roth@amd.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 9:30 AM, John Snow wrote:
> On 3/23/21 10:20 AM, Eric Blake wrote:
>>> -valid_name = re.compile(r'^(__[a-zA-Z0-9.-]+_)?'
>>> -                        '[a-zA-Z][a-zA-Z0-9_-]*$')
>> I'm assuming python concatenates r'' with '' in the obvious manner...
>>
> 
> FWIW, I don't think it does, actually. I believe you do need to spell
> out each individual string constant with what type it is.
> 
> (In this case, missing the second r has no effect as there are no
> backslash sequences in the string.)

Aha -
https://docs.python.org/3/reference/lexical_analysis.html#string-literal-concatenation
talks about it more, and even mentions that joining r'' with plain '' is
useful for scenarios where you want easier use of \ through only part of
your overall literal (since string literal concatenation is performed at
compile time).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


