Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76A82FBDB8
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 18:34:28 +0100 (CET)
Received: from localhost ([::1]:39968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1ute-0001pn-Qh
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 12:34:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1uQv-0002T2-Dz
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:04:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1uQs-0003cw-7O
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:04:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611075881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pn7pq0zam3++eKM1IfoJESfVfVgGZxiJ4Qu+8NQz6FU=;
 b=TZYcRs933/DjM72FrMuMY0VGVVMBZ26KYTIztod6PwoIn7g0+A+nHP+R8m5Pj1omYSCXi6
 bAfDiyPHjtrh1bXJE4dXTCH8bKjbtaZLPJyYzzwTzhQkOsZtPB2X7/0rq+mpI/q99mj5+7
 eQzrcna4PjPOioVkXahpitV85TUlblk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-89EFV2itNQuVCy5iGk-InQ-1; Tue, 19 Jan 2021 12:04:39 -0500
X-MC-Unique: 89EFV2itNQuVCy5iGk-InQ-1
Received: by mail-ej1-f69.google.com with SMTP id m4so6532333ejc.14
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 09:04:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pn7pq0zam3++eKM1IfoJESfVfVgGZxiJ4Qu+8NQz6FU=;
 b=pAd4Php07zX2IJi7mTGioz21zGPd3gc1OXvZYSX1nlWIFYFgmWtJxAz/dHkIBEgq5c
 Iqd7sZq8kYwC6RgF8G8M+nd0yCffiJhA/yVqR+YiUhAQrorBgr606xxYOXtV6Y2yIwLk
 Uq6s4PCJL97miLfWmQc3Wsk0tvGT75HIe4IKGCR/lR9yvg5XfgnZgVvOAh9oAAJRkUwG
 pLrp+gqqZpKE8BzXhjIWH0xXBzul4X9wvSYxd8rwBPlIKZwdK1NfnbYmHs6gME3dF0pD
 w6gbMJieQaUiTtKBqxYG7XAzl3Xn/9BEzXRZqMVLbrZKwreQej1Y0b/2vzGaGrD4eshU
 ozWQ==
X-Gm-Message-State: AOAM5328etVAxoV6RlAviOIid/LrCO4ggf83ZAOHQrYWGUrF83O9utFT
 wnN0tEO8zdyR5uh5ddMrQ3ZExFCGCR5oMbTEqKTzmJJSclBfIlzwTe9MlcaJNtONSAyJwGBhvs1
 DWFZjBfgvCT3gIQo=
X-Received: by 2002:a17:906:34c3:: with SMTP id
 h3mr3563077ejb.132.1611075878325; 
 Tue, 19 Jan 2021 09:04:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXuAO6LWdlA7KelG4nny2Xck6oEdotBOpSU5IJXb5T1YW/heH2r2dTrjFmpupGms/LKarsBg==
X-Received: by 2002:a17:906:34c3:: with SMTP id
 h3mr3563064ejb.132.1611075878120; 
 Tue, 19 Jan 2021 09:04:38 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n2sm11027160ejj.24.2021.01.19.09.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 09:04:36 -0800 (PST)
To: Markus Armbruster <armbru@redhat.com>
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-4-pbonzini@redhat.com>
 <87o8hkx6n9.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 03/25] qemu-option: warn for short-form boolean options
Message-ID: <99a014a0-5d9c-07d6-250a-c56e6337cf69@redhat.com>
Date: Tue, 19 Jan 2021 18:04:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87o8hkx6n9.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/01/21 16:56, Markus Armbruster wrote:
>> +            if (!is_help && warn_on_flag) {
>> +                warn_report("short-form boolean option '%s%s' deprecated", prefix, *name);
>> +                error_printf("Please use %s=%s instead\n", *name, *value);
>> +            }
> 
> If @warn_on_flag, we warn except for "help" and "?".  The exception
> applies regardless of @help_wanted.  Shouldn't we except*only*
> recognized help requests?

Suggesting "help=yes" would be worse.

>>
>> -    opts = opts_parse(list, params, permit_abbrev, false,
>> +    opts = opts_parse(list, params, permit_abbrev, false, true,
>>                        opts_accepts_any(list) ? NULL : &help_wanted,
>>                        &err);
>>      if (!opts) {
> 
> This function now warns, except for "help" and "?".  The exception
> applies even when we treat "help" and "?" as sugar for "help=on" and
> "?=on" because opts_accepts_any().
> 
> It is the only spot that enables the warning.
> 
> Does all user input flow through qemu_opts_parse_noisily()?
> 

I was going to say yes, but -vnc (and worse, the QMP version of "change 
vnc") is parsed by qemu_opts_parse() via ui/vnc.c (besides being used by 
lots of tests).  -vnc has several boolean options, and though Libvirt 
only uses "sasl" it does so in the short form.

My solution would be to deprecate the QMP "change vnc" command, and 
postpone switching -vnc to qemu_opts_parse_noisily to 6.2.

The main reason to warn for short-form boolean options, is to block them 
for command line options that are switched to keyval[1].  Adding a 
warning does not necessarily imply removing in two releases.

Paolo

[1] This series already does that for -M, -accel and -object.  This 
means that applying this series would change the command line 
incompatibly without a two-release deprecation.  It's up for discussion 
whether to do so, or delay the application of those patches to 6.2.  It 
would be a pity to hold the dependent changes for effectively a year, 
but it's not a big deal.


