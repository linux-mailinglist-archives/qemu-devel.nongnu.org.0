Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D6C292EA5
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 21:42:52 +0200 (CEST)
Received: from localhost ([::1]:46974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUb3T-0004S1-5r
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 15:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kUb1d-0003yw-TR
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 15:40:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kUb1b-0005tP-TU
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 15:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603136453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=InY70C3lWFhrMyRiRzvpVDaetODsGFE2XBRTwmGz47M=;
 b=AqYvFeg4DYwuLlVAmGERhegmu9o4wd4tv2uXXtneKdFMO8zJVrs3bYLMalKe5J6aLG0k4E
 cMMCKmUge3hqJhGVz8Mk2N8brzyLzEOycpdqBjznSpSghSQmgSvRb5JUGnw1bmxtg7V2Mf
 8oS2b1/r0lJQXDlfR6k2oH9Qe5paUfQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-SXRrQTY3NS-Jl73XlT-3ug-1; Mon, 19 Oct 2020 15:40:51 -0400
X-MC-Unique: SXRrQTY3NS-Jl73XlT-3ug-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16A221054FA7;
 Mon, 19 Oct 2020 19:40:50 +0000 (UTC)
Received: from [10.3.112.28] (ovpn-112-28.phx2.redhat.com [10.3.112.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7D8C5D9D2;
 Mon, 19 Oct 2020 19:40:49 +0000 (UTC)
Subject: Re: [PULL 18/22] meson: Move the detection logic for sphinx to meson
To: luoyonggang@gmail.com, Paolo Bonzini <pbonzini@redhat.com>
References: <20201016114814.1564523-1-pbonzini@redhat.com>
 <20201016114814.1564523-19-pbonzini@redhat.com>
 <CAE2XoE8cF3Bse9AE3zb9GGqmygqDx1=zxXHF6OE9an_ridWVsw@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b80a46c4-e716-4425-7372-d8dcf415a22a@redhat.com>
Date: Mon, 19 Oct 2020 14:40:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAE2XoE8cF3Bse9AE3zb9GGqmygqDx1=zxXHF6OE9an_ridWVsw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 15:28:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-level <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/16/20 8:27 AM, 罗勇刚(Yonggang Luo) wrote:
> On Fri, Oct 16, 2020 at 7:48 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>>

Meta-comment.  Your quoting style leaves a lot to be desired:


>> -    if test "$docs" = "yes" ; then
>> -      if has $sphinx_build && test "$sphinx_ok" != "yes"; then
>> -        echo "Warning: $sphinx_build exists but it is either too old or
> uses too old a Python version" >&2
>> -      fi
>> -      feature_not_found "docs" "Install a Python 3 version of
> python-sphinx"
>> -    fi

Here, your mailer wrapped lines but did not quote the wrapped portion, 
while...

>> +  if not build_docs
>> +    warning('@0@ exists but it is either too old or uses too old a
> Python version'.format(sphinx_build_option))
> Here need to be get_option('sphinx_build')

...here you added new content without any newline separator, right after 
another case of a mailer wrapping a line.  It makes it very difficult to 
decipher which text you are quoting and which text you are adding.

You may want to consider using a better mail engine that does not split 
quoted lines incorrectly, as well as using a blank line both before and 
after every block of your inline replies, to call more visual attention 
to what you are adding to the conversation.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


