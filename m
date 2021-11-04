Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DA24453F5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 14:34:01 +0100 (CET)
Received: from localhost ([::1]:56048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1micsS-0002kp-8a
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 09:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1micGG-0008Pe-Ms
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 08:54:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1micGF-00023t-3S
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 08:54:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636030470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GNVdmyBvJ25iGMkzIFiShT7CfytGwYFyADCsCEbFHhE=;
 b=eWvGQcGGzURNfjwTZpUF9ViXTQCh1oOWv0pCdXgDFxBeRzGiTzhBqZ6osyPIzI5GPWmpti
 58cu11SLD2GSqDccA2j0yEFvpXKyW6V3gVe4CE6I6Sxjm/arFcKhRcaiw4QFvpO6U0/Dn0
 1T8AzwA+0ULN9LMDB8LaruMZp9eQ7G8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-0JXG_-d1O8KZQS-wfLiM6w-1; Thu, 04 Nov 2021 08:54:28 -0400
X-MC-Unique: 0JXG_-d1O8KZQS-wfLiM6w-1
Received: by mail-ed1-f71.google.com with SMTP id
 s12-20020a50dacc000000b003dbf7a78e88so5640974edj.2
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 05:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GNVdmyBvJ25iGMkzIFiShT7CfytGwYFyADCsCEbFHhE=;
 b=lIi/PNAVhcZxa+QJteI1IqY96nke6YQSp00sGYA0WretgN7Fa3Iym6fJMTi46lG3Cm
 UbKS/quK7oKOsFhx5Z5TTwZH59+IFgbrbQZfQuT1fkBJCuo1YZ6WxCiqJo/NshxdNj9q
 DO5rNHWDgvnRLRSpQOoAF4lsath3+Zy31GXNFv0ofc0KSrhdRv4/4LFcpFB19/dP4Mx8
 pO3gPdTR+M4cQ0aMJt7pwDyBlMym2N1dhbxUE/PxLURZ8sC+sCxTTk2zSVelmVZPSdJF
 Dgyr3TSRzh0lNj5XC5Fgo40DF0jCop7LmyPK+3kyg5QaqABWTU2Bc5uM85wBZGJBi/4Z
 HWLA==
X-Gm-Message-State: AOAM530EiJYSDC2Mv5++SUHh9KnKNolZYvDQxvuCxfxuFZZw1a5tycji
 D56knLfqqLDVthrK3oGLrsIRqlDKnVh6BwT/J5qKPDBudbf4Ayo28tG+qb8Jn+DFGCeW3W7ipTP
 YMhzBLfNPGpwYGss=
X-Received: by 2002:a17:906:6088:: with SMTP id
 t8mr63498839ejj.537.1636030467413; 
 Thu, 04 Nov 2021 05:54:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyj3DCU1X6lnQ5lsT4lZ62RXmN/vNTtcwDlBamAS9WNyMf6JI7uUjcS9Js9vmO57ABLxxhduA==
X-Received: by 2002:a17:906:6088:: with SMTP id
 t8mr63498798ejj.537.1636030467061; 
 Thu, 04 Nov 2021 05:54:27 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id qb21sm2993299ejc.78.2021.11.04.05.54.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 05:54:26 -0700 (PDT)
Message-ID: <c9debb07-6e36-fd04-bb80-6af40266897b@redhat.com>
Date: Thu, 4 Nov 2021 13:54:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: more bogus meson warnings
To: Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA9ha4G=AC3p9LKJRC87DkgHVqbrX3X8RPg7vVR_F1Kt1Q@mail.gmail.com>
 <CABgObfaXJZ1E5593HHMEyhXHVKNu85=KSOhg7VXbt93cKA8fvg@mail.gmail.com>
 <CAFEAcA9KF1437LXv+icrizZYcDiNZPn4KRMd0r7rEZWtDKxjpA@mail.gmail.com>
 <e5eee498-85a4-2f22-2580-9bcd6621f746@redhat.com>
 <CAFEAcA-F-f7TcmbtZTJ8O0q9Ebxf-7aLHbawQCz-jQ5q8xgFRg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA-F-f7TcmbtZTJ8O0q9Ebxf-7aLHbawQCz-jQ5q8xgFRg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/21 12:02, Peter Maydell wrote:
> The link of the test program against libsnappy.a fails because
> it is being linked with cc and nothing is putting the C++ stdlib
> that libsnappy needs on the link line, so you get errors like:
> 
>   /usr/lib/gcc/x86_64-linux-gnu/7/../../../x86_64-linux-gnu/libsnappy.a(snappy.cc.o):
> In function `snappy::internal::WorkingMemory::GetHashTable(unsigned
> long, int*)':
> (.text+0x15b): undefined reference to `operator new[](unsigned long)'

That's interesting.  So there was also a bug before moving the test
to meson; statically-linked binaries would not use snappy even if
linking would be done by a C++ compiler.  This should fix it:

diff --git a/meson.build b/meson.build
index e330438270..cbc5c7a868 100644
--- a/meson.build
+++ b/meson.build
@@ -197,6 +197,9 @@ add_project_arguments('-iquote', '.',
  link_language = meson.get_external_property('link_language', 'cpp')
  if link_language == 'cpp'
    add_languages('cpp', required: true, native: false)
+  linker = cxx = meson.get_compiler('cpp')
+else
+  linker = cc
  endif
  if host_machine.system() == 'darwin'
    add_languages('objc', required: false, native: false)
@@ -1111,7 +1114,7 @@ if not get_option('snappy').auto() or have_system
                             required: get_option('snappy'),
                             kwargs: static_kwargs)
  endif
-if snappy.found() and not cc.links('''
+if snappy.found() and not linker.links('''
     #include <snappy-c.h>
     int main(void) { snappy_max_compressed_length(4096); return 0; }''', dependencies: snappy)
    snappy = not_found


> There's generally
> nothing much the user can do about this, beyond file a bug report with
> the distro if they're feeling enthusiastic.

It could be filed in snappy as well, but yeah I'm not feeling
enthusiastic about that.  Besides in this case we're not even using the
.pc file, but rather looking for -lsnappy by hand.

Paolo


