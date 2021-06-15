Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FB83A8635
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:17:22 +0200 (CEST)
Received: from localhost ([::1]:44776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBkf-0007jk-0x
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltBaW-0008Dv-2y
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:06:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltBaT-000389-4B
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:06:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623773208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7gnqS5+kPfktkU8Jc+hf7XTEBmZH6G+sDnlUndlHntw=;
 b=iM2ycQlNvHck3WSMqjEizXH67+GciA/uQc9dKo78i6yQSYL4c0gmydoPudWkvYooUyhIdn
 rWzBaXtJgCSrDRVpiTTOPx4ExP6SZ+SS+F1l1tOBpnaR0C2Q/2JCaFkYj7RO7fj4QAFmHR
 6B32CwznbVLuHI2l6mI0BLsU2Tfg6fA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-nt7GHunZMX6YgYTz4c-gpQ-1; Tue, 15 Jun 2021 12:06:47 -0400
X-MC-Unique: nt7GHunZMX6YgYTz4c-gpQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 z5-20020a05640235c5b0290393974bcf7eso13991743edc.2
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 09:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=7gnqS5+kPfktkU8Jc+hf7XTEBmZH6G+sDnlUndlHntw=;
 b=crfeXE2PM9wWvIIVQDBrC38hDxin7AQ0m9zy7z4ykdGhUIhEFIJ+8A7H3Df+xoeqAP
 SbdO4jAkI0+Hb/ZZo0q0Yon5TI/DYQvOLl2TXBt0hZna6ofwVmL3O8wsEZhd47u2huwk
 KyvQlZ5Hyi2N/Ujy1qI7OAl7Y3Tvi06Cd4GuZq7nJv8O51AVrQ5PqZZ66Nlcjt6HUygk
 cAP7DarpvSyXZ+7qTagVqGHcCDLVAGzzAhUgeFJYhQlvUUs9uhoM2DT39uKKkXjT5GJh
 wKM1JNjz0VmUz8OcCpb1zZ74gJnw+YNjy9QS/YpkihrRx0ex5VX9V8J80jqbRM7H13yL
 300g==
X-Gm-Message-State: AOAM530vyViP3OfVOpVqkBouosV55GqREcjdu9VIsxcvsDWvtgweQUI+
 vviGXHdPRDCMOQjZBNuTXCtPI1tsq9+E/yTUNz7IqVJNdBN9ex5825J97DnmrOaMbOir7jhkAR8
 ug/OVM9WK8wAuHic=
X-Received: by 2002:a17:907:1c13:: with SMTP id
 nc19mr272291ejc.168.1623773203164; 
 Tue, 15 Jun 2021 09:06:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTh+WpgQkTnH7e2tuCXMkOTJQtEXBOHKGdD/wTGjqGCf3mDW9oO0TzEiR7UeAVP0MBFVPPBQ==
X-Received: by 2002:a17:907:1c13:: with SMTP id
 nc19mr272134ejc.168.1623773201577; 
 Tue, 15 Jun 2021 09:06:41 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 p14sm12309175eds.19.2021.06.15.09.06.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 09:06:41 -0700 (PDT)
Subject: Re: [PATCH v3 2/7] scsi-generic: pass max_segments via max_iov field
 in BlockLimits
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210603133722.218465-1-pbonzini@redhat.com>
 <20210603133722.218465-3-pbonzini@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <21c4273a-6a7c-1e88-1fc6-d9b199de92f1@redhat.com>
Date: Tue, 15 Jun 2021 18:06:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603133722.218465-3-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.06.21 15:37, Paolo Bonzini wrote:
> I/O to a disk via read/write is not limited by the number of segments allowed
> by the host adapter; the kernel can split requests if needed, and the limit
> imposed by the host adapter can be very low (256k or so) to avoid that SG_IO
> returns EINVAL if memory is heavily fragmented.
>
> Since this value is only interesting for SG_IO-based I/O, do not include
> it in the max_transfer and only take it into account when patching the
> block limits VPD page in the scsi-generic device.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/file-posix.c     | 3 +--
>   hw/scsi/scsi-generic.c | 6 ++++--
>   2 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


