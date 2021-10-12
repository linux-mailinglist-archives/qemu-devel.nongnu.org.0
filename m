Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBA242A39A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:48:10 +0200 (CEST)
Received: from localhost ([::1]:39672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maGGO-0008Rx-41
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1maFYe-0001my-AG
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:02:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1maFYa-0006ff-HA
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:02:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634036571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=16TJWRqO9aRIoIdfYtS7fm6oP083AX+dsD94UL+pLfI=;
 b=WbYljPq35RuseNd1c34C/5CicIhs44sNe5TjdbA9TXi2uqW22Jn2vw7LYQJ5WJfcEVibWJ
 vxiE4r7C+vpZJAuNZfy8t6bE07hIR1qfS3TMwfEFlzol5bnK19Clknev3CsnORYxxXITDv
 Ou8KH/iJUdYn6E9hYt6iGWRpdIGh/Vg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-DpZur93lN-yW_6RXohCTVQ-1; Tue, 12 Oct 2021 07:02:48 -0400
X-MC-Unique: DpZur93lN-yW_6RXohCTVQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so15451258wrb.14
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=16TJWRqO9aRIoIdfYtS7fm6oP083AX+dsD94UL+pLfI=;
 b=roeNOtp44m7brjeHz+fJBhdKy47wkmW7+H3bTXe7LUHby+SnGZuUGqz6CvomWiGcCN
 rVTI19Fc0F7+wxMETJEnbTVU5X5LL9r3HoKEInJK/NAbrhfAlfpdrQN7kK/xIa6hDDnM
 6ehk+f9vvzL1k3LuKfpGdcSnAdlcHt1MetFxDBgU3h+vQyja5ZernRidpuJzLweXhKC6
 ddtTt0vj7USbsErS3GR3UhEv25lrmtY9BXEbzATO5AQJOcFyQJMc2UGZ4XBnJ99CEn/n
 R+ll1APPvYrB+klDJgKW2wWZspcZOuztO0g3Fv0hj+bqPtViaiAoEar4M7XpvzGErf7p
 kl1g==
X-Gm-Message-State: AOAM533oEisJp2fCuCgjnrujoTjnI88n9Ti2zJMjB1GYzr7j7b9X2fhG
 ZefwPtCPnhwWXom9IxcAf5F6mcF1fHRNID56SdUb2RPMKQcQxGeSMM6a0AI/tPEvhbuTZ2LiaUG
 x33SkgJx/IpU6lNc=
X-Received: by 2002:a05:600c:4ecb:: with SMTP id
 g11mr4643265wmq.67.1634036566945; 
 Tue, 12 Oct 2021 04:02:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrw+uxcsqdiwtxzTPRg38wQM/U+46wmY94fwTvrgS5+Y2AV4wUpeWRX7DmT+SsgMvGBqWA0A==
X-Received: by 2002:a05:600c:4ecb:: with SMTP id
 g11mr4643242wmq.67.1634036566751; 
 Tue, 12 Oct 2021 04:02:46 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a63sm255036wmd.34.2021.10.12.04.02.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 04:02:46 -0700 (PDT)
Message-ID: <7acf9d13-957f-af33-0446-c2c90f913de7@redhat.com>
Date: Tue, 12 Oct 2021 13:02:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/2] target/i386/sev: Replace malloc with local variables
To: Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org
References: <20211011173026.2454294-1-dovmurik@linux.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211011173026.2454294-1-dovmurik@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 19:30, Dov Murik wrote:
> In two places in sev.c we use malloc+free to manage memory for small
> constant struct variables.  Modify this to use local variables.
> 
> This small series can be applied on top of master or on top of Phil's
> Housekeeping SEV series [1].
> 
> [1] https://lore.kernel.org/qemu-devel/20211007161716.453984-1-philmd@redhat.com/
> 
> Dov Murik (2):
>    target/i386/sev: Use local variable for kvm_sev_launch_start
>    target/i386/sev: Use local variable for kvm_sev_launch_measure
> 
>   target/i386/sev.c | 39 +++++++++++++++++----------------------
>   1 file changed, 17 insertions(+), 22 deletions(-)
> 

Queued, thanks.

Paolo


