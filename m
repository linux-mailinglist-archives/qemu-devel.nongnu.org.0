Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EA73F31F8
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 19:06:16 +0200 (CEST)
Received: from localhost ([::1]:34702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH7yB-0000ui-Ah
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 13:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH7xN-00008A-I4
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 13:05:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH7xL-00037u-RR
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 13:05:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629479123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yXgZ/wlGWwybBObfzJvUBDX6SeeA+K5axdHeSJ4Agcg=;
 b=Cnf+QMTjNX7v8MRMGUERyNYTS4jFA5EXtV0DFAeWuPctK0MJy/iIEYX1y23v0MNk2V4NGa
 c7SnEceVEVg638KXsgfHJv/w71vohirrNQh2EE5M2vTVnKsHww1oLf63xL47g+g/Dg52OI
 M68H45KQwZqhxT4z1KbcGdoCqd3QSr8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-MuYaL7YIP3SKGU7MARoY1A-1; Fri, 20 Aug 2021 13:05:21 -0400
X-MC-Unique: MuYaL7YIP3SKGU7MARoY1A-1
Received: by mail-wm1-f70.google.com with SMTP id
 b196-20020a1c80cd0000b02902e677003785so5047896wmd.7
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 10:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yXgZ/wlGWwybBObfzJvUBDX6SeeA+K5axdHeSJ4Agcg=;
 b=Bs2FyL6s/fdQh7Cq+b6n3WT0wiUQHHMjW/BWRjsywEE53cjmOlx7h1e+rNKV0Gt5CV
 yrEHvSTYBCdggx3/ZYrziEz37abdkR6m6cmKfR6zH7vTqpBR81vU3yCv4MX4dDv7Aqm2
 wBsiqAFwKdhXqMpFQciQycoXwNx3UPjv8rLGeHG4YTln42W4IVr1cd3zvLxtKlHObPUK
 P6ZZ4rp80tl4VdcQZMlcc/RMXuNBHPR7I+AHDixnupVRbAK8O+kZt0iEWulRzsmKVSQU
 4XrIDB66zk8anO52vg6YEfDBlRkK4e7+Tbvyngl3y6Bru0PpyhZLYZ6dsJ8vbQoFrnE7
 Vqnw==
X-Gm-Message-State: AOAM531ls6l8zqWphy0meerWh9Sw2WN227Tbhu26aEDF64sfJgzjm2AR
 JiwZxV79EYmVmy/fEpxgMraQ9yOHgagPPrNF6epAtiGMldJuLnwxiJyvNnSELQXspatMN09P4vA
 ltz5b0eptjshNZkM=
X-Received: by 2002:a05:600c:1906:: with SMTP id
 j6mr4969802wmq.166.1629479120671; 
 Fri, 20 Aug 2021 10:05:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaSrmWn5OCNEzXhAoXSmTnWkdZmByHTeM5N5wgzJUPm+bsNWyjNWp78jd0/F5KTIS7VY3mew==
X-Received: by 2002:a05:600c:1906:: with SMTP id
 j6mr4969785wmq.166.1629479120534; 
 Fri, 20 Aug 2021 10:05:20 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id y3sm6597013wma.32.2021.08.20.10.05.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 10:05:20 -0700 (PDT)
Subject: Re: [PATCH] target/i386: Fix memory leak in sev_read_file_base64()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210820165650.2839-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a25a7814-af34-eecd-2672-bda706692c31@redhat.com>
Date: Fri, 20 Aug 2021 19:05:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820165650.2839-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.49, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Pan Nengyuan <pannengyuan@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/21 6:56 PM, Peter Maydell wrote:
> In sev_read_file_base64() we call g_file_get_contents(), which
> allocates memory for the file contents.  We then base64-decode the
> contents (which allocates another buffer for the decoded data), but
> forgot to free the memory for the original file data.
> 
> Use g_autofree to ensure that the file data is freed.
> 
> Fixes: Coverity CID 1459997
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Tested with 'make/make check' only...
> 
>  target/i386/sev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


