Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362576EDFA8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 11:48:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prFG1-0006qo-Da; Tue, 25 Apr 2023 05:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prFFy-0006qJ-Uw
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 05:46:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prFFw-0001iT-UC
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 05:46:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682415999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=btOP/+I6ttpu9dzPbxjHCE8F2v80+ppXZEohLr/qdnY=;
 b=f88U2qGt34Q/QniLwYLZU+IhjUkaiSi4Sm/VFrVlaKX6l9sJAvE/tYW+nyjdhU6hWAQv3h
 I4ioYhQIbt1e/3zHaYAfa9IcvM0s2KXbLI3mywbKHIzccW9gK7ov4XFZ9y8P7Ny5NHeXDm
 BE5EpHZPcVTPzKMwchnZyu7NvGLKd68=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-YZeguY0MP3So9BLktjLbrg-1; Tue, 25 Apr 2023 05:46:38 -0400
X-MC-Unique: YZeguY0MP3So9BLktjLbrg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f1749c63c9so19222055e9.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 02:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682415997; x=1685007997;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=btOP/+I6ttpu9dzPbxjHCE8F2v80+ppXZEohLr/qdnY=;
 b=PUMdc0MVPV2Ol+VOXNKZHUaGBeid0oKArT/BDfvGR2Xy4GUrn+2VvVBCA15HTTAL0p
 XSlNUKP8Bcmpi8dt2m5rpIp7iMd3SMBUgrRyR6+dPvvE87eHSlJD1onoR14RhaO1odhQ
 3gn+rysnmpSGmvww5P9Lw+0We1y8eGKKG+nDwdKToVxBOc1uAPOzCzUM0/cu6mjkCZ5t
 hwclP0lgeJkCvm4vp+q5fG4Exz+MDBDQ2YvUPthzkWo0gN3YkbLlwVA1wJDbxTTl22cX
 bcqPwWgF9ELuLIvjM4W7/DYg5Fzll9meaL2f8Afdcm4giXW0TtnfPxlr86njTz/9NFJi
 VHZg==
X-Gm-Message-State: AAQBX9e8KaH0GL5AI3gCTV6vhjhajFUISSlOinu4jkOBuaxyLkj0kN7k
 Q2HvoZYWPW2rRjp2NhFPFk42zXI6FcfsCoG2Xv14fHE/6lcJgXezjTir7uUYD/BrZ2L4kY4+PnA
 M42GSh8RnOZdxLXc=
X-Received: by 2002:a5d:6e0a:0:b0:304:7929:470d with SMTP id
 h10-20020a5d6e0a000000b003047929470dmr5370578wrz.53.1682415997000; 
 Tue, 25 Apr 2023 02:46:37 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZwlTm2S7dclbGPNZf4WLoYqCamdW13v+/4RclFhHZ89od9SIx5xrHPFHm8KVIyhFZHY50ZnA==
X-Received: by 2002:a5d:6e0a:0:b0:304:7929:470d with SMTP id
 h10-20020a5d6e0a000000b003047929470dmr5370554wrz.53.1682415996725; 
 Tue, 25 Apr 2023 02:46:36 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 w13-20020adff9cd000000b002cea9d931e6sm12717501wrr.78.2023.04.25.02.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 02:46:36 -0700 (PDT)
Message-ID: <a8d076f3-ac2b-4e1a-8bcc-44bf57a750b2@redhat.com>
Date: Tue, 25 Apr 2023 11:46:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Siqi Chen <coc.cyqh@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20230421142736.2817601-1-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v8 0/8] memory: prevent dma-reentracy issues
In-Reply-To: <20230421142736.2817601-1-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.194, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/04/2023 16.27, Alexander Bulekov wrote:
> v7 -> v8:
>      - Disable reentrancy checks for bcm2835_property's iomem (Patch 7)
>      - Cache DeviceState* in the MemoryRegion to avoid dynamic cast for
>        each MemoryRegion access. (Patch 1)
>      - Make re-entrancy fatal for debug-builds (Patch 8)

  Hi Alexander,

I just put your series into a run with the gitlab-CI and it seems this now 
introduced another failure in one of the avocado tests:

  https://gitlab.com/thuth/qemu/-/jobs/4171448248#L318

The "IbmPrep40pMachine.test_openbios_and_netbsd" test is failing now.

You can reproduce it manually quite easily:

  wget 
https://archive.netbsd.org/pub/NetBSD-archive/NetBSD-7.1.2/iso/NetBSD-7.1.2-prep.iso

  ./qemu-system-ppc -nographic -M 40p -boot d -cdrom NetBSD-7.1.2-prep.iso

Without your patches, this prints out "NetBSD/prep BOOT, Revision 1.9" in 
the console, but with your patches, the message does not appear anymore.

Could you please have a look?

  Thanks,
   Thomas


