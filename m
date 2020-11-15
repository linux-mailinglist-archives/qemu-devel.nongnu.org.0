Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBF62B352B
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 15:02:26 +0100 (CET)
Received: from localhost ([::1]:54200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keIbp-0006D7-Ag
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 09:02:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1keIaA-0005aK-Ap
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 09:00:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1keIa6-0005xK-J7
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 09:00:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605448830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UyU2OVlF0gh+xjMok96EChBtXb/KyVlQn3tdtAPnFaE=;
 b=L/fUyLxFYn1Zbhl8vDcwcYIIvZdcOQ9veHwoNCV/hPdE0BMRaEBvZjQfj80NmsMt9kBOqX
 kOjPIqnQ92Aq67xnXqJsuG4To5uO4xdSgFFkQxxrGs3yNpgNlPYqWex4TaVk+62bDpUnqq
 L+2WPXY1dB3nsEImbLdHCpGo+baFYgA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-OXRYsBuJNjeZyvL8D1jk4w-1; Sun, 15 Nov 2020 09:00:27 -0500
X-MC-Unique: OXRYsBuJNjeZyvL8D1jk4w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48ED5809DD3;
 Sun, 15 Nov 2020 14:00:26 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-23.ams2.redhat.com [10.36.112.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E415321E93;
 Sun, 15 Nov 2020 14:00:16 +0000 (UTC)
Subject: Re: [PATCH 3/4] configure: Add a proper check for sys/ioccom.h and
 use it in tpm_ioctl.h
To: luoyonggang@gmail.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20201114165137.15379-1-thuth@redhat.com>
 <20201114165137.15379-4-thuth@redhat.com>
 <CAE2XoE9yU4S=N5eQKaY6NHCVFOQPg+WQFiv05SbrtrUUMWmMQg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <44c43a8c-2b10-a951-6aaa-813a7db325a2@redhat.com>
Date: Sun, 15 Nov 2020 15:00:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE9yU4S=N5eQKaY6NHCVFOQPg+WQFiv05SbrtrUUMWmMQg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 08:01:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-level <qemu-devel@nongnu.org>, David CARLIER <devnexen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/11/2020 17.56, 罗勇刚(Yonggang Luo) wrote:
> Can we check this in meson.build?

That would be nicer, indeed, but I did not spot a place where I could add my
code there ... all the other HAVE_xxx_H symbols are added in the configure
script.
Maybe Paolo or Marc-André (now on CC:) have an idea whether it could be done
easily in meson.build?, too?

 Thomas


> On Sun, Nov 15, 2020 at 12:53 AM Thomas Huth <thuth@redhat.com
> <mailto:thuth@redhat.com>> wrote:
>>
>> On Solaris and Haiku, the _IO() macros are defined in <sys/ioccom.h>.
>> Add a proper check for this header to our configure scripts, and
>> make sure to include the header in tpm_ioctl.h to fix a build failure
>> on Solaris and Haiku.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com <mailto:thuth@redhat.com>>
>> ---
>>  backends/tpm/tpm_ioctl.h |  4 ++++
>>  configure                | 11 ++++++++++-
>>  nbd/nbd-internal.h       |  2 +-
>>  3 files changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/backends/tpm/tpm_ioctl.h b/backends/tpm/tpm_ioctl.h
>> index f5f5c553a9..bd6c12cb86 100644
>> --- a/backends/tpm/tpm_ioctl.h
>> +++ b/backends/tpm/tpm_ioctl.h
>> @@ -12,6 +12,10 @@
>>  #include <sys/uio.h>
>>  #include <sys/ioctl.h>
>>
>> +#ifdef HAVE_SYS_IOCCOM_H
>> +#include <sys/ioccom.h>
>> +#endif
>> +
>>  /*
>>   * Every response from a command involving a TPM command execution must hold
>>   * the ptm_res as the first element.
>> diff --git a/configure b/configure
>> index c0acda164d..764e903748 100755
>> --- a/configure
>> +++ b/configure
>> @@ -3123,6 +3123,13 @@ if check_include "sys/signal.h" ; then
>>    have_sys_signal_h=yes
>>  fi
>>
>> +#########################################
>> +# sys/ioccom.h check
>> +have_sys_ioccom_h=no
>> +if check_include "sys/ioccom.h" ; then
>> +  have_sys_ioccom_h=yes
>> +fi
>> +
>>  ##########################################
>>  # VTE probe
>>
>> @@ -6214,7 +6221,9 @@ fi
>>  if test "$have_sys_signal_h" = "yes" ; then
>>      echo "HAVE_SYS_SIGNAL_H=y" >> $config_host_mak
>>  fi
>> -
>> +if test "$have_sys_ioccom_h" = "yes" ; then
>> +    echo "HAVE_SYS_IOCCOM_H=y" >> $config_host_mak
>> +fi
>>  # Work around a system header bug with some kernel/XFS header
>>  # versions where they both try to define 'struct fsxattr':
>>  # xfs headers will not try to redefine structs from linux headers
>> diff --git a/nbd/nbd-internal.h b/nbd/nbd-internal.h
>> index 60629ef160..1b2141ab4b 100644
>> --- a/nbd/nbd-internal.h
>> +++ b/nbd/nbd-internal.h
>> @@ -19,7 +19,7 @@
>>  #ifndef _WIN32
>>  #include <sys/ioctl.h>
>>  #endif
>> -#if defined(__sun__) || defined(__HAIKU__)
>> +#ifdef HAVE_SYS_IOCCOM_H
>>  #include <sys/ioccom.h>
>>  #endif
>>
>> --
>> 2.18.4
>>
>>
> 
> 
> --
>          此致
> 礼
> 罗勇刚
> Yours
>     sincerely,
> Yonggang Luo


