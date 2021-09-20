Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C5041153C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 15:04:31 +0200 (CEST)
Received: from localhost ([::1]:46406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSIyE-0000xI-D2
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 09:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mSIvB-0007Vf-Fx
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 09:01:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mSIv9-0000NR-Vh
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 09:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632142879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J7QCu2OJ9dqx4Pv+5pdPneP9JZSphKKzs440Vb0JjT8=;
 b=SOH2UW6Li3p72aQHF6MYHta+5ikMV5YJ6RqqruQKjKfsnxGAIz79+zDSHTcxwd7yz3jGtj
 0bJh22bz6/YsRzHYysArylSc81SRQqrk101x79m84diDZ19SqBQ7XZ75ozUMfBBmYfcrR2
 S4semcpBNV65aiLq5ROAto7Q7+ydFjY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-1RQ2y3vGNbePgBiZxLYSBw-1; Mon, 20 Sep 2021 09:01:17 -0400
X-MC-Unique: 1RQ2y3vGNbePgBiZxLYSBw-1
Received: by mail-ed1-f69.google.com with SMTP id
 j6-20020aa7de86000000b003d4ddaf2bf9so15538582edv.7
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 06:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J7QCu2OJ9dqx4Pv+5pdPneP9JZSphKKzs440Vb0JjT8=;
 b=SHMrrasGL5r7ZaTmrw8YjbIQlKbMFLU4AkVTMkeuBa8/jGA5OyUyQ2ybjMdgSM7OmG
 K+Mi/+o+DAXWNoZF38hqlP16nL5TF6ZBxFnGRLrEFom13qZNgcskk3bj3+cg/Koqk64N
 5t/zj+M9FuhAW3TaeWwPjol6pxXSE5KYorb3euJJULhYQmpkUPKMQr22HXSqri5p0hDP
 XkoSwO5MGgH9EB6F2f0d0Q+PwSl2C0TUEkzjrl8VBHlAMDA4WhQ68GmOqXvdGTxJ1pyx
 Ns4yehx7jRWNrGBmHMKclthCfTh00u6otPBY05KJgSWkbAz/JyS9e0SXCj/3kOL16TPp
 EwBg==
X-Gm-Message-State: AOAM53251r6I+SY6X8Xe+jd5qjCPLV78VWaDv813aSB8TNkITQbx5zys
 gROPPFe0N6eqypJofc52fG0Tg1OFDYL24X8eA3Zn3Y0Gxm2VcLQG40F5RyaVr9+H9PpjQ4PgMXG
 i/NxmYFA5IUTUwGM=
X-Received: by 2002:a17:906:7ad7:: with SMTP id
 k23mr28082768ejo.405.1632142876138; 
 Mon, 20 Sep 2021 06:01:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvwJS1ZvL0RNXK+nCTNKYk4sqhcdsrzOUYa/9QR4kaZXaJpD4dUVsxxuq1WoAXLm7StrINeg==
X-Received: by 2002:a17:906:7ad7:: with SMTP id
 k23mr28082754ejo.405.1632142875988; 
 Mon, 20 Sep 2021 06:01:15 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q12sm6102694ejs.58.2021.09.20.06.01.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 06:01:15 -0700 (PDT)
Subject: Re: [PATCH RESEND 2/2] memory: Add tracepoint for dirty sync
To: David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20210817013553.30584-1-peterx@redhat.com>
 <20210817013706.30986-1-peterx@redhat.com>
 <43b42f6e-f2a2-6341-0c53-bcf1586fb191@redhat.com> <YRveXqqR+DELQVSe@t490s>
 <5f6066fb-79be-e369-5d05-8bd22db8864d@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <db914789-caab-dec8-203f-99c2c6dd16de@redhat.com>
Date: Mon, 20 Sep 2021 15:01:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5f6066fb-79be-e369-5d05-8bd22db8864d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/08/21 18:07, David Hildenbrand wrote:
>>
>>
>> If we want to make it start/end pair, I can do that too.  But the 1st 
>> patch
>> will still be wanted.
> 
> Yeah, absolutely, not complaining about the name, it will be valuable to 
> have!

You could have start/end tracepoints for memory_region_sync_dirty_bitmap 
on top of this one that you are adding, so I queued the patches.

Paolo


