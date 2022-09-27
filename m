Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3432D5ED015
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 00:13:33 +0200 (CEST)
Received: from localhost ([::1]:47024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odIpY-0006ot-Al
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 18:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odIlh-0002ZT-Q7
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 18:09:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odIle-0003Xx-AT
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 18:09:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664316569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X3wCunMGtGrO91GsbILogR07wOi/L4+/7reDKAS3BYU=;
 b=bX8c5AC334BYtZgxBZhslBKuBqjUIuSegeNXKYrOjYKyRZHk+kdalesx1UnSCzjwUJhXpT
 i8+pI2nVWKWLU6ETqZsb38qkDq9sY7NnSGA3unxodk3aOd+xnsQ6DH2k5eGjTPaAvT5IGf
 55W5L2PUqo578WUJmeKpamFm7wnKY84=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-_2EU_8uLOripyi09xcsQJg-1; Tue, 27 Sep 2022 18:09:28 -0400
X-MC-Unique: _2EU_8uLOripyi09xcsQJg-1
Received: by mail-wm1-f70.google.com with SMTP id
 h133-20020a1c218b000000b003b3263d477eso6137463wmh.8
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 15:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=X3wCunMGtGrO91GsbILogR07wOi/L4+/7reDKAS3BYU=;
 b=X5JcPJMXSl3Gw34y9bn3s7QIvq+uyvqpzl2X0dzds2SBTPgY6LRrAreqJuqpmZZP4D
 8vn2SVKhkHrKraLayNlibgfLK7miFPYLhHiXI5bj2dqDnZaEqDl0ZcaA8+X1l9gB9qc5
 k+YxGr8DBhvH6zPWxtw3EWb1h7O2mZ6Ajr7phuxlvD8En1NjYK5Zd7+8pxy0Zg4R9cXN
 dO1Sz+IwU29g4se+8DUGHiIUzEoYEi5D8pkjHR6snK9petyzU9YJXX/8fqzjpJXUCXjv
 i8Zcspbr7HtDPzbgrXHnUlnJ3vQOCMkhdh5kLdIW8CdPA8NH3ob1w96qyOA7iSnS2eCF
 pDBA==
X-Gm-Message-State: ACrzQf2cncrzmqSuFoyJ6tUIZOsHiwBcTXZbCjcaeqZSWVZS53kGp32E
 u3+4yT9FnvvpuBtbeOJXqTr+8yhihYPan0e5nFrUqUYRLihBRTpBEAkxeg9MhL7bAzdTOe2rdmZ
 xvKOZQfj/DzOPNfw=
X-Received: by 2002:adf:f44c:0:b0:228:8686:552f with SMTP id
 f12-20020adff44c000000b002288686552fmr17687319wrp.587.1664316566821; 
 Tue, 27 Sep 2022 15:09:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5elaksUxtExYKS+PSkglKazEQoKREyZbqWcpdwkDS6jA6Mn1jpuA+qlGJ9PzgrmoOLF+u/Rg==
X-Received: by 2002:adf:f44c:0:b0:228:8686:552f with SMTP id
 f12-20020adff44c000000b002288686552fmr17687311wrp.587.1664316566477; 
 Tue, 27 Sep 2022 15:09:26 -0700 (PDT)
Received: from redhat.com ([2.55.47.213]) by smtp.gmail.com with ESMTPSA id
 g20-20020a05600c4ed400b003b4931eb435sm602wmq.26.2022.09.27.15.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 15:09:25 -0700 (PDT)
Date: Tue, 27 Sep 2022 18:09:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, qemu-devel <qemu-devel@nongnu.org>,
 Thomas Huth <thuth@redhat.com>,
 "Maydell, Peter" <peter.maydell@linaro.org>,
 "P. Berrange, Daniel" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 "Mammedov, Igor" <imammedo@redhat.com>
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
Message-ID: <20220927175440-mutt-send-email-mst@kernel.org>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-8-ani@anisinha.ca>
 <CABgObfYW8O-JGhjLm47HmHG7WRhOQDO1EhUCTP59TZo4DnkQVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABgObfYW8O-JGhjLm47HmHG7WRhOQDO1EhUCTP59TZo4DnkQVg@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 27, 2022 at 11:44:56PM +0200, Paolo Bonzini wrote:
> I also second the idea of using avocado instead of pytest, by the way.
> 
> Paolo

I do not think this is a good fit for bios tests.
bios tests are intended for a wide audience of ACPI developers
across a variety of host systems. They basically do not need anything
from the host and they need to be super easy to configure
since we have lots of drive through contributors.


Problem is I don't think avocado is yet at the level where I can
ask random developers to use it to check their ACPI patches.

I just went ahead and rechecked and the situation isn't much better
yet. I think the focus of avocado is system testing of full guests with
KVM, not unit testing of ACPI.

Let's start with installation on a clean box:

following
https://avocado-framework.readthedocs.io/en/98.0/guides/user/chapters/installing.html

Ugh pip, will install a bunch of stuff in ~/.local and ask me to tweak
PATH ... and what about security? No thanks!

So ...
do I want LTS or latest? Well I donnu .... let's try LTS?

$ dnf module enable avocado:82lts
[sudo] password for mst: 
Last metadata expiration check: 6 days, 15:20:21 ago on Wed 21 Sep 2022 02:33:31 AM EDT.
Dependencies resolved.
==========================================================================================================================================
 Package                          Architecture                    Version                          Repository                        Size
==========================================================================================================================================
Enabling module streams:
 avocado                                                          82lts                                                                  

Transaction Summary
==========================================================================================================================================

Is this ok [y/N]: y
Complete!
[mst@tuck linux]$  dnf module install avocado
Last metadata expiration check: 6 days, 15:20:41 ago on Wed 21 Sep 2022 02:33:31 AM EDT.
No default profiles for module avocado:82lts. Available profiles: default, minimal
Error: Problems in request:
broken groups or modules: avocado


Ugh I guess latest then?


[mst@tuck linux]$ dnf module enable avocado:latest
Last metadata expiration check: 6 days, 15:25:21 ago on Wed 21 Sep 2022 02:33:31 AM EDT.
Dependencies resolved.
The operation would result in switching of module 'avocado' stream '82lts' to stream 'latest'
Error: It is not possible to switch enabled streams of a module unless explicitly enabled via configuration option module_stream_switch.
It is recommended to rather remove all installed content from the module, and reset the module using 'dnf module reset <module_name>' command. After you reset the module, you can install the other stream.



Scary ... I don't really know what are streams and I am guessing module
is avocado here? and what will this affect. Oh well, I'll risk this:



[mst@tuck linux]$ dnf module reset  avocado
Last metadata expiration check: 6 days, 15:25:46 ago on Wed 21 Sep 2022 02:33:31 AM EDT.
Dependencies resolved.
==========================================================================================================================================
 Package                          Architecture                    Version                          Repository                        Size
==========================================================================================================================================
Resetting modules:
 avocado                                                                                                                                 

Transaction Summary
==========================================================================================================================================

Is this ok [y/N]: y
Complete!
[mst@tuck linux]$ dnf module enable avocado:latest
Last metadata expiration check: 6 days, 15:25:55 ago on Wed 21 Sep 2022 02:33:31 AM EDT.
Dependencies resolved.
==========================================================================================================================================
 Package                          Architecture                    Version                          Repository                        Size
==========================================================================================================================================
Enabling module streams:
 avocado                                                          latest                                                                 

Transaction Summary
==========================================================================================================================================

Is this ok [y/N]: y
Complete!
[mst@tuck linux]$  dnf module install avocado
Last metadata expiration check: 6 days, 15:26:03 ago on Wed 21 Sep 2022 02:33:31 AM EDT.
Dependencies resolved.
==========================================================================================================================================
 Package                                              Architecture  Version                                  Repository              Size
==========================================================================================================================================
Installing group/module packages:
 python3-avocado                                      noarch        97.0-1.module_f35+14550+3bc43fee         updates-modular        603 k
 python3-avocado-plugins-output-html                  noarch        97.0-1.module_f35+14550+3bc43fee         updates-modular         99 k
 python3-avocado-plugins-varianter-yaml-to-mux        noarch        97.0-1.module_f35+14550+3bc43fee         updates-modular         29 k
Installing dependencies:
 gdb-gdbserver                                        x86_64        12.1-1.fc35                              updates                300 k
 python-avocado-common                                noarch        97.0-1.module_f35+14550+3bc43fee         updates-modular         29 k
Installing module profiles:
 avocado/default                                                                                                                         

Transaction Summary
==========================================================================================================================================
Install  5 Packages

Total download size: 1.0 M
Installed size: 3.5 M
Is this ok [y/N]: y
Downloading Packages:
(1/5): python-avocado-common-97.0-1.module_f35+14550+3bc43fee.noarch.rpm                                   40 kB/s |  29 kB     00:00    
(2/5): python3-avocado-plugins-output-html-97.0-1.module_f35+14550+3bc43fee.noarch.rpm                    109 kB/s |  99 kB     00:00    
(3/5): python3-avocado-plugins-varianter-yaml-to-mux-97.0-1.module_f35+14550+3bc43fee.noarch.rpm           28 kB/s |  29 kB     00:01    
(4/5): python3-avocado-97.0-1.module_f35+14550+3bc43fee.noarch.rpm                                        479 kB/s | 603 kB     00:01    
(5/5): gdb-gdbserver-12.1-1.fc35.x86_64.rpm                                                               232 kB/s | 300 kB     00:01    
------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                     204 kB/s | 1.0 MB     00:05     
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
Regex version mismatch, expected: 10.40 2022-04-14 actual: 10.35 2020-05-09
  Preparing        :                                                                                                                  1/1 
  Installing       : python-avocado-common-97.0-1.module_f35+14550+3bc43fee.noarch                                                    1/5 
  Installing       : gdb-gdbserver-12.1-1.fc35.x86_64                                                                                 2/5 
  Installing       : python3-avocado-97.0-1.module_f35+14550+3bc43fee.noarch                                                          3/5 
  Installing       : python3-avocado-plugins-output-html-97.0-1.module_f35+14550+3bc43fee.noarch                                      4/5 
  Installing       : python3-avocado-plugins-varianter-yaml-to-mux-97.0-1.module_f35+14550+3bc43fee.noarch                            5/5 
  Running scriptlet: python3-avocado-plugins-varianter-yaml-to-mux-97.0-1.module_f35+14550+3bc43fee.noarch                            5/5 
  Verifying        : gdb-gdbserver-12.1-1.fc35.x86_64                                                                                 1/5 
  Verifying        : python-avocado-common-97.0-1.module_f35+14550+3bc43fee.noarch                                                    2/5 
  Verifying        : python3-avocado-97.0-1.module_f35+14550+3bc43fee.noarch                                                          3/5 
  Verifying        : python3-avocado-plugins-output-html-97.0-1.module_f35+14550+3bc43fee.noarch                                      4/5 
  Verifying        : python3-avocado-plugins-varianter-yaml-to-mux-97.0-1.module_f35+14550+3bc43fee.noarch                            5/5 

Installed:
  gdb-gdbserver-12.1-1.fc35.x86_64                                                                                                        
  python-avocado-common-97.0-1.module_f35+14550+3bc43fee.noarch                                                                           
  python3-avocado-97.0-1.module_f35+14550+3bc43fee.noarch                                                                                 
  python3-avocado-plugins-output-html-97.0-1.module_f35+14550+3bc43fee.noarch                                                             
  python3-avocado-plugins-varianter-yaml-to-mux-97.0-1.module_f35+14550+3bc43fee.noarch                                                   

Complete!


Great! Except I want avocado-vt of course. I will pretend someone told
me that I need it.

Installing Avocado-VT on Fedora or Enterprise Linux is a matter of installing the avocado-plugins-vt package. Install it with:

$ yum install avocado-plugins-vt


I guess I will replace yum with dnf then?



[mst@tuck linux]$ dnf install avocado-plugins-vt
Last metadata expiration check: 6 days, 15:31:16 ago on Wed 21 Sep 2022 02:33:31 AM EDT.
No match for argument: avocado-plugins-vt
Error: Unable to find a match: avocado-plugins-vt


And this is Fedora. What do people do on debian? non Linux?


-- 
MST


