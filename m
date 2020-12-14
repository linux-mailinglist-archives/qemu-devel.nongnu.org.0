Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67F72DA2E5
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 22:57:47 +0100 (CET)
Received: from localhost ([::1]:52646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kovqk-0002ni-Gq
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 16:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kovpR-0002Mt-Nw
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 16:56:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kovpP-0002IT-4e
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 16:56:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607982981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9gRImqAQ04hncy2et43zm/WnhukTmIgJX85pSlwfSPQ=;
 b=UshykKJzarTket+KW92V/6VYSXKUi0CPgd/+bmK9aNOaZyta6MSsN6HDTawsramS+/rm9k
 9xV/7bEZil8P14cZAF6AazuHyFTOcgLJCZGsGZndRG0HmwOr5lioAeANsJI+nu6dbbMKdH
 ZWPskoC88SWk/iqPAFKGSIpbJ8aFRss=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-ILpKw3gQPTyX_ryNYUkUVA-1; Mon, 14 Dec 2020 16:56:18 -0500
X-MC-Unique: ILpKw3gQPTyX_ryNYUkUVA-1
Received: by mail-wm1-f70.google.com with SMTP id k128so7347322wme.7
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 13:56:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9gRImqAQ04hncy2et43zm/WnhukTmIgJX85pSlwfSPQ=;
 b=BtZp5+B+ZR3KxaJ3Xoj3v/PlMN8oo7QBw7AzhLBqi2rkKb3MSdxmoAqr397Vzojqmm
 nMLuosxawTolFbJm7myANETTJnXRXJLFXEV/oN09id6TDspMvKH387T0bRbPJUVGCD4n
 4+OuGfYi/ZofNRqzSxhIxjgGJZK5uG52BmAssqHuMdep28/hjlAthc1nswnTZdlA3MUv
 JpzZkHAwkLx5SPhM8HXRkniIaFQmJxtS2IkiPN5O9kk9EXHs3carWmz9hzcYRcczF3jR
 8oLOf6mJbyGKsSAchdPWZXRQdxtpjJbDp91HqGIJBXOpfV/2gtugUBrXHXwN/tJk3n0T
 GXqw==
X-Gm-Message-State: AOAM531F8QWdO9zkavmNPifbAqM8NyyKuLkCroIBww6iIiK7thrnVqMy
 e6eiSPV6+WpVlEBiAX2gzJjSREU+7byWZaK712Z/ZQR73595H8CF2mbRTufpD1v07gPkWr4q7BS
 cGnBhh2mQBB5euxY=
X-Received: by 2002:adf:c14d:: with SMTP id w13mr20140691wre.383.1607982976829; 
 Mon, 14 Dec 2020 13:56:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywI8jmP9JpYZ87ZkglIXcJRMOeCOYw6P+sqDBrzAjUlfwACI/BZ72SrBmxBwoP9iJho/qpBw==
X-Received: by 2002:adf:c14d:: with SMTP id w13mr20140658wre.383.1607982976626; 
 Mon, 14 Dec 2020 13:56:16 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id w21sm15807536wmi.45.2020.12.14.13.56.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 13:56:15 -0800 (PST)
Subject: Re: [PATCH v12 16/23] cpu: Move synchronize_from_tb() to tcg_ops
To: Eduardo Habkost <ehabkost@redhat.com>, Claudio Fontana <cfontana@suse.de>
References: <20201212155530.23098-1-cfontana@suse.de>
 <20201212155530.23098-17-cfontana@suse.de>
 <20201214191029.GO1289986@habkost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e72e2d6b-ef99-5590-fe18-9cb6d4092e23@redhat.com>
Date: Mon, 14 Dec 2020 22:56:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201214191029.GO1289986@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Claudio, Eduardo.

On 12/14/20 8:10 PM, Eduardo Habkost wrote:
> On Sat, Dec 12, 2020 at 04:55:23PM +0100, Claudio Fontana wrote:
>> From: Eduardo Habkost <ehabkost@redhat.com>
>>
>> since tcg_cpu_ops.h is only included in cpu.h,
>> and as a standalone header it is not really useful,
>> as tcg_cpu_ops.h starts requiring cpu.h defines,
>> enums, etc, as well as (later on in the series),
>> additional definitions coming from memattr.h.
>>
>> Therefore rename it to tcg_cpu_ops.h.inc, to warn
>> any potential user that this file is not a standalone
>> header, but rather a partition of cpu.h that is
>> included conditionally if CONFIG_TCG is true.
> 
> What's the benefit of moving definitions to a separate file, if
> the new file is not a standalone header?

Claudio, I haven't been following every respin. If you did that
change just to please me then the circular dependency remarked by
Richard, then if it simplify the series I'm OK if you have to
remove the includes.

Eduardo, if you are happy with patches 1-8 (x86 specific), maybe
you can queue them already. The rest is more TCG generic and
will likely go via Richard/Paolo trees IMO.

> 
> If moving the definitions to a separate header is going to
> require too much work, it's completely OK to keep them in cpu.h
> by now, and try to move them later.
> 
> I'm worried that the scope of this series is growing too much,
> and discussion/review of additional changes in each new version
> is preventing us from merging the original changes where we
> already had some consensus.


