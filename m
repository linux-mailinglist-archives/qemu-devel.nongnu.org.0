Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1269825AA5B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 13:31:44 +0200 (CEST)
Received: from localhost ([::1]:45136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDQzP-0001yk-5R
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 07:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDQvN-0007vL-21
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 07:27:33 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41883
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDQvL-0003jK-Cd
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 07:27:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599046050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iSlNuonYnoNMgoUiv8t7hA4TF4jW7s2LNuA0HJWgNwU=;
 b=g1vutA/F/k1QD77JP7FtyWAo/K7ynlB1+9kzYsD40lU4N3kqtvGSNRiusJAbYQWYso9hkd
 kdLPxW1/Umt7KFNbq0SHyzcGBNTP2qx/gu1VIOkWpYkkrpw/zUaR4YfNFSCzESd0Ws3efj
 Ed/7HetgvMw7UzkmhRnq0AmGV1w1GtM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-zSCjeLLEPly2MqOBXU7FQw-1; Wed, 02 Sep 2020 07:27:28 -0400
X-MC-Unique: zSCjeLLEPly2MqOBXU7FQw-1
Received: by mail-wm1-f71.google.com with SMTP id l26so1535348wmg.7
 for <qemu-devel@nongnu.org>; Wed, 02 Sep 2020 04:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iSlNuonYnoNMgoUiv8t7hA4TF4jW7s2LNuA0HJWgNwU=;
 b=l6gYLhJXMdtOyxFaLEEi0DcdfM0YIeF/90qDyIKMU8XSEU0w96DK28Q4SyJB4NO7lC
 r1I4LTdUrQi1YnkVmK1FHOgry6HqIR4JFpDjiM+Slt84+qt4Qc8ikmRk8pJGS3ZgZ6zZ
 9Zo2jr4YRmH89qbtvZnKDdFsp+3S1A3jxieg5X2zd71TsOs1FQdyC9ehy8p9A2GZ/QK0
 7iHOqOi2XC7/BGfzVjRp3tqI6cBMaE+tBhuvm2uSve+VAylQbYsMMUKVPhf5UAsmECiZ
 DWhzf60itSNTe3M2zTqeFWi27oCO/X/UovI3AS+bkBQJVQ7unx5dRFVpXWFR2hvQoevL
 WG1g==
X-Gm-Message-State: AOAM532wsrPwFVfrQ1hOuLCdJ6bO1CPpoM2hCxBGxWkNJeg4jimnsB5F
 u+Oft6zb3GNoDmomgDEEKgVE/alVRqnrAVmtRGyyUxELt8npQmEMAhVVC5O9vppQJqKc/2UBLcL
 GmrQWcsbeunnIOKs=
X-Received: by 2002:a1c:23c8:: with SMTP id j191mr213302wmj.64.1599046046981; 
 Wed, 02 Sep 2020 04:27:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6QV3//Yd2VO+S6cM3GqJVnd9BR9hmHdop4WHdmi6b5mtDwtb3+Yucm+IxnJdX/KxYYhs8dg==
X-Received: by 2002:a1c:23c8:: with SMTP id j191mr213287wmj.64.1599046046703; 
 Wed, 02 Sep 2020 04:27:26 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.173.193])
 by smtp.gmail.com with ESMTPSA id g18sm7220577wru.27.2020.09.02.04.27.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2020 04:27:26 -0700 (PDT)
Subject: Re: Cirrus CI for msys2 are working now, but still buiding failed
To: Thomas Huth <thuth@redhat.com>, luoyonggang@gmail.com,
 qemu-level <qemu-devel@nongnu.org>
References: <CAE2XoE_SkH-2dNULFAZNiRNRNP=OncwCy=xrDk0J3bzS1Th=tg@mail.gmail.com>
 <c61f6420-ffdb-b2b1-44ec-60b8a55f9c8a@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bbd3bdff-5326-bdad-7389-c862a4e9edc0@redhat.com>
Date: Wed, 2 Sep 2020 13:27:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <c61f6420-ffdb-b2b1-44ec-60b8a55f9c8a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:07:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.324, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/09/20 12:38, Thomas Huth wrote:
>> C:/tools/msys64/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/10.2.0/../../../../x86_64-w64-mingw32/bin/ld.exe: cannot find -lfdt
>> C:/tools/msys64/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/10.2.0/../../../../x86_64-w64-mingw32/bin/ld.exe: cannot find -lfdt
>> C:/tools/msys64/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/10.2.0/../../../../x86_64-w64-mingw32/bin/ld.exe: cannot find -lfdt
>> C:/tools/msys64/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/10.2.0/../../../../x86_64-w64-mingw32/bin/ld.exe: cannot find -lfdt
>> collect2.exe: error: ld returned 1 exit status
>> collect2.exe: error: ld returned 1 exit status
>> make: *** [Makefile.ninja:2184: qemu-system-armw.exe] Error 1
>> make: *** [Makefile.ninja:2182: qemu-system-arm.exe] Error 1
>> collect2.exe: error: ld returned 1 exit status
>> make: *** [Makefile.ninja:1875: qemu-system-aarch64.exe] Error 1
>> collect2.exe: error: ld returned 1 exit status
>> make: *** [Makefile.ninja:1877: qemu-system-aarch64w.exe] Error 1
> Wow, that looks quite promising already! But I wonder why the build
> system is trying to link libfdt to targets like qemu-system-avr that do
> not need it?
> And for the targets that need fdt, it should use the dtc submodule... I
> can see in the log that the dtc submodule is checked out, but it does
> not seem to be compiled ? As a test, could you please try to run
> "configure" with "--disable-fdt" there?

This is preexisting, lots of libraries are wedded blindly to QEMU_CFLAGS
and LIBS.  It can be fixed once tests are converted to Meson.

Paolo


