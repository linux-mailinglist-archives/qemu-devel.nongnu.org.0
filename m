Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFAB31C40C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 23:29:27 +0100 (CET)
Received: from localhost ([::1]:35266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBmMw-0003eg-KA
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 17:29:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBmLU-0002fE-I8
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 17:27:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBmLT-0007fg-39
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 17:27:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613428074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yc63Ej0tOiKDmlDwH8yOnHfUumkkhBI4Fv+5rim19pc=;
 b=OglgTBqOMYucx2jmgqnAGg3BHWpNblJd9bUThwed0FOt5kekiNzwHz3JDHq6wkdIj+OlVu
 mEV11JG9GX22WffcrAeXw8WBfpReOUJmMun2uojI4EhgwQPOdXZi7qp9r8j2F3Aj9vG49g
 hJ6waol7dQ6RDwrjXVL4M4wPlwsltCU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-UjUsGpd_PlyxECBAkqwFzQ-1; Mon, 15 Feb 2021 17:27:52 -0500
X-MC-Unique: UjUsGpd_PlyxECBAkqwFzQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B98E910066EE;
 Mon, 15 Feb 2021 22:27:51 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04BD92BFEC;
 Mon, 15 Feb 2021 22:27:46 +0000 (UTC)
Subject: Re: [PATCH 2/6] Python: expose QEMUMachine's temporary directory
To: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210211220146.2525771-1-crosa@redhat.com>
 <20210211220146.2525771-3-crosa@redhat.com>
 <3830f6ae-5f92-fc0f-99dd-0783c1cd13a2@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <a541cda7-47db-fc58-cd4d-e7a3aa8f0189@redhat.com>
Date: Mon, 15 Feb 2021 17:27:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <3830f6ae-5f92-fc0f-99dd-0783c1cd13a2@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 1:50 PM, Wainer dos Santos Moschetta wrote:
> 
> In qtest.QEMUQtestMachine.__init__(), the argument named 'test_dir' 
> still make sense, right?
> 
> - Wainer

It might upset pylint/mypy to rename parameters in the initializer for a 
parent class. If we rename it in the base class, we should rename it in 
the descendants, too.

(I say "might" because I have not yet worked out under the exact 
conditions that mypy will give you LSP warnings for initializer methods. 
It definitely doesn't always seem to, but I have run afoul of it enough 
times that I try to avoid it as a matter of habit now.)


