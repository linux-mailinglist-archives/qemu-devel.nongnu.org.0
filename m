Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 470DA2EBDBD
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 13:32:33 +0100 (CET)
Received: from localhost ([::1]:55930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx7zM-0006Rh-9P
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 07:32:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kx7xn-0005PL-Kf
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 07:30:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kx7xm-0005LJ-2f
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 07:30:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609936253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M/PrDh9SLoONzg5P+Oo3SWjw7FFjoJKRmPJNFUru368=;
 b=TZ4Fp2Ua73EHn9QROmZcfAyzBAGWcT2xH9YqE9kYDOMsMfaI0MB2zVLVd9sW0+prI6LWCW
 WZBzrDWNJ+LuuwjuBI2fhFJitLQO1kNZUD5dSbI2iansWET9CZ/s2pc3pbLfkKBQUybLWg
 71pI6yPNGzcF6mr6ia+87BbfpSPi77k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-hyEy7sM3OgaCV1tap_HsEA-1; Wed, 06 Jan 2021 07:30:49 -0500
X-MC-Unique: hyEy7sM3OgaCV1tap_HsEA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62EA4192AB74;
 Wed,  6 Jan 2021 12:30:48 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-219.ams2.redhat.com [10.36.112.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 359DF5D9CA;
 Wed,  6 Jan 2021 12:30:46 +0000 (UTC)
Subject: Re: [PATCH] cirrus: don't run full qtest on macOS
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210106114159.981538-1-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ca9f61e8-bcd8-9981-327c-04ac2bcec4b8@redhat.com>
Date: Wed, 6 Jan 2021 13:30:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210106114159.981538-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/01/2021 12.41, Daniel P. Berrangé wrote:
> The Cirrus CI macOS build hosts have exhibited a serious performance
> degradation in recent months. For example the "qom-test" qtest takes
> over an hour for only the qemu-system-aarch64 binary. This is as much
> 20-40 times slower than other environments. The other qtests all show
> similar performance degradation, as do many of the unit tests.
> 
> This does not appear related to QEMU code changes, since older git
> commits which were known to fully complete in less than 1 hour on
> Cirrus CI now also show similar bad performance. Either Cirrus CI
> performance has degraded, or an change in its environment has exposed
> a latent bug widely affecting all of QEMU. Debugging the qom-test
> showed no easily identified large bottleneck - every step of the
> test execution was simply slower.
> 
> macOS builds/tests run outside Cirrus CI show normal performance.
> 
> With an inability to identify any obvious problem, the only viable
> way to get a reliably completing Cirrus CI macOS job is to cut out
> almost all of the qtests. We choose to run the x86_64 target only,
> since that has very few machine types and thus is least badly
> impacted in the qom-test execution.

Sad that we have to do this, but as long as we still can run the x86 qtests, 
that's certainly better than nothing.

Reviewed-by: Thomas Huth <thuth@redhat.com>


