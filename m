Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D6356B508
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 11:05:50 +0200 (CEST)
Received: from localhost ([::1]:39468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9jvp-0005zH-HU
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 05:05:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o9jrx-0004aY-Cw
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 05:01:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o9jrq-0005KH-AE
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 05:01:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657270901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RPC2FprAQpvkolXDROuIRPKvfXm4Ggphy1KkxDdCNHw=;
 b=OHjJRrmy0Uod09/YgV6l+xDGCTNuHsbHv/dlaIv6EHDSEaDsk2f/vteSOLmHzV4Yu/Z0ys
 pttk7eB4iB3Mg3TKz8oHIOFOyRjGKk+aLTPrEgymK74R5NdPNTVw+TVWwJtHVO2vYmK4nb
 8W0rQqlqvAZ49HUN4UUid8szo0DiOG4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-o44L8nRvOM-ekCSSvhB9eQ-1; Fri, 08 Jul 2022 05:01:40 -0400
X-MC-Unique: o44L8nRvOM-ekCSSvhB9eQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 r186-20020a1c44c3000000b003a2daf644f9so424048wma.2
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 02:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RPC2FprAQpvkolXDROuIRPKvfXm4Ggphy1KkxDdCNHw=;
 b=RJhFZs6dilwOGi4x+CxDdsEH7GjEBsoKx0t+uhXTSlXhPnBoX+y2zL1Yhp+eimrEZo
 Di7qayhPOgSPXhsMnqQke6dLT7HAWE1d6g4RU8eyIcaF8uiI+eqf1LWgOJMbI0xSBLku
 zWzWSH3TD89eeAWNNJtYbcyAc9j66/UHkYaR0q3VX19SOb0PjhI5IFb8v5SOaZCdDPfy
 I++vkcvHU2YfyMw6R1u5Lm+Z7V62nDMswlly/Ye4JnqGL2xqiQDj2mWBsrRVCnxwtfEG
 QtAsUHjMgrDO9d0SMmAg3cu3GvB9NnCaFmybDIvo8EkK1rRa0JhMWfDy+J8QmA7ozq7G
 mKEA==
X-Gm-Message-State: AJIora+De5XkW711/UPdlo4tNJaHlmp1Ctkn/cv3v8CFLETDxqVLlynI
 sd4L+jjJXxDU77QJ2CMETIGT95gbzQDH3o/mOqbNuHIVNNr8Odf1JlPP1qOzsygRpbSpYdbknIv
 w05ZsdTia3LcJfJA=
X-Received: by 2002:adf:ffc1:0:b0:21d:66a1:c3ee with SMTP id
 x1-20020adfffc1000000b0021d66a1c3eemr2152729wrs.364.1657270899077; 
 Fri, 08 Jul 2022 02:01:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1swXuFzzX//ukzdRyBY8WHz6m2ZA9oZyj/m8Dj3C5oAf1LNxlgWoMCaYCNs1b0752PAhocWGQ==
X-Received: by 2002:adf:ffc1:0:b0:21d:66a1:c3ee with SMTP id
 x1-20020adfffc1000000b0021d66a1c3eemr2152688wrs.364.1657270898722; 
 Fri, 08 Jul 2022 02:01:38 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 q17-20020adfdfd1000000b0021d4d6355efsm7347240wrn.109.2022.07.08.02.01.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 02:01:38 -0700 (PDT)
Message-ID: <3c910e80-dfdd-da1c-9683-3d7db51467c4@redhat.com>
Date: Fri, 8 Jul 2022 11:01:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/8] virtio_queue_aio_attach_host_notifier: remove
 AioContext lock
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20220609143727.1151816-1-eesposit@redhat.com>
 <20220609143727.1151816-2-eesposit@redhat.com>
 <YsRGpb02psGIffrw@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YsRGpb02psGIffrw@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



Am 05/07/2022 um 16:11 schrieb Stefan Hajnoczi:
> On Thu, Jun 09, 2022 at 10:37:20AM -0400, Emanuele Giuseppe Esposito wrote:
>> @@ -146,7 +147,6 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
>>  
>>      s->dataplane_starting = false;
>>      s->dataplane_started = true;
>> -    aio_context_release(s->ctx);
>>      return 0;
> 
> This looks risky because s->dataplane_started is accessed by IO code and
> there is a race condition here. Maybe you can refactor the code along
> the lines of virtio-blk to avoid the race.
> 

Uhmm could you explain why is virtio-blk also safe here?
And what is currently protecting dataplane_started (in both blk and
scsi, as I don't see any other AioContext lock taken)?

Because I see that for example virtio_blk_req_complete is IO_CODE, so it
could theoretically read dataplane_started while it is being changed in
dataplane_stop? Even though I guess it doesn't because we disable and
clean the host notifier before modifying it?

But if so, I don't get what is the difference with scsi code, and why we
need to protect only that instance with the aiocontext lock?

Thank you,
Emanuele


