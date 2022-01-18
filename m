Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3257492738
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 14:24:31 +0100 (CET)
Received: from localhost ([::1]:35756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9oTO-0000e1-Lg
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 08:24:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n9na1-000263-56
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 07:27:17 -0500
Received: from [2a00:1450:4864:20::32e] (port=43739
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n9nZy-0001mM-P9
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 07:27:16 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 e9-20020a05600c4e4900b0034d23cae3f0so4764247wmq.2
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 04:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y1lrci0Jci44E7AKoNdT1rztU7asikoU7pbMv3cTTl8=;
 b=OMnfO+McSblK1+xCZdWVDLVtmkMdPNNhNY5MwNdZ2TZe98+qVsz/+SqyIyeQV14jl7
 b27UkRWFZ8IrIwuFDc7fuxWLzdVeo6lGB79fkVZpSTP/EaQsFZ4uAjtjvQqMrsZOkGQ/
 C5vqcd132+XEo9ztsQDcLGLH6xXVFqcCPRiNz3aVuqAdcuVbOBfZJnqNvdTBp7i4Zi6p
 O/YNKefmGSbcj3ame74IBSYvXZ9dtvrS5pA8xRE78oDsBgP4Pm2gM9U5purVee4/OfKD
 JhEF/QywQoe4ff9I9y/GTTOkembJX8EjFExh77Y5Q1QSTbDfsTpAwZ3xU0WTKPvsWCZa
 rT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y1lrci0Jci44E7AKoNdT1rztU7asikoU7pbMv3cTTl8=;
 b=eSyKjp0TNHSmeO6xDzQFO9EErFOsWvjed0gcf1Y1pvYhlyueP9sMs68u1T9CP367Kj
 wBPCVyvP3VsOI4YCSr/mvD2AtD5lLTnhCGs5C4Z1jgfuYpTqYWQfoMtGkvNZLI3rvU2N
 ffyNcPYrpqqnn4Eu7gt5Bc7wP4hUDkcqrzV5xw+bcQxU1uF6wpYkIYreAKzk1PYM45J1
 OcY4qifhTiHg5G7ZDTP2XDi0Ehfi4ozGsaKNGVmfdBO5U+Q/1mCyPoNRgMGESMYt3Yuw
 abniEUsj7w11GWWdD3Vq9hx0Zap2RZsfW3q/AQhs0V0LJUkkU32If5f7Tg5IE8q3+te7
 zDfg==
X-Gm-Message-State: AOAM533ACXldxs6dypmxpDPQM0hI6igJ1anBrPhsHeLWifMj7T0Swrr8
 8k0RDUkOttpqR1V4PXm7pgM=
X-Google-Smtp-Source: ABdhPJyB/ILdJxTGlP6eN8fXgJCyxFt4lfUufRJ50LYt5MSsCbhxRvdiv+JLwsuT6VgtwSoDI/Nh1Q==
X-Received: by 2002:a1c:ed01:: with SMTP id l1mr32504803wmh.185.1642508794823; 
 Tue, 18 Jan 2022 04:26:34 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id e9sm2079327wmq.46.2022.01.18.04.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 04:26:34 -0800 (PST)
Message-ID: <a39efdf3-82f3-9042-8b53-86394d7aa90d@redhat.com>
Date: Tue, 18 Jan 2022 13:26:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/3] qmp: Support for querying stats
Content-Language: en-US
To: Mark Kanda <mark.kanda@oracle.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211119195153.11815-1-mark.kanda@oracle.com>
 <20211119195153.11815-2-mark.kanda@oracle.com> <Ya+rLex1djU/1Wc1@redhat.com>
 <ee0d6990-06f3-9a1b-f7d5-7c379f0e9773@redhat.com>
 <5b2f4acf-29fb-34fd-eee0-341eec163da7@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <5b2f4acf-29fb-34fd-eee0-341eec163da7@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/22 16:17, Mark Kanda wrote:
>>
>> I agree except that I think this and StatsResults should be unions, 
>> even if it means running multiple query-stats commands. 
> 
> IIUC, making StatsResults a union implies the filter is a required 
> argument (currently it is optional - omitting it dumps all VM and VCPU 
> stats). Just to confirm - we want the filter to be required?

Yeah, I think at least the "kind" (vcpu, vm, perhaps in the future block 
or net) should be mandatory.  If the caller doesn't know of a "kind", 
chances are it won't be able to understand what object the stats refer 
to, for example the vcpu "id" here:

{ 'union': 'StatsResults',
    'base': { 'target': 'StatsTarget', stats: ['StatsResultsEntry'] },
    'discriminator': 'target',
    'data': { 'vcpu': ['id': 'int'] }
}

(which is another different between Daniel's proposal and mine; his just 
placed all vcpus into an array with no explicit id, if I understand 
correctly).

Paolo

