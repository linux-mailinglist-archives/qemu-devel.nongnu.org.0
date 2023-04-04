Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9856D64D9
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:12:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjhNo-0002n5-Pe; Tue, 04 Apr 2023 10:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjhNn-0002mr-IX
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:11:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjhNl-0001Up-Ke
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:11:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680617492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TisgKyFGOpI1YDg6FrD92tL7UQj1mbcsoHEtapa+qgQ=;
 b=AMBwNazjVh5xDADHrk8Cs1G0hcY8+QTkfVqmEupBQIbAaDzkSFg4/bsj+fySUgHk5NjNyw
 tJmkX2zsRcm4hEKx9MH8fSJA4b3txh8QB0OzL0tcz6kHzimL5ihrHq3Aan99dkmFxqFWp+
 pBZMHZbNPZCB+g+uUPLcT102vENgroo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-Rz6aoRJENlaU5hSdB6x_Xw-1; Tue, 04 Apr 2023 10:11:31 -0400
X-MC-Unique: Rz6aoRJENlaU5hSdB6x_Xw-1
Received: by mail-ed1-f72.google.com with SMTP id
 i42-20020a0564020f2a00b004fd23c238beso46156299eda.0
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680617490; x=1683209490;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TisgKyFGOpI1YDg6FrD92tL7UQj1mbcsoHEtapa+qgQ=;
 b=XXIp2kXzDyz9P7GFlqzF1X3pPcppthO93zjJ9+aeATIqcbro8HHDTUqgLUxAabbR7n
 EQX17DZ2SNqkQN/K4zvLKo1Dto34Jt9gCUe6AdRrZ37x82Vhs3/5py83YYloqlXjurX+
 AsvL+/P37GRoSHeiuZisH/MGfIpMPeNtQoyoxlZ7eVTsnFlBZAmSRmGnB24Ith9ywTvW
 EnS1eYu7a21HgO5XxWBBFyZJYjJMclCkZay5bajiED0QZKralR5XP5qFIqDqxnLQqtdW
 /cMlbKwUCEafKeRZa91vS6npqe4onfYnv6iOax4daaElYxbjXpXdDUPoveDb0I9NhBO+
 OVxA==
X-Gm-Message-State: AAQBX9dnpsgivF7i8FyjcpCxUuyry4ps5c9ZSGlPiz+yGg+WmUScGK1b
 O8m+L6laZk2fM3ha2w3lhcrCSPCzyH1zbTG3arTasF9XgOKI4KRDJhHK5oFa3r6TcdTnX70zZcH
 Woue5SdayQg+YhMg=
X-Received: by 2002:a17:906:3448:b0:92d:44ca:1137 with SMTP id
 d8-20020a170906344800b0092d44ca1137mr3175177ejb.43.1680617490331; 
 Tue, 04 Apr 2023 07:11:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350bD3xULMBeeboa0MXr/1RgM82VJNaV21mWe9A2bnmdm4hUV4LofFkDb/ZUouE5GXydnJr05fA==
X-Received: by 2002:a17:906:3448:b0:92d:44ca:1137 with SMTP id
 d8-20020a170906344800b0092d44ca1137mr3175159ejb.43.1680617490075; 
 Tue, 04 Apr 2023 07:11:30 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 9-20020a508e09000000b00501dac14d7asm5996836edw.3.2023.04.04.07.11.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 07:11:29 -0700 (PDT)
Message-ID: <c0c6c01b-8e3d-d35e-1425-9d4f2b0dc01f@redhat.com>
Date: Tue, 4 Apr 2023 16:11:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 10/10] hmp: Deprecate 'singlestep' member of StatusInfo
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
 <20230403144637.2949366-11-peter.maydell@linaro.org>
 <87wn2s12bu.fsf@pond.sub.org>
 <CAFEAcA_v4yt1S+jjX2acyDLjb6OGTGOSLGxGUkH5XALKjBkHVQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA_v4yt1S+jjX2acyDLjb6OGTGOSLGxGUkH5XALKjBkHVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.925, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 4/4/23 11:17, Peter Maydell wrote:
> 
> I don't want to add a QMP interface for writing it unless
> there's somebody who actually has a use case for it.

We could place the accelerator at a well-known QOM path such as 
/machine/accel, and then qom-set can already be used to implement such 
an interface.

Not that you have to do it---just an argument against adding a QMP 
version of singlestep/one-insn-per-tb.

Paolo


