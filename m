Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8B8375135
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 11:03:35 +0200 (CEST)
Received: from localhost ([::1]:46610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leZuw-000080-QJ
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 05:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leZtS-0007dE-Bt
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:02:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leZtQ-0008E4-1q
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620291719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3SaWZiICjVKODTPoGWF9tKZZQthONe03+djapTETU90=;
 b=USOtxRQoKKdE+kUVCqd6VTWIsmrMWOh4rgzMsTakL9L5bS61lg5nyxZ3fQlKSHE3WpL/l1
 jW4fSsvdHic1Fpgqn0ACjI82jwVGszQAF7TCT+ggeWG475MURUPOEnXnONC2W1OQqlEs4y
 wTT8AhfDRFhQe4y59GV7Re40TMeqr/Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-WHa3_JifOh27RjVS_IcpUA-1; Thu, 06 May 2021 05:01:57 -0400
X-MC-Unique: WHa3_JifOh27RjVS_IcpUA-1
Received: by mail-wm1-f72.google.com with SMTP id
 g17-20020a05600c0011b029014399f816a3so1107248wmc.7
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 02:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3SaWZiICjVKODTPoGWF9tKZZQthONe03+djapTETU90=;
 b=CLJj/M/RdKf42M40/u8oaknpk1bDUTlvBPz3+WhtCqHU4dALK5L64noHjUovGDF4Xs
 GZ6ilSm7lTldUSH0iwwZ6VocVU3HcKkLrnKt0FvDukJw3v9dnijSGr7eI6148njiUACE
 GK3jcNA8Yqya94dFopn/v+OXcom79eul70Aab7YBiqOBe+TNVtoSQb8xc+3YqZRO5YeJ
 NoWL8X88JaP36qk7bYXuGpfjqAF/fPLGozH6+zNyZU99vq6lTMa1Q4flJ4q5oxqERYeo
 mn+eitD3te9pat9UvBoQSJE3dA67OYoZi87hnuI5fmUY3jMfGLURlPkzoRV40NRxT7n9
 P40g==
X-Gm-Message-State: AOAM532DH2gALCA8A2CAsjwxZQnFvfL7xFsVkUDbo7gvYZcjDJ6HvN+1
 wbfJukHTFGPpTb2p74bb3fzDq1nbhhv8ChGux43ADiehq5Bm3wQVyIEbpA4bBTrR9dOTh4p4L2b
 h5//dCAnMRqFEWIs=
X-Received: by 2002:a5d:660c:: with SMTP id n12mr3747554wru.87.1620291716596; 
 Thu, 06 May 2021 02:01:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCWd47aVaifUQSmAL9vBKu2C4H20q0iwfCsqCJ4i2cg++cbZZeExCH+KiyeDYLdZzbqG9V0g==
X-Received: by 2002:a5d:660c:: with SMTP id n12mr3747517wru.87.1620291716292; 
 Thu, 06 May 2021 02:01:56 -0700 (PDT)
Received: from [192.168.1.19] (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr.
 [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id m184sm2418932wme.40.2021.05.06.02.01.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 02:01:55 -0700 (PDT)
Subject: Re: [PATCH 06/23] hw/block/dataplane/virtio-blk: Avoid dynamic stack
 allocation
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-7-philmd@redhat.com>
 <YJOuesiuqgQugO+Q@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <124ddeb2-ca4a-c551-19ad-d1125451226f@redhat.com>
Date: Thu, 6 May 2021 11:01:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJOuesiuqgQugO+Q@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/21 10:53 AM, Stefan Hajnoczi wrote:
> On Wed, May 05, 2021 at 11:10:30PM +0200, Philippe Mathieu-Daudé wrote:
>> Use autofree heap allocation instead of variable-length
>> array on the stack.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/block/dataplane/virtio-blk.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> Why?

The motivation behind removing all variable-length allocations
(and adding CPPFLAG+=-Wvla at the end) is to avoid security
vulnerabilities such CVE-2021-3527.

> This is a performance-critical code path and BITS_TO_LONGS(nvqs) is
> small.

OK, having looked better at nvqs, I suppose this is preferred:

-- >8 --
@@ -60,7 +60,7 @@ static void notify_guest_bh(void *opaque)
 {
     VirtIOBlockDataPlane *s = opaque;
     unsigned nvqs = s->conf->num_queues;
-    unsigned long bitmap[BITS_TO_LONGS(nvqs)];
+    unsigned long bitmap[BITS_TO_LONGS(VIRTIO_QUEUE_MAX)];
     unsigned j;

     memcpy(bitmap, s->batch_notify_vqs, sizeof(bitmap));
---

Would that work for you?

> 
> Stefan
> 


