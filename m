Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFF230F395
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 14:01:47 +0100 (CET)
Received: from localhost ([::1]:40248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7eGY-0005rw-GY
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 08:01:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7eEA-0004r0-9c
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 07:59:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7eE6-0006IE-Kg
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 07:59:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612443553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c2cbs1rVZk6NsWyrV2YluY4S4TX9o97NmkGfhKySITY=;
 b=BxUyBNVXTvAOiajsDtuJjNlGM4hlFHYzFFsTqLfRwRpJa+tNLbBqFToXMyE6YH1FGd97AM
 YygUahiHj57Fbif/oe7nJ/ifTdW3kLdm0ZplZhReV0dPK9wxOha99mKgyp+vAci9tgdEWl
 DP8REq+VFF2O6DFH8820lqNNpWjyD1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-GnCc4enJNw2JGW0GDaKg7A-1; Thu, 04 Feb 2021 07:59:11 -0500
X-MC-Unique: GnCc4enJNw2JGW0GDaKg7A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65764100CCC1;
 Thu,  4 Feb 2021 12:59:10 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-90.ams2.redhat.com [10.36.112.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4B5C60D09;
 Thu,  4 Feb 2021 12:59:04 +0000 (UTC)
Subject: Re: [PATCH 1/3] tests/acceptance: Move the pseries test to a separate
 file
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20210112164045.98565-1-thuth@redhat.com>
 <20210112164045.98565-2-thuth@redhat.com>
 <6cb6f7dd-2f9e-05c3-0efe-8f7f9f75fe84@redhat.com>
 <67dde2d9-1d87-35fa-9233-9264b0731e28@redhat.com>
 <23ca4afc-97a9-7438-0182-93cd49271d4e@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3d50bd18-d22b-029b-b473-9221777e0325@redhat.com>
Date: Thu, 4 Feb 2021 13:59:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <23ca4afc-97a9-7438-0182-93cd49271d4e@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/02/2021 09.52, Philippe Mathieu-Daudé wrote:
> Hi Thomas,
> 
> On 1/13/21 6:30 AM, Thomas Huth wrote:
>> On 12/01/2021 19.50, Wainer dos Santos Moschetta wrote:
>>> Hi,
>>>
>>> On 1/12/21 1:40 PM, Thomas Huth wrote:
>>>> Let's gather the POWER-related tests in a separate file.
>>>
>>>
>>> Did you consider having others ppc/ppc64 boot tests together too?
>>>
>>> Some candidates:
>>>
>>> tests/acceptance/boot_linux.py:BootLinuxPPC64.test_pseries_tcg
>>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_ppc64_e500
>>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_ppc_g3beige
>>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_ppc_mac99
>>
>> The e500, g3beige and mac99 tests are depending on the
>> do_test_advcal_2018() function in that file, so I think they should
>> rather stay there.
>>
>>> tests/acceptance/ppc_prep_40p.py:IbmPrep40pMachine.test_factory_firmware_and_netbsd
>>> tests/acceptance/ppc_prep_40p.py:IbmPrep40pMachine.test_openbios_192m
>>> tests/acceptance/ppc_prep_40p.py:IbmPrep40pMachine.test_openbios_and_netbsd
>>>
>>
>> That's a good point, I did not notice that file when writing my patches.
>> Philippe, since you've created this ppc_prep_40p.py file, what do you
>> think, should it be merged with the other ppc tests, or shall we rather
>> keep this separate?
> 
> The choice was deliberate: the PReP machine has a different set of
> maintainers. If possible when we have a particular section in
> MAINTAINERS I'd like to use it as separation, to let the maintainers
> track changes in tests.

Ok, fair point, let's keep it separate then!

  Thomas


