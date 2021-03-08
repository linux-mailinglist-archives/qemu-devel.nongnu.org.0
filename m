Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5CD3312DB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 17:07:56 +0100 (CET)
Received: from localhost ([::1]:41328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJIQF-00063a-71
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 11:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJIOF-0004UI-BZ
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:05:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJIOB-0002fD-BF
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:05:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615219543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VqxDODeZlYNvl3sPedY9ipJXdFHi/HzWqFExp66Ji4o=;
 b=BT7gqItyhtQGSoswdHvT02ulraidqYs4Y9wD96ZdDwdo06KuLXJ5RG4uoMwqRMpymCyC1v
 g8N731Bl+eaQhbPssodGtZe/1ppWjrZP3qGnATcAvmDN87IWLHi+gZrzvDL2D13j4VN3wR
 K1CWslldW5By/2ZzDz52JBFChjnKh9E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-UVj2WCfFOYOQCqLvW6FkKg-1; Mon, 08 Mar 2021 11:05:39 -0500
X-MC-Unique: UVj2WCfFOYOQCqLvW6FkKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEAE819057AA;
 Mon,  8 Mar 2021 16:05:38 +0000 (UTC)
Received: from [10.3.112.36] (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BF9A80479;
 Mon,  8 Mar 2021 16:05:37 +0000 (UTC)
Subject: Re: [PATCH] inet_parse: Clarify IPv6 comment and error message
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Doug Evans <dje@google.com>
References: <20210308002928.3385275-1-dje@google.com>
 <161516362431.11025.2679751497781286596@c667a6b167f6>
 <CADPb22R89=EcWFcuFABZP3=L3CbUEq1eKPqNJY=SqDSoZ+CDnQ@mail.gmail.com>
 <YEYKy65zOHUWVu/D@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <93eef612-08f6-7eb2-0d1b-de2ff0a58433@redhat.com>
Date: Mon, 8 Mar 2021 10:05:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YEYKy65zOHUWVu/D@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 5:30 AM, Daniel P. Berrangé wrote:
> On Sun, Mar 07, 2021 at 05:31:24PM -0800, Doug Evans wrote:
>> Not sure how this "Author email address is mangled" happened.
>>
>> $ git format-patch -o patches/error-parsing-ipv6 -1
>> $ git send-email --to='qemu-devel@nongnu.org,Samuel Thibault <
>> samuel.thibault@ens-lyon.org>,"Daniel P. Berrangé" <berrange@redhat.com>' \
>> --smtp-server=foo
>> patches/error-parsing-ipv6/0001-inet_parse-Clarify-IPv6-comment-and-error-message.patch
>>
>> It's possible my smtp-server arg munged things incorrectly, but I've done
>> the identical thing for previous patches and not seen this for at least
>> some of them.
>> Sigh.
> 
> The 'via <qemu-devel@nongnu.org>' mangling is something that gnu.org
> mailman is configured to do. It used to do this in many scenarios, but
> supposedly it now only mangles when the sender has a bad DKIM signature
> and their domain has strict DMARC policies:
> 
>   https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg00416.html

And the solution to avoid triggering the check failure is to include
'From: you <real@address>' as the first line of the body (which will
then override whatever header mangling the list inflicted on your
message).  There are supposedly ways to configure git to do this
automatically for you as part of 'git send-email', but as I don't suffer
from the problem, I'm not sure off-hand what those steps are (git config
format.from ?)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


