Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B666C631D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 10:19:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfH5k-0002Ju-HD; Thu, 23 Mar 2023 05:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pfH5i-0002Jj-ON
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 05:18:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pfH5d-0003QT-FG
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 05:18:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679563112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vOIPkDgGtn/urz6AigXtbArfWbCxiuKLUPS0FoS/UIg=;
 b=FgsdQVfEylaeNNGCoLcvqX5BhvfEGdaGEOErnl3VcivqLVvBvomT5BItJ25CN7/IFXzJHB
 ZOraae6kSU77iJSB+5cDUDncnPVYAWO+fYA4K3jYtoz/eUrCDX3S2Dg0l7s6y6wKI8vhnO
 93udr4hpUeOHn0ADg3ksqaLIeqgXOhA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-ZC9ywLlEMwKfxFu7fobRyw-1; Thu, 23 Mar 2023 05:18:30 -0400
X-MC-Unique: ZC9ywLlEMwKfxFu7fobRyw-1
Received: by mail-ed1-f72.google.com with SMTP id
 f15-20020a50a6cf000000b0050050d2326aso21949091edc.18
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 02:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679563109;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vOIPkDgGtn/urz6AigXtbArfWbCxiuKLUPS0FoS/UIg=;
 b=yjFI4OKdi3Bw1ydpan0NXZwiFNRsi7mZ94zcqdCcXIxaIP/YS0o61WK6VfUcybE59m
 sefxfgd1carvj3jarCkAbyXBKC5f629wfpCMc8BrlQiXSmyUuKfBTlfHmI3aYLIlFaMN
 pNBvqbWzaDqMiNkDIiw5TFBbQ1sp32vwJwOyciH/I7l/xjCHy3LGce7k4fOxc5y+0Wh/
 depPsbk5Ktx9rSdo/bTI++4l7fNsW5tmLBykxFsB8KEVzJKIx8+/z910qrBwGRIiltpD
 tkN/UcyK88JJQUv9dRPM8JhSJWP6cYqApA/G1KUctHZvCz7pp2Rm6OaKZaUKcsQBEkKl
 OkqA==
X-Gm-Message-State: AO0yUKVBEsF+gC80RuJy2JWIQ8a3UERfdOKx3JRSBRqaUlW/GUvvyIbd
 0JuRbr+5W9BKonEcMF6ijseATuwjB3riXo4AEjszSBpWhJHHMj9pmlgeawaBBxFFIjkuEGXWWOV
 f832qp851FhPEjCc=
X-Received: by 2002:a17:907:7ea1:b0:8b1:7ac6:3186 with SMTP id
 qb33-20020a1709077ea100b008b17ac63186mr12596739ejc.68.1679563109480; 
 Thu, 23 Mar 2023 02:18:29 -0700 (PDT)
X-Google-Smtp-Source: AK7set8VUADS8RPaOZFKj3Fd3VZLQf/gjlf2x9JdYhXx+Sgh4/QTXsHLHGURPYhWLc2k5L9S+D00iQ==
X-Received: by 2002:a17:907:7ea1:b0:8b1:7ac6:3186 with SMTP id
 qb33-20020a1709077ea100b008b17ac63186mr12596727ejc.68.1679563109224; 
 Thu, 23 Mar 2023 02:18:29 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 pj6-20020a170906d78600b00905a1abecbfsm8353673ejb.47.2023.03.23.02.18.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 02:18:28 -0700 (PDT)
Message-ID: <d0ea9e8d-3cd0-0db3-660b-a7ae351c0a62@redhat.com>
Date: Thu, 23 Mar 2023 10:18:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: out of CI pipeline minutes again
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Camilla Conte <cconte@redhat.com>
Cc: Eldon Stegall <eldon-qemu@eldondev.com>, Ben Dooks <qemu@ben.fluff.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA83u_ENxDj3GJKa-xv6eLJGJPr_9FRDKAqm3qACyhrTgg@mail.gmail.com>
 <20230223152836.dpn4z5fy6jg44wqi@hetzy.fluff.org>
 <Y/eHLCKcdYk0V4Tt@redhat.com> <Y/fkf3Cya1NOopQA@invalid>
 <Y/zhZ4brfdQ7nwLI@redhat.com>
 <CAJSP0QX2tkaVZh0FX4Ke8EWn7tO9qm76YnRCHe6-UxWJg6LzTQ@mail.gmail.com>
 <ZBnd4/UTH6CD5vx7@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <ZBnd4/UTH6CD5vx7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/21/23 17:40, Daniel P. Berrangé wrote:
> On Mon, Feb 27, 2023 at 12:43:55PM -0500, Stefan Hajnoczi wrote:
>> Here are IRC logs from a discussion that has taken place about this
>> topic. Summary:
>> - QEMU has ~$500/month Azure credits available that could be used for CI
>> - Burstable VMs like Azure AKS nodes seem like a good strategy in
>> order to minimize hosting costs and parallelize when necessary to keep
>> CI duration low
>> - Paolo is asking for someone from Red Hat to dedicate the time to set
>> up Azure AKS with GitLab CI
> 
> 3 weeks later... Any progress on getting Red Hat to assign someone to
> setup Azure for our CI ?

Yes!  Camilla Conte has been working on it and documented her progress 
on https://wiki.qemu.org/Testing/CI/KubernetesRunners

Paolo


