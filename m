Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6071F616360
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 14:07:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqDQA-0008Jo-A9; Wed, 02 Nov 2022 09:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqDQ2-0008Fj-UY
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 09:04:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqDQ1-0003zo-Bw
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 09:04:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667394272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jUJ6+64JW8Spr0iUTgSIHaEJ2T16LOH1qejF9XH7wlI=;
 b=Q0qu8Xsc3hdk0vOFfIPZS2Fz9qQ1L7ZIPOvMlD/rd4AVS5y7Vj5IVnXhwCNTFNog+/H7rI
 Miv9CvBMgaGL4doiiltGAxaAL8YDVcviszPgdSFAlMbUwA8/rvupkKCruPpb6pRw0Ijf6o
 yumfZ2FA/HbsLQzl3yW3qxbycK8RMK8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-Wo_RXlr4P1qMBMyZ_SBZaw-1; Wed, 02 Nov 2022 09:04:30 -0400
X-MC-Unique: Wo_RXlr4P1qMBMyZ_SBZaw-1
Received: by mail-ed1-f71.google.com with SMTP id
 b14-20020a056402278e00b004621a2642d7so11991249ede.1
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 06:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jUJ6+64JW8Spr0iUTgSIHaEJ2T16LOH1qejF9XH7wlI=;
 b=nWUT9txdmYHHUxxnTY1jR5kJvOuVr6v6DhkOy1FbGkIBOBkiKjWV/dIN0i5mLO0O4K
 GvWJJRIzZmXFVTW8ohEBBE53xhqfbA2RrsQ8HrSlPOKOp5evRRVGFALhv18s2psOnoGp
 ywt6HVzcByVhnJiea5RJqidhZ2I+FjH9i8dg4Rf4cpOHe67aLYhVyn1220VyFIgUrORu
 eQATo7p4Qa48YLlXfhVtPJEsWpsA7w156LcjNOf0VLKPbLbLAAuWCG7xKRrUm5zU2q0n
 cYal59Sii1TJYeSe7CKzwMd+0bg7Gl5bMsyphovshydfHtFscPgGwTjoVo9v7F1yNYZ3
 B4oA==
X-Gm-Message-State: ACrzQf3dM9KuoQJhuSccAdV51u9o/PHfNRsvQnr5DmNITwXd03yMPltX
 eBV2L4FQQiMRSDXHUxCMFuDl2cwfOLHL3P8uFKacbMYQKb3e1FsFzChgT+NH6QeZgWSKW6bIv7t
 bNggYa6dbatxiRfc=
X-Received: by 2002:aa7:d744:0:b0:45c:e353:e891 with SMTP id
 a4-20020aa7d744000000b0045ce353e891mr25139023eds.36.1667394269717; 
 Wed, 02 Nov 2022 06:04:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5n6xr5wGvWj4MlbYanP4OlHxsBIFQAbguIIh8RKG4t1FK/o4hjCPZIZm2gJwr3cyZwCKFXDQ==
X-Received: by 2002:aa7:d744:0:b0:45c:e353:e891 with SMTP id
 a4-20020aa7d744000000b0045ce353e891mr25139007eds.36.1667394269517; 
 Wed, 02 Nov 2022 06:04:29 -0700 (PDT)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id
 m27-20020a170906259b00b0077016f4c6d4sm5411840ejb.55.2022.11.02.06.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 06:04:28 -0700 (PDT)
Message-ID: <f2a63796-5409-3ade-1735-032768036f83@redhat.com>
Date: Wed, 2 Nov 2022 14:04:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PULL 0/5] Misc patches for QEMU 7.2 soft freeze
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org
References: <20221102114125.58902-1-pbonzini@redhat.com>
 <CAEUhbmVpCk59Kq1QtEngYNq3MfUmVW9p5gSs9j8Pw1zGtDEoGQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAEUhbmVpCk59Kq1QtEngYNq3MfUmVW9p5gSs9j8Pw1zGtDEoGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/2/22 13:13, Bin Meng wrote:
> Could you pleaes queue this series?
> https://lore.kernel.org/qemu-devel/20221019102015.2441622-1-bmeng.cn@gmail.com/#t
> 
> If you are not the right person to queue this, please recommend
> someone else. Thank you.

I was expecting Marc-André to handle it but sure, I will send another 
pull request with your patches.

Paolo


