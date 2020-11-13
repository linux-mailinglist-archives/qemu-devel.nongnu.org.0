Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B4B2B1C24
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 14:49:03 +0100 (CET)
Received: from localhost ([::1]:38032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdZRm-0001y5-ED
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 08:49:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kdZQD-00014w-LR
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 08:47:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kdZQA-0004IF-1C
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 08:47:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605275241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9glxtQJdOdTA7AJvaO3gxuZMEBmzd8N1+cc5/WVW7Lo=;
 b=PCPSx8zfx1ETPunVOnM7HXJdnq1+wKsrtEkOnQ4Dqr9+t/O607FSONX1chGccwp70Q4evG
 Q5D2EdZZtAXSKfzbvUD5xMLM2hPhVsNDqiZwheFFynTgc0n2DRlWwpqE83i4GMstJ1pDAh
 iIz01W2FwKnzunEO44fSSGKUQsPkKRg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-aLzE0tlMNUKGXFMO1XyB0Q-1; Fri, 13 Nov 2020 08:47:18 -0500
X-MC-Unique: aLzE0tlMNUKGXFMO1XyB0Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CACF1868401;
 Fri, 13 Nov 2020 13:47:17 +0000 (UTC)
Received: from [10.3.113.51] (ovpn-113-51.phx2.redhat.com [10.3.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33EA25C1C7;
 Fri, 13 Nov 2020 13:47:17 +0000 (UTC)
Subject: Re: [PATCH for-5.2] iotests: Replace deprecated ConfigParser.readfp()
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20201113100602.15936-1-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <51e5149a-5296-8d1f-2095-e8fefcd732ed@redhat.com>
Date: Fri, 13 Nov 2020 07:47:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201113100602.15936-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/13/20 4:06 AM, Kevin Wolf wrote:
> iotest 277 fails on Fedora 33 (Python 3.9) because a deprecation warning
> changes the output:
> 
>     nbd-fault-injector.py:230: DeprecationWarning: This method will be
>     removed in future versions.  Use 'parser.read_file()' instead.
> 
> In fact, readfp() has already been deprecated in Python 3.2 and the
> replacement has existed since the same version, so we can now
> unconditionally switch to read_file().
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  tests/qemu-iotests/nbd-fault-injector.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

I'm happy to queue this through my NBD tree for -rc2.

> 
> diff --git a/tests/qemu-iotests/nbd-fault-injector.py b/tests/qemu-iotests/nbd-fault-injector.py
> index 78f42c4214..6e11ef89b8 100755
> --- a/tests/qemu-iotests/nbd-fault-injector.py
> +++ b/tests/qemu-iotests/nbd-fault-injector.py
> @@ -227,7 +227,7 @@ def parse_config(config):
>  def load_rules(filename):
>      config = configparser.RawConfigParser()
>      with open(filename, 'rt') as f:
> -        config.readfp(f, filename)
> +        config.read_file(f, filename)
>      return parse_config(config)
>  
>  def open_socket(path):
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


