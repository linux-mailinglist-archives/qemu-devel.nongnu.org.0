Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310364C1816
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 17:04:07 +0100 (CET)
Received: from localhost ([::1]:59222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMu7Z-00027t-JY
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 11:04:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMu5x-0001RL-BL
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 11:02:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMu5v-0003tN-1Z
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 11:02:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645632142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9szfKI9mu4hY88mOZwLsZEYVLqTaf2Kuwo36LY75FS0=;
 b=fDcJt7xGJ1q/+dWnSQWEBHLobkjODCCUUL/rI2ZPi1XZP01noc8Evwhhzncdt6le8yfOn5
 3g9bKbF8f959jTkOaJBTjn9dKVF9LOloP1Sqt2mH6hXM5SKZOI1o+HSBUZv71F/s3ofmx0
 yrSLmEu/hrTISjYM7YU/NuHkaa7F74s=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-6-_tcX0ROXC9CDnDe-SaKA-1; Wed, 23 Feb 2022 11:02:20 -0500
X-MC-Unique: 6-_tcX0ROXC9CDnDe-SaKA-1
Received: by mail-ed1-f71.google.com with SMTP id
 l24-20020a056402231800b00410f19a3103so13846437eda.5
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 08:02:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=9szfKI9mu4hY88mOZwLsZEYVLqTaf2Kuwo36LY75FS0=;
 b=WSzgSKSJZLEeUp3sEtzjR0IfpCPc8pfv9qeqmknVe0+/r9p/AyfN1sZiiOKxFsbi7N
 6AjMdga9pUgtaKm79rp7TMfR4FQuzC+68LI1P8nv2CAJevo8mLODiiLQ3V2SR8MLZXr/
 Zdl9wK205wnbK8RMHyJNJ49z8oh3SVcChgL/Ge76MyVaZrfcU0iDo9TOLM9zHUNxnzFU
 ux+kx93L/s98o3gKadusjr30Od73b2kYEbOEt20heINokDDvTO422s1IE46Wh43ziro4
 +kgL5VScHaqZtMqrVznuY5mlQWDTURDdanBhnx1wARcXf1ZatkveQ42aVAHyNbzoDc9j
 smqw==
X-Gm-Message-State: AOAM533Q6KuWC7OXRMwB/i1vA8AU3tOumQgdU/bf/6D3o08rZSQq16r3
 q9fw9n7tLsuxHeJsgOUSaD1/ZrIDNEpCWOh2HSfUS+ct+qlj+2OW5Rj7E3ejzVdM32DZyWCcUxT
 xX2qg+WhCoEdDKek=
X-Received: by 2002:a17:906:53c7:b0:6ce:6f32:ce53 with SMTP id
 p7-20020a17090653c700b006ce6f32ce53mr338215ejo.352.1645632139680; 
 Wed, 23 Feb 2022 08:02:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+E1Jtw4+1r+Ti9NhCk6OwcxJFiI6F3FFPaKTDJwlvkDluu1821Txwhfl3dSo9E69CPTpi+A==
X-Received: by 2002:a17:906:53c7:b0:6ce:6f32:ce53 with SMTP id
 p7-20020a17090653c700b006ce6f32ce53mr338186ejo.352.1645632139400; 
 Wed, 23 Feb 2022 08:02:19 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218])
 by smtp.gmail.com with ESMTPSA id mb23sm30668ejb.62.2022.02.23.08.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 08:02:18 -0800 (PST)
Message-ID: <3ce08bdb-fecd-549a-5c09-0b5fa65de4ba@redhat.com>
Date: Wed, 23 Feb 2022 17:02:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Fix a potential Use-after-free in virtio_iommu_handle_command()
 (v6.2.0).
To: wliang@stu.xidian.edu.cn, Eric Auger <eric.auger@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <1b79118e.25c5.17f2702b9d5.Coremail.wliang@stu.xidian.edu.cn>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <1b79118e.25c5.17f2702b9d5.Coremail.wliang@stu.xidian.edu.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/02/2022 15.36, wliang@stu.xidian.edu.cn wrote:
> Hi all,
> 
> I find a potential Use-after-free in QEMU 6.2.0, which is in 
> virtio_iommu_handle_command() (./hw/virtio/virtio-iommu.c).
> 
> Specifically, in the loop body, the variable 'buf' allocated at line 639 can 
> be freed by g_free() at line 659. However, if the execution path enters the 
> loop body again and the if branch takes true at line 616, the control will 
> directly jump to 'out' at line 651. At this time, 'buf' is a freed pointer, 
> which is not assigned with an allocated memory but used at line 653. As a 
> result, a UAF bug is triggered.
> 
> 
> 
> 599    for (;;) {
> ...
> 615        sz = iov_to_buf(iov, iov_cnt, 0, &head, sizeof(head));
> 616        if (unlikely(sz != sizeof(head))) {
> 617            tail.status = VIRTIO_IOMMU_S_DEVERR;
> 618            goto out;
> 619        }
> ...
> 639            buf = g_malloc0(output_size);
> ...
> 651out:
> 652        sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
> 653                          buf ? buf : &tail, output_size);
> ...
> 659        g_free(buf);
> 660    }
> 
> 
> We can fix it by set ‘buf‘ to NULL after freeing it:
> 
> 
> 
> 651out:
> 652        sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
> 653                          buf ? buf : &tail, output_size);
> ...
> 659        g_free(buf);
> +++buf = NULL;
> 660    }
> 
> 
> I'm looking forward to your confirmation.

  Hi,

thanks for your report and patch - but to make sure that the right people 
get attention, please use the scripts/get_maintainer.pl script to get a list 
of people who should be on CC:, or look into the MAINTAINERS file directly 
(for the next time - this time, I've CC:ed them now already).

  Thanks,
   Thomas


