Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B404230C1
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 21:27:43 +0200 (CEST)
Received: from localhost ([::1]:33752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXq6I-0008F2-VB
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 15:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXq4m-0007Bn-BW
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 15:26:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXq4k-0002Yq-50
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 15:26:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633461965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m5jk+QUI9u/Z1JVrt4UKSQOuZwKP9YZjAEm+eEYfjwY=;
 b=N7KyvCLfUlNODvIRwbbeaFRoaT2TbaBwkCWN15BXqgnXMZg0qUuKUFKc4lRQCshmhbGqhF
 vxkjMPH7VkRxSMvSFZBiruiKuepe7gOzu4M/ALXXrwocaSqYWQNdCvpIzIiF03Aggek4X2
 Gf3c8BMZB+Utjheu12fFohpGmbj7j5c=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-KeDF5wOvOeWqFVMPoRDhyw-1; Tue, 05 Oct 2021 15:26:04 -0400
X-MC-Unique: KeDF5wOvOeWqFVMPoRDhyw-1
Received: by mail-ed1-f70.google.com with SMTP id
 h12-20020aa7c5cc000000b003dad185759bso249221eds.6
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 12:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m5jk+QUI9u/Z1JVrt4UKSQOuZwKP9YZjAEm+eEYfjwY=;
 b=jihEQSYKG2j3foubLHEDEHXqAYdo8mIUfZzQBggKwfdbOC5jCxfZGB18cfbTpmqIX5
 NgnINMh10lBKPT7wP9Nu5iksuBWccGNDYZIoUb3f6/CSFsabaWGwLGiGE17ldYeet9Wm
 O/gkXevxl2vVbaSiHDNpIVAcrKPbeIJ2xF0rJaOLDepTgigG13Mfjc9jwQ7Uxo/Rptz9
 22BhA2rfaoyrSAPgUPP1xmysxLNi4R+X/pIBuBIdoSlC/HivDwBBDN9VWVJZXUd8I67c
 eSPObXRs9vQmdSByJGaL1+DY7MwzNyzKbkVyGWOb58YeEEAB1YZ/bTlDgG1wOfIbbJUH
 H2bA==
X-Gm-Message-State: AOAM531E/KMlKH4vpl3kkTEAl6FDyHcY4RPi1jNxJcb7yPVUhAf3UrU1
 o+DHi7kIfrrvw3Z7bBaAAQOdfzp21M/0pJANF75V9aHr22QqiL/qGfsvvW2sijpGetD5g1Qeov8
 +fFJe+L72GfRioW8=
X-Received: by 2002:a50:da4e:: with SMTP id a14mr28755690edk.154.1633461963119; 
 Tue, 05 Oct 2021 12:26:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy9qC3RCXwkNsGPPGPBE5Y6TCM4vuvnsSSpCarlirzShuunnlxe+WgjrRSNJavsT+WZg2ACw==
X-Received: by 2002:a50:da4e:: with SMTP id a14mr28755667edk.154.1633461962883; 
 Tue, 05 Oct 2021 12:26:02 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id jt24sm8282114ejb.59.2021.10.05.12.26.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:26:02 -0700 (PDT)
Message-ID: <a34e4f8a-36c5-4b87-52b0-f622a78b8d70@redhat.com>
Date: Tue, 5 Oct 2021 21:26:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] bsd-user: Only process meson rules on BSD host
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210926220103.1721355-1-f4bug@amsat.org>
 <20210926220103.1721355-2-f4bug@amsat.org> <YVGUX6FZlFBhhgwn@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YVGUX6FZlFBhhgwn@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/09/21 11:52, Daniel P. Berrangé wrote:
>    bsd_user_ss.add(files('gdbstub.c'))
>    specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
> 
> 
> So without this change, we're already correctly dropping bsd_user_ss
> in its entirity, when not on BSD.
> 
> With this change, we're dropping some, but not all, of bsd_user_ss
> files - gdbstub.c remains.
> 
> So this change on its own doesn't make a whole lot of sense.

Agreed; that said, the gdbstub.c files added by

   bsd_user_ss.add(files('gdbstub.c'))
   linux_user_ss.add(files('gdbstub.c', 'thunk.c'))

are unnecessary because there is already

   specific_ss.add(files('cpu.c', 'disas.c', 'gdbstub.c'), capstone)

So, with those two instances of gdbstub.c removed, both patches are

   Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks,

Paolo


