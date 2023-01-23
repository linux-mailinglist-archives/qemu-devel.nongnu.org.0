Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1016778DE
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 11:15:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJtqw-0003rv-Do; Mon, 23 Jan 2023 05:15:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pJtqv-0003rE-6M
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 05:15:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pJtqt-0007ZU-CL
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 05:15:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674468898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KKUes/wobbnhe/GJKgXgvuvY1k8IFcaxXbY60RNe+V4=;
 b=cIyu04RkuWWCiVLvAk9BTqvs0LmV0TNAPZq68ExPjOHPv94oJETG5LhV4ND0nYfNbeUjDo
 Ha2Uecdecq7F1QcuaaUG72Bq2exGG3aWNLwH2G4GyWvMJZKOxb3m2oJ4Qx47BnUmcw2e4a
 l0zd7o451qPI1IbMAgSMXb2o5hm5avo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-496-Ci50M9kRMBGRh8uvAtNw5Q-1; Mon, 23 Jan 2023 05:14:56 -0500
X-MC-Unique: Ci50M9kRMBGRh8uvAtNw5Q-1
Received: by mail-qv1-f69.google.com with SMTP id
 c10-20020a05621401ea00b004c72d0e92bcso5690910qvu.12
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 02:14:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KKUes/wobbnhe/GJKgXgvuvY1k8IFcaxXbY60RNe+V4=;
 b=ro28sQ+p0g7dX7RJNDs+C+C2umyzQLNPR+nu/A24i7DR6rRiF+XSMYYXI3GtKZ/axd
 A/AXRgCLqNUW4uUrUDnAil/d26bfllLMLuhxNTPms+Mn5sHW3pZ/r6JZTHGFrYlB6ns/
 0b+1SARbf+lyuh2mHmSqPWXny2002ng39OC82/Pp5vgFSCtP0jXtKs2qy30OdZPq1mDh
 4YCB+4wXimNzfvxzzItd/G928etSOxySoLWB9NCoADrCtJRy763wMIUZmgQp5wWlzd1e
 CPx8aWjc9lW4Hs176/qi0SdK9CqR82cBT1FPNvOoLUdpZX5ajewILOC3j0PF/OhPRV7A
 bLHw==
X-Gm-Message-State: AFqh2kptCAiGocCeRUaLVxbcY1YyA1YSToXWXCUrG7QBABkIH+AQMFKu
 7rIr0YfZ8wz0Zx/yCBOa37nutJdV8ryq9yr2Axqcb2U/4S7tjQfv26oPXt6/FaKgctZ0npxQOm5
 qCs3Ql18qFUtKCBE=
X-Received: by 2002:a0c:fcce:0:b0:535:5c4f:70c5 with SMTP id
 i14-20020a0cfcce000000b005355c4f70c5mr19649039qvq.23.1674468896270; 
 Mon, 23 Jan 2023 02:14:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXseTA5v2SY9Z8AF17m1kSw28TQSIIX1hIdjT86NOFUd7PjKgb13HiLIPMXLNF17AnDQv/Ge5Q==
X-Received: by 2002:a0c:fcce:0:b0:535:5c4f:70c5 with SMTP id
 i14-20020a0cfcce000000b005355c4f70c5mr19649026qvq.23.1674468896035; 
 Mon, 23 Jan 2023 02:14:56 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-90.web.vodafone.de.
 [109.43.178.90]) by smtp.gmail.com with ESMTPSA id
 t2-20020a37ea02000000b006fb9bbb071fsm31205913qkj.29.2023.01.23.02.14.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 02:14:55 -0800 (PST)
Message-ID: <a1c86abe-a477-27f7-d859-561169e2052f@redhat.com>
Date: Mon, 23 Jan 2023 11:14:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, qemu-devel@nongnu.org
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, "Daniel P. Berrange" <berrange@redhat.com>
References: <20230106142110.672-1-anthony.perard@citrix.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] configure: Expand test which disable -Wmissing-braces
In-Reply-To: <20230106142110.672-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 06/01/2023 15.21, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@citrix.com>
> 
> With "clang 6.0.0-1ubuntu2" on Ubuntu Bionic, the test with build
> fine, but clang still suggest braces around the zero initializer in a
> few places, where there is a subobject. Expand test to include a sub
> struct which doesn't build on clang 6.0.0-1ubuntu2, and give:
>      config-temp/qemu-conf.c:7:8: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
>      } x = {0};
>             ^
>             {}
> 
> These are the error reported by clang on QEMU's code (v7.2.0):
> hw/pci-bridge/cxl_downstream.c:101:51: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
>      dvsec = (uint8_t *)&(CXLDVSECPortExtensions){ 0 };
> 
> hw/pci-bridge/cxl_root_port.c:62:51: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
>      dvsec = (uint8_t *)&(CXLDVSECPortExtensions){ 0 };
> 
> tests/qtest/virtio-net-test.c:322:34: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
>      QOSGraphTestOptions opts = { 0 };
> 
> Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> 
> While Ubuntu Bionic isn't supposed to be supported anymore, clang v6
> is still the minimum required as tested by ./configure.
> ---
>   configure | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/configure b/configure
> index 9f0bc57546..3cd9b8bad4 100755
> --- a/configure
> +++ b/configure
> @@ -1290,7 +1290,11 @@ fi
>   # Disable -Wmissing-braces on older compilers that warn even for
>   # the "universal" C zero initializer {0}.
>   cat > $TMPC << EOF
> +struct s {
> +  void *a;
> +};
>   struct {
> +  struct s s;
>     int a[2];
>   } x = {0};
>   EOF

Not sure whether this is really a good fix...

Nobody is really still testing such old compiler versions, so it would be 
better to adjust our minimum compiler version, I think.

According to repology.org, our supported distros ship these versions of 
Clang these days:

               Fedora 36: 14.0.5
       CentOS 8 (RHEL-8): 12.0.1
               Debian 11: 13.0.1
      OpenSUSE Leap 15.4: 13.0.1
        Ubuntu LTS 20.04: 12.0.0
           FreeBSD Ports: 15.0.7
           NetBSD pkgsrc: 15.0.7
                Homebrew: 15.0.7
             MSYS2 mingw: 15.0.7
             Haiku ports: 12.0.1

The Xcode that we are testing in the gitlab-CI seems to be "Apple clang 
version 13" which should correspond to LLVM 12.0.0 according to 
https://en.wikipedia.org/wiki/Xcode#Xcode_11.0_-_14.x_(since_SwiftUI_framework)_2 
.

So from that numbers, it seems we could increase the minimal Clang version 
to 12.0.0 nowadays.

However, looking at our CI jobs, the Debian runner still seems to use Clang 
11 instead:

  https://gitlab.com/qemu-project/qemu/-/jobs/3637272746

And our tests/docker/dockerfiles/ubuntu2004.docker file still seems to use 
Clang version 10.0.0 ...

So without much additional effort, I think it should be fine to bump our 
minimal required version of Clang to 10.0.0 nowadays, thus I'd suggest that 
you send a patch for the configure script to do that instead. (Xcode version 
should then be bumped from v10 to v12 instead)

Then you can simply remove that old test for missing-braces from the 
configure script completely.

  Thomas


