Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE102F43DC
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 06:32:04 +0100 (CET)
Received: from localhost ([::1]:39098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzYlH-0007Sv-Gt
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 00:32:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzYk8-0006pE-BF
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 00:30:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzYk4-0004j3-7J
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 00:30:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610515846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0KkXWVz5Bmd7OBjSqWMQL191G3U8LlK52W0GZ47OAmE=;
 b=VYUOS7L85J7eqAzX/HQyZ0+RJOj5vrACixU/rthJrb5PeqjKhPonAEmnblpt0Ff7ZKBmS7
 KCVXCTCMYEi7e3wN+G1XJuDQHeMjQnCfuXL4TuLMnYbYLf6n5DOSaa7D4p7Yf37oXa86dW
 qfywSbOXJLRplL1qoO8t8lQ6MZpceeQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-4ahDl-ALNT-H7zoWWbfQtA-1; Wed, 13 Jan 2021 00:30:44 -0500
X-MC-Unique: 4ahDl-ALNT-H7zoWWbfQtA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6343A180A086;
 Wed, 13 Jan 2021 05:30:43 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-122.ams2.redhat.com [10.36.112.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2617071D50;
 Wed, 13 Jan 2021 05:30:37 +0000 (UTC)
Subject: Re: [PATCH 1/3] tests/acceptance: Move the pseries test to a separate
 file
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org, 
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210112164045.98565-1-thuth@redhat.com>
 <20210112164045.98565-2-thuth@redhat.com>
 <6cb6f7dd-2f9e-05c3-0efe-8f7f9f75fe84@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <67dde2d9-1d87-35fa-9233-9264b0731e28@redhat.com>
Date: Wed, 13 Jan 2021 06:30:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <6cb6f7dd-2f9e-05c3-0efe-8f7f9f75fe84@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/01/2021 19.50, Wainer dos Santos Moschetta wrote:
> Hi,
> 
> On 1/12/21 1:40 PM, Thomas Huth wrote:
>> Let's gather the POWER-related tests in a separate file.
> 
> 
> Did you consider having others ppc/ppc64 boot tests together too?
> 
> Some candidates:
> 
> tests/acceptance/boot_linux.py:BootLinuxPPC64.test_pseries_tcg
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_ppc64_e500
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_ppc_g3beige
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_ppc_mac99

The e500, g3beige and mac99 tests are depending on the do_test_advcal_2018() 
function in that file, so I think they should rather stay there.

> tests/acceptance/ppc_prep_40p.py:IbmPrep40pMachine.test_factory_firmware_and_netbsd 
> tests/acceptance/ppc_prep_40p.py:IbmPrep40pMachine.test_openbios_192m
> tests/acceptance/ppc_prep_40p.py:IbmPrep40pMachine.test_openbios_and_netbsd

That's a good point, I did not notice that file when writing my patches. 
Philippe, since you've created this ppc_prep_40p.py file, what do you think, 
should it be merged with the other ppc tests, or shall we rather keep this 
separate?

  Thomas


