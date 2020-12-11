Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298702D747C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 12:08:47 +0100 (CET)
Received: from localhost ([::1]:40708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kngI2-0008CZ-6y
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 06:08:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kngH8-0007dU-1X
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 06:07:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kngH6-0005nM-HY
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 06:07:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607684867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R6nIbnCajfhtMltr6bR1pxeyXHMARs3WOzMxsyAoVcc=;
 b=DbC65nPf2KsQHd8OBc66GP0p6H6l5Foz76g6zY0U6IKYI6mqjZn4vSk2PSdJ7JetA63g58
 knwZmumOzvu9MOAikKHrN5EJo45kE0x0tiBSUreXqmqRvErMbhNlUbA5fxof8yYMRd7v02
 Ivtj1Pof2i9JOaZi26AGjDY5H/hwCps=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-ZstxosPBOZeKy2A4qbI1_A-1; Fri, 11 Dec 2020 06:07:44 -0500
X-MC-Unique: ZstxosPBOZeKy2A4qbI1_A-1
Received: by mail-ed1-f71.google.com with SMTP id dh21so3767345edb.6
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 03:07:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R6nIbnCajfhtMltr6bR1pxeyXHMARs3WOzMxsyAoVcc=;
 b=HHdBZgs8agCw3Bzfo86iIgBb0KTOmYWkK0YFSjZJC84QltvbDnyY0zRrIN7zvjPvme
 iY6U0aGPmd7LEYL6bDRuBRucxtohpm702EnGsn/MomXcRNJ5vfvHyIVF/LVOe64NDOVI
 OwbTxGn8UFNgPfuwEU2Y7g6amdOwmcgi1+FEnXgDCgAhhxPKzfkmzuZxNbjrPreSuGi8
 zu0KK/q0ZNjVmA3G4fdi9nrwwzTarJ4bmm2Ma+0mHeuPB21YmSGva0kvJ/Bsrq3+v+GI
 Y1VTRq3jmJYQZm3X3i6AKQ8pfHxreA0BfjzMSq5ERSeCpC7So3W33V6EQi77E+Io48KR
 mIaA==
X-Gm-Message-State: AOAM530cw/7JJcgFMzXRUAi+tRLmtmfpIoS+hc5GMJiKtiaM8fdQ5Lt4
 wECYkUU2wbt96MuHa3K4TmRQRfDrE++JLsJvQeirISs6ZLdcI3JAtiLPqeDW83YNLRHLWgmRg0m
 4Fn+XsuxpzD8k0k0=
X-Received: by 2002:a05:6402:312b:: with SMTP id
 dd11mr11507236edb.308.1607684863076; 
 Fri, 11 Dec 2020 03:07:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPx1OtB+jD2OAHTYb0Dp2vRx0oXzPua2wC94iBoaWZIXK7ocY+dwuVKJ+aO+XXwe9sSs5rVQ==
X-Received: by 2002:a05:6402:312b:: with SMTP id
 dd11mr11507199edb.308.1607684862860; 
 Fri, 11 Dec 2020 03:07:42 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id j2sm6555141eja.97.2020.12.11.03.07.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 03:07:42 -0800 (PST)
Subject: Re: [PATCH v11 00/25] i386 cleanup PART 1
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201211083143.14350-1-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <442b9e9a-cdff-dd75-7d03-ff83fed74fcc@redhat.com>
Date: Fri, 11 Dec 2020 12:07:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201211083143.14350-1-cfontana@suse.de>
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 9:31 AM, Claudio Fontana wrote:
> Hello, this is version 11 of the cleanup.
> 
> The series has been split into two separate parts,
> and this is PART 1.

One single patch misses review:

#10 "i386: move TCG cpu class initialization out of helper.c"

> 
> v10 -> v11: small tweaks for !CONFIG_USER_ONLY
> 
> * make transaction_failed and do_unaligned_access
>   consistently !CONFIG_USER_ONLY.
> 
> * hw/mips/jazz: wrap mips_jazz_do_transaction_failed in
>   CONFIG_TCG && !CONFIG_USER_ONLY
> 
> * arm: wrap arm_cpu_synchronize_from_tb in CONFIG_TCG
> * arm: wrap arm_v7m_exec_interrupt in CONFIG_TCG
> * mips: wrap mips_cpu_synchronize_from_tb in CONFIG_TCG
> * mips: do not make mips_cpu_do_interrupt !CONFIG_USER_ONLY
> * ppc: protect cpu_exec_enter/exit in CONFIG_TCG


