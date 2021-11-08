Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FB144977E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 16:07:09 +0100 (CET)
Received: from localhost ([::1]:43744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk6El-00035m-0f
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 10:07:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mk6CW-0003lw-1d
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:04:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mk6CS-0000nA-15
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:04:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636383882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JIcDoeaoj5eQxtGOT4RrWxc+9zCAAOpybERDnhhXIZo=;
 b=ehxjSt9BJOyvHKPJHrMmBG7bHC+oY2l0VgRStDPCxnlt9aCQNlfse83euxTRIVpQpN6ZqX
 PzFquxBsDSxGxI1tjP71zOvchEMNZOfDzwXu/QxvGVtTjhHz0YrWcNUkUEqdl/y8akkVl7
 kaoM7FI5xAQQeMqZdmTw3j7lQjcKPHc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-v1qhQkNIOvivn1lDWe7rpA-1; Mon, 08 Nov 2021 10:04:41 -0500
X-MC-Unique: v1qhQkNIOvivn1lDWe7rpA-1
Received: by mail-wm1-f72.google.com with SMTP id
 y9-20020a1c7d09000000b003316e18949bso6325340wmc.5
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 07:04:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=JIcDoeaoj5eQxtGOT4RrWxc+9zCAAOpybERDnhhXIZo=;
 b=6IMz4wIJy/PZ38rlxqw0LQqXQBfsWqOIZRo9civDQh8lO32n22PNn9JpJLEzrYDIfh
 mtMP58nuuEcRxQ1uqWKY+mn9l7OH20dhNBXkkcQktSBI4N5uzF0YZ5IpQxlLpAFPq4Iw
 7rO6mXNWFZbScSANroTPM49/2J3lESHVLvKLf6Puh+UInv0JoeTQcbdFxz/0iFm/lQeW
 oLPCfzSfGm1mT5l4eMalWhtJqx9pXNIRHe+Vd4Am7OqrpYltQ26iQ1ZgJjWzAD5qQuVA
 zu/BY9zAy60X47EQHX44v3ksOZKxhuCqzJvSxrtz+X0XWIf0dfpI6zeO33cxD9AF0rot
 7U5w==
X-Gm-Message-State: AOAM530G4VQzPJa8f3kIsJk63P940RmREqKxN+zAHNfdtwomIiI7SaeC
 Omx+65QGXcLXkh4crudySAQ1Qu+2+wCkdx9JZumjphsy9emIQMVuMoSeFVLo/9he3w6iME59/d7
 ITIXyDRv/+4Kw14s=
X-Received: by 2002:adf:e482:: with SMTP id i2mr482880wrm.284.1636383880239;
 Mon, 08 Nov 2021 07:04:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1iB2qfwyoUoiC1ia0uzhPJicMrFOusJOltaKgMnwCtg8Yq61kKVzSQq16Xtnz1x2Hw0cLaw==
X-Received: by 2002:adf:e482:: with SMTP id i2mr482847wrm.284.1636383880013;
 Mon, 08 Nov 2021 07:04:40 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n7sm17073796wro.68.2021.11.08.07.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 07:04:39 -0800 (PST)
Message-ID: <a7992420-e2e3-7859-b2de-f9aa88c94945@redhat.com>
Date: Mon, 8 Nov 2021 16:04:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] hw/acpi: Set memory regions to native endian as a work
 around
From: Paolo Bonzini <pbonzini@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <20211108130934.59B48748F52@zero.eik.bme.hu>
 <b0787bca-8321-059e-d360-1e0a0af31228@redhat.com>
In-Reply-To: <b0787bca-8321-059e-d360-1e0a0af31228@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 15:30, Paolo Bonzini wrote:
> On 11/8/21 14:05, BALATON Zoltan wrote:
>> When using ACPI on big endian machine (such as ppc/pegasos2 which has
>> a VT8231 south bridge with ACPI) writes to ACPI registers come out
>> byte swapped. This may be caused by a bug in memory subsystem but
>> until that is fixed setting the ACPI memory regions to native endian
>> makes it usable for big endian machines. This fixes ACPI shutdown with
>> pegasos2 when using the board firmware for now.
>> This could be reverted when the memory layer is fixed.
> 
> What is the path to the swapped writes?  Even just a backtrace might be 
> enough to understand what's going on, and especially where the bug is.

Ok, Michael pointed me at 
https://lore.kernel.org/all/20211011080528-mutt-send-email-mst@kernel.org/.

Paolo


