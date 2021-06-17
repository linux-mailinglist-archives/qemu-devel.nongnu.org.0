Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2833AB45A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 15:11:03 +0200 (CEST)
Received: from localhost ([::1]:49914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrnS-0002gP-FW
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 09:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltrYM-0001EY-PF
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:55:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltrYH-0004KF-Q4
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:55:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623934520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YXR63LQ1cEnjV338YefflnsguZ0kPIy0K4K+Qwx3S6A=;
 b=ayPIG1UVR9iRnw22LF8ZOmDUdOVF61IbzTOMNVFkC+OTAJvMCJKq513yN2z8qqMOLiBMq4
 ezp4sMQ7kSZh91k8/tUljgkFPvRb0R9QYaTuIOgsWG+VUquzRo6eKARRT0v5kMSi+t1mzX
 O548LhuRphvqeCOhaETvfJNN1HR+RBA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-Q_TSLiS7Ps6-aivKDknC0A-1; Thu, 17 Jun 2021 08:55:18 -0400
X-MC-Unique: Q_TSLiS7Ps6-aivKDknC0A-1
Received: by mail-ej1-f72.google.com with SMTP id
 lt4-20020a170906fa84b0290481535542e3so317119ejb.18
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:55:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YXR63LQ1cEnjV338YefflnsguZ0kPIy0K4K+Qwx3S6A=;
 b=Ie9PAq41lhCjFJ5bGfLWG/tMpqdNFaoW2lqVYwu7cdFGFgtXKd6vyk166MYoRBBgti
 7dLhUKDI8CS1G7J7qaUXG4Ki2WqwmhJR1gNpSYrWKCdHv/gC+SCMYeB8ncI3Rpbau6Pa
 YOt1PYtU5zpKOz36aznTm9j9oyHMGTMah/E+aSVsAEi5K9C4N6qYOd/54N60BKbXL4RP
 dsba+yC9INchdUVk3N9k66kRjyz1rhywEHP7oE/UQ9OrgcFMlcseL0FBv1vPk/OrRrT8
 dpIydk10CgE3J+TN8bm/E+Eh6EZcqQi5uebKYbNhAIGnG9NwMQG3Wo1CbKQilRZKNKOi
 UNNQ==
X-Gm-Message-State: AOAM531N8rMQifXJ9RacH/qihpQ9SV1WFAe5iFfIU7y4Elrstyg+qwIS
 XLxjJf2CTVDjXg1KvYMNjTgUzOYdB0EFG+c0BFLBHXDl+dQhoCAVMLwSWvEQ16PluBZgMDiFNPW
 u1EDobgU9CVJbufUBWyjndsKxxqysHSIfgeBUR3M0LeCSriT4/eZd412nXSeFwnGXiyo=
X-Received: by 2002:a17:906:34cf:: with SMTP id
 h15mr1596003ejb.526.1623934516615; 
 Thu, 17 Jun 2021 05:55:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwm4YCQslkrltrhQTrccGC65HJvSaotCgLhS6o0EBM8JdEsMaxzDRS/IGHevR+m+cTKjDMM6A==
X-Received: by 2002:a17:906:34cf:: with SMTP id
 h15mr1595985ejb.526.1623934516376; 
 Thu, 17 Jun 2021 05:55:16 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n26sm3681810ejc.27.2021.06.17.05.55.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 05:55:15 -0700 (PDT)
Subject: Re: [PULL 00/33] Misc patches for 2021-06-15
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210615133855.775687-1-pbonzini@redhat.com>
 <CAFEAcA_LNDqvLS7g7RqPHB54nrphjkuF3w=K2x-wX9D_oJfhKA@mail.gmail.com>
 <7b25ff29-4f7e-aca5-d3b1-7732b35c018c@amsat.org> <87czskg5xg.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <58c260cc-998f-9daf-4d8f-f03c358886d0@redhat.com>
Date: Thu, 17 Jun 2021 14:55:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87czskg5xg.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.254, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL_A=0.1 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/06/21 12:06, Alex Bennée wrote:
>> FWIW I sent a series adding FreeBSD to GitLab:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg809453.html
>>
>> But we might get it even quicker apparently, by plugging our
>> cirrus-ci to gitlab-ci:
>> https://potyarkin.ml/posts/2020/cirrus-ci-integration-for-gitlab-projects/
> I wonder if the mirror between github/gitlab is kept upto date quick
> enough? I guess we need to clone of the real URL to work across peoples
> personal repos.

I do use cirrus occasionally for pull requests that touch relevant code, 
it just didn't occur to me that this was one of them.

Paolo


