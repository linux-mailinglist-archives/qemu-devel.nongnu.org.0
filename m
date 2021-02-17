Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A98B31D44E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 04:43:20 +0100 (CET)
Received: from localhost ([::1]:53294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCDkF-0001u0-A5
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 22:43:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCDjO-00016m-VL
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 22:42:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCDjN-0003jL-GJ
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 22:42:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613533344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ypfPe3eoxfCfFIusV25B455xpo9RPGedRRdnQxR3mu0=;
 b=Dbe4pxzHIw1ets7NJAG3VRpVvE6YPKmJ2Zxw1hM8vzCCttfA7CptOqXrx/1IUACDGtstEC
 gEwUHO5psdHZsJ9wRSwposayW6TIYLw17al/6QfrtrzP9wMnQDpGtcOtzCZFyh998barKd
 OaoBC6Jj3Pygbpm/xrHl7hO0ufDQACs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-pwF8L5EjNKmhaYTQeAmxCQ-1; Tue, 16 Feb 2021 22:42:21 -0500
X-MC-Unique: pwF8L5EjNKmhaYTQeAmxCQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAA5A801975;
 Wed, 17 Feb 2021 03:42:19 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0B4E5D9C0;
 Wed, 17 Feb 2021 03:42:13 +0000 (UTC)
Subject: Re: [PATCH v4 08/24] python: Add pipenv support
To: Cleber Rosa <crosa@redhat.com>
References: <20210211185856.3975616-1-jsnow@redhat.com>
 <20210211185856.3975616-9-jsnow@redhat.com>
 <YCyGnK3DQXkVnsx+@localhost.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <bf0f1100-61d9-4db9-193c-fc322995958d@redhat.com>
Date: Tue, 16 Feb 2021 22:42:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YCyGnK3DQXkVnsx+@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 9:59 PM, Cleber Rosa wrote:
> On Thu, Feb 11, 2021 at 01:58:40PM -0500, John Snow wrote:
>> pipenv is a tool used for managing virtual environments with pinned,
>> explicit dependencies. It is used for precisely recreating python
>> virtual environments.
>>
>> pipenv uses two files to do this:
>>
>> (1) Pipfile, which is similar in purpose and scope to what setup.py
>> lists. It specifies the requisite minimum to get a functional
>> environment for using this package.
>>
>> (2) Pipfile.lock, which is similar in purpose to `pip freeze >
>> requirements.txt`. It specifies a canonical virtual environment used for
>> deployment or testing. This ensures that all users have repeatable
>> results.
>>
>> The primary benefit of using this tool is to ensure repeatable CI
>> results with a known set of packages. Although I endeavor to support as
>> many versions as I can, the fluid nature of the Python toolchain often
>> means tailoring code for fairly specific versions.
>>
>> Note that pipenv is *not* required to install or use this module; this is
>> purely for the sake of repeatable testing by CI or developers.
>>
>> Here, a "blank" pipfile is added with no dependencies, but specifies
>> Python 3.6 for the virtual environment.
>>
>> Pipfile will specify our version minimums, while Pipfile.lock specifies
>> an exact loudout of packages that were known to operate correctly. This
> 
> Layout? Loadout?

Whoops, "loadout", yeah.

> 
>> latter file provides the real value for easy setup of container images
>> and CI environments.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   python/Pipfile | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>   create mode 100644 python/Pipfile
>>
> 
> Other than that,
> 
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> 

Thanks!


