Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE85625B68
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 14:47:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otT3z-0004pj-KN; Fri, 11 Nov 2022 07:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otT3x-0004pS-MZ
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 07:23:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otT3v-0001lC-TW
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 07:23:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668169391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OvRjx5b7isyQ5sLD1BJgcEkm3pMOPIBsGQVY5ORrZ8U=;
 b=L4ItE6pctn7bdqUI6uRurarr/XEJNxUbZH1WDi9fdNhiv3ZAc21hPSTbXc6U2yYakP0OHS
 WO9qoohfocMjt0yW2gSRk3ODY6N3XHbEY/3FSfRN6LmFRm6X0J1xjiZVqpXqcwXXLhlPbp
 BTeXFn/78ipFx7B7MwkzetiU12tngCQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-170-ha1WSfj9PRumJoLtqV7LOw-1; Fri, 11 Nov 2022 07:23:09 -0500
X-MC-Unique: ha1WSfj9PRumJoLtqV7LOw-1
Received: by mail-qk1-f200.google.com with SMTP id
 j13-20020a05620a410d00b006e08208eb31so4611058qko.3
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 04:23:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OvRjx5b7isyQ5sLD1BJgcEkm3pMOPIBsGQVY5ORrZ8U=;
 b=vLoI4oyRt6qXFwkitknLUaFY2PCbIKzun1uytL6flQqNkxNeem5zAggxqO8Sl9pNnQ
 ykHqTlk0ix+1onigtMfjZAivzwXPBkKXDl5Wf4i00gaRk/nBmQfzCyNwPlpVOBGWJTB9
 RxFI/vHhchId7DJ0WPtr1mmYSrwfj1ptvjXTUW5NYW/GD9An0r72HjkcHDQvaUTlbpJi
 Si2UyumMPFM8DD56GeAvVlc56VOSRaQeqAtvN4QcuB7SBFql7mRhYov0CG0DlKLncCdo
 puwj/nhOVQiIb17egwvDYm7gkcJv0nn6hkc+g/l3pabXLdaaKRKUYxfNaFRfvFVvr0Te
 R29Q==
X-Gm-Message-State: ANoB5pls4u2nG94UshFyS5Qf6OdGQ55T8KdlWUMRJJlxgAPN+DbvmnOj
 XXUnNH7k+E1V/Dwmi0Xt90tZgaUk3lXGuIF+dTcb3mXNyLn3hjSfJBCHGdPffjRXidXtbFqg7Ot
 N6hz48plJyy3vt1I=
X-Received: by 2002:ac8:454b:0:b0:3a5:7ba9:704f with SMTP id
 z11-20020ac8454b000000b003a57ba9704fmr970559qtn.331.1668169389432; 
 Fri, 11 Nov 2022 04:23:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5KXgzsU+CEzWWHh05vsIXte0N4j8WrYX+vCkRzEhBUqywLtPHPpJrNArpXYo5PQ7NoRMtVUw==
X-Received: by 2002:ac8:454b:0:b0:3a5:7ba9:704f with SMTP id
 z11-20020ac8454b000000b003a57ba9704fmr970552qtn.331.1668169389226; 
 Fri, 11 Nov 2022 04:23:09 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 bl12-20020a05620a1a8c00b006fae7e6204bsm1292809qkb.108.2022.11.11.04.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 04:23:08 -0800 (PST)
Message-ID: <53c4a350-45e6-50a3-7eb7-ee4c3a2ac761@redhat.com>
Date: Fri, 11 Nov 2022 13:23:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 6/8] virtio-blk: remove unnecessary AioContext lock from
 function already safe
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
References: <20221108211930.876142-1-stefanha@redhat.com>
 <20221108211930.876142-7-stefanha@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20221108211930.876142-7-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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



Am 08/11/2022 um 22:19 schrieb Stefan Hajnoczi:
> From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>
> AioContext lock was introduced in b9e413dd375 and in this instance
> it is used to protect these 3 functions:
> - virtio_blk_handle_rw_error
> - virtio_blk_req_complete
> - block_acct_done
>
> Now that all three of the above functions are protected with
> their own locks, we can get rid of the AioContext lock.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Message-Id: <20220609143727.1151816-9-eesposit@redhat.com>
>


Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>


