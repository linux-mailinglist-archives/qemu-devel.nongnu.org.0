Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362312DE8A6
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 19:02:53 +0100 (CET)
Received: from localhost ([::1]:33768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqK5b-0004Wk-Rl
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 13:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kqK4H-0003l3-2p
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 13:01:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kqK4B-0001aG-Ta
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 13:01:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608314481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aJ3nYy/M8Dv8uAzOSThlh9a+pOwwb/lPmEezI92sz8Y=;
 b=aU/iEFrbhNOKJISzbUXrw2BE4Ifj72T7Z3IAHNJpMLSxaxTmUpRXsBpQPOr+PTl5a1wGOl
 d7U+5wHJWFLzjE2LsONN3y/sQb/r0emBcEvHD8FwxoLF681QVfS6KOraZ3FzTGoojxD6pR
 1B9hf926sF2nMPPGmoN49ug73MlNS+Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-EtyWWPaYNJiEH14bOr_lXw-1; Fri, 18 Dec 2020 13:01:20 -0500
X-MC-Unique: EtyWWPaYNJiEH14bOr_lXw-1
Received: by mail-ed1-f71.google.com with SMTP id a9so1427761edy.8
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 10:01:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aJ3nYy/M8Dv8uAzOSThlh9a+pOwwb/lPmEezI92sz8Y=;
 b=l7iuqaI/HxtZarIW+74P4FoBhGqfq2xgu8grPypAggXIgdSXlUvuxsJPr6hNlhexdL
 g5viFdtoTeNOdXJ9upYCPESat4MCWA/qGrcUD2e0Mtol0nESxZef7cOaf8/NAWSaN0kh
 iXICKspYSioDguNSbwl6hOo9+bpHT8mc8ZCIeWpVYHNvg/1bZ7mjzLdJqyb6SN4Z+zl8
 eD6wQUrhGBOOryUNPyJGINVfXLRZx4bSYwh/F6YgjbJihSZ8qmyAv1nH+bdxvT4mHDC6
 JtqOD2wUPPu611N4lhqf4BfJERc03DqgecHOZVjCBqeBiWu0bIiVCkp5oAHBpxIpdluC
 qhQg==
X-Gm-Message-State: AOAM530CTSmrGSiQiCUacXGxk+cpOgIARxn51nHtkxfGMEbhVNw9D+I4
 TShA4uJXpLmc0MFYbZBuIpncnUgg7dw0AVQFre43+zzumTwF2JBghR/Up99HNLcBJ6PXfBkI4lf
 CPqvIvKHmLjUtUT0=
X-Received: by 2002:aa7:c353:: with SMTP id j19mr5655418edr.204.1608314478582; 
 Fri, 18 Dec 2020 10:01:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0AEBs4FPGtVXbDeE1pvBpCGcRf2JBrs9JnzfjUZVFaPtZh/to58UndKBy9jQjPNeo6WlLKw==
X-Received: by 2002:aa7:c353:: with SMTP id j19mr5655381edr.204.1608314478401; 
 Fri, 18 Dec 2020 10:01:18 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o11sm5720765ejh.55.2020.12.18.10.01.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Dec 2020 10:01:17 -0800 (PST)
Subject: Re: [RFC v6 10/11] accel: introduce AccelCPUClass extending CPUClass
To: Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201126223218.31480-1-cfontana@suse.de>
 <20201126223218.31480-11-cfontana@suse.de>
 <6cbd508c-b24b-3219-3302-196dfefaa8f7@redhat.com>
 <ff157643-5245-85ba-123e-32800f212f4b@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <51838c6c-8a44-afef-1acf-b8acb3eada19@redhat.com>
Date: Fri, 18 Dec 2020 19:01:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <ff157643-5245-85ba-123e-32800f212f4b@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/12/20 18:51, Claudio Fontana wrote:
> But with things like cris/ for example,
> the tcg functions to use are actually versioned per each subclass of TYPE_CRIS_CPU.
> 
> Different tcg_ops need to be used for different subclasses of the CPU_RESOLVING_TYPE.

CRIS is not that bad since it's TCG only.  You can just make it a field 
in CRISCPUClass and copy it over to tcg_ops.

I think ARM had something similar though, with different do_interrupt 
implementations for M and A processors.  Somebody from Linaro was 
cleaning it up as part of some BQL work, but it was never merged.  But 
even in that case, do_interrupt is somewhat special for ARM so making it 
an xxxCPUClass field makes sense.

Paolo

> So in order to avoid code in the class initialization like this:
> 
> if (version1) { then set the tcg ops for version 1; }
> if (version2) { then set the tcg ops for version 2; ...} etc,
> 
> we could define the right tcg op variants corresponding to the cpu variants, so that everything can be matched automatically.
> 
> But I think we'd need to pass explicitly the cpu type in accel_init_cpu_interfaces for this to work..
> we could still in the future call accel_init_cpu_interfaces multiple times, once for each cpu model we want to use.
> 
> Or, we could do something else: we could delay the accel cpu interface initialization and call it in cpu_create(const char *typename),
> where typename needs to be known for sure.
> 
> This last option seems kinda attractive, but any ideas?



