Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3DA4D212E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 20:14:53 +0100 (CET)
Received: from localhost ([::1]:54904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRfIK-0007Du-AU
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 14:14:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRfHP-0006Qz-IL
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 14:13:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRfHM-0003UX-E1
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 14:13:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646766830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GQL0zIvMFuUuP0hymk/dstigj9winw610LDCkGX7nq0=;
 b=E/psaZfssXWVrpgS+707JL/P5O+aISVISeNgEZGfNO2uEZc1lxXQiZnZPy2uMvjGvKuDkk
 gbEQm/knmH9Pn1jKaaW8LW1nArDQWGJhT7eRxTZSD4DphN6ecc9qNWT5fOojcLE0B/AlD6
 M7qrtb2ngtc0ILyUijOWBjEjY/xHvVY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-qPcq9CtHMPKboL3tf6LGBg-1; Tue, 08 Mar 2022 14:13:48 -0500
X-MC-Unique: qPcq9CtHMPKboL3tf6LGBg-1
Received: by mail-wr1-f71.google.com with SMTP id
 t15-20020adfdc0f000000b001ef93643476so5759489wri.2
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 11:13:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GQL0zIvMFuUuP0hymk/dstigj9winw610LDCkGX7nq0=;
 b=Z+vNCO3tUMp7DrM5CUQ7qaguJ7WHGjAzOOSZGWEpuBnGZOtlBULKFrzBr4SQ43DQ9J
 DYSSNudo9z4LPDBqTLd6gt25UapqIvfMZhaV3Ka7E2e7lfJlKj7JdA2yS62172GYnEOm
 MNTPlDEPFRvxncTvwqXSiQc+YKBHgxYRWaeqfBnEamehRas1IEZMN5Em3iNZ+IIEEKTZ
 0TrJuf7P3a69XBI/YrQlZTibc1HncSyu9hl0TcRcRtpyPTKE1kplAdFWpVtdIwDA/JmI
 CI7yiwp+15RwugVyAJJNEjpWK88zLLKzhkYcVrdU3Fbea/r+agJxz4uqLV0w7FWyq5E6
 32yg==
X-Gm-Message-State: AOAM532XxPIGnknfGocZ1NtSm3VXgPB8EY38HPdm/QLK8bI7NTpceK+f
 7CXnN1vQhqLnJPAF+ndZDK1gNROGgBdKUuJsANDeuaz8zY9iVPGu5IcYzQPD3AmqZS0rfgmMCOF
 SsRqvXaQP7i8MdR4=
X-Received: by 2002:a05:6000:1885:b0:1fc:a88b:d358 with SMTP id
 a5-20020a056000188500b001fca88bd358mr5939467wri.139.1646766827548; 
 Tue, 08 Mar 2022 11:13:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkHTHjJKzfEU0zQWp8Pyk910yOgo4Ktog1GJwyDk82ObUl/pkdk4q5F9dcymKQorXlCfMFVQ==
X-Received: by 2002:a05:6000:1885:b0:1fc:a88b:d358 with SMTP id
 a5-20020a056000188500b001fca88bd358mr5939449wri.139.1646766827316; 
 Tue, 08 Mar 2022 11:13:47 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 q16-20020a056000137000b001f046a21afcsm14885564wrz.15.2022.03.08.11.13.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 11:13:46 -0800 (PST)
Message-ID: <7188b069-5a79-452a-ff1e-d6387771e137@redhat.com>
Date: Tue, 8 Mar 2022 20:13:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] tests/avocado: Cancel BootLinux tests in case there is no
 free port
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220228114325.818294-1-thuth@redhat.com>
 <YiX/kzf7cW+YcNN5@redhat.com>
 <82a2233a-8bd2-66ef-b8f0-d44c039eeb52@redhat.com>
 <YiZTggnk26UymcVY@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YiZTggnk26UymcVY@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/03/2022 19.48, Daniel P. Berrangé wrote:
> On Mon, Mar 07, 2022 at 07:31:50PM +0100, Thomas Huth wrote:
>> On 07/03/2022 13.50, Daniel P. Berrangé wrote:
>>> On Mon, Feb 28, 2022 at 12:43:25PM +0100, Thomas Huth wrote:
>>>> The BootLinux tests are currently failing with an ugly python
>>>> stack trace on my RHEL8 system since they cannot get a free port
>>>> (likely due to the firewall settings on my system). Let's properly
>>>> check the return value of find_free_port() instead and cancel the
>>>> test gracefully if it cannot get a free port.
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>    Unfortunately, it still takes > 70 seconds for each and every
>>>>    tests from tests/avocado/boot_linux.py to get canceled, so
>>>>    tests/avocado/boot_linux.py still renders "make check-avocado"
>>>>    for me pretty unusable... looking at the implementation of
>>>>    find_free_port() in Avocado, I wonder whether there isn't a
>>>>    better way to get a free port number in Python? Brute-forcing
>>>>    all ports between 1024 and 65536 seems just quite cumbersome
>>>>    to me...
>>>
>>> Even in the worst case of testing every single port,
>>> for INET and INET6 and for STREAM and DGRAM sockets,
>>> that find_free_port port completes in a couple of
>>> seconds.
>>
>> Weird, on my system, the test runs for 70 seconds, just to finally
>> discovered that there was no free port available.
> 
> Incidentally I'm really suprised you even hit the 'no free port'
> scenario. I've never seen that happen unless the machine was
> basically doomed due to something leaking open sockets by the
> 10's of 1000's.
> 
> You mention firewall settings above, but I don't think that's
> relevant. The find_free_port() call is with no args, so it
> gets set to 'address=localhost' which means is_port_free
> takes the bind() codepath. The firewall has no interaction
> with the bind() codepath in the kernel AFAIK.

Yes, I've now had another closer look, and indeed, the firewall is not the 
problem here - but is_port_free() seems to be very buggy. The problem is 
that I do not have any IPv6 address configured on my system, and in that 
case the current code fails.
See https://github.com/avocado-framework/avocado/issues/5273 ... I need this 
patch to fix it:

diff --git a/avocado/utils/network/ports.py b/avocado/utils/network/ports.py
--- a/avocado/utils/network/ports.py
+++ b/avocado/utils/network/ports.py
@@ -60,7 +60,7 @@ def is_port_free(port, address):
                      if localhost:
                          return False
                  sock.close()
-        return True
+                return True
      finally:
          if sock is not None:
              sock.close()

  Thomas


