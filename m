Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4BA6FB383
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 17:15:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw2Zm-0006Mb-0f; Mon, 08 May 2023 11:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pw2Zh-0006Lq-Vb
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:14:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pw2Zg-0001O8-Dk
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:14:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683558891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1KU4nwrAefSZEJBIv6IvuQYbFAtFPMGzvfMwsh/MJFs=;
 b=LLq1WPyZAZ6fFd5M04QRa/a6UnF1aWOEy9lGTv3C7yfeuEm9hkB2QcWFtqGpepc4+h/dPt
 9NBooQ+FKxz0Lq2G/apE3oSh1RlUcrf0eEV05wc39rv26rWbQUoktZu2E/YZ4Pji4NIKlb
 bYm7GaBqiX4E9EgBFzVoHUfaAFyVW9U=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-FLtazcndOQ-0DIwU9yrwyA-1; Mon, 08 May 2023 11:14:49 -0400
X-MC-Unique: FLtazcndOQ-0DIwU9yrwyA-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94f29909e11so415334066b.2
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 08:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683558888; x=1686150888;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1KU4nwrAefSZEJBIv6IvuQYbFAtFPMGzvfMwsh/MJFs=;
 b=JEdXATd2C3ICs2O9GF5mrbOTiKjEhHqjcIhGeig9vT7XZaM95udz6bF5vl7HsRgcPI
 TFDAE1Y8SyQSLceEOwK6+4Cihtuq5xdEWBoqb12F/YqMsE1M5o4/wNPwdjLQ7WWSaA9g
 PAmDX5RaPBXIsir8OrvW/a0h03LyX4K2Jd3ZNTxR8h/vWXqJfgGwtky5VAlPRnQVt2Ks
 flne7sCVAXhK1Dnjul6yrhCePq1RR86NdyJmFL76MK50g32eeIEauUDRxyN5Kb337130
 TH2ZPLVrPWVbphr5X0xD4jX5vzL4FE1Dlgp/llkdMCWDqdeD9IC1I3mXA/mkTnwtkMQv
 3UBw==
X-Gm-Message-State: AC+VfDwt2VyWJXYcmJD2MeuVhBQ30KadpucF1ANceotdcmtaa3E3O0Pt
 uPZ9jjcBPEJA1tcL2TbFtHLRkDJn8IRYD9V2J2TeYxtBfV8ZMAMcqToroEzLem+WHqXbDHF68UD
 I3YbYXUtIV1L5FzM=
X-Received: by 2002:a17:907:86a3:b0:966:3de0:89a7 with SMTP id
 qa35-20020a17090786a300b009663de089a7mr4753714ejc.64.1683558888722; 
 Mon, 08 May 2023 08:14:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5uo/Y18FA7HXQbRqZg6nGWULnhAAkS4Avu3OWAjcoAFuf+6IjibD3790MG/z8dfhwh90RxVQ==
X-Received: by 2002:a17:907:86a3:b0:966:3de0:89a7 with SMTP id
 qa35-20020a17090786a300b009663de089a7mr4753697ejc.64.1683558888443; 
 Mon, 08 May 2023 08:14:48 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 gs13-20020a170906f18d00b0095ef7268ba9sm94897ejb.41.2023.05.08.08.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 08:14:47 -0700 (PDT)
Message-ID: <21998b5c-43a2-f7e5-9515-45745441a12e@redhat.com>
Date: Mon, 8 May 2023 17:14:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 83/84] exec/poison: Do not poison CONFIG_SOFTMMU
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-84-richard.henderson@linaro.org>
 <c0e49af2-21dd-03db-0604-194a298d7a58@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <c0e49af2-21dd-03db-0604-194a298d7a58@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.802, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/8/23 16:27, Thomas Huth wrote:
> On 03/05/2023 09.23, Richard Henderson wrote:
>> If CONFIG_USER_ONLY is ok generically, so is CONFIG_SOFTMMU,
>> because they are exactly opposite.
> 
> I thought there was a difference ... at least in the past?
> But looking at meson.build they seem to be handled quite equally now:
> 
> common_ss.add_all(when: 'CONFIG_SOFTMMU', if_true: [softmmu_ss])
> common_ss.add_all(when: 'CONFIG_USER_ONLY', if_true: user_ss)
> 
> Paolo, do you remember whether there was a difference in the past?

No, I don't think so.  Really _none_ of them are okay in general, but 
now that we have softmmu_ss/user_ss there is a usecase for using them in 
"generic" sourcesets.  So perhaps we could have something like

/* One of these is always defined in files that can use them.  */
#if !defined CONFIG_SOFTMMU && !defined CONFIG_USER_ONLY
#pragma GCC poison CONFIG_SOFTMMU
#pragma GCC poison CONFIG_USER_ONLY
#endif

Paolo


