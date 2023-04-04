Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D4B6D639E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 15:44:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjgwc-00034z-I4; Tue, 04 Apr 2023 09:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjgwa-00032m-3z
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:43:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjgwY-0003Nw-8K
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:43:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680615805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=banha77N8+B6dxSVSxrCs92gu1rjIC58TeHKkpj1HpY=;
 b=EhtOVeFUA+/eJpC5yUkkyuanpN2dGoPHlXpaEhKQ++x02jdlobL4TbEMdL2o+Tzf2AkIHT
 Z1p+waU+cYdo9f9hkMScwjxGXa/NTPftL2GUEiJAOk2F3rXD5tzUL0/WmNbkzL304Dg7Am
 nKydMtZCcY44tC4vVPVYQL57SykOgm8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-b8JZDT2oPTK57FhydJG7PQ-1; Tue, 04 Apr 2023 09:43:24 -0400
X-MC-Unique: b8JZDT2oPTK57FhydJG7PQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 k30-20020a50ce5e000000b00500544ebfb1so45897938edj.7
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 06:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680615803; x=1683207803;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=banha77N8+B6dxSVSxrCs92gu1rjIC58TeHKkpj1HpY=;
 b=jdxwu1DLGz3ieCOMJ/eNCWVUj5g7WkiHoCnF7iuiUMx5uyhAHSfUOHnXKxngEnIuVU
 lFuW9Iqpam9wpvGpe+hfss/fDHmDchIvRXKr8TfpDYW1I9BXY0juHrI3g8yIFKKGg5gR
 RYlt2dfu7u1v17ZZ5GJOvIt+wJovnjG1vyX4CHE7dJUnFW5Khb/R4ApiAK9TXyvngwl1
 rWe1qATHCzMwDMdTq/L5I/eGdujec843J2AtqsbId8WWHk76bQv2JE7k3QHGIJE9FwwC
 ccwSccwSgy0cbItMAzasNb+71h9O6N5aq58x1cpfBFmj74RHsUSRsjKbnMChg+slhh7e
 FrxQ==
X-Gm-Message-State: AAQBX9cvW+e9Cr+yBqh8uvGr3MV+A+Tx4wxpYlLfOyO6D7wlN1J6QDQG
 UEHm7Q3SZyBw85bZoM0mJmiSBitskAeq2nEjfyUeXrwkCqs/f0xgMfQbKIJQM9w1Zrpx04rjeNH
 4qTyQPCEUO4E5q/ryzq/Jt60=
X-Received: by 2002:a17:907:6b87:b0:93c:efaf:ba75 with SMTP id
 rg7-20020a1709076b8700b0093cefafba75mr2282152ejc.37.1680615802910; 
 Tue, 04 Apr 2023 06:43:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZNWNaNuwDkGHAuaeEc6X1s7r9xa0mDxtFhP32ZOx76xJcO7cMfakVgb34HP4JHYtrJgHQzvw==
X-Received: by 2002:a17:907:6b87:b0:93c:efaf:ba75 with SMTP id
 rg7-20020a1709076b8700b0093cefafba75mr2282128ejc.37.1680615802626; 
 Tue, 04 Apr 2023 06:43:22 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 tp24-20020a170907c49800b00948c320fcfdsm2099432ejc.202.2023.04.04.06.43.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 06:43:22 -0700 (PDT)
Message-ID: <261efade-683e-84dc-d402-7143be7199c3@redhat.com>
Date: Tue, 4 Apr 2023 15:43:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 00/13] block: remove aio_disable_external() API
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Julia Suvorova <jusual@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Lieven <pl@kamp.de>, Coiby Xu <Coiby.Xu@gmail.com>,
 xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Paul Durrant <paul@xen.org>, "Richard W.M. Jones" <rjones@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Fam Zheng <fam@euphon.net>,
 David Woodhouse <dwmw2@infradead.org>, Stefan Weil <sw@weilnetz.de>,
 Juan Quintela <quintela@redhat.com>, Xie Yongji <xieyongji@bytedance.com>,
 Hanna Reitz <hreitz@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 eesposit@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20230403183004.347205-1-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230403183004.347205-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.925, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 4/3/23 20:29, Stefan Hajnoczi wrote:
> The aio_disable_external() API temporarily suspends file descriptor monitoring
> in the event loop. The block layer uses this to prevent new I/O requests being
> submitted from the guest and elsewhere between bdrv_drained_begin() and
> bdrv_drained_end().
> 
> While the block layer still needs to prevent new I/O requests in drained
> sections, the aio_disable_external() API can be replaced with
> .drained_begin/end/poll() callbacks that have been added to BdrvChildClass and
> BlockDevOps.
> 
> This newer .bdrained_begin/end/poll() approach is attractive because it works
> without specifying a specific AioContext. The block layer is moving towards
> multi-queue and that means multiple AioContexts may be processing I/O
> simultaneously.
> 
> The aio_disable_external() was always somewhat hacky. It suspends all file
> descriptors that were registered with is_external=true, even if they have
> nothing to do with the BlockDriverState graph nodes that are being drained.
> It's better to solve a block layer problem in the block layer than to have an
> odd event loop API solution.
> 
> That covers the motivation for this change, now on to the specifics of this
> series:
> 
> While it would be nice if a single conceptual approach could be applied to all
> is_external=true file descriptors, I ended up looking at callers on a
> case-by-case basis. There are two general ways I migrated code away from
> is_external=true:
> 
> 1. Block exports are typically best off unregistering fds in .drained_begin()
>     and registering them again in .drained_end(). The .drained_poll() function
>     waits for in-flight requests to finish using a reference counter.
> 
> 2. Emulated storage controllers like virtio-blk and virtio-scsi are a little
>     simpler. They can rely on BlockBackend's request queuing during drain
>     feature. Guest I/O request coroutines are suspended in a drained section and
>     resume upon the end of the drained section.

Sorry, I disagree with this.

Request queuing was shown to cause deadlocks; Hanna's latest patch is 
piling another hack upon it, instead in my opinion we should go in the 
direction of relying _less_ (or not at all) on request queuing.

I am strongly convinced that request queuing must apply only after 
bdrv_drained_begin has returned, which would also fix the IDE TRIM bug 
reported by Fiona Ebner.  The possible livelock scenario is generally 
not a problem because 1) outside an iothread you have anyway the BQL 
that prevents a vCPU from issuing more I/O operations during 
bdrv_drained_begin 2) in iothreads you have aio_disable_external() 
instead of .drained_begin().

It is also less tidy to start a request during the drained_begin phase, 
because a request that has been submitted has to be completed (cancel 
doesn't really work).

So in an ideal world, request queuing would not only apply only after 
bdrv_drained_begin has returned, it would log a warning and 
.drained_begin() should set up things so that there are no such warnings.

Thanks,

Paolo


