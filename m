Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED285F99F7
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 09:29:44 +0200 (CEST)
Received: from localhost ([::1]:59760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohnEL-00058y-Ku
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 03:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ohn6u-0005OO-Lg
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 03:22:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ohn6r-0008GN-Fj
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 03:21:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665386515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wN31ty+mdKey0rTC1wXy0flvpKuc/sLhAi877lGXeq8=;
 b=T1Rxld5KLr7EJjhOdA1uutYKJ5lFzWnet6I2WUT1rapo72gXgGSd9CvyaK7ghBUAGQGyid
 /2+m8hrlyYJWTE+d9GNXgxFjq/JP2jwqfSY8G/xrFF0U4HxR3oTmg2aNmEE++HkjGO9nEo
 ox8uu273msZbo4fmtWUFbz+4fCF5gyc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-418-0xDRvQtZOdO3vrbCXlhoAA-1; Mon, 10 Oct 2022 03:21:54 -0400
X-MC-Unique: 0xDRvQtZOdO3vrbCXlhoAA-1
Received: by mail-wr1-f69.google.com with SMTP id
 r4-20020adfbb04000000b0022e5ec02713so2415473wrg.18
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 00:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wN31ty+mdKey0rTC1wXy0flvpKuc/sLhAi877lGXeq8=;
 b=7W973NvmPK4S+qt3keSE8XyJljqqTHKqCA/DcxycqlbmGN2qaPHyeQaJ1wI6mP9szC
 42XfGBUcIYvf6L5bH48GAqGGmSqfpiY1tQj2edB/TLlUjyhRafNxriLqsxYxxIgOS3Jp
 mLqrSTkgnAAINuXOmhPZ9N7pWqkozaCKUsDLhpxFw2lt5B414GO5NRXzw0X7H0dhcff4
 TbT3om0rm8prYMROGAuC5qQ9oGqb3pzBfTXq2ndsFdeLqwAt6qMhsy8Y1Ft1+NNd8F4y
 nt3hw3h3afBcqABCsts+JgBklI/ZBdscp3oh8X2NX73FrcNW+apnD/jZasbBm2eXvW8R
 j0Ow==
X-Gm-Message-State: ACrzQf2kz9zOMU95QNK7uaW0Ho99WaCaDRT9aHye2i+ow/Hv6aigGaHo
 r0VX0efON1cidqrKdxQPdBogEC/G5o3EgEljTkvMe2PtSBSO6lPH8BniN2nJPZ7Yz/YvR5rSOpZ
 h5LZung8eVnhJ8uc=
X-Received: by 2002:a05:600c:a48:b0:3b9:af1f:1b38 with SMTP id
 c8-20020a05600c0a4800b003b9af1f1b38mr11716411wmq.185.1665386513181; 
 Mon, 10 Oct 2022 00:21:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4jjxMlgtMenlUs8XISa1PPOnxBa8G6UbdiTNuJZNgKNlEAqyw/Z+RKlhBONR+CRnaAdEqS7A==
X-Received: by 2002:a05:600c:a48:b0:3b9:af1f:1b38 with SMTP id
 c8-20020a05600c0a4800b003b9af1f1b38mr11716399wmq.185.1665386512903; 
 Mon, 10 Oct 2022 00:21:52 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-178-99.web.vodafone.de.
 [109.43.178.99]) by smtp.gmail.com with ESMTPSA id
 q22-20020a7bce96000000b003c21ba7d7d6sm10023549wmj.44.2022.10.10.00.21.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 00:21:52 -0700 (PDT)
Message-ID: <e84ed09e-78c4-ac7c-19ef-f53ede3330e4@redhat.com>
Date: Mon, 10 Oct 2022 09:21:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: total fail on FreeBSD 14.0 amd64 regardless of compiler
Content-Language: en-US
To: Dennis Clarke <dclarke@blastwave.org>, qemu-devel@nongnu.org
References: <841ab433-7dcd-2cf3-de7a-eb8b890f1652@blastwave.org>
Cc: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <841ab433-7dcd-2cf3-de7a-eb8b890f1652@blastwave.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.934, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 10/10/2022 08.56, Dennis Clarke wrote:
> 
> re: https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg01249.html
> 
> Using GCC 12 is even worse :
> 
> [2040/6841] Compiling C object qemu-system-aarch64.p/softmmu_main.c.o
> [2041/6841] Linking target qemu-system-aarch64
> FAILED: qemu-system-aarch64
> /usr/local/bin/g++12 -m64 -mcx16 @qemu-system-aarch64.rsp
> /usr/local/bin/ld: libqemuutil.a.p/util_filemonitor-inotify.c.o: undefined 
> reference to symbol 'inotify_init1'

Now that sounds like the detection for inotify_init1 did not work
right in the meson.build script...

Looking at meson.build:

config_host_data.set('CONFIG_INOTIFY1',
                      cc.has_header_symbol('sys/inotify.h', 'inotify_init1'))

... do you have such a "inotify.h" header on your FreeBSD system
and does it contain an inotify_init1 function?

  Thomas


