Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B11992D746D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 12:02:40 +0100 (CET)
Received: from localhost ([::1]:59372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kngC7-00041u-FJ
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 06:02:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kngA4-0003G1-13
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 06:00:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kngA1-0003B7-JV
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 06:00:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607684428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kfcc+7jPAmLnRdRy7paxNbRzFFJsPRiccOSv+RJmcuM=;
 b=BkQspX61MOmGBFJjtOCRsUqPmUBXecbuGtMB+f2aDdSQgS4eE50y4MMUhmOZE7au7oZAir
 HPK9mTsfdP5W3EJ07e8zmMjecBG8fl571dvmJDyAXB4fjsxqFt6EC7Lhjyjl8yQXdZnBSM
 5HZyxSoFaUOafekPpL6fa5lOR6p8uHs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-AaUzOIC0NtW2fali3lInrg-1; Fri, 11 Dec 2020 06:00:24 -0500
X-MC-Unique: AaUzOIC0NtW2fali3lInrg-1
Received: by mail-ej1-f70.google.com with SMTP id dv25so2634366ejb.15
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 03:00:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kfcc+7jPAmLnRdRy7paxNbRzFFJsPRiccOSv+RJmcuM=;
 b=KTl9UeniWC2izXzlusrXJ4vspp/B0e8F6lBMB0HACS7aJaKlYhZ9GUR/RMVsMUTqjA
 0stbdSmDGhxZGWowSiCvPOGeMh+uPtnGMVCAF+fsx1QK/dq7pWqNJvws8s1/lQdubvWc
 CaOPXvgfdN+w/pQlqWQBiqRPd9dFTanNpLjoxBoedjU6kadT1c5hcsY7EkzZybZXSyXf
 0A6wPpOzMM0V30THKPkZKIdN7XVN22EPnjZQxVn6/nj3CYD/kv2OIrhqdJ8GHs84JdAj
 fdDowoUl0aXDzrbdpwmL43Oxbbbu9MTxmfB0Ee1oGClk1fr6TpHnhzy3XtnsNSbpp5JN
 qalw==
X-Gm-Message-State: AOAM532xq5SKpto8j34+t+PGBvapQPmnAs9mXBz4HCoWbeyRhZE3nP8p
 Veg1bQuVqtwphDn5BzQLNVR/BSHpywUI/NVXYG+h+5/TFCBI+l1mHW8044IzNHzxWFD+KkeEz4/
 BYUWbeYX246VwA4M=
X-Received: by 2002:a17:906:12d3:: with SMTP id
 l19mr10230304ejb.65.1607684423534; 
 Fri, 11 Dec 2020 03:00:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjyKZSkYopSjWh+ygzHtLFhYyaFjV86IyPM+8TDoKaQKMqRJNuH2jZfPrVaS+TXKBbpr1low==
X-Received: by 2002:a17:906:12d3:: with SMTP id
 l19mr10230270ejb.65.1607684423347; 
 Fri, 11 Dec 2020 03:00:23 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id eb14sm7186210edb.20.2020.12.11.03.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 03:00:22 -0800 (PST)
Subject: Re: [PATCH v11 24/25] cpu: move cc->transaction_failed to tcg_ops
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-25-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0fb7bc9b-cfa7-11e7-9201-039e96ab5c62@redhat.com>
Date: Fri, 11 Dec 2020 12:00:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201211083143.14350-25-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 9:31 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/hw/core/cpu.h         | 18 +++++++-----------
>  include/hw/core/tcg-cpu-ops.h | 14 ++++++++++++++
>  hw/mips/jazz.c                |  9 +++++++--
>  target/alpha/cpu.c            |  2 +-
>  target/arm/cpu.c              |  4 ++--
>  target/m68k/cpu.c             |  2 +-
>  target/microblaze/cpu.c       |  2 +-
>  target/mips/cpu.c             |  4 +++-
>  target/riscv/cpu.c            |  2 +-
>  target/riscv/cpu_helper.c     |  2 +-
>  target/sparc/cpu.c            |  2 +-
>  target/xtensa/cpu.c           |  2 +-
>  target/xtensa/helper.c        |  4 ++--
>  13 files changed, 42 insertions(+), 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


