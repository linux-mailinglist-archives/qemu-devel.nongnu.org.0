Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FF42C2920
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 15:15:07 +0100 (CET)
Received: from localhost ([::1]:54226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khZ62-0001FW-07
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 09:15:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1khZ4M-0000nr-Ou
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 09:13:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1khZ4K-00007r-Ss
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 09:13:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606227200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OjRYmIktRf4YYUdr/9tVRD7z9GFjQgYs1tsCe90qOZA=;
 b=YvQbfk6cmui/7USFt6XNU77G2+Byw61Rn4T6nU+2qGtb8EpPHgBp5PS1QWaYEsXB/umR8k
 jKXxsG3NnnjKtQhK7QC421CGAIHgbA/TONcDnKjdeQMnn+STu8L5GhSejIg2CyElRWkVx2
 ImWcit5B+Xzx9pxLH1u5FvX7QuP8OG4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-d457k_zJMVWAD3ef_mDp5A-1; Tue, 24 Nov 2020 09:13:17 -0500
X-MC-Unique: d457k_zJMVWAD3ef_mDp5A-1
Received: by mail-wr1-f70.google.com with SMTP id f4so6897045wru.21
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 06:13:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OjRYmIktRf4YYUdr/9tVRD7z9GFjQgYs1tsCe90qOZA=;
 b=WI3PxVE4D0mSGsfvdCpi/ROLWQPOddZezgV013ueyWO8kg11DMowi75gfzkd2xpXAr
 bSdQxnDtEx1CSzdpsS8swWsVWhXA/QY03y7D7Z0gRCN4z6e3ymgZr9YTIv0YalWQI3WG
 M1n61kLkixXpP2DiVrw47N8VGs0EuTqGOET2d3TuTCKIO88exHUHH2mmIGFoy8CPaF+y
 k0sogN81ebWYGamRaRjLQVOoGMjgFNZVKhCO85xfJM/BOy1JsCKSQut6XwsWQSJVGK+/
 ItA4KDByoU8kXXMMRonfcXQrhUPCPrjTaAZiOU0EDphxg51ful18L+t9n76HkvZS1LMI
 JJtA==
X-Gm-Message-State: AOAM533t344DRTHZRHEDGA0Qsn0jfFEXTqFDvbnScOEtYndfYeUFUX/F
 qyk03qdpROLNYcasga6Cl1AxsTJlCfy+uc21+0xpSDDbudgMog2qLJWgm3xkolv7LdiEw9zjQtY
 lnW3RSn8aemAW1HU=
X-Received: by 2002:a1c:dc82:: with SMTP id t124mr4611849wmg.94.1606227196240; 
 Tue, 24 Nov 2020 06:13:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJym9TBq44+x/XB4QMkKCuNHP8gzQWnB5K0MZr00dmFvzwaigeH9oS9SVX7o0GCpF+EWWFyhuA==
X-Received: by 2002:a1c:dc82:: with SMTP id t124mr4611835wmg.94.1606227196100; 
 Tue, 24 Nov 2020 06:13:16 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id j6sm6379859wrq.38.2020.11.24.06.13.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 06:13:15 -0800 (PST)
Subject: Re: [PATCH for-5.2] Revert "hw/core/qdev-properties: Use
 qemu_strtoul() in set_pci_host_devaddr()"
To: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-devel@nongnu.org
References: <20201120130409.956956-1-mst@redhat.com>
 <f328f4c0-04b9-49e7-46f8-1435f8564042@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5b9724ca-cc73-e89f-0026-805b61f7cad9@redhat.com>
Date: Tue, 24 Nov 2020 15:13:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <f328f4c0-04b9-49e7-46f8-1435f8564042@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Klaus Herman <kherman@inbox.lv>, Geoffrey McRae <geoff@hostfission.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 2:10 PM, Paolo Bonzini wrote:
> On 20/11/20 14:04, Michael S. Tsirkin wrote:
>> This reverts commit bccb20c49df1bd683248a366021973901c11982f as it
>> introduced a regression blocking bus addresses > 0x1f or higher.
>> Legal bus numbers go up to 0xff.
>>
>> Cc: "Philippe Mathieu-Daudé" <philmd@redhat.com>
>> Fixes: bccb20c49df ("Use qemu_strtoul() in set_pci_host_devaddr()")
>> Reported-by: Klaus Herman <kherman@inbox.lv>
>> Reported-by: Geoffrey McRae <geoff@hostfission.com>
>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>> ---
>>
>> checkpatch will complain since it does not like strtoul but
>> we had it for years so should be ok for 5.2, right?
> 
> Yes, of course.
> 
> Paolo

Which tree is going to merge this patch?


