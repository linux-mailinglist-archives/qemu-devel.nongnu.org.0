Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7E431C25F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 20:20:57 +0100 (CET)
Received: from localhost ([::1]:47262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBjQW-0005ia-Mk
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 14:20:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBjNp-0004jg-Oj
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:18:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBjNi-0002W2-Rd
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:18:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613416681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=poZG751Ra5TL7XL5QSphV8ggiI26Dt9wsp4+8xp+jN0=;
 b=HsYWDFigpG69cWZsbw3J9GWFE2sjBZYhgmS6nKxGLKjmj+Jhv4TUMLAa3Uph5TtDT1CkIr
 OKMGZMhAB6ghUQ18M1Q5B3kkcOw53BJu9RLG4A8Gqugaj1wvnsjbmVy4F+9/WvRdj1z7g1
 d4sJXb6UWps6Zi1zxsKcEGZMkBUJZzc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-X4em6XvlMP-13P6U0YAhJw-1; Mon, 15 Feb 2021 14:17:59 -0500
X-MC-Unique: X4em6XvlMP-13P6U0YAhJw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0A1E1005501;
 Mon, 15 Feb 2021 19:17:58 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57D525B698;
 Mon, 15 Feb 2021 19:17:54 +0000 (UTC)
Subject: Re: [PATCH] tests/qtest/boot-sector: Check that the guest did not
 panic
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>
References: <20210212113141.854871-1-thuth@redhat.com>
 <32e75366-22fb-823e-2778-ad8fec102060@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <edc49c10-3f28-74ca-c0d8-51ee6c692e3b@redhat.com>
Date: Mon, 15 Feb 2021 14:17:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <32e75366-22fb-823e-2778-ad8fec102060@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/21 8:18 AM, Philippe Mathieu-Daudé wrote:
> Interesting idea. Does it make sense to have a similar (optional?) check
> done in QEMUMachine? This could benefit integration tests, quicker exit
> on failure.
> 

That might be the wrong layer to do it in. I am trying to keep 
QEMUMachine be the mechanisms, not the policy. Not all QEMUMachine 
instances even have a QMP socket, either.

Having shared code (somewhere) that allows you to do stuff like issue a 
query status every sec to do a more pro-active heartbeat check on-demand 
is probably a good idea, though:

e.g.

vm = QEMUManagedMachine(...)
with vm.start_heartbeat() as heartbeat:
     ... do things prone to failure here ...
     ...
     ...
# as of here, the heartbeat has been stopped


It might be worth looking into creating a "value-added" version of 
QEMUMachine that offers stuff like this, in a manner similar to how 
iotests has its own extended versions of the QEMUMachine to offer 
test-specific behavior.

(Patches welcome!)

--js


